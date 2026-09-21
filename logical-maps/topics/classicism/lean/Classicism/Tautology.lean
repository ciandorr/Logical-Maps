import Lean
import Classicism.Strict

/-!
# `boolean_eq`: deciding propositional identities strictly

This is the propositional case of Appendix A, as a tactic. Given a goal `P = Q` where `P`
and `Q` are built from propositional atoms by `∧`, `∨`, `¬`, `⊤` and `⊥`, and are
tautologically equivalent, `boolean_eq` produces a proof **from the six Boolean Identities
alone**. It emits no `propext`, no `funext`, and no `em`, so `#classicism_strict` accepts
everything it builds. If `P` and `Q` are not equivalent it reports a falsifying assignment.

## The method: Shannon expansion

The recursion is on the list of atoms, and it is driven by the cancellation lemma already
in `Classicism/Strict.lean`,

    eq_of_meet_eq :  (a ∧ P) = (a ∧ Q)  →  (¬a ∧ P) = (¬a ∧ Q)  →  P = Q

which is where associativity came from too. To prove `P = Q`, pick an atom `a` and prove
the two conjoined equations. Each of those is settled by *substituting for `a`*: under the
conjunct `a` the formula `P` may have every occurrence of `a` replaced by `⊤`, and under
`¬a` by `⊥`. That is `substLit` below, and it leaves a formula with one fewer atom, so the
recursion terminates. With no atoms left, a formula is built from `⊤` and `⊥` only, and
`evalClosed` collapses it to one of them by the bound laws.

So the shape of a produced proof, for atoms `a, b`, is a binary tree of depth two whose
four leaves are each `⊤ = ⊤` or `⊥ = ⊥`. That is exponential in the number of atoms, which
is the right cost for a complete method and no trouble at the sizes that occur here.

## Why substitution needs a lemma about negation

`substLit` recurses on the formula. Conjunction and disjunction are easy, because a
conjunct distributes into both: `meet_meet_split` and `meet_join_distrib`. Negation is the
interesting case, since from `l ∧ Q = l ∧ Q'` one cannot simply conclude
`l ∧ ¬Q = l ∧ ¬Q'` by congruence. The bridge is `relative_compl`,

    l ∧ ¬q  =  l ∧ ¬(l ∧ q)

which says that under `l` the complement of `q` and of `l ∧ q` agree, so the recursive
equation can be applied inside and then the lemma used again in reverse.

## How a tactic is put together

Three layers, each a plain function in `MetaM` returning a *proof term*:

* `evalClosed e` returns which bound `e` is, and a proof of `e = ⊤` or `e = ⊥`.
* `substLit` returns the substituted formula and a proof of `l ∧ P = l ∧ P'`.
* `proveEq` ties them together with `eq_of_meet_eq`.

Nothing here is trusted. `proveEq` hands the kernel a term, and if any of this code is
wrong the term fails to typecheck and the tactic errors; it cannot produce a false theorem.
The front end `boolean_eq` reads the goal, collects the atoms and assigns the result.
-/

open Lean Meta Elab Tactic

namespace Classicism.Strict

/-! ### Building and taking apart formulas -/

private def mkMeet (p q : Expr) : Expr := mkApp2 (mkConst ``And) p q
private def mkJoin (p q : Expr) : Expr := mkApp2 (mkConst ``Or) p q
private def mkCompl (p : Expr) : Expr := mkApp (mkConst ``Not) p
private def topE : Expr := mkConst ``Classicism.Strict.Top
private def botE : Expr := mkConst ``Classicism.Strict.Bot

