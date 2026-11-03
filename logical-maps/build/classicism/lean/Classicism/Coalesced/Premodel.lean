import Classicism.Coalesced.Category
import Classicism.Semantics.IntensionalFacts

/-!
# The coalesced sum as a premodel

A coalesced sum of intensional action premodels `A k`, on the coalesced sum of their categories
(`Category.lean`). At a component object the inner domains, the actions of the component
arrows, and the inclusion of the relational domains into the intensions are the
component's: the sum changes nothing there, the arrows out of a component object being
the component's arrows. At the root they are chosen, in two layers.

* A **root action** (`RootAction`): a root domain `D σ` at each type, the transport
  `tr σ r : D σ → V^σ` along each root arrow `r : W₀ → V`, and the action of the root
  endo-arrows on `D σ`, natural and functorial. Then each type has an action of the sum,
  `RootAction.inner`, defined by matching on the object, so that at a component object it
  *is* the component's inner domain, for every type.
* A **root inclusion** (`RootIncl`): the inclusion of each root relational domain into the
  intensions at the root, injective and commuting with the arrows out of the root. Along a
  root arrow `r : W₀ → V`, commuting means that the transport of an element is the element
  of `V`'s domain whose intension is the intension of the root element moved along `r`
  (`compI`, which reads an intension at a component object of the sum as one of the
  component).

With a value at the root for each constant, these make the premodel `RootAction.coalescedSum`.
The root domains are any sets with these maps: Appendix E's fullest choice, built by
recursion on the type, is `Full.lean`; the pinned and definable members of the map choose
less.

Then `rebase`: a premodel with a new base and new values of the constants, the truncation
being the case where the values are moved along an arrow. The **component seen from a root
arrow** `r : W₀ → V` (`RootAction.component`) is `V`'s component re-based at `V` with the
constants transported along `r`; the transport theorem (`Transport.lean`) says that the
sum, seen along `r`, is that premodel.
-/

/-! ### Re-basing a premodel -/

namespace Classicism.Meta.Intensional.Premodel

open CategoryTheory

variable {Sig : Signature} {C : Type} [SmallCategory C]

/-- `A` with base `V` and constant values `I`: the same actions and inclusions. The
truncation by `h : W₀ → V` is the case `I c = h (A.I c)`. Reducible, so that its fields are
`A`'s to the elaborator. -/
abbrev rebase (A : Premodel Sig C) (V : C) (I : ∀ c : Sig.Const, (A.inner (Sig.typeOf c)).obj V) :
    Premodel Sig C :=
  { A with W₀ := V, I := I }

theorem truncate_eq_rebase (A : Premodel Sig C) {V : C} (h : A.W₀ ⟶ V) :
    A.truncate h = A.rebase V (fun c => (A.inner _).map h (A.I c)) := rfl

theorem rebase_self (A : Premodel Sig C) : A.rebase A.W₀ A.I = A := rfl

