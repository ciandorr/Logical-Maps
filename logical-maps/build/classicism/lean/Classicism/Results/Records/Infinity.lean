import Classicism.Paper
import Classicism.Principles

/-!
# Proofs of map records: Infinity, and Countable Boolean Completeness

Records among the Axioms of Infinity and Possible Infinity, and Countable Boolean
Completeness.
The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ## Infinity, and Countable Boolean Completeness (2 October) -/

/-- `axiom-of-infinity-e-implies-possible-infinity-e`: `T`'s dual, `p → ◇p`. -/
theorem axiom_of_infinity_e_implies_possible_infinity_e : AxiomOfInfinityE → PossibleInfinityE :=
  dia_intro _

/-- `axiom-of-infinity-t-implies-possible-infinity-t`: `p → ◇p`. -/
theorem axiom_of_infinity_t_implies_possible_infinity_t : AxiomOfInfinityT → PossibleInfinityT :=
  dia_intro _

/-- `necessary-axiom-of-infinity-e-implies-axiom-of-infinity-e`: `T`. -/
theorem necessary_axiom_of_infinity_e_implies_axiom_of_infinity_e :
    NecAxiomOfInfinityE → AxiomOfInfinityE := box_elim

/-- `necessary-axiom-of-infinity-t-implies-axiom-of-infinity-t`: `T`. -/
theorem necessary_axiom_of_infinity_t_implies_axiom_of_infinity_t :
    NecAxiomOfInfinityT → AxiomOfInfinityT := box_elim

/-- `atomlessness-implies-axiom-of-infinity-t`: a finite cardinality `Z` of propositions
holds only of properties `X` that leave out, below each possible proposition, a possible
one: by the induction `FiniteCardinality` provides. The empty property leaves out the
proposition itself. If `X` is `Y` with `y` added and the property `Y` holds of leaves out
`r` below `q`, then either `X` leaves out `r` too, or `r` is `y`; then Atomlessness gives a
possible `r'` strictly below `r`, below which `Y` leaves out some `r''`, and `r''` is not
`y`, else `r ≤ r'`. The universal property leaves out nothing, though `⊤` is possible. -/
theorem atomlessness_implies_axiom_of_infinity_t : Atomlessness → AxiomOfInfinityT :=
  fun atl h => h.elim fun Z hZ =>
  ((hZ.1 (λ Z ↦ ∀ X, Z X → ∀ q : Prop, ◇ q → ∃ r : Prop, ◇ r ∧ Rel.le r q ∧ ¬ X r)
    ⟨fun _ hX q hq => ⟨q, hq, le_refl_prop q, hX q⟩,
     fun _ hY X hX q hq => hX.elim fun y hy => (hY _ hy.2 q hq).elim fun r hr =>
       (em (X r)).elim
         (fun hXr =>
           have ery : r = y := (em (r = y)).elim id (fun nry => absurd ⟨hXr, nry⟩ hr.2.2)
           (atl r hr.1).elim fun r' hr' => (hY _ hy.2 r' hr'.1).elim fun r'' hr'' =>
             ⟨r'', hr''.1, le_trans_prop r'' r q (le_trans_prop r'' r' r hr''.2.1 hr'.2.1) hr.2.1,
              fun hXr'' =>
                have e : r'' = r := (em (r'' = y)).elim (fun h => h.trans ery.symm)
                  (fun h => absurd ⟨hXr'', h⟩ hr''.2.2)
                hr'.2.2 (le_antisymm_prop r' r hr'.2.1 (e ▸ hr''.2.1))⟩)
         (fun hXr => ⟨r, hr.1, hr.2.1, hXr⟩)⟩)
    (λ _ ↦ True) hZ.2 True (dia_intro True trivial)).elim fun _ hr => hr.2.2 trivial

/-- Possible Infinity and BF at a type give the Axiom of Infinity there (the write-up for
`possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t`): were a finite cardinality to
hold of the universal property, which has no non-instances, then by Lemma B necessarily
one would hold of a property including it, hence, by Lemma A, of the universal property;
against the Axiom's possibility. -/
theorem possible_infinity_and_bf_imply_axiom_of_infinity {σ : Type} [Ty σ] (bf : Barcan σ) :
    ◇ (AxiomOfInfinity σ) → AxiomOfInfinity σ := fun hd h => h.elim fun Z hZ =>
  not_dia_of_box_not _ (modal_K _ _ (nec% (fun
      (h : ∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u : σ, True → X' u)
      (hn : AxiomOfInfinity σ) => h.elim fun Z' hZ' => hZ'.2.elim fun X' hX' =>
        hn ⟨Z', hZ'.1, finiteCardinality_coext Z' hZ'.1 X' _ hX'.1
          fun u => ⟨fun _ => trivial, fun _ => hX'.2 u trivial⟩⟩))
    (finite_count_necessary bf Z hZ.1 _ hZ.2 fun _ h => absurd trivial h)) hd

/-- `possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t`. -/
theorem possible_infinity_t_and_bf_t_imply_axiom_of_infinity_t :
    PossibleInfinityT → BarcanT → AxiomOfInfinityT :=
  fun hd bf => possible_infinity_and_bf_imply_axiom_of_infinity bf hd

/-- `possible-infinity-e-and-bf-imply-axiom-of-infinity-e`: the same at `e`. -/
theorem possible_infinity_e_and_bf_imply_axiom_of_infinity_e :
    PossibleInfinityE → Barcan e → AxiomOfInfinityE :=
  fun hd bf => possible_infinity_and_bf_imply_axiom_of_infinity bf hd

/-- `boolean-completeness-r-implies-countable-boolean-completeness-r`: every property has a
least upper bound, the greatest lower bound of its upper bounds (`lub_of_glb_ubs`), the
countable ones included. -/
theorem boolean_completeness_r_implies_countable_boolean_completeness_r
    {σ τ : Type} [Ty σ] [Rel τ] [Order τ] [Pointwise τ] :
    BooleanCompleteness τ → CountableBooleanCompleteness σ τ := fun bc X _ =>
  (bc (λ z ↦ UB z X)).elim fun y hy => ⟨y, lub_of_glb_ubs X y hy⟩


/-- `necessary-countable-boolean-completeness-r-implies-countable-boolean-completeness-r`:
`T`. -/
theorem necessary_countable_boolean_completeness_r_implies_countable_boolean_completeness_r
    {σ τ : Type} [Ty σ] [Rel τ] :
    NecCountableBooleanCompleteness σ τ → CountableBooleanCompleteness σ τ :=
  box_elim
/-- `necessary-boolean-completeness-r-implies-necessary-countable-boolean-completeness-r`: the
unboxed record, necessitated. -/
theorem necessary_boolean_completeness_r_implies_necessary_countable_boolean_completeness_r
    {σ τ : Type} [Ty σ] [Rel τ] [Order τ] [Pointwise τ] :
    NecBooleanCompleteness τ → NecCountableBooleanCompleteness σ τ :=
  modal_K _ _ (nec% (boolean_completeness_r_implies_countable_boolean_completeness_r
    (σ := σ) (τ := τ)))


/-- `necessary-atomlessness-implies-necessary-axiom-of-infinity-t`: the unboxed record,
necessitated. -/
theorem necessary_atomlessness_implies_necessary_axiom_of_infinity_t :
    NecAtomlessness → NecAxiomOfInfinityT :=
  modal_K _ _ (nec% atomlessness_implies_axiom_of_infinity_t)

end Classicism.Proofs
