import Classicism.Principles

/-!
# Proofs of map records

One theorem per record of `topics/classicism/results/`, named after the record id with
hyphens replaced by underscores, whose type is the record's statement: the conjunction
of its premise principles implying its conclusion. Records with no premises are
theorems of C. Each docstring names the record and the source of the argument.
-/

namespace Classicism.Proofs
open Classicism.P

/-! ### Theorems of Classicism (records with no premises) -/

/-- `classicism-implies-modal-k`. -/
theorem classicism_implies_modal_k : ModalK := modal_K
/-- `classicism-implies-modal-t`. -/
theorem classicism_implies_modal_t : ModalT := modal_T
/-- `classicism-implies-modal-four`. -/
theorem classicism_implies_modal_four : ModalFour := modal_four
/-- `classicism-implies-modalized-fregean`. -/
theorem classicism_implies_modalized_fregean : ModalizedFregean := modalized_fregean
/-- `classicism-implies-intensionality-r`. -/
theorem classicism_implies_intensionality_r : Intensionality := fun X Y => intensionality X Y
/-- `classicism-implies-modalized-functionality-r`. -/
theorem classicism_implies_modalized_functionality_r : ModalizedFunctionality :=
  fun X Y => modalized_functionality X Y
/-- `classicism-implies-identity-necessary-r`. -/
theorem classicism_implies_identity_necessary_r : NecessityOfIdentity :=
  fun x y => necessity_of_identity x y
/-- `classicism-implies-converse-barcan-r`. -/
theorem classicism_implies_converse_barcan_r : ConverseBarcan := fun X => converse_barcan X
/-- `classicism-implies-existence-r`. The relational conjunct is `C⁻`; the `e` conjunct
is `e_exists`, so this is the one record proof whose axiom report names that axiom. -/
theorem classicism_implies_existence_r : Existence := ⟨existence_e, fun {_} [Rel _] => existence_rel⟩

/-- The `C⁻`-provable half of the same record, recorded separately so that the axiom
report shows Existence at relational types costing nothing. -/
theorem existence_at_relational_types : ExistenceRel := fun {_} [Rel _] => existence_rel

/-! ### Modal principles (Classicism, Proposition 2.2) -/

/-- `distinctness-necessary-t-implies-modal-five`: `◇p` is `p ≠ False`, so `ND` at
type `t` applied to `p` and `False` is `5` word for word. -/
theorem distinctness_necessary_t_implies_modal_five : NecessityOfDistinctnessT → ModalFive :=
  fun nd p => nd p False

/-- `modal-five-implies-modal-b`: compose `p → ◇p` with `5`. -/
theorem modal_five_implies_modal_b : ModalFive → ModalB :=
  fun five p hp => five p (dia_intro p hp)

/-- Closed lemma for Prior's argument: `◇(x ≠ y) → x ≠ y`, since `x = y` gives
`□(x = y)` by NI and then `(x ≠ y) = False`. -/
theorem ne_of_dia_ne {σ : Type} [Ty σ] (x y : σ) : ◇ (x ≠ y) → x ≠ y := fun hd hxy =>
  hd (calc (x ≠ y) = ¬ (x = y) := rfl
        _ = ¬ True := by rw [necessity_of_identity x y hxy]
        _ = False := not_true_eq)

/-- `modal-b-implies-distinctness-necessary-r` (Prior): `B` gives `□◇(x ≠ y)`; the
necessitation of the closed lemma and `K` give `□(x ≠ y)`. -/
theorem modal_b_implies_distinctness_necessary_r : ModalB → NecessityOfDistinctness := by
  intro b σ _ x y hne
  exact modal_K _ _ (nec% (ne_of_dia_ne x y)) (b (x ≠ y) hne)

/-- `necessary-barcan-t-implies-barcan-t`: `T`. -/
theorem necessary_barcan_t_implies_barcan_t : NecBarcanT → BarcanT := box_elim

/-- `necessary-distinctness-necessary-t-implies-distinctness-necessary-t`: `T`. -/
theorem necessary_distinctness_necessary_t_implies_distinctness_necessary_t :
    NecNecessityOfDistinctnessT → NecessityOfDistinctnessT := box_elim