/-- Re-basings with equal constant values have equal values of terms. -/
theorem rebase_sem_congr (A : Premodel Sig C) {V : C} {I I' : ∀ c : Sig.Const, (A.inner (Sig.typeOf c)).obj V}
    (e : I = I') {Γ : Ctx} {σ : Ty} {W : C} (j : V ⟶ W) (t : Term Sig Γ σ) (g : IEnv (A.Dom W) Γ) :
    (A.rebase V I).sem j t g = (A.rebase V I').sem j t g := by
  subst e; rfl

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional



variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]

/-! ### Root actions -/

/-- The root of a coalesced sum, as an action: a domain at each type, the transport along
each root arrow into a component, and the action of the root endo-arrows, functorial and
natural. -/
structure RootAction (S : RootArrows C) (A : ∀ k, Premodel Sig (C k)) where
  /-- The root domain at each type. -/
  D : Ty → Type
  /-- The transport along a root arrow `r : W₀ → V`. -/
  tr : ∀ (σ : Ty) {k : ι} {V : C k}, S.R.obj ⟨k, V⟩ → D σ → ((A k).inner σ).obj V
  /-- The action of a root endo-arrow. -/
  trE : ∀ (σ : Ty), S.End → D σ → D σ
  /-- Transport along `r` then `j` is transport along `R j r`. -/
  tr_map : ∀ (σ : Ty) {k : ι} {V U : C k} (j : V ⟶ U) (r : S.R.obj ⟨k, V⟩) (a : D σ),
    tr σ (S.R.map (SigmaHom.mk j) r) a = ((A k).inner σ).map j (tr σ r a)
  /-- Transport along `m • r` is the action of `m` then transport along `r`. -/
  tr_act : ∀ (σ : Ty) {k : ι} {V : C k} (m : S.End) (r : S.R.obj ⟨k, V⟩) (a : D σ),
    tr σ (S.act m r) a = tr σ r (trE σ m a)
  trE_one : ∀ (σ : Ty) (a : D σ), trE σ S.one a = a
  trE_mul : ∀ (σ : Ty) (m m' : S.End) (a : D σ), trE σ (S.mul m m') a = trE σ m' (trE σ m a)

namespace RootAction

variable {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)} (RA : RootAction S A)

/-- The domains of the sum at a type: the root domain at the root, the component's at
a component object. -/
def obj (σ : Ty) : CoalescedSum S → Type
  | .root => RA.D σ
  | .of x => ((A x.1).inner σ).obj x.2

/-- The action of the arrows of the sum at a type. -/
def mapFun (σ : Ty) : ∀ {X Y : CoalescedSum S}, (X ⟶ Y) → RA.obj σ X → RA.obj σ Y
  | .root, .root, m => RA.trE σ m
  | .root, .of _, r => RA.tr σ r
  | .of _, .root, e => nomatch e
  | .of _, .of _, SigmaHom.mk j => ((A _).inner σ).map j

theorem mapFun_id (σ : Ty) : ∀ (X : CoalescedSum S) (a : RA.obj σ X), RA.mapFun σ (𝟙 X) a = a
  | .root, a => RA.trE_one σ a
  | .of ⟨k, V⟩, a => by
    show ((A k).inner σ).map (𝟙 V) a = a
    rw [Functor.map_id]; rfl

theorem mapFun_comp (σ : Ty) : ∀ {X Y Z : CoalescedSum S} (f : X ⟶ Y) (g : Y ⟶ Z) (a : RA.obj σ X),
    RA.mapFun σ (f ≫ g) a = RA.mapFun σ g (RA.mapFun σ f a)
  | .root, .root, .root, m, m', a => RA.trE_mul σ m m' a
  | .root, .root, .of _, m, r, a => RA.tr_act σ m r a
  | .root, .of _, .of _, r, SigmaHom.mk j, a => RA.tr_map σ j r a
  | .of _, .of _, .of _, SigmaHom.mk j, SigmaHom.mk j', a => by
    show ((A _).inner σ).map (j ≫ j') a = ((A _).inner σ).map j' (((A _).inner σ).map j a)
    rw [Functor.map_comp]; rfl
  | _, .of _, .root, _, e, _ => nomatch e
  | .of _, .root, _, e, _, _ => nomatch e

/-- The inner action of the sum at a type. At a component object it is the
component's, by definition, for every type. -/
def inner (σ : Ty) : CoalescedSum S ⥤ Type where
  obj := RA.obj σ
  map f := TypeCat.ofHom (RA.mapFun σ f)
  map_id X := by ext a; exact RA.mapFun_id σ X a
  map_comp f g := by ext a; exact RA.mapFun_comp σ f g a

variable {k : ι}

example (σ : Ty) (V : C k) : (RA.inner σ).obj (CoalescedSum.of ⟨k, V⟩) = ((A k).inner σ).obj V := rfl
example (σ : Ty) : (RA.inner σ).obj (CoalescedSum.base S) = RA.D σ := rfl

theorem inner_map_inc (σ : Ty) {V U : C k} (j : V ⟶ U) (a : ((A k).inner σ).obj V) :
    (RA.inner σ).map (CoalescedSum.inc S j) a = ((A k).inner σ).map j a := rfl

theorem inner_map_arr (σ : Ty) {V : C k} (r : S.R.obj ⟨k, V⟩) (a : RA.D σ) :
    (RA.inner σ).map (CoalescedSum.arr S r) a = RA.tr σ r a := rfl

theorem inner_map_endo (σ : Ty) (m : S.End) (a : RA.D σ) :
    (RA.inner σ).map (CoalescedSum.endo S m) a = RA.trE σ m a := rfl

/-! ### Tuples at a component object

The tuples of the sum from a component object are the component's: its arrows go
only into its own component. The arguments correspond componentwise, by an identity at
each place that is a bijection by induction on the type. -/

/-- The arguments of the sum at a component object, as arguments of the component. -/
def argsOut : ∀ (ρ : RTy) {U : C k}, Args RA.inner ρ (CoalescedSum.of ⟨k, U⟩) → Args (A k).inner ρ U
  | .t, _, _ => PUnit.unit
  | .arr _ ρ, _, a => (a.1, argsOut ρ a.2)

/-- Its inverse. -/
def argsIn : ∀ (ρ : RTy) {U : C k}, Args (A k).inner ρ U → Args RA.inner ρ (CoalescedSum.of ⟨k, U⟩)
  | .t, _, _ => PUnit.unit
  | .arr _ ρ, _, a => (a.1, argsIn ρ a.2)

theorem argsOut_argsIn : ∀ (ρ : RTy) {U : C k} (a : Args (A k).inner ρ U),
    RA.argsOut ρ (RA.argsIn ρ a) = a
  | .t, _, _ => rfl
  | .arr _ ρ, _, a => Prod.ext rfl (argsOut_argsIn ρ a.2)

theorem argsIn_argsOut : ∀ (ρ : RTy) {U : C k} (a : Args RA.inner ρ (CoalescedSum.of ⟨k, U⟩)),
    RA.argsIn ρ (RA.argsOut ρ a) = a
  | .t, _, _ => rfl
  | .arr _ ρ, _, a => Prod.ext rfl (argsIn_argsOut ρ a.2)

theorem argsOut_map : ∀ (ρ : RTy) {U U' : C k} (j : U ⟶ U') (a : Args RA.inner ρ (CoalescedSum.of ⟨k, U⟩)),
    RA.argsOut ρ (Args.map RA.inner ρ (CoalescedSum.inc S j) a) = Args.map (A k).inner ρ j (RA.argsOut ρ a)
  | .t, _, _, _, _ => rfl
  | .arr _ ρ, _, _, j, a => Prod.ext rfl (argsOut_map ρ j a.2)

/-- The tuples of the sum from a component object, as tuples of the component. -/
def tupleOut {ρ : RTy} {V : C k} : Tuple RA.inner ρ (CoalescedSum.of ⟨k, V⟩) → Tuple (A k).inner ρ V
  | ⟨.of _, a, SigmaHom.mk j⟩ => ⟨_, RA.argsOut ρ a, j⟩
  | ⟨.root, _, e⟩ => nomatch e

/-- Its inverse. -/
def tupleIn {ρ : RTy} {V : C k} (p : Tuple (A k).inner ρ V) : Tuple RA.inner ρ (CoalescedSum.of ⟨k, V⟩) :=
  ⟨CoalescedSum.of ⟨k, p.1⟩, RA.argsIn ρ p.2.1, CoalescedSum.inc S p.2.2⟩

theorem tupleOut_tupleIn {ρ : RTy} {V : C k} (p : Tuple (A k).inner ρ V) :
    RA.tupleOut (RA.tupleIn p) = p := by
  obtain ⟨U, a, j⟩ := p
  show (⟨U, RA.argsOut ρ (RA.argsIn ρ a), j⟩ : Tuple (A k).inner ρ V) = ⟨U, a, j⟩
  rw [RA.argsOut_argsIn]

theorem tupleIn_tupleOut {ρ : RTy} {V : C k} :
    ∀ p : Tuple RA.inner ρ (CoalescedSum.of ⟨k, V⟩), RA.tupleIn (RA.tupleOut p) = p
  | ⟨.of _, a, SigmaHom.mk j⟩ => by
    show (⟨_, RA.argsIn ρ (RA.argsOut ρ a), SigmaHom.mk j⟩ : Tuple RA.inner ρ (CoalescedSum.of ⟨k, V⟩)) = _
    rw [RA.argsIn_argsOut]
  | ⟨.root, _, e⟩ => nomatch e

/-- The tuples of the sum from a component object are the component's. -/
def tupleEquiv (ρ : RTy) (V : C k) : Tuple RA.inner ρ (CoalescedSum.of ⟨k, V⟩) ≃ Tuple (A k).inner ρ V where
  toFun := RA.tupleOut
  invFun := RA.tupleIn
  left_inv := RA.tupleIn_tupleOut
  right_inv := RA.tupleOut_tupleIn

/-- An intension of the sum at a component object, as an intension of the component. -/
def compI {ρ : RTy} {V : C k} (X : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩)) : Intension (A k).inner ρ V :=
  {p | RA.tupleIn p ∈ X}

/-- An intension of the component, as an intension of the sum. -/
def ofCompI {ρ : RTy} {V : C k} (X : Intension (A k).inner ρ V) : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩) :=
  {p | RA.tupleOut p ∈ X}

