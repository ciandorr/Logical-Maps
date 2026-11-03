import Classicism.Tools.Schema
import Classicism.Certified.Schemas
import Classicism.Certified.Entailed
import Classicism.Results.Records

/-!
# Restricted forms and list forms

A principle with a Ty-parameter has a restricted form, one instance per type, and a list
form, one instance per finite list of types (`VECTORIZATION-PLAN.md`; the README's
*Names*). The list form entails the restricted form at once, a one-element list being the
type itself (`P.listSchema_entails_schema`, generated). This file proves the converse,
`P.schema_entails_listSchema`, for twenty-one of the twenty-five principles with a list form (D8):

- by **induction on the list**, for BF, Tractarianism, ND, Existence, Functionality and
  the two Choices, and their boxed forms. The empty list is a theorem of `C`, derived from
  a shallow lemma whose statement *is* the empty-list instance (for Relational Choice,
  from the instance with one input of type `t`); a one-element list is the restricted
  instance; and the step from a list `τs` to `σ :: τs` is the **two-element form** of the
  principle, `P.XCons τ σ` (the tail's type first, as the one vectorized), proved in the
  shallow layer from restricted instances, certified, and carried to every list by its
  list rule (`#classicism_certify`, the vectorization theorem). The two-element form at
  `τs` *is* the list form at `σ :: τs`: by computation, or, where a relational codomain
  `ρ` passes through the two vectorizations as its translations, up to those, which are
  `ρ` by its closedness (`classicism_vec_eq`). Where the principle mentions identity, the
  identity of two blocks of one element is the identity itself, not a conjunction, so the
  step starts from a nonempty tail;
- by **coding a tuple as an object**, for Plenitude, its boxed form and Actual Profile: a
  unary theorem from the principle at the code type `(σ → Prop) → Prop`, vectorized in
  `σ`, has a restricted instance at a closed type for its premise and the list form for
  its conclusion;
- for the theorems of `C` (Modalized Functionality, Converse Barcan, Necessity of
  Identity, Broad Necessitism), by their list entailments from the empty set, which the
  audit generates;
- for Modalized Plenitude, also a theorem of `C`, by induction on the list as above, but
  of theorems of `C`: its step uses the tail's instance under the box, which only a theorem
  of `C` can supply (`C.Theorem.nec`). Its record is at output `σ' → t` (the operation it
  builds is a meet there), so its list entailment vectorizes the output, not the input.

Transversal, Transversal Choice and their boxed forms have list forms but not yet this
direction.

And a principle over relational types holds at every one once it holds at `σs ⇒* t` for
every list `σs` (`schema_subset_args`): the form in which a unary result at `σ → t`,
vectorized, is a result at every arity.

The shallow parts are in the paper's vocabulary and certified like every record; the
two-element forms are stepping stones, not principles of the map.
-/

namespace Classicism

/-! ## 1. The two-element forms -/

namespace P

/-- BF over `x : σ, y : τ`: `∀X. (∀x y. □X x y) → □∀x y. X x y`. -/
def BarcanCons (τ σ : Type) [Ty τ] [Ty σ] : Prop :=
  ∀ X : σ → τ → Prop, (∀ x y, □ (X x y)) → □ (∀ x y, X x y)
/-- `□`BF over `x : σ, y : τ`. -/
def NecBarcanCons (τ σ : Type) [Ty τ] [Ty σ] : Prop := □ (BarcanCons τ σ)

/-- Tractarianism over `x : σ, y : τ`: `∀pX. (∀x y. p ≤ X x y) → p ≤ ∀x y. X x y`. -/
def TractarianismCons (τ σ : Type) [Ty τ] [Ty σ] : Prop :=
  ∀ (p : Prop) (X : σ → τ → Prop), (∀ x y, p ≤ X x y) → p ≤ (∀ x y, X x y)
/-- `□`Tractarianism over `x : σ, y : τ`. -/
def NecTractarianismCons (τ σ : Type) [Ty τ] [Ty σ] : Prop := □ (TractarianismCons τ σ)

/-- ND over `x : σ, x' : τ`: `∀x x' y y'. ¬(x = y ∧ x' = y') → □¬(x = y ∧ x' = y')`. -/
def NecessityOfDistinctnessCons (τ σ : Type) [Ty τ] [Ty σ] : Prop :=
  ∀ (x : σ) (x' : τ) (y : σ) (y' : τ), ¬ (x = y ∧ x' = y') → □ ¬ (x = y ∧ x' = y')
/-- `□`ND over `x : σ, x' : τ`. -/
def NecNecessityOfDistinctnessCons (τ σ : Type) [Ty τ] [Ty σ] : Prop :=
  □ (NecessityOfDistinctnessCons τ σ)

/-- Existence over `x : σ, x' : τ`: `∃x x'. x = x ∧ x' = x'`. -/
def ExistenceCons (τ σ : Type) [Ty τ] [Ty σ] : Prop := ∃ (x : σ) (x' : τ), x = x ∧ x' = x'

/-- Functionality over `z : σ, z' : τ`, into `ρ`: `(∀z z'. X z z' = Y z z') → X = Y`. -/
def FunctionalityCons (τ σ ρ : Type) [Ty τ] [Ty σ] [Rel ρ] : Prop :=
  ∀ X Y : σ → τ → ρ, (∀ z z', X z z' = Y z z') → X = Y
/-- `□`Functionality over `z : σ, z' : τ`. -/
def NecFunctionalityCons (τ σ ρ : Type) [Ty τ] [Ty σ] [Rel ρ] : Prop :=
  □ (FunctionalityCons τ σ ρ)

/-- Functional Choice from `x : σ, x' : τ`, into `ρ`. -/
def FunctionalChoiceCons (τ σ ρ : Type) [Ty τ] [Ty σ] [Rel ρ] : Prop :=
  ∀ U : σ → τ → ρ → Prop, (∀ x x', ∃ y, U x x' y) → ∃ X : σ → τ → ρ, ∀ x x', U x x' (X x x')
/-- `□`Functional Choice from `x : σ, x' : τ`. -/
def NecFunctionalChoiceCons (τ σ ρ : Type) [Ty τ] [Ty σ] [Rel ρ] : Prop :=
  □ (FunctionalChoiceCons τ σ ρ)

/-- Relational Choice from `x : σ, x' : τ'`, into `τ`. -/
def RelationalChoiceCons (τ' σ τ : Type) [Ty τ'] [Ty σ] [Ty τ] : Prop :=
  ∀ U : σ → τ' → τ → Prop, (∀ x x', ∃ y, U x x' y) →
    ∃ S : σ → τ' → τ → Prop, (∀ x x', ∃ y, S x x' y ∧ ∀ z, S x x' z → y = z) ∧
      ∀ x x' y, S x x' y → U x x' y
/-- `□`Relational Choice from `x : σ, x' : τ'`. -/
def NecRelationalChoiceCons (τ' σ τ : Type) [Ty τ'] [Ty σ] [Ty τ] : Prop :=
  □ (RelationalChoiceCons τ' σ τ)

/-- Relational Choice from no inputs, into `τ`: every instantiated property has a
subproperty with exactly one instance. -/
def RelationalChoiceNil (τ : Type) [Ty τ] : Prop :=
  ∀ U : τ → Prop, (∃ y, U y) → ∃ S : τ → Prop, (∃ y, S y ∧ ∀ z, S z → y = z) ∧ ∀ y, S y → U y
/-- `□`Relational Choice from no inputs. -/
def NecRelationalChoiceNil (τ : Type) [Ty τ] : Prop := □ (RelationalChoiceNil τ)

/-- Modalized Plenitude over `x : σ, x' : τ`, into `ρ`. -/
def ModalizedPlenitudeCons (τ σ ρ : Type) [Ty τ] [Ty σ] [Rel ρ] : Prop :=
  ∀ U : σ → τ → ρ → Prop, □ (∀ x x', ∃ y, □ (U x x' y ∧ ∀ z, U x x' z → y = z)) →
    ∃ X : σ → τ → ρ, □ (∀ x x' y, U x x' y ↔ y = X x x')
/-- `□`Modalized Plenitude: a stepping stone, Modalized Plenitude being a theorem of `C`. -/
def NecModalizedPlenitude (σ ρ : Type) [Ty σ] [Rel ρ] : Prop := □ (ModalizedPlenitude σ ρ)

end P

/-! ## 2. The steps and the empty lists, in the shallow layer -/

namespace Lists
open Classicism.P

/-- BF over two variables, from BF at each: BF at `τ` inside, at `σ` outside. -/
theorem barcan_cons {τ σ : Type} [Ty τ] [Ty σ] : Barcan τ → Barcan σ → BarcanCons τ σ :=
  fun bfτ bfσ X h => bfσ (λ x ↦ ∀ y, X x y) (fun x => bfτ (X x) (h x))

/-- `□`BF over two variables, by `K`. -/
theorem nec_barcan_cons {τ σ : Type} [Ty τ] [Ty σ] :
    NecBarcan τ → NecBarcan σ → NecBarcanCons τ σ :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _ (nec% (barcan_cons (τ := τ) (σ := σ))) h₁) h₂

/-- BF over no variables. -/
theorem barcan_nil : ∀ X : Prop, □ X → □ X := fun _ h => h
/-- `□`BF over no variables. -/
theorem nec_barcan_nil : □ (∀ X : Prop, □ X → □ X) := nec% barcan_nil

/-- Tractarianism over two variables, from Tractarianism at each. -/
theorem tractarianism_cons {τ σ : Type} [Ty τ] [Ty σ] :
    Tractarianism τ → Tractarianism σ → TractarianismCons τ σ :=
  fun trτ trσ p X h => trσ p (λ x ↦ ∀ y, X x y) (fun x => trτ p (X x) (h x))
/-- `□`Tractarianism over two variables. -/
theorem nec_tractarianism_cons {τ σ : Type} [Ty τ] [Ty σ] :
    NecTractarianism τ → NecTractarianism σ → NecTractarianismCons τ σ :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _ (nec% (tractarianism_cons (τ := τ) (σ := σ))) h₁) h₂
/-- Tractarianism over no variables. -/
theorem tractarianism_nil : ∀ (p X : Prop), p ≤ X → p ≤ X := fun _ _ h => h
/-- `□`Tractarianism over no variables. -/
theorem nec_tractarianism_nil : □ (∀ (p X : Prop), p ≤ X → p ≤ X) := nec% tractarianism_nil

/-- `¬A → ¬(A ∧ B)`. -/
theorem not_and_of_not_left' (A B : Prop) : ¬ A → ¬ (A ∧ B) := fun h hab => h hab.1
/-- `¬B → ¬(A ∧ B)`. -/
theorem not_and_of_not_right' (A B : Prop) : ¬ B → ¬ (A ∧ B) := fun h hab => h hab.2

/-- ND over two variables, from ND at each: if the first coordinates differ, `ND` at `σ`
makes that necessary; if not, the second differ, and `ND` at `τ` does. -/
theorem nd_cons {τ σ : Type} [Ty τ] [Ty σ] :
    NecessityOfDistinctness τ → NecessityOfDistinctness σ → NecessityOfDistinctnessCons τ σ :=
  fun ndτ ndσ x x' y y' h =>
    (em (x = y)).elim
      (fun hxy => modal_K _ _ (nec% (not_and_of_not_right' (x = y) (x' = y')))
        (ndτ x' y' (fun h' => h ⟨hxy, h'⟩)))
      (fun hxy => modal_K _ _ (nec% (not_and_of_not_left' (x = y) (x' = y'))) (ndσ x y hxy))
/-- `□`ND over two variables. -/
theorem nec_nd_cons {τ σ : Type} [Ty τ] [Ty σ] :
    NecNecessityOfDistinctness τ → NecNecessityOfDistinctness σ →
      NecNecessityOfDistinctnessCons τ σ :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _ (nec% (nd_cons (τ := τ) (σ := σ))) h₁) h₂
/-- ND over no variables: the identity of no coordinates is `⊤`. -/
theorem nd_nil : ¬ True → □ ¬ True := fun h => absurd trivial h
/-- `□`ND over no variables. -/
theorem nec_nd_nil : □ (¬ True → □ ¬ True) := nec% nd_nil

/-- Existence over two variables, from Existence at each. -/
theorem existence_cons {τ σ : Type} [Ty τ] [Ty σ] :
    Existence τ → Existence σ → ExistenceCons τ σ :=
  fun eτ eσ => eσ.elim fun x hx => eτ.elim fun x' hx' => ⟨x, x', hx, hx'⟩
/-- Existence over no variables. -/
theorem existence_nil : True := trivial

/-- Functionality over two arguments, from Functionality at the inner one and at the
outer one into the functions of the inner. -/
theorem functionality_cons {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] :
    Functionality τ ρ → Functionality σ (τ → ρ) → FunctionalityCons τ σ ρ :=
  fun fnτ fnσ X Y h => fnσ X Y (fun z => fnτ (X z) (Y z) (h z))
/-- `□`Functionality over two arguments. -/
theorem nec_functionality_cons {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] :
    NecFunctionality τ ρ → NecFunctionality σ (τ → ρ) → NecFunctionalityCons τ σ ρ :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _ (nec% (functionality_cons (τ := τ) (σ := σ) (ρ := ρ))) h₁) h₂
/-- Functionality over no arguments. -/
theorem functionality_nil {ρ : Type} [Rel ρ] : ∀ X Y : ρ, X = Y → X = Y := fun _ _ h => h
/-- `□`Functionality over no arguments. -/
theorem nec_functionality_nil {ρ : Type} [Rel ρ] : □ (∀ X Y : ρ, X = Y → X = Y) :=
  nec% (functionality_nil (ρ := ρ))

/-- Functional Choice from two inputs: choose, for each `x`, an operation on `x'` by
Functional Choice at `τ`; then choose those operations by Functional Choice at `σ`. -/
theorem functional_choice_cons {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] :
    FunctionalChoice τ ρ → FunctionalChoice σ (τ → ρ) → FunctionalChoiceCons τ σ ρ :=
  fun fcτ fcσ U hU => fcσ (λ x f ↦ ∀ x', U x x' (f x')) (fun x => fcτ (U x) (hU x))
/-- `□`Functional Choice from two inputs. -/
theorem nec_functional_choice_cons {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] :
    NecFunctionalChoice τ ρ → NecFunctionalChoice σ (τ → ρ) → NecFunctionalChoiceCons τ σ ρ :=
  fun h₁ h₂ =>
    modal_K _ _ (modal_K _ _ (nec% (functional_choice_cons (τ := τ) (σ := σ) (ρ := ρ))) h₁) h₂
/-- Functional Choice from no inputs. -/
theorem functional_choice_nil {ρ : Type} [Rel ρ] : ∀ U : ρ → Prop, (∃ y, U y) → ∃ X, U X :=
  fun _ h => h
/-- `□`Functional Choice from no inputs. -/
theorem nec_functional_choice_nil {ρ : Type} [Rel ρ] :
    □ (∀ U : ρ → Prop, (∃ y, U y) → ∃ X, U X) := nec% (functional_choice_nil (ρ := ρ))

/-- Relational Choice from two inputs (D8): for each `x`, a functional subrelation of
`U x` by Relational Choice at `τ'`; then one of those relations for each `x`, by
Relational Choice at `σ` into relations, and the relation that applies it. -/
theorem relational_choice_cons {τ' σ τ : Type} [Ty τ'] [Ty σ] [Ty τ] :
    RelationalChoice τ' τ → RelationalChoice σ (τ' → τ → Prop) →
      RelationalChoiceCons τ' σ τ := by
  intro rcτ rcσ U hU
  obtain ⟨S', hS'f, hS'V⟩ := rcσ
    (λ x R ↦ (∀ x', ∃ y, R x' y ∧ ∀ z, R x' z → y = z) ∧ ∀ x' y, R x' y → U x x' y)
    (fun x => rcτ (U x) (hU x))
  refine ⟨λ x x' y ↦ ∃ R, S' x R ∧ R x' y, ?_, ?_⟩
  · intro x x'
    obtain ⟨R, hR, huniq⟩ := hS'f x
    obtain ⟨y, hy, hyu⟩ := (hS'V x R hR).1 x'
    refine ⟨y, ⟨R, hR, hy⟩, ?_⟩
    rintro z ⟨R', hR', hz⟩
    exact hyu z (huniq R' hR' ▸ hz)
  · rintro x x' y ⟨R, hR, hy⟩
    exact (hS'V x R hR).2 x' y hy
/-- `□`Relational Choice from two inputs. -/
theorem nec_relational_choice_cons {τ' σ τ : Type} [Ty τ'] [Ty σ] [Ty τ] :
    NecRelationalChoice τ' τ → NecRelationalChoice σ (τ' → τ → Prop) →
      NecRelationalChoiceCons τ' σ τ :=
  fun h₁ h₂ =>
    modal_K _ _ (modal_K _ _ (nec% (relational_choice_cons (τ' := τ') (σ := σ) (τ := τ))) h₁) h₂
/-- Relational Choice from no inputs, from Relational Choice from one input of type `t`:
the input ignored, and the choice at `⊤` kept. -/
theorem relational_choice_nil {τ : Type} [Ty τ] : RelationalChoice Prop τ → RelationalChoiceNil τ :=
  fun rc U hU => (rc (λ _ y ↦ U y) (fun _ => hU)).elim fun S hS =>
    ⟨S True, hS.1 True, fun y h => hS.2 True y h⟩
/-- `□`Relational Choice from no inputs. -/
theorem nec_relational_choice_nil {τ : Type} [Ty τ] :
    NecRelationalChoice Prop τ → NecRelationalChoiceNil τ :=
  modal_K _ _ (nec% (relational_choice_nil (τ := τ)))

/-! ### Coding a tuple as an object

The tuple `x₁ … xₙ` is coded by `λR. R x₁ … xₙ`, of type `(σs ⇒* t) ⇒ t`, and the code
is injective. A unary theorem relating a principle at the code type `(σ → Prop) → Prop`
to the principle at `σ`, vectorized in `σ`, has a restricted instance at the code type
for its premise and the list form for its conclusion. Plenitude's two-element step would
need Functionality; through the codes it needs nothing. -/

/-- Two objects with the same code are the same: the code of `x` applied to `λz. z = y`
is `x = y`. -/
theorem code_injective {σ : Type} [Ty σ] (x y : σ) :
    (λ R : σ → Prop ↦ R x) = (λ R ↦ R y) → x = y :=
  fun h => (congrFun h (λ z ↦ z = y)).mpr rfl

/-- A functional relation, carried to the codes: a code to what its object goes to, and
anything else to `⊤`. -/
theorem functional_on_codes {σ τ : Type} [Ty σ] [Rel τ] (U : σ → τ → Prop)
    (hU : Functional U) :
    Functional (λ (c : (σ → Prop) → Prop) (z : τ) ↦
      (∃ x, c = (λ R ↦ R x) ∧ U x z) ∨ ((¬ ∃ x, c = (λ R ↦ R x)) ∧ z = constP True)) :=
  fun c => (em (∃ x, c = (λ R ↦ R x))).elim
    (fun hc => hc.elim fun x hx => (hU x).elim fun y hy =>
      ⟨y, Or.inl ⟨x, hx, hy.1⟩, fun z hz => hz.elim
        (fun h => h.elim fun x' hx' =>
          hy.2 z (code_injective x' x (hx'.1.symm.trans hx) ▸ hx'.2))
        (fun h => absurd hc h.1)⟩)
    (fun hn => ⟨constP True, Or.inr ⟨hn, rfl⟩, fun _ hz => hz.elim
      (fun h => h.elim fun x' hx' => absurd ⟨x', hx'.1⟩ hn)
      (fun h => h.2.symm)⟩)

/-- Plenitude at `σ`, from Plenitude at the codes. -/
theorem plenitude_of_codes {σ τ : Type} [Ty σ] [Rel τ] :
    Plenitude ((σ → Prop) → Prop) τ → Plenitude σ τ := fun pl U hU =>
  (pl _ (functional_on_codes U hU)).elim fun X hX =>
    ⟨λ x ↦ X (λ R ↦ R x), fun x => (hX (λ R ↦ R x)).elim
      (fun h => h.elim fun x' hx' => code_injective x' x hx'.1.symm ▸ hx'.2)
      (fun h => absurd ⟨x, rfl⟩ h.1)⟩

/-- `□`Plenitude at `σ`, from `□`Plenitude at the codes. -/
theorem nec_plenitude_of_codes {σ τ : Type} [Ty σ] [Rel τ] :
    NecPlenitude ((σ → Prop) → Prop) τ → NecPlenitude σ τ :=
  modal_K _ _ (nec% (plenitude_of_codes (σ := σ) (τ := τ)))

/-- An instance of `F` gives a code of one. -/
theorem codes_instantiated {σ : Type} [Ty σ] (F : σ → Prop) :
    (∃ x, F x) → ∃ c : (σ → Prop) → Prop, ∃ x, c = (λ R ↦ R x) ∧ F x :=
  fun h => h.elim fun x hx => ⟨λ R ↦ R x, x, rfl, hx⟩

/-- A property of codes of instances of `F`, read back at `σ`, entails `F`. -/
theorem codes_le {σ : Type} [Ty σ] (F : σ → Prop) (G : ((σ → Prop) → Prop) → Prop) :
    (∀ c, G c → ∃ x, c = (λ R ↦ R x) ∧ F x) → ∀ x, G (λ R ↦ R x) → F x :=
  fun f x h => (f _ h).elim fun x' hx' => code_injective x' x hx'.1.symm ▸ hx'.2

/-- A uniquely instantiated property of codes of instances of `F`, read back at `σ`, is
uniquely instantiated. -/
theorem codes_unique {σ : Type} [Ty σ] (F : σ → Prop) (G : ((σ → Prop) → Prop) → Prop) :
    (∀ c, G c → ∃ x, c = (λ R ↦ R x) ∧ F x) → (∃ c, G c ∧ ∀ c', G c' → c' = c) →
      ∃ x, G (λ R ↦ R x) ∧ ∀ y, G (λ R ↦ R y) → y = x :=
  fun f h => h.elim fun c hc => (f c hc.1).elim fun x hx =>
    ⟨x, hx.1 ▸ hc.1, fun y hy => code_injective y x ((hc.2 _ hy).trans hx.1)⟩

/-- Intensional Choice at `σ`, from Intensional Choice at the codes: choose among the codes of
instances, and read the choice back. -/
theorem intensional_choice_of_codes {σ : Type} [Ty σ] :
    IntensionalChoice ((σ → Prop) → Prop) → IntensionalChoice σ := fun ic F hF =>
  (ic (λ c ↦ ∃ x, c = (λ R ↦ R x) ∧ F x)
      (modal_K _ _ (nec% (codes_instantiated F)) hF)).elim fun G hG =>
    ⟨λ x ↦ G (λ R ↦ R x),
      (le_iff _ _).2 (modal_K _ _ (nec% (codes_le F G)) ((le_iff _ _).1 hG.1)),
      modal_K _ _ (modal_K _ _ (nec% (codes_unique F G)) ((le_iff _ _).1 hG.1)) hG.2⟩

/-- `□`Intensional Choice at `σ`, from `□`Intensional Choice at the codes. -/
theorem nec_intensional_choice_of_codes {σ : Type} [Ty σ] :
    NecIntensionalChoice ((σ → Prop) → Prop) → NecIntensionalChoice σ :=
  modal_K _ _ (nec% (intensional_choice_of_codes (σ := σ)))

/-- The property of the codes of the objects with `Z`, read back on the objects, is `Z`. -/
theorem decode_codes {σ : Type} [Ty σ] (Z : σ → Prop) :
    (λ y ↦ ∃ y', (λ R : σ → Prop ↦ R y) = (λ R ↦ R y') ∧ Z y') = Z :=
  funext fun y => propext ⟨fun h => h.elim fun y' hy' => (code_injective y y' hy'.1).symm ▸ hy'.2,
    fun h => ⟨y, rfl, h⟩⟩

/-- An entailment between properties of codes, read back on the objects. -/
theorem le_of_codes {σ : Type} [Ty σ] (Y' : ((σ → Prop) → Prop) → Prop) (Z : σ → Prop)
    (h : Rel.le Y' (λ c ↦ ∃ y, c = (λ R ↦ R y) ∧ Z y)) :
    Rel.le (λ y ↦ Y' (λ R ↦ R y)) Z :=
  (decode_codes Z).symm.trans ((congrArg (λ W y ↦ W (λ R : σ → Prop ↦ R y)) h).trans
    (congrArg (Rel.or (λ y ↦ Y' (λ R ↦ R y))) (decode_codes Z)))

/-- Actual Profile at `σ`, from Actual Profile at the codes. -/
theorem actual_profile_of_codes {σ : Type} [Ty σ] :
    ActualProfile ((σ → Prop) → Prop) → ActualProfile σ := fun ap x =>
  (ap (λ R ↦ R x)).elim fun Y' hY' =>
    ⟨λ y ↦ Y' (λ R ↦ R y), hY'.1, fun Z hZ =>
      le_of_codes Y' Z (hY'.2 (λ c ↦ ∃ y, c = (λ R ↦ R y) ∧ Z y) ⟨x, rfl, hZ⟩)⟩

/-! ### Modalized Plenitude

Over two inputs: necessarily, for each outer input `x`, Modalized Plenitude at the inner
input gives an operation necessarily representing `U x`, the only one by Modalized
Functionality; Modalized Plenitude at the outer input then gives one operation representing
those. The inner instance is used under the box, so the step takes it boxed. -/

/-- Two operations representing `U x` agree everywhere. -/
theorem mp_cons_unique {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] (U : σ → τ → ρ → Prop) (x : σ)
    (F G : τ → ρ) :
    (∀ x' y, U x x' y ↔ y = F x') → (∀ x' y, U x x' y ↔ y = G x') → ∀ x', F x' = G x' :=
  fun hF hG x' => (hG x' (F x')).1 ((hF x' (F x')).2 rfl)

/-- Two operations each necessarily representing `U x` are identical, by Modalized
Functionality. -/
theorem mp_cons_eq {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] (U : σ → τ → ρ → Prop) (x : σ)
    (F : τ → ρ) :
    □ (∀ x' y, U x x' y ↔ y = F x') →
      ∀ G : τ → ρ, □ (∀ x' y, U x x' y ↔ y = G x') → F = G := fun hF G hG =>
  modalized_functionality F G (modal_K _ _ (modal_K _ _ (nec% (mp_cons_unique U x F G)) hF) hG)

/-- For each `x`, Modalized Plenitude at `τ` gives an operation necessarily representing
`U x`, and necessarily the only one. -/
theorem mp_cons_step {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] (U : σ → τ → ρ → Prop) :
    ModalizedPlenitude τ ρ → □ (∀ x x', ∃ y, □ (U x x' y ∧ ∀ z, U x x' z → y = z)) →
      ∀ x, ∃ F : τ → ρ, □ (□ (∀ x' y, U x x' y ↔ y = F x') ∧
        ∀ G : τ → ρ, □ (∀ x' y, U x x' y ↔ y = G x') → F = G) := fun mp H x =>
  (mp (U x) (modal_K _ _ (nec% (fun (h : ∀ x x', ∃ y, □ (U x x' y ∧ ∀ z, U x x' z → y = z)) =>
      h x)) H)).elim fun F hF =>
    ⟨F, (box_and_eq _ _).mpr ⟨modal_four _ hF, modal_K _ _ (nec% (mp_cons_eq U x F)) (modal_four _ hF)⟩⟩

/-- The operations representing each `U x`, read back: `∀x F. (□∀x' y. Uxx'y ↔ y = Fx') ↔
F = X'x` gives `∀x x' y. Uxx'y ↔ y = X'xx'`. -/
theorem mp_cons_out {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] (U : σ → τ → ρ → Prop)
    (X' : σ → τ → ρ) :
    (∀ x (F : τ → ρ), □ (∀ x' y, U x x' y ↔ y = F x') ↔ F = X' x) →
      ∀ x x' y, U x x' y ↔ y = X' x x' :=
  fun h x => box_elim ((h x (X' x)).2 rfl)

/-- Modalized Plenitude over two inputs, from `□`Modalized Plenitude at the inner input and
Modalized Plenitude at the outer one, into the operations on the inner. -/
theorem modalized_plenitude_cons {τ σ ρ : Type} [Ty τ] [Ty σ] [Rel ρ] :
    NecModalizedPlenitude τ ρ → ModalizedPlenitude σ (τ → ρ) → ModalizedPlenitudeCons τ σ ρ :=
  fun hτ hσ U H =>
    (hσ (λ x F ↦ □ (∀ x' y, U x x' y ↔ y = F x'))
      (modal_K _ _ (modal_K _ _ (nec% (mp_cons_step U)) hτ) (modal_four _ H))).elim fun X' hX' =>
      ⟨X', modal_K _ _ (nec% (mp_cons_out U X')) hX'⟩

/-- `(Uy ∧ ∀z. Uz → y = z) → ∀w. Uw ↔ w = y`. -/
theorem mp_nil_coext {ρ : Type} [Rel ρ] (U : ρ → Prop) (y : ρ) :
    (U y ∧ ∀ z, U z → y = z) → ∀ w, U w ↔ w = y :=
  fun h w => ⟨fun hw => (h.2 w hw).symm, fun e => e ▸ h.1⟩

/-- Modalized Plenitude from no inputs: the empty-list instance. -/
theorem modalized_plenitude_nil {ρ : Type} [Rel ρ] :
    ∀ U : ρ → Prop, □ (∃ y, □ (U y ∧ ∀ z, U z → y = z)) → ∃ X : ρ, □ (∀ y, U y ↔ y = X) :=
  fun U H => (box_elim H).elim fun y hy => ⟨y, modal_K _ _ (nec% (mp_nil_coext U y)) hy⟩

end Lists

#classicism_schema Classicism.P.BarcanCons Classicism.P.NecBarcanCons
  Classicism.P.TractarianismCons Classicism.P.NecTractarianismCons
  Classicism.P.NecessityOfDistinctnessCons Classicism.P.NecNecessityOfDistinctnessCons
  Classicism.P.ExistenceCons Classicism.P.FunctionalityCons Classicism.P.NecFunctionalityCons
  Classicism.P.FunctionalChoiceCons Classicism.P.NecFunctionalChoiceCons
  Classicism.P.RelationalChoiceCons Classicism.P.NecRelationalChoiceCons
  Classicism.P.RelationalChoiceNil Classicism.P.NecRelationalChoiceNil
  Classicism.P.ModalizedPlenitudeCons Classicism.P.NecModalizedPlenitude
#classicism_certify Classicism.Lists.barcan_cons Classicism.Lists.nec_barcan_cons
  Classicism.Lists.tractarianism_cons Classicism.Lists.nec_tractarianism_cons
  Classicism.Lists.nd_cons Classicism.Lists.nec_nd_cons Classicism.Lists.existence_cons
  Classicism.Lists.functionality_cons Classicism.Lists.nec_functionality_cons
  Classicism.Lists.functional_choice_cons Classicism.Lists.nec_functional_choice_cons
  Classicism.Lists.relational_choice_cons Classicism.Lists.nec_relational_choice_cons
  Classicism.Lists.relational_choice_nil Classicism.Lists.nec_relational_choice_nil
  Classicism.Lists.plenitude_of_codes Classicism.Lists.nec_plenitude_of_codes
  Classicism.Lists.intensional_choice_of_codes Classicism.Lists.nec_intensional_choice_of_codes
  Classicism.Lists.actual_profile_of_codes Classicism.Lists.modalized_plenitude_cons
#classicism_derive Classicism.Lists.barcan_nil Classicism.Lists.nec_barcan_nil
  Classicism.Lists.tractarianism_nil Classicism.Lists.nec_tractarianism_nil
  Classicism.Lists.nd_nil Classicism.Lists.nec_nd_nil Classicism.Lists.existence_nil
  Classicism.Lists.functionality_nil Classicism.Lists.nec_functionality_nil
  Classicism.Lists.functional_choice_nil Classicism.Lists.nec_functional_choice_nil
  Classicism.Lists.modalized_plenitude_nil

/-! ## 3. Restricted ⇒ list -/

namespace Meta
open AxiomSet Classicism.Lists

/-! ### Without a codomain, without identity -/

/-- **BF over every list, from BF.** -/
theorem _root_.Classicism.P.Barcan.schema_entails_listSchema :
    P.Barcan.schema ⟹ P.Barcan.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus barcan_nil.derivable
  | cons σ τs ih =>
    exact (Theorem.ofC (barcan_cons.listRule τs σ hσs.head)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-- **`□`BF over every list, from `□`BF.** -/
theorem _root_.Classicism.P.NecBarcan.schema_entails_listSchema :
    P.NecBarcan.schema ⟹ P.NecBarcan.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus nec_barcan_nil.derivable
  | cons σ τs ih =>
    exact (Theorem.ofC (nec_barcan_cons.listRule τs σ hσs.head)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-- **Tractarianism over every list, from Tractarianism.** -/
theorem _root_.Classicism.P.Tractarianism.schema_entails_listSchema :
    P.Tractarianism.schema ⟹ P.Tractarianism.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus tractarianism_nil.derivable
  | cons σ τs ih =>
    exact (Theorem.ofC (tractarianism_cons.listRule τs σ hσs.head)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-- **`□`Tractarianism over every list, from `□`Tractarianism.** -/
theorem _root_.Classicism.P.NecTractarianism.schema_entails_listSchema :
    P.NecTractarianism.schema ⟹ P.NecTractarianism.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus nec_tractarianism_nil.derivable
  | cons σ τs ih =>
    exact (Theorem.ofC (nec_tractarianism_cons.listRule τs σ hσs.head)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-! ### Without a codomain, with identity

The identity of two blocks is the conjunction of the identities of their coordinates, and
at one coordinate the identity itself; so the step is from a nonempty tail, and the
one-element lists are the restricted instances. -/

/-- **ND over every list, from ND.** -/
theorem _root_.Classicism.P.NecessityOfDistinctness.schema_entails_listSchema :
    P.NecessityOfDistinctness.schema ⟹ P.NecessityOfDistinctness.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus nd_nil.derivable
  | cons σ τs ih =>
    cases τs with
    | nil =>
      exact (Theorem.ax ⟨σ, hσs.head, rfl⟩).cast (P.NecessityOfDistinctness.listQuoted_single σ).symm
    | cons τ τs =>
      exact (Theorem.ofC (nd_cons.listRule (τ :: τs) σ hσs.head)).mp₂ (ih hσs.tail)
        (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-- **`□`ND over every list, from `□`ND.** -/
theorem _root_.Classicism.P.NecNecessityOfDistinctness.schema_entails_listSchema :
    P.NecNecessityOfDistinctness.schema ⟹ P.NecNecessityOfDistinctness.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus nec_nd_nil.derivable
  | cons σ τs ih =>
    cases τs with
    | nil =>
      exact (Theorem.ax ⟨σ, hσs.head, rfl⟩).cast (P.NecNecessityOfDistinctness.listQuoted_single σ).symm
    | cons τ τs =>
      exact (Theorem.ofC (nec_nd_cons.listRule (τ :: τs) σ hσs.head)).mp₂ (ih hσs.tail)
        (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-- **Existence over every list, from Existence.** -/
theorem _root_.Classicism.P.Existence.schema_entails_listSchema :
    P.Existence.schema ⟹ P.Existence.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  induction σs with
  | nil => exact Theorem.ofCMinus existence_nil.derivable
  | cons σ τs ih =>
    cases τs with
    | nil => exact (Theorem.ax ⟨σ, hσs.head, rfl⟩).cast (P.Existence.listQuoted_single σ).symm
    | cons τ τs =>
      exact (Theorem.ofC (existence_cons.listRule (τ :: τs) σ hσs.head)).mp₂ (ih hσs.tail)
        (Theorem.ax ⟨σ, hσs.head, rfl⟩)

/-! ### With a relational codomain

The codomain `ρ` passes through the vectorization as its translation, which is `ρ` itself
by its closedness; so the step and the empty list are the list forms up to that
(`classicism_vec_eq`). -/

/-- **Functionality over every list, from Functionality.** -/
theorem _root_.Classicism.P.Functionality.schema_entails_listSchema :
    P.Functionality.schema ⟹ P.Functionality.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  induction σs with
  | nil => exact (Theorem.ofCMinus (functionality_nil.derivable ρ)).cast (by classicism_vec_eq)
  | cons σ τs ih =>
    have hσ := hσs.head
    exact ((Theorem.ofC (functionality_cons.listRule τs σ ρ hσ hρ)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, τs ⇒* ρ, hσ, (RTy.closed_arrs τs ρ).2 ⟨hσs.tail, hρ⟩, rfl⟩)).cast
      (by classicism_vec_eq)

/-- **`□`Functionality over every list, from `□`Functionality.** -/
theorem _root_.Classicism.P.NecFunctionality.schema_entails_listSchema :
    P.NecFunctionality.schema ⟹ P.NecFunctionality.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  induction σs with
  | nil => exact (Theorem.ofCMinus (nec_functionality_nil.derivable ρ)).cast (by classicism_vec_eq)
  | cons σ τs ih =>
    have hσ := hσs.head
    exact ((Theorem.ofC (nec_functionality_cons.listRule τs σ ρ hσ hρ)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, τs ⇒* ρ, hσ, (RTy.closed_arrs τs ρ).2 ⟨hσs.tail, hρ⟩, rfl⟩)).cast
      (by classicism_vec_eq)

/-- **Functional Choice over every list, from Functional Choice.** -/
theorem _root_.Classicism.P.FunctionalChoice.schema_entails_listSchema :
    P.FunctionalChoice.schema ⟹ P.FunctionalChoice.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  induction σs with
  | nil => exact (Theorem.ofCMinus (functional_choice_nil.derivable ρ)).cast (by classicism_vec_eq)
  | cons σ τs ih =>
    have hσ := hσs.head
    exact ((Theorem.ofC (functional_choice_cons.listRule τs σ ρ hσ hρ)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, τs ⇒* ρ, hσ, (RTy.closed_arrs τs ρ).2 ⟨hσs.tail, hρ⟩, rfl⟩)).cast
      (by classicism_vec_eq)

/-- **`□`Functional Choice over every list, from `□`Functional Choice.** -/
theorem _root_.Classicism.P.NecFunctionalChoice.schema_entails_listSchema :
    P.NecFunctionalChoice.schema ⟹ P.NecFunctionalChoice.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  induction σs with
  | nil =>
    exact (Theorem.ofCMinus (nec_functional_choice_nil.derivable ρ)).cast (by classicism_vec_eq)
  | cons σ τs ih =>
    have hσ := hσs.head
    exact ((Theorem.ofC (nec_functional_choice_cons.listRule τs σ ρ hσ hρ)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, τs ⇒* ρ, hσ, (RTy.closed_arrs τs ρ).2 ⟨hσs.tail, hρ⟩, rfl⟩)).cast
      (by classicism_vec_eq)

/-! ### Relational Choice

The output type is any type, not vectorized; the empty list of inputs comes from one
input of type `t`. -/

/-- **Relational Choice over every list of inputs, from Relational Choice.** -/
theorem _root_.Classicism.P.RelationalChoice.schema_entails_listSchema :
    P.RelationalChoice.schema ⟹ P.RelationalChoice.listSchema := by
  rintro a ⟨σs, τ, hσs, hτ, rfl⟩
  induction σs with
  | nil =>
    exact (Theorem.ofC (relational_choice_nil.rule τ)).mp
      (Theorem.ax ⟨.rel .t, τ, trivial, hτ, rfl⟩)
  | cons σ τs ih =>
    exact (Theorem.ofC (relational_choice_cons.listRule τs σ τ hσs.head hτ)).mp₂ (ih hσs.tail)
      (Theorem.ax ⟨σ, .rel (τs ⇒* τ ⇒ .t), hσs.head,
        (RTy.closed_arrs τs (τ ⇒ .t)).2 ⟨hσs.tail, hτ, trivial⟩, rfl⟩)

/-- **`□`Relational Choice over every list of inputs, from `□`Relational Choice.** -/
theorem _root_.Classicism.P.NecRelationalChoice.schema_entails_listSchema :
    P.NecRelationalChoice.schema ⟹ P.NecRelationalChoice.listSchema := by
  rintro a ⟨σs, τ, hσs, hτ, rfl⟩
  induction σs with
  | nil =>
    exact (Theorem.ofC (nec_relational_choice_nil.rule τ)).mp
      (Theorem.ax ⟨.rel .t, τ, trivial, hτ, rfl⟩)
  | cons σ τs ih =>
    exact (Theorem.ofC (nec_relational_choice_cons.listRule τs σ τ hσs.head hτ)).mp₂
      (ih hσs.tail)
      (Theorem.ax ⟨σ, .rel (τs ⇒* τ ⇒ .t), hσs.head,
        (RTy.closed_arrs τs (τ ⇒ .t)).2 ⟨hσs.tail, hτ, trivial⟩, rfl⟩)

/-! ### Through the codes -/

/-- **Plenitude over every list, from Plenitude**, at the code type. -/
theorem _root_.Classicism.P.Plenitude.schema_entails_listSchema :
    P.Plenitude.schema ⟹ P.Plenitude.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  exact (Theorem.ofC (plenitude_of_codes.listRule σs ρ hρ)).mp
    (Theorem.ax ⟨.rel (.rel (σs ⇒* .t) ⇒ .t), ρ, ⟨(RTy.closed_arrs σs .t).2 ⟨hσs, trivial⟩, trivial⟩, hρ,
      rfl⟩)

/-- **`□`Plenitude over every list, from `□`Plenitude**, at the code type. -/
theorem _root_.Classicism.P.NecPlenitude.schema_entails_listSchema :
    P.NecPlenitude.schema ⟹ P.NecPlenitude.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  exact (Theorem.ofC (nec_plenitude_of_codes.listRule σs ρ hρ)).mp
    (Theorem.ax ⟨.rel (.rel (σs ⇒* .t) ⇒ .t), ρ, ⟨(RTy.closed_arrs σs .t).2 ⟨hσs, trivial⟩, trivial⟩, hρ,
      rfl⟩)

/-- **Intensional Choice over every list, from Intensional Choice**, at the code type. -/
theorem _root_.Classicism.P.IntensionalChoice.schema_entails_listSchema :
    P.IntensionalChoice.schema ⟹ P.IntensionalChoice.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  exact (Theorem.ofC (intensional_choice_of_codes.listRule σs)).mp
    (Theorem.ax ⟨.rel (.rel (σs ⇒* .t) ⇒ .t), ⟨(RTy.closed_arrs σs .t).2 ⟨hσs, trivial⟩, trivial⟩, rfl⟩)

/-- **`□`Intensional Choice over every list, from `□`Intensional Choice**, at the code type. -/
theorem _root_.Classicism.P.NecIntensionalChoice.schema_entails_listSchema :
    P.NecIntensionalChoice.schema ⟹ P.NecIntensionalChoice.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  exact (Theorem.ofC (nec_intensional_choice_of_codes.listRule σs)).mp
    (Theorem.ax ⟨.rel (.rel (σs ⇒* .t) ⇒ .t), ⟨(RTy.closed_arrs σs .t).2 ⟨hσs, trivial⟩, trivial⟩, rfl⟩)

/-- **Actual Profile over every list, from Actual Profile**, at the code type. -/
theorem _root_.Classicism.P.ActualProfile.schema_entails_listSchema :
    P.ActualProfile.schema ⟹ P.ActualProfile.listSchema := by
  rintro a ⟨σs, hσs, rfl⟩
  exact (Theorem.ofC (actual_profile_of_codes.listRule σs)).mp
    (Theorem.ax ⟨.rel (.rel (σs ⇒* .t) ⇒ .t), ⟨(RTy.closed_arrs σs .t).2 ⟨hσs, trivial⟩, trivial⟩, rfl⟩)

/-! ### The theorems of `C`

Their list forms are theorems of `C` already, from the audit's list entailments. -/

/-- **Modalized Functionality over every list**, a theorem of `C`. -/
theorem _root_.Classicism.P.ModalizedFunctionality.schema_entails_listSchema :
    P.ModalizedFunctionality.schema ⟹ P.ModalizedFunctionality.listSchema :=
  Entails.mono_left (fun _ h => h.elim)
    Classicism.Proofs.classicism_implies_modalized_functionality_r.listEntails
/-- **Converse Barcan over every list**, a theorem of `C`. -/
theorem _root_.Classicism.P.ConverseBarcan.schema_entails_listSchema :
    P.ConverseBarcan.schema ⟹ P.ConverseBarcan.listSchema :=
  Entails.mono_left (fun _ h => h.elim) Classicism.Proofs.classicism_implies_converse_barcan_r.listEntails
/-- **Necessity of Identity over every list**, a theorem of `C`. -/
theorem _root_.Classicism.P.NecessityOfIdentity.schema_entails_listSchema :
    P.NecessityOfIdentity.schema ⟹ P.NecessityOfIdentity.listSchema :=
  Entails.mono_left (fun _ h => h.elim)
    Classicism.Proofs.classicism_implies_identity_necessary_r.listEntails
/-- **Broad Necessitism over every list**, a theorem of `C`. -/
theorem _root_.Classicism.P.BroadNecessitism.schema_entails_listSchema :
    P.BroadNecessitism.schema ⟹ P.BroadNecessitism.listSchema :=
  Entails.mono_left (fun _ h => h.elim)
    Classicism.Proofs.classicism_implies_broad_necessitism_r.listEntails

/-! ## 4. Relational types as lists

Every relational type is its argument types' `⇒* t` (`RTy.ofArgs_args`). So a principle
over relational types holds at every one once it holds at `σs ⇒* t` for every list: a
unary theorem at `σ → t`, vectorized in `σ`, is the principle at every arity. -/

/-- The instances of a schema over relational types are among its instances at
`σs ⇒* t`. -/
theorem schema_subset_args (q : RTy → Sentence Signature.pure) :
    (fun a => ∃ ρ : RTy, ρ.Closed ∧ a = q ρ) ⊆
      (fun a => ∃ σs : List Ty, Ty.AllClosed σs ∧ a = q (σs ⇒* .t)) :=
  fun _ ⟨ρ, hρ, h⟩ =>
    ⟨ρ.args, RTy.closed_args hρ, h.trans (congrArg q (RTy.ofArgs_args ρ).symm)⟩

/-- The same for a schema over a type and a relational type, the relational type last, as
Plenitude's output is: a unary result at output `σ' → t`, vectorized in `σ'`, is the
result at every output type. -/
theorem schema_subset_args₂ (q : Ty → RTy → Sentence Signature.pure) :
    (fun a => ∃ σ : Ty, ∃ ρ : RTy, σ.Closed ∧ ρ.Closed ∧ a = q σ ρ) ⊆
      (fun a => ∃ σs : List Ty, ∃ σ : Ty, Ty.AllClosed σs ∧ σ.Closed ∧ a = q σ (σs ⇒* .t)) :=
  fun _ ⟨σ, ρ, hσ, hρ, h⟩ =>
    ⟨ρ.args, σ, RTy.closed_args hρ, hσ, h.trans (congrArg (q σ) (RTy.ofArgs_args ρ).symm)⟩


/-! ## 5. Modalized Plenitude over every list

A theorem of `C` at every list, by induction on the list: the empty list from its shallow
instance; the step from `σ` and the tail `τs`, at the restricted instance (a theorem of `C`
at every type, its record vectorized in the output) and the tail's instance necessitated. -/

open Lists in
/-- **Modalized Plenitude over every list**, a theorem of `C`. -/
theorem modalized_plenitude_list : ∀ (σs : List Ty) (ρ : RTy), Ty.AllClosed σs → ρ.Closed →
    C.Theorem (P.ModalizedPlenitude.listQuoted σs ρ)
  | [], ρ, _, _ =>
    Theorem.cast (Derivable.mono (fun _ h => h.elim) (modalized_plenitude_nil.derivable ρ))
      (by classicism_vec_eq)
  | σ :: τs, ρ, hσs, hρ =>
    have ih := modalized_plenitude_list τs ρ hσs.tail hρ
    have hres : Theorem (C.axioms ∪ empty) (P.ModalizedPlenitude.quoted σ (τs ⇒* ρ)) :=
      Entails.mono_right (schema_subset_args₂ _)
        Classicism.Proofs.classicism_implies_modalized_plenitude_r.listEntails _
        ⟨σ, τs ⇒* ρ, hσs.head, (RTy.closed_arrs τs ρ).2 ⟨hσs.tail, hρ⟩, rfl⟩
    Theorem.cast (Theorem.mp₂ (modalized_plenitude_cons.listRule τs σ ρ hσs.head hρ)
      (Theorem.cast (C.Theorem.nec ih) (by classicism_vec_eq))
      (Derivable.mono (fun _ h => h.elim (fun h => h) (fun h => h.elim)) hres))
      (by classicism_vec_eq)

/-- **Modalized Plenitude over every list, from Modalized Plenitude**: a theorem of `C`. -/
theorem _root_.Classicism.P.ModalizedPlenitude.schema_entails_listSchema :
    P.ModalizedPlenitude.schema ⟹ P.ModalizedPlenitude.listSchema := by
  rintro a ⟨σs, ρ, hσs, hρ, rfl⟩
  exact Theorem.ofC (modalized_plenitude_list σs ρ hσs hρ)

end Meta

end Classicism
