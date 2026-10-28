import Classicism.Models.SymBase
import Mathlib.Data.Finset.Image

/-!
# The finite-compression labelled entrance category

Original construction (misc), 23 October 2026. Source:
research/2026-10-23/finite-compression-labelled-entrance.md, sections 2–3.
Individuals are the full bases: points at A, points and fibre labels at B.
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

abbrev Point := Nat × Nat

inductive Label
  | block : Nat → Label
  | finite : Finset Point → Label
  | top : Label
  deriving DecidableEq

def fibre : Label → Set Point
  | .block i => {p | p.1 = i}
  | .finite s => (s : Set Point)
  | .top => Set.univ

inductive Stage | A | B deriving DecidableEq

def X : Stage → Type
  | .A => Point
  | .B => Point ⊕ Label

def TailAllowed (f : Point → Point) (g : Label → Label) : Prop :=
  Function.Surjective f ∧ g .top = .top ∧
    ∀ q p, p ∈ fibre q → f p ∈ fibre (g q)

def Arr : {W V : Stage} → (X W → X V) → Prop
  | .A, .A, f => Function.Surjective f
  | .A, .B, f => ∃ k : Point → Point, Function.Surjective k ∧ f = Sum.inl ∘ k
  | .B, .A, _ => False
  | .B, .B, f => ∃ k : Point → Point, ∃ g : Label → Label,
      TailAllowed k g ∧ f = Sum.map k g

private theorem arr_id (W : Stage) : Arr (id : X W → X W) := by
  cases W
  · exact Function.surjective_id
  · refine ⟨id, id, ⟨Function.surjective_id, rfl, fun _ _ h => h⟩, ?_⟩
    funext x
    cases x <;> rfl

private theorem arr_comp {W V U : Stage} {f : X W → X V} {g : X V → X U}
    (hf : Arr f) (hg : Arr g) : Arr (g ∘ f) := by
  cases W <;> cases V <;> cases U
  · exact hg.comp hf
  · rcases hg with ⟨k, hk, rfl⟩
    exact ⟨k ∘ f, hk.comp hf, rfl⟩
  · exact hg.elim
  · rcases hf with ⟨k, hk, rfl⟩
    rcases hg with ⟨l, q, hl, rfl⟩
    exact ⟨l ∘ k, hl.1.comp hk, rfl⟩
  · exact hf.elim
  · exact hf.elim
  · exact hg.elim
  · rcases hf with ⟨k, q, hk, rfl⟩
    rcases hg with ⟨l, r, hl, rfl⟩
    refine ⟨l ∘ k, r ∘ q, ⟨hl.1.comp hk.1, ?_, ?_⟩, ?_⟩
    · simp only [Function.comp_apply, hk.2.1, hl.2.1]
    · intro a p hp
      exact hl.2.2 _ _ (hk.2.2 _ _ hp)
    · funext x
      cases x <;> rfl

abbrev cat : FunCat where
  Obj := Stage
  X := X
  Arr := Arr
  arr_id := arr_id
  arr_comp := arr_comp

abbrev A : cat.Ob := Stage.A
abbrev B : cat.Ob := Stage.B

def mkRoot (f : Point → Point) (hf : Function.Surjective f) : A ⟶ A :=
  FunCat.arr f hf

def mkEntrance (f : Point → Point) (hf : Function.Surjective f) : A ⟶ B :=
  FunCat.arr (Sum.inl ∘ f) ⟨f, hf, rfl⟩

def mkTail (f : Point → Point) (g : Label → Label) (hf : Function.Surjective f)
    (hg : g .top = .top) (hp : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q)) : B ⟶ B :=
  FunCat.arr (Sum.map f g) ⟨f, g, ⟨hf, hg, hp⟩, rfl⟩

def topTail (f : Point → Point) (hf : Function.Surjective f) : B ⟶ B :=
  mkTail f (fun _ => .top) hf rfl (fun _ _ _ => Set.mem_univ _)

def entrance : A ⟶ B := mkEntrance id Function.surjective_id

theorem no_BA (h : B ⟶ A) : False := h.2

theorem target_from_B {V : cat.Ob} (h : B ⟶ V) : V = B := by
  cases V
  · exact (no_BA h).elim
  · rfl

