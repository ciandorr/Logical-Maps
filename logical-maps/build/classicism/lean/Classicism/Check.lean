import Lean
import Classicism.Core

/-!
# `#classicism_check`: the axiom check and the Equivalence gate

This is one of the two checks a Classicism proof must pass. It governs *which axioms and
rules* a proof uses. The companion check, in `Classicism/TypeSystem.lean`, governs the
*type theory* it uses, and neither implies the other: see **The other half** below.

`#classicism_check foo` walks the proof term of `foo` and of every constant it reaches,
and reports an error unless two conditions hold.

1. **Axioms.** The axioms `foo` depends on (as `#print axioms` computes them) lie in
   `allowedAxioms`: Lean's `propext` and `Quot.sound`, and the theory's `e`, `e_exists`
   and `em`. `Classical.choice`, `sorryAx` and the alternative axioms of
   `Classicism.Axiomatic` are all rejected.
2. **The Equivalence gate.** Every occurrence of `propext h` or `funext h` in any
   reached proof term has a *closed* argument: `h` mentions no local variable whose type
   is a proposition. A `have`-bound proof variable is looked through, to its value.
   This is the ζ-Equivalence discipline of `Classicism/Equivalence.lean`; a `propext`
   applied to a hypothesis is the Fregean Axiom and a `funext` applied to one is
   Functionality, and both are rejected here.

The walk visits core theorems too, so a core lemma that applies `funext` to a
hypothesis (for instance `forall_congr`, which `simp` uses) is rejected when reached.

## The other half

Neither check above says anything about type theory, so passing this one is not by itself
enough to be a Classicism proof. A proof may quantify over `Type`, form a Lean type such
as `e → e` that the relational system does not admit, or recurse over `Nat`, and still
satisfy both conditions: `Classicism/Tests.lean` contains three such proofs and asserts
that they pass here. **`Classicism/TypeSystem.lean` is what rejects them**, with
`#classicism_types` and `#classicism_types_audit`. It checks that every type is a type of
`R`, that every bound type variable is guarded by a `Ty`, `Rel` or `Order` instance, and
that every constant comes from a whitelist of the logical inductives, the `Eq` plumbing
and the formalisation's own metalanguage.

The two are deliberately separate commands, because they answer different questions and
fail for different reasons. `Classicism/Audit.lean` runs both over the whole library at
build time, and a certificate means both have passed.

## Reporting

`runCheck` also reports whether a theorem's axioms stay inside `C⁻`, the paper's `H⁻`
plus Classicism, which is everything admissible except `e_exists`; see
`Classicism/Core.lean` on why Existence is kept out of the type system.
-/

open Lean Meta Elab Command

namespace Classicism.Check

/-- Axioms a Classicism proof may depend on. -/
def allowedAxioms : List Name :=
  [``propext, ``Quot.sound, ``Classicism.e, ``Classicism.e_exists, ``Classicism.em]

/-- The axioms of `C⁻`: everything admissible except `e_exists`. A theorem whose report
lies inside this list is a theorem of the paper's `C⁻` (`H⁻` plus Classicism), which
proves the great majority of the paper's results; one that names `e_exists` needs the
Existence instance at `e`, and so full `C`. The constant `e` itself is included: it names
the type of individuals and claims nothing about it. -/
def cMinusAxioms : List Name :=
  [``propext, ``Quot.sound, ``Classicism.e, ``Classicism.em]

/-- Does this axiom report stay inside `C⁻`? -/
def isCMinus (axioms : Array Name) : Bool := axioms.all (cMinusAxioms.contains ·)

structure State where
  visited : NameSet := {}
  errors : Array MessageData := #[]

abbrev M := StateRefT State MetaM

def report (msg : MessageData) : M Unit :=
  modify fun s => { s with errors := s.errors.push msg }

/-- The argument of `propext`/`funext` may mention object variables (whose types are
types) but no proof variables (whose types are propositions). -/
partial def checkClosed (decl : Name) (rule : Name) (h : Expr) : M Unit := do
  let fvars := (Lean.collectFVars {} h).fvarIds
  for fv in fvars do
    let d ← fv.getDecl
    if ← isProp d.type then
      match d.value? with
      | some v => checkClosed decl rule v
      | none =>
        report m!"{decl}: `{rule}` applied to an argument that depends on the hypothesis `{d.userName} : {d.type}`; only closed arguments are Logical Equivalence"