/-- `barcan-r-implies-barcan-t`: specialise the type block to `t`. -/
theorem barcan_r_implies_barcan_t : Barcan → BarcanT := fun bf X => bf X

/-! ### Extensionality (Classicism, §1.4) -/

/-- `extensionality-r-implies-fregean-axiom`: the nullary instance. -/
theorem extensionality_r_implies_fregean_axiom : Extensionality → FregeanAxiom :=
  fun ext p q h => ext p q h

/-- `fregean-axiom-implies-extensionality-r`: the Fregean Axiom makes the true
coextension sentence identical to `True`, and Intensionality finishes. -/
theorem fregean_axiom_implies_extensionality_r : FregeanAxiom → Extensionality := by
  intro fa τ _ X Y h
  exact intensionality X Y (fa (coext X Y) True ⟨fun _ => trivial, fun _ => h⟩)

/-! ### Tractarianism, Functionality and BF (Classicism, Proposition 2.1, n. 27) -/

/-- `True ≤ q` is `□q`: `q = (True ∨ q)` iff `q = True`. -/
theorem true_entails_eq_box (q : Prop) : (True ≤ q) = □ q := by
  show (q = (True ∨ q)) = (q = True)
  rw [true_or_eq]

/-- `tractarianism-r-implies-barcan-r`: take `p := True`. -/
theorem tractarianism_r_implies_barcan_r : Tractarianism → Barcan := by
  intro tr σ _ X h
  rw [← true_entails_eq_box]
  exact tr True X (fun x => by rw [true_entails_eq_box]; exact h x)

/-- `functionality-r-implies-tractarianism-r`: Functionality identifies `X` with
`λx. p ∨ Xx`; then `∀x. Xx = ∀x. p ∨ Xx = p ∨ ∀x. Xx` by Distribution-∨∀. -/
theorem functionality_r_implies_tractarianism_r : Functionality → Tractarianism := by
  intro fn σ _ p X h
  have hX : X = fun x => p ∨ X x := fn X (fun x => p ∨ X x) h
  show (∀ x, X x) = (p ∨ ∀ x, X x)
  calc (∀ x, X x) = (∀ x, p ∨ X x) := by conv => lhs; rw [hX]
    _ = (p ∨ ∀ x, X x) := (or_forall_distrib_eq X p).symm

/-- `barcan-r-implies-functionality-r`: NI pointwise, BF to box the quantifier,
then Modalized Functionality. -/
theorem barcan_r_implies_functionality_r : Barcan → Functionality := by
  intro bf σ τ _ _ X Y h
  exact modalized_functionality X Y
    (bf (fun z => X z = Y z) (fun z => necessity_of_identity _ _ (h z)))


/-! ### Comprehension (Classicism, §2.3; Dorr, *BC does not imply RC*) -/

/-- `rigid-comprehension-r-implies-persistent-comprehension-r`: the first conjunct. -/
theorem rigid_comprehension_r_implies_persistent_comprehension_r :
    RigidComprehension → PersistentComprehension := by
  intro rc τ _ X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, hY.1, hco⟩

/-- `rigid-comprehension-r-implies-inextensible-comprehension-r`: the second conjunct. -/
theorem rigid_comprehension_r_implies_inextensible_comprehension_r :
    RigidComprehension → InextensibleComprehension := by
  intro rc τ _ X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, hY.2, hco⟩

/-- `rigid-comprehension-r-implies-weak-rigid-comprehension-r`: a rigid relation is
persistent by definition, and `T` strips the leading box from its inextensibility
conjunct. So the rigid coextension already witnesses the weaker principle. -/
theorem rigid_comprehension_r_implies_weak_rigid_comprehension_r :
    RigidComprehension → WeakRigidComprehension := by
  intro rc τ _ X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, weaklyRigid_of_rigid hY, hco⟩