def point (W : cat.Ob) : Point → cat.X W :=
  match W with | .A => id | .B => Sum.inl

def pointMap {W V : cat.Ob} (h : W ⟶ V) : Point → Point :=
  match W, V, h with
  | .A, .A, h => FunCat.fn h
  | .A, .B, h => Classical.choose h.2
  | .B, .A, h => (no_BA h).elim
  | .B, .B, h => Classical.choose h.2

def labelMap (h : B ⟶ B) : Label → Label :=
  Classical.choose (Classical.choose_spec h.2)

theorem pointMap_surj {W V : cat.Ob} (h : W ⟶ V) :
    Function.Surjective (pointMap h) := by
  cases W <;> cases V
  · exact h.2
  · exact (Classical.choose_spec h.2).1
  · exact (no_BA h).elim
  · exact (Classical.choose_spec (Classical.choose_spec h.2)).1.1

@[simp] theorem fn_point {W V : cat.Ob} (h : W ⟶ V) (p : Point) :
    FunCat.fn h (point W p) = point V (pointMap h p) := by
  cases W <;> cases V
  · rfl
  · exact congrFun (Classical.choose_spec h.2).2 p
  · exact (no_BA h).elim
  · exact congrFun (Classical.choose_spec (Classical.choose_spec h.2)).2 (Sum.inl p)

@[simp] theorem fn_label (h : B ⟶ B) (q : Label) :
    FunCat.fn h (Sum.inr q) = Sum.inr (labelMap h q) :=
  congrFun (Classical.choose_spec (Classical.choose_spec h.2)).2 (Sum.inr q)

theorem point_injective (W : cat.Ob) : Function.Injective (point W) := by
  cases W
  · exact Function.injective_id
  · exact Sum.inl_injective

@[simp] theorem pointMap_id (W : cat.Ob) (p : Point) : pointMap (𝟙 W) p = p := by
  apply point_injective W
  exact (fn_point (𝟙 W) p).symm

@[simp] theorem pointMap_comp {W V U : cat.Ob} (h : W ⟶ V) (k : V ⟶ U) (p : Point) :
    pointMap (h ≫ k) p = pointMap k (pointMap h p) := by
  apply point_injective U
  rw [← fn_point, ← fn_point]
  change FunCat.fn k (FunCat.fn h (point W p)) = _
  rw [fn_point]

@[simp] theorem labelMap_id (q : Label) : labelMap (𝟙 B) q = q := by
  exact Sum.inr_injective (fn_label (𝟙 B) q).symm

@[simp] theorem labelMap_comp (h k : B ⟶ B) (q : Label) :
    labelMap (h ≫ k) q = labelMap k (labelMap h q) := by
  apply Sum.inr_injective
  rw [← fn_label, ← fn_label]
  change FunCat.fn k (FunCat.fn h (Sum.inr q)) = _
  rw [fn_label]

theorem tail_preserves (h : B ⟶ B) (q : Label) (p : Point) (hp : p ∈ fibre q) :
    pointMap h p ∈ fibre (labelMap h q) :=
  (Classical.choose_spec (Classical.choose_spec h.2)).1.2.2 q p hp

@[simp] theorem labelMap_top (h : B ⟶ B) : labelMap h .top = .top :=
  (Classical.choose_spec (Classical.choose_spec h.2)).1.2.1

@[simp] theorem pointMap_mkTail (f : Point → Point) (g : Label → Label)
    (hf : Function.Surjective f) (hg : g .top = .top)
    (hp : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q)) (p : Point) :
    pointMap (mkTail f g hf hg hp) p = f p := by
  exact Sum.inl_injective (fn_point (mkTail f g hf hg hp) p).symm

@[simp] theorem labelMap_mkTail (f : Point → Point) (g : Label → Label)
    (hf : Function.Surjective f) (hg : g .top = .top)
    (hp : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q)) (q : Label) :
    labelMap (mkTail f g hf hg hp) q = g q := by
  exact Sum.inr_injective (fn_label (mkTail f g hf hg hp) q).symm

@[simp] theorem pointMap_mkEntrance (f : Point → Point) (hf : Function.Surjective f)
    (p : Point) : pointMap (mkEntrance f hf) p = f p := by
  exact Sum.inl_injective (fn_point (mkEntrance f hf) p).symm

