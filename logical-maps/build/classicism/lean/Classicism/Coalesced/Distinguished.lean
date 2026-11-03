import Classicism.Coalesced.Full

/-!
# Distinguished arrows: Appendix E and Theorem 3.26

Appendix E's coalesced sum: one distinguished arrow from the new root `W₀` to the base `W k`
of each component `A k`, the other root arrows into the component being the arrows `h ∘ k`
for `h` out of `W k` (`RootArrows.distinguished`). Along `h ∘ k` the transported constants
are the component's moved along `h`, when the root value of each constant is transported
along the distinguished arrow to the component's (`hI`); so the component seen from
`h ∘ k` is the truncation of `A k` by `h` (`component_eq_truncate`), a model when `A k` is.

* With the fullest root domains the sum is a model (`isModel_distinguished`), whatever the
  root individuals: any set `X` with functions `k^e : X → W_k^e` (`pointAtom`), Appendix E's
  product with its projections (`productAtom`) being one choice.
* The root value of a constant may be any element transported to the component's values;
  Appendix E's choice, the union of the components' intensions with the empty extension at
  `W₀`, is `productConst`.
* **Theorem 3.26** (`theorem_3_26`): every component is the truncation of the sum by its
  distinguished arrow; so a sentence true in some component is possible at the root
  (`holds_dia_distinguished`).
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  (A : ∀ k, Premodel Sig (C k))

/-- The distinguished arrows into the bases of the components. -/
abbrev baseArrows : RootArrows C := RootArrows.distinguished fun k => (A k).W₀

/-- The distinguished arrow from the root to the base of component `k`. -/
abbrev dist (k : ι) : (baseArrows A).R.obj ⟨k, (A k).W₀⟩ := 𝟙 (A k).W₀

/-! ### The components seen from root arrows are truncations -/

section Components

variable {A} (RA : RootAction (baseArrows A) A) (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c))

/-- The root value of each constant is transported along each distinguished arrow to the
component's value. -/
def TransportsConstants : Prop :=
  ∀ (c : Sig.Const) (k : ι), RA.tr _ (dist A k) (I c) = (A k).I c

variable {RA I}

theorem tr_eq_map (hI : TransportsConstants RA I) (c : Sig.Const) {k : ι} {V : C k}
    (h : (A k).W₀ ⟶ V) : RA.tr _ h (I c) = ((A k).inner _).map h ((A k).I c) := by
  have := RA.tr_map _ h (dist A k) (I c)
  rw [hI c k] at this
  rw [← this]
  show RA.tr _ h (I c) = RA.tr _ (𝟙 _ ≫ h) (I c)
  rw [Category.id_comp]

/-- **Along `h ∘ k`, the component seen from the root arrow is the truncation of `A k` by
`h`.** -/
theorem component_eq_truncate (hI : TransportsConstants RA I) {k : ι} {V : C k} (h : (A k).W₀ ⟶ V) :
    RA.component I h = (A k).truncate h :=
  congrArg ((A k).rebase V) (funext fun c => tr_eq_map hI c h)

/-- Along the distinguished arrow itself, the component seen from it is the component. -/
theorem component_dist (hI : TransportsConstants RA I) (k : ι) : RA.component I (dist A k) = A k :=
  congrArg ((A k).rebase (A k).W₀) (funext fun c => hI c k)

theorem componentsAreModels (hI : TransportsConstants RA I) (M : ∀ k, (A k).IsModel) :
    RA.ComponentsAreModels I := fun {k V} h => by
  rw [component_eq_truncate hI h]
  exact (A k).isModel_truncate h (M k)

end Components

/-! ### Root individuals -/

