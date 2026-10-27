import Classicism.Results.Research.InextensibleWeakPower
import Classicism.Results.Research.ModalPropagation
import Classicism.Results.Records.C5
import Classicism.Results.Research.ModalRigidityDescent

/-!
# The finite Boolean closure ladder for weak and rigid relations

Direct source: research/2026-10-22/notes/rigid-boolean-closure.md, §§1–4,6
(original research, unpaginated, misc, 22 October 2026).
ND below is unboxed. The weak complement characterization uses local BF;
the rigid characterization uses boxed BF. No future object quantifier is
silently inferred from a current universal. All object types end in t except
for the permitted argument type σ.
-/

namespace Classicism.Research.RigidityClosure
open Classicism.P Classicism.Paper
open Classicism.Research.InextensiblePower (DecidedTruth decidedTruth_persistent)

variable {σ : Type} [Ty σ]

def WeakMeetClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, WeaklyRigid A → WeaklyRigid B → WeaklyRigid (fun x => A x ∧ B x)
def RigidMeetClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, Rigid A → Rigid B → Rigid (fun x => A x ∧ B x)
def WeakDifferenceClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, WeaklyRigid A → WeaklyRigid B → WeaklyRigid (fun x => A x ∧ ¬ B x)
def RigidDifferenceClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, Rigid A → Rigid B → Rigid (fun x => A x ∧ ¬ B x)
def WeakComplementClosure (σ : Type) [Ty σ] : Prop :=
  ∀ B : σ → Prop, WeaklyRigid B → WeaklyRigid (fun x => ¬ B x)
def RigidComplementClosure (σ : Type) [Ty σ] : Prop :=
  ∀ B : σ → Prop, Rigid B → Rigid (fun x => ¬ B x)

/-- The necessary exclusion of a current nonmember needs only WI and ND_σ. -/
theorem nd_seals_nonmembership (nd : NecessityOfDistinctness σ)
    (B : σ → Prop) (hb : WeaklyInextensible B) (a : σ) (hna : ¬ B a) : □ (¬ B a) :=
  modal_K _ _ (nec% (fun (h : ∀ x : σ, B x → x ≠ a) (ha : B a) => h a ha rfl))
    (hb (fun x => x ≠ a) (fun x hx => nd x a (fun he => hna (he ▸ hx))))

theorem nd_decides_membership (nd : NecessityOfDistinctness σ)
    (B : σ → Prop) (hb : WeaklyRigid B) (a : σ) : DecidedTruth (B a) :=
  (em (B a)).elim (fun ha => Or.inl (hb.1 a ha))
    (fun hn => Or.inr (nd_seals_nonmembership nd B hb.2 a hn))

theorem decided_neg (p : Prop) : DecidedTruth p → DecidedTruth (¬ p) :=
  fun h => h.elim
    (fun hp => Or.inr (modal_K _ _ (nec% (fun (hp : p) (hn : ¬ p) => hn hp)) hp))
    Or.inl

/-- A weakly rigid bound can be cut by any predicate decided on that bound. -/
theorem weak_cut (A B : σ → Prop) (ha : WeaklyRigid A)
    (hd : ∀ x, A x → DecidedTruth (B x)) : WeaklyRigid (fun x => A x ∧ B x) := by
  refine ⟨?_, ?_⟩
  · intro x hx
    exact (box_and_eq _ _).mpr ⟨ha.1 x hx.1,
      (hd x hx.1).elim (fun h => h) (fun h => False.elim (box_elim h hx.2))⟩
  · intro Z hz
    have ht : □ (∀ x, A x → B x → Z x) :=
      ha.2 (fun x => B x → Z x) fun x hx =>
        (hd x hx).elim
          (fun hp => box_imp_of_box _ _ (hz x ⟨hx, box_elim hp⟩))
          (fun hn => box_imp_of_box_not _ _ hn)
    exact modal_K _ _
      (nec% (fun (h : ∀ x : σ, A x → B x → Z x) (x : σ)
        (hx : A x ∧ B x) => h x hx.1 hx.2)) ht

