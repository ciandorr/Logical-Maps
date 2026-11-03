import Classicism.Coalesced.Full
import Classicism.Coalesced.Parameters

/-!
# Interpretation arrows

The root arrows of the interpretation-arrow members of the map's group `coalesced-sums`
(`root-arrows: interpretations` and `interpretations-and-substitutions`). For a signature
`Σ⁺` (here `Sig`) and components `A k`, the root has an arrow `⟨V, J⟩` into each object `V`
of each component for each **interpretation** `J` of `Σ⁺` at `V` (`Interp`), a value in
`V`'s domain for each constant; a component arrow `j : V → U` composes with it to give
`⟨U, j·J⟩`. The root endo-arrows are a monoid of type-preserving **maps of the constants**
(`ConstMaps`), only the identity (`ConstMaps.trivial`) for `root-arrows: interpretations`,
every such map (`ConstMaps.all`) for the substitution member; a map `f` followed by `⟨V, J⟩`
is `⟨V, J ∘ f⟩` (`interpArrows`).

The root individuals, and the root entities at type variables, are the constants of that
type (`constAtom`): `⟨V, J⟩` sends `c` to `J c`, and `f` sends it to `f c`. The root value
of a constant `c` is `ĉ` (`hatConst`): `c` itself at `e` and at type variables, and at a
relational type the intension with transport `J c` along `⟨V, J⟩` and the empty extension
at every endo-arrow (`hatTuples`).

Then the component seen from `⟨V, J⟩` is `V`'s component re-based at `V` with the
interpretation `J` (`component_hat`), a model whenever the component's pure reduct is a
model at `V` (`Premodel.isModel_rebase`, constants as parameters); so the components seen
from root arrows are models (`componentsAreModels_hat`) and the sum is a model iff the
root domains are closed under the language at the root (`isModel_interpSum_iff`). The root
domains are chosen by a selector (`Full.lean`); the definable and the finitely pinned ones
are `Definable.lean` and `Pinned.lean`.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]

/-! ### Casts between the domains of equal types -/

/-- An element of a family at `σ`, read at `τ = σ`. -/
def castD {D : Ty → Type} {σ τ : Ty} (h : σ = τ) (x : D σ) : D τ := h ▸ x

@[simp] theorem castD_rfl {D : Ty → Type} {σ : Ty} (x : D σ) : castD (D := D) rfl x = x := rfl

theorem castD_castD {D : Ty → Type} {σ τ υ : Ty} (h : σ = τ) (h' : τ = υ) (x : D σ) :
    castD (D := D) h' (castD h x) = castD (h.trans h') x := by
  subst h; subst h'; rfl

theorem castD_map {D D' : Ty → Type} (f : ∀ σ, D σ → D' σ) {σ τ : Ty} (h : σ = τ) (x : D σ) :
    f τ (castD h x) = castD h (f σ x) := by
  subst h; rfl

/-! ### Interpretations -/

variable (A : ∀ k, Premodel Sig (C k))

/-- An **interpretation** of the signature at an object `V` of the component `k`: a value in
`V`'s domain for each constant. -/
abbrev Interp (k : ι) (V : C k) : Type := ∀ c : Sig.Const, (A k).Dom V (Sig.typeOf c)

variable {A}

/-- An interpretation moved along a component arrow. -/
def Interp.map {k : ι} {V U : C k} (j : V ⟶ U) (J : Interp A k V) : Interp A k U :=
  fun c => ((A k).inner _).map j (J c)

theorem Interp.map_id {k : ι} {V : C k} (J : Interp A k V) : J.map (𝟙 V) = J :=
  funext fun c => ((A k).inner _).map_id_apply _ (J c)

