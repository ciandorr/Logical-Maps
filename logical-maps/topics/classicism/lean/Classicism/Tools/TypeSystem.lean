import Lean
import Classicism.Background.Order

/-!
# The term-level check: staying inside the relational type system

The gate in `Classicism/Check.lean` verifies two things, that a proof's axioms are
admissible and that Logical Equivalence is never applied to a hypothesis. Neither says
anything about the *type theory* the proof uses. A proof could quantify over `Type`,
recurse over `Nat`, or form a Lean type such as `e → e` that the paper's system `R` does
not admit, and still pass. This file supplies the missing check.

## What `R` is, inside Lean

`R` admits `e`, `t`, and `σ → τ` whenever `τ ≠ e`. So an `R`-type, as a Lean expression,
is `Classicism.e`, or `Prop`, or a *non-dependent* arrow whose domain is an `R`-type and
whose codomain is a relational `R`-type. Dependency is what rules out the rest of Lean's
type theory: `(x : σ) → τ x` is not an `R`-type however `σ` and `τ` behave.

A statement about types is written `∀ {σ : Type} [Ty σ] …`, so a type parameter is an
`R`-type exactly when the telescope guards it with a `Ty`, `Rel` or `Order` instance.
An unguarded `∀ {σ : Type}` is a genuine quantifier over Lean types and is rejected.

## Three categories of constant

The survey of what the library actually reaches came to 59 core constants, and they fall
into three groups, which is why a whitelist is the right instrument here.

* **Object language.** The logical inductives `And`, `Or`, `Iff`, `Eq`, `Exists`, `True`,
  `False`, with their constructors and recursors, plus `Not`, `Ne` and the derived
  eliminators. These *are* the logical constants of `L`, and their rules are the rules
  of `H`.
* **Leibniz's Law plumbing.** `Eq.mpr`, `Eq.ndrec`, `Eq.subst`, `congrArg`, `congrFun`
  and friends, which `rw`, `calc` and `▸` emit. All are `LL`.
* **Metalanguage.** `Trans` and `instTransEq` from `calc`, `PUnit` from the marker field
  of `Ty`, `outParam`, `id`. These are not object language at all; they are artefacts of
  how the formalisation is written, and they carry no logical content. They are listed
  separately so that the distinction stays visible rather than being smuggled into the
  object-language list.

Anything outside all three, `Nat.rec` above all, is rejected.
-/

open Lean Meta Elab Command

namespace Classicism.Check

/-- The logical constants of the paper's language `L`, as Lean inductives. -/
def objectInductives : List Name :=
  [``And, ``Or, ``Iff, ``Eq, ``Exists, ``True, ``False]

/-- Elaboration machinery that carries no object-language content. -/
def metaConstants : List Name :=
  [``Trans, ``Trans.mk, ``Trans.trans, ``instTransEq, ``outParam, ``id,
   ``PUnit, ``PUnit.unit, ``Unit, ``Unit.unit]