@[simp] theorem pointMap_mkRoot (f : Point → Point) (hf : Function.Surjective f)
    (p : Point) : pointMap (mkRoot f hf) p = f p := rfl

@[simp] theorem pointMap_entrance (p : Point) : pointMap entrance p = p :=
  pointMap_mkEntrance id Function.surjective_id p

def syms (W : cat.Ob) : Set (W ⟶ W) :=
  {g | ∃ gi : W ⟶ W, g ≫ gi = 𝟙 W ∧ gi ≫ g = 𝟙 W}

theorem syms_inv : SymGroup syms := by
  rintro W g ⟨gi, hgi, hig⟩
  exact ⟨gi, ⟨g, hig, hgi⟩, hgi, hig⟩

abbrev base (W : cat.Ob) : SymBase where
  F := cat
  G := syms
  G_id W := ⟨𝟙 W, by simp, by simp⟩
  G_comp := by
    rintro W g s ⟨gi, hgi, hig⟩ ⟨si, hsi, his⟩
    refine ⟨si ≫ gi, ?_, ?_⟩
    · simp only [Category.assoc, ← Category.assoc s si, hsi, Category.id_comp, hgi]
    · simp only [Category.assoc, ← Category.assoc gi g, hig, Category.id_comp, his]
  G_inv := syms_inv
  W₀ := W
  ne W := by
    cases W
    · exact ⟨(0, 0)⟩
    · exact ⟨Sum.inl (0, 0)⟩
  J := PinIdeal.fin _
  J_base _ h := h

abbrev model : Premodel Signature.pure cat.Ob := (base A).model

theorem isModel : model.IsModel := (base A).model_isModel

/-- Extend any finite prescription on the grid to a surjection. -/
theorem extend_points {D : Set Point} (hD : D.Finite) (f : Point → Point) :
    ∃ u : Point → Point, Function.Surjective u ∧ ∀ p ∈ D, u p = f p := by
  classical
  obtain ⟨b, hb⟩ := (hD.image Prod.fst).bddAbove
  let u : Point → Point := fun p => if p ∈ D then f p else (p.1 - (b + 1), p.2)
  refine ⟨u, ?_, fun p hp => by simp [u, hp]⟩
  intro y
  have hn : (y.1 + (b + 1), y.2) ∉ D := by
    intro hp
    have := hb (Set.mem_image_of_mem Prod.fst hp)
    omega
  refine ⟨(y.1 + (b + 1), y.2), ?_⟩
  simp [u, hn]

theorem root_factor {V : cat.Ob} (h h' : A ⟶ V) {S M : Set Point}
    (hS : S.Finite) (hM : M.Finite) (hag : AgreeOn cat.De (W := A) S h h') :
    ∃ u : A ⟶ A, (∀ x ∈ S, FunCat.fn u x = x) ∧
      AgreeOn cat.De (W := A) M (u ≫ h) h' := by
  classical
  let q : Point → Point := fun x => if x ∈ S then x else
    Classical.choose (pointMap_surj h (pointMap h' x))
  obtain ⟨f, hf, hfp⟩ := extend_points (hS.union hM) q
  refine ⟨mkRoot f hf, ?_, ?_⟩
  · intro x hx
    change f x = x
    simp [hfp x (Or.inl hx), q, hx]
  · intro x hx
    change FunCat.fn h (f x) = FunCat.fn h' x
    rw [hfp x (Or.inr hx)]
    by_cases hs : x ∈ S
    · have hqx : q x = x := if_pos hs
      rw [hqx]
      exact hag x hs
    · have hqx : q x = Classical.choose (pointMap_surj h (pointMap h' x)) := if_neg hs
      rw [hqx]
      have he := Classical.choose_spec (pointMap_surj h (pointMap h' x))
      have hh := fn_point h (Classical.choose (pointMap_surj h (pointMap h' x)))
      have hh' := fn_point h' x
      change FunCat.fn h _ = point V _ at hh
      change FunCat.fn h' x = point V _ at hh'
      rw [he] at hh
      exact hh.trans hh'.symm

end
end Classicism.Meta.Intensional.FiniteCompression