/-- `weak-rigid-comprehension-r-implies-very-weak-rigid-comprehension-r`: `Persistent(Y)`
unpacks as `□∀x̄. Y[x̄] → □Y[x̄]`, and `T` gives weak persistence. The inextensibility
conjunct is the same in both conditions. -/
theorem weak_rigid_comprehension_r_implies_very_weak_rigid_comprehension_r :
    WeakRigidComprehension → VeryWeakRigidComprehension := by
  intro wrc τ _ X
  obtain ⟨Y, hY, hco⟩ := wrc X
  exact ⟨Y, veryWeaklyRigid_of_weaklyRigid hY, hco⟩

/-- `weak-rigid-comprehension-r-implies-persistent-comprehension-r`: the first conjunct
of weak rigidity is persistence itself. -/
theorem weak_rigid_comprehension_r_implies_persistent_comprehension_r :
    WeakRigidComprehension → PersistentComprehension := by
  intro wrc τ _ X
  obtain ⟨Y, hY, hco⟩ := wrc X
  exact ⟨Y, hY.1, hco⟩

/-- Closed lemma for the Gallin argument: a relation holding of `a` and failing of `b`
distinguishes them, by Leibniz's Law. Being closed, it may be necessitated. -/
theorem ne_of_holds_and_not_holds {σ : Type} [Ty σ] (Y : σ → Prop) (a b : σ) :
    (Y a ∧ ¬ Y b) → a ≠ b := fun ⟨hYa, hnYb⟩ hab => hnYb (hab ▸ hYa)

/-- `gallin-comprehension-implies-nd`. Apply Gallin Extensional Comprehension to
`λx^σ. x = a`, of the admitted type `σt`, and let `Y` be the coextension supplied.
Coextensiveness gives `Ya` from `a = a` and `¬Yb` from `b ≠ a`; persistence of `Y` and of
`¬Y` boxes each. The box distributes over the conjunction, and the closed lemma above
necessitates, so `K` yields `□(a ≠ b)`. The type was arbitrary, which is the schema. -/
theorem gallin_comprehension_implies_nd :
    GallinExtensionalComprehension → NecessityOfDistinctness := by
  intro gec σ _ a b hne
  obtain ⟨Y, hY, hnY, hco⟩ := gec (fun x : σ => x = a)
  have hYa : Y a := (hco a).1 rfl
  have hnYb : ¬ Y b := fun hb => hne ((hco b).2 hb).symm
  have hbox : □ (Y a) ∧ □ (¬ Y b) :=
    ⟨weaklyPersistent_apply (weaklyPersistent_of_persistent hY) a hYa,
     weaklyPersistent_neg_apply (weaklyPersistent_of_persistent hnY) b hnYb⟩
  have hconj : □ (Y a ∧ ¬ Y b) := by rw [box_and_eq]; exact hbox
  exact modal_K _ _ (nec% (ne_of_holds_and_not_holds Y a b)) hconj

/-! ### Choice (Classicism, §2.4) -/

/-- `functional-choice-r-implies-relational-choice-r`. Functional Choice cannot be
applied directly, because the output type may be `e` while an operation's output type may
not. Replace each output `y` by its haecceity `λw. w = y`, of the admitted type `τt`, and
choose among haecceities instead: the relation `λx H. ∃y. H = (λw. w = y) ∧ (Ux)y` is
serial because `U` is, so Functional Choice supplies `X : σ → τ → Prop` with `X x` a
haecceity of some `U`-successor of `x`. That `X` is itself the required subrelation, since
haecceities are injective by identity elimination. The record's argument treats the `e`
case separately; the haecceity detour is uniform, so no case split is needed. -/
theorem functional_choice_r_implies_relational_choice_r :
    FunctionalChoice → RelationalChoice := by
  intro fc σ τ _ _ U hser
  -- The relation between an argument and the haecceities of its `U`-successors.
  have hser' : Serial (fun (x : σ) (H : τ → Prop) => ∃ y, H = (fun w => w = y) ∧ U x y) := by
    intro x
    obtain ⟨y, hy⟩ := hser x
    exact ⟨fun w => w = y, y, rfl, hy⟩
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

end Classicism.Proofs