partial def visit (decl : Name) (e : Expr) : M Unit := do
  match e with
  | .app .. =>
    let f := e.getAppFn
    let args := e.getAppArgs
    if f.isConstOf ``propext then
      if hlt : 2 < args.size then checkClosed decl ``propext args[2]
      else report m!"{decl}: partially applied `propext`"
    else if f.isConstOf ``funext then
      if hlt : 4 < args.size then checkClosed decl ``funext args[4]
      else report m!"{decl}: partially applied `funext`"
    else if f.isConstOf ``Quot.sound then
      report m!"{decl}: direct use of `Quot.sound`"
    visit decl f
    for a in args do visit decl a
  | .lam n t b bi =>
    visit decl t
    withLocalDecl n bi t fun x => visit decl (b.instantiate1 x)
  | .forallE n t b bi =>
    visit decl t
    withLocalDecl n bi t fun x => visit decl (b.instantiate1 x)
  | .letE n t v b _ =>
    visit decl t
    visit decl v
    withLetDecl n t v fun x => visit decl (b.instantiate1 x)
  | .mdata _ b => visit decl b
  | .proj _ _ b => visit decl b
  | .const c _ => visitConst c
  | _ => pure ()
where
  visitConst (c : Name) : M Unit := do
    -- `funext` is the gated primitive itself; its own proof (via `Quot.sound`) is not
    -- part of any Classicism derivation.
    if c == ``funext then return
    if (← get).visited.contains c then return
    modify fun s => { s with visited := s.visited.insert c }
    match (← getEnv).find? c with
    | some (.thmInfo v) => visit c v.value
    | some (.defnInfo v) => visit c v.value
    | _ => pure ()

/-- Run both checks on a declaration; return the errors and the axioms used. -/
def checkDecl (n : Name) : MetaM (Array MessageData × Array Name) := do
  let axioms ← collectAxioms n
  let (_, s) ← (visit.visitConst n).run {}
  let mut errors := s.errors
  for a in axioms do
    if !allowedAxioms.contains a then
      errors := errors.push m!"{n}: depends on the axiom `{a}`, which is not part of Classicism"
  return (errors, axioms)

/-- Check `n`; on success report its axioms and whether it stays inside `C⁻`. -/
def runCheck (n : Name) : CommandElabM (Option Bool) := do
  let (errors, axioms) ← liftTermElabM (checkDecl n)
  if errors.isEmpty then
    let theory := if isCMinus axioms then "C⁻" else "C"
    logInfo m!"{n}: Classicism ✓ [{theory}] (axioms: {axioms.toList})"
    return some (isCMinus axioms)
  else
    for e in errors do logError e
    return none

/-- `#classicism_check foo bar` checks the named declarations. -/
syntax (name := classicismCheck) "#classicism_check " ident+ : command

@[command_elab classicismCheck] def elabClassicismCheck : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    discard <| runCheck n

/-- `#classicism_audit Mod₁ Mod₂ …` checks every theorem declared in the named modules
and reports the tally. Selection is by module, not namespace, so that the checker's own
meta-code is not swept in. -/
syntax (name := classicismAudit) "#classicism_audit " ident+ : command