/-- Full rigidity uses a necessarily sealed decision condition, not current BF. -/
theorem rigid_cut (A B : σ → Prop) (ha : Rigid A)
    (hd : □ (∀ x, A x → DecidedTruth (B x))) : Rigid (fun x => A x ∧ B x) :=
  (rigid_iff_box_weaklyRigid _).2
    (modal_K _ _ (modal_K _ _ (nec% (weak_cut A B))
      ((rigid_iff_box_weaklyRigid A).1 ha)) hd)

theorem nd_seals_decisions (nd : NecessityOfDistinctness σ)
    (A B : σ → Prop) (ha : WeaklyRigid A) (hb : WeaklyRigid B) :
    □ (∀ x, A x → DecidedTruth (B x)) :=
  ha.2 (fun x => DecidedTruth (B x)) fun x _ =>
    decidedTruth_persistent _ (nd_decides_membership nd B hb x)

theorem nd_weak_meet : NecessityOfDistinctness σ → WeakMeetClosure σ :=
  fun nd A B ha hb => weak_cut A B ha (fun x _ => nd_decides_membership nd B hb x)

theorem nd_rigid_meet : NecessityOfDistinctness σ → RigidMeetClosure σ :=
  fun nd A B ha hb => rigid_cut A B ha
    (nd_seals_decisions nd A B (weaklyRigid_of_rigid ha) (weaklyRigid_of_rigid hb))

theorem nd_weak_difference : NecessityOfDistinctness σ → WeakDifferenceClosure σ :=
  fun nd A B ha hb => weak_cut A (fun x => ¬ B x) ha
    (fun x _ => decided_neg _ (nd_decides_membership nd B hb x))

theorem nd_rigid_difference : NecessityOfDistinctness σ → RigidDifferenceClosure σ :=
  fun nd A B ha hb => rigid_cut A (fun x => ¬ B x) ha
    (modal_K _ _ (nec% (fun (h : ∀ x : σ, A x → DecidedTruth (B x))
      (x : σ) (hx : A x) => decided_neg _ (h x hx)))
      (nd_seals_decisions nd A B (weaklyRigid_of_rigid ha) (weaklyRigid_of_rigid hb)))

theorem weak_union (A B : σ → Prop) (ha : WeaklyRigid A) (hb : WeaklyRigid B) :
    WeaklyRigid (fun x => A x ∨ B x) := by
  refine ⟨?_, ?_⟩
  · intro x hx
    exact hx.elim
      (fun h => modal_K _ _ (nec% (fun (h : A x) => (Or.inl h : A x ∨ B x))) (ha.1 x h))
      (fun h => modal_K _ _ (nec% (fun (h : B x) => (Or.inr h : A x ∨ B x))) (hb.1 x h))
  · intro Z hz
    exact modal_K _ _ (modal_K _ _
      (nec% (fun (hA : ∀ x : σ, A x → Z x) (hB : ∀ x : σ, B x → Z x)
        (x : σ) (hx : A x ∨ B x) => hx.elim (hA x) (hB x)))
      (ha.2 Z (fun x hx => hz x (Or.inl hx))))
      (hb.2 Z (fun x hx => hz x (Or.inr hx)))

theorem rigid_union (A B : σ → Prop) (ha : Rigid A) (hb : Rigid B) :
    Rigid (fun x => A x ∨ B x) :=
  (rigid_iff_box_weaklyRigid _).2
    (modal_K _ _ (modal_K _ _ (nec% (weak_union A B))
      ((rigid_iff_box_weaklyRigid A).1 ha)) ((rigid_iff_box_weaklyRigid B).1 hb))

theorem weak_bottom : WeaklyRigid (fun _ : σ => False) :=
  ⟨fun _ h => False.elim h, fun Z _ => nec% (fun (x : σ) (h : False) => (False.elim h : Z x))⟩