@[simp] theorem mem_compI {ρ : RTy} {V : C k} (X : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩))
    (p : Tuple (A k).inner ρ V) : p ∈ RA.compI X ↔ RA.tupleIn p ∈ X := Iff.rfl

theorem compI_ofCompI {ρ : RTy} {V : C k} (X : Intension (A k).inner ρ V) : RA.compI (RA.ofCompI X) = X := by
  ext p; simp [compI, ofCompI, tupleOut_tupleIn]

theorem ofCompI_compI {ρ : RTy} {V : C k} (X : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩)) :
    RA.ofCompI (RA.compI X) = X := by
  ext p; simp [compI, ofCompI, tupleIn_tupleOut]

theorem compI_injective {ρ : RTy} {V : C k} :
    Function.Injective (RA.compI : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩) → _) := fun X Y e => by
  rw [← RA.ofCompI_compI X, e, RA.ofCompI_compI]

/-- Reading an intension at a component object commutes with the component arrows. -/
theorem compI_map {ρ : RTy} {V U : C k} (j : V ⟶ U) (X : Intension RA.inner ρ (CoalescedSum.of ⟨k, V⟩)) :
    RA.compI (Intension.map RA.inner (CoalescedSum.inc S j) X) = Intension.map (A k).inner j (RA.compI X) := rfl

