import Lean
import Classicism.Order

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

A schema over types is written `∀ {σ : Type} [Ty σ] …`, so a bound type variable is an
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
   ``propext, ``funext, ``Quot, ``Quot.mk, ``Quot.lift, ``Quot.liftOn, ``Quot.sound]

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

/-- State for the type-system walk: the type variables the telescope has guarded, and
the constants already seen. -/
structure TState where
  guarded : Std.HashSet FVarId := {}
  visited : NameSet := {}
  errors : Array MessageData := #[]

abbrev T := StateRefT TState MetaM

def terror (msg : MessageData) : T Unit :=
  modify fun s => { s with errors := s.errors.push msg }

/-- `Prop`, the paper's `t`. -/
def isPropSort (e : Expr) : Bool := e matches .sort .zero

/-- Is `e` a `Ty`, `Rel` or `Order` instance on a type, and on which type? -/
def guardTarget (e : Expr) : Option Expr :=
  let f := e.getAppFn
  let args := e.getAppArgs
  if (f.isConstOf ``Classicism.Ty || f.isConstOf ``Classicism.RelTy
      || f.isConstOf ``Classicism.Rel || f.isConstOf ``Classicism.Order)
      && args.size ≥ 1 then
    some args[0]!
  else none

/-- Is `e` an `R`-type? Guarded type variables count. -/
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
  terror m!"{decl}: the binder `{nm} : {ty}` is neither a proof, an object of an \
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
    terror m!"{decl}: the type `{e}` is not a type of the relational system R"
    return
  match e with
  | .app f a => tvisit decl f; tvisit decl a
  | .lam nm t b bi => tbinder decl nm t b bi
  | .forallE nm t b bi => tbinder decl nm t b bi
  | .letE nm t v b _ =>
    checkBinder decl nm t
    tvisit decl t; tvisit decl v
    withLetDecl nm t v fun x => tvisit decl (b.instantiate1 x)
  | .mdata _ b => tvisit decl b
  | .proj _ _ b => tvisit decl b
  | .const c _ => tvisitConst c
  | _ => pure ()
where
  /-- One binder of a telescope. A `Ty`/`Rel`/`Order` binder registers its subject as a
  guarded type variable **before** anything is walked, since the binder's own type
  mentions that variable. -/
  tbinder (decl : Name) (nm : Name) (t b : Expr) (bi : BinderInfo) : T Unit := do
    if let some (.fvar fid) := guardTarget t then
      modify fun s => { s with guarded := s.guarded.insert fid }
    if !isAuxiliary decl then checkBinder decl nm t
    tvisit decl t
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
      terror m!"{decl}: uses the constant `{c}`, which is not part of Classicism's \
language, its logic, or the formalisation's own metalanguage"
      return
    -- Descend only into this library's own definitions; a whitelisted core constant is
    -- an accepted primitive, not something to audit the innards of.
    if !(`Classicism).isPrefixOf c then return
    -- Report against `c`, so a finding names the declaration it is really in.
    match env.find? c with
    | some (.thmInfo v) => tvisit c v.value
    | some (.defnInfo v) => tvisit c v.value
    | _ => pure ()

/-- Every bound type variable in a declaration's *statement* must be guarded by a `Ty`,
`Rel` or `Order` instance. An unguarded one is a quantifier over Lean types. -/
def checkTypeBindersGuarded (decl : Name) (stmt : Expr) : T Unit := do
  let rec go (e : Expr) (pending : List (Name × Nat)) (depth : Nat) : T Unit := do
    match e with
    | .forallE nm t b _ =>
      -- record a new type variable, or discharge a pending one
      let pending :=
        if t.isSort && !isPropSort t then (nm, depth) :: pending
        else match guardTarget t with
          | some (.bvar i) => pending.filter (fun (_, d) => d != depth - 1 - i)
          | _ => pending
      go b pending (depth + 1)
    | _ =>
      for (nm, _) in pending do
        terror m!"{decl}: the type variable `{nm}` is not guarded by a `Ty`, `Rel` or \
`Order` instance, so the statement quantifies over Lean types rather than over the types of R"
  go stmt [] 0

/-- Run the type-system check on one declaration. -/
def checkTypeSystem (n : Name) : MetaM (Array MessageData) := do
  let env ← getEnv
  match env.find? n with
  | some info =>
    let (_, s) ← (do
      checkTypeBindersGuarded n info.type
      tvisit n info.type
      match info with
      | .thmInfo v => tvisit n v.value
      | .defnInfo v => tvisit n v.value
      | _ => pure ()).run {}
    return s.errors
  | none => return #[m!"{n}: not found"]

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
    for n in names do
      let errors ← liftTermElabM (checkTypeSystem n)
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
