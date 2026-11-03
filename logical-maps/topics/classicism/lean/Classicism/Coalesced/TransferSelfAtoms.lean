import Classicism.Coalesced.Transfer

/-!
# Atoms are self-atoms at `t`: the idempotent monoid, and the transfer to a coalesced root

- `Premodel.holds_aasaT_iff`, `holds_selfAtomicityT_imp`: the map's sentences, semantically.
- `Idem.not_aasaT`: Atoms are self-atoms (`t`) fails in the full model on the idempotent monoid.
- `SumData.not_holds_aasaT`, `not_holds_selfAtomicityT`: the group `coalesced-sums`'s argument
  `self-atomicity-component`. Some component has an atom `q` that is true at a world where it is
  no atom; the root proposition with part `q` there and empty elsewhere, false at the root, is an
  atom at the root, and along the distinguished arrow it becomes `q`.
-/

open CategoryTheory

namespace Classicism.Meta.Intensional.Premodel
variable {C : Type} [SmallCategory C] (B : Premodel Signature.pure C) (M : B.IsModel)

/-- An atom of propositions at an object: the propositions strictly below it are the empty one. -/
def AtomAt {V : C} (x : B.Dom V (.rel .t)) : Prop :=
  ∀ z : B.Dom V (.rel .t), (B.incl .t V z ⊆ B.incl .t V x ∧ B.incl .t V z ≠ B.incl .t V x) ↔ B.incl .t V z = ∅

theorem atomAt_iff_quoted {V : C} (x : B.Dom V (.rel .t)) :
    (∀ z : B.Dom V (.rel .t), B.incl .t V x = B.incl .t V z ∪ B.incl .t V x ∧ ¬ B.incl .t V z = B.incl .t V x ↔
      (B.incl .t V z)ᶜ = B.incl .t V z ∪ (B.incl .t V z)ᶜ) ↔ B.AtomAt x := by
  refine forall_congr' fun z => ?_
  rw [Set.union_compl_self, Set.compl_univ_iff, eq_comm, Set.union_eq_right]

include M

/-- **Atoms are self-atoms at `t`, semantically**: every atom at the base is nonempty and stays an
atom along every arrow to a world where it is true. -/
theorem holds_aasaT_iff : B.HoldsSentence P.AtomsAreSelfAtomsT.quoted ↔ ∀ x : B.Dom B.W₀ (.rel .t),
    B.AtomAt x → B.incl .t B.W₀ x ≠ ∅ ∧ ∀ {V : C} (k : B.W₀ ⟶ V),
      (⟨V, PUnit.unit, k⟩ : Tuple B.inner .t B.W₀) ∈ B.incl .t B.W₀ x →
        B.AtomAt (((B.inner (.rel .t)).map k) x) := by
  simp only [HoldsSentence, P.AtomsAreSelfAtomsT.quoted, B.holds_forall M, B.holds_imp M, B.holds_iff M,
    B.holds_conj M, B.holds_neg M, B.holds_box M]
  simp only [B.holds_eq M, B.sem_disj M, B.sem_neg M, B.sem_var, IEnv.get, B.sem_bot M, IEnv.get_map]
  simp only [B.atomAt_iff_quoted]
  have tr : ∀ {V : C} (k : B.W₀ ⟶ V) (x : B.Dom B.W₀ (.rel .t)),
      B.Holds (𝟙 B.W₀ ≫ k) (Term.var Var.zero) (B.push k (IEnv.cons x IEnv.nil)) ↔
        (⟨V, PUnit.unit, k⟩ : Tuple B.inner .t B.W₀) ∈ B.incl .t B.W₀ x := fun {V} k x => by
    rw [B.holds_var]
    show (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V) ∈ B.incl .t V (((B.inner (.rel .t)).map k) x) ↔ _
    rw [B.incl_map, Intension.mem_map, Category.comp_id]
  refine forall_congr' fun x => imp_congr_right fun _ => and_congr_right fun _ => ?_
  constructor
  · intro hb V k hk
    exact hb k fun himp => (fun h1 => h1.2 h1.1) (himp ((tr k x).2 hk))
  · intro hb V k hn
    refine hb k ((tr k x).1 (Classical.byContradiction fun hc => hn fun h => absurd h hc))

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Intensional.Idem

local notation "A" => MSet.model Idem

