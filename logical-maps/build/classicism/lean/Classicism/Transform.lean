import Classicism.Quantifier
import Classicism.Check

/-!
# Stage four: the transformer

`#classicism_transform foo` takes a theorem proved under the **gate**, where `propext` and
`funext` appear in the ζ-Equivalence shape, and produces a second theorem of the same type
proved under the **strict policy**, from the eleven closed identities. It then reports the
new theorem's axioms, which is the cleanest demonstration available that the shallow theory
really is Classicism: the report names the eleven identities, `e`, `e_exists` and `em`, and
nothing else.

## What it does, and the one thing it does not do

Appendix A's `hardlemma` is an induction over `H`-derivations: it reads a derivation of
`P ↔ Q` and builds the identity `P = Q`. A transformer could work that way, interpreting
the Lean proof term of the gated argument as a derivation. **This one does not, and does not
need to.** Since its output is checked by the kernel, it is enough to *re-prove* each
identity strictly, by whatever means. So the gated argument `h` is discarded and the
identity it produced is handed to the decision procedures of stages two and three. What
Appendix A supplies is the guarantee that this always can succeed; what the transformer
supplies is the certificate in each case.

## How

Three passes over the proof term.

1. **Rewrite and discharge together.** At every gated occurrence `propext h` of type
   `P = Q`, the argument `h` is thrown away and `P = Q` is reproved on the spot: first by
   citing one of the eleven axioms if the obligation simply *is* one, then by
   `Classicism.Strict.proveEq`, the core of `boolean_eq`, in the local context where the
   obligation arose. Proving immediately rather than leaving a hole matters: an obligation
   raised inside binders needs a proof mentioning those variables, and a hole filled after
   the walk had abstracted them would dangle.
2. **Redirect.** Every constant of this library is replaced by its own transform,
   recursively, with a memo table. A constant that is already strict is left alone, and one
   whose own obligations could not be met is left gated, which makes the caller fail too
   rather than silently keeping a gated dependency.
3. **Declare.** The term is added to the environment as `foo_strict`, so the kernel checks
   it, and its axioms are reported. A bug anywhere above yields a rejected declaration,
   never a false theorem.

## What transforms today

Everything whose gated obligations are identities *between propositions*: the whole of
`Classicism/Booleanism.lean`, and so a good deal that rests on it. What does not is an
obligation between *functions*, which is what `funext (fun v̄ => propext h)` produces. That
needs the λ-level counterpart of `boolean_eq`, doing its steps as
`congrArg (fun G => …G…) closedIdentity` in the manner of `Quantifier.lam_iff_self_top`
rather than pointwise. The transformer says so rather than guessing, and that tactic is the
next piece of work.
-/

open Lean Meta Elab Command

namespace Classicism.Check

/-- Is this declaration already strict, so that it needs no transform? -/
def alreadyStrict (n : Name) : MetaM Bool := do
  return (← collectAxioms n).all strictAllowedAxiom

