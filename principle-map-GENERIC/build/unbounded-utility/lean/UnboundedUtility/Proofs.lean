import UnboundedUtility.Statements
import Mathlib.Analysis.SpecificLimits.Basic

/-!
# Checked implications

Each theorem inhabits the statement generated from the map's YAML. Unfinished results
are left as uninhabited statement definitions; no `sorry` or custom axioms are used.
-/
open MeasureTheory Set UnboundedUtility.Gamble
noncomputable section
namespace UnboundedUtility
namespace Proofs

lemma integrable_finite_range {f : Sample → ℝ} (hm : Measurable f)
    (hf : (range f).Finite) : Integrable f := by
  obtain ⟨C, hC⟩ := (hf.image (fun x => ‖x‖)).bddAbove
  exact (integrable_const C).mono' hm.aestronglyMeasurable
    (Filter.Eventually.of_forall fun w => hC ⟨f w, mem_range_self w, rfl⟩)

theorem totality_restricts : Statements.totality_restricts := by
  intro O _ _ P _ h X Y _ _
  exact h X Y

theorem stochastic_equivalence_restricts : Statements.stochastic_equivalence_restricts := by
  intro O _ _ P _ h X Y _ _ hLaw
  exact h X Y hLaw

theorem archimedean_gambles_restricts : Statements.archimedean_gambles_restricts := by
  intro O _ _ P _ h a b c hab hbc
  exact h (sure a) (sure b) (sure c) hab hbc

theorem simple_eu_implies_restricted_totality : Statements.simple_eu_implies_restricted_totality := by
  intro O _ _ P _ h X Y hX hY
  obtain ⟨u, _, _, hu⟩ := h
  rcases le_total (∫ w, u (Y w)) (∫ w, u (X w)) with hle | hle
  · exact Or.inl ((hu X Y hX hY).mpr hle)
  · exact Or.inr ((hu Y X hY hX).mpr hle)

theorem expected_utility_implies_simple : Statements.expected_utility_implies_simple := by
  intro O _ _ P _ h
  obtain ⟨u, hm, hc, hu⟩ := h
  refine ⟨u, hm, hc, ?_⟩
  intro X Y hX hY
  apply hu X Y
  · apply integrable_finite_range (hm.comp X.measurable)
    exact (hX.image u).subset (by rintro _ ⟨w, rfl⟩; exact ⟨X w, mem_range_self w, rfl⟩)
  · apply integrable_finite_range (hm.comp Y.measurable)
    exact (hY.image u).subset (by rintro _ ⟨w, rfl⟩; exact ⟨Y w, mem_range_self w, rfl⟩)

theorem simple_eu_implies_restricted_equivalence : Statements.simple_eu_implies_restricted_equivalence := by
  intro O _ _ P _ h X Y hX hY hLaw
  obtain ⟨u, hm, _, hu⟩ := h
  have heq : (∫ w, u (X w)) = ∫ w, u (Y w) := by
    rw [← integral_map_of_stronglyMeasurable X.measurable hm.stronglyMeasurable,
      ← integral_map_of_stronglyMeasurable Y.measurable hm.stronglyMeasurable]
    change (∫ o, u o ∂X.law) = ∫ o, u o ∂Y.law
    rw [hLaw]
  exact ⟨(hu X Y hX hY).mpr heq.ge, (hu Y X hY hX).mpr heq.le⟩

theorem dominance_implies_equivalence : Statements.dominance_implies_equivalence := by
  intro O _ _ P _ h X Y hLaw
  have heq (o : O) : volume {w | o < X w} = volume {w | o < Y w} := by
    have hx := Measure.map_apply (μ := volume) X.measurable (P.measurableSet_Ioi o)
    have hy := Measure.map_apply (μ := volume) Y.measurable (P.measurableSet_Ioi o)
    change X.law (Ioi o) = _ at hx
    change Y.law (Ioi o) = _ at hy
    rw [hLaw] at hx
    exact hx.symm.trans hy
  exact ⟨(h X Y (fun o => (heq o).ge)).1, (h Y X (fun o => (heq o).le)).1⟩

theorem positive_affine_implies_shift : Statements.positive_affine_implies_shift := by
  intro O _ _ P _ h X Y X' Y' b hx hy
  exact h X Y X' Y' 1 b zero_lt_one hx hy

theorem positive_affine_implies_scale : Statements.positive_affine_implies_scale := by
  intro O _ _ P _ h X Y X' Y' a ha hx hy
  exact h X Y X' Y' a 0 ha hx hy

theorem negative_affine_implies_reflection : Statements.negative_affine_implies_reflection := by
  intro O _ _ P _ h X Y X' Y' hx hy
  exact h X Y X' Y' 1 0 zero_lt_one hx hy

theorem full_sum_implies_independent : Statements.full_sum_implies_independent := by
  intro O _ _ P _ h X Y Z XZ YZ hx hy _
  exact h X Y Z XZ YZ hx hy

theorem full_sum_implies_comonotonic : Statements.full_sum_implies_comonotonic := by
  intro O _ _ P _ h X Y Z XZ YZ hx hy _ _
  exact h X Y Z XZ YZ hx hy

theorem full_sum_implies_antitonic : Statements.full_sum_implies_antitonic := by
  intro O _ _ P _ h X Y Z XZ YZ hx hy _ _
  exact h X Y Z XZ YZ hx hy