/-- Object-language definitions and the `Eq` plumbing that Leibniz's Law is spelled with. -/
def plumbingConstants : List Name :=
  [``Not, ``Ne, ``rfl, ``trivial, ``absurd,
   ``And.left, ``And.right, ``And.casesOn,
   ``Or.elim, ``Or.casesOn,
   ``Iff.mp, ``Iff.mpr, ``Iff.refl, ``Iff.rfl, ``Iff.symm, ``Iff.trans,
   ``Exists.casesOn, ``Exists.elim, ``False.elim,
   ``Eq.mp, ``Eq.mpr, ``Eq.ndrec, ``Eq.subst, ``Eq.symm, ``Eq.trans,
   ``congrArg, ``congrFun,
   -- the gated primitives themselves, and what `funext` is built from
   ``propext, ``funext, ``Quot, ``Quot.mk, ``Quot.lift, ``Quot.liftOn, ``Quot.sound,
   -- what `simp` leaves in a proof term: `eq_self` is `eq_true rfl`, `of_eq_true` closes
   -- a goal, `forall_congr` rewrites under `∀`, `congr` and `congrFun'` are Leibniz's Law.
   -- The gate checks the three that take a hypothesis (`Check.gatedRules`); the
   -- translator unfolds all of them (`Translate.coreUnfolded`).
   ``eq_true, ``eq_false, ``eq_self, ``of_eq_true, ``of_eq_false, ``forall_congr,
   ``congr, ``congrFun']

/-- Is `n` a `match` auxiliary? Those are allowed by name, because the walk descends
into the body and checks the recursor it is compiled to, so a `match` on a forbidden
inductive is caught there rather than here. -/
def isMatcherName (n : Name) : Bool :=
  n.components.any fun c => c.toString.startsWith "match_"

/-- Is `n` an artefact of elaboration rather than a declaration anyone wrote? Lean lifts
the proof fields of an instance into `_proof_N` declarations and compiles a `match` into a
`match_N` auxiliary, and it drops instance arguments those do not literally use, so their
*statements* can fall outside `R` even when every use of them is inside it. An
eliminator's `motive` binder is the clearest case: its type is a function into `Prop`
from a proposition, which is metalanguage and not a type of `R` at all.

Inside such a declaration the binder and object-type checks are therefore skipped, and
only the constant whitelist is enforced, which is what still catches a forbidden
recursor. This is the one place where the term check is weaker than the rest. -/
def isAuxiliary (n : Name) : Bool :=
  n.isInternal || isMatcherName n
    || n.components.any fun c => c.toString.startsWith "_proof"

/-- Is `n` a constant this layer may mention? -/
def allowedConstant (env : Environment) (n : Name) : Bool :=
  (`Classicism).isPrefixOf n
    || metaConstants.contains n
    || plumbingConstants.contains n
    || objectInductives.contains n
    -- constructors, recursors and `casesOn` of the logical inductives
    || objectInductives.any (fun i => i.isPrefixOf n)
    || isMatcherName n
    || (match env.find? n with
        | some (.recInfo v) => v.all.any (objectInductives.contains ·)
        | _ => false)

/-- State for the type-system walk: the type parameters the telescope has guarded, and
the constants already seen. -/
structure TState where
  guarded : Std.HashSet FVarId := {}
  visited : NameSet := {}
  errors : Array (Name × MessageData) := #[]
  /-- Are we still in the leading telescope of the declaration being walked, where a
  binder over a type is a *parameter*? Anywhere else it is a quantifier over types inside
  a formula, which no formula of `R` has. -/
  leading : Bool := true
  /-- Which binders make up that telescope: `∀`s at the root of a type, `fun`s at the root
  of a value. -/
  leadingIsLam : Bool := false

abbrev T := StateRefT TState MetaM

def terror (decl : Name) (msg : MessageData) : T Unit :=
  modify fun s => { s with errors := s.errors.push (decl, msg) }

/-- `Prop`, the paper's `t`. -/
def isPropSort (e : Expr) : Bool := e matches .sort .zero

/-- Is `e` a `Ty`, `Rel` or `Order` instance on a type, and on which type? -/
def guardTarget (e : Expr) : Option Expr :=
  let f := e.getAppFn
  let args := e.getAppArgs
  if (f.isConstOf ``Classicism.Ty || f.isConstOf ``Classicism.RelTy
      || f.isConstOf ``Classicism.Rel || f.isConstOf ``Classicism.Order
      || f.isConstOf `Classicism.Pointwise
      || f.isConstOf `Classicism.Strict.BA || f.isConstOf `Classicism.Strict.SRel
      || f.isConstOf `Classicism.Strict.SOrder || f.isConstOf `Classicism.Strict.SPointwise)
      && args.size ≥ 1 then
    some args[0]!
  else none

/-- Is `e` an `R`-type? Guarded type parameters count. -/
partial def isRType (e : Expr) : T Bool := do
  let e ← instantiateMVars e
  let e ← whnf e
  if e.isConstOf ``Classicism.e then return true
  if isPropSort e then return true
  if let .fvar fid := e then return (← get).guarded.contains fid
  match e with
  | .forallE _ d b _ =>
    -- Only non-dependent arrows are types of `R`.
    if b.hasLooseBVars then return false
    if !(← isRType d) then return false
    -- The codomain must be relational, that is an `R`-type other than `e`.
    if b.isConstOf ``Classicism.e then return false
    isRType b
  | _ => return false

/-- Types that are metalanguage rather than object language: the type-system classes
themselves, and `Unit`/`PUnit` from the marker field. -/
partial def isMetaType (e : Expr) : Bool :=
  -- An instance's own type is a telescope ending in a class, so look through binders.
  match e with
  | .forallE _ _ b _ => isMetaType b
  | _ =>
  let f := e.getAppFn
  f.isConstOf ``Classicism.Ty || f.isConstOf ``Classicism.RelTy
    || f.isConstOf ``Classicism.Rel || f.isConstOf ``Classicism.Order
    || f.isConstOf `Classicism.Pointwise
    -- the strict layer's Boolean-algebra class, whose instances are `Prop` and `σ → τ`
    || f.isConstOf `Classicism.Strict.BA
    -- the strict mirrors of `Rel`, `Order` and `Pointwise`
    || f.isConstOf `Classicism.Strict.SRel || f.isConstOf `Classicism.Strict.SOrder
    || f.isConstOf `Classicism.Strict.SPointwise
    || f.isConstOf ``Unit || f.isConstOf ``PUnit
    || f.isConstOf ``Trans

/-- Is `e` a type *of objects*, that is, does its own type live at a nonzero universe?
Propositions come out `false`, since a proposition is an object-language formula, a term
of type `t`, not a type. `Prop`, `e`, `e → Prop`, `Nat` and `Type` all come out `true`. -/
def isObjectTypeExpr (e : Expr) : T Bool := do
  try
    let t ← whnf (← inferType e)
    match t with
    | .sort l => return !l.isZero
    | _ => return false
  catch _ => return false

/-- Check one binder. A binder is admissible when its type is a proposition (it binds a
proof), an `R`-type (it binds an object of the language), a sort (it binds a type
variable, whose guard is checked separately), or metalanguage. -/
def checkBinder (decl : Name) (nm : Name) (ty : Expr) : T Unit := do
  if ← isProp ty then return
  if ty.isSort then return
  if ← isRType ty then return
  if isMetaType ty then return
  terror decl m!"{decl}: the binder `{nm} : {ty}` is neither a proof, an object of an \
R-type, nor type-system evidence"

/-- Walk a declaration's own term.

Two rules make this tractable. A whitelisted core constant is an accepted rule of `H`, or
metalanguage, so the walk does **not** descend into its generic, universe-polymorphic
definition; what matters is that it is *applied at* `R`-types, which the type check below
catches. Constants of this library are descended into, so a lemma of the library cannot
hide anything. -/
partial def tvisit (decl : Name) (e : Expr) : T Unit := do
  if ← isObjectTypeExpr e then
    -- `e` is a type. It must be a type of `R`, a sort, or metalanguage.
    if e.isSort then return
    if ← isRType e then return
    if isMetaType e then
      -- descend into the arguments so that, say, `Order (Nat → Prop)` is still caught
      for a in e.getAppArgs do tvisit decl a
      return
    if isAuxiliary decl then
      for a in e.getAppArgs do tvisit decl a
      return
    terror decl m!"{decl}: the type `{e}` is not a type of the relational system R"
    return
  match e with
  | .app f a => inner (tvisit decl f); inner (tvisit decl a)
  | .lam nm t b bi => tbinder decl nm t b bi true
  | .forallE nm t b bi => tbinder decl nm t b bi false
  | .letE nm t v b _ =>
    checkBinder decl nm t
    inner (tvisit decl t); inner (tvisit decl v)
    withLetDecl nm t v fun x => inner (tvisit decl (b.instantiate1 x))
  | .mdata _ b => tvisit decl b
  | .proj _ _ b => inner (tvisit decl b)
  | .const c _ => tvisitConst c
  | _ => pure ()
where
  /-- Run a walk of a subterm that is not part of the leading telescope. -/
  inner (k : T Unit) : T Unit := do
    let saved := (← get).leading
    modify fun s => { s with leading := false }
    k
    modify fun s => { s with leading := saved }

  /-- One binder of a telescope. A `Ty`/`Rel`/`Order` binder registers its subject as a
  guarded type parameter **before** anything is walked, since the binder's own type
  mentions that parameter.

  A binder over a type, or over type-system evidence, is allowed only in the leading
  telescope: as a parameter of the declaration. Inside a formula it would be a quantifier
  over types, and no formula of `R` has one; a principle is a family of formulas indexed
  by types, never one formula quantifying over them. This is what keeps everything the
  shallow layer certifies within the reach of the strict layer. -/
  tbinder (decl : Name) (nm : Name) (t b : Expr) (bi : BinderInfo) (isLam : Bool) : T Unit := do
    if let some (.fvar fid) := guardTarget t then
      modify fun s => { s with guarded := s.guarded.insert fid }
    let typeBinder := (t.isSort && !isPropSort t) || (guardTarget t).isSome
    let st ← get
    if typeBinder then
      if !(st.leading && st.leadingIsLam == isLam) && !isAuxiliary decl then
        terror decl m!"{decl}: the binder `{nm} : {t}` quantifies over types inside a formula. \
A type may only be a parameter of a declaration; a principle is a family of \
formulas indexed by types, not one formula quantifying over them"
    else
      modify fun s => { s with leading := false }
    if !isAuxiliary decl then checkBinder decl nm t
    inner (tvisit decl t)
    withLocalDecl nm bi t fun x => do
      -- Inside an internal auxiliary, a `Sort`-typed binder counts as guarded. Lean
      -- lifts the proof fields of an instance into separate `_proof_N` declarations and
      -- drops any instance argument they do not literally use, so an auxiliary can be
      -- *more general* than the declaration it came from: `instRelArrow._proof_1` loses
      -- its `[Ty σ]`. That generalisation is harmless, because the auxiliary is not a
      -- standalone claim and is only ever applied where the enclosing declaration
      -- guarded the variable. The body is still walked, so a forbidden constant inside
      -- one is still caught.
      if isAuxiliary decl && t.isSort then
        if let .fvar fid := x then modify fun s => { s with guarded := s.guarded.insert fid }
      tvisit decl (b.instantiate1 x)

  tvisitConst (c : Name) : T Unit := do
    if (← get).visited.contains c then return
    modify fun s => { s with visited := s.visited.insert c }
    let env ← getEnv
    if !allowedConstant env c then
      terror decl m!"{decl}: uses the constant `{c}`, which is not part of Classicism's \
language, its logic, or the formalisation's own metalanguage"
      return
    -- Descend only into this library's own definitions; a whitelisted core constant is
    -- an accepted primitive, not something to audit the innards of.
    if !(`Classicism).isPrefixOf c then return
    -- Report against `c`, so a finding names the declaration it is really in. Its value
    -- has its own leading telescope, of `fun`s.
    let saved := (← get)
    modify fun s => { s with leading := true, leadingIsLam := true }
    match env.find? c with
    | some (.thmInfo v) => tvisit c v.value
    | some (.defnInfo v) => tvisit c v.value
    | some (.opaqueInfo v) => tvisit c v.value
    | _ => pure ()
    modify fun s => { s with leading := saved.leading, leadingIsLam := saved.leadingIsLam }

