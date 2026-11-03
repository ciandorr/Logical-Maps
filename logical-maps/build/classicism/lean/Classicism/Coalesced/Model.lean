import Classicism.Coalesced.Transport

/-!
# When a coalesced sum is a model

The second induction of the proof in Classicism, Appendix E, in general form, and its
consequences.

* **Root closure** (`isModel_iff`): the coalesced sum is a model iff every component seen
  from a root arrow is a model and the root domains are closed under the language at the
  root, the value of every term relative to every root endo-arrow being inner. Along root
  arrows the transport theorem reduces the model condition to the components'.
* **Fullest domains** (`isModel_of_fullest`): if every intension at the root that *lands*
  (its transport along every root arrow is in the component's domain) is in the root
  domain, root closure holds, and the sum is a model when the components seen from root
  arrows are. Where the paper inducts on terms at the identity arrow, here the transport
  of a value at the root is a value along a root arrow (`sem_push`), so lands, by the
  transport theorem.
* **Truncations and possibility**: the truncation of the sum by a root arrow `r` is the
  component seen from `r` (`truncate_arr_sem`, the general form of Theorem 3.26), so a
  sentence holding there is possible at the root (`holds_dia_of_component`), and a
  sentence necessary at the root holds there.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)}

namespace RootAction

variable (RA : RootAction S A)

/-- An intension at the root **lands** when its transport along every root arrow is in the
component's domain. -/
def Lands {ρ : RTy} (Y : Intension RA.inner ρ (CoalescedSum.base S)) : Prop :=
  ∀ {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩), RA.transport r Y ∈ Set.range ((A k).incl ρ V)

variable (RI : RootIncl RA)

/-- The root domains are the **fullest**: every landing intension at the root is the
inclusion of an element of the root domain. -/
def Fullest : Prop :=
  ∀ (ρ : RTy) (Y : Intension RA.inner ρ (CoalescedSum.base S)), RA.Lands Y → Y ∈ Set.range (RI.incl ρ)

/-- Every element of a root domain lands. -/
theorem lands_incl {ρ : RTy} (x : RA.D (.rel ρ)) : RA.Lands (RI.incl ρ x) :=
  fun r => ⟨_, RI.incl_tr ρ r x⟩

variable (ne : Nonempty (RA.D .e)) (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c))

local notation "P" => RA.coalescedSum RI ne I

/-- Every component seen from a root arrow is a model. -/
def ComponentsAreModels : Prop :=
  ∀ {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩), (RA.component I r).IsModel

/-- **Root closure**: relative to every root endo-arrow and every assignment at the root,
the value of every term is inner. With only the identity at the root, this says that the
root domains are closed under the operations of the language there. -/
def RootClosed : Prop :=
  ∀ (m : S.End) {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) (g : IEnv RA.D Γ),
    (P).sem (CoalescedSum.endo S m) t g ∈ Set.range ((P).Incl σ (CoalescedSum.base S))

/-- Along a root arrow into a component seen as a model, every value is inner. -/
theorem sem_arr_inner {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) (hQ : (RA.component I r).IsModel)
    {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) (g : IEnv ((A k).Dom V) Γ) :
    (P).sem (CoalescedSum.arr S r) t g ∈ Set.range ((P).Incl σ (.of ⟨k, V⟩)) := by
  obtain ⟨y, hy⟩ := hQ (𝟙 V) t g
  refine ⟨y, RA.compO_injective σ ?_⟩
  rw [RA.compO_Incl RI ne I, RA.sem_arr RI ne I r t g, ← hy, component_Incl]

/-- **Root closure**: the coalesced sum is a model iff every component seen from a root
arrow is a model and the root domains are closed under the language at the root. -/
theorem isModel_iff : (P).IsModel ↔ RA.ComponentsAreModels I ∧ RA.RootClosed RI ne I := by
  constructor
  · intro M
    refine ⟨fun {k V} r {Γ σ U} j t g => ?_, fun m _ _ t g => M (CoalescedSum.endo S m) t g⟩
    obtain ⟨y, hy⟩ := M (CoalescedSum.arr S (S.R.map (SigmaHom.mk j) r)) t g
    exact ⟨y, (congrFun (RA.component_Incl I r σ U) y).trans
      ((RA.compO_Incl RI ne I σ y).symm.trans ((congrArg (RA.compO σ) hy).trans
        (RA.sem_transport RI ne I r j t g)))⟩
  · rintro ⟨hQ, hR⟩ Γ σ W h t g
    match W, h with
    | .root, m => exact hR m t g
    | .of ⟨_, _⟩, r => exact RA.sem_arr_inner RI ne I r (hQ r) t g

