import Classicism.Coalesced.Interpretations
import Classicism.Semantics.ExternalPinning

/-!
# The finitely pinned root

The map's `coalesced-pinned-interpretations-root` and `coalesced-pinned-substitutions-root`:
interpretation arrows (and, for the second, the maps of the constants as root endo-arrows),
with root domains **finitely pinned by constants**. A root entity of a relational type is a
landing set of root tuples pinned down by a finite set `N` of constants (`PinnedT`): two
interpretations at one object agreeing on `N` transport it alike, and so do two maps of the
constants agreeing on `N`; its value at the root's identity is otherwise unconstrained.

The pinning is Appendix D's, with constants in place of individuals, read through an
action of the sum that does not interpret the individual type (`Semantics/ExternalPinning.lean`):
the **constants action** `constsAction` has the constants at the root, and at a component
object all the elements of all its domains; `⟨V, J⟩` sends `c` to `J c`, a map of the
constants sends `c` to `f c`, and a component arrow acts as it does on the domains. Two root
arrows agree on `N` exactly when they agree, as interpretations or as maps, on `N`
(`agreeOn_arr`, `agreeOn_endo`), so pinning in that action is `PinnedT` (`pinnedO_iff`). Every
entity is finitely pinned (`finPinned`): a root entity by its set, a root individual by
itself, an element of a component by itself. So the value of every term at the root is
finitely pinned (`ExternalPinning.sem_pinned`, Proposition D.4's induction), and the sum is a
model (`isModel_pinnedSum`).
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {A : ∀ k, Premodel Sig (C k)} {M : ConstMaps Sig}

local notation "𝒮" => interpArrows A M

/-! ### The constants action -/

variable (A M) in
/-- The constants action at an object of the sum: the constants at the root, every element
of every domain at a component object. -/
def constsObj : CoalescedSum 𝒮 → Type
  | .root => Sig.Const
  | .of x => Σ σ : Ty, ((A x.1).inner σ).obj x.2

/-- The constants action on arrows. -/
def constsMap : ∀ {X Y : CoalescedSum 𝒮}, (X ⟶ Y) → constsObj A M X → constsObj A M Y
  | .root, .root, m, c => M.f m c
  | .root, .of ⟨_, _⟩, J, c => ⟨Sig.typeOf c, J c⟩
  | .of _, .root, e, _ => nomatch e
  | .of _, .of _, SigmaHom.mk j, x => ⟨x.1, ((A _).inner x.1).map j x.2⟩

theorem sigma_castD {k : ι} {V : C k} {σ τ : Ty} (h : σ = τ) (x : (A k).Dom V σ) :
    (⟨τ, castD (D := fun σ => (A k).Dom V σ) h x⟩ : Σ σ : Ty, (A k).Dom V σ) = ⟨σ, x⟩ := by
  subst h; rfl

theorem constsMap_id : ∀ (X : CoalescedSum 𝒮) (x : constsObj A M X), constsMap (𝟙 X) x = x
  | .root, c => M.f_one c
  | .of ⟨k, V⟩, ⟨σ, x⟩ => by
    show (⟨σ, ((A k).inner σ).map (𝟙 V) x⟩ : Σ σ : Ty, (A k).Dom V σ) = ⟨σ, x⟩
    rw [Functor.map_id_apply]

theorem constsMap_comp : ∀ {X Y Z : CoalescedSum 𝒮} (f : X ⟶ Y) (g : Y ⟶ Z) (x : constsObj A M X),
    constsMap (f ≫ g) x = constsMap g (constsMap f x)
  | .root, .root, .root, m, m', c => M.f_mul m m' c
  | .root, .root, .of ⟨k, V⟩, m, J, c => by
    show (⟨Sig.typeOf c, Interp.at (A := A) (k := k) (V := V) J (M.f m c) (M.typeOf_f m c)⟩ :
      Σ σ : Ty, (A k).Dom V σ) = ⟨Sig.typeOf (M.f m c), J (M.f m c)⟩
    exact sigma_castD (M.typeOf_f m c) (J (M.f m c))
  | .root, .of ⟨k, V⟩, .of ⟨_, U⟩, J, SigmaHom.mk j, c => rfl
  | .of ⟨k, _⟩, .of ⟨_, _⟩, .of ⟨_, _⟩, SigmaHom.mk j, SigmaHom.mk j', ⟨σ, x⟩ => by
    exact congrArg (Sigma.mk σ) (Functor.map_comp_apply ((A k).inner σ) j j' x)
  | _, .of _, .root, _, e, _ => nomatch e
  | .of _, .root, _, e, _, _ => nomatch e

variable (A M) in
/-- **The constants action** of the sum. -/
def constsAction : CoalescedSum 𝒮 ⥤ Type where
  obj := constsObj A M
  map f := TypeCat.ofHom (constsMap f)
  map_id X := by ext x; exact constsMap_id X x
  map_comp f g := by ext x; exact constsMap_comp f g x

local notation "De" => constsAction A M

theorem agreeOn_arr {k : ι} {V : C k} (N : Set Sig.Const) (J J' : Interp A k V) :
    AgreeOn De (W := CoalescedSum.base 𝒮) N (CoalescedSum.arr 𝒮 (iarr M J)) (CoalescedSum.arr 𝒮 (iarr M J')) ↔
      ∀ c ∈ N, J c = J' c := by
  refine forall₂_congr fun c _ => ?_
  show (⟨Sig.typeOf c, J c⟩ : Σ σ : Ty, (A k).Dom V σ) = ⟨Sig.typeOf c, J' c⟩ ↔ _
  exact ⟨fun h => eq_of_heq (Sigma.mk.inj h).2, fun h => by rw [h]⟩

theorem agreeOn_endo (N : Set Sig.Const) (m m' : M.E) :
    AgreeOn De (W := CoalescedSum.base 𝒮) N (CoalescedSum.endo 𝒮 m) (CoalescedSum.endo 𝒮 m') ↔
      ∀ c ∈ N, M.f m c = M.f m' c := Iff.rfl

/-! ### Pinning by constants -/

/-- A set of root tuples is **pinned down** by a set `N` of constants: interpretations at one
object agreeing on `N` transport it alike, and so do maps of the constants agreeing on `N`. -/
def PinnedT {ρ : RTy} {RA : Type} (N : Set Sig.Const) (X : Set (RootTuple 𝒮 A ρ RA)) : Prop :=
  (∀ (k : ι) (V : C k) (J J' : Interp A k V), (∀ c ∈ N, J c = J' c) →
      rootTransport X (iarr M J) = rootTransport X (iarr M J')) ∧
    ∀ m m' : M.E, (∀ c ∈ N, M.f m c = M.f m' c) → {q | shift m q ∈ X} = {q | shift m' q ∈ X}

theorem PinnedT.precomp {ρ : RTy} {RA : Type} {N : Set Sig.Const} {X : Set (RootTuple 𝒮 A ρ RA)}
    (hX : PinnedT N X) (m : M.E) : PinnedT (M.f m '' N) {q | shift m q ∈ X} := by
  refine ⟨fun k V J J' hJ => ?_, fun g g' hg => ?_⟩
  · refine (rootTransport_shift (S := interpArrows A M) m X (iarr M J)).trans (Eq.trans ?_
      (rootTransport_shift (S := interpArrows A M) m X (iarr M J')).symm)
    refine hX.1 k V _ _ fun c hc => ?_
    show castD (D := fun σ => (A k).Dom V σ) _ (J (M.f m c)) = castD _ (J' (M.f m c))
    rw [hJ _ ⟨c, hc, rfl⟩]
  · ext q
    show shift m (shift g q) ∈ X ↔ shift m (shift g' q) ∈ X
    rw [← shift_mul, ← shift_mul]
    exact Set.ext_iff.mp (hX.2 _ _ fun c hc => by
      rw [M.f_mul, M.f_mul, hg _ ⟨c, hc, rfl⟩]) q

variable (A M) in
/-- **The finitely pinned root domains.** -/
def pinnedSel : Selector 𝒮 A where
  sel _ _ := {X | ∃ N : Set Sig.Const, N.Finite ∧ PinnedT N X}
  shift_mem _ _ m _ := fun ⟨N, hN, hX⟩ => ⟨M.f m '' N, hN.image _, hX.precomp m⟩

theorem pinnedSel_admitsConsts : (pinnedSel A M).AdmitsConsts := by
  intro ρ RA c h
  refine ⟨{c}, Set.finite_singleton c, fun k V J J' hJ => ?_, fun m m' hm => ?_⟩
  · rw [rootTransport_hatTuples, rootTransport_hatTuples]
    show (A k).incl ρ V (castD (D := fun σ => (A k).Dom V σ) h (J c)) =
      (A k).incl ρ V (castD (D := fun σ => (A k).Dom V σ) h (J' c))
    rw [hJ c rfl]
  · ext (_ | ⟨k, U, a, J⟩)
    · exact Iff.rfl
    · show (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U ((J.comp M m).at c h) ↔
        (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U ((J.comp M m').at c h)
      erw [Interp.comp_at, Interp.comp_at, Interp.at_congr _ (hm c rfl)]

variable (A M) in
/-- The root action of the finitely pinned root. -/
noncomputable abbrev pinAction : RootAction 𝒮 A := interpAction (pinnedSel A M)

/-! ### Pinning in the constants action is pinning by constants -/

local notation "ofRT'" => ofRT (constAtom A M Ty.e) (fun i => constAtom A M (Ty.var i)) (pinnedSel A M)
local notation "toRT'" => toRT (constAtom A M Ty.e) (fun i => constAtom A M (Ty.var i)) (pinnedSel A M)

theorem ofRT_shift {ρ : RTy} (m : M.E) (Y : Intension (interpAction (pinnedSel A M)).inner ρ (CoalescedSum.base 𝒮)) :
    {q | shift m q ∈ {q | ofRT' q ∈ Y}} =
      {q | ofRT' q ∈ Intension.map (interpAction (pinnedSel A M)).inner (CoalescedSum.endo 𝒮 m) Y} := by
  ext (⟨m', a⟩ | ⟨k, U, a, r⟩) <;> rfl

theorem ofRT_ext {ρ : RTy} {Y Y' : Intension (interpAction (pinnedSel A M)).inner ρ (CoalescedSum.base 𝒮)}
    (h : {q | ofRT' q ∈ Y} = {q | ofRT' q ∈ Y'}) : Y = Y' := by
  ext p
  have := Set.ext_iff.mp h (toRT' p)
  simp only [Set.mem_ofPred_eq, ofRT_toRT] at this
  exact this

theorem transport_ext {ρ : RTy} {k : ι} {V : C k}
    {Y Y' : Intension (interpAction (pinnedSel A M)).inner ρ (CoalescedSum.of (S := 𝒮) ⟨k, V⟩)}
    (h : (interpAction (pinnedSel A M)).compI Y = (interpAction (pinnedSel A M)).compI Y') : Y = Y' :=
  (interpAction (pinnedSel A M)).compI_injective h

variable (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

local notation "P" => interpSum (pinnedSel A M) pinnedSel_admitsConsts ne

theorem pinned_endo {ρ : RTy} {N : Set Sig.Const} {Y : Intension (pinAction A M).inner ρ (CoalescedSum.base 𝒮)}
    (hT : PinnedT N {q | ofRT' q ∈ Y}) (m m' : M.E)
    (hhi : AgreeOn De (W := CoalescedSum.base 𝒮) N (CoalescedSum.endo 𝒮 m) (CoalescedSum.endo 𝒮 m')) :
    Intension.map (pinAction A M).inner (CoalescedSum.endo 𝒮 m) Y =
      Intension.map (pinAction A M).inner (CoalescedSum.endo 𝒮 m') Y := by
  apply ofRT_ext
  rw [← ofRT_shift, ← ofRT_shift]
  exact hT.2 m m' ((agreeOn_endo N m m').1 hhi)

theorem pinned_arr {ρ : RTy} {N : Set Sig.Const} {Y : Intension (pinAction A M).inner ρ (CoalescedSum.base 𝒮)}
    (hT : PinnedT N {q | ofRT' q ∈ Y}) {k : ι} {V : C k} (J J' : Interp A k V)
    (hhi : AgreeOn De (W := CoalescedSum.base 𝒮) N (CoalescedSum.arr 𝒮 (iarr M J)) (CoalescedSum.arr 𝒮 (iarr M J'))) :
    Intension.map (pinAction A M).inner (CoalescedSum.arr 𝒮 (iarr M J)) Y =
      Intension.map (pinAction A M).inner (CoalescedSum.arr 𝒮 (iarr M J')) Y := by
  apply transport_ext
  show (pinAction A M).transport (iarr M J) Y = (pinAction A M).transport (iarr M J') Y
  rw [← rootTransport_ofRT, ← rootTransport_ofRT]
  exact hT.1 k V J J' ((agreeOn_arr N J J').1 hhi)

/-- **Pinning of an intension at the root, in the constants action, is pinning by
constants.** -/
theorem pinnedO_iff {ρ : RTy} (N : Set Sig.Const) (Y : Intension (pinAction A M).inner ρ (CoalescedSum.base 𝒮)) :
    ExternalPinning.PinnedO P De (.rel ρ) (W := CoalescedSum.base 𝒮) N Y ↔ PinnedT N {q | ofRT' q ∈ Y} := by
  constructor
  · intro hY
    refine ⟨fun k V J J' hJ => ?_, fun m m' hm => ?_⟩
    · rw [rootTransport_ofRT, rootTransport_ofRT]
      exact congrArg (pinAction A M).compI (hY _ _ _ ((agreeOn_arr N J J').2 hJ))
    · rw [ofRT_shift, ofRT_shift]
      exact congrArg (fun Y' => {q | ofRT' q ∈ Y'}) (hY _ _ _ ((agreeOn_endo N m m').2 hm))
  · intro hT V h i hhi
    match V, h, i with
    | .root, m, m' => exact pinned_endo hT m m' hhi
    | .of ⟨k, V⟩, J, J' => exact pinned_arr hT J J' hhi

/-- **Every entity of the sum is finitely pinned** in the constants action: a root entity of
relational type by its own set, a root individual (or entity at a type variable) by
itself, an element of a component's domain by itself. -/
theorem finPinned : ∀ (σ : Ty) (W : CoalescedSum 𝒮) (x : (P).Dom W σ),
    ∃ N, N ∈ (PinIdeal.fin De).mem W ∧ ExternalPinning.PinnedO P De σ N ((P).Incl σ W x)
  | .e, .root, x | .var _, .root, x => by
    refine ⟨{x.1}, Set.finite_singleton _, (ExternalPinning.pinnedO_Incl_iff _ _ _ _ _).2 ?_⟩
    intro V h i hhi
    match V, h, i with
    | .root, m, m' => exact Subtype.ext (hhi x.1 rfl)
    | .of ⟨k, V⟩, J, J' =>
      have e : J x.1 = J' x.1 := ((agreeOn_arr {x.1} J J').1 hhi) x.1 rfl
      show castD (D := fun σ => (A k).Dom V σ) _ (J x.1) = castD _ (J' x.1)
      rw [e]
  | .rel ρ, .root, X => by
    obtain ⟨N, hN, hX⟩ := X.2.2
    refine ⟨N, hN, (pinnedO_iff ne N _).2 ?_⟩
    have e : {q | ofRT' q ∈ (P).Incl (.rel ρ) (CoalescedSum.base 𝒮) X} = X.1 := by
      ext q
      show toRT' (ofRT' q) ∈ X.1 ↔ q ∈ X.1
      rw [toRT_ofRT]
    rw [e]
    exact hX
  | σ, .of ⟨k, V⟩, x => by
    refine ⟨{⟨σ, x⟩}, Set.finite_singleton _, (ExternalPinning.pinnedO_Incl_iff _ _ _ _ _).2 ?_⟩
    intro W h i hhi
    match W, h, i with
    | .root, e, _ => exact nomatch e
    | .of _, SigmaHom.mk j, SigmaHom.mk j' =>
      have e := hhi ⟨σ, x⟩ rfl
      exact eq_of_heq (Sigma.mk.inj e).2

/-- **Root closure at the finitely pinned root**: the value at the root of every term is
pinned down by the constants it mentions and the sets pinning the assignment's values. -/
theorem pinned_selected (m : M.E) {Γ : Ctx} {ρ : RTy} (t : Term Sig Γ (.rel ρ))
    (g : IEnv ((P).Dom (CoalescedSum.base 𝒮)) Γ) :
    {q | ofRT' q ∈ (P).sem (CoalescedSum.endo 𝒮 m) t g} ∈ (pinnedSel A M).sel ρ _ := by
  obtain ⟨N₁, hN₁, hg⟩ := ExternalPinning.env_idealPinned P De (PinIdeal.fin De) (finPinned ne) g
  obtain ⟨N₂, hN₂, hc⟩ :=
    ExternalPinning.consts_idealPinned P De (PinIdeal.fin De) (finPinned ne) (CoalescedSum.endo 𝒮 m) t
  have hp := ExternalPinning.sem_pinned P De (CoalescedSum.endo 𝒮 m) t g (N₁ ∪ N₂)
    (fun τ v => ExternalPinning.PinnedO.mono P De Set.subset_union_left (hg τ v))
    (fun c hc' => ExternalPinning.PinnedO.mono P De Set.subset_union_right (hc c hc'))
  exact ⟨N₁ ∪ N₂, Set.Finite.union hN₁ hN₂, (pinnedO_iff ne _ _).1 hp⟩

/-- **The coalesced sum with interpretation arrows and the finitely pinned root is a
model**, whenever its components are models everywhere: for any monoid of maps of the
constants at the root, so for `coalesced-pinned-interpretations-root` (only the identity)
and `coalesced-pinned-substitutions-root` (every map). -/
theorem isModel_pinnedSum (hA : ModelsEverywhere A) : (P).IsModel :=
  (isModel_interpSum_iff _ ne hA).2 fun m _ _ t g => pinned_selected ne m t g

end Classicism.Meta.Coalesced