theorem rigid_bottom : Rigid (fun _ : σ => False) :=
  (rigid_iff_box_weaklyRigid _).2 (nec% (weak_bottom (σ := σ)))

/-- The converse uses just unary haecceities at the desired argument type. -/
theorem nd_of_weak_meet : WeakMeetClosure σ → NecessityOfDistinctness σ := by
  intro cl a b hn
  have hw := cl (fun x => x = a) (fun x => x = b)
    (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid a))
    (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid b))
  exact modal_K _ _
    (nec% (fun (h : ∀ x : σ, (x = a ∧ x = b) → x ≠ a) (he : a = b) =>
      h a ⟨rfl, he⟩ rfl))
    (hw.2 (fun x => x ≠ a) (fun x hx => False.elim (hn (hx.1.symm.trans hx.2))))

theorem nd_of_rigid_meet : RigidMeetClosure σ → NecessityOfDistinctness σ := by
  intro cl a b hn
  have hw := weaklyRigid_of_rigid (cl (fun x => x = a) (fun x => x = b)
    (Classicism.Rigidity.singleton_rigid a)
    (Classicism.Rigidity.singleton_rigid b))
  exact modal_K _ _
    (nec% (fun (h : ∀ x : σ, (x = a ∧ x = b) → x ≠ a) (he : a = b) =>
      h a ⟨rfl, he⟩ rfl))
    (hw.2 (fun x => x ≠ a) (fun x hx => False.elim (hn (hx.1.symm.trans hx.2))))

theorem nd_of_weak_difference : WeakDifferenceClosure σ → NecessityOfDistinctness σ :=
  fun cl a b hn => modal_K _ _ (nec% (fun (h : a = a ∧ a ≠ b) => h.2))
    ((cl (fun x => x = a) (fun x => x = b)
      (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid a))
      (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid b))).1 a ⟨rfl, hn⟩)

theorem nd_of_rigid_difference : RigidDifferenceClosure σ → NecessityOfDistinctness σ :=
  fun cl a b hn => modal_K _ _ (nec% (fun (h : a = a ∧ a ≠ b) => h.2))
    ((weaklyRigid_of_rigid (cl (fun x => x = a) (fun x => x = b)
      (Classicism.Rigidity.singleton_rigid a)
      (Classicism.Rigidity.singleton_rigid b))).1 a ⟨rfl, hn⟩)

theorem weak_meet_iff_nd : WeakMeetClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_weak_meet, nd_weak_meet⟩
theorem rigid_meet_iff_nd : RigidMeetClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_rigid_meet, nd_rigid_meet⟩
theorem weak_difference_iff_nd : WeakDifferenceClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_weak_difference, nd_weak_difference⟩
theorem rigid_difference_iff_nd : RigidDifferenceClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_rigid_difference, nd_rigid_difference⟩



def WeakSymmetricDifferenceClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, WeaklyRigid A → WeaklyRigid B →
    WeaklyRigid (fun x => (A x ∧ ¬ B x) ∨ (B x ∧ ¬ A x))
def RigidSymmetricDifferenceClosure (σ : Type) [Ty σ] : Prop :=
  ∀ A B : σ → Prop, Rigid A → Rigid B →
    Rigid (fun x => (A x ∧ ¬ B x) ∨ (B x ∧ ¬ A x))

theorem nd_weak_symmetric_difference : NecessityOfDistinctness σ → WeakSymmetricDifferenceClosure σ :=
  fun nd A B ha hb => weak_union _ _ (nd_weak_difference nd A B ha hb)
    (nd_weak_difference nd B A hb ha)
theorem nd_rigid_symmetric_difference : NecessityOfDistinctness σ → RigidSymmetricDifferenceClosure σ :=
  fun nd A B ha hb => rigid_union _ _ (nd_rigid_difference nd A B ha hb)
    (nd_rigid_difference nd B A hb ha)