/-- **Atoms are self-atoms (`t`) fails** in the full model on the idempotent monoid: the atom
`{k}` becomes `{1, k}` along `k`, where it is true, and `{1}` is strictly below that. -/
theorem not_aasaT : ¬ (A).HoldsSentence P.AtomsAreSelfAtomsT.quoted := by
  intro H
  have Mo : (A).IsModel := MSet.model_isModel Idem
  obtain ⟨x, hx⟩ := MSet.model_full Idem .t (SingleObj.star Idem) {MSet.arrow Idem k}
  obtain ⟨o, ho⟩ := MSet.model_full Idem .t (SingleObj.star Idem) {MSet.arrow Idem 1}
  have hat : (A).AtomAt x := fun z => by
    show ((A).incl .t _ z ⊆ (A).incl .t _ x ∧ _) ↔ _
    rw [hx]
    constructor
    · rintro ⟨h1, h2⟩
      rcases Set.subset_singleton_iff_eq.1 h1 with h | h
      · exact h
      · exact absurd h h2
    · intro h; rw [h]
      exact ⟨Set.empty_subset _, fun e => (Set.singleton_ne_empty _) e.symm⟩
  have := (((A).holds_aasaT_iff Mo).1 H x hat).2 (V := SingleObj.star Idem) (k : SingleObj.star Idem ⟶ _)
    (by show MSet.arrow Idem k ∈ (A).incl .t _ x; rw [hx]; rfl)
  have e := (this o).1 ⟨fun t _ => ?_, fun e => ?_⟩
  · have : MSet.arrow Idem 1 ∈ (A).incl .t _ o := by rw [ho]; rfl
    rw [e] at this; exact this
  · rw [(A).incl_map, Intension.mem_map]
    change _ ∈ (A).incl .t (SingleObj.star Idem) x
    rw [hx]
    obtain ⟨⟨⟩, ⟨⟩, m⟩ := t
    show MSet.arrow Idem ((show Idem from m) * k) = MSet.arrow Idem k
    rw [mul_k]
  · have h1 : MSet.arrow Idem k ∈ (A).incl .t _ (((A).inner (.rel .t)).map (k : SingleObj.star Idem ⟶ _) x) := by
      rw [(A).incl_map, Intension.mem_map]
      change _ ∈ (A).incl .t (SingleObj.star Idem) x
      rw [hx]
      show MSet.arrow Idem (k * k) = MSet.arrow Idem k
      rw [mul_k]
    rw [← e, ho] at h1
    exact k_ne_one (MSet.arrow_injective Idem h1)

theorem not_aasaT_consistent :
    AxiomSet.Consistent (AxiomSet.single (Term.neg P.AtomsAreSelfAtomsT.quoted)) :=
  AxiomSet.Consistent.of_model _ (MSet.model_isModel Idem)
    (Premodel.holdsAx_single _ (((A).holdsSentence_neg (MSet.model_isModel Idem) _).2 not_aasaT))

end Classicism.Meta.Intensional.Idem

namespace Classicism.Meta.Intensional.Premodel
variable {C : Type} [SmallCategory C] (B : Premodel Signature.pure C) (M : B.IsModel)
include M

/-- **Self-Atomicity at `t`, semantically** (the direction used). -/
theorem holds_selfAtomicityT_imp (H : B.HoldsSentence P.SelfAtomicityT.quoted)
    (p : B.Dom B.W₀ (.rel .t)) (hp : B.incl .t B.W₀ p ≠ ∅) : ∃ x : B.Dom B.W₀ (.rel .t),
      B.incl .t B.W₀ x ≠ ∅ ∧ B.incl .t B.W₀ x ⊆ B.incl .t B.W₀ p ∧ ∀ {V : C} (k : B.W₀ ⟶ V),
        (⟨V, PUnit.unit, k⟩ : Tuple B.inner .t B.W₀) ∈ B.incl .t B.W₀ x →
          B.AtomAt (((B.inner (.rel .t)).map k) x) := by
  simp only [HoldsSentence, P.SelfAtomicityT.quoted, B.holds_forall M, B.holds_imp M, B.holds_iff M,
    B.holds_conj M, B.holds_neg M, B.holds_box M, B.holds_exists M] at H
  simp only [B.holds_eq M, B.sem_disj M, B.sem_neg M, B.sem_var, IEnv.get, B.sem_bot M, IEnv.get_map] at H
  simp only [B.atomAt_iff_quoted] at H
  obtain ⟨x, ⟨h0, hb⟩, hle⟩ := H p hp
  refine ⟨x, h0, (eq_comm.trans Set.union_eq_right).1 hle, fun {V} k hk => hb k fun himp => ?_⟩
  have h1 := himp (by
    rw [B.holds_var]
    show (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V) ∈ B.incl .t V (((B.inner (.rel .t)).map k) x)
    rw [B.incl_map, Intension.mem_map, Category.comp_id]; exact hk)
  exact h1.2 h1.1

