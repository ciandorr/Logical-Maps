import Classicism.Coalesced.Transfer

/-!
# Boolean Completeness at `t`: the truncation model, and the transfer to a coalesced root

- `Premodel.holds_bcT_iff`: the map's Boolean Completeness at `t` (`P.BooleanCompletenessT`,
  written with `q = p ∨ q` for `p ≤ q`) is `Sentence.bc t` semantically.
- `Monoids.Truncs.not_bcT`: it fails in the truncation model of Appendix D, Part 6
  (`finite-support-truncations`), on the even truncation singletons (the record's argument, in
  its greatest-lower-bound form).
- `SumData.not_holds_bcT`: the group `coalesced-sums`'s argument `boolean-completeness-t-component`.
  Some component refutes it at its root with a property `X` of propositions; the root property
  holding exactly of the single-component copies of `X`'s members has the copies of `X`'s lower
  bounds as its lower bounds (inclusion with a single-component entity being componentwise), so a
  greatest lower bound at the root would give one of `X`, its part in that component.
-/

open CategoryTheory Classicism.Meta.Intensional.MonoidModel

namespace Classicism.Meta.Intensional.Premodel

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C) (M : A.IsModel)
include M

/-- `b = a ∨ b`, for propositions, is `a ≤ b`. -/
theorem holds_eq_disj {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) (a b : Formula Sig Γ) :
    A.Holds h (Term.eq' b (Term.disj a b)) g ↔ A.Holds h (Term.leR .t a b) g := by
  rw [A.holds_leR M, A.holds_eq M, A.sem_disj M]; exact eq_comm.trans Set.union_eq_right

omit M in
/-- The map's Boolean Completeness at `t` is the sentence `Sentence.bc t`, semantically. -/
theorem holds_bcT_iff {B : Premodel Signature.pure C} (M : B.IsModel) {W : C} (h : B.W₀ ⟶ W) :
    B.Holds h P.BooleanCompletenessT.quoted .nil ↔ B.Holds h (Sentence.bc .t) .nil := by
  simp only [P.BooleanCompletenessT.quoted, Sentence.bc, B.holds_forall M, B.holds_exists M,
    B.holds_iff M, B.holds_imp M, B.holds_eq_disj M]

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Intensional.Monoids.Truncs

/-- The propositions including every `{gₙ}` with `n` even, as a property of propositions. It
does not look at the arrow. -/
abbrev evenBounds : Intension (model truncs).inner (.arr (.rel .t) .t) (star truncs) :=
  {t | ∀ n, Even n → (⟨t.1, PUnit.unit, ((g n : truncs) : t.1 ⟶ t.1)⟩ : Tuple (model truncs).inner .t t.1) ∈
    (model truncs).incl .t t.1 t.2.1.1}

/-- **Boolean Completeness at `t` fails** in the truncation model, on the even truncation
singletons: a greatest lower bound of their upper bounds, pinned down below `M`, contains every
`gₙ` with `n ≥ M`, but the proposition that `g (m + 1)` is even or `m + 1`, for an odd `m ≥ M`,
is an upper bound without `g_m`. -/
theorem not_bcT : ¬ (model truncs).HoldsSentence P.BooleanCompletenessT.quoted := by
  have Mo : (model truncs).IsModel := model_isModel truncs
  intro H
  rw [Premodel.HoldsSentence, (model truncs).holds_bcT_iff Mo, (model truncs).holds_bc_iff Mo] at H
  obtain ⟨X, hX⟩ := Premodel.ideal_pinned_inner (natAction truncs) (.arr (.rel .t) .t) (star truncs)
    evenBounds ⟨∅, Set.finite_empty, fun _ _ _ _ => rfl⟩
  obtain ⟨y, hy⟩ := H X
  have hX' : (model truncs).incl _ (star truncs) X = evenBounds := hX
  -- each even singleton is below `y`
  have hev : ∀ n, Even n → tup (g n) ∈ (model truncs).Incl _ (star truncs) y := by
    intro n hn
    obtain ⟨z, hz⟩ := exists_inner (M := truncs) (q := {tup (g n)}) ⟨_, Set.toFinite _, g_pinned n⟩
    have hzy := (hy z).1 fun u hu => by
      have hu' : _ ∈ evenBounds := hX' ▸ hu
      show (model truncs).Incl _ (star truncs) z ⊆ (model truncs).Incl _ (star truncs) u
      rw [hz]
      rintro t rfl
      exact hu' n hn
    exact hzy (by change tup (g n) ∈ (model truncs).Incl _ (star truncs) z; rw [hz]; rfl)
  have hyle := (hy y).2 subset_rfl
  obtain ⟨N, hN, hpin⟩ := finPinned'_Incl y
  obtain ⟨M₀, hM⟩ := exists_bound hN
  let m := 2 * M₀ + 1
  obtain ⟨u, hu⟩ := exists_inner (M := truncs)
    (q := ofPred fun k : truncs => Even ((k : F) (m + 1)) ∨ (k : F) (m + 1) = m + 1)
    ⟨{m + 1}, Set.finite_singleton _, ofPred_pinned (M := truncs) _ _ fun (k k' : truncs) ha => by
      rw [show (k : F) (m + 1) = (k' : F) (m + 1) from ha (m + 1) rfl]⟩
  have hsub := hyle u (by
    show _ ∈ (model truncs).incl _ (star truncs) X
    rw [hX']
    intro n hn
    show tup (g n) ∈ (model truncs).Incl _ (star truncs) u
    rw [hu]
    show Even (min (m + 1) n) ∨ min (m + 1) n = m + 1
    rcases le_total n (m + 1) with h | h
    · exact Or.inl (by rw [min_eq_right h]; exact hn)
    · exact Or.inr (min_eq_left h))
  have hm : tup (g m) ∈ (model truncs).Incl _ (star truncs) y :=
    (mem_iff_of_pinned hpin fun x hx => by
      show min x m = min x (m + 1)
      have := hM x hx; omega).2 (hev (m + 1) ⟨M₀ + 1, by omega⟩)
  have := hsub hm
  change tup (g m) ∈ (model truncs).Incl _ (star truncs) u at this
  rw [hu] at this
  change Even (min (m + 1) m) ∨ min (m + 1) m = m + 1 at this
  rw [min_eq_right (by omega)] at this
  rcases this with h | h
  · exact (Nat.not_even_iff_odd.2 ⟨M₀, rfl⟩) h
  · omega

end Classicism.Meta.Intensional.Monoids.Truncs

namespace Classicism.Meta.Intensional.Monoids.Truncs

theorem not_bcT_consistent :
    AxiomSet.Consistent (AxiomSet.single (Term.neg P.BooleanCompletenessT.quoted)) :=
  AxiomSet.Consistent.of_model _ (model_isModel truncs)
    (Premodel.holdsAx_single _ (((model truncs).holdsSentence_neg (model_isModel truncs) _).2 not_bcT))

end Classicism.Meta.Intensional.Monoids.Truncs

namespace Classicism.Meta.Coalesced.SumData

open CategoryTheory.Sigma Classicism.Meta.Intensional

variable {D : SumData} (hD : D.DistinguishedArrows)
include hD

/-- **Boolean Completeness at `t` fails at the root** (`boolean-completeness-t-component`): a
component refutes it at its root with a property `X` of propositions (the truncation model shows
`¬BC_t` consistent with `C`); a greatest lower bound at the root of the property holding of the
single-component copies of `X`'s members would have as its part a greatest lower bound of `X`. -/
theorem not_holds_bcT (hF : D.FullestDomains) (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.BooleanCompletenessT.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  have H0 : D.model.reduct.HoldsSentence P.BooleanCompletenessT.quoted := H _ rfl
  obtain ⟨k, hk⟩ := exists_comp hD hc (q := P.BooleanCompletenessT.quoted) (by decide)
    Monoids.Truncs.not_bcT_consistent
  change ¬ (D.A k).reduct.Holds (𝟙 _) P.BooleanCompletenessT.quoted .nil at hk
  rw [Premodel.holds_bcT_iff (compRoot_isModel hD k), Premodel.holds_bc_iff _ (compRoot_isModel hD k)] at hk
  rw [Premodel.HoldsSentence, Premodel.holds_bcT_iff root_isModel, Premodel.holds_bc_iff _ root_isModel] at H0
  refine hk fun (X : (D.A k).Dom (D.A k).W₀ (.rel (.arr (.rel .t) .t))) => ?_
  -- the root property of the single-component copies of `X`'s members
  let E : Set (Args D.RA.inner (.arr (.rel .t) .t) (CoalescedSum.base D.S)) :=
    {a | ∃ v : (D.A k).Dom (D.A k).W₀ (.rel .t),
      (⟨(D.A k).W₀, (v, PUnit.unit), 𝟙 _⟩ : Tuple (D.A k).inner (.arr (.rel .t) .t) _) ∈
        (D.A k).incl _ _ X ∧ D.RI.incl _ a.1 = D.RI.incl _ (single hD hF k v)}
  obtain ⟨y, hy⟩ := H0 (thread hD hF E (emptyPart hD _))
  refine ⟨D.RA.tr _ (distArrow hD k) y, fun (w : (D.A k).Dom (D.A k).W₀ (.rel .t)) => ?_⟩
  refine Iff.trans ?_ ((hy (single hD hF k w)).trans (single_subset_iff hD hF k w y))
  constructor
  · intro hlow u hu
    obtain ⟨v, hv, hveq⟩ := (mem_thread_root hD hF E (emptyPart hD _) (u, PUnit.unit) D.S.one).1 hu
    change D.RI.incl _ u = _ at hveq
    show D.RI.incl _ (single hD hF k w) ⊆ D.RI.incl _ u
    rw [hveq, single_subset_iff, tr_single_self]
    exact hlow v hv
  · intro hlow (v : (D.A k).Dom (D.A k).W₀ (.rel .t)) hv
    have := hlow (single hD hF k v) ((mem_thread_root hD hF E (emptyPart hD _) _ D.S.one).2 ⟨v, hv, rfl⟩)
    change D.RI.incl _ (single hD hF k w) ⊆ D.RI.incl _ (single hD hF k v) at this
    rwa [single_subset_iff, tr_single_self] at this

end Classicism.Meta.Coalesced.SumData
