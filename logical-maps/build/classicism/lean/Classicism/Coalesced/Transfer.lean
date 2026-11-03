import Classicism.Coalesced.SumData
import Classicism.Results.Consistency.Consistency

/-!
# Transfer from a component to the root

The shared step of the group `coalesced-sums`'s transfer arguments. Over the distinguished
arrows (`SumData.DistinguishedArrows`) with the fullest root domains
(`SumData.FullestDomains`), a root entity of a relational type is given by its extension at the
root and its part in each component, the transport along the distinguished arrow into it, all
chosen freely:

* every root arrow `r` into a component factors uniquely through the distinguished arrow, as
  `fac r` (`map_fac`, `fac_map`, `fac_distArrow`), so a root entity's transport along `r` is its part
  in the component moved along `fac r` (`tr_eq`), and a tuple at a component object belongs to
  the root entity iff it belongs to its part there (`mem_incl_of`);
* **the thread** (`thread`): for a set `E` of arguments at the root and a part `y k` at the root
  of each component, the root entity with extension `E` at the root and part `y k` in the
  component `k` (`mem_thread_root`, `tr_thread`). Its intension lands, its transport along `r`
  being `y k` moved along `fac r`, so it is a root entity, the root domains being the fullest.

The arguments then refute a principle at the root with a thread built from a counterexample
at the root of some component, which there is by `complete-components` (`SumData.exists_comp`).
-/


/-! ### Top and bottom -/

namespace Classicism.Meta.Intensional.Premodel

open CategoryTheory

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C) (M : A.IsModel)
include M

