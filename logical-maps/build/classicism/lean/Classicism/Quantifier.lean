import Classicism.Tautology

/-!
# The quantifier cases of Appendix A

Appendix A proves every axiom of `H` identical to `⊤` and every rule to preserve that.
`Classicism/Tautology.lean` did `PC`. This file does the quantifier part, from the five
Classicist Identities: Proposition A.1, then `UI`, `EG`, `Ref`, and the identities behind
`Gen` and `Inst`. The strict policy still holds throughout, so nothing here uses `propext`
or `funext`.

## How Appendix A avoids ξ, and why that matters here

The rule ξ, from `⊢ A = B` to `⊢ (λv.A) = (λv.B)`, is `funext` in Lean, and the strict
policy bans it. The paper does not need it. Its central lemma is stated **already
λ-abstracted**,

> for any formula `P` and variables `v̄`, if `⊢ P` then `⊢ (λv̄.P) = (λv̄.⊤)`,

and every step of its proof has the same shape: rewrite the target so that one of the
eleven *closed* identities appears applied to arguments, substitute it by Ref and Leibniz's
Law, and β-reduce. Leibniz's Law does not care how deeply the position sits, or whether
binders intervene. In Lean that step is exactly

    congrArg (fun G => …context mentioning G…) closedIdentity

with β-reduction free, since Lean's definitional equality includes it. `ref_top` below is
written out that way, six substitutions deep, and it is the pattern the eventual
transformer will automate.

Note also that lifting a *function* identity under a quantifier needs no new principle:
`congrArg (fun F => ∀ x, F x) h` does it, because `∀ x, (fun x => P x) x` is `∀ x, P x` by
β. What is unavailable is manufacturing the function identity from a pointwise one.
-/

namespace Classicism.Strict

open Classicism.Axiomatic

variable {σ : Type} [Ty σ]

/-! ### Proposition A.1: `∀x.⊤ = ⊤`

The paper's `toplemma`. Distribution-∨∀ at the constant `⊥` property and `p := ⊤` turns a
quantification into a disjunction, which the bounds then collapse. The one step under the
binder is safe because the body is *constant*, so it is congruence on `fun r => ∀ _, r`. -/

theorem forall_const_top : (∀ _ : σ, Top) = Top :=
  have d : (Top ∨ (∀ _ : σ, Bot)) = (∀ _ : σ, (Top ∨ Bot)) :=
    congrFun (congrFun (distribution_or_forall σ) (fun _ => Bot)) Top
  calc (∀ _ : σ, Top) = (∀ _ : σ, (Top ∨ Bot)) :=
        congrArg (fun r : Prop => ∀ _ : σ, r) (join_bot Top).symm
    _ = (Top ∨ (∀ _ : σ, Bot)) := d.symm
    _ = Top := top_join _

theorem exists_const_bot : (∃ _ : σ, Bot) = Bot :=
  have d : (Bot ∧ (∃ _ : σ, Top)) = (∃ _ : σ, (Bot ∧ Top)) :=
    congrFun (congrFun (distribution_and_exists σ) (fun _ => Top)) Bot
  calc (∃ _ : σ, Bot) = (∃ _ : σ, (Bot ∧ Top)) :=
        congrArg (fun r : Prop => ∃ _ : σ, r) (meet_top Bot).symm
    _ = (Bot ∧ (∃ _ : σ, Top)) := d.symm
    _ = Bot := bot_meet _

/-! ### Turning an order fact into an implication

Both `UI` and `EG` are absorption facts, and absorption is the lattice order. These two
lemmas convert; each is one `boolean_eq` and one rewrite. -/

/-- If `q` absorbs `p` on the join side, `p → q` is `⊤`. -/
theorem imp_eq_top_of_join {p q : Prop} (h : (q ∨ p) = q) : imp p q = Top :=
  have key : ((¬ p) ∨ (q ∨ p)) = Top := by boolean_eq
  calc imp p q = ((¬ p) ∨ q) := rfl
    _ = ((¬ p) ∨ (q ∨ p)) := by rw [h]
    _ = Top := key

/-- If `p` absorbs `q` on the meet side, `p → q` is `⊤`. -/
theorem imp_eq_top_of_meet {p q : Prop} (h : (p ∧ q) = p) : imp p q = Top :=
  have key : ((¬ (p ∧ q)) ∨ q) = Top := by boolean_eq
  calc imp p q = ((¬ p) ∨ q) := rfl
    _ = ((¬ (p ∧ q)) ∨ q) := by rw [h]
    _ = Top := key

/-! ### `UI` and `EG`

Absorption-∨∀ says `Fy ∨ ∀F = Fy`, which is `∀F ≤ Fy`, which is `UI`. Absorption-∧∃ says
`Fy ∧ ∃F = Fy`, which is `Fy ≤ ∃F`, which is `EG`. Both instances come from the closed
axiom by `congrFun`, so neither needs anything under a binder. -/

/-- `UI`: `∀F → FA` is identical to `⊤`. Case (ii) of the paper's `hardlemma`. -/
theorem ui_top (F : σ → Prop) (a : σ) : imp (∀ y, F y) (F a) = Top :=
  imp_eq_top_of_join (congrFun (congrFun (absorption_or_forall σ) F) a)