omit M in
theorem AtomAt.ne_empty {B : Premodel Signature.pure C} {V : C} {x : B.Dom V (.rel .t)} (h : B.AtomAt x) :
    B.incl .t V x ≠ ∅ := fun e => ((h x).2 e).2 rfl

end Classicism.Meta.Intensional.Premodel


namespace Classicism.Meta.Coalesced.SumData

open CategoryTheory.Sigma Classicism.Meta.Intensional

variable {D : SumData} (hD : D.DistinguishedArrows)
include hD

omit hD in
/-- An atom of the sum at a component object is an atom of the component. -/
theorem atomAt_of_sum {k : D.ι} {V : D.C k}
    (y : (D.A k).reduct.Dom V (.rel .t))
    (h : D.model.reduct.AtomAt (V := CoalescedSum.of ⟨k, V⟩) y) : (D.A k).reduct.AtomAt y := fun z => by
  have hz := h z
  have sub : ∀ X Y : Intension (D.A k).inner .t V,
      (D.RA.ofCompI X ⊆ D.RA.ofCompI Y ↔ X ⊆ Y) := fun X Y =>
    ⟨fun e p hp => by
      rw [← D.RA.compI_ofCompI Y]; rw [← D.RA.compI_ofCompI X] at hp; exact e hp,
     fun e _ hp => e hp⟩
  have inj : ∀ X Y : Intension (D.A k).inner .t V, D.RA.ofCompI X = D.RA.ofCompI Y ↔ X = Y := fun X Y =>
    ⟨fun e => by rw [← D.RA.compI_ofCompI X, e, D.RA.compI_ofCompI], fun e => e ▸ rfl⟩
  have emp : ∀ X : Intension (D.A k).inner .t V, D.RA.ofCompI X = (∅ : Set _) ↔ X = ∅ := fun X =>
    ⟨fun e => by
      rw [← D.RA.compI_ofCompI X, e]; rfl,
     fun e => by subst e; rfl⟩
  change (D.RA.ofCompI ((D.A k).incl .t V z) ⊆ D.RA.ofCompI ((D.A k).incl .t V y) ∧
    D.RA.ofCompI ((D.A k).incl .t V z) ≠ D.RA.ofCompI ((D.A k).incl .t V y)) ↔
      D.RA.ofCompI ((D.A k).incl .t V z) = ∅ at hz
  rw [sub, ne_eq, inj, emp] at hz
  exact hz

/-- The root proposition of an atom of a component is an atom at the root. -/
theorem atomAt_single (hF : D.FullestDomains) {k : D.ι} (q : (D.A k).Dom (D.A k).W₀ (.rel .t))
    (hq : (D.A k).reduct.AtomAt (V := (D.A k).W₀) q) :
    D.model.reduct.AtomAt (V := CoalescedSum.base D.S) (single hD hF k q) := fun z => by
  have hq0 : (D.A k).incl .t _ q ≠ ∅ := Premodel.AtomAt.ne_empty hq
  change (D.RI.incl _ z ⊆ D.RI.incl _ (single hD hF k q) ∧ D.RI.incl _ z ≠ D.RI.incl _ (single hD hF k q)) ↔
    D.RI.incl _ z = ∅
  constructor
  · rintro ⟨h1, h2⟩
    have eq := eq_single_of_subset hD hF k q z h1
    rw [eq] at h2 ⊢
    rw [ne_eq, single_eq_iff] at h2
    rw [single_eq_empty_iff]
    have hsub := (subset_single_iff hD hF k q z).1 h1
    exact (hq (D.RA.tr _ (distArrow hD k) z)).1 ⟨hsub.2.2, h2⟩
  · intro h
    rw [h]
    exact ⟨Set.empty_subset _, fun e => hq0 ((single_eq_empty_iff hD hF k q).1 e.symm)⟩