/-- The intension at a component object `V` of an intension `X` at the root, moved along a
root arrow `r : W₀ → V`: `{⟨ā, j⟩ | ⟨ā, R j r⟩ ∈ X}`. -/
def transport {ρ : RTy} {V : C k} (r : S.R.obj ⟨k, V⟩) (X : Intension RA.inner ρ (CoalescedSum.base S)) :
    Intension (A k).inner ρ V :=
  RA.compI (Intension.map RA.inner (CoalescedSum.arr S r) X)

theorem mem_transport {ρ : RTy} {V : C k} (r : S.R.obj ⟨k, V⟩) (X : Intension RA.inner ρ (CoalescedSum.base S))
    (p : Tuple (A k).inner ρ V) :
    p ∈ RA.transport r X ↔
      (⟨CoalescedSum.of ⟨k, p.1⟩, RA.argsIn ρ p.2.1, CoalescedSum.arr S (S.R.map (SigmaHom.mk p.2.2) r)⟩ :
        Tuple RA.inner ρ (CoalescedSum.base S)) ∈ X := Iff.rfl

theorem transport_map {ρ : RTy} {V U : C k} (r : S.R.obj ⟨k, V⟩) (j : V ⟶ U)
    (X : Intension RA.inner ρ (CoalescedSum.base S)) :
    RA.transport (S.R.map (SigmaHom.mk j) r) X = Intension.map (A k).inner j (RA.transport r X) := by
  rw [transport, transport, ← compI_map, ← Intension.map_comp]
  rfl

end RootAction