theorem nd_of_weak_symmetric_difference : WeakSymmetricDifferenceClosure σ → NecessityOfDistinctness σ :=
  fun cl a b hn => modal_K _ _
    (nec% (fun (h : (a = a ∧ a ≠ b) ∨ (a = b ∧ a ≠ a)) =>
      h.elim And.right (fun h => False.elim (h.2 rfl))))
    ((cl (fun x => x = a) (fun x => x = b)
      (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid a))
      (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid b))).1 a
        (Or.inl ⟨rfl, hn⟩))
theorem nd_of_rigid_symmetric_difference : RigidSymmetricDifferenceClosure σ → NecessityOfDistinctness σ :=
  fun cl a b hn => modal_K _ _
    (nec% (fun (h : (a = a ∧ a ≠ b) ∨ (a = b ∧ a ≠ a)) =>
      h.elim And.right (fun h => False.elim (h.2 rfl))))
    ((weaklyRigid_of_rigid (cl (fun x => x = a) (fun x => x = b)
      (Classicism.Rigidity.singleton_rigid a)
      (Classicism.Rigidity.singleton_rigid b))).1 a
        (Or.inl ⟨rfl, hn⟩))

theorem weak_symmetric_difference_iff_nd : WeakSymmetricDifferenceClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_weak_symmetric_difference, nd_weak_symmetric_difference⟩
theorem rigid_symmetric_difference_iff_nd : RigidSymmetricDifferenceClosure σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_rigid_symmetric_difference, nd_rigid_symmetric_difference⟩

/-- An additional simple characterization: every current rigid instance is bivalent. -/
def WeakBivalence (σ : Type) [Ty σ] : Prop :=
  ∀ B : σ → Prop, WeaklyRigid B → ∀ a, B a = True ∨ B a = False
def RigidBivalence (σ : Type) [Ty σ] : Prop :=
  ∀ B : σ → Prop, Rigid B → ∀ a, B a = True ∨ B a = False

theorem nd_weak_bivalence : NecessityOfDistinctness σ → WeakBivalence σ :=
  fun nd B hb a => (nd_decides_membership nd B hb a).elim Or.inl
    (fun hn => Or.inr ((box_not_eq (B a)).mp hn))

theorem nd_rigid_bivalence : NecessityOfDistinctness σ → RigidBivalence σ :=
  fun nd B hb => nd_weak_bivalence nd B (weaklyRigid_of_rigid hb)

theorem nd_of_weak_bivalence : WeakBivalence σ → NecessityOfDistinctness σ :=
  fun bv a b hn => (bv (fun x => x = b)
    (weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid b)) a).elim
      (fun ht => False.elim (hn (box_elim ht)))
      (fun hf => (box_not_eq (a = b)).mpr hf)

theorem nd_of_rigid_bivalence : RigidBivalence σ → NecessityOfDistinctness σ :=
  fun bv a b hn => (bv (fun x => x = b)
    (Classicism.Rigidity.singleton_rigid b) a).elim
      (fun ht => False.elim (hn (box_elim ht)))
      (fun hf => (box_not_eq (a = b)).mpr hf)

theorem weak_bivalence_iff_nd : WeakBivalence σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_weak_bivalence, nd_weak_bivalence⟩
theorem rigid_bivalence_iff_nd : RigidBivalence σ ↔ NecessityOfDistinctness σ :=
  ⟨nd_of_rigid_bivalence, nd_rigid_bivalence⟩

/-- Closed logical identities only: the gate permits these without optional premises. -/
theorem de_morgan_meet (A B : σ → Prop) :
    (fun x => ¬ (¬ A x ∨ ¬ B x)) = (fun x => A x ∧ B x) :=
  funext fun x => propext ⟨fun h =>
    ⟨(em (A x)).elim id (fun hn => False.elim (h (Or.inl hn))),
     (em (B x)).elim id (fun hn => False.elim (h (Or.inr hn)))⟩,
    fun h hn => hn.elim (fun ha => ha h.1) (fun hb => hb h.2)⟩