/-- `fun x : Prop => body`, with `body` mentioning the bound variable as `.bvar 0`. -/
private def propLam (body : Expr) : Expr :=
  .lam `x (mkSort Level.zero) body .default

/-- Unfold the paper's defined connectives `imp` and `iff` into `∧`, `∨`, `¬`. The result
is definitionally equal to the input, so a proof built about the expanded formula is
accepted by the kernel against the original goal and no bridging lemma is needed. Lean's
own `→` and `Iff` are deliberately *not* unfolded: they are not Boolean combinations, and a
goal mentioning them is rejected with its arrow or `Iff` treated as an atom. -/
partial def expandDefs (e : Expr) : Expr :=
  match e.getAppFnArgs with
  | (``Classicism.imp, #[p, q]) => mkJoin (mkCompl (expandDefs p)) (expandDefs q)
  | (``Classicism.iff, #[p, q]) =>
    let p' := expandDefs p
    let q' := expandDefs q
    mkMeet (mkJoin (mkCompl p') q') (mkJoin (mkCompl q') p')
  | (``And, #[p, q]) => mkMeet (expandDefs p) (expandDefs q)
  | (``Or, #[p, q]) => mkJoin (expandDefs p) (expandDefs q)
  | (``Not, #[p]) => mkCompl (expandDefs p)
  | _ => e

/-- The atoms of a formula: every maximal subterm not built by `∧`, `∨`, `¬`, `⊤` or `⊥`. -/
partial def atomsOf (e : Expr) (acc : Array Expr) : Array Expr :=
  match e.getAppFnArgs with
  | (``And, #[p, q]) => atomsOf q (atomsOf p acc)
  | (``Or, #[p, q]) => atomsOf q (atomsOf p acc)
  | (``Not, #[p]) => atomsOf p acc
  | (``Classicism.Strict.Top, _) => acc
  | (``Classicism.Strict.Bot, _) => acc
  | _ => if acc.any (· == e) then acc else acc.push e

/-! ### Layer one: atom-free formulas -/

/-- Collapse a formula built only from `⊤` and `⊥`. Returns `true` for `⊤`, together with
a proof of `e = ⊤`, and `false` with a proof of `e = ⊥`. Every step is one of the bound
laws of `Classicism/Strict.lean`. -/
partial def evalClosed (e : Expr) : MetaM (Bool × Expr) := do
  match e.getAppFnArgs with
  | (``Classicism.Strict.Top, _) => return (true, ← mkEqRefl topE)
  | (``Classicism.Strict.Bot, _) => return (false, ← mkEqRefl botE)
  | (``Not, #[p]) =>
    let (v, hp) ← evalClosed p
    -- `¬p = ¬(bound) = the other bound`
    let step ← mkCongrArg (propLam (mkCompl (.bvar 0))) hp
    let close := mkConst (if v then ``Classicism.Strict.compl_top else ``Classicism.Strict.compl_bot)
    return (!v, ← mkEqTrans step close)
  | (``And, #[p, q]) =>
    let (vp, hp) ← evalClosed p
    let (vq, hq) ← evalClosed q
    let step₁ ← mkCongrArg (propLam (mkMeet (.bvar 0) q)) hp
    let step₂ ← mkCongrArg (propLam (mkMeet (if vp then topE else botE) (.bvar 0))) hq
    -- now `(bound) ∧ (bound)`; pick the law that collapses it
    let close ←
      if vp then pure (mkApp (mkConst ``Classicism.Strict.top_meet) (if vq then topE else botE))
      else pure (mkApp (mkConst ``Classicism.Strict.bot_meet) (if vq then topE else botE))
    return (vp && vq, ← mkEqTrans (← mkEqTrans step₁ step₂) close)
  | (``Or, #[p, q]) =>
    let (vp, hp) ← evalClosed p
    let (vq, hq) ← evalClosed q
    let step₁ ← mkCongrArg (propLam (mkJoin (.bvar 0) q)) hp
    let step₂ ← mkCongrArg (propLam (mkJoin (if vp then topE else botE) (.bvar 0))) hq
    let close ←
      if vp then pure (mkApp (mkConst ``Classicism.Strict.top_join) (if vq then topE else botE))
      else pure (mkApp (mkConst ``Classicism.Strict.bot_join) (if vq then topE else botE))
    return (vp || vq, ← mkEqTrans (← mkEqTrans step₁ step₂) close)
  | _ => throwError "boolean_eq: {e} still contains an atom"

/-! ### Layer two: substituting for one atom -/

/-- Under the literal `l`, replace every occurrence of the atom `a` in `P` by `v`.
`l` is `a` itself with `v = ⊤`, or `¬a` with `v = ⊥`. Returns the substituted formula and
a proof of `l ∧ P = l ∧ P'`. -/
partial def substLit (l a v : Expr) (pos : Bool) (P : Expr) : MetaM (Expr × Expr) := do
  if ← isDefEq P a then
    -- the atom itself: `a ∧ a = a ∧ ⊤`, or `¬a ∧ a = ¬a ∧ ⊥`
    let lem := if pos then ``Classicism.Strict.meet_self_eq_meet_top
                      else ``Classicism.Strict.compl_meet_eq_meet_bot
    return (v, mkApp (mkConst lem) a)
  match P.getAppFnArgs with
  | (``And, #[p, q]) =>
    let (p', hp) ← substLit l a v pos p
    let (q', hq) ← substLit l a v pos q
    -- `l ∧ (p ∧ q) = (l∧p) ∧ (l∧q) = (l∧p') ∧ (l∧q') = l ∧ (p' ∧ q')`
    let split := mkApp3 (mkConst ``Classicism.Strict.meet_meet_split) l p q
    let r₁ ← mkCongrArg (propLam (mkMeet (.bvar 0) (mkMeet l q))) hp
    let r₂ ← mkCongrArg (propLam (mkMeet (mkMeet l p') (.bvar 0))) hq
    let back := (mkApp3 (mkConst ``Classicism.Strict.meet_meet_split) l p' q')
    let prf ← mkEqTrans split (← mkEqTrans r₁ (← mkEqTrans r₂ (← mkEqSymm back)))
    return (mkMeet p' q', prf)
  | (``Or, #[p, q]) =>
    let (p', hp) ← substLit l a v pos p
    let (q', hq) ← substLit l a v pos q
    let split := mkApp3 (mkConst ``Classicism.Strict.meet_join_distrib) l p q
    let r₁ ← mkCongrArg (propLam (mkJoin (.bvar 0) (mkMeet l q))) hp
    let r₂ ← mkCongrArg (propLam (mkJoin (mkMeet l p') (.bvar 0))) hq
    let back := (mkApp3 (mkConst ``Classicism.Strict.meet_join_distrib) l p' q')
    let prf ← mkEqTrans split (← mkEqTrans r₁ (← mkEqTrans r₂ (← mkEqSymm back)))
    return (mkJoin p' q', prf)
  | (``Not, #[p]) =>
    let (p', hp) ← substLit l a v pos p
    -- `l ∧ ¬p = l ∧ ¬(l∧p) = l ∧ ¬(l∧p') = l ∧ ¬p'`, the `relative_compl` detour
    let outIn := mkApp2 (mkConst ``Classicism.Strict.relative_compl) l p
    let mid ← mkCongrArg (propLam (mkMeet l (mkCompl (.bvar 0)))) hp
    let backOut ← mkEqSymm (mkApp2 (mkConst ``Classicism.Strict.relative_compl) l p')
    return (mkCompl p', ← mkEqTrans outIn (← mkEqTrans mid backOut))
  | _ =>
    -- another atom, `⊤` or `⊥`: unchanged
    return (P, ← mkEqRefl (mkMeet l P))

/-! ### Layer three: the recursion -/

/-- A proof of `P = Q`, or an error naming an assignment on which they differ. `trail`
records the literals chosen so far, for that message. -/
partial def proveEq (atoms : List Expr) (trail : List (Expr × Bool)) (P Q : Expr) :
    MetaM Expr := do
  match atoms with
  | [] =>
    let (vP, hP) ← evalClosed P
    let (vQ, hQ) ← evalClosed Q
    if vP != vQ then
      let assign ← trail.reverse.mapM fun (a, b) => do
        return m!"{if b then "" else "¬"}{← ppExpr a}"
      throwError "boolean_eq: the two sides are not equivalent; they differ on the \
assignment {MessageData.joinSep assign ", "}"
    mkEqTrans hP (← mkEqSymm hQ)
  | a :: rest =>
    let branch (pos : Bool) : MetaM Expr := do
      let l := if pos then a else mkCompl a
      let v := if pos then topE else botE
      let (P', hP) ← substLit l a v pos P
      let (Q', hQ) ← substLit l a v pos Q
      let inner ← proveEq rest ((a, pos) :: trail) P' Q'
      -- `l ∧ P = l ∧ P' = l ∧ Q' = l ∧ Q`
      let mid ← mkCongrArg (propLam (mkMeet l (.bvar 0))) inner
      mkEqTrans hP (← mkEqTrans mid (← mkEqSymm hQ))
    let h₁ ← branch true
    let h₂ ← branch false
    return mkApp5 (mkConst ``Classicism.Strict.eq_of_meet_eq) a P Q h₁ h₂

/-! ### The front end -/

/-- Prove a propositional identity from the six Boolean Identities. The goal must be
`P = Q` with `P` and `Q` built from atoms by `∧`, `∨`, `¬`, `⊤` and `⊥`. -/
elab "boolean_eq" : tactic => do
  let goal ← getMainGoal
  let ty ← whnfR (← goal.getType)
  let some (_, lhs, rhs) := ty.eq?
    | throwError "boolean_eq: the goal is not an equation"
  unless ← isDefEq (← inferType lhs) (mkSort Level.zero) do
    throwError "boolean_eq: the goal is not an equation between propositions"
  let lhs := expandDefs lhs
  let rhs := expandDefs rhs
  let atoms := (atomsOf rhs (atomsOf lhs #[])).toList
  let prf ← proveEq atoms [] lhs rhs
  -- The proof is about the expanded formulas, which are definitionally the originals.
  goal.assign prf

/-! ### The propositional case of Appendix A

Appendix A shows every `H` axiom identical to `⊤` and every rule to preserve that, and
then converts `(P ↔ Q) = ⊤` into `P = Q`. The last step is `eq_of_iff_eq_top` below, and
with the tactic it is four lines: conjoin `⊤` to each side, replace it by the biconditional,
and observe that `P ∧ (P ↔ Q)` and `Q ∧ (P ↔ Q)` are tautologically identical.

Together with `boolean_eq`, which settles any tautology, this closes the `PC` case: a
propositional `H`-theorem `P ↔ Q` yields the identity `P = Q` from the six Boolean
Identities. What remains for stage three is the quantifier part, `UI`, `EG`, `Gen` and
`Inst`, from the five Classicist Identities. -/

/-- From `(P ↔ Q) = ⊤` to `P = Q`, where `↔` is the paper's abbreviation. This is the
propositional half of Appendix A's conversion. -/
theorem eq_of_iff_eq_top {p q : Prop} (h : iff p q = Top) : p = q :=
  have key : (p ∧ iff p q) = (q ∧ iff p q) := by boolean_eq
  calc p = (p ∧ Top) := (meet_top p).symm
    _ = (p ∧ iff p q) := by rw [h]
    _ = (q ∧ iff p q) := key
    _ = (q ∧ Top) := by rw [h]
    _ = q := meet_top q

/-- And back: identical propositions have a biconditional identical to `⊤`. So
`(P ↔ Q) = ⊤` and `P = Q` are interchangeable, which is Propositional Equivalence read as
an identity. -/
theorem iff_eq_top_of_eq {p q : Prop} (h : p = q) : iff p q = Top :=
  have key : iff q q = Top := by boolean_eq
  h ▸ key

end Classicism.Strict