/-! ### Root inclusions and the sum premodel -/

/-- The inclusion of the root relational domains into the intensions at the root:
injective, commuting with the root endo-arrows, and transported along a root arrow `r` to
the element whose intension is the root element's moved along `r`. -/
structure RootIncl {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)} (RA : RootAction S A) where
  /-- The inclusion. -/
  incl : ∀ ρ : RTy, RA.D (.rel ρ) → Intension RA.inner ρ (CoalescedSum.base S)
  incl_trE : ∀ (ρ : RTy) (m : S.End) (x : RA.D (.rel ρ)),
    incl ρ (RA.trE _ m x) = Intension.map RA.inner (CoalescedSum.endo S m) (incl ρ x)
  incl_tr : ∀ (ρ : RTy) {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) (x : RA.D (.rel ρ)),
    (A k).incl ρ V (RA.tr _ r x) = RA.transport r (incl ρ x)
  incl_injective : ∀ ρ : RTy, Function.Injective (incl ρ)

namespace RootAction

variable {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)} (RA : RootAction S A) (RI : RootIncl RA)

/-- The inclusion of the sum: the root inclusion at the root, the component's at a
component object. -/
def incl (ρ : RTy) : ∀ W : CoalescedSum S, (RA.inner (.rel ρ)).obj W → Intension RA.inner ρ W
  | .root, x => RI.incl ρ x
  | .of ⟨_, _⟩, y => RA.ofCompI ((A _).incl ρ _ y)

theorem compI_incl {k : ι} (ρ : RTy) (V : C k) (y : ((A k).inner (.rel ρ)).obj V) :
    RA.compI (RA.incl RI ρ (CoalescedSum.of ⟨k, V⟩) y) = (A k).incl ρ V y :=
  RA.compI_ofCompI _

theorem incl_map (ρ : RTy) : ∀ {W V : CoalescedSum S} (h : W ⟶ V) (x : (RA.inner (.rel ρ)).obj W),
    RA.incl RI ρ V ((RA.inner (.rel ρ)).map h x) = Intension.map RA.inner h (RA.incl RI ρ W x)
  | .root, .root, m, x => RI.incl_trE ρ m x
  | .root, .of ⟨_, _⟩, r, x => by
    apply RA.compI_injective
    exact (RA.compI_incl RI ρ _ _).trans (RI.incl_tr ρ r x)
  | .of ⟨_, _⟩, .of ⟨_, _⟩, SigmaHom.mk j, y => by
    apply RA.compI_injective
    exact (RA.compI_incl RI ρ _ _).trans (((A _).incl_map ρ j y).trans
      (congrArg (Intension.map (A _).inner j) (RA.compI_incl RI ρ _ y).symm))
  | .of _, .root, e, _ => nomatch e

theorem incl_injective (ρ : RTy) : ∀ W : CoalescedSum S, Function.Injective (RA.incl RI ρ W)
  | .root => RI.incl_injective ρ
  | .of ⟨_, _⟩ => fun y y' e => (A _).incl_injective ρ _ (by
      rw [← RA.compI_incl RI ρ _ y, ← RA.compI_incl RI ρ _ y']
      exact congrArg RA.compI e)

/-- **The coalesced sum**, as an intensional action premodel on the sum: the root
action, the root inclusion, and a value at the root for each constant. -/
abbrev coalescedSum (ne : Nonempty (RA.D .e)) (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c)) :
    Premodel Sig (CoalescedSum S) where
  W₀ := CoalescedSum.base S
  inner := RA.inner
  nonempty_e
    | .root => ne
    | .of ⟨k, V⟩ => (A k).nonempty_e V
  incl := RA.incl RI
  incl_map := RA.incl_map RI
  incl_injective := RA.incl_injective RI
  I := I

/-- The component seen from a root arrow `r : W₀ → V`: `V`'s component re-based at `V`, with
each constant's value transported along `r`. -/
abbrev component (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c)) {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) :
    Premodel Sig (C k) :=
  (A k).rebase V (fun c => RA.tr _ r (I c))

end RootAction

end Classicism.Meta.Coalesced