@[command_elab classicismAudit] def elabClassicismAudit : CommandElab := fun stx => do
  let env ← getEnv
  for modStx in stx[1].getArgs do
    let modName := modStx.getId
    let some (idx : Nat) := env.header.moduleNames.findIdx? (· == modName)
      | throwErrorAt modStx "unknown module {modName}"
    let names := env.constants.fold (init := #[]) fun acc n info =>
      let here : Option Nat := env.getModuleIdxFor? n
      if here == some idx && !n.isInternal && info matches .thmInfo _ then acc.push n else acc
    let names := names.qsort Name.lt
    let mut ok : Nat := 0
    let mut cMinus : Nat := 0
    for n in names do
      match ← runCheck n with
      | some inCMinus => ok := ok + 1; if inCMinus then cMinus := cMinus + 1
      | none => pure ()
    let needsE : Nat := ok - cMinus
    let tally := m!"{ok}/{names.size} theorems pass; {cMinus} in C⁻, {needsE} needing e_exists"
    if ok = names.size then
      logInfo m!"#classicism_audit {modName}: {tally}"
    else
      logError m!"#classicism_audit {modName}: {tally}"

/-- `#classicism_expect_rejection foo` succeeds exactly when the checker rejects `foo`.
It is how the negative controls in `Classicism/Tests.lean` assert that the gate bites. -/
syntax (name := classicismExpectRejection) "#classicism_expect_rejection " ident+ : command

@[command_elab classicismExpectRejection] def elabExpectRejection : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let (errors, _) ← liftTermElabM (checkDecl n)
    if errors.isEmpty then
      logError m!"{n}: expected the checker to reject this proof, but it passed"
    else
      logInfo m!"{n}: rejected as expected — {errors[0]!}"

/-- `#classicism_expect_c_minus foo` succeeds only when `foo` passes the checker *and*
its axiom report stays inside `C⁻`, that is, does not name `e_exists`. It guards the
separation of Existence from the type system: were inhabitation folded back into the
class `Ty`, or an Existence lemma used where it is not needed, these assertions would
start failing. -/
syntax (name := classicismExpectCMinus) "#classicism_expect_c_minus " ident+ : command

@[command_elab classicismExpectCMinus] def elabExpectCMinus : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let (errors, axioms) ← liftTermElabM (checkDecl n)
    if !errors.isEmpty then
      logError m!"{n}: does not pass the checker at all"
    else if !isCMinus axioms then
      logError m!"{n}: expected a theorem of C⁻, but its axioms are {axioms.toList}"
    else
      logInfo m!"{n}: C⁻ ✓"

/-- `#classicism_expect_needs_e foo` succeeds only when `foo` passes and *does* name
`e_exists`, so that an Existence claim at `e` cannot quietly become free. -/
syntax (name := classicismExpectNeedsE) "#classicism_expect_needs_e " ident+ : command

@[command_elab classicismExpectNeedsE] def elabExpectNeedsE : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let (errors, axioms) ← liftTermElabM (checkDecl n)
    if !errors.isEmpty then
      logError m!"{n}: does not pass the checker at all"
    else if isCMinus axioms then
      logError m!"{n}: expected this to need e_exists, but it is a theorem of C⁻"
    else
      logInfo m!"{n}: needs e_exists, as expected"

/-! ## The strict policy

Under the gate, `propext` and `funext` are permitted in the ζ-Equivalence shape. Under the
**strict** policy they are banned outright, and the eleven closed identities of
`Classicism.Axiomatic` stand in their place. `Classicism/Strict.lean` is written to that
policy, and `#classicism_strict` is what holds it to it. -/

/-- Axioms the strict policy admits: the eleven identities, and the theory's own `e`,
`e_exists` and `em`. Notably **not** `propext`, `funext` or `Quot.sound`. -/
def strictAllowedAxiom (n : Name) : Bool :=
  (`Classicism.Axiomatic).isPrefixOf n
    || n == ``Classicism.e || n == ``Classicism.e_exists || n == ``Classicism.em

/-- `#classicism_strict foo` checks that `foo` uses no Logical Equivalence at all. -/
syntax (name := classicismStrict) "#classicism_strict " ident+ : command

@[command_elab classicismStrict] def elabClassicismStrict : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let axioms ← liftTermElabM (collectAxioms n)
    let bad := axioms.filter (fun a => !strictAllowedAxiom a)
    if bad.isEmpty then
      logInfo m!"{n}: strict ✓ (axioms: {axioms.toList})"
    else
      logError m!"{n}: depends on {bad.toList}, which the strict policy bans; only the \
eleven identities, `e`, `e_exists` and `em` are admitted"

/-- `#classicism_strict_audit Mod₁ …` runs the strict check over every theorem declared in
the named modules. -/
syntax (name := classicismStrictAudit) "#classicism_strict_audit " ident+ : command

@[command_elab classicismStrictAudit] def elabClassicismStrictAudit : CommandElab := fun stx => do
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
    for n in names do
      let axioms ← liftTermElabM (collectAxioms n)
      if axioms.all strictAllowedAxiom then ok := ok + 1
      else
        let bad := axioms.filter (fun a => !strictAllowedAxiom a)
        logError m!"{n}: depends on {bad.toList}, banned by the strict policy"
    if ok = names.size then
      logInfo m!"#classicism_strict_audit {modName}: {ok}/{names.size} strict"
    else
      logError m!"#classicism_strict_audit {modName}: {ok}/{names.size} strict"

/-- `#classicism_strict_expect_rejection foo` succeeds only when the strict policy
rejects `foo`. It is how the controls assert that the ban on Logical Equivalence bites. -/
syntax (name := classicismStrictExpectRejection)
  "#classicism_strict_expect_rejection " ident+ : command

@[command_elab classicismStrictExpectRejection]
def elabStrictExpectRejection : CommandElab := fun stx => do
  for id in stx[1].getArgs do
    let n ← liftCoreM (realizeGlobalConstNoOverloadWithInfo id)
    let axioms ← liftTermElabM (collectAxioms n)
    let bad := axioms.filter (fun a => !strictAllowedAxiom a)
    if bad.isEmpty then
      logError m!"{n}: expected the strict policy to reject this, but it passed"
    else
      logInfo m!"{n}: rejected by the strict policy, as expected — {bad.toList}"

end Classicism.Check