/-- A root proposition with the inclusion of the single-component copy of `q` is not a self-atom,
where `q` is true along `l` and no atom there. -/
theorem not_selfAtom_single (hF : D.FullestDomains) {k : D.ι} (q : (D.A k).Dom (D.A k).W₀ (.rel .t))
    {V : D.C k} (l : (D.A k).W₀ ⟶ V)
    (hl : (⟨V, PUnit.unit, l⟩ : Tuple (D.A k).inner .t (D.A k).W₀) ∈ (D.A k).incl .t _ q)
    (hn : ¬ (D.A k).reduct.AtomAt (V := V) (((D.A k).inner (.rel .t)).map l q))
    (H : ∀ {U : CoalescedSum D.S} (r : CoalescedSum.base D.S ⟶ U),
      (⟨U, PUnit.unit, r⟩ : Tuple D.RA.inner .t (CoalescedSum.base D.S)) ∈ D.RI.incl .t (single hD hF k q) →
        D.model.reduct.AtomAt (V := U) ((D.RA.inner (.rel .t)).map r (single hD hF k q))) : False := by
  let r₀ := D.S.R.map (SigmaHom.mk l) (distArrow hD k)
  have hfac : fac hD r₀ = l := by
    show fac hD (D.S.R.map (SigmaHom.mk l) (distArrow hD k)) = l
    rw [fac_map, fac_distArrow, Category.id_comp]
  have hmem := (mem_incl_of hD (single hD hF k q) (k := k) (U := V) PUnit.unit r₀).2 (by
    rw [tr_single_self, hfac]; exact hl)
  have := H (CoalescedSum.arr D.S r₀) hmem
  have h2 := atomAt_of_sum (D := D) (k := k) (V := V) _ this
  refine hn ?_
  have e : (D.RA.inner (.rel .t)).map (CoalescedSum.arr D.S r₀) (single hD hF k q) =
      ((D.A k).inner (.rel .t)).map l q := by
    have := tr_eq hD (.rel .t) r₀ (single hD hF k q)
    rw [tr_single_self, hfac] at this
    exact this
  rw [e] at h2
  exact h2

/-- A component's counterexample to Atoms are self-atoms at `t`. -/
theorem exists_comp_aasaT (hc : D.CompleteComponents) : ∃ (k : D.ι) (q : (D.A k).Dom (D.A k).W₀ (.rel .t))
    (V : D.C k) (l : (D.A k).W₀ ⟶ V), (D.A k).reduct.AtomAt (V := (D.A k).W₀) q ∧
      (⟨V, PUnit.unit, l⟩ : Tuple (D.A k).inner .t (D.A k).W₀) ∈ (D.A k).incl .t _ q ∧
      ¬ (D.A k).reduct.AtomAt (V := V) (((D.A k).inner (.rel .t)).map l q) := by
  obtain ⟨k, hk⟩ := exists_comp hD hc (q := P.AtomsAreSelfAtomsT.quoted) (by decide) Idem.not_aasaT_consistent
  rw [Premodel.holds_aasaT_iff _ (compRoot_isModel hD k)] at hk
  by_contra hn
  refine hk fun q hq => ⟨Premodel.AtomAt.ne_empty hq, fun {V} l hl => ?_⟩
  exact Classical.byContradiction fun hb => hn ⟨k, q, V, l, hq, hl, hb⟩

/-- **Atoms are self-atoms at `t` fails at the root.** -/
theorem not_holds_aasaT (hF : D.FullestDomains) (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.AtomsAreSelfAtomsT.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  obtain ⟨k, q, V, l, hq, hl, hn⟩ := exists_comp_aasaT hD hc
  have H0 := (D.model.reduct.holds_aasaT_iff root_isModel).1 (H _ rfl) (single hD hF k q)
    (atomAt_single hD hF q hq)
  exact not_selfAtom_single hD hF q l hl hn H0.2

/-- **Self-Atomicity at `t` fails at the root**: what is below the atom and possible is the atom. -/
theorem not_holds_selfAtomicityT (hF : D.FullestDomains) (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.SelfAtomicityT.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  obtain ⟨k, q, V, l, hq, hl, hn⟩ := exists_comp_aasaT hD hc
  have hat := atomAt_single hD hF q hq
  obtain ⟨x, hx0, hle, hx⟩ := D.model.reduct.holds_selfAtomicityT_imp root_isModel (H _ rfl)
    (single hD hF k q) (Premodel.AtomAt.ne_empty hat)
  by_cases e : D.RI.incl .t x = D.RI.incl .t (single hD hF k q)
  · have : x = single hD hF k q := D.RI.incl_injective _ e
    subst this
    exact not_selfAtom_single hD hF q l hl hn hx
  · exact hx0 ((hat x).1 ⟨hle, e⟩)

end Classicism.Meta.Coalesced.SumData