/-- When the components seen from root arrows are models, the value of every term at the
root, relative to every root endo-arrow, lands: its transport along a root arrow `r` is its
value relative to `m` followed by `r` (`sem_push`), inner by the transport theorem. -/
theorem lands_sem_endo (hQ : RA.ComponentsAreModels I) (m : S.End) {Γ : Ctx} {ρ : RTy}
    (t : Term Sig Γ (.rel ρ)) (g : IEnv RA.D Γ) : RA.Lands ((P).sem (CoalescedSum.endo S m) t g) := by
  intro k V r
  have hpush := (P).sem_push (CoalescedSum.endo S m) t g (CoalescedSum.arr S r)
  obtain ⟨y, hy⟩ := RA.sem_arr_inner RI ne I (S.act m r) (hQ _) t ((P).push (CoalescedSum.arr S r) g)
  refine ⟨y, ?_⟩
  show (A k).incl ρ V y = RA.compI (Intension.map RA.inner (CoalescedSum.arr S r) _)
  rw [← RA.compI_incl RI ρ V y]
  exact congrArg RA.compI (hy.trans hpush)

/-- Root closure holds iff, at every relational type, the values of the terms at the root
are in the root domain: at `e` and at type variables every value is inner. -/
theorem rootClosed_iff_rel : RA.RootClosed RI ne I ↔
    ∀ (m : S.End) {Γ : Ctx} {ρ : RTy} (t : Term Sig Γ (.rel ρ)) (g : IEnv RA.D Γ),
      (P).sem (CoalescedSum.endo S m) t g ∈ Set.range (RI.incl ρ) := by
  refine ⟨fun H m Γ ρ t g => H m t g, fun H m Γ σ t g => ?_⟩
  cases σ with
  | e => exact ⟨_, rfl⟩
  | var _ => exact ⟨_, rfl⟩
  | rel ρ => exact H m t g

/-- With the fullest root domains, root closure holds as soon as the components seen from
root arrows are models. -/
theorem rootClosed_of_fullest (hQ : RA.ComponentsAreModels I) (hF : RA.Fullest RI) : RA.RootClosed RI ne I :=
  (RA.rootClosed_iff_rel RI ne I).2 fun m _ ρ t g => hF ρ _ (RA.lands_sem_endo RI ne I hQ m t g)

/-- **Appendix E, in general form**: a coalesced sum with the fullest root domains, whose
components seen from root arrows are models, is a model. -/
theorem isModel_of_fullest (hQ : RA.ComponentsAreModels I) (hF : RA.Fullest RI) : (P).IsModel :=
  (RA.isModel_iff RI ne I).2 ⟨hQ, RA.rootClosed_of_fullest RI ne I hQ hF⟩

/-! ### Truncations and possibility -/

/-- **The truncation of the coalesced sum by a root arrow `r` is the component seen from
`r`**: their values agree relative to every arrow out of `r`'s target. The general form of
Theorem 3.26. -/
theorem truncate_arr_sem {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) {Γ : Ctx} {σ : Ty} {U : C k}
    (j : V ⟶ U) (t : Term Sig Γ σ) (g : IEnv ((A k).Dom U) Γ) :
    RA.compO σ (((P).truncate (CoalescedSum.arr S r)).sem (CoalescedSum.inc S j) t g)
      = (RA.component I r).sem j t g := by
  have e := (P).sem_truncate (CoalescedSum.arr S r) (CoalescedSum.inc S j) t g
  exact (congrArg (RA.compO σ) e).trans (RA.sem_transport RI ne I r j t g)

theorem holdsSentence_truncate_arr {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) (p : Sentence Sig) :
    ((P).truncate (CoalescedSum.arr S r)).HoldsSentence p ↔ (RA.component I r).HoldsSentence p := by
  exact ((P).holdsSentence_truncate _ p).trans (RA.holds_arr_sentence RI ne I r p)

/-- **A sentence holding in a component seen from a root arrow is possible at the root.** -/
theorem holds_dia_of_component (M : (P).IsModel) {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩)
    {p : Sentence Sig} (h : (RA.component I r).HoldsSentence p) : (P).HoldsSentence (Term.dia p) :=
  ((P).dia_iff_truncate M p).2 ⟨_, CoalescedSum.arr S r, (RA.holdsSentence_truncate_arr RI ne I r p).2 h⟩

/-- A sentence necessary at the root holds in every component seen from a root arrow. -/
theorem component_of_holds_box (M : (P).IsModel) {p : Sentence Sig} (h : (P).HoldsSentence (Term.box p))
    {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) : (RA.component I r).HoldsSentence p :=
  (RA.holdsSentence_truncate_arr RI ne I r p).1 (((P).box_iff_truncate M p).1 h _ _)

end RootAction

end Classicism.Meta.Coalesced