/-- The name the transform of `n` is given. -/
def strictName (n : Name) : Name := n ++ `strict

/-- Why an obligation could not be settled. The three causes are quite different and it
would be misleading to report them together. -/
inductive Reason
  /-- The obligation is an identity between *functions*. Settling it needs the λ-level
  counterpart of `boolean_eq`, doing its steps as `congrArg` over closed identities in the
  manner of `Quantifier.lam_iff_self_top`. This is work not yet done. -/
  | functionLevel
  /-- The obligation mentions `True`, `False`, Lean's `→` or Lean's `Iff`. No axiom mentions
  any of them, so the identity is not merely unproved but **unreachable**: the strict layer
  cannot express it. The paper's `⊤`, `⊥`, `imp` and `iff` are what belong here instead.
  This is not a gap in the transformer. -/
  | vocabulary
  /-- Anything else. -/
  | other
deriving BEq, Inhabited

/-- An obligation the decision procedures could not settle. -/
structure Unmet where
  decl : Name
  goal : Expr
  reason : Reason

/-- Does the expression mention anything outside the axioms' vocabulary? -/
partial def outsideVocabulary (e : Expr) : Bool :=
  match e with
  -- `Box` and `Dia` are abbreviations for identities with `True` and `False`, so an
  -- obligation mentioning either is outside the vocabulary just as much.
  | .const c _ =>
    c == ``True || c == ``False || c == ``Iff
      || c == ``Classicism.Box || c == ``Classicism.Dia
  | .app f a => outsideVocabulary f || outsideVocabulary a
  | .forallE _ d b _ => !b.hasLooseBVars || outsideVocabulary d || outsideVocabulary b
  | .lam _ d b _ => outsideVocabulary d || outsideVocabulary b
  | .mdata _ b => outsideVocabulary b
  | .proj _ _ b => outsideVocabulary b
  | .letE _ t v b _ => outsideVocabulary t || outsideVocabulary v || outsideVocabulary b
  | _ => false

/-- Classify an unmet obligation `p = q`. -/
def classify (p : Expr) : MetaM Reason := do
  let some (ty, l, r) := p.eq? | return .other
  if !(← whnf ty).isProp then return .functionLevel
  if outsideVocabulary l || outsideVocabulary r then return .vocabulary
  return .other

structure TrState where
  table : NameMap Name := {}
  unmet : Array Unmet := #[]

abbrev TrM := StateRefT TrState MetaM

/-- Rewrite a *statement* into the paper's vocabulary: `True ↦ ⊤`, `False ↦ ⊥`,
`Iff ↦ iff`, and a non-dependent arrow between propositions `↦ imp`.

An arrow is translated only when both sides really are propositions, so a predicate type
such as `σ → Prop` is left alone. Nothing here touches proofs; see `translateAndProve`. -/
partial def translate (e : Expr) : MetaM Expr := do
  match e with
  | .const c _ =>
    if c == ``True then return mkConst ``Classicism.Strict.Top
    if c == ``False then return mkConst ``Classicism.Strict.Bot
    -- `Box` and `Dia` are defined with `True` and `False`, so they translate too.
    if c == ``Classicism.Box then return mkConst ``Classicism.Strict.Box
    if c == ``Classicism.Dia then return mkConst ``Classicism.Strict.Dia
    return e
  | .app .. =>
    match e.getAppFnArgs with
    | (``Iff, #[a, b]) =>
      return mkApp2 (mkConst ``Classicism.iff) (← translate a) (← translate b)
    | _ =>
      let f ← translate e.getAppFn
      let args ← e.getAppArgs.mapM translate
      return mkAppN f args
  | .forallE nm d b bi =>
    if !b.hasLooseBVars && (← isProp d) && (← isProp b) then
      -- an implication between propositions: the paper's `imp`
      return mkApp2 (mkConst ``Classicism.imp) (← translate d) (← translate b)
    let d' ← translate d
    withLocalDecl nm bi d' fun x => do
      mkForallFVars #[x] (← translate (b.instantiate1 x))
  | .lam nm d b bi =>
    let d' ← translate d
    withLocalDecl nm bi d' fun x => do
      mkLambdaFVars #[x] (← translate (b.instantiate1 x))
  | .mdata m b => return .mdata m (← translate b)
  | _ => return e

/-- Can the obligation be met by citing the eleven axioms or an already-strict lemma,
possibly *applied to arguments*?

Two cases, and the second is the useful one. `Classicism/Identities.lean` proves each of
the eleven by a single gated use of Equivalence, so transforming those proofs should hand
back the axioms they duplicate, and does. But the pointwise forms are just as common:
`or_forall_absorb_eq X y : (Xy ∨ ∀x.Xx) = Xy` is Absorption-∨∀ with two arguments fed in.
So the search also tries applying each axiom to up to four arguments, building the matching
`congrFun` chain, which is Leibniz's Law and admissible under the strict policy.

Type and instance arguments of the axiom are recovered by unification and instance
synthesis; the resulting term's type is re-checked against the obligation afterwards, so a
mistake here cannot produce a wrong proof. -/
def tryAxiom (goal : Expr) : TrM (Option Expr) := do
  let some (_, gl, gr) := goal.eq? | return none
  let env ← getEnv
  -- The eleven axioms, and also every theorem already proved strictly. Citing the strict
  -- library is what lets an obligation such as `(x = x) = ⊤` be met by `Quantifier.ref_top`
  -- instead of being handed to a propositional decision procedure that cannot see it.
  let axioms := env.constants.fold (init := #[]) fun acc n info =>
    if (`Classicism.Axiomatic).isPrefixOf n && info matches .axiomInfo _ then acc.push n
    else acc
  let lemmas := env.constants.fold (init := #[]) fun acc n info =>
    if (`Classicism.Strict).isPrefixOf n && !n.isInternal && info matches .thmInfo _
    then acc.push n else acc
  let names := axioms ++ lemmas.qsort Name.lt
  for n in names do
    let some info := env.find? n | continue
    let attempt ← withNewMCtxDepth do
      -- only cite something that is itself strict
      if !(`Classicism.Axiomatic).isPrefixOf n then
        unless ← alreadyStrict n do return none
      let (axArgs, binders, concl) ← forallMetaTelescope info.type
      let some (_, al₀, ar₀) := concl.eq? | return none
      let mut curL := al₀
      let mut curR := ar₀
      let mut applied : Array Expr := #[]
      let mut found : Option (Array Expr) := none
      for _ in [0:5] do
        if (← isDefEq curL gl) && (← isDefEq curR gr) then
          found := some applied
          break
        let ty ← whnf (← inferType curL)
        match ty with
        | .forallE _ d _ _ =>
          let m ← mkFreshExprMVar d
          curL := mkApp curL m
          curR := mkApp curR m
          applied := applied.push m
        | _ => break
      let some appliedArgs := found | return none
      -- close the axiom's own type and instance arguments
      for (m, bi) in axArgs.zip binders do
        if !(← m.mvarId!.isAssigned) then
          if bi.isInstImplicit then
            let ty ← inferType m
            let inst? ← (do try return some (← synthInstance ty) catch _ => return none)
            let some inst := inst? | return none
            unless ← isDefEq m inst do return none
          else return none
      for m in appliedArgs do
        if !(← m.mvarId!.isAssigned) then return none
      -- the axiom, then one `congrFun` per argument fed in
      let mut prf := mkAppN (mkConst n) (← axArgs.mapM instantiateMVars)
      for m in appliedArgs do
        prf ← mkCongrFun prf (← instantiateMVars m)
      return some (← instantiateMVars prf)
    if let some prf := attempt then
      if ← isDefEq (← inferType prf) goal then return some prf
  return none

/-- Try to prove `p = q` strictly, here and now, with the stage-two decision procedure.

Discharging on the spot rather than leaving a metavariable matters: an obligation raised
inside binders would have to be closed by a term mentioning those variables, and once the
walk abstracts them the assignment would dangle. Proving immediately, in the context where
the obligation arose, sidesteps that entirely. -/
def tryProve (p q : Expr) : TrM (Option Expr) := do
  try
    let p := Classicism.Strict.expandDefs p
    let q := Classicism.Strict.expandDefs q
    let atoms := (Classicism.Strict.atomsOf q (Classicism.Strict.atomsOf p #[])).toList
    return some (← Classicism.Strict.proveEq atoms [] p q)
  catch _ => return none

mutual

/-- Rewrite one proof term: gated occurrences become metavariables, and constants of this
library become their transforms. -/
partial def rewriteTerm (owner : Name) (e : Expr) : TrM Expr := do
  match e with
  | .app .. =>
    let f := e.getAppFn
    let args := e.getAppArgs
    if f.isConstOf ``propext && args.size ≥ 3 then
      -- `propext p q h : p = q`. Discard `h` and reprove the identity strictly.
      let p ← rewriteTerm owner args[0]!
      let q ← rewriteTerm owner args[1]!
      let goal ← mkEq p q
      if let some prf ← tryAxiom goal then return prf
      match ← tryProve p q with
      | some prf => return prf
      | none =>
        let reason ← classify goal
        modify fun s => { s with unmet := s.unmet.push ⟨owner, goal, reason⟩ }
        return e
    if f.isConstOf ``funext && args.size ≥ 5 then
      -- `funext f g h : f = g`. The obligation is between *functions*, which the
      -- pointwise decision procedure cannot settle; see this file's header.
      let fn ← rewriteTerm owner args[2]!
      let gn ← rewriteTerm owner args[3]!
      let goal ← mkEq fn gn
      if let some prf ← tryAxiom goal then return prf
      match ← tryProve fn gn with
      | some prf => return prf
      | none =>
        let reason ← classify goal
        modify fun s => { s with unmet := s.unmet.push ⟨owner, goal, reason⟩ }
        return e
    let f' ← rewriteTerm owner f
    let args' ← args.mapM (rewriteTerm owner)
    return mkAppN f' args'
  | .lam nm t b bi =>
    let t' ← rewriteTerm owner t
    withLocalDecl nm bi t' fun x => do
      let b' ← rewriteTerm owner (b.instantiate1 x)
      mkLambdaFVars #[x] b'
  | .forallE nm t b bi =>
    let t' ← rewriteTerm owner t
    withLocalDecl nm bi t' fun x => do
      let b' ← rewriteTerm owner (b.instantiate1 x)
      mkForallFVars #[x] b'
  | .letE nm t v b _ =>
    let t' ← rewriteTerm owner t
    let v' ← rewriteTerm owner v
    withLetDecl nm t' v' fun x => do
      let b' ← rewriteTerm owner (b.instantiate1 x)
      mkLetFVars #[x] b'
  | .mdata d b => return .mdata d (← rewriteTerm owner b)
  | .proj s i b => return .proj s i (← rewriteTerm owner b)
  | .const c lvls =>
    let c' ← transformConst c
    return .const c' lvls
  | _ => return e

/-- Return the name to use in place of `c`: `c` itself when it is already strict or not
ours, otherwise its transform, declared on demand. -/
partial def transformConst (c : Name) : TrM Name := do
  if let some c' := (← get).table.find? c then return c'
  if !(`Classicism).isPrefixOf c then return c
  if (`Classicism.Axiomatic).isPrefixOf c then return c
  if ← alreadyStrict c then
    modify fun s => { s with table := s.table.insert c c }
    return c
  let env ← getEnv
  let some info := env.find? c | return c
  -- Guard against revisiting while in progress.
  modify fun s => { s with table := s.table.insert c (strictName c) }
  let value := match info with
    | .thmInfo v => some v.value
    | .defnInfo v => some v.value
    | _ => none
  let some val := value | return c
  let before := (← get).unmet.size
  let val' ← rewriteTerm c val
  if (← get).unmet.size != before then
    -- something in `c` could not be reproved strictly; keep the gated original
    modify fun s => { s with table := s.table.insert c c }
    return c
  let decl : Declaration :=
    match info with
    | .thmInfo v => .thmDecl { v with name := strictName c, value := val' }
    | _ => .defnDecl { (match info with | .defnInfo v => v | _ => unreachable!) with
                        name := strictName c, value := val' }
  unless env.contains (strictName c) do
    try addDecl decl
    catch ex =>
      logWarning m!"could not declare {strictName c}: {ex.toMessageData}"
      modify fun s => { s with table := s.table.insert c c }
      return c
  return strictName c

end

/-- `#classicism_transform foo …` transforms each named theorem and reports the result. -/
syntax (name := classicismTransform) "#classicism_transform " ident+ : command

@[command_elab classicismTransform] def elabTransform : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    if ← liftTermElabM (alreadyStrict n) then
      logInfo m!"{n}: already strict, nothing to transform"
      continue
    let target := strictName n
    let some info := (← getEnv).find? n
      | logError m!"{n}: not found"; continue
    let some val := (match info with
        | .thmInfo v => some v.value
        | .defnInfo v => some v.value
        | _ => none)
      | logError m!"{n}: has no value to transform"; continue
    let .thmInfo tv := info
      | logError m!"{n}: only theorems are transformed"; continue
    -- Rewrite, then discharge, then instantiate: in that order, because an obligation
    -- raised deep in the recursion is only closed after the whole walk is done.
    let result ← liftTermElabM do
      let (out, st) ← (rewriteTerm n val).run {}
      return (out, st)
    let (val', st) := result
    -- If the walk failed only because the statement is outside the axioms' vocabulary,
    -- try the statement *translated* into the paper's `⊤`, `⊥`, `imp`, `iff`. The proof is
    -- not translated; it is rebuilt from scratch by the decision procedures.
    if !st.unmet.isEmpty && st.unmet.all (fun u => u.reason == .vocabulary) then
      let attempt ← liftTermElabM do
        let ty' ← translate tv.type
        let (prf?, _) ← (do
          forallTelescope ty' fun xs concl => do
            let some (_, l, r) := concl.eq? | return none
            match ← tryProve l r with
            | some prf => return some (← mkLambdaFVars xs prf)
            | none => return none).run {}
        return (prf?, ty')
      let (prf?, ty') := attempt
      if prf?.isNone then
        logWarning m!"{n}: translated statement still not settled:  {ty'}"
      if let some prf := prf? then
        try
          liftCoreM <| addDecl (.thmDecl
            { tv with name := target, type := ty', value := prf })
          let ax ← liftTermElabM (collectAxioms target)
          let bad := ax.filter (fun a => !strictAllowedAxiom a)
          if bad.isEmpty then
            logInfo m!"{n} ⟶ {target}: strict ✓ after translating the statement into \
the paper's vocabulary (axioms: {ax.toList})"
            continue
        catch _ => pure ()
    if !st.unmet.isEmpty then
      for u in st.unmet do
        let why := match u.reason with
          | .functionLevel => "an identity between functions; needs the λ-level tactic"
          | .vocabulary => "mentions True, False, Lean's → or Lean's Iff, which no axiom \
mentions, so this identity is unreachable strictly rather than merely unproved"
          | .other => "not settled by the decision procedures"
        logWarning m!"{n}: could not discharge  {u.goal}  (raised in {u.decl}) — {why}"
      logError m!"{n}: {st.unmet.size} obligation(s) unmet; no strict theorem declared"
      continue
    if val'.hasExprMVar then
      logError m!"{n}: transformed term still has open holes"
      continue
    try
      liftCoreM <| addDecl (.thmDecl { tv with name := target, value := val' })
    catch ex =>
      logError m!"{n}: the kernel rejected the transformed proof — {ex.toMessageData}"
      continue
    let ax ← liftTermElabM (collectAxioms target)
    let bad := ax.filter (fun a => !strictAllowedAxiom a)
    if bad.isEmpty then
      logInfo m!"{n} ⟶ {target}: strict ✓ (axioms: {ax.toList})"
    else
      logError m!"{n} ⟶ {target}: still depends on {bad.toList}"

/-- `#classicism_transform_audit Mod₁ …` transforms every theorem declared in the named
modules and reports how many came out strict, without declaring anything. It is the
headline number for stage four. -/
syntax (name := classicismTransformAudit) "#classicism_transform_audit " ident+ : command

@[command_elab classicismTransformAudit] def elabTransformAudit : CommandElab := fun stx => do
  let env ← getEnv
  for modStx in stx[1].getArgs do
    let modName := modStx.getId
    let some (idx : Nat) := env.header.moduleNames.findIdx? (· == modName)
      | throwErrorAt modStx "unknown module {modName}"
    let names := env.constants.fold (init := #[]) fun acc n info =>
      if env.getModuleIdxFor? n == some idx && !n.isInternal && info matches .thmInfo _
      then acc.push n else acc
    let names := names.qsort Name.lt
    let mut ok : Nat := 0
    let mut already : Nat := 0
    let mut failed : Array Name := #[]
    let mut vocab : Nat := 0
    let mut viaTranslation : Nat := 0
    let mut lam : Nat := 0
    let mut other : Nat := 0
    for n in names do
      if ← liftTermElabM (alreadyStrict n) then
        already := already + 1
      else
        let some info := env.find? n | continue
        let .thmInfo tv := info | continue
        let st ← liftTermElabM do
          let (_, st) ← (rewriteTerm n tv.value).run {}
          return st
        if st.unmet.isEmpty then ok := ok + 1
        else if st.unmet.all (fun u => u.reason == .vocabulary) then
          -- retry with the statement translated into the paper's vocabulary
          let done ← liftTermElabM do
            let ty' ← translate tv.type
            let (prf?, _) ← (do
              forallTelescope ty' fun _ concl => do
                let some (_, l, r) := concl.eq? | return none
                return (← tryProve l r)).run {}
            return prf?.isSome
          if done then viaTranslation := viaTranslation + 1
          else vocab := vocab + 1
        else if st.unmet.any (fun u => u.reason == .functionLevel) then lam := lam + 1
        else other := other + 1
    logInfo m!"#classicism_transform_audit {modName}: {ok} direct, {viaTranslation} after \
translation, {already} already strict; {vocab} still open after translation, {lam} need \
the λ-level tactic, {other} other"

end Classicism.Check