/-- `⊤_ρ`'s value is every tuple. -/
theorem exists_incl_univ {W : C} (h : A.W₀ ⟶ W) (ρ : RTy) :
    ∃ x : A.Dom W (.rel ρ), A.incl ρ W x = Set.univ := by
  obtain ⟨x, hx⟩ := M h (Term.topR (Sig := Sig) (Γ := []) ρ) .nil
  obtain ⟨q, hq⟩ := M h (Term.top (Sig := Sig) (Γ := [])) .nil
  refine ⟨x, ?_⟩
  have hq' : A.incl .t W q = Set.univ := hq.trans (A.sem_top M h .nil)
  have e : A.Incl (.rel ρ) W x = A.apply (A.constRead ρ W) (A.Incl (.rel .t) W q) := by
    rw [hx, hq]; rfl
  rw [A.apply_Incl, A.app_constRead] at e
  refine e.trans (Set.eq_univ_of_forall fun p => ?_)
  show (⟨p.1, PUnit.unit, p.2.2⟩ : Tuple A.inner .t W) ∈ A.incl .t W q
  rw [hq']; trivial

/-- `⊥_ρ`'s value is no tuple. -/
theorem exists_incl_empty {W : C} (h : A.W₀ ⟶ W) (ρ : RTy) :
    ∃ x : A.Dom W (.rel ρ), A.incl ρ W x = ∅ := by
  obtain ⟨x, hx⟩ := M h (Term.botR (Sig := Sig) (Γ := []) ρ) .nil
  obtain ⟨q, hq⟩ := M h (Term.bot (Sig := Sig) (Γ := [])) .nil
  refine ⟨x, ?_⟩
  have hq' : A.incl .t W q = ∅ := hq.trans (A.sem_bot M h .nil)
  have e : A.Incl (.rel ρ) W x = A.apply (A.constRead ρ W) (A.Incl (.rel .t) W q) := by
    rw [hx, hq]; rfl
  rw [A.apply_Incl, A.app_constRead] at e
  refine e.trans (Set.eq_empty_of_forall_notMem fun p hp => ?_)
  change (⟨p.1, PUnit.unit, p.2.2⟩ : Tuple A.inner .t W) ∈ A.incl .t W q at hp
  rw [hq'] at hp; exact hp

/-- **`BF_σ` at an object**: every property that holds, along every arrow, of the image of every
entity there holds of everything along every arrow. -/
theorem holds_bf_iff (σ : Ty) {W : C} (h : A.W₀ ⟶ W) :
    A.Holds h (Sentence.bf σ) .nil ↔ ∀ X : A.Dom W (.rel (σ ⇒ RTy.t)),
      (∀ (y : A.Dom W σ) {V : C} (l : W ⟶ V),
        (⟨V, ((A.inner σ).map l y, PUnit.unit), l⟩ : Tuple A.inner (σ ⇒ RTy.t) W) ∈ A.incl _ W X) →
      ∀ {V : C} (l : W ⟶ V) (a : A.Dom V σ),
        (⟨V, (a, PUnit.unit), l⟩ : Tuple A.inner (σ ⇒ RTy.t) W) ∈ A.incl _ W X := by
  simp only [Sentence.bf, A.holds_forall M, A.holds_imp M, A.holds_box M]
  refine forall_congr' fun X => imp_congr (forall_congr' fun y => ?_) ?_
  · exact ⟨fun H V l => (A.holds_app_push h l X _ .nil).1 (H l),
      fun H V l => (A.holds_app_push h l X _ .nil).2 (H l)⟩
  · exact ⟨fun H V l a => (A.holds_app_push h l X a .nil).1 (H l a),
      fun H V l a => (A.holds_app_push h l X a .nil).2 (H l a)⟩

omit M in
/-- **Atomicity at `ρ` at an object**: every relation there is empty or includes an atom, an atom
being a relation whose strictly included relations are exactly the empty ones. -/
theorem holds_atomicity_iff {B : Premodel Signature.pure C} (M : B.IsModel) {W : C} (h : B.W₀ ⟶ W)
    (ρ : RTy) : B.Holds h (P.Atomicity.quoted ρ) .nil ↔ ∀ x : B.Dom W (.rel ρ), B.incl ρ W x = ∅ ∨
      ∃ y : B.Dom W (.rel ρ), (∀ z : B.Dom W (.rel ρ),
        (B.incl ρ W z ⊆ B.incl ρ W y ∧ B.incl ρ W z ≠ B.incl ρ W y) ↔ B.incl ρ W z = ∅) ∧
        B.incl ρ W y ⊆ B.incl ρ W x := by
  simp only [P.Atomicity.quoted, B.holds_forall M, B.holds_disj M, B.holds_exists M, B.holds_conj M,
    B.holds_neg M, B.holds_eq M, B.sem_orR M, sem_negR M, sem_var, IEnv.get]
  have e1 : ∀ S : Set (Tuple B.inner ρ W), Sᶜ = S ∪ Sᶜ ↔ S = ∅ := fun S => by
    rw [Set.union_compl_self, Set.compl_univ_iff]
  have e3 : ∀ S T : Set (Tuple B.inner ρ W), T = S ∪ T ↔ S ⊆ T := fun S T =>
    eq_comm.trans Set.union_eq_right
  simp only [e1, e3]
  refine forall_congr' fun x => or_congr Iff.rfl (exists_congr fun y =>
    and_congr (forall_congr' fun z => ?_) Iff.rfl)
  tauto

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

namespace SumData

variable {D : SumData} (hD : D.DistinguishedArrows)
include hD

/-! ### The distinguished arrows and the factorization through them -/

/-- The distinguished arrow from the root to the root of the component `k`. -/
noncomputable def distArrow (k : D.ι) : D.S.R.obj ⟨k, (D.A k).W₀⟩ := Classical.choose (hD.2 k)

theorem distArrow_spec (k : D.ι) (V : D.C k) (r : D.S.R.obj ⟨k, V⟩) :
    ∃! j : (D.A k).W₀ ⟶ V, D.S.R.map (SigmaHom.mk j) (distArrow hD k) = r :=
  Classical.choose_spec (hD.2 k) V r

/-- A root arrow `r` into a component is the distinguished arrow followed by `fac r`. -/
noncomputable def fac {k : D.ι} {V : D.C k} (r : D.S.R.obj ⟨k, V⟩) : (D.A k).W₀ ⟶ V :=
  (distArrow_spec hD k V r).exists.choose

theorem map_fac {k : D.ι} {V : D.C k} (r : D.S.R.obj ⟨k, V⟩) :
    D.S.R.map (SigmaHom.mk (fac hD r)) (distArrow hD k) = r :=
  (distArrow_spec hD k V r).exists.choose_spec

theorem fac_unique {k : D.ι} {V : D.C k} (r : D.S.R.obj ⟨k, V⟩) (j : (D.A k).W₀ ⟶ V)
    (h : D.S.R.map (SigmaHom.mk j) (distArrow hD k) = r) : j = fac hD r :=
  (distArrow_spec hD k V r).unique h (map_fac hD r)

theorem fac_map {k : D.ι} {V U : D.C k} (r : D.S.R.obj ⟨k, V⟩) (j : V ⟶ U) :
    fac hD (D.S.R.map (SigmaHom.mk j) r) = fac hD r ≫ j :=
  (fac_unique hD _ _ (by
    rw [show SigmaHom.mk (fac hD r ≫ j) = (SigmaHom.mk (fac hD r) ≫ SigmaHom.mk j : (⟨k, _⟩ : Σ k, D.C k) ⟶ ⟨k, U⟩)
      from rfl, D.S.map_comp_apply, map_fac])).symm

theorem fac_distArrow (k : D.ι) : fac hD (distArrow hD k) = 𝟙 _ :=
  (fac_unique hD _ (𝟙 _) (D.S.map_id_apply _)).symm

/-- The transport along a root arrow `r` into a component is the transport along the
distinguished arrow, moved along `fac r`. -/
theorem tr_eq (σ : Ty) {k : D.ι} {V : D.C k} (r : D.S.R.obj ⟨k, V⟩) (x : D.RA.D σ) :
    D.RA.tr σ r x = ((D.A k).inner σ).map (fac hD r) (D.RA.tr σ (distArrow hD k) x) := by
  conv_lhs => rw [← map_fac hD r]
  exact D.RA.tr_map σ _ _ x

/-- A tuple at a component object belongs to a root entity iff it belongs to the entity's part
in the component, the arrow read through the distinguished one. -/
theorem mem_incl_of {ρ : RTy} (x : D.RA.D (.rel ρ)) {k : D.ι} {U : D.C k}
    (a : Args D.RA.inner ρ (CoalescedSum.of ⟨k, U⟩)) (r : D.S.R.obj ⟨k, U⟩) :
    (⟨.of ⟨k, U⟩, a, CoalescedSum.arr D.S r⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ x ↔
      (⟨U, D.RA.argsOut ρ a, fac hD r⟩ : Tuple (D.A k).inner ρ (D.A k).W₀) ∈
        (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) x) := by
  rw [D.RI.incl_tr, RootAction.mem_transport]
  show _ ↔ (⟨.of ⟨k, U⟩, D.RA.argsIn ρ (D.RA.argsOut ρ a),
    CoalescedSum.arr D.S (D.S.R.map (SigmaHom.mk (fac hD r)) (distArrow hD k))⟩ :
      Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ x
  rw [D.RA.argsIn_argsOut, map_fac]

/-! ### Threads -/

/-- The intension at the root with extension `E` at the root and part `y k` in each component. -/
def threadI {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) : Intension D.RA.inner ρ (CoalescedSum.base D.S) :=
  fun p => match p with
    | ⟨.root, a, _⟩ => a ∈ E
    | ⟨.of ⟨k, U⟩, a, r⟩ =>
      (⟨U, D.RA.argsOut ρ a, fac hD r⟩ : Tuple (D.A k).inner ρ (D.A k).W₀) ∈ (D.A k).incl ρ _ (y k)

theorem transport_threadI {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) {k : D.ι} {V : D.C k} (r : D.S.R.obj ⟨k, V⟩) :
    D.RA.transport r (threadI hD E y) = (D.A k).incl ρ V (((D.A k).inner (.rel ρ)).map (fac hD r) (y k)) := by
  rw [(D.A k).incl_map]
  ext ⟨U, a, j⟩
  rw [RootAction.mem_transport, Intension.mem_map]
  show (⟨U, D.RA.argsOut ρ (D.RA.argsIn ρ a), fac hD (D.S.R.map (SigmaHom.mk j) r)⟩ :
    Tuple (D.A k).inner ρ (D.A k).W₀) ∈ (D.A k).incl ρ _ (y k) ↔ _
  rw [D.RA.argsOut_argsIn, fac_map]

/-- **The thread**: the root entity with extension `E` at the root and part `y k` in each
component `k`. -/
noncomputable def thread (hF : D.FullestDomains) {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) : D.RA.D (.rel ρ) :=
  (hF ρ (threadI hD E y) fun r => ⟨_, (transport_threadI hD E y r).symm⟩).choose

theorem incl_thread (hF : D.FullestDomains) {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) : D.RI.incl ρ (thread hD hF E y) = threadI hD E y :=
  (hF ρ (threadI hD E y) fun r => ⟨_, (transport_threadI hD E y r).symm⟩).choose_spec

theorem mem_thread_root (hF : D.FullestDomains) {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) (a : Args D.RA.inner ρ (CoalescedSum.base D.S))
    (m : D.S.End) :
    (⟨.root, a, CoalescedSum.endo D.S m⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈
      D.RI.incl ρ (thread hD hF E y) ↔ a ∈ E := by
  rw [incl_thread]; rfl

theorem tr_thread (hF : D.FullestDomains) {ρ : RTy} (E : Set (Args D.RA.inner ρ (CoalescedSum.base D.S)))
    (y : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) (k : D.ι) :
    D.RA.tr (.rel ρ) (distArrow hD k) (thread hD hF E y) = y k := by
  apply (D.A k).incl_injective ρ _
  rw [D.RI.incl_tr, incl_thread, transport_threadI, fac_distArrow, CategoryTheory.Functor.map_id]
  rfl

/-! ### The components' roots, and a counterexample at one of them -/

/-- The root of a component is a model, in its pure reduct: it is the component seen from the
distinguished arrow, its constants forgotten. -/
theorem compRoot_isModel (k : D.ι) : (D.A k).reduct.IsModel :=
  Premodel.reduct_isModel _ (((D.RA.isModel_iff D.RI D.ne D.I).1 D.isModel).1 (distArrow hD k))

omit hD in
/-- The root of the sum is a model, in its pure reduct. -/
theorem root_isModel : D.model.reduct.IsModel := D.model.reduct_isModel D.isModel

/-- **A counterexample at the root of a component**: a closed-type pure sentence whose negation
is consistent with `C` fails at the root of some component (`complete-components`). -/
theorem exists_comp (hc : D.CompleteComponents) {q : Sentence Signature.pure} (hq : q.closedTypes = true)
    (h : AxiomSet.Consistent (AxiomSet.single (Term.neg q))) : ∃ k, ¬ (D.A k).reduct.HoldsSentence q := by
  obtain ⟨k, hk⟩ := hc.1 (Term.neg q) (by simpa using hq) h
  exact ⟨k, ((D.A k).reduct.holdsSentence_neg (compRoot_isModel hD k) q).1
    (((D.A k).holdsSentence_ofPure _).1 hk)⟩

omit hD in
/-- A root entity of a relational type, given at the root of every component but one by a
default and at that one by `y`. -/
noncomputable abbrev parts {ρ : RTy} (dflt : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) (k₀ : D.ι)
    (y : (D.A k₀).Dom (D.A k₀).W₀ (.rel ρ)) : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ) := by
  classical exact Function.update dflt k₀ y

omit hD in
theorem parts_self {ρ : RTy} (dflt : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) (k₀ : D.ι)
    (y : (D.A k₀).Dom (D.A k₀).W₀ (.rel ρ)) : parts dflt k₀ y k₀ = y := by
  classical exact Function.update_self k₀ y dflt

omit hD in
theorem parts_ne {ρ : RTy} (dflt : ∀ k, (D.A k).Dom (D.A k).W₀ (.rel ρ)) {k₀ k : D.ι}
    (y : (D.A k₀).Dom (D.A k₀).W₀ (.rel ρ)) (h : k ≠ k₀) : parts dflt k₀ y k = dflt k := by
  classical exact Function.update_of_ne h y dflt

/-- The universal relation at the root of each component. -/
noncomputable def univPart (ρ : RTy) (k : D.ι) : (D.A k).Dom (D.A k).W₀ (.rel ρ) :=
  ((D.A k).reduct.exists_incl_univ (compRoot_isModel hD k) (𝟙 _) ρ).choose

theorem incl_univPart (ρ : RTy) (k : D.ι) : (D.A k).incl ρ _ (univPart hD ρ k) = Set.univ :=
  ((D.A k).reduct.exists_incl_univ (compRoot_isModel hD k) (𝟙 _) ρ).choose_spec

/-- The empty relation at the root of each component. -/
noncomputable def emptyPart (ρ : RTy) (k : D.ι) : (D.A k).Dom (D.A k).W₀ (.rel ρ) :=
  ((D.A k).reduct.exists_incl_empty (compRoot_isModel hD k) (𝟙 _) ρ).choose

theorem incl_emptyPart (ρ : RTy) (k : D.ι) : (D.A k).incl ρ _ (emptyPart hD ρ k) = ∅ :=
  ((D.A k).reduct.exists_incl_empty (compRoot_isModel hD k) (𝟙 _) ρ).choose_spec


/-! ### Inclusion at the root, componentwise -/

/-- A tuple of the component `k` from its root, read at the root along the distinguished arrow,
belongs to a root entity iff it belongs to the entity's part in `k`. -/
theorem mem_incl_dist {ρ : RTy} (x : D.RA.D (.rel ρ)) {k : D.ι} {U : D.C k}
    (b : Args (D.A k).inner ρ U) (j : (D.A k).W₀ ⟶ U) :
    (⟨.of ⟨k, U⟩, D.RA.argsIn ρ b, CoalescedSum.arr D.S (D.S.R.map (SigmaHom.mk j) (distArrow hD k))⟩ :
        Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ x ↔
      (⟨U, b, j⟩ : Tuple (D.A k).inner ρ (D.A k).W₀) ∈ (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) x) := by
  rw [mem_incl_of hD, D.RA.argsOut_argsIn, fac_map, fac_distArrow, Category.id_comp]

/-- **Inclusion of root entities is componentwise**: at the root, and of the parts in each
component. -/
theorem incl_subset_iff {ρ : RTy} (z w : D.RA.D (.rel ρ)) :
    D.RI.incl ρ z ⊆ D.RI.incl ρ w ↔
      (∀ a : Args D.RA.inner ρ (CoalescedSum.base D.S),
        (⟨.root, a, CoalescedSum.endo D.S D.S.one⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ z →
          (⟨.root, a, CoalescedSum.endo D.S D.S.one⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ w) ∧
      ∀ k, (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) z) ⊆ (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) w) := by
  constructor
  · intro H
    refine ⟨fun a ha => H ha, fun k t ht => ?_⟩
    obtain ⟨U, b, j⟩ := t
    exact (mem_incl_dist hD w b j).1 (H ((mem_incl_dist hD z b j).2 ht))
  · rintro ⟨hr, hc⟩ ⟨V, a, l⟩ hp
    cases V with
    | root =>
      change D.S.End at l
      rw [hD.1 l] at hp ⊢
      exact hr a hp
    | of x =>
      obtain ⟨k, U⟩ := x
      change D.S.R.obj ⟨k, U⟩ at l
      exact (mem_incl_of hD w a l).2 (hc k ((mem_incl_of hD z a l).1 hp))

/-- A root entity true nowhere at the root and with the part `y` in the component `k`, the empty
part in every other. -/
noncomputable abbrev single (hF : D.FullestDomains) {ρ : RTy} (k : D.ι)
    (y : (D.A k).Dom (D.A k).W₀ (.rel ρ)) : D.RA.D (.rel ρ) :=
  thread hD hF ∅ (parts (emptyPart hD ρ) k y)

theorem tr_single_self (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y : (D.A k).Dom (D.A k).W₀ (.rel ρ)) :
    D.RA.tr _ (distArrow hD k) (single hD hF k y) = y := by
  rw [tr_thread, parts_self]

theorem incl_tr_single_ne (hF : D.FullestDomains) {ρ : RTy} {k k' : D.ι}
    (y : (D.A k).Dom (D.A k).W₀ (.rel ρ)) (h : k' ≠ k) :
    (D.A k').incl ρ _ (D.RA.tr _ (distArrow hD k') (single hD hF k y)) = ∅ := by
  rw [tr_thread, parts_ne _ _ h, incl_emptyPart]

/-- What includes a single-component entity includes its part there. -/
theorem single_subset_iff (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y : (D.A k).Dom (D.A k).W₀ (.rel ρ))
    (w : D.RA.D (.rel ρ)) :
    D.RI.incl ρ (single hD hF k y) ⊆ D.RI.incl ρ w ↔
      (D.A k).incl ρ _ y ⊆ (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) w) := by
  rw [incl_subset_iff hD]
  constructor
  · rintro ⟨-, hc⟩
    simpa only [tr_single_self] using hc k
  · intro h
    refine ⟨fun a ha => ((mem_thread_root hD hF _ _ a _).1 ha).elim, fun k' => ?_⟩
    by_cases e : k' = k
    · subst e
      rw [tr_single_self]; exact h
    · rw [incl_tr_single_ne hD hF y e]; exact Set.empty_subset _

/-- What a single-component entity includes is false at the root and empty in the other
components. -/
theorem subset_single_iff (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y : (D.A k).Dom (D.A k).W₀ (.rel ρ))
    (w : D.RA.D (.rel ρ)) :
    D.RI.incl ρ w ⊆ D.RI.incl ρ (single hD hF k y) ↔
      (∀ a : Args D.RA.inner ρ (CoalescedSum.base D.S),
        (⟨.root, a, CoalescedSum.endo D.S D.S.one⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∉ D.RI.incl ρ w) ∧
      (∀ k', k' ≠ k → (D.A k').incl ρ _ (D.RA.tr _ (distArrow hD k') w) = ∅) ∧
      (D.A k).incl ρ _ (D.RA.tr _ (distArrow hD k) w) ⊆ (D.A k).incl ρ _ y := by
  rw [incl_subset_iff hD]
  constructor
  · rintro ⟨hr, hc⟩
    refine ⟨fun a ha => (mem_thread_root hD hF _ _ a _).1 (hr a ha), fun k' e => ?_, ?_⟩
    · exact Set.subset_eq_empty (hc k') (incl_tr_single_ne hD hF y e)
    · simpa only [tr_single_self] using hc k
  · rintro ⟨hr, hne, hk⟩
    refine ⟨fun a ha => (hr a ha).elim, fun k' => ?_⟩
    by_cases e : k' = k
    · subst e
      rw [tr_single_self]; exact hk
    · rw [hne k' e]; exact Set.empty_subset _

/-- An entity included in a single-component entity is the single-component entity of its part. -/
theorem eq_single_of_subset (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y : (D.A k).Dom (D.A k).W₀ (.rel ρ))
    (w : D.RA.D (.rel ρ)) (h : D.RI.incl ρ w ⊆ D.RI.incl ρ (single hD hF k y)) :
    D.RI.incl ρ w = D.RI.incl ρ (single hD hF k (D.RA.tr _ (distArrow hD k) w)) := by
  obtain ⟨hr, hne, -⟩ := (subset_single_iff hD hF k y w).1 h
  exact Set.Subset.antisymm ((subset_single_iff hD hF k _ w).2 ⟨hr, hne, le_rfl⟩)
    ((single_subset_iff hD hF k _ w).2 le_rfl)

/-- A single-component entity is empty iff its part is. -/
theorem single_eq_empty_iff (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y : (D.A k).Dom (D.A k).W₀ (.rel ρ)) :
    D.RI.incl ρ (single hD hF k y) = ∅ ↔ (D.A k).incl ρ _ y = ∅ := by
  constructor
  · intro h
    refine Set.eq_empty_of_forall_notMem fun ⟨U, b, j⟩ hb => ?_
    have := (mem_incl_dist hD (single hD hF k y) b j).2 (by rw [tr_single_self]; exact hb)
    rw [h] at this; exact this
  · intro h
    refine Set.eq_empty_of_forall_notMem fun ⟨V, a, l⟩ ha => ?_
    cases V with
    | root => exact (mem_thread_root hD hF _ _ a _).1 ha
    | of x =>
      obtain ⟨k', U⟩ := x
      change D.S.R.obj ⟨k', U⟩ at l
      have := (mem_incl_of hD _ a l).1 ha
      by_cases e : k' = k
      · subst e
        rw [tr_single_self, h] at this; exact this
      · rw [incl_tr_single_ne hD hF y e] at this; exact this

/-- Equality of single-component entities in one component is equality of their parts. -/
theorem single_eq_iff (hF : D.FullestDomains) {ρ : RTy} (k : D.ι) (y y' : (D.A k).Dom (D.A k).W₀ (.rel ρ)) :
    D.RI.incl ρ (single hD hF k y) = D.RI.incl ρ (single hD hF k y') ↔
      (D.A k).incl ρ _ y = (D.A k).incl ρ _ y' := by
  rw [Set.Subset.antisymm_iff, Set.Subset.antisymm_iff, single_subset_iff, single_subset_iff,
    tr_single_self, tr_single_self]

/-! ### `barcan-t-component` -/

/-- **BF at `t` fails at the root**: some component refutes it at its root with a property `F`
(the M-set model on the idempotent monoid shows `¬BF_t` consistent with `C`); the thread that is
universal at the root and in every other component and is `F` in that one holds, along every
arrow, of the image of every proposition, the arrows into that component factoring through the
distinguished one, but fails of something somewhere, where `F` does. -/
theorem not_holds_barcanT (hF : D.FullestDomains) (hc : D.CompleteComponents) : ¬ D.model.HoldsAx P.BarcanT.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  have H0 : D.model.reduct.HoldsSentence (Sentence.bf (.rel .t)) := H _ rfl
  obtain ⟨k, hk⟩ := exists_comp hD hc (q := P.BarcanT.quoted) (by decide)
    Classicism.Meta.Idem.not_bf_t_consistent
  change ¬ (D.A k).reduct.Holds (𝟙 _) (Sentence.bf (.rel .t)) .nil at hk
  rw [Premodel.holds_bf_iff _ (compRoot_isModel hD k)] at hk
  push Not at hk
  dsimp only [Premodel.reduct] at hk
  obtain ⟨F, hFall, V, l, a, ha⟩ := hk
  let X := thread hD hF Set.univ (parts (univPart hD _) k F)
  refine ha ?_
  have := (Premodel.holds_bf_iff _ root_isModel (.rel .t) (𝟙 _)).1 H0 X ?_
    (CoalescedSum.arr D.S (D.S.R.map (SigmaHom.mk l) (distArrow hD k))) a
  · have h2 := (mem_incl_of hD X (k := k) (U := V) (a, PUnit.unit)
      (D.S.R.map (SigmaHom.mk l) (distArrow hD k))).1 this
    rw [tr_thread, parts_self, fac_map, fac_distArrow, Category.id_comp] at h2
    exact h2
  · intro y V r
    cases V with
    | root => exact (mem_thread_root hD hF _ _ _ r).2 trivial
    | of x =>
      obtain ⟨k', U⟩ := x
      change D.S.R.obj ⟨k', U⟩ at r
      change D.RA.D (.rel .t) at y
      refine (mem_incl_of hD X (k := k') (U := U) (D.RA.tr _ r y, PUnit.unit) r).2 ?_
      rw [tr_thread]
      by_cases e : k' = k
      · subst e
        rw [parts_self]
        show (⟨U, (D.RA.tr _ r y, PUnit.unit), fac hD r⟩ : Tuple (D.A k').inner (.arr (.rel .t) .t) _) ∈ _
        rw [tr_eq hD]
        exact hFall _ _
      · rw [parts_ne _ _ e, incl_univPart]; trivial

/-! ### `atomicity-t-component` -/

/-- **Atomicity at `t` fails at the root**: some component refutes it at its root with a
proposition `p` below which there is no atom (the permutation model of Appendix D shows
`¬Atomicity(t)` consistent with `C`); the root proposition false at the root, `p` in that
component and empty in every other is not empty, and what is below it is the single-component
entity of its part, so an atom below it would give an atom below `p`. -/
theorem not_holds_atomicityT (hF : D.FullestDomains) (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.AtomicityT.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  have H0 : D.model.reduct.HoldsSentence (P.Atomicity.quoted .t) := H P.AtomicityT.quoted rfl
  obtain ⟨k, hk⟩ := exists_comp hD hc (q := P.AtomicityT.quoted) (by decide)
    Classicism.Meta.Perms.not_atomicityT_consistent
  change ¬ (D.A k).reduct.Holds (𝟙 _) (P.Atomicity.quoted .t) .nil at hk
  rw [Premodel.holds_atomicity_iff (compRoot_isModel hD k)] at hk
  push Not at hk
  dsimp only [Premodel.reduct] at hk
  obtain ⟨p, hp0, hpat⟩ := hk
  rcases (Premodel.holds_atomicity_iff root_isModel (𝟙 _) .t).1 H0 (single hD hF k p) with h0 | ⟨q, hq, hqp⟩
  · exact Set.nonempty_iff_ne_empty.1 hp0 ((single_eq_empty_iff hD hF k p).1 h0)
  · change D.RI.incl _ q ⊆ D.RI.incl _ (single hD hF k p) at hqp
    have eq := eq_single_of_subset hD hF k p q hqp
    refine hpat (D.RA.tr _ (distArrow hD k) q) (fun z => ?_) ?_
    · have := hq (single hD hF k z)
      change (D.RI.incl _ (single hD hF k z) ⊆ D.RI.incl _ q ∧ D.RI.incl _ (single hD hF k z) ≠ D.RI.incl _ q) ↔
        D.RI.incl _ (single hD hF k z) = ∅ at this
      rw [eq, single_subset_iff, tr_single_self, ne_eq, single_eq_iff, single_eq_empty_iff] at this
      exact this
    · have := (single_subset_iff hD hF k _ _).1 (eq ▸ hqp)
      rwa [tr_single_self] at this

end SumData

end Classicism.Meta.Coalesced