theorem Interp.map_comp {k : ι} {V U T : C k} (j : V ⟶ U) (j' : U ⟶ T) (J : Interp A k V) :
    J.map (j ≫ j') = (J.map j).map j' :=
  funext fun c => ((A k).inner _).map_comp_apply j j' (J c)

/-- The value of a constant `c` under an interpretation, read at a type `σ = Sig.typeOf c`. -/
abbrev Interp.at {k : ι} {V : C k} (J : Interp A k V) {σ : Ty} (c : Sig.Const)
    (h : Sig.typeOf c = σ) : (A k).Dom V σ :=
  castD (D := fun σ => (A k).Dom V σ) h (J c)

theorem Interp.at_congr {k : ι} {V : C k} (J : Interp A k V) {σ : Ty} {c c' : Sig.Const}
    (e : c = c') (h : Sig.typeOf c = σ) (h' : Sig.typeOf c' = σ) : J.at c h = J.at c' h' := by
  subst e; rfl

theorem Interp.map_at {k : ι} {V U : C k} (j : V ⟶ U) (J : Interp A k V) {σ : Ty} (c : Sig.Const)
    (h : Sig.typeOf c = σ) : (J.map j).at c h = ((A k).inner σ).map j (J.at c h) := by
  subst h; rfl

/-! ### Maps of the constants -/

variable (Sig) in
/-- A monoid of type-preserving maps of the constants, written diagrammatically: `mul m m'`
is `m` followed by `m'`, the map `f m' ∘ f m`. -/
structure ConstMaps where
  /-- The maps' names. -/
  E : Type
  /-- The map named by each. -/
  f : E → Sig.Const → Sig.Const
  typeOf_f : ∀ m c, Sig.typeOf (f m c) = Sig.typeOf c
  /-- The identity. -/
  one : E
  /-- Composition, diagrammatically. -/
  mul : E → E → E
  f_one : ∀ c, f one c = c
  f_mul : ∀ m m' c, f (mul m m') c = f m' (f m c)
  one_mul : ∀ m, mul one m = m
  mul_one : ∀ m, mul m one = m
  mul_assoc : ∀ m m' m'', mul (mul m m') m'' = mul m (mul m' m'')

namespace ConstMaps

variable (Sig) in
/-- Only the identity: `root-arrows: interpretations`. -/
def trivial : ConstMaps Sig where
  E := PUnit
  f _ c := c
  typeOf_f _ _ := rfl
  one := PUnit.unit
  mul _ _ := PUnit.unit
  f_one _ := rfl
  f_mul _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_assoc _ _ _ := rfl

variable (Sig) in
/-- Every type-preserving map of the constants: `root-arrows: interpretations-and-substitutions`. -/
def all : ConstMaps Sig where
  E := {f : Sig.Const → Sig.Const // ∀ c, Sig.typeOf (f c) = Sig.typeOf c}
  f m := m.1
  typeOf_f m := m.2
  one := ⟨id, fun _ => rfl⟩
  mul m m' := ⟨m'.1 ∘ m.1, fun c => (m'.2 _).trans (m.2 c)⟩
  f_one _ := rfl
  f_mul _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_assoc _ _ _ := rfl

end ConstMaps

variable (M : ConstMaps Sig)

/-- A map of the constants followed by an interpretation: `J ∘ f`. -/
def Interp.comp {k : ι} {V : C k} (m : M.E) (J : Interp A k V) : Interp A k V :=
  fun c => J.at (M.f m c) (M.typeOf_f m c)

theorem Interp.comp_at {k : ι} {V : C k} (m : M.E) (J : Interp A k V) {σ : Ty} (c : Sig.Const)
    (h : Sig.typeOf c = σ) : (J.comp M m).at c h = J.at (M.f m c) ((M.typeOf_f m c).trans h) := by
  subst h
  exact castD_castD (D := fun σ => (A k).Dom V σ) _ rfl (J (M.f m c))

theorem Interp.comp_one {k : ι} {V : C k} (J : Interp A k V) : J.comp M M.one = J :=
  funext fun c => (J.at_congr (M.f_one c) _ rfl)

theorem Interp.comp_mul {k : ι} {V : C k} (m m' : M.E) (J : Interp A k V) :
    J.comp M (M.mul m m') = (J.comp M m').comp M m :=
  funext fun c => by
    show J.at _ _ = (J.comp M m').at (M.f m c) (M.typeOf_f m c)
    rw [Interp.comp_at]
    exact J.at_congr (M.f_mul m m' c) _ _

theorem Interp.map_comp' {k : ι} {V U : C k} (j : V ⟶ U) (m : M.E) (J : Interp A k V) :
    (J.comp M m).map j = (J.map j).comp M m :=
  funext fun c => by
    show ((A k).inner _).map j (J.at _ _) = (J.map j).at _ _
    rw [Interp.map_at]

variable (A)

/-- The interpretation arrows composed with the component arrows. -/
def interpMap : ∀ {x y : Σ k, C k}, (x ⟶ y) → Interp A x.1 x.2 → Interp A y.1 y.2
  | _, _, SigmaHom.mk j => Interp.map j

/-- The action of the interpretation arrows: the interpretations at each component object. -/
def interpR : (Σ k, C k) ⥤ Type where
  obj x := Interp A x.1 x.2
  map f := TypeCat.ofHom (interpMap A f)
  map_id x := by
    rcases x with ⟨k, V⟩
    ext J c; exact congrFun (Interp.map_id J) c
  map_comp f g := by
    rcases f with ⟨j⟩; rcases g with ⟨j'⟩
    ext J c; exact congrFun (Interp.map_comp j j' J) c

/-- **The interpretation arrows**: an arrow `⟨V, J⟩` into each component object `V` for each
interpretation `J` at `V`, and the maps of the constants `M` at the root, acting by
precomposition. Reducible, so that the arrows into `V` are the interpretations to the
elaborator. -/
abbrev interpArrows : RootArrows C where
  R := interpR A
  End := M.E
  one := M.one
  mul := M.mul
  act m J := Interp.comp M m J
  one_mul := M.one_mul
  mul_one := M.mul_one
  mul_assoc := M.mul_assoc
  act_one J := Interp.comp_one M J
  act_mul m m' J := Interp.comp_mul M m m' J
  act_natural {x y} f m J := by
    rcases f with ⟨j⟩
    exact Interp.map_comp' M j m J

example (k : ι) (V : C k) : (interpArrows A M).R.obj ⟨k, V⟩ = Interp A k V := rfl

variable {A} in
/-- An interpretation, as a root arrow. -/
abbrev iarr {k : ι} {V : C k} (J : Interp A k V) : (interpArrows A M).R.obj ⟨k, V⟩ := J

theorem interpArrows_map {k : ι} {V U : C k} (j : V ⟶ U) (J : Interp A k V) :
    (interpArrows A M).R.map (SigmaHom.mk j) J = J.map j := rfl

theorem interpArrows_act {k : ι} {V : C k} (m : M.E) (J : Interp A k V) :
    (interpArrows A M).act (x := ⟨k, V⟩) m J = J.comp M m := rfl

/-! ### Root individuals: the constants -/

/-- The root entities at a non-relational type `σ`: the constants of type `σ`, sent along
`⟨V, J⟩` to their interpretations and along a map of the constants to their images. -/
def constAtom (σ : Ty) : AtomAction (interpArrows A M) A σ where
  D := {c : Sig.Const // Sig.typeOf c = σ}
  tr J c := Interp.at J c.1 c.2
  trE m c := ⟨M.f m c.1, (M.typeOf_f m c.1).trans c.2⟩
  tr_map j J c := Interp.map_at j J c.1 c.2
  tr_act m J c := Interp.comp_at M m J c.1 c.2
  trE_one c := Subtype.ext (M.f_one c.1)
  trE_mul m m' c := Subtype.ext (M.f_mul m m' c.1)

variable {A M}

/-! ### The root values of the constants -/

/-- The intension `ĉ` of a relational constant at the root, as a set of root tuples:
transported to `J c` along `⟨V, J⟩`, with the empty extension at every endo-arrow. -/
def hatTuples {ρ : RTy} {RA : Type} (c : Sig.Const) (h : Sig.typeOf c = .rel ρ) :
    Set (RootTuple (interpArrows A M) A ρ RA)
  | .inl _ => False
  | .inr ⟨k, U, a, J⟩ => (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U (Interp.at (A := A) (k := k) (V := U) J c h)

theorem rootTransport_hatTuples {ρ : RTy} {RA : Type} (c : Sig.Const) (h : Sig.typeOf c = .rel ρ)
    {k : ι} {V : C k} (J : Interp A k V) :
    rootTransport (hatTuples (M := M) (RA := RA) c h) J = (A k).incl ρ V (J.at c h) := by
  ext ⟨U, a, j⟩
  show (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U ((J.map j).at c h) ↔ _
  rw [Interp.map_at, (A k).incl_map]
  show (⟨U, a, j ≫ 𝟙 U⟩ : Tuple (A k).inner ρ V) ∈ (A k).incl ρ V (J.at c h) ↔ _
  rw [Category.comp_id]

theorem landsT_hatTuples {ρ : RTy} {RA : Type} (c : Sig.Const) (h : Sig.typeOf c = .rel ρ) :
    LandsT (hatTuples (A := A) (M := M) (RA := RA) c h) :=
  fun J => ⟨_, (rootTransport_hatTuples c h J).symm⟩

variable (sel : Selector (interpArrows A M) A)

/-- The root action of the interpretation arrows: the constants at `e` and at type
variables, the selected landing intensions at relational types. -/
noncomputable abbrev interpAction : RootAction (interpArrows A M) A :=
  selAction (constAtom A M .e) (fun i => constAtom A M (.var i)) sel

/-- Its root inclusion. -/
noncomputable abbrev interpIncl : RootIncl (interpAction sel) :=
  selIncl (constAtom A M .e) (fun i => constAtom A M (.var i)) sel

/-- The selector **admits the constants** when it selects every `ĉ`. -/
def Selector.AdmitsConsts : Prop :=
  ∀ (ρ : RTy) (RA : Type) (c : Sig.Const) (h : Sig.typeOf c = .rel ρ),
    hatTuples (A := A) (M := M) (RA := RA) c h ∈ sel.sel ρ RA

variable {sel}

/-- **`ĉ`**, the root value of a constant `c`, read at a type `σ = Sig.typeOf c`. -/
noncomputable def hatConst (hs : sel.AdmitsConsts) : ∀ (σ : Ty) (c : Sig.Const),
    Sig.typeOf c = σ → (interpAction sel).D σ
  | .e, c, h => ⟨c, h⟩
  | .var _, c, h => ⟨c, h⟩
  | .rel ρ, c, h => ⟨hatTuples c h, landsT_hatTuples c h, hs ρ _ c h⟩

/-- The root values of the constants. -/
noncomputable abbrev hatI (hs : sel.AdmitsConsts) (c : Sig.Const) : (interpAction sel).D (Sig.typeOf c) :=
  hatConst hs _ c rfl

theorem tr_hatConst (hs : sel.AdmitsConsts) : ∀ (σ : Ty) (c : Sig.Const) (h : Sig.typeOf c = σ)
    {k : ι} {V : C k} (J : Interp A k V), (interpAction sel).tr σ J (hatConst hs σ c h) = J.at c h
  | .e, _, _, _, _, _ => rfl
  | .var _, _, _, _, _, _ => rfl
  | .rel ρ, c, h, k, V, J => by
    apply (A k).incl_injective ρ V
    exact (incl_relLevel_tr sel ρ _ J _).trans (rootTransport_hatTuples c h J)

/-- Along `⟨V, J⟩` the constants are transported to their interpretations. -/
theorem tr_hatI (hs : sel.AdmitsConsts) (c : Sig.Const) {k : ι} {V : C k} (J : Interp A k V) :
    (interpAction sel).tr _ J (hatI hs c) = J c :=
  tr_hatConst hs _ c rfl J

/-- **The component seen from `⟨V, J⟩` is `V`'s component re-based at `V` with the
interpretation `J`.** -/
theorem component_hat (hs : sel.AdmitsConsts) {k : ι} {V : C k} (J : Interp A k V) :
    (interpAction sel).component (hatI hs) (k := k) (V := V) J = (A k).rebase V J :=
  congrArg ((A k).rebase V) (funext fun c => tr_hatI hs c J)

/-- The components are **models everywhere**: each one's pure reduct is a model at every
object. -/
def ModelsEverywhere (A : ∀ k, Premodel Sig (C k)) : Prop := ∀ (k : ι) (V : C k), ((A k).reductAt V).IsModel

theorem componentsAreModels_hat (hs : sel.AdmitsConsts) (hA : ModelsEverywhere A) :
    (interpAction sel).ComponentsAreModels (hatI hs) := fun {k V} J => by
  rw [component_hat hs J]
  exact (A k).isModel_rebase V J (hA k V)

variable (sel) in
/-- **The coalesced sum over the interpretation arrows**, with the selected root domains and
the constants denoting `ĉ`. Its root has an individual when the signature has a constant of
type `e`. -/
noncomputable abbrev interpSum (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e}) :
    Premodel Sig (CoalescedSum (interpArrows A M)) :=
  (interpAction sel).coalescedSum (interpIncl sel) ne (hatI hs)

/-- **Root closure for the interpretation arrows**: when the components are models
everywhere, the sum is a model iff the selector selects the value at the root of every
term of relational type. -/
theorem isModel_interpSum_iff (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})
    (hA : ModelsEverywhere A) :
    (interpSum sel hs ne).IsModel ↔
      ∀ (m : M.E) {Γ : Ctx} {ρ : RTy} (t : Term Sig Γ (.rel ρ)) (g : IEnv (interpAction sel).D Γ),
        {q | ofRT _ _ sel q ∈ (interpSum sel hs ne).sem (CoalescedSum.endo _ m) t g} ∈
          sel.sel ρ (selArgsT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel ρ) := by
  rw [(interpAction sel).isModel_iff (interpIncl sel) ne (hatI hs)]
  have hQ : (interpAction sel).ComponentsAreModels (hatI hs) := componentsAreModels_hat hs hA
  rw [rootClosed_iff_selected _ _ sel ne (hatI hs) hQ]
  exact ⟨fun H => H.2, fun H => ⟨hQ, H⟩⟩

/-- With the fullest root domains, the sum over the interpretation arrows is a model. -/
theorem isModel_interpSum_all (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e}) (hA : ModelsEverywhere A) :
    (interpSum (A := A) (M := M) Selector.all (fun _ _ _ _ => trivial) ne).IsModel :=
  isModel_full _ _ ne _ (componentsAreModels_hat _ hA)

/-! ### Reading the transport of a value at the root -/

/-- The transport along `⟨V, J⟩` of an intension at the root, read as a set of root tuples, is
its transport as an intension of the sum. -/
theorem rootTransport_ofRT {ρ : RTy} (Y : Intension (interpAction sel).inner ρ (CoalescedSum.base _))
    {k : ι} {V : C k} (J : Interp A k V) :
    rootTransport {q | ofRT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel q ∈ Y} J =
      (interpAction sel).transport (k := k) (V := V) J Y := by
  ext ⟨U, a, j⟩
  show (⟨CoalescedSum.of ⟨k, U⟩, (interpAction sel).argsIn ρ a, _⟩ : Tuple _ ρ _) ∈ Y ↔ _
  rfl

end Classicism.Meta.Coalesced