theorem full_sum_implies_universal_copula : Statements.full_sum_implies_universal_copula := by
  intro O _ _ P _ h C X Y Z XZ YZ hx hy _ _
  exact h X Y Z XZ YZ hx hy

theorem independent_sum_implies_cancellation : Statements.independent_sum_implies_cancellation := by
  intro O _ _ P _ h X Y Z XZ YZ hx hy hi
  exact (h X Y Z XZ YZ hx hy hi).mpr

lemma independentNoise_swap {O : Type*} [MeasurableSpace O] [LinearOrder O]
    {P : Pref O} {X Y Z : Numeric P} (h : X.IndependentNoise Y Z) : Y.IndependentNoise X Z := by
  simpa [Numeric.IndependentNoise, Function.comp_def] using
    (h.comp measurable_id measurable_swap)

theorem independent_sum_implies_preservation : Statements.independent_sum_implies_preservation := by
  intro O _ _ P _ h X Y Z XZ YZ hx hy hi
  refine ⟨(h X Y Z XZ YZ hx hy hi).mp, ?_⟩
  rintro ⟨hxy, hnyx⟩
  exact ⟨(h X Y Z XZ YZ hx hy hi).mp hxy,
    fun hyx => hnyx ((h Y X Z YZ XZ hy hx (independentNoise_swap hi)).mpr hyx)⟩

theorem preservation_cancellation_imply_independent_sum : Statements.preservation_cancellation_imply_independent_sum := by
  intro O _ _ P _ hp hc X Y Z XZ YZ hx hy hi
  exact ⟨(hp X Y Z XZ YZ hx hy hi).1, hc X Y Z XZ YZ hx hy hi⟩

theorem total_preservation_implies_independent_cancellation : Statements.total_preservation_implies_independent_cancellation := by
  intro O _ _ P _ ht hp X Y Z XZ YZ hx hy hi hz
  by_contra hn
  have hyx : Y.gamble ≽[P] X.gamble := (ht X.gamble Y.gamble).resolve_left hn
  have hs := (hp Y X Z YZ XZ hy hx (independentNoise_swap hi)).2 ⟨hyx, hn⟩
  exact hs.2 hz

/-- The independent copula witnesses that the quantifier over copulas is nonempty. -/
def independentCopula : Copula where
  measure := (volume : Measure Sample).prod volume
  probability := inferInstance
  fst_uniform := by simp
  snd_uniform := by simp

theorem universal_copula_implies_existential : Statements.universal_copula_implies_existential := by
  intro O _ _ P _ h
  exact ⟨independentCopula, h independentCopula⟩

theorem relative_implies_simple_relative : Statements.relative_implies_simple_relative := by
  intro O _ _ P _ h X Y hFinite
  exact h X Y (integrable_finite_range (X.measurable.sub Y.measurable) hFinite)

theorem totality_independence_negative_affine_imply_self_similarity :
    Statements.totality_independence_negative_affine_imply_self_similarity := by
  intro O _ _ P _ ht hi hn X Y X' Y' Z p a b hp hp1 ha hx hy hfixX hfixY
  have reverse (hxy : X.gamble ≽[P] Y.gamble) : Y.gamble ≽[P] X.gamble := by
    have hneg := (hn X Y X' Y' a b ha hx hy).mp hxy
    have hm := (hi Y'.gamble X'.gamble Z p hp hp1).mp hneg
    exact P.pref_trans hfixY.1 (P.pref_trans hm hfixX.2)
  have forward (hyx : Y.gamble ≽[P] X.gamble) : X.gamble ≽[P] Y.gamble := by
    have hneg := (hn Y X Y' X' a b ha hy hx).mp hyx
    have hm := (hi X'.gamble Y'.gamble Z p hp hp1).mp hneg
    exact P.pref_trans hfixX.1 (P.pref_trans hm hfixY.2)
  rcases ht X.gamble Y.gamble with hxy | hyx
  · exact ⟨hxy, reverse hxy⟩
  · exact ⟨forward hyx, hyx⟩

theorem l1_implies_vanishing_shift_continuity : Statements.l1_implies_vanishing_shift_continuity := by
  intro O _ _ P _ h X Y hshift
  classical
  let eps : ℕ → ℝ := fun n => 1 / ((n : ℝ) + 1)
  have hpos (n : ℕ) : 0 < eps n := by dsimp [eps]; positivity
  choose Xs hXs using fun n => hshift (eps n) (hpos n)
  have hdist (n : ℕ) : (Xs n).distance X = ENNReal.ofReal (eps n) := by
    unfold Numeric.distance
    calc
      _ = ∫⁻ _ : Sample, ENNReal.ofReal (eps n) := by
        apply lintegral_congr
        intro w
        rw [(hXs n).1 w]
        simp [abs_of_pos (hpos n)]
      _ = _ := by simp
  apply h Xs X Y
  · simp_rw [hdist]
    simpa only [ENNReal.ofReal_zero] using
      ENNReal.tendsto_ofReal (tendsto_one_div_add_atTop_nhds_zero_nat (𝕜 := ℝ))
  · exact fun n => (hXs n).2

theorem symmetry_implies_negative_self_similarity : Statements.symmetry_implies_negative_self_similarity := by
  intro O _ _ P _ _ ht _ _ _ hi hn
  exact totality_independence_negative_affine_imply_self_similarity P ht hi hn

end Proofs
end UnboundedUtility