/-- `EG`: `FA → ∃F` is identical to `⊤`. Case (iii). -/
theorem eg_top (F : σ → Prop) (a : σ) : imp (F a) (∃ y, F y) = Top :=
  imp_eq_top_of_meet (congrFun (congrFun (absorption_and_exists σ) F) a)

/-! ### `Gen` and `Inst`

These are rules, and what the identities give is better than a rule: Distribution-∨∀ *is*
the identity behind `Gen`, and Distribution-∧∃ the one behind `Inst`. Read right to left
they say that a quantifier may be moved across a constant disjunct or conjunct, which is
what `Gen` and `Inst` do. The corollaries below are the rules in identity-to-`⊤` form. -/

/-- The identity behind `Gen`: `P → ∀u.Qu` is identical to `∀u.(P → Qu)`. -/
theorem imp_forall (P : Prop) (Q : σ → Prop) :
    imp P (∀ u, Q u) = (∀ u, imp P (Q u)) :=
  congrFun (congrFun (distribution_or_forall σ) Q) (¬ P)

/-- `Gen` as a rule. -/
theorem gen_top {P : Prop} {Q : σ → Prop} (h : (∀ u, imp P (Q u)) = Top) :
    imp P (∀ u, Q u) = Top := (imp_forall P Q).trans h

/-- The identity behind `Inst`, the dual: `P ∧ ∃u.Qu` is identical to `∃u.(P ∧ Qu)`. -/
theorem meet_exists (P : Prop) (Q : σ → Prop) :
    (P ∧ ∃ u, Q u) = (∃ u, P ∧ Q u) :=
  congrFun (congrFun (distribution_and_exists σ) Q) P

/-! ### `Ref`

Case (iv), and the one that needs work under a binder. The Identity Identity gives
`(a = a) = ∀X.(Xa ↔ Xa)`, and the body of that quantification *does* mention `X`, so the
route to `∀X.⊤` cannot be congruence on a constant. It is instead six substitutions of
closed Boolean identities into a context that contains the binder, exactly as the paper's
"(Booleanism)" step requires, followed by Proposition A.1.

Writing `q` for `X a`, the chain runs

    iff q q  =  (¬q ∨ q) ∧ (¬q ∨ q)      definitionally
             =  (¬q ∨ q) ∧ (q ∨ ¬q)      Commutativity-∨
             =  (¬q ∨ q)                 Dissolution-∧∨
             =  (¬q ∨ q) ∧ ⊤             Dissolution-∧∨, backwards
             =  ⊤ ∧ (¬q ∨ q)             Commutativity-∧
             =  ⊤ ∧ (q ∨ ¬q)             Commutativity-∨
             =  ⊤                        Dissolution-∧∨

and every line is `congrArg` of a context over one of the four axioms involved. -/

/-- The λ-abstracted step: `(λX. Xa ↔ Xa) = (λX. ⊤)`, by substitution of closed
identities under the binder. No `funext` and no ξ. -/
theorem lam_iff_self_top (a : σ) :
    (fun X : σ → Prop => Classicism.iff (X a) (X a)) = (fun _ : σ → Prop => Top) :=
  calc (fun X : σ → Prop => Classicism.iff (X a) (X a))
      = (fun X : σ → Prop => ((¬ (X a)) ∨ X a) ∧ (X a ∨ ¬ (X a))) :=
        congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => ((¬ (X a)) ∨ X a) ∧ G (¬ (X a)) (X a)) commutativity_or
    _ = (fun X : σ → Prop => (¬ (X a)) ∨ X a) :=
        congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => G ((¬ (X a)) ∨ X a) (X a)) dissolution_and_or
    _ = (fun X : σ → Prop => (((¬ (X a)) ∨ X a) ∧ Top)) :=
        (congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => G ((¬ (X a)) ∨ X a) everything) dissolution_and_or).symm
    _ = (fun X : σ → Prop => Top ∧ ((¬ (X a)) ∨ X a)) :=
        congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => G ((¬ (X a)) ∨ X a) Top) commutativity_and
    _ = (fun X : σ → Prop => Top ∧ (X a ∨ ¬ (X a))) :=
        congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => Top ∧ G (¬ (X a)) (X a)) commutativity_or
    _ = (fun _ : σ → Prop => Top) :=
        congrArg (fun G : Prop → Prop → Prop =>
          fun X : σ → Prop => G Top (X a)) dissolution_and_or

/-- `Ref`: `A = A` is identical to `⊤`. Case (iv) of the paper's `hardlemma`. -/
theorem ref_top (a : σ) : (a = a) = Top :=
  calc (a = a) = (∀ X : σ → Prop, Classicism.iff (X a) (X a)) :=
        congrFun (congrFun (identity_identity σ) a) a
    _ = (∀ _ : σ → Prop, Top) :=
        congrArg (fun F : (σ → Prop) → Prop => ∀ X, F X) (lam_iff_self_top a)
    _ = Top := forall_const_top

end Classicism.Strict
