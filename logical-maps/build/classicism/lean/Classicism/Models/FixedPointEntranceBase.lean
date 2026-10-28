import Classicism.Models.Functions
import Classicism.Semantics.Symmetric

/-!
# A singleton entrance into a separately pinned tail

Original supporting construction (misc), 23 October 2026. Source:
research/2026-10-22/notes/fixed-point-entrance-cone.md, sections 1 and 7,
unpaginated. The external tail base gains an isolated fixed point. The
interpreted individual action will be supplied separately.

This file constructs the actual category and symmetry groups. It does not
assume a C-model or claim the qualitative tail's higher-type verdicts.
-/

namespace Classicism.Meta.Intensional.FixedPointEntrance

open CategoryTheory
noncomputable section

/-- A one-object function monoid with a specified symmetry group. -/
structure Tail where
  X : Type
  Arrow : (X → X) → Prop
  arrow_id : Arrow id
  arrow_comp : ∀ {f g}, Arrow f → Arrow g → Arrow (g ∘ f)
  Sym : (X → X) → Prop
  sym_arrow : ∀ {f}, Sym f → Arrow f
  sym_id : Sym id
  sym_comp : ∀ {f g}, Sym f → Sym g → Sym (g ∘ f)
  sym_inverse : ∀ {f}, Sym f → ∃ g, Sym g ∧
    (∀ x, g (f x) = x) ∧ (∀ x, f (g x) = x)

variable (T : Tail)

/-- False is the entrance; true is the tail with an isolated fixed point. -/
def Points : Bool → Type
  | false => PUnit
  | true => Option T.X

def Arrow : ∀ {W V : Bool}, (Points T W → Points T V) → Prop
  | false, false, f => ∀ x, f x = x
  | false, true, f => ∀ x, f x = none
  | true, false, _ => False
  | true, true, f => ∃ g, T.Arrow g ∧ ∀ x, f x = Option.map g x

theorem arrow_id (W : Bool) : Arrow T (id : Points T W → Points T W) := by
  cases W with
  | false => exact fun _ => rfl
  | true => exact ⟨id, T.arrow_id, fun x => by cases x <;> rfl⟩

theorem arrow_comp {W V U : Bool} {f : Points T W → Points T V}
    {g : Points T V → Points T U} (hf : Arrow T f) (hg : Arrow T g) :
    Arrow T (g ∘ f) := by
  cases W <;> cases V <;> cases U
  · exact fun x => (hg (f x)).trans (hf x)
  · exact fun x => hg (f x)
  · exact False.elim hg
  · obtain ⟨k, hk, he⟩ := hg
    intro x
    change g (f x) = none
    rw [hf x, he none]
    rfl
  · exact False.elim hf
  · exact False.elim hf
  · exact False.elim hg
  · obtain ⟨k, hk, he⟩ := hf
    obtain ⟨l, hl, hh⟩ := hg
    refine ⟨l ∘ k, T.arrow_comp hk hl, ?_⟩
    intro x
    change g (f x) = Option.map (l ∘ k) x
    rw [he x, hh (Option.map k x)]
    cases x <;> rfl

abbrev cat : FunCat where
  Obj := Bool
  X := Points T
  Arr := Arrow T
  arr_id := arrow_id T
  arr_comp := arrow_comp T

abbrev A : (cat T).Ob := false
abbrev B : (cat T).Ob := true

def entrance : A T ⟶ B T := FunCat.arr (fun _ => none) (fun _ => rfl)

theorem entrance_unique (h : A T ⟶ B T) : h = entrance T :=
  FunCat.hom_ext (funext h.property)

theorem root_endo_unique (h : A T ⟶ A T) : h = 𝟙 (A T) :=
  FunCat.hom_ext (funext h.property)

theorem root_hom_subsingleton (V : (cat T).Ob) : Subsingleton (A T ⟶ V) := by
  cases V with
  | false => exact ⟨fun h k => (root_endo_unique T h).trans (root_endo_unique T k).symm⟩
  | true => exact ⟨fun h k => (entrance_unique T h).trans (entrance_unique T k).symm⟩

theorem entrance_comp (h : B T ⟶ B T) : entrance T ≫ h = entrance T :=
  entrance_unique T _

def lift (f : T.X → T.X) (hf : T.Arrow f) : B T ⟶ B T :=
  FunCat.arr (Option.map f) ⟨f, hf, fun _ => rfl⟩

theorem lift_injective (f g : T.X → T.X) (hf : T.Arrow f) (hg : T.Arrow g)
    (he : lift T f hf = lift T g hg) : f = g := by
  funext x
  have hx := congrArg (fun h : B T ⟶ B T => FunCat.fn h (some x)) he
  exact Option.some.inj hx

def syms (V : (cat T).Ob) : Set (V ⟶ V) :=
  match V with
  | false => Set.univ
  | true => {h | ∃ f, T.Sym f ∧ ∀ x, FunCat.fn h x = Option.map f x}

theorem syms_id (V : (cat T).Ob) : 𝟙 V ∈ syms T V := by
  cases V with
  | false => trivial
  | true => exact ⟨id, T.sym_id, fun x => by cases x <;> rfl⟩

theorem syms_comp {V : (cat T).Ob} {g h : V ⟶ V}
    (hg : g ∈ syms T V) (hh : h ∈ syms T V) : g ≫ h ∈ syms T V := by
  cases V with
  | false => trivial
  | true =>
    obtain ⟨f, hf, he⟩ := hg
    obtain ⟨k, hk, hh⟩ := hh
    refine ⟨k ∘ f, T.sym_comp hf hk, ?_⟩
    intro x
    change FunCat.fn h (FunCat.fn g x) = Option.map (k ∘ f) x
    rw [he x, hh (Option.map f x)]
    cases x <;> rfl

theorem syms_inv : SymGroup (syms T) := by
  intro V h hh
  cases V with
  | false =>
    refine ⟨𝟙 (A T), syms_id T _, ?_, ?_⟩
    · exact root_endo_unique T _
    · exact root_endo_unique T _
  | true =>
    obtain ⟨f, hf, he⟩ := hh
    obtain ⟨g, hg, hgf, hfg⟩ := T.sym_inverse hf
    refine ⟨lift T g (T.sym_arrow hg), ⟨g, hg, fun _ => rfl⟩, ?_, ?_⟩
    · apply FunCat.hom_ext
      funext x
      change Option.map g (FunCat.fn h x) = x
      rw [he x]
      cases x with
      | none => rfl
      | some x => exact congrArg some (hgf x)
    · apply FunCat.hom_ext
      funext x
      change FunCat.fn h (Option.map g x) = x
      rw [he (Option.map g x)]
      cases x with
      | none => rfl
      | some x => exact congrArg some (hfg x)

/-- Every transported root object is fixed by every tail arrow, at any action. -/
theorem transport_fixed (F : (cat T).Ob ⥤ Type) (x : F.obj (A T))
    (h : B T ⟶ B T) : F.map h (F.map (entrance T) x) = F.map (entrance T) x := by
  have H := congrArg (fun k : A T ⟶ B T => F.map k x) (entrance_comp T h)
  rw [Functor.map_comp] at H
  exact H

/-- Root pinning is automatic because each outgoing hom-set is a singleton. -/
theorem root_pinned (F : (cat T).Ob ⥤ Type) (x : F.obj (A T)) :
    PinnedBy (cat T).De F ∅ x := by
  intro V h k _
  have he : h = k := (root_hom_subsingleton T V).elim h k
  subst k
  rfl

end
end Classicism.Meta.Intensional.FixedPointEntrance