/-- Every type bound in a declaration's *statement* must be guarded by a `Ty`,
`Rel` or `Order` instance. An unguarded one is a quantifier over Lean types. -/
def checkTypeBindersGuarded (decl : Name) (stmt : Expr) : T Unit := do
  let rec go (e : Expr) (pending : List (Name × Nat)) (depth : Nat) : T Unit := do
    match e with
    | .forallE nm t b _ =>
      -- record a new type parameter, or discharge a pending one
      let pending :=
        if t.isSort && !isPropSort t then (nm, depth) :: pending
        else match guardTarget t with
          | some (.bvar i) => pending.filter (fun (_, d) => d != depth - 1 - i)
          | _ => pending
      go b pending (depth + 1)
    | _ =>
      for (nm, _) in pending do
        terror decl m!"{decl}: the type parameter `{nm}` is not guarded by a `Ty`, `Rel` or \
`Order` instance, so the statement quantifies over Lean types rather than over the types of R"
  go stmt [] 0

/-- Run the type-system check on several declarations in one walk. A library constant is
descended into once, however many of the declarations use it, and its findings are
reported under its own name. -/
def checkTypeSystemMany (names : Array Name) : MetaM (Array (Name × Array MessageData)) := do
  let env ← getEnv
  let (_, s) ← (do
    for n in names do
      match env.find? n with
      | some info =>
        checkTypeBindersGuarded n info.type
        modify fun st : TState => { st with leading := true, leadingIsLam := false }
        tvisit n info.type
        modify fun st : TState => { st with leading := true, leadingIsLam := true }
        match info with
        | .thmInfo v => tvisit n v.value
        | .defnInfo v => tvisit n v.value
        | _ => pure ()
      | none => terror n m!"{n}: not found").run {}
  return names.map fun n => (n, (s.errors.filter (·.1 == n)).map (·.2))

