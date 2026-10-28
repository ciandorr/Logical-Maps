import Classicism.Paper
import Classicism.Principles
import Classicism.Background.Relations

/-!
# Proofs of map records: Choice, Plenitude and Transversals

Records concluding in the principles of the map's category `choice` (Classicism, §2.4;
Propositions 2.13 and 2.15), Transversals and Modalized Plenitude.
The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### Choice (Classicism, §2.4) -/

/-- `functional-choice-r-implies-relational-choice-r`. Functional Choice cannot be
applied directly, because the output type may be `e` while an operation's output type may
not. Replace each output `y` by its haecceity `λw. w = y`, of the admitted type `τt`, and
choose among haecceities instead: the relation `λx H. ∃y. H = (λw. w = y) ∧ (Ux)y` is
serial because `U` is, so Functional Choice supplies `X : σ → τ → Prop` with `X x` a
haecceity of some `U`-successor of `x`. That `X` is itself the required subrelation, since
haecceities are injective by identity elimination. The record's argument treats the `e`
case separately; the haecceity detour is uniform, so no case split is needed. The instance
of Functional Choice used is the one at `σ`, `τ → t`, for Relational Choice at `σ`, `τ`. -/
theorem functional_choice_r_implies_relational_choice_r {σ τ : Type} [Ty σ] [Ty τ] :
    FunctionalChoice σ (τ → Prop) → RelationalChoice σ τ := by
  intro fc U hser
  -- The relation between an argument and the haecceities of its `U`-successors.
  have hser' : Serial (λ (x : σ) (H : τ → Prop) ↦ ∃ y, H = (λ w ↦ w = y) ∧ U x y) := by
    intro x
    obtain ⟨y, hy⟩ := hser x
    exact ⟨λ w ↦ w = y, y, rfl, hy⟩
  obtain ⟨X, hX⟩ := fc _ hser'
  refine ⟨X, ?_, ?_⟩
  · -- `X x` is the haecceity of one `U`-successor, so it holds of exactly that one.
    intro x
    obtain ⟨y, hXy, hUy⟩ := hX x
    refine ⟨y, ?_, ?_⟩
    · show X x y
      rw [hXy]
    · intro z hz
      rw [hXy] at hz
      exact hz.symm
  · -- And everything it holds of is that successor, so it is a subrelation of `U`.
    intro x y hxy
    obtain ⟨w, hXw, hUw⟩ := hX x
    rw [hXw] at hxy
    rw [hxy]
    exact hUw

/-! Plenitude (Classicism, §2.4, Propositions 2.13 and 2.15) -/

/-- The relation mapping each truth to itself and each falsehood to `⊤` is functional
(stated unfolded, so that the audits do not read it as a record). -/
theorem actual_rel_functional :
    ∀ p : Prop, ∃ q : Prop, ((p ∧ p = q) ∨ (¬ p ∧ q = True)) ∧
      ∀ z : Prop, ((p ∧ p = z) ∨ (¬ p ∧ z = True)) → q = z :=
  fun p => (em p).elim
    (fun hp => ⟨p, Or.inl ⟨hp, rfl⟩, fun z hz => hz.elim (fun h => h.2) (fun h => absurd hp h.1)⟩)
    (fun hp => ⟨True, Or.inr ⟨hp, rfl⟩, fun z hz => hz.elim (fun h => absurd h.1 hp) (fun h => h.2.symm)⟩)

/-- `∀p. Zp` gives `Zq`. -/
theorem all_imp (Z : Prop → Prop) (q : Prop) : (∀ p, Z p) → Z q := fun h => h q

/-- `plenitude-r-implies-actuality` (Proposition 2.15): Plenitude represents that relation
by an operation `Z`, with `Zp = p` for true `p` and `Zp = ⊤` for false `p`. Then `∀p. Zp`
is true, and it entails each `Zq`, hence each truth `q`. -/
theorem plenitude_r_implies_actuality : Plenitude Prop Prop → Actuality := fun pl =>
  (pl _ actual_rel_functional).elim fun Z hZ =>
    ⟨∀ p, Z p,
     fun p => (hZ p).elim (fun h => h.2 ▸ h.1) (fun h => h.2 ▸ trivial),
     fun q hq => (hZ q).elim
       (fun h => h.2 ▸ le_of_box_incl (nec% (all_imp Z q)))
       (fun h => absurd hq h.1)⟩

/-- The relation mapping `x` to `⊤` and everything else to `⊥` is functional. -/
theorem haec_rel_functional {σ : Type} [Ty σ] (x : σ) :
    Functional (λ z (w : Prop) ↦ (x = z ∧ w = True) ∨ (x ≠ z ∧ w = False)) := fun z =>
  (em (x = z)).elim
    (fun h => ⟨True, Or.inl ⟨h, rfl⟩, fun w hw => hw.elim (fun h' => h'.2.symm) (fun h' => absurd h h'.1)⟩)
    (fun h => ⟨False, Or.inr ⟨h, rfl⟩, fun w hw => hw.elim (fun h' => absurd h'.1 h) (fun h' => h'.2.symm)⟩)

/-- `Zx = ⊤` and `Zy = ⊥` make `x ≠ y`. -/
theorem ne_of_values {σ : Type} [Ty σ] (Z : σ → Prop) (x y : σ) : Z x = True → Z y = False → x ≠ y := by
  intro hx hy hxy
  rw [hxy] at hx
  rw [hx] at hy
  exact hy ▸ trivial

/-- `plenitude-r-implies-distinctness-necessary-r` (Proposition 2.13): for `x ≠ y`, the
operation representing "`⊤` at `x`, `⊥` elsewhere" has `Zx = ⊤` and `Zy = ⊥`, both
necessarily, so necessarily `x ≠ y`. -/
theorem plenitude_r_implies_distinctness_necessary_r {σ : Type} [Ty σ] :
    Plenitude σ Prop → NecessityOfDistinctness σ := fun pl x y hxy =>
  (pl _ (haec_rel_functional x)).elim fun Z hZ =>
    have hx : Z x = True := (hZ x).elim (fun h => h.2) (fun h => absurd rfl h.1)
    have hy : Z y = False := (hZ y).elim (fun h => absurd h.1 hxy) (fun h => h.2)
    modal_K _ _ (modal_K _ _ (nec% (ne_of_values Z x y)) (necessity_of_identity _ _ hx))
      (necessity_of_identity _ _ hy)

/-- `necessary-plenitude-r-implies-plenitude-r`: `T`. -/
theorem necessary_plenitude_r_implies_plenitude_r {σ τ : Type} [Ty σ] [Rel τ] :
    NecPlenitude σ τ → Plenitude σ τ := box_elim

/-- `necessary-plenitude-r-implies-necessary-distinctness-necessary-r`: Proposition 2.13
necessitated. -/
theorem necessary_plenitude_r_implies_necessary_distinctness_necessary_r {σ : Type} [Ty σ] :
    NecPlenitude σ Prop → NecNecessityOfDistinctness σ :=
  modal_K _ _ (nec% (plenitude_r_implies_distinctness_necessary_r (σ := σ)))

/-- `necessary-plenitude-r-implies-necessary-actuality`: Proposition 2.15 necessitated. -/
theorem necessary_plenitude_r_implies_necessary_actuality :
    NecPlenitude Prop Prop → NecActuality :=
  modal_K _ _ (nec% plenitude_r_implies_actuality)

/-- `functional-choice-r-implies-plenitude-r`: a functional relation is serial. -/
theorem functional_choice_r_implies_plenitude_r {σ τ : Type} [Ty σ] [Rel τ] :
    FunctionalChoice σ τ → Plenitude σ τ :=
  fun fc U hU => fc U (fun x => (hU x).elim fun y hy => ⟨y, hy.1⟩)

/-- `necessary-functional-choice-r-implies-functional-choice-r`: `T`. -/
theorem necessary_functional_choice_r_implies_functional_choice_r {σ τ : Type} [Ty σ] [Rel τ] :
    NecFunctionalChoice σ τ → FunctionalChoice σ τ := box_elim
/-- `necessary-relational-choice-r-implies-relational-choice-r`: `T`. -/
theorem necessary_relational_choice_r_implies_relational_choice_r {σ τ : Type} [Ty σ] [Ty τ] :
    NecRelationalChoice σ τ → RelationalChoice σ τ := box_elim
/-- `necessary-functional-choice-r-implies-necessary-plenitude-r`. -/
theorem necessary_functional_choice_r_implies_necessary_plenitude_r {σ τ : Type} [Ty σ] [Rel τ] :
    NecFunctionalChoice σ τ → NecPlenitude σ τ :=
  modal_K _ _ (nec% (functional_choice_r_implies_plenitude_r (σ := σ) (τ := τ)))
/-- `necessary-functional-choice-r-implies-necessary-relational-choice-r`. -/
theorem necessary_functional_choice_r_implies_necessary_relational_choice_r {σ τ : Type} [Ty σ]
    [Ty τ] : NecFunctionalChoice σ (τ → Prop) → NecRelationalChoice σ τ :=
  modal_K _ _ (nec% (functional_choice_r_implies_relational_choice_r (σ := σ) (τ := τ)))
/-- `relational-choice-and-plenitude-imply-functional-choice-r`: Relational Choice selects
a functional subrelation, and Plenitude represents it by an operation. -/
theorem relational_choice_and_plenitude_imply_functional_choice_r {σ τ : Type} [Ty σ] [Rel τ] :
    RelationalChoice σ τ → Plenitude σ τ → FunctionalChoice σ τ := fun rc pl U hser =>
  (rc U hser).elim fun S hS => (pl S hS.1).elim fun X hX => ⟨X, fun x => hS.2 x (X x) (hX x)⟩
/-- `necessary-relational-choice-and-necessary-plenitude-imply-necessary-functional-choice`. -/
theorem necessary_relational_choice_and_necessary_plenitude_imply_necessary_functional_choice
    {σ τ : Type} [Ty σ] [Rel τ] :
    NecRelationalChoice σ τ → NecPlenitude σ τ → NecFunctionalChoice σ τ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% (relational_choice_and_plenitude_imply_functional_choice_r (σ := σ) (τ := τ))) h₁) h₂

/-! ### Transversals (25–28 September) -/

