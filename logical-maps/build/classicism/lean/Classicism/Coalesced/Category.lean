import Mathlib.CategoryTheory.Sigma.Basic
import Mathlib.CategoryTheory.Types.Basic

/-!
# The category of a coalesced sum

Classicism, Appendix E, Definition E.1, in the generality of the map's group
`coalesced-sums`. The data are a family of categories `C k`, `k : ι`, and the **root
arrows**: an action `R` of the disjoint union `Σ k, C k` (Mathlib's), whose value at an
object `V` is the set of arrows from the new root `W₀` to `V`, the action of a component
arrow `j` taking a root arrow `r` to `j ∘ r`; and a monoid of arrows from `W₀` to itself
acting on the root arrows, compatibly. The coalesced sum has objects
`W₀` and the objects `of V` of the components, and

* `Hom W₀ W₀` the monoid of root endo-arrows;
* `Hom W₀ (of V) = R V`;
* `Hom (of V) W₀ = ∅`;
* the arrows of the disjoint union between component objects,

with an arrow `r : W₀ → V` followed by `j : V → U` being `R j r`, and an endo-arrow `m`
followed by `r` being `m • r`.

Appendix E's **distinguished arrows** are the case where the root arrows into the
component `k` are the arrows out of its base `W k`: one arrow `W₀ → W k` through which every
other factors uniquely, and only the identity at the root (`RootArrows.distinguished`). The
interpretation-arrow members of the map take the arrows into `V` to be the interpretations
of a signature at `V`, and the substitution members add root endo-arrows.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma

variable {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]

/-- The **root arrows** of a coalesced sum of the categories `C k`: the action `R` of the
root arrows, giving the arrows from the root into each component object and their
composites with the component arrows, and a monoid `End` of endo-arrows of the root,
written diagrammatically (`mul m m'` is `m` followed by `m'`), acting on the root arrows
compatibly with the component arrows (`act m r` is `m` followed by `r`). -/
structure RootArrows (C : ι → Type) [∀ k, SmallCategory (C k)] where
  /-- The action of the root arrows: the arrows from the root to each component object,
  and their composites with the component arrows. -/
  R : (Σ k, C k) ⥤ Type
  /-- The endo-arrows of the root. -/
  End : Type
  /-- The identity of the root. -/
  one : End
  /-- Composition of endo-arrows, diagrammatically. -/
  mul : End → End → End
  /-- An endo-arrow followed by an arrow into a component. -/
  act : ∀ {x : Σ k, C k}, End → R.obj x → R.obj x
  one_mul : ∀ m, mul one m = m
  mul_one : ∀ m, mul m one = m
  mul_assoc : ∀ m m' m'', mul (mul m m') m'' = mul m (mul m' m'')
  act_one : ∀ {x} (r : R.obj x), act one r = r
  act_mul : ∀ {x} (m m' : End) (r : R.obj x), act (mul m m') r = act m (act m' r)
  act_natural : ∀ {x y : Σ k, C k} (f : x ⟶ y) (m : End) (r : R.obj x),
    R.map f (act m r) = act m (R.map f r)

namespace RootArrows

/-- Appendix E's **distinguished arrows**: one arrow from the root to a chosen object `W k`
of each component, every arrow into the component factoring through it uniquely, and only
the identity at the root. The arrows from the root into `V : C k` are the arrows
`W k ⟶ V`. -/
def distinguished (W : ∀ k, C k) : RootArrows C where
  R := Sigma.desc fun k =>
    { obj := fun V => W k ⟶ V
      map := fun j => TypeCat.ofHom fun h => h ≫ j
      map_id := fun V => by ext h; exact Category.comp_id h
      map_comp := fun j j' => by ext h; exact (Category.assoc h j j').symm }
  End := PUnit
  one := PUnit.unit
  mul _ _ := PUnit.unit
  act m r := r
  one_mul _ := rfl
  mul_one _ := rfl
  mul_assoc _ _ _ := rfl
  act_one _ := rfl
  act_mul _ _ _ := rfl
  act_natural _ _ _ := rfl

example (W : ∀ k, C k) (k : ι) (V : C k) :
    (distinguished W).R.obj ⟨k, V⟩ = (W k ⟶ V) := rfl

example (W : ∀ k, C k) (k : ι) {V U : C k} (j : V ⟶ U) (h : W k ⟶ V) :
    (distinguished W).R.map (SigmaHom.mk j) h = h ≫ j := rfl

variable (S : RootArrows C)

theorem map_id_apply {x : Σ k, C k} (r : S.R.obj x) : S.R.map (𝟙 x) r = r := by
  rw [Functor.map_id]; rfl

theorem map_comp_apply {x y z : Σ k, C k} (f : x ⟶ y) (g : y ⟶ z) (r : S.R.obj x) :
    S.R.map (f ≫ g) r = S.R.map g (S.R.map f r) := by
  rw [Functor.map_comp]; rfl

end RootArrows

/-- The objects of the sum: the root and the component objects. -/
inductive CoalescedSum (S : RootArrows C) : Type
  /-- The new root `W₀`. -/
  | root : CoalescedSum S
  /-- A component object. -/
  | of : (Σ k, C k) → CoalescedSum S

namespace CoalescedSum

variable (S : RootArrows C)

/-- The arrows of the sum. -/
def Hom : CoalescedSum S → CoalescedSum S → Type
  | root, root => S.End
  | root, of x => S.R.obj x
  | of _, root => PEmpty
  | of x, of y => x ⟶ y

/-- The identities. -/
def id : ∀ X : CoalescedSum S, Hom S X X
  | root => S.one
  | of x => 𝟙 x

/-- Composition, diagrammatically. -/
def comp : ∀ {X Y Z : CoalescedSum S}, Hom S X Y → Hom S Y Z → Hom S X Z
  | root, root, root, m, m' => S.mul m m'
  | root, root, of _, m, r => S.act m r
  | root, of _, of _, r, f => S.R.map f r
  | of _, of _, of _, f, g => f ≫ g
  | _, of _, root, _, e => nomatch e
  | of _, root, _, e, _ => nomatch e

theorem id_comp' : ∀ {X Y : CoalescedSum S} (f : Hom S X Y), comp S (id S X) f = f
  | root, root, m => S.one_mul m
  | root, of _, r => S.act_one r
  | of _, root, e => nomatch e
  | of _, of _, f => Category.id_comp (X := (_ : Σ k, C k)) f

theorem comp_id' : ∀ {X Y : CoalescedSum S} (f : Hom S X Y), comp S f (id S Y) = f
  | root, root, m => S.mul_one m
  | root, of _, r => S.map_id_apply r
  | of _, root, e => nomatch e
  | of _, of _, f => Category.comp_id (X := (_ : Σ k, C k)) f

theorem assoc' : ∀ {W X Y Z : CoalescedSum S} (f : Hom S W X) (g : Hom S X Y) (h : Hom S Y Z),
    comp S (comp S f g) h = comp S f (comp S g h)
  | root, root, root, root, m, m', m'' => S.mul_assoc m m' m''
  | root, root, root, of _, m, m', r => S.act_mul m m' r
  | root, root, of _, of _, m, r, f => S.act_natural f m r
  | root, of _, of _, of _, r, f, g => by
    exact (S.map_comp_apply f g r).symm
  | of _, of _, of _, of _, f, g, h => Category.assoc (X := (_ : Σ k, C k)) f g h
  | _, _, of _, root, _, _, e => nomatch e
  | _, of _, root, _, _, e, _ => nomatch e
  | of _, root, _, _, e, _, _ => nomatch e

instance category : SmallCategory (CoalescedSum S) where
  Hom := Hom S
  id := id S
  comp := comp S
  id_comp := id_comp' S
  comp_id := comp_id' S
  assoc := assoc' S

/-- The root, with its root arrows named. -/
abbrev base : CoalescedSum S := .root

/-- An endo-arrow of the root, as an arrow of the sum. -/
abbrev endo (m : S.End) : base S ⟶ base S := m

/-- An arrow into a component object, as an arrow of the sum. -/
abbrev arr {x : Σ k, C k} (r : S.R.obj x) : (base S ⟶ CoalescedSum.of x) := r

/-- A component arrow, as an arrow of the sum. -/
abbrev inc {k : ι} {V U : C k} (j : V ⟶ U) : (CoalescedSum.of ⟨k, V⟩ ⟶ (CoalescedSum.of ⟨k, U⟩ : CoalescedSum S)) := SigmaHom.mk j

@[simp] theorem arr_comp_inc {k : ι} {V U : C k} (r : S.R.obj ⟨k, V⟩) (j : V ⟶ U) :
    arr S r ≫ inc S j = arr S (S.R.map (SigmaHom.mk j) r) := rfl

@[simp] theorem inc_comp_inc {k : ι} {V U T : C k} (j : V ⟶ U) (j' : U ⟶ T) :
    inc S j ≫ inc S j' = inc S (j ≫ j') := rfl

theorem id_of (k : ι) (V : C k) : 𝟙 (CoalescedSum.of ⟨k, V⟩ : CoalescedSum S) = inc S (𝟙 V) := rfl

end CoalescedSum

end Classicism.Meta.Coalesced