/-- Root data at a non-relational type `σ` from a set `X` with a function into the domain
at the base of each component: transport along `h ∘ k` is `h` after the function. -/
def pointAtom (σ : Ty) (X : Type) (f : ∀ k, X → (A k).Dom (A k).W₀ σ) : AtomAction (baseArrows A) A σ where
  D := X
  tr h x := ((A _).inner σ).map h (f _ x)
  trE _ x := x
  tr_map {k} {V} _ j h x := ((A k).inner σ).map_comp_apply (h : (A k).W₀ ⟶ V) j (f k x)
  tr_act _ _ _ := rfl
  trE_one _ := rfl
  trE_mul _ _ _ := rfl

/-- Appendix E's root individuals: the product of the domains at the bases, with its
projections. -/
abbrev productAtom (σ : Ty) : AtomAction (baseArrows A) A σ :=
  pointAtom A σ (∀ k, (A k).Dom (A k).W₀ σ) (fun k x => x k)

/-- The fullest root action over the distinguished arrows, with Appendix E's product root
individuals. -/
noncomputable abbrev appendixE : RootAction (baseArrows A) A :=
  fullAction (productAtom A .e) (fun i => productAtom A (.var i))

/-! ### Root values of the constants -/

/-- The intension at the root that is the union of the components' intensions `y k`:
`{⟨ā, h ∘ k⟩ | ⟨ā, h⟩ ∈ y k}`, with the empty extension at `W₀`. -/
def unionTuples {ρ : RTy} {RA : Type} (y : ∀ k, (A k).Dom (A k).W₀ (.rel ρ)) :
    Set (RootTuple (baseArrows A) A ρ RA)
  | .inl _ => False
  | .inr ⟨k, U, a, h⟩ => (⟨U, a, h⟩ : Tuple (A k).inner ρ (A k).W₀) ∈ (A k).incl ρ _ (y k)

theorem rootTransport_unionTuples {ρ : RTy} {RA : Type} (y : ∀ k, (A k).Dom (A k).W₀ (.rel ρ))
    {k : ι} {V : C k} (h : (A k).W₀ ⟶ V) :
    rootTransport (unionTuples A (RA := RA) y) h = (A k).incl ρ V (((A k).inner (.rel ρ)).map h (y k)) := by
  rw [(A k).incl_map]; rfl

/-- Appendix E's root value with the given values at the bases: the value itself at `e`
and at type variables, the union of the intensions at a relational type. -/
noncomputable def productConst : ∀ σ : Ty, (∀ k, (A k).Dom (A k).W₀ σ) → (appendixE A).D σ
  | .e, y => y
  | .var _, y => y
  | .rel _, y => ⟨unionTuples A y, fun h => ⟨_, (rootTransport_unionTuples A y h).symm⟩, trivial⟩

theorem tr_productConst : ∀ (σ : Ty) (y : ∀ k, (A k).Dom (A k).W₀ σ) (k : ι),
    (appendixE A).tr σ (dist A k) (productConst A σ y) = y k
  | .e, y, k => by
    show ((A k).inner .e).map (𝟙 _) (y k) = y k
    rw [Functor.map_id]; rfl
  | .var _, y, k => by
    show ((A k).inner _).map (𝟙 _) (y k) = y k
    rw [Functor.map_id]; rfl
  | .rel ρ, y, k => by
    apply (A k).incl_injective ρ _
    refine (incl_relLevel_tr Selector.all ρ _ (dist A k) _).trans ?_
    exact (rootTransport_unionTuples A y _).trans
      (congrArg ((A k).incl ρ _) (((A k).inner (.rel ρ)).map_id_apply _ (y k)))

/-- Appendix E's root values of the constants. -/
noncomputable abbrev appendixEConst (c : Sig.Const) : (appendixE A).D (Sig.typeOf c) :=
  productConst A _ (fun k => (A k).I c)

theorem transportsConstants_appendixE : TransportsConstants (appendixE A) (appendixEConst A) :=
  fun _ k => tr_productConst A _ _ k

/-! ### Appendix E and Theorem 3.26 -/

section AppendixE