/-- `(w → ∀z. Y'z ↔ Xz ∧ w) → (∀z. Y'z → w) → ∀z. Y'z ↔ Xz ∧ w`. -/
theorem coext_of_actual_imp {σ : Type} [Ty σ] (X Y' : σ → Prop) (w : Prop) :
    (w → ∀ z, Y' z ↔ (X z ∧ w)) → (∀ z, Y' z → w) → ∀ z, Y' z ↔ (X z ∧ w) :=
  fun h hY z => ⟨fun hy => (h (hY z hy) z).1 hy, fun hx => (h hx.2 z).2 hx⟩

/-- `actuality-implies-transversal`: with `w` the actual world, the properties that can be
instantiated only if `w` obtains form a transversal; `λz. Xz ∧ w` is the one coextensive
with `X`, and two such that are coextensive are necessarily so, so identical. -/
theorem actuality_implies_transversal {σ : Type} [Ty σ] : Actuality → Transversal σ := fun act =>
  act.elim fun w hw =>
    ⟨λ Y ↦ □ (∀ z, Y z → w), fun X =>
      ⟨λ z ↦ X z ∧ w, nec% (fun (z : σ) (h : X z ∧ w) => h.2),
        fun z => ⟨fun hx => ⟨hx, hw.1⟩, fun h => h.1⟩,
        fun Y' hY' => intensionality Y' _ (modal_K _ _ (modal_K _ _
          (nec% (coext_of_actual_imp X Y' w))
          ((le_iff_prop _ _).1 (hw.2 _ fun z =>
            ⟨fun hy => ⟨(hY'.2 z).2 hy, hw.1⟩, fun hx => (hY'.2 z).1 hx.1⟩))) hY'.1)⟩⟩

/-- `necessary-actuality-implies-necessary-transversal`: necessitated, and `K`. -/
theorem necessary_actuality_implies_necessary_transversal {σ : Type} [Ty σ] :
    NecActuality → NecTransversal σ :=
  modal_K _ _ (nec% (actuality_implies_transversal (σ := σ)))

/-- `necessary-transversal-r-implies-transversal-r`: `T`. -/
theorem necessary_transversal_r_implies_transversal_r {σ : Type} [Ty σ] :
    NecTransversal σ → Transversal σ := fun h => box_elim h

/-- `transversal-choice-r-implies-transversal-r`: coextensiveness is an equivalence
relation on properties, and a transversal of it is a transversal. -/
theorem transversal_choice_r_implies_transversal_r {σ : Type} [Ty σ] :
    TransversalChoice (σ → Prop) → Transversal σ := fun tc =>
  (tc (λ X Y ↦ ∀ z, X z ↔ Y z)
      ⟨fun _ _ => Iff.rfl, fun _ _ h z => (h z).symm,
        fun _ _ _ h₁ h₂ z => ⟨fun h => (h₂ z).1 ((h₁ z).1 h), fun h => (h₁ z).2 ((h₂ z).2 h)⟩⟩).elim
    fun F hF => ⟨F, fun X => (hF X).elim fun Y hY =>
      ⟨Y, hY.2.1, hY.1, fun Y' hY' => (hY.2.2 Y' ⟨hY'.2, hY'.1⟩).symm⟩⟩

/-- `necessary-transversal-choice-r-implies-necessary-transversal-r`: necessitated, and `K`. -/
theorem necessary_transversal_choice_r_implies_necessary_transversal_r {σ : Type} [Ty σ] :
    NecTransversalChoice (σ → Prop) → NecTransversal σ :=
  modal_K _ _ (nec% (transversal_choice_r_implies_transversal_r (σ := σ)))

/-- `necessary-transversal-choice-r-implies-transversal-choice-r`: `T`. -/
theorem necessary_transversal_choice_r_implies_transversal_choice_r {σ : Type} [Ty σ] :
    NecTransversalChoice σ → TransversalChoice σ := fun h => box_elim h

/-- With an element `x₀`, `(UC)y := Cy ∨ ¬∃z. Cz` is serial. -/
theorem serial_cell {σ : Type} [Ty σ] (x₀ : σ) :
    ∀ C : σ → Prop, ∃ y, C y ∨ ¬ ∃ z, C z := fun C =>
  (em (∃ z, C z)).elim (fun h => h.elim fun z hz => ⟨z, Or.inl hz⟩) (fun h => ⟨x₀, Or.inr h⟩)

/-- `transversal-and-relational-choice-imply-transversal-choice`: Relational Choice picks
an element `y` from each nonempty property `C`, functionally in `C`; the transversal of
`R` holds of the element picked from the Transversal's representative of a cell. Where
`σ` is empty there is nothing to pick. -/
theorem transversal_and_relational_choice_imply_transversal_choice {σ : Type} [Ty σ] :
    Transversal σ → RelationalChoice (σ → Prop) σ → TransversalChoice σ := by
  intro tr rc R hR
  refine (em (∃ x₀ : σ, x₀ = x₀)).elim (fun hx₀ => ?_)
    (fun hn => ⟨λ _ ↦ True, fun x => (hn ⟨x, rfl⟩).elim⟩)
  obtain ⟨x₀, -⟩ := hx₀
  obtain ⟨F, hF⟩ := tr
  obtain ⟨S, hSf, hSU⟩ := rc (λ C y ↦ C y ∨ ¬ ∃ z, C z) (serial_cell x₀)
  refine ⟨λ y ↦ ∃ Y : σ → Prop, F Y ∧ (∀ z, Y z ↔ R y z) ∧ S Y y, fun x => ?_⟩
  obtain ⟨Yx, hFYx, hcoYx, huYx⟩ := hF (R x)
  obtain ⟨y, hSy, hSu⟩ := hSf Yx
  have hYy : Yx y := (hSU Yx y hSy).elim id (fun h => (h ⟨x, (hcoYx x).1 (hR.1 x)⟩).elim)
  have hRxy : R x y := (hcoYx y).2 hYy
  refine ⟨y, hRxy, ⟨Yx, hFYx, fun z => ⟨fun hz => hR.2.2 y x z (hR.2.1 x y hRxy) ((hcoYx z).2 hz),
    fun hz => (hcoYx z).1 (hR.2.2 x y z hRxy hz)⟩, hSy⟩, ?_⟩
  rintro z ⟨hRxz, Y', hFY', hcoY', hSY'⟩
  have e : Y' = Yx := huYx Y' ⟨hFY', fun u =>
    ⟨fun hu => (hcoY' u).2 (hR.2.2 z x u (hR.2.1 x z hRxz) hu),
     fun hu => hR.2.2 x z u hRxz ((hcoY' u).1 hu)⟩⟩
  rw [e] at hSY'
  exact hSu z hSY'

/-- `relational-choice-and-extensionality-imply-transversal-choice`: as above, the element
picked from a cell; Extensionality makes coextensive cells identical. -/
theorem relational_choice_and_extensionality_imply_transversal_choice {σ : Type} [Ty σ] :
    RelationalChoice (σ → Prop) σ → Extensionality (σ → Prop) → TransversalChoice σ := by
  intro rc ext R hR
  refine (em (∃ x₀ : σ, x₀ = x₀)).elim (fun hx₀ => ?_)
    (fun hn => ⟨λ _ ↦ True, fun x => (hn ⟨x, rfl⟩).elim⟩)
  obtain ⟨x₀, -⟩ := hx₀
  obtain ⟨S, hSf, hSU⟩ := rc (λ C y ↦ C y ∨ ¬ ∃ z, C z) (serial_cell x₀)
  have hcell : ∀ x y, S (R x) y → R x y := fun x y h =>
    (hSU (R x) y h).elim id (fun hn => (hn ⟨x, hR.1 x⟩).elim)
  refine ⟨λ y ↦ ∃ x, S (R x) y, fun x => ?_⟩
  obtain ⟨y, hSy, hSu⟩ := hSf (R x)
  refine ⟨y, hcell x y hSy, ⟨x, hSy⟩, ?_⟩
  rintro z ⟨hRxz, x₂, hS₂⟩
  have hR₂ : R x₂ z := hcell x₂ z hS₂
  have e : R x₂ = R x := ext (R x₂) (R x) fun u =>
    ⟨fun hu => hR.2.2 x z u hRxz (hR.2.2 z x₂ u (hR.2.1 x₂ z hR₂) hu),
     fun hu => hR.2.2 x₂ z u hR₂ (hR.2.2 z x u (hR.2.1 x z hRxz) hu)⟩
  rw [e] at hS₂
  exact hSu z hS₂

/-- `relational-choice-and-weak-rigid-comprehension-imply-transversal-choice`: as above,
with each cell represented by a weakly rigid coextension, which is unique. -/
theorem relational_choice_and_weak_rigid_comprehension_imply_transversal_choice
    {σ : Type} [Ty σ] :
    RelationalChoice (σ → Prop) σ → WeakRigidComprehension (σ → Prop) →
      TransversalChoice σ := by
  intro rc vw R hR
  refine (em (∃ x₀ : σ, x₀ = x₀)).elim (fun hx₀ => ?_)
    (fun hn => ⟨λ _ ↦ True, fun x => (hn ⟨x, rfl⟩).elim⟩)
  obtain ⟨x₀, -⟩ := hx₀
  obtain ⟨S, hSf, hSU⟩ := rc (λ C y ↦ C y ∨ ¬ ∃ z, C z) (serial_cell x₀)
  refine ⟨λ y ↦ ∃ C : σ → Prop, WeaklyRigid C ∧ (∀ z, C z ↔ R y z) ∧ S C y, fun x => ?_⟩
  obtain ⟨C, hC, hco⟩ := vw (R x)
  obtain ⟨y, hSy, hSu⟩ := hSf C
  have hCy : C y := (hSU C y hSy).elim id (fun hn => (hn ⟨x, (hco x).1 (hR.1 x)⟩).elim)
  have hRxy : R x y := (hco y).2 hCy
  refine ⟨y, hRxy, ⟨C, hC, fun z => ⟨fun hz => hR.2.2 y x z (hR.2.1 x y hRxy) ((hco z).2 hz),
    fun hz => (hco z).1 (hR.2.2 x y z hRxy hz)⟩, hSy⟩, ?_⟩
  rintro z ⟨hRxz, C', hC', hco', hSC'⟩
  have e : C' = C := eq_of_weaklyRigid_coext hC' hC fun u =>
    ⟨fun hu => (hco u).1 (hR.2.2 x z u hRxz ((hco' u).1 hu)),
     fun hu => (hco' u).2 (hR.2.2 z x u (hR.2.1 x z hRxz) ((hco u).2 hu))⟩
  rw [e] at hSC'
  exact hSu z hSC'

/-- `necessary-transversal-and-necessary-relational-choice-imply-necessary-transversal-choice`:
the unboxed record necessitated, and `K`. -/
theorem necessary_transversal_and_necessary_relational_choice_imply_necessary_transversal_choice
    {σ : Type} [Ty σ] :
    NecTransversal σ → NecRelationalChoice (σ → Prop) σ → NecTransversalChoice σ :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% (transversal_and_relational_choice_imply_transversal_choice (σ := σ))) h₁) h₂

/-- Rigid pairs are injective: `λuv. u = x ∧ v = y` determines `x` and `y`. -/
theorem pair_injective {σ τ : Type} [Ty σ] [Ty τ] (x x' : σ) (y y' : τ)
    (h : (λ (u : σ) (v : τ) ↦ u = x ∧ v = y) = (λ u v ↦ u = x' ∧ v = y')) :
    x = x' ∧ y = y' :=
  (congrFun (congrFun h x) y).mp ⟨rfl, rfl⟩

/-- `transversal-choice-r-implies-relational-choice-r`: code `x`, `y` as the rigid pair
`λuv. u = x ∧ v = y`. Relating two `U`-pairs with the same first coordinate, and any two
non-`U`-pairs, is an equivalence relation, by injectivity; a transversal of it picks one
`U`-pair for each `x`, and `(Sx)y := (Ux)y ∧ F⟨x, y⟩` is a functional subrelation of `U`. -/
theorem transversal_choice_r_implies_relational_choice_r {σ τ : Type} [Ty σ] [Ty τ] :
    TransversalChoice (σ → τ → Prop) → RelationalChoice σ τ := by
  intro tc U hU
  have hE : EquivRel (λ (P Q : σ → τ → Prop) ↦
      (∃ x, (∃ y, U x y ∧ P = (λ u v ↦ u = x ∧ v = y)) ∧
        (∃ y, U x y ∧ Q = (λ u v ↦ u = x ∧ v = y))) ∨
      ((¬ ∃ x y, U x y ∧ P = (λ u v ↦ u = x ∧ v = y)) ∧
        (¬ ∃ x y, U x y ∧ Q = (λ u v ↦ u = x ∧ v = y)))) :=
    ⟨fun P => (em (∃ x y, U x y ∧ P = (λ u v ↦ u = x ∧ v = y))).elim
        (fun h => h.elim fun x hx => hx.elim fun y hy => Or.inl ⟨x, ⟨y, hy⟩, ⟨y, hy⟩⟩)
        (fun h => Or.inr ⟨h, h⟩),
     fun _ _ h => h.elim (fun h => h.elim fun x hx => Or.inl ⟨x, hx.2, hx.1⟩)
        (fun h => Or.inr ⟨h.2, h.1⟩),
     fun _ _ _ h₁ h₂ => h₁.elim
      (fun h₁ => h₁.elim fun x hx => h₂.elim
        (fun h₂ => h₂.elim fun x' hx' =>
          hx.2.elim fun y hy => hx'.1.elim fun y' hy' =>
            have e : x = x' := (pair_injective x x' y y' (hy.2.symm.trans hy'.2)).1
            Or.inl ⟨x, hx.1, e ▸ hx'.2⟩)
        (fun h₂ => (h₂.1 (hx.2.elim fun y hy => ⟨x, y, hy⟩)).elim))
      (fun h₁ => h₂.elim
        (fun h₂ => (h₁.2 (h₂.elim fun x' hx' => hx'.1.elim fun y' hy' => ⟨x', y', hy'⟩)).elim)
        (fun h₂ => Or.inr ⟨h₁.1, h₂.2⟩))⟩
  obtain ⟨F, hF⟩ := tc _ hE
  refine ⟨λ x y ↦ U x y ∧ F (λ u v ↦ u = x ∧ v = y), fun x => ?_, fun _ _ h => h.1⟩
  obtain ⟨y₀, hy₀⟩ := hU x
  obtain ⟨P', hEP', hFP', hu⟩ := hF (λ u v ↦ u = x ∧ v = y₀)
  rcases hEP' with ⟨x₁, ⟨y₁, -, e₁⟩, ⟨y₂, hU₂, e₂⟩⟩ | ⟨hn, -⟩
  · have ex : x = x₁ := (pair_injective x x₁ y₀ y₁ e₁).1
    subst ex
    refine ⟨y₂, ⟨hU₂, e₂ ▸ hFP'⟩, fun z hz => ?_⟩
    have e₃ := hu (λ u v ↦ u = x ∧ v = z) ⟨Or.inl ⟨x, ⟨y₀, hy₀, rfl⟩, ⟨z, hz.1, rfl⟩⟩, hz.2⟩
    exact (pair_injective x x y₂ z (e₂.symm.trans e₃)).2
  · exact (hn ⟨x, y₀, hy₀, rfl⟩).elim

/-- `necessary-transversal-choice-r-implies-necessary-relational-choice-r`: the unboxed
record necessitated, and `K`. -/
theorem necessary_transversal_choice_r_implies_necessary_relational_choice_r
    {σ τ : Type} [Ty σ] [Ty τ] :
    NecTransversalChoice (σ → τ → Prop) → NecRelationalChoice σ τ :=
  modal_K _ _ (nec% (transversal_choice_r_implies_relational_choice_r (σ := σ) (τ := τ)))

/-! ### Modalized Plenitude (28 September)

At output `σ' → t`, its list form in `σ'` being the record at every output type: the
operation `Fx := λu. ∀y. Uxy → yu` represents `U` wherever its values are necessarily
unique, by Intensionality. -/

/-- `classicism-implies-modalized-plenitude-r`, at output `σ' → t`, its list form in `σ'`
being the map's record: `λxu. ∀y. Uxy → yu` necessarily represents `U`. -/
theorem classicism_implies_modalized_plenitude_r {σ' σ : Type} [Ty σ'] [Ty σ] :
    ModalizedPlenitude σ (σ' → Prop) := fun U hH =>
  ⟨λ x u ↦ ∀ y : σ' → Prop, U x y → y u, modal_K _ _ (nec% (mp_represents U)) hH⟩

/-- `necessary-intensional-choice-r-implies-intensional-choice-r`: `T`. -/
theorem necessary_intensional_choice_r_implies_intensional_choice_r {σ : Type} [Ty σ] :
    NecIntensionalChoice σ → IntensionalChoice σ := box_elim


/-- `extensionality-r-implies-intensional-choice-r`: Extensionality at `t` makes every truth
necessary. A necessarily instantiated `F` is instantiated, by `a` say, so `□Fa`; then
`λx. x = a` entails `F` and is necessarily uniquely instantiated. -/
theorem extensionality_r_implies_intensional_choice_r {σ : Type} [Ty σ] :
    Extensionality Prop → IntensionalChoice σ := fun ext F hF =>
  (box_elim hF).elim fun a ha =>
    have hb : □ (F a) := (ext (F a) True ⟨fun _ => trivial, fun _ => ha⟩) ▸ box_true
    ⟨fun x => x = a,
      le_of_box_incl (modal_K _ _ (nec% (fun (h : F a) (x : σ) (hx : x = a) => hx ▸ h)) hb),
      nec% ⟨a, rfl, fun _ hy => hy⟩⟩


/-! ### Well-orders (7–8 October 2026) -/

/-- `well-ordering-r-implies-transversal-choice-r`: the least member of each cell. -/
theorem well_ordering_r_implies_transversal_choice_r {σ : Type} [Ty σ] :
    WellOrdering σ → TransversalChoice σ := fun ⟨R, hR⟩ E hE =>
  ⟨fun y => ∀ z, E y z → R y z, fun x =>
    (hR.2.2.2 (fun z => E x z) ⟨x, hE.1 x⟩).elim fun m ⟨hm, hmin⟩ =>
    have least := least_of_minimal hR hmin
    ⟨m, hm, fun z hz => least z (hE.2.2 x m z hm hz), fun z ⟨hxz, hFz⟩ =>
      hR.2.1 m z (least z hxz) (hFz m (hE.2.2 z x m (hE.2.1 x z hxz) hm))⟩⟩

/-- `necessary-well-ordering-r-implies-well-ordering-r`: `T`. -/
theorem necessary_well_ordering_r_implies_well_ordering_r {σ : Type} [Ty σ] :
    NecWellOrdering σ → WellOrdering σ := box_elim

/-- `necessary-well-ordering-r-implies-necessary-transversal-choice-r`. -/
theorem necessary_well_ordering_r_implies_necessary_transversal_choice_r {σ : Type} [Ty σ] :
    NecWellOrdering σ → NecTransversalChoice σ :=
  modal_K _ _ (nec% (well_ordering_r_implies_transversal_choice_r (σ := σ)))

/-- `modal-well-ordering-r-implies-intensional-choice-r`: being the least instance. -/
theorem modal_well_ordering_r_implies_intensional_choice_r {σ : Type} [Ty σ] :
    ModalWellOrdering σ → IntensionalChoice σ := fun ⟨R, hR⟩ F hF =>
  ⟨fun x => F x ∧ ∀ y, F y → R x y,
   le_of_box_incl (nec% (fun (x : σ) (h : F x ∧ ∀ y, F y → R x y) => h.1)),
   modal_K _ _ (modal_K _ _ (nec% (unique_least R F)) hR) hF⟩

/-- Modal Well-Ordering is necessary, by `4`. -/
theorem box_modal_well_ordering {σ : Type} [Ty σ] (h : ModalWellOrdering σ) :
    □ (ModalWellOrdering σ) :=
  h.elim fun R hR => modal_K _ _
    (nec% (fun (h : □ (WellOrders R)) => (⟨R, h⟩ : ModalWellOrdering σ))) (modal_four _ hR)

/-- `modal-well-ordering-r-implies-necessary-intensional-choice-r`. -/
theorem modal_well_ordering_r_implies_necessary_intensional_choice_r {σ : Type} [Ty σ] :
    ModalWellOrdering σ → NecIntensionalChoice σ := fun h =>
  modal_K _ _ (nec% (modal_well_ordering_r_implies_intensional_choice_r (σ := σ)))
    (box_modal_well_ordering h)

/-- `modal-well-ordering-r-implies-necessary-well-ordering-r`. -/
theorem modal_well_ordering_r_implies_necessary_well_ordering_r {σ : Type} [Ty σ] :
    ModalWellOrdering σ → NecWellOrdering σ := fun ⟨R, hR⟩ =>
  modal_K _ _ (nec% (fun (h : WellOrders R) => (⟨R, h⟩ : WellOrdering σ))) hR

/-- The relation defined from a unique well-order is a well-order. -/
theorem wellOrders_of_unique {σ : Type} [Ty σ] (G : (σ → σ → Prop) → Prop)
    (hG : ∀ R, G R → WellOrders R) (hu : ∃ R, G R ∧ ∀ R', G R' → R' = R) :
    WellOrders (fun x y => ∃ R, G R ∧ R x y) :=
  hu.elim fun R₀ ⟨h₀, hu₀⟩ => wellOrders_of_iff R₀ _
    (fun x y => ⟨fun ⟨R, hR, hxy⟩ => by rw [← hu₀ R hR]; exact hxy, fun hxy => ⟨R₀, h₀, hxy⟩⟩)
    (hG R₀ h₀)

/-- `necessary-well-ordering-and-intensional-choice-imply-modal-well-ordering`: Intensional
Choice at the type of relations picks a necessarily unique well-order, and the relation it
defines is necessarily a well-order. -/
theorem necessary_well_ordering_and_intensional_choice_imply_modal_well_ordering {σ : Type}
    [Ty σ] : NecWellOrdering σ → IntensionalChoice (σ → σ → Prop) → ModalWellOrdering σ :=
  fun hwo ic => (ic (fun R => WellOrders R) hwo).elim fun G ⟨hGF, hu⟩ =>
  ⟨fun x y => ∃ R, G R ∧ R x y, modal_K _ _ (modal_K _ _
    (nec% (fun (hGF : ∀ R : σ → σ → Prop, G R → WellOrders R)
        (hu : ∃ R, G R ∧ ∀ R', G R' → R' = R) => wellOrders_of_unique G hGF hu))
    ((le_iff G _).1 hGF)) hu⟩


/-! ### Zorn's Lemma gives Well-Ordering (8 October 2026)

The good relations — well-orders of their own fields — ordered by end-extension, with every
relation that is not good put at the bottom. -/

section zornWO
variable {σ : Type} [Ty σ]

/-- `S` is good: its pairs lie in its field, which it well-orders. -/
def ZGood (S : σ → σ → Prop) : Prop :=
  (∀ x y, S x y → S x x ∧ S y y) ∧ TotalOrderOn S (fun x => S x x) ∧
    ∀ Y : σ → Prop, (∀ y, Y y → S y y) → (∃ y, Y y) → ∃ x, Y x ∧ ∀ y, Y y → S y x → y = x

/-- `S'` end-extends `S`. -/
def ZExt (S S' : σ → σ → Prop) : Prop :=
  (∀ x y, S x y → S' x y) ∧ ∀ x y, S x x → S' y x → S y x

/-- The preorder of the proof: `¬Good(S) ∨ (Good(S') ∧ S ⊑ S')`. -/
def ZR (S S' : σ → σ → Prop) : Prop := ¬ ZGood S ∨ (ZGood S' ∧ ZExt S S')

theorem zext_refl (S : σ → σ → Prop) : ZExt S S := ⟨fun _ _ h => h, fun _ _ _ h => h⟩

theorem zext_trans (S₁ S₂ S₃ : σ → σ → Prop) (h₁ : ZExt S₁ S₂) (h₂ : ZExt S₂ S₃) :
    ZExt S₁ S₃ :=
  ⟨fun x y h => h₂.1 x y (h₁.1 x y h),
   fun x y hx h => h₁.2 x y hx (h₂.2 x y (h₁.1 x x hx) h)⟩

theorem zr_refl (S : σ → σ → Prop) : ZR S S :=
  (em (ZGood S)).elim (fun g => Or.inr ⟨g, zext_refl S⟩) Or.inl

theorem zr_trans (S₁ S₂ S₃ : σ → σ → Prop) (h₁ : ZR S₁ S₂) (h₂ : ZR S₂ S₃) : ZR S₁ S₃ :=
  h₁.elim Or.inl fun ⟨g₂, e₁⟩ => h₂.elim (fun n => (n g₂).elim)
    fun ⟨g₃, e₂⟩ => Or.inr ⟨g₃, zext_trans S₁ S₂ S₃ e₁ e₂⟩

/-- The empty relation. -/
def ZEmpty : σ → σ → Prop := fun _ _ => False

/-- The empty relation is good. -/
theorem zgood_empty : ZGood (ZEmpty (σ := σ)) :=
  ⟨fun _ _ h => h.elim, ⟨fun _ _ _ h => h.elim, fun _ _ h => h.elim, fun _ _ h => h.elim⟩,
   fun Y hY ⟨y, hy⟩ => (hY y hy).elim⟩

/-- Two good members of an `ZR`-chain are comparable by end-extension. -/
theorem zchain_comparable (𝒳 : (σ → σ → Prop) → Prop) (hc : TotalOrderOn ZR 𝒳)
    {S S' : σ → σ → Prop} (hS : 𝒳 S) (hS' : 𝒳 S') (g : ZGood S) (g' : ZGood S') :
    ZExt S S' ∨ ZExt S' S :=
  (hc.2.2 S S' hS hS').elim
    (fun h => h.elim (fun n => (n g).elim) fun h => Or.inl h.2)
    (fun h => h.elim (fun n => (n g').elim) fun h => Or.inr h.2)

/-- Two good members of a chain lie below a common good member. -/
theorem zchain_common (𝒳 : (σ → σ → Prop) → Prop) (hc : TotalOrderOn ZR 𝒳)
    {S₁ S₂ : σ → σ → Prop} (h₁ : 𝒳 S₁) (h₂ : 𝒳 S₂) (g₁ : ZGood S₁) (g₂ : ZGood S₂) :
    ∃ S, 𝒳 S ∧ ZGood S ∧ (∀ a b, S₁ a b → S a b) ∧ ∀ a b, S₂ a b → S a b :=
  (zchain_comparable 𝒳 hc h₁ h₂ g₁ g₂).elim
    (fun e => ⟨S₂, h₂, g₂, e.1, fun _ _ h => h⟩)
    (fun e => ⟨S₁, h₁, g₁, fun _ _ h => h, e.1⟩)

/-- The union of the good members of a chain. -/
def ZUnion (𝒳 : (σ → σ → Prop) → Prop) : σ → σ → Prop :=
  fun x y => ∃ S, 𝒳 S ∧ ZGood S ∧ S x y

theorem zunion_ext (𝒳 : (σ → σ → Prop) → Prop) (hc : TotalOrderOn ZR 𝒳)
    {S : σ → σ → Prop} (hS : 𝒳 S) (g : ZGood S) : ZExt S (ZUnion 𝒳) :=
  ⟨fun x y h => ⟨S, hS, g, h⟩, fun x y hx ⟨S', hS', g', h'⟩ =>
    (zchain_comparable 𝒳 hc hS hS' g g').elim (fun e => e.2 x y hx h') (fun e => e.1 y x h')⟩

theorem zunion_good (𝒳 : (σ → σ → Prop) → Prop) (hc : TotalOrderOn ZR 𝒳) :
    ZGood (ZUnion 𝒳) :=
  ⟨fun x y ⟨S, hS, g, h⟩ => ⟨⟨S, hS, g, (g.1 x y h).1⟩, ⟨S, hS, g, (g.1 x y h).2⟩⟩,
   ⟨fun x y z _ _ _ ⟨S₁, h₁, g₁, a⟩ ⟨S₂, h₂, g₂, b⟩ =>
      (zchain_common 𝒳 hc h₁ h₂ g₁ g₂).elim fun S ⟨hS, g, i₁, i₂⟩ =>
        ⟨S, hS, g, g.2.1.1 x y z (g.1 x y (i₁ x y a)).1 (g.1 x y (i₁ x y a)).2
          (g.1 y z (i₂ y z b)).2 (i₁ x y a) (i₂ y z b)⟩,
    fun x y _ _ ⟨S₁, h₁, g₁, a⟩ ⟨S₂, h₂, g₂, b⟩ =>
      (zchain_common 𝒳 hc h₁ h₂ g₁ g₂).elim fun S ⟨_, g, i₁, i₂⟩ =>
        g.2.1.2.1 x y (g.1 x y (i₁ x y a)).1 (g.1 x y (i₁ x y a)).2 (i₁ x y a) (i₂ y x b),
    fun x y ⟨S₁, h₁, g₁, a⟩ ⟨S₂, h₂, g₂, b⟩ =>
      (zchain_common 𝒳 hc h₁ h₂ g₁ g₂).elim fun S ⟨hS, g, i₁, i₂⟩ =>
        (g.2.1.2.2 x y (i₁ x x a) (i₂ y y b)).elim
          (fun h => Or.inl ⟨S, hS, g, h⟩) (fun h => Or.inr ⟨S, hS, g, h⟩)⟩,
   fun Y hY ⟨y₀, hy₀⟩ => (hY y₀ hy₀).elim fun S ⟨hS, g, h₀⟩ =>
      (g.2.2 (fun w => Y w ∧ S w w) (fun _ h => h.2) ⟨y₀, hy₀, h₀⟩).elim fun m ⟨⟨hm, hmm⟩, hmin⟩ =>
        ⟨m, hm, fun y hy ⟨S', hS', g', h'⟩ =>
          have hym : S y m := (zchain_comparable 𝒳 hc hS hS' g g').elim
            (fun e => e.2 m y hmm h') (fun e => e.1 y m h')
          hmin y ⟨hy, (g.1 y m hym).1⟩ hym⟩⟩

/-- `m` with a new point `z` put on top. -/
def ZTop (m : σ → σ → Prop) (z : σ) : σ → σ → Prop :=
  fun x y => m x y ∨ (m x x ∧ y = z) ∨ (x = z ∧ y = z)

theorem ztop_good (m : σ → σ → Prop) (g : ZGood m) (z : σ) (hz : ¬ m z z) :
    ZGood (ZTop m z) := by
  -- the field of `ZTop m z` is that of `m` with `z`
  have fld : ∀ x, ZTop m z x x → m x x ∨ x = z := fun x h =>
    h.elim Or.inl fun h => h.elim (fun h => Or.inl h.1) fun h => Or.inr h.1
  have top : ∀ x, (m x x ∨ x = z) → ZTop m z x z := fun x h =>
    h.elim (fun h => Or.inr (Or.inl ⟨h, rfl⟩)) fun h => Or.inr (Or.inr ⟨h, rfl⟩)
  -- a pair of `ZTop m z` ending below `z` is a pair of `m`
  have low : ∀ x y, ZTop m z x y → y ≠ z → m x y := fun x y h hy =>
    h.elim id fun h => h.elim (fun h => (hy h.2).elim) fun h => (hy h.2).elim
  have mne : ∀ x, m x x → x ≠ z := fun x hx e => hz (e ▸ hx)
  refine ⟨fun x y h => ⟨?_, ?_⟩, ⟨?_, ?_, ?_⟩, ?_⟩
  · exact h.elim (fun h => Or.inl (g.1 x y h).1)
      fun h => h.elim (fun h => Or.inl h.1) fun h => Or.inr (Or.inr ⟨h.1, h.1⟩)
  · exact h.elim (fun h => Or.inl (g.1 x y h).2)
      fun h => h.elim (fun h => Or.inr (Or.inr ⟨h.2, h.2⟩)) fun h => Or.inr (Or.inr ⟨h.2, h.2⟩)
  · intro x y w _ _ _ hxy hyw
    refine (em (w = z)).elim (fun e => ?_) (fun e => ?_)
    · rw [e]
      exact top x (hxy.elim (fun h => Or.inl (g.1 x y h).1)
        fun h => h.elim (fun h => Or.inl h.1) fun h => Or.inr h.1)
    · have h₂ : m y w := low y w hyw e
      have hy : y ≠ z := mne y (g.1 y w h₂).1
      exact Or.inl (g.2.1.1 x y w (g.1 x y (low x y hxy hy)).1 (g.1 y w h₂).1
        (g.1 y w h₂).2 (low x y hxy hy) h₂)
  · intro x y _ _ hxy hyx
    refine (em (y = z)).elim (fun e => ?_) (fun e => ?_)
    · rw [e] at hyx ⊢
      exact hyx.elim (fun h => (hz (g.1 z x h).1).elim)
        fun h => h.elim (fun h => (hz h.1).elim) fun h => h.2
    · refine (em (x = z)).elim (fun e' => ?_) (fun e' => ?_)
      · rw [e'] at hxy
        exact (hz (g.1 z y (low z y hxy e)).1).elim
      · exact g.2.1.2.1 x y (g.1 x y (low x y hxy e)).1 (g.1 x y (low x y hxy e)).2
          (low x y hxy e) (low y x hyx e')
  · intro x y hx hy
    refine (em (y = z)).elim (fun e => ?_) (fun e => ?_)
    · rw [e]; exact Or.inl (top x (fld x hx))
    · refine (em (x = z)).elim (fun e' => ?_) (fun e' => ?_)
      · rw [e']; exact Or.inr (top y (fld y hy))
      · have hx' : m x x := (fld x hx).elim id fun h => (e' h).elim
        have hy' : m y y := (fld y hy).elim id fun h => (e h).elim
        exact (g.2.1.2.2 x y hx' hy').elim (fun h => Or.inl (Or.inl h)) fun h => Or.inr (Or.inl h)
  · intro Y hY hne
    refine (em (∃ y, Y y ∧ m y y)).elim (fun ⟨y₀, hy₀, hm₀⟩ => ?_) (fun hn => ?_)
    · obtain ⟨m₀, ⟨hm₀Y, hm₀m⟩, hmin⟩ :=
        g.2.2 (fun w => Y w ∧ m w w) (fun _ h => h.2) ⟨y₀, hy₀, hm₀⟩
      refine ⟨m₀, hm₀Y, fun y hy hym => ?_⟩
      have hym' : m y m₀ := low y m₀ hym (mne m₀ hm₀m)
      exact hmin y ⟨hy, (g.1 y m₀ hym').1⟩ hym'
    · obtain ⟨y₀, hy₀⟩ := hne
      have allz : ∀ y, Y y → y = z := fun y hy =>
        (fld y (hY y hy)).elim (fun h => (hn ⟨y, hy, h⟩).elim) id
      exact ⟨y₀, hy₀, fun y hy _ => (allz y hy).trans (allz y₀ hy₀).symm⟩

theorem ztop_ext (m : σ → σ → Prop) (z : σ) (hz : ¬ m z z) : ZExt m (ZTop m z) :=
  ⟨fun _ _ h => Or.inl h, fun x y hx h => h.elim id fun h => h.elim
    (fun h => (hz (h.2 ▸ hx)).elim) fun h => (hz (h.2 ▸ hx)).elim⟩

end zornWO

/-- `zorn-r-implies-well-ordering-r`: Zorn's Lemma at `σσt`, for the good relations under
end-extension, gives a good relation whose field is everything. -/
theorem zorn_r_implies_well_ordering_r {σ : Type} [Ty σ] :
    Zorn (σ → σ → Prop) → WellOrdering σ := fun zl =>
  (zl ZR ⟨⟨zr_refl, zr_trans⟩, fun 𝒳 hc => ⟨ZUnion 𝒳, fun S hS =>
      (em (ZGood S)).elim (fun g => Or.inr ⟨zunion_good 𝒳 hc, zunion_ext 𝒳 hc hS g⟩) Or.inl⟩⟩).elim
  fun m hmax =>
  have g : ZGood m := (em (ZGood m)).elim id fun n =>
    ((hmax _ (Or.inl n)).elim (fun h => (h zgood_empty).elim) fun h => h.1)
  have hall : ∀ z, m z z := fun z => (em (m z z)).elim id fun hz =>
    (hmax _ (Or.inr ⟨ztop_good m g z hz, ztop_ext m z hz⟩)).elim
      (fun h => (h (ztop_good m g z hz)).elim)
      (fun h => h.2.1 z z (Or.inr (Or.inr ⟨rfl, rfl⟩)))
  ⟨m, fun x y w => g.2.1.1 x y w (hall x) (hall y) (hall w),
   fun x y => g.2.1.2.1 x y (hall x) (hall y),
   fun x y => g.2.1.2.2 x y (hall x) (hall y),
   fun Y hY => g.2.2 Y (fun y _ => hall y) hY⟩


/-! ### Transversal Choice gives Zorn's Lemma (8 October 2026)

Lewin's proof (*A Simple Proof of Zorn's Lemma*, 1991), as in the write-up of
`transversal-choice-r-implies-zorn-r`. The core is stated for a preorder `R` with no
maximal element and any functional, extensional `F` choosing a strict upper bound for each
chain; Transversal Choice supplies such an `F`. -/

section lewin
variable {σ : Type} [Ty σ] (R : σ → σ → Prop) (F : (σ → Prop) → σ → Prop)

/-- `R` well-orders `A`. -/
def LWO (A : σ → Prop) : Prop :=
  TotalOrderOn R A ∧ ∀ Y : σ → Prop, (∀ y, Y y → A y) → (∃ y, Y y) →
    ∃ x, Y x ∧ ∀ y, Y y → R y x → y = x

/-- The initial segment `P(C,x)`. -/
def LP (C : σ → Prop) (x : σ) : σ → Prop := fun y => C y ∧ (R y x ∧ ¬ R x y)

/-- Conforming: well-ordered, each point the `F`-choice for its initial segment. -/
def LConf (A : σ → Prop) : Prop := LWO R A ∧ ∀ x, A x → F (LP R A x) x

/-- The union of the conforming properties. -/
def LUstar (w : σ) : Prop := ∃ A, LConf R F A ∧ A w

theorem lwo_exists_least {A : σ → Prop} (h : LWO R A) (Y : σ → Prop) (hYA : ∀ y, Y y → A y)
    (hY : ∃ y, Y y) : ∃ m, Y m ∧ ∀ y, Y y → R m y :=
  (h.2 Y hYA hY).elim fun m ⟨hm, hmin⟩ => ⟨m, hm, fun y hy =>
    (h.1.2.2 m y (hYA m hm) (hYA y hy)).elim id fun hym => by
      rw [hmin y hy hym]
      exact (h.1.2.2 m m (hYA m hm) (hYA m hm)).elim id id⟩

variable {R F}
variable (htrans : ∀ x y z, R x y → R y z → R x z)
  (Fext : ∀ C C', (∀ y, C y ↔ C' y) → ∀ x, F C x → F C' x)
  (Funiq : ∀ C x z, F C x → F C z → x = z)

include htrans in
theorem lt_of_le_lt' (x y z : σ) (h₁ : R x y) (h : R y z ∧ ¬ R z y) : R x z ∧ ¬ R z x :=
  ⟨htrans x y z h₁ h.1, fun h' => h.2 (htrans z x y h' h₁)⟩

include htrans Fext Funiq in
/-- Lemma 1: if `x` is the least instance of `A` not in `B`, then `B ≡ P(A,x)`. -/
theorem lewin_lemma1 (A B : σ → Prop) (hA : LConf R F A) (hB : LConf R F B) (x : σ)
    (hxA : A x) (hxB : ¬ B x) (hxl : ∀ w, (A w ∧ ¬ B w) → R x w) :
    ∀ y, B y ↔ LP R A x y := by
  have hPB : ∀ w, LP R A x w → B w := fun w ⟨hwA, hwx⟩ =>
    (em (B w)).elim id fun hwB => (hwx.2 (hxl w ⟨hwA, hwB⟩)).elim
  refine (em (∀ y, B y → LP R A x y)).elim (fun h y => ⟨h y, hPB y⟩) fun hn' => ?_
  exfalso
  have hex : ∃ w, B w ∧ ¬ LP R A x w := (em (∃ w, B w ∧ ¬ LP R A x w)).elim id fun h =>
    (hn' fun w hw => (em (LP R A x w)).elim id fun hp => (h ⟨w, hw, hp⟩).elim).elim
  obtain ⟨y, ⟨hyB, hyP⟩, hyl⟩ :=
    lwo_exists_least R hB.1 (fun w => B w ∧ ¬ LP R A x w) (fun w h => h.1) hex
  have h1 : ∀ w, LP R B y w → LP R A x w := fun w ⟨hwB, hwy⟩ =>
    (em (LP R A x w)).elim id fun hp => (hwy.2 (hyl w ⟨hwB, hp⟩)).elim
  obtain ⟨z, ⟨hzA, hzP⟩, hzl⟩ := lwo_exists_least R hA.1 (fun w => A w ∧ ¬ LP R B y w)
    (fun w h => h.1) ⟨x, hxA, fun h => hxB h.1⟩
  have hAB : ∀ w, LP R A z w ↔ LP R B y w := fun w =>
    ⟨fun ⟨hwA, hwz⟩ => (em (LP R B y w)).elim id fun hp => (hwz.2 (hzl w ⟨hwA, hp⟩)).elim,
     fun hw => by
      obtain ⟨hwA, hwx⟩ := h1 w hw
      refine ⟨hwA, (em (R w z ∧ ¬ R z w)).elim id fun hwz => ?_⟩
      exfalso
      have hzw : R z w := (hA.1.1.2.2 z w hzA hwA).elim id fun h =>
        (em (R z w)).elim id fun h' => (hwz ⟨h, h'⟩).elim
      exact hzP ⟨hPB z ⟨hzA, lt_of_le_lt' htrans z w x hzw hwx⟩,
        lt_of_le_lt' htrans z w y hzw hw.2⟩⟩
  have hyz : y = z := Funiq (LP R B y) y z (hB.2 y hyB) (Fext _ _ hAB z (hA.2 z hzA))
  have hyA : A y := by rw [hyz]; exact hzA
  have hxy : R x y := (em (R y x ∧ ¬ R x y)).elim (fun h => (hyP ⟨hyA, h⟩).elim) fun h =>
    (hA.1.1.2.2 x y hxA hyA).elim id fun hyx => (em (R x y)).elim id fun hxy' =>
      (h ⟨hyx, hxy'⟩).elim
  have hxne : ¬ R y x := fun hyx => hxB (by
    rw [hA.1.1.2.1 x y hxA hyA hxy hyx]; exact hyB)
  have hxP : LP R A z x := ⟨hxA, by rw [← hyz]; exact ⟨hxy, hxne⟩⟩
  exact hxB ((hAB x).1 hxP).1

include htrans Fext Funiq in
/-- Lemma 2: conforming properties are comparable. -/
theorem lewin_comparable (A B : σ → Prop) (hA : LConf R F A) (hB : LConf R F B) :
    (∀ w, A w → B w) ∨ (∀ w, B w → A w) :=
  (em (∀ w, A w → B w)).elim Or.inl fun hn => Or.inr (by
    have hex : ∃ w, A w ∧ ¬ B w := (em (∃ w, A w ∧ ¬ B w)).elim id fun h =>
      (hn fun w hw => (em (B w)).elim id fun hb => (h ⟨w, hw, hb⟩).elim).elim
    obtain ⟨x, ⟨hxA, hxB⟩, hxl⟩ := lwo_exists_least R hA.1 _ (fun w h => h.1) hex
    exact fun w hw => ((lewin_lemma1 htrans Fext Funiq A B hA hB x hxA hxB hxl w).1 hw).1)

include htrans Fext Funiq in
/-- Lemma 2: a conforming property inside another is downward closed in it. -/
theorem lewin_down (A B : σ → Prop) (hA : LConf R F A) (hB : LConf R F B)
    (a b : σ) (ha : A a) (hb : B b) (hba : R b a) : A b :=
  (em (∀ w, B w → A w)).elim (fun h => h b hb) fun hn => by
    have hex : ∃ w, B w ∧ ¬ A w := (em (∃ w, B w ∧ ¬ A w)).elim id fun h =>
      (hn fun w hw => (em (A w)).elim id fun ha' => (h ⟨w, hw, ha'⟩).elim).elim
    obtain ⟨x, ⟨hxB, hxA⟩, hxl⟩ := lwo_exists_least R hB.1 _ (fun w h => h.1) hex
    have he := lewin_lemma1 htrans Fext Funiq B A hB hA x hxB hxA hxl
    exact (he b).2 ⟨hb, lt_of_le_lt' htrans b a x hba ((he a).1 ha).2⟩

include htrans Fext Funiq in
/-- Lemma 3. -/
theorem lewin_lemma3 (A : σ → Prop) (hA : LConf R F A) (a w : σ) (ha : A a)
    (hw : LUstar R F w) (hwa : R w a) : A w :=
  hw.elim fun B ⟨hB, hwB⟩ => (lewin_comparable htrans Fext Funiq A B hA hB).elim
    (fun h => lewin_down htrans Fext Funiq A B hA hB a w ha hwB hwa) (fun h => h w hwB)

include htrans Fext Funiq in
/-- Any two points of the union lie in one conforming property. -/
theorem lewin_common (x y : σ) (hx : LUstar R F x) (hy : LUstar R F y) :
    ∃ C, LConf R F C ∧ C x ∧ C y :=
  hx.elim fun A ⟨hA, hxA⟩ => hy.elim fun B ⟨hB, hyB⟩ =>
    (lewin_comparable htrans Fext Funiq A B hA hB).elim
      (fun h => ⟨B, hB, h x hxA, hyB⟩) (fun h => ⟨A, hA, hxA, h y hyB⟩)

include htrans Fext Funiq in
/-- Lemma 4: the union is conforming. -/
theorem lewin_lemma4 : LConf R F (LUstar R F) :=
  ⟨⟨⟨fun x y z _ _ _ => htrans x y z,
     fun x y hx hy => (lewin_common htrans Fext Funiq x y hx hy).elim fun C ⟨hC, hxC, hyC⟩ =>
       hC.1.1.2.1 x y hxC hyC,
     fun x y hx hy => (lewin_common htrans Fext Funiq x y hx hy).elim fun C ⟨hC, hxC, hyC⟩ =>
       hC.1.1.2.2 x y hxC hyC⟩,
    fun Y hY ⟨y₀, hy₀⟩ => (hY y₀ hy₀).elim fun A ⟨hA, hy₀A⟩ =>
      (hA.1.2 (fun w => Y w ∧ A w) (fun w h => h.2) ⟨y₀, hy₀, hy₀A⟩).elim
        fun m ⟨⟨hm, hmA⟩, hmin⟩ => ⟨m, hm, fun y hy hym =>
          hmin y ⟨hy, lewin_lemma3 htrans Fext Funiq A hA m y hmA (hY y hy) hym⟩ hym⟩⟩,
   fun x ⟨A, hA, hxA⟩ => Fext (LP R A x) (LP R (LUstar R F) x)
     (fun y => ⟨fun ⟨hyA, hyx⟩ => ⟨⟨A, hA, hyA⟩, hyx⟩,
       fun ⟨hy, hyx⟩ => ⟨lewin_lemma3 htrans Fext Funiq A hA x y hxA hy hyx.1, hyx⟩⟩)
     x (hA.2 x hxA)⟩

include htrans Fext Funiq in
/-- The core: no functional, extensional `F` picks a strict upper bound for every chain. -/
theorem lewin_core (hrefl : ∀ x, R x x)
    (Ffun : ∀ C, ∃ x, F C x)
    (FU : ∀ C x, F C x → TotalOrderOn R C → ∀ y, C y → R y x ∧ ¬ R x y) : False := by
  have h4 := lewin_lemma4 htrans Fext Funiq
  obtain ⟨x, hx⟩ := Ffun (LUstar R F)
  have below : ∀ y, LUstar R F y → R y x ∧ ¬ R x y := FU _ x hx h4.1.1
  -- `U' := U* ∪ {x}` is conforming
  have hconf : LConf R F (fun w => LUstar R F w ∨ w = x) := by
    refine ⟨⟨⟨fun a b c _ _ _ => htrans a b c, ?_, ?_⟩, ?_⟩, ?_⟩
    · intro a b ha hb hab hba
      rcases ha with ha | ha <;> rcases hb with hb | hb
      · exact h4.1.1.2.1 a b ha hb hab hba
      · rw [hb] at hab hba; exact ((below a ha).2 hba).elim
      · rw [ha] at hab hba; exact ((below b hb).2 hab).elim
      · rw [ha, hb]
    · intro a b ha hb
      rcases ha with ha | ha <;> rcases hb with hb | hb
      · exact h4.1.1.2.2 a b ha hb
      · rw [hb]; exact Or.inl (below a ha).1
      · rw [ha]; exact Or.inr (below b hb).1
      · rw [ha, hb]; exact Or.inl (hrefl x)
    · intro Y hY hne
      refine (em (∃ y, Y y ∧ LUstar R F y)).elim (fun hex => ?_) (fun hn => ?_)
      · obtain ⟨m, ⟨hmY, hmU⟩, hml⟩ :=
          lwo_exists_least R h4.1 (fun w => Y w ∧ LUstar R F w) (fun w h => h.2) hex
        refine ⟨m, hmY, fun y hy hym => ?_⟩
        rcases hY y hy with hyU | hyx
        · exact h4.1.1.2.1 y m hyU hmU hym (hml y ⟨hy, hyU⟩)
        · rw [hyx] at hym; exact ((below m hmU).2 hym).elim
      · obtain ⟨y₀, hy₀⟩ := hne
        have allx : ∀ y, Y y → y = x := fun y hy =>
          (hY y hy).elim (fun h => (hn ⟨y, hy, h⟩).elim) id
        exact ⟨y₀, hy₀, fun y hy _ => (allx y hy).trans (allx y₀ hy₀).symm⟩
    · intro w hw
      rcases hw with hwU | hwx
      · have hwlt := below w hwU
        exact Fext (LP R (LUstar R F) w) _ (fun y => ⟨fun ⟨hy, hyw⟩ => ⟨Or.inl hy, hyw⟩,
          fun ⟨hy, hyw⟩ => ⟨hy.elim id fun e => by
            rw [e] at hyw; exact (hwlt.2 hyw.1).elim, hyw⟩⟩) w (h4.2 w hwU)
      · rw [hwx]
        exact Fext (LUstar R F) _ (fun y => ⟨fun hy => ⟨Or.inl hy, below y hy⟩,
          fun ⟨hy, hyx⟩ => hy.elim id fun e => by
            rw [e] at hyx; exact (hyx.2 hyx.1).elim⟩) x hx
  exact (below x ⟨_, hconf, Or.inr rfl⟩).2 (hrefl x)

end lewin

/-- `transversal-choice-r-implies-zorn-r`: Relational Choice (from Transversal Choice at
`(σt)σt`) chooses a strict upper bound for each chain, and the transversal of coextension
(Transversal Choice at `σt`) makes the choice extensional; Lewin's argument then refutes
the absence of a maximal element. -/
theorem transversal_choice_r_implies_zorn_r {σ : Type} [Ty σ] :
    TransversalChoice (σ → Prop) → TransversalChoice ((σ → Prop) → σ → Prop) → Zorn σ := by
  intro tc tc₂ R ⟨⟨hrefl, htrans⟩, hub⟩
  refine (em (∃ m, ∀ y, R m y → R y m)).elim id fun hnm => ?_
  exfalso
  have hn : ∀ m, ∃ y, R m y ∧ ¬ R y m := fun m =>
    (em (∃ y, R m y ∧ ¬ R y m)).elim id fun h => (hnm ⟨m, fun y hy =>
      (em (R y m)).elim id fun hyn => (h ⟨y, hy, hyn⟩).elim⟩).elim
  obtain ⟨u₀, -⟩ := hub (fun _ => False)
    ⟨fun _ _ _ h => h.elim, fun _ _ h => h.elim, fun _ _ h => h.elim⟩
  have toc : ∀ C D : σ → Prop, (∀ y, C y ↔ D y) → TotalOrderOn R C → TotalOrderOn R D :=
    fun C D he ⟨a, b, c⟩ =>
      ⟨fun x y z hx hy hz => a x y z ((he x).2 hx) ((he y).2 hy) ((he z).2 hz),
       fun x y hx hy => b x y ((he x).2 hx) ((he y).2 hy),
       fun x y hx hy => c x y ((he x).2 hx) ((he y).2 hy)⟩
  have hU : ∀ C : σ → Prop, ∃ x, (TotalOrderOn R C → ∀ y, C y → R y x ∧ ¬ R x y) := fun C =>
    (em (TotalOrderOn R C)).elim
      (fun hc => (hub C hc).elim fun u hu => (hn u).elim fun v hv =>
        ⟨v, fun _ y hy => lt_of_le_lt' htrans y u v (hu y hy) hv⟩)
      (fun hc => ⟨u₀, fun h => (hc h).elim⟩)
  obtain ⟨S, hSf, hSU⟩ := Proofs.transversal_choice_r_implies_relational_choice_r tc₂
    (fun C x => TotalOrderOn R C → ∀ y, C y → R y x ∧ ¬ R x y) hU
  obtain ⟨𝒯, h𝒯⟩ := tc (fun C D => ∀ y, C y ↔ D y)
    ⟨fun _ _ => Iff.rfl, fun _ _ h y => (h y).symm, fun _ _ _ h₁ h₂ y => (h₁ y).trans (h₂ y)⟩
  refine lewin_core (R := R) (F := fun C x => ∃ D, 𝒯 D ∧ (∀ y, C y ↔ D y) ∧ S D x) htrans
    (fun C C' he x ⟨D, hD, hCD, hx⟩ => ⟨D, hD, fun y => ((he y).symm).trans (hCD y), hx⟩)
    ?_ hrefl ?_ ?_
  · intro C x z ⟨D, hD, hCD, hx⟩ ⟨D', hD', hCD', hz⟩
    obtain ⟨E, -, -, huE⟩ := h𝒯 C
    have e : D = D' := (huE D ⟨hCD, hD⟩).symm.trans (huE D' ⟨hCD', hD'⟩)
    rw [← e] at hz
    obtain ⟨w, -, hw⟩ := hSf D
    exact (hw x hx).symm.trans (hw z hz)
  · intro C
    obtain ⟨D, hCD, hD, -⟩ := h𝒯 C
    obtain ⟨x, hx, -⟩ := hSf D
    exact ⟨x, D, hD, hCD, hx⟩
  · intro C x ⟨D, _, hCD, hx⟩ hc y hy
    exact hSU D x hx (toc C D hCD hc) y ((hCD y).1 hy)


/-- `necessary-transversal-choice-r-implies-necessary-well-ordering-r`: Transversal Choice
gives Zorn's Lemma at `σσt`, which gives Well-Ordering at `σ`; necessitated. -/
theorem necessary_transversal_choice_r_implies_necessary_well_ordering_r {σ : Type} [Ty σ] :
    NecTransversalChoice ((σ → σ → Prop) → Prop) →
      NecTransversalChoice (((σ → σ → Prop) → Prop) → (σ → σ → Prop) → Prop) →
      NecWellOrdering σ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% (fun (a : TransversalChoice ((σ → σ → Prop) → Prop))
        (b : TransversalChoice (((σ → σ → Prop) → Prop) → (σ → σ → Prop) → Prop)) =>
      zorn_r_implies_well_ordering_r (transversal_choice_r_implies_zorn_r a b))) h₁) h₂


/-! ### Well-Ordering, Weak Rigid Comprehension and BF give Modal Well-Ordering (7 October 2026)

The write-up's five steps. `J x Y`: `Y` is a weakly rigid property coextensive with the
initial segment `λy. y ≼ x`; `R*` a weakly rigid property coextensive with being such a `Y`
for some `x`. Steps 1–4 hold necessarily of the members of `R*`; Step 5 turns them into a
necessary well-order. -/

section mwo
variable {σ : Type} [Ty σ]

/-- Well-founded induction along a well-order. -/
theorem wo_induction {R : σ → σ → Prop} (hR : WellOrders R) (P : σ → Prop)
    (h : ∀ x, (∀ y, R y x → y ≠ x → P y) → P x) : ∀ x, P x :=
  fun x₀ => (em (∀ x, P x)).elim (fun h' => h' x₀) fun hn => by
    have hex : ∃ x, ¬ P x := (em (∃ x, ¬ P x)).elim id fun h' =>
      (hn fun x => (em (P x)).elim id fun hx => (h' ⟨x, hx⟩).elim).elim
    obtain ⟨m, hm, hmin⟩ := hR.2.2.2 (fun x => ¬ P x) hex
    exact (hm (h m fun y hy hne => (em (P y)).elim id fun hpy => (hne (hmin y hpy hy)).elim)).elim

/-- (F1): weakly rigid properties included at the evaluation point are entailed. -/
theorem wr_le_of_incl (A B : σ → Prop) (hA : WeaklyRigid A) (hB : WeaklyRigid B)
    (h : ∀ y, A y → B y) : A ≤ B :=
  le_of_box_incl (hA.2 B fun y hy => hB.1 y (h y hy))

/-- `J x Y`: `Y` is weakly rigid and coextensive with the segment up to `x`. -/
def MJ (R : σ → σ → Prop) (x : σ) (Y : σ → Prop) : Prop :=
  WeaklyRigid Y ∧ ∀ y, Y y ↔ R y x

/-- The members form a chain under entailment. -/
def MChain (Rs : (σ → Prop) → Prop) : Prop :=
  ∀ M M', Rs M → Rs M' → M ≤ M' ∨ M' ≤ M

/-- A family of members containing `M` has a least instance. -/
def MLeast (Rs : (σ → Prop) → Prop) (M : σ → Prop) : Prop :=
  ∀ Z : (σ → Prop) → Prop, Z M → (∀ W, Z W → Rs W) → ∃ L, Z L ∧ ∀ W, Z W → L ≤ W

/-- Every individual belongs to a member. -/
def MCover (Rs : (σ → Prop) → Prop) : Prop := ∀ t, ∃ M, Rs M ∧ M t

/-- Distinct individuals of `M` are separated by a member. -/
def MGood (Rs : (σ → Prop) → Prop) (M : σ → Prop) : Prop :=
  ∀ a b, M a → M b → a ≠ b → ∃ N, Rs N ∧ (N a ↔ ¬ N b)

variable {R : σ → σ → Prop} (hR : WellOrders R) {Rs : (σ → Prop) → Prop}
  (hRs : WeaklyRigid Rs) (hco : ∀ Y, (∃ x, MJ R x Y) ↔ Rs Y)

include hRs hco in
/-- Weak inextensibility of `R*`, in the form used throughout. -/
theorem rs_wi (ψ : (σ → Prop) → Prop) (h : ∀ A, (∃ x, MJ R x A) → □ (ψ A)) :
    □ (∀ M, Rs M → ψ M) :=
  hRs.2 ψ fun M hM => h M ((hco M).2 hM)

include hRs hco in
theorem rs_box (x : σ) (A : σ → Prop) (hA : MJ R x A) : □ (Rs A) :=
  hRs.1 A ((hco A).1 ⟨x, hA⟩)

include hR in
theorem mj_le (x y : σ) (A C : σ → Prop) (hA : MJ R x A) (hC : MJ R y C) (hxy : R x y) :
    A ≤ C :=
  wr_le_of_incl A C hA.1 hC.1 fun z hz => (hC.2 z).2 (hR.1 z x y ((hA.2 z).1 hz) hxy)

include hR hRs hco in
/-- Step 1: necessarily, the members form a chain. -/
theorem mwo_step1 : □ (MChain Rs) :=
  have inner : ∀ A, (∃ x, MJ R x A) → □ (∀ M', Rs M' → A ≤ M' ∨ M' ≤ A) := fun A ⟨x, hA⟩ =>
    rs_wi hRs hco (fun M' => A ≤ M' ∨ M' ≤ A) fun C ⟨y, hC⟩ =>
      (hR.2.2.1 x y).elim
        (fun h => modal_K _ _ (nec% (fun (h : A ≤ C) => (Or.inl h : A ≤ C ∨ C ≤ A)))
          (box_le_rel A C (mj_le hR x y A C hA hC h)))
        (fun h => modal_K _ _ (nec% (fun (h : C ≤ A) => (Or.inr h : A ≤ C ∨ C ≤ A)))
          (box_le_rel C A (mj_le hR y x C A hC hA h)))
  modal_K _ _ (nec% (fun (h : ∀ M, Rs M → ∀ M', Rs M' → M ≤ M' ∨ M' ≤ M) M M' hM hM' =>
    h M hM M' hM')) (rs_wi hRs hco _ inner)

/-- The step at a world: given the members strictly below `A` have least elements. -/
theorem mwo_step2_world (A : σ → Prop) (hc : MChain Rs) (hA : Rs A)
    (hbelow : ∀ W, Rs W → (W ≤ A ∧ W ≠ A) → MLeast Rs W) : MLeast Rs A := fun Z hZA hZ =>
  (em (∃ W, Z W ∧ (W ≤ A ∧ W ≠ A))).elim
    (fun ⟨W, hW, hWA⟩ => hbelow W (hZ W hW) hWA Z hW hZ)
    (fun hn => ⟨A, hZA, fun W hW => (hc A W hA (hZ W hW)).elim id fun hWA =>
      (em (W = A)).elim (fun e => by rw [e]; exact le_refl_arrow_prop A)
        fun hne => (hn ⟨W, hW, hWA, hne⟩).elim⟩)

include hR hRs hco in
/-- Step 2: necessarily, every family of members has a least instance. -/
theorem mwo_step2 : □ (∀ M, Rs M → MLeast Rs M) := by
  have key : ∀ x A, MJ R x A → □ (MLeast Rs A) := by
    refine wo_induction hR (fun x => ∀ A, MJ R x A → □ (MLeast Rs A)) (fun x ih A hA => ?_)
    have hlow : □ (∀ W, Rs W → (W ≤ A ∧ W ≠ A) → MLeast Rs W) :=
      rs_wi hRs hco (fun W => (W ≤ A ∧ W ≠ A) → MLeast Rs W) fun C ⟨y, hC⟩ =>
        (em (R y x ∧ y ≠ x)).elim
          (fun ⟨h₁, h₂⟩ => modal_K _ _
            (nec% (fun (h : MLeast Rs C) (_ : C ≤ A ∧ C ≠ A) => h)) (ih y h₁ h₂ C hC))
          (fun hn =>
            have hxy : R x y := (hR.2.2.1 x y).elim id fun h =>
              (em (y = x)).elim (fun e => by rw [e]; exact (hR.2.2.1 x x).elim id id)
                fun hne => (hn ⟨h, hne⟩).elim
            modal_K _ _ (nec% (fun (hAC : A ≤ C) (h : C ≤ A ∧ C ≠ A) =>
                ((h.2 (le_antisymm_arrow C A h.1 hAC)).elim : MLeast Rs C)))
              (box_le_rel A C (mj_le hR x y A C hA hC hxy)))
    exact modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (hc : MChain Rs) (hA : Rs A)
          (hb : ∀ W, Rs W → (W ≤ A ∧ W ≠ A) → MLeast Rs W) => mwo_step2_world A hc hA hb))
      (mwo_step1 hR hRs hco)) (rs_box hRs hco x A hA)) hlow
  exact rs_wi hRs hco _ fun A ⟨x, hA⟩ => key x A hA

include hR hRs hco in
/-- Step 3: necessarily, every individual belongs to a member, by BF. -/
theorem mwo_step3 (bf : P.Barcan σ) (wrc : P.WeakRigidComprehension (σ → Prop)) :
    □ (MCover Rs) :=
  bf (fun t => ∃ M, Rs M ∧ M t) fun t => (wrc (fun y => R y t)).elim fun A ⟨hA, hco'⟩ =>
    have hJ : MJ R t A := ⟨hA, fun y => (hco' y).symm⟩
    modal_K _ _ (modal_K _ _
      (nec% (fun (h₁ : Rs A) (h₂ : A t) => (⟨A, h₁, h₂⟩ : ∃ M, Rs M ∧ M t)))
      (rs_box hRs hco t A hJ)) (hA.1 t ((hJ.2 t).2 ((hR.2.2.1 t t).elim id id)))

/-- Step 4 at a world. -/
theorem mwo_step4_world (A B : σ → Prop) (x : σ) (hc : MChain Rs)
    (hi : ∀ t, A t → t = x ∨ B t)
    (hii : ∀ t, B t → ∃ M, Rs M ∧ M t ∧ M ≤ B ∧ MGood Rs M) : MGood Rs A :=
  fun a b ha hb hab => (em (B a)).elim
    (fun hBa => (em (B b)).elim
      (fun hBb => (hii a hBa).elim fun M₁ ⟨h₁, h₁a, _, g₁⟩ => (hii b hBb).elim
        fun M₂ ⟨h₂, h₂b, _, g₂⟩ => (hc M₁ M₂ h₁ h₂).elim
          (fun h => g₂ a b (incl_of_le h a h₁a) h₂b hab)
          (fun h => g₁ a b h₁a (incl_of_le h b h₂b) hab))
      (fun hnBb => (hii a hBa).elim fun M₁ ⟨h₁, h₁a, h₁B, _⟩ =>
        ⟨M₁, h₁, ⟨fun _ hb' => hnBb (incl_of_le h₁B b hb'), fun _ => h₁a⟩⟩))
    (fun hnBa =>
      have hax : a = x := (hi a ha).elim id fun h => (hnBa h).elim
      have hBb : B b := (hi b hb).elim (fun e => (hab (hax.trans e.symm)).elim) id
      (hii b hBb).elim fun M₂ ⟨h₂, h₂b, h₂B, _⟩ =>
        ⟨M₂, h₂, ⟨fun ha' => (hnBa (incl_of_le h₂B a ha')).elim, fun hnb => (hnb h₂b).elim⟩⟩)

include hR hRs hco in
/-- Step 4: necessarily, every member is Good. -/
theorem mwo_step4 (wrc : P.WeakRigidComprehension (σ → Prop)) :
    □ (∀ M, Rs M → MGood Rs M) := by
  have key : ∀ x A, MJ R x A → □ (MGood Rs A) := by
    refine wo_induction hR (fun x => ∀ A, MJ R x A → □ (MGood Rs A)) (fun x ih A hA => ?_)
    obtain ⟨B, hB, hcoB⟩ := wrc (fun y => R y x ∧ y ≠ x)
    -- (i)
    have hi : □ (∀ t, A t → t = x ∨ B t) := hA.1.2 (fun t => t = x ∨ B t) fun t ht =>
      (em (t = x)).elim
        (fun e => modal_K _ _ (nec% (fun (e : t = x) => (Or.inl e : t = x ∨ B t)))
          (necessity_of_identity t x e))
        (fun hne => modal_K _ _ (nec% (fun (h : B t) => (Or.inr h : t = x ∨ B t)))
          (hB.1 t ((hcoB t).1 ⟨(hA.2 t).1 ht, hne⟩)))
    -- (ii)
    have hii : □ (∀ t, B t → ∃ M, Rs M ∧ M t ∧ M ≤ B ∧ MGood Rs M) :=
      hB.2 (fun t => ∃ M, Rs M ∧ M t ∧ M ≤ B ∧ MGood Rs M) fun t ht =>
        have htx : R t x ∧ t ≠ x := (hcoB t).2 ht
        (wrc (fun y => R y t)).elim fun C ⟨hC, hcoC⟩ =>
        have hJ : MJ R t C := ⟨hC, fun y => (hcoC y).symm⟩
        have hCB : C ≤ B := wr_le_of_incl C B hC hB fun y hy =>
          have hyt : R y t := (hJ.2 y).1 hy
          (hcoB y).1 ⟨hR.1 y t x hyt htx.1, fun e => htx.2
            (hR.2.1 t x htx.1 (by rw [← e]; exact hyt))⟩
        modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
          (nec% (fun (h₁ : Rs C) (h₂ : C t) (h₃ : C ≤ B) (h₄ : MGood Rs C) =>
            (⟨C, h₁, h₂, h₃, h₄⟩ : ∃ M, Rs M ∧ M t ∧ M ≤ B ∧ MGood Rs M)))
          (rs_box hRs hco t C hJ)) (hC.1 t ((hJ.2 t).2 ((hR.2.2.1 t t).elim id id))))
          (box_le_rel C B hCB)) (ih t htx.1 htx.2 C hJ)
    exact modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (hc : MChain Rs) (hi : ∀ t, A t → t = x ∨ B t)
          (hii : ∀ t, B t → ∃ M, Rs M ∧ M t ∧ M ≤ B ∧ MGood Rs M) =>
        mwo_step4_world A B x hc hi hii))
      (mwo_step1 hR hRs hco)) hi) hii
  exact rs_wi hRs hco _ fun A ⟨x, hA⟩ => key x A hA

end mwo

/-- Step 5: at any world where Steps 1–4 hold, `λx y. ∀M. R*M ∧ My → Mx` is a well-order. -/
theorem mwo_step5 {σ : Type} [Ty σ] (Rs : (σ → Prop) → Prop) (hc : MChain Rs)
    (hl : ∀ M, Rs M → MLeast Rs M) (hcov : MCover Rs) (hg : ∀ M, Rs M → MGood Rs M) :
    WellOrders (fun x y => ∀ M, Rs M → M y → M x) := by
  have anti : ∀ x y, (∀ M, Rs M → M y → M x) → (∀ M, Rs M → M x → M y) → x = y :=
    fun x y hxy hyx => (em (x = y)).elim id fun hne => by
      obtain ⟨Mx, hMx, hxM⟩ := hcov x
      obtain ⟨My, hMy, hyM⟩ := hcov y
      have both : ∃ L, Rs L ∧ L x ∧ L y := (hc Mx My hMx hMy).elim
        (fun h => ⟨My, hMy, incl_of_le h x hxM, hyM⟩)
        (fun h => ⟨Mx, hMx, hxM, incl_of_le h y hyM⟩)
      obtain ⟨L, hL, hLx, hLy⟩ := both
      obtain ⟨N, hN, hsep⟩ := hg L hL x y hLx hLy hne
      exact (em (N x)).elim (fun h => (hsep.1 h (hyx N hN h)).elim)
        fun h => (h (hxy N hN ((em (N y)).elim id fun h' => (h (hsep.2 h')).elim))).elim
  refine ⟨fun x y z h₁ h₂ M hM hz => h₁ M hM (h₂ M hM hz), anti, fun x y => ?_, fun X hX => ?_⟩
  · refine (em (∀ M, Rs M → M y → M x)).elim Or.inl fun hn => Or.inr fun N hN hNx => ?_
    have hex : ∃ M, Rs M ∧ M y ∧ ¬ M x := (em (∃ M, Rs M ∧ M y ∧ ¬ M x)).elim id fun h =>
      (hn fun M hM hMy => (em (M x)).elim id fun hMx => (h ⟨M, hM, hMy, hMx⟩).elim).elim
    obtain ⟨M, hM, hMy, hMx⟩ := hex
    exact (hc N M hN hM).elim (fun h => (hMx (incl_of_le h x hNx)).elim)
      fun h => incl_of_le h y hMy
  · obtain ⟨y₀, hy₀⟩ := hX
    obtain ⟨M₀, hM₀, hy₀M⟩ := hcov y₀
    obtain ⟨L, ⟨hL, y₁, hXy₁, hLy₁⟩, hleast⟩ :=
      hl M₀ hM₀ (fun M => Rs M ∧ ∃ y, X y ∧ M y) ⟨hM₀, y₀, hy₀, hy₀M⟩ (fun W h => h.1)
    have hy₁ : ∀ y, X y → ∀ M, Rs M → M y → M y₁ := fun y hy M hM hMy =>
      incl_of_le (hleast M ⟨hM, y, hy, hMy⟩) y₁ hLy₁
    exact ⟨y₁, hXy₁, fun y hy hyy₁ => anti y y₁ hyy₁ (hy₁ y hy)⟩

/-- `well-ordering-weak-rigid-comprehension-and-bf-imply-modal-well-ordering`. -/
theorem well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering {σ : Type}
    [Ty σ] : WellOrdering σ → WeakRigidComprehension (σ → Prop) →
      WeakRigidComprehension ((σ → Prop) → Prop) → Barcan σ → ModalWellOrdering σ :=
  fun ⟨R, hR⟩ wrc wrc₂ bf => (wrc₂ (fun Y => ∃ x, MJ R x Y)).elim fun Rs ⟨hRs, hco⟩ =>
    ⟨fun x y => ∀ M, Rs M → M y → M x, modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (mwo_step5 (σ := σ) Rs))
      (mwo_step1 hR hRs hco)) (mwo_step2 hR hRs hco)) (mwo_step3 hR hRs hco bf wrc))
      (mwo_step4 hR hRs hco wrc)⟩


/-! ### Modalized Relational Choice (11 October 2026) -/

/-- `modalized-relational-choice-implies-intensional-choice`: from one input of type `t`,
ignored, the choice at `⊤`. -/
theorem modalized_relational_choice_implies_intensional_choice {τ : Type} [Ty τ] :
    ModalizedRelationalChoice Prop τ → IntensionalChoice τ := fun mrc F hF =>
  (mrc (fun _ y => F y) (modal_K _ _ (nec% (fun (h : ∃ y, F y) (_ : Prop) => h)) hF)).elim
    fun S ⟨hS, hle⟩ =>
  ⟨S True, le_of_box_incl (modal_K _ _
      (nec% (fun (h : ∀ (p : Prop) (y : τ), S p y → F y) (y : τ) (hy : S True y) => h True y hy))
      ((le_iff _ _).1 hle)),
   modal_K _ _ (nec% (fun (h : Functional S) => (h True).elim fun y ⟨hy, hu⟩ =>
      (⟨y, hy, fun z hz => (hu z hz).symm⟩ : ∃ x, S True x ∧ ∀ z, S True z → z = x))) hS⟩

/-- `modalized-relational-choice-implies-relational-choice`: a serial `U` is coextensive with
the necessarily serial `λxy. Serial(U) → Uxy`. -/
theorem modalized_relational_choice_implies_relational_choice {σ τ : Type} [Ty σ] [Ty τ] :
    ModalizedRelationalChoice σ τ → RelationalChoice σ τ := fun mrc U hU =>
  (em (∃ _ : σ, True)).elim
    (fun ⟨x₀, _⟩ => (hU x₀).elim fun y₀ _ =>
      (mrc (fun x y => Serial U → U x y)
        (nec% (fun (x : σ) => ((em (Serial U)).elim
          (fun h => (h x).elim fun y hy => ⟨y, fun _ => hy⟩)
          (fun h => ⟨y₀, fun hs => (h hs).elim⟩) : ∃ y, Serial U → U x y)))).elim
        fun S ⟨hS, hle⟩ => ⟨S, box_elim hS, fun x y h => incl_of_le hle x y h hU⟩)
    (fun hσ => ⟨U, fun x => (hσ ⟨x, trivial⟩).elim, fun _ _ h => h⟩)

/-- The relation applying the unique chosen functional relation is functional. -/
theorem functional_of_unique {σ τ : Type} [Ty σ] [Ty τ] (R : σ → τ → Prop)
    (G : (σ → τ → Prop) → Prop) (hG : ∀ Z, G Z → Functional Z ∧ ∀ x y, Z x y → R x y)
    (hu : ∃ Z, G Z ∧ ∀ Z', G Z' → Z' = Z) : Functional (fun x y => ∃ Z, G Z ∧ Z x y) :=
  hu.elim fun Z₀ ⟨h₀, hu₀⟩ => fun x => ((hG Z₀ h₀).1 x).elim fun y ⟨hy, hyu⟩ =>
    ⟨y, ⟨Z₀, h₀, hy⟩, fun z ⟨Z, hZ, hz⟩ => hyu z (by rw [← hu₀ Z hZ]; exact hz)⟩

/-- `necessary-relational-choice-and-intensional-choice-imply-modalized-relational-choice`
(Cian Dorr): □Relational Choice makes the functional subrelations of a necessarily serial `R`
necessarily instantiated, Intensional Choice picks a necessarily unique one, and the relation
that applies it is necessarily functional and entails `R`. -/
theorem necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice
    {σ τ : Type} [Ty σ] [Ty τ] :
    NecRelationalChoice σ τ → IntensionalChoice (σ → τ → Prop) →
      ModalizedRelationalChoice σ τ := fun nrc ic R hR =>
  (ic (fun Z => Functional Z ∧ ∀ x y, Z x y → R x y) (modal_K _ _ (modal_K _ _
      (nec% (fun (rc : RelationalChoice σ τ) (hs : Serial R) => rc R hs)) nrc) hR)).elim
    fun G ⟨hGF, hu⟩ =>
  ⟨fun x y => ∃ Z, G Z ∧ Z x y,
   modal_K _ _ (modal_K _ _
     (nec% (fun (hG : ∀ Z, G Z → Functional Z ∧ ∀ x y, Z x y → R x y)
         (hu : ∃ Z, G Z ∧ ∀ Z', G Z' → Z' = Z) => functional_of_unique R G hG hu))
     ((le_iff _ _).1 hGF)) hu,
   le_of_box_incl (modal_K _ _
     (nec% (fun (hG : ∀ Z, G Z → Functional Z ∧ ∀ x y, Z x y → R x y) (x : σ) (y : τ)
         (h : ∃ Z, G Z ∧ Z x y) => h.elim fun Z ⟨hZ, hxy⟩ => (hG Z hZ).2 x y hxy))
     ((le_iff _ _).1 hGF))⟩

/-- `necessary-modalized-relational-choice-r-implies-modalized-relational-choice-r`: `T`. -/
theorem necessary_modalized_relational_choice_r_implies_modalized_relational_choice_r
    {σ τ : Type} [Ty σ] [Ty τ] :
    NecModalizedRelationalChoice σ τ → ModalizedRelationalChoice σ τ := box_elim

/-- `necessary-modalized-relational-choice-implies-necessary-intensional-choice`. -/
theorem necessary_modalized_relational_choice_implies_necessary_intensional_choice
    {τ : Type} [Ty τ] : NecModalizedRelationalChoice Prop τ → NecIntensionalChoice τ :=
  modal_K _ _ (nec% (modalized_relational_choice_implies_intensional_choice (τ := τ)))

/-- `necessary-modalized-relational-choice-implies-necessary-relational-choice`. -/
theorem necessary_modalized_relational_choice_implies_necessary_relational_choice
    {σ τ : Type} [Ty σ] [Ty τ] :
    NecModalizedRelationalChoice σ τ → NecRelationalChoice σ τ :=
  modal_K _ _ (nec% (modalized_relational_choice_implies_relational_choice (σ := σ) (τ := τ)))

/-- `necessary-relational-choice-and-necessary-intensional-choice-imply-necessary-modalized-relational-choice`:
`4` boxes □Relational Choice again. -/
theorem necessary_relational_choice_and_necessary_intensional_choice_imply_necessary_modalized_relational_choice
    {σ τ : Type} [Ty σ] [Ty τ] :
    NecRelationalChoice σ τ → NecIntensionalChoice (σ → τ → Prop) →
      NecModalizedRelationalChoice σ τ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% (necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice
      (σ := σ) (τ := τ))) (modal_four _ h₁)) h₂

/-- `modal-well-ordering-implies-modalized-relational-choice`: the least value under a necessary
well-order of the outputs. -/
theorem modal_well_ordering_implies_modalized_relational_choice {σ τ : Type} [Ty σ] [Ty τ] :
    ModalWellOrdering τ → ModalizedRelationalChoice σ τ := fun ⟨W, hW⟩ R hR =>
  ⟨fun x y => R x y ∧ ∀ z, R x z → W y z,
   modal_K _ _ (modal_K _ _
     (nec% (fun (hw : WellOrders W) (hs : Serial R) (x : σ) =>
       (unique_least W (R x) hw (hs x)).elim fun y ⟨hy, hu⟩ =>
         (⟨y, hy, fun z hz => (hu z hz).symm⟩ :
           ∃ y, (R x y ∧ ∀ z, R x z → W y z) ∧
             ∀ z, (R x z ∧ ∀ z', R x z' → W z z') → y = z)))
     hW) hR,
   le_of_box_incl (nec% (fun (x : σ) (y : τ) (h : R x y ∧ ∀ z, R x z → W y z) => h.1))⟩

/-- `modal-well-ordering-implies-necessary-modalized-relational-choice`: Modal Well-Ordering is
necessary, by `4`. -/
theorem modal_well_ordering_implies_necessary_modalized_relational_choice {σ τ : Type} [Ty σ]
    [Ty τ] : ModalWellOrdering τ → NecModalizedRelationalChoice σ τ := fun h =>
  modal_K _ _ (nec% (modal_well_ordering_implies_modalized_relational_choice (σ := σ) (τ := τ)))
    (box_modal_well_ordering h)


/-! ### Strong Atomicity, Weak Rigid Comprehension and Relational Choice (20 October 2026) -/

/-- Distinct atoms of type `t` are incompatible: their meet lies below each, so it is that
atom or `⊥`, and it is not both atoms. -/
theorem box_not_and_of_atoms (w w' : Prop) (hw : Atom w) (hw' : Atom w') (hne : w ≠ w') :
    □ (¬ (w ∧ w')) :=
  (atom_le_or_le_neg w w' hw).elim
    (fun h₁ => (atom_le_or_le_neg w' w hw').elim
      (fun h₂ => (hne (le_antisymm_prop w w' h₁ h₂)).elim)
      (fun h₂ => modal_K _ _ (nec% (fun (h : w' → ¬ w) (hc : w ∧ w') => h hc.2 hc.1))
        ((le_iff_prop _ _).1 h₂)))
    (fun h₁ => modal_K _ _ (nec% (fun (h : w → ¬ w') (hc : w ∧ w') => h hc.1 hc.2))
      ((le_iff_prop _ _).1 h₁))

/-- A property deciding every property has at most one instance: given an instance `y`, it
is below `λu. u = y` or below its negation, and the second is refuted by `y`. -/
theorem unique_of_decides {σ : Type} [Ty σ] (X : σ → Prop)
    (h : ∀ Y : σ → Prop, X ≤ Y ∨ X ≤ ¬ Y) : ∀ y z, X y → X z → z = y := fun y z hy hz =>
  (h (fun u => u = y)).elim
    (fun hle => incl_of_le hle z hz)
    (fun hle => (incl_of_le hle y hy rfl).elim)

/-- The pair lemma: weak inextensibility carries a relation that holds necessarily between
any two actual instances to any two instances at any world. Fix an actual `b`: weak
inextensibility for `λa. Z a b` gives `R ≤ λa. Z a b`, necessary by `4`; then weak
inextensibility for `λb. □∀a. R a → Z a b`, and `T`. -/
theorem box_pairs_of_weaklyInextensible {α : Type} [Ty α] (R : α → Prop)
    (hR : WeaklyInextensible R) (Z : α → α → Prop) (h : ∀ a b, R a → R b → □ (Z a b)) :
    □ (∀ a b, R a → R b → Z a b) :=
  have hb : ∀ b, R b → □ (□ (∀ a, R a → Z a b)) := fun b hRb =>
    modal_four _ (hR (fun a => Z a b) fun a hRa => h a b hRa hRb)
  modal_K _ _
    (nec% (fun (H : ∀ b, R b → □ (∀ a, R a → Z a b)) (a b : α) (ha : R a) (hb : R b) =>
      box_elim (H b hb) a ha))
    (hR (fun b => □ (∀ a, R a → Z a b)) hb)

/-- `strong-atomicity-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice`
(Cian Dorr's construction). For each atom `w` of type `t`, Relational Choice picks a strong
atom `X_w` of type `σt` below `λy. w ∧ Fy`; Weak Rigid Comprehension gives a weakly rigid `R`
coextensive with the property of being some `X_w`; and `G := λy. ∃X. RX ∧ Xy`. Weak
inextensibility carries to every world that each instance of `R` is below `F` and has at most
one instance, and, by the pair lemma, that two instances of `R` are identical or not both
instantiated, since distinct atoms are incompatible. -/
theorem strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice
    {σ : Type} [Ty σ] :
    StrongAtomicity Prop → StrongAtomicity (σ → Prop) →
      WeakRigidComprehension ((σ → Prop) → Prop) → RelationalChoice Prop (σ → Prop) →
        IntensionalChoice σ := by
  intro sl₀ sl₁ wrc rc F hF
  -- Atomicity at `t`, as in `strong-atomicity-t-implies-atomicity-t`.
  have at₀ : Atomicity Prop := fun x => (em (x ≤ ¬ x)).elim Or.inl fun hx =>
    (sl₀ x fun e => hx (le_neg_of_eq_false x e)).elim fun w hw =>
      Or.inr ⟨w, atom_of_decides w ⟨hw.1.1, box_elim hw.1.2⟩, hw.2⟩
  -- Each atom `w` is related to the strong atoms of type `σt` below `λy. w ∧ Fy`.
  have hser : Serial (λ (w : Prop) (X : σ → Prop) ↦
      Atom w → SAtom X ∧ X ≤ (λ y ↦ w ∧ F y)) := by
    intro w
    em_cases hw : Atom w
    · have hne : (λ y ↦ w ∧ F y) ≠ Rel.bot (σ → Prop) := fun e => by
        have h₁ : □ (∀ y, w ∧ F y → False) := by
          rw [show (∀ y, w ∧ F y → False) = (∀ y : σ, Rel.bot (σ → Prop) y → False) from
            congrArg (λ (P : σ → Prop) ↦ ∀ y, P y → False) e]
          exact nec% (fun (y : σ) (h : False) => h)
        have h₂ : □ (¬ w) := modal_K _ _ (modal_K _ _
          (nec% (fun (h : ∀ y, w ∧ F y → False) (hx : ∃ x, F x) (hw : w) =>
            hx.elim fun x hx => h x ⟨hw, hx⟩)) h₁) hF
        exact atom_ne_false w hw (eq_false_of_le_neg w ((le_iff_prop _ _).2
          (modal_K _ _ (nec% (fun (h : ¬ w) (hw : w) => (h hw).elim)) h₂)))
      obtain ⟨X, hX, hle⟩ := sl₁ _ hne
      exact ⟨X, fun _ => ⟨hX, hle⟩⟩
    · obtain ⟨X, -⟩ := existence_rel (τ := σ → Prop)
      exact ⟨X, fun h => (hw h).elim⟩
  obtain ⟨V, hVf, hVU⟩ := rc _ hser
  obtain ⟨R, ⟨hRp, hRi⟩, hco⟩ := wrc (λ X ↦ ∃ w, Atom w ∧ V w X)
  have hco' : ∀ X, R X ↔ ∃ w, Atom w ∧ V w X := fun X => (hco X).symm
  -- What an actual instance of `R` is: a strong atom below `λy. w ∧ Fy` for an atom `w`.
  have hinst : ∀ X, R X → ∃ w, Atom w ∧ V w X ∧ SAtom X ∧ □ (∀ y, X y → w ∧ F y) :=
    fun X hX => ((hco' X).1 hX).elim fun w ⟨hw, hV⟩ =>
      ⟨w, hw, hV, (hVU w X hV hw).1, (le_iff _ _).1 (hVU w X hV hw).2⟩
  -- (a) Necessarily, each instance of `R` is below `F` and has at most one instance.
  have ha : □ (∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) :=
    hRi (λ X ↦ (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) fun X hX =>
      (hinst X hX).elim fun w ⟨_, _, hS, hle⟩ =>
        modal_K _ _ (modal_K _ _
          (nec% (fun (h₁ : ∀ y, X y → w ∧ F y) (h₂ : ∀ Y : σ → Prop, X ≤ Y ∨ X ≤ ¬ Y) =>
            (⟨fun y hy => (h₁ y hy).2, unique_of_decides X h₂⟩ :
              (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)))) hle) hS.2
  -- (b) Necessarily, two instances of `R` are identical or not both instantiated.
  have hb : □ (∀ a b, R a → R b → a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z)) :=
    box_pairs_of_weaklyInextensible R hRi _ fun a b ha hb =>
      (hinst a ha).elim fun w ⟨hw, hVa, _, hla⟩ => (hinst b hb).elim fun w' ⟨hw', hVb, _, hlb⟩ =>
        (em (w = w')).elim
          (fun e => by
            subst e
            have hab : a = b := (hVf w).elim fun c ⟨_, hu⟩ => (hu a hVa).symm.trans (hu b hVb)
            exact modal_K _ _
              (nec% (fun (h : a = b) => (Or.inl h : a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))))
              (necessity_of_identity a b hab))
          (fun hne => modal_K _ _ (modal_K _ _ (modal_K _ _
            (nec% (fun (h₀ : ¬ (w ∧ w')) (h₁ : ∀ y, a y → w ∧ F y) (h₂ : ∀ y, b y → w' ∧ F y) =>
              (Or.inr (fun ⟨⟨y, hy⟩, ⟨z, hz⟩⟩ => h₀ ⟨(h₁ y hy).1, (h₂ z hz).1⟩) :
                a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))))
            (box_not_and_of_atoms w w' hw hw' hne)) hla) hlb)
  refine ⟨λ y ↦ ∃ X, R X ∧ X y, ?_, ?_⟩
  · -- `G ≤ F`, from (a).
    exact le_of_box_incl (modal_K _ _
      (nec% (fun (H : ∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) (y : σ)
          (hy : ∃ X, R X ∧ X y) => hy.elim fun X ⟨hX, hXy⟩ => (H X hX).1 y hXy)) ha)
  · -- Every atom entails that `G` is instantiated, so it necessarily is.
    have hex : □ (∃ y, ∃ X, R X ∧ X y) := (neg_le_iff_box _).1
      (Atomicity.to_dual at₀ _ fun w hw => (atom_le_or_le_neg w _ hw).elim id fun hn => by
        obtain ⟨X, hV, -⟩ := hVf w
        have hRX : R X := (hco' X).2 ⟨w, hw, hV⟩
        have hS : SAtom X := (hVU w X hV hw).1
        have hle : □ (∀ y, X y → w ∧ F y) := (le_iff _ _).1 (hVU w X hV hw).2
        have hbot : □ (X ⊆ Rel.bot (σ → Prop)) := modal_K _ _ (modal_K _ _ (modal_K _ _
          (nec% (fun (h₁ : w → ¬ ∃ y, ∃ X, R X ∧ X y) (h₂ : R X) (h₃ : ∀ y, X y → w ∧ F y) =>
              (fun (y : σ) (hy : X y) => ((h₁ (h₃ y hy).1 ⟨y, X, h₂, hy⟩).elim :
                Rel.bot (σ → Prop) y) : X ⊆ Rel.bot (σ → Prop))))
          ((le_iff_prop _ _).1 hn)) (hRp X hRX)) hle
        exact (hS.1 (le_antisymm_arrow X _ (le_of_box_incl hbot) (bot_le_arrow X))).elim)
    -- Necessarily at most one instance: (b), then (a).
    have huniq : □ (∀ y z, (∃ X, R X ∧ X y) → (∃ X, R X ∧ X z) → z = y) :=
      modal_K _ _ (modal_K _ _
        (nec% (fun (H₁ : ∀ a b, R a → R b → a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))
            (H₂ : ∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) (y z : σ)
            (hy : ∃ X, R X ∧ X y) (hz : ∃ X, R X ∧ X z) =>
          hy.elim fun a ⟨ha, hay⟩ => hz.elim fun b ⟨hb, hbz⟩ =>
            (H₁ a b ha hb).elim (fun e => (H₂ a ha).2 y z hay ((congrFun e z).mpr hbz))
              (fun hn => (hn ⟨⟨y, hay⟩, ⟨z, hbz⟩⟩).elim))) hb) ha
    exact modal_K _ _ (modal_K _ _
      (nec% (fun (h₁ : ∃ y, ∃ X, R X ∧ X y)
          (h₂ : ∀ y z, (∃ X, R X ∧ X y) → (∃ X, R X ∧ X z) → z = y) =>
        (h₁.elim fun x hx => ⟨x, hx, fun y hy => h₂ x y hx hy⟩ :
          ∃ x, (∃ X, R X ∧ X x) ∧ ∀ y, (∃ X, R X ∧ X y) → y = x))) hex) huniq

end Classicism.Proofs