theorem true_cut_eq (B : σ → Prop) :
    (fun x => True ∧ ¬ B x) = (fun x => ¬ B x) :=
  funext fun x => propext ⟨And.right, fun h => ⟨trivial, h⟩⟩

theorem complement_bottom_eq : (fun _ : σ => ¬ False) = (fun _ : σ => True) :=
  funext fun _ => propext ⟨fun _ => trivial, fun _ h => h⟩

theorem weak_complement_implies_meet : WeakComplementClosure σ → WeakMeetClosure σ :=
  fun cl A B ha hb => (de_morgan_meet A B) ▸
    cl (fun x => ¬ A x ∨ ¬ B x)
      (weak_union (fun x => ¬ A x) (fun x => ¬ B x) (cl A ha) (cl B hb))

theorem rigid_complement_implies_meet : RigidComplementClosure σ → RigidMeetClosure σ :=
  fun cl A B ha hb => (de_morgan_meet A B) ▸
    cl (fun x => ¬ A x ∨ ¬ B x)
      (rigid_union (fun x => ¬ A x) (fun x => ¬ B x) (cl A ha) (cl B hb))

theorem weak_complement_iff_nd_barcan :
    WeakComplementClosure σ ↔ (NecessityOfDistinctness σ ∧ Barcan σ) :=
  ⟨fun cl => ⟨nd_of_weak_meet (weak_complement_implies_meet cl),
    Classicism.Research.ModalPropagation.universe_weakly_rigid_iff_barcan.1
      (Eq.mp (congrArg WeaklyRigid (complement_bottom_eq (σ := σ)))
        (cl (fun _ => False) weak_bottom))⟩,
   fun h B hb => (true_cut_eq B) ▸ nd_weak_difference h.1 (fun _ => True) B
     (Classicism.Research.ModalPropagation.universe_weakly_rigid_iff_barcan.2 h.2) hb⟩

theorem rigid_complement_iff_nd_necessary_barcan :
    RigidComplementClosure σ ↔ (NecessityOfDistinctness σ ∧ NecBarcan σ) :=
  ⟨fun cl => ⟨nd_of_rigid_meet (rigid_complement_implies_meet cl),
    Classicism.Research.ModalPropagation.universe_rigid_iff_necessary_barcan.1
      (Eq.mp (congrArg Rigid (complement_bottom_eq (σ := σ)))
        (cl (fun _ => False) rigid_bottom))⟩,
   fun h B hb => (true_cut_eq B) ▸ nd_rigid_difference h.1 (fun _ => True) B
     (Classicism.Research.ModalPropagation.universe_rigid_iff_necessary_barcan.2 h.2) hb⟩

/-- A single low type controls the full C5 strengthening. -/
theorem weak_complement_tt_iff_c5 :
    WeakComplementClosure Prop ↔ NecNecessityOfDistinctness Prop :=
  ⟨fun cl => Proofs.distinctness_necessary_t_and_barcan_t_imply_necessary_distinctness_necessary_t
    (weak_complement_iff_nd_barcan.1 cl).1 (weak_complement_iff_nd_barcan.1 cl).2,
   fun c5 => weak_complement_iff_nd_barcan.2 ⟨box_elim c5, Proofs.bf_of_box_nd_t c5⟩⟩

theorem rigid_complement_tt_iff_c5 :
    RigidComplementClosure Prop ↔ NecNecessityOfDistinctness Prop :=
  ⟨fun cl => Proofs.distinctness_necessary_t_and_barcan_t_imply_necessary_distinctness_necessary_t
    (rigid_complement_iff_nd_necessary_barcan.1 cl).1
    (box_elim (rigid_complement_iff_nd_necessary_barcan.1 cl).2),
   fun c5 => rigid_complement_iff_nd_necessary_barcan.2
     ⟨box_elim c5, Proofs.necessary_distinctness_necessary_r_implies_necessary_barcan_r c5⟩⟩

end Classicism.Research.RigidityClosure