variable (ae : AtomAction (baseArrows A) A .e) (av : ∀ i, AtomAction (baseArrows A) A (.var i))
  (ne : Nonempty ae.D) (I : ∀ c : Sig.Const, (fullAction ae av).D (Sig.typeOf c))

local notation "P" => RootAction.coalescedSum (fullAction ae av) (fullRootIncl ae av) ne I

/-- **Appendix E**: the coalesced sum of models over the distinguished arrows, with the
fullest root domains, any root individuals, and any root values of the constants
transported to the components' values, is a model. -/
theorem isModel_distinguished (hI : TransportsConstants (fullAction ae av) I) (M : ∀ k, (A k).IsModel) :
    (P).IsModel :=
  isModel_full ae av ne I (componentsAreModels hI M)

/-- **Theorem 3.26**: each component is the truncation of the coalesced sum by its
distinguished arrow. Relative to every arrow `j` out of the component's base, the value of
every term in the truncation is its value in the component. -/
theorem theorem_3_26 (hI : TransportsConstants (fullAction ae av) I) (k : ι) {Γ : Ctx} {σ : Ty} {U : C k}
    (j : (A k).W₀ ⟶ U) (t : Term Sig Γ σ) (g : IEnv ((A k).Dom U) Γ) :
    (fullAction ae av).compO σ (((P).truncate (CoalescedSum.arr _ (dist A k))).sem (CoalescedSum.inc _ j) t g)
      = (A k).sem j t g := by
  exact ((fullAction ae av).truncate_arr_sem (fullRootIncl ae av) ne I (dist A k) j t g).trans
    ((A k).rebase_sem_congr (funext fun c => hI c k) j t g)

/-- Each component holds the same sentences as the truncation by its distinguished arrow. -/
theorem holdsSentence_truncate_dist (hI : TransportsConstants (fullAction ae av) I) (k : ι)
    (p : Sentence Sig) :
    ((P).truncate (CoalescedSum.arr _ (dist A k))).HoldsSentence p ↔ (A k).HoldsSentence p := by
  have := (fullAction ae av).holdsSentence_truncate_arr (fullRootIncl ae av) ne I (dist A k) p
  rw [component_dist hI k] at this
  exact this

/-- **A sentence true in some component is possible at the root of the coalesced sum.** -/
theorem holds_dia_distinguished (hI : TransportsConstants (fullAction ae av) I) (M : ∀ k, (A k).IsModel)
    {k : ι} {p : Sentence Sig} (h : (A k).HoldsSentence p) : (P).HoldsSentence (Term.dia p) :=
  (fullAction ae av).holds_dia_of_component (fullRootIncl ae av) ne I
    (isModel_distinguished A ae av ne I hI M) (dist A k) (by rw [component_dist hI k]; exact h)

end AppendixE

/-- **Theorem 3.26**, as the paper states it: for any family of intensional action models on
disjoint categories there is a model of which every member is a truncation, holding the same
sentences, and agreeing with it on the value of every term relative to every arrow (read
through `compO`). The model is Appendix E's: product root individuals, fullest root
domains, the unions of the components' intensions as root values of the constants. -/
theorem coalesced_sum_theorem (M : ∀ k, (A k).IsModel) :
    let ne : Nonempty (productAtom A .e).D := ⟨fun k => Classical.choice ((A k).nonempty_e _)⟩
    let P := (appendixE A).coalescedSum (fullRootIncl _ _) ne (appendixEConst A)
    P.IsModel ∧ ∀ (k : ι) (p : Sentence Sig),
      (P.truncate (CoalescedSum.arr _ (dist A k))).HoldsSentence p ↔ (A k).HoldsSentence p :=
  ⟨isModel_distinguished A _ _ _ _ (transportsConstants_appendixE A) M,
    fun k p => holdsSentence_truncate_dist A _ _ _ _ (transportsConstants_appendixE A) k p⟩

end Classicism.Meta.Coalesced