/-- Run the type-system check on one declaration. -/
def checkTypeSystem (n : Name) : MetaM (Array MessageData) := do
  return ((← checkTypeSystemMany #[n])[0]!).2

/-- `#classicism_types foo` checks that `foo` stays inside the relational type system. -/
syntax (name := classicismTypes) "#classicism_types " ident+ : command

@[command_elab classicismTypes] def elabClassicismTypes : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let errors ← liftTermElabM (checkTypeSystem n)
    if errors.isEmpty then logInfo m!"{n}: type system ✓"
    else for e in errors do logError e

/-- `#classicism_types_audit Mod₁ …` runs the type-system check over every theorem
declared in the named modules. -/
syntax (name := classicismTypesAudit) "#classicism_types_audit " ident+ : command

@[command_elab classicismTypesAudit] def elabClassicismTypesAudit : CommandElab := fun stx => do
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
    -- one walk for the whole module, so the heartbeat budget of a single command is not
    -- the right measure of it
    let results ← withScope (fun sc => { sc with opts := maxHeartbeats.set sc.opts 0 })
      (liftTermElabM (checkTypeSystemMany names))
    for (_, errors) in results do
      if errors.isEmpty then ok := ok + 1
      else for e in errors do logError e
    if ok = names.size then
      logInfo m!"#classicism_types_audit {modName}: {ok}/{names.size} inside R"
    else
      logError m!"#classicism_types_audit {modName}: {ok}/{names.size} inside R"

/-- `#classicism_types_expect_rejection foo` succeeds only when the type-system check
rejects `foo`. -/
syntax (name := classicismTypesExpectRejection)
  "#classicism_types_expect_rejection " ident+ : command

@[command_elab classicismTypesExpectRejection]
def elabTypesExpectRejection : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let errors ← liftTermElabM (checkTypeSystem n)
    if errors.isEmpty then
      logError m!"{n}: expected the type-system check to reject this, but it passed"
    else
      logInfo m!"{n}: outside R, as expected — {errors[0]!}"

end Classicism.Check
