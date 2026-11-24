import Classicism.Paper
import Classicism.Principles
import Classicism.Results.Records.C5

/-!
# Proofs of map records: Arithmetic Necessitism

Records concluding Arithmetic Necessitism, `□I*_σ → Rigid(ℕ_σ) ∧ ∀m n ∈ ℕ_σ. m ≠ n → □ m ≠ n`,
with the numbers `ℕ_σ` the finite cardinalities at `σ`. Persistence of the numbers is a theorem
of `C`; inextensibility and necessary distinctness come from `C5`, or from `□`Rigid
Comprehension and the antecedent `□I*_σ`. The conventions are in `Results/Records.lean`;
helper lemmas are stated unfolded, so that the audits do not read them as records.

Since 25 November 2026 also the two records by which weakly inextensible numbers carry
Potential Infinity at `t` to Possible Infinity at `t` (Goodsell's argument,
`possibleInfinity_of_weaklyInextensible` in `Background/Arithmetic.lean`): from Countable
Boolean Completeness, which makes the numbers weakly inextensible
(`finiteCardinality_weaklyInextensible_of_cbc`), and from Arithmetic Necessitism with the
necessitation.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

section
variable {σ : Type} [Ty σ]

/-! ### Numbers, in `C` -/

-- `finiteCardinality_box` (numbers are necessarily numbers) and `finiteCardinality_zero_or_suc`
-- (a number is zero or a successor) are in `Background/Arithmetic.lean` since 24 November 2026,
-- where the lemmas on Potential Infinity use them.

/-- The numbers are persistent, `□∀n. ℕn → □ℕn`: the last lemma, necessitated. -/
theorem finiteCardinality_persistent :
    □ (∀ n : (σ → Prop) → Prop, FiniteCardinality n → □ (FiniteCardinality n)) :=
  nec% (finiteCardinality_box (σ := σ))

/-! ### Necessary distinctness of numbers, from `□I*` -/

/-- `□(𝟎 ≠ Suc k)` for a number `k`, from `□I*`. -/
theorem zero_ne_suc_box (hI : □ (IStar σ)) (k : (σ → Prop) → Prop) (hk : FiniteCardinality k) :
    □ (ZeroCard σ ≠ SucCard k) :=
  modal_K _ _ (modal_K _ _
    (nec% (fun (h : IStar σ) (hk : FiniteCardinality k) => (h k k hk hk).1)) hI)
    (finiteCardinality_box k hk)

/-- `□(Suc m = Suc k → m = k)` for numbers `m`, `k`, from `□I*`. -/
theorem suc_inj_box (hI : □ (IStar σ)) (m k : (σ → Prop) → Prop)
    (hm : FiniteCardinality m) (hk : FiniteCardinality k) :
    □ (SucCard m = SucCard k → m = k) :=
  modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (h : IStar σ) (hm : FiniteCardinality m) (hk : FiniteCardinality k) =>
      (h m k hm hk).2)) hI) (finiteCardinality_box m hm)) (finiteCardinality_box k hk)

/-- **Distinct numbers are necessarily distinct**, given `□I*`: by induction on `m`, and on
whether `n` is zero or a successor. Zero differs necessarily from every successor; and if
`Suc m ≠ Suc k` then `m ≠ k`, so `□ m ≠ k`, and necessarily successor is injective. -/
theorem finiteCardinality_nd (hI : □ (IStar σ)) (m : (σ → Prop) → Prop)
    (hm : FiniteCardinality m) :
    ∀ n : (σ → Prop) → Prop, FiniteCardinality n → m ≠ n → □ (m ≠ n) :=
  (hm (fun Z => FiniteCardinality Z ∧
      ∀ n : (σ → Prop) → Prop, FiniteCardinality n → Z ≠ n → □ (Z ≠ n))
    ⟨⟨finiteCardinality_zero, fun n hn hne =>
        (finiteCardinality_zero_or_suc n hn).elim (fun e => absurd e.symm hne)
          fun hk => hk.elim fun k hk => hk.2 ▸ zero_ne_suc_box hI k hk.1⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun n hn hne =>
        (finiteCardinality_zero_or_suc n hn).elim
          (fun e => e ▸ modal_K _ _
            (nec% (fun (h : ZeroCard σ ≠ SucCard Y) (e : SucCard Y = ZeroCard σ) => h e.symm))
            (zero_ne_suc_box hI Y hY.1))
          fun hk => hk.elim fun k hk => hk.2 ▸ modal_K _ _ (modal_K _ _
            (nec% (fun (h : Y ≠ k) (hs : SucCard Y = SucCard k → Y = k)
              (e : SucCard Y = SucCard k) => h (hs e)))
            (hY.2 k hk.1 fun e => hne (hk.2 ▸ congrArg SucCard e)))
            (suc_inj_box hI Y k hY.1 hk.1)⟩⟩).2

/-! ### Inextensibility, from Rigid Comprehension -/

/-- With Rigid Comprehension at the type of properties of numbers, the numbers are weakly
inextensible: a rigid `Z` coextensive with `ℕ` holds necessarily of `𝟎`, and is necessarily
closed under successor, by its inextensibility, its instances being numbers; so necessarily
`ℕ ≤ Z`. And whatever is necessarily `X` at each number is necessarily `X` at each instance of
`Z`, so `Z ≤ X`, hence `ℕ ≤ X`. -/
theorem finiteCardinality_weaklyInextensible_of_rc :
    RigidComprehension (((σ → Prop) → Prop) → Prop) →
      WeaklyInextensible (FiniteCardinality (σ := σ)) := fun rc X hX =>
  (rc FiniteCardinality).elim fun Z hZ =>
    have hp : ∀ n, Z n → □ (Z n) := box_elim hZ.1.1
    have hi : ∀ X' : ((σ → Prop) → Prop) → Prop, (∀ n, Z n → □ (X' n)) →
        □ (∀ n, Z n → X' n) := box_elim hZ.1.2
    have hzn : ∀ n, Z n → FiniteCardinality n := fun n h => (hZ.2 n).2 h
    have h0 : □ (Z (ZeroCard σ)) := hp _ ((hZ.2 _).1 finiteCardinality_zero)
    have hs : □ (∀ Y, Z Y → Z (SucCard Y)) := hi (fun Y => Z (SucCard Y)) fun Y h =>
      hp _ ((hZ.2 _).1 (finiteCardinality_suc Y (hzn Y h)))
    have hNZ : □ (∀ n, FiniteCardinality n → Z n) := modal_K _ _ (modal_K _ _
      (nec% (fun (h0 : Z (ZeroCard σ)) (hs : ∀ Y, Z Y → Z (SucCard Y)) n
        (hn : FiniteCardinality n) => hn Z ⟨h0, hs⟩)) h0) hs
    have hZX : □ (∀ n, Z n → X n) := hi X fun n h => hX n (hzn n h)
    modal_K _ _ (modal_K _ _
      (nec% (fun (a : ∀ n, FiniteCardinality n → Z n) (b : ∀ n, Z n → X n) n
        (hn : FiniteCardinality n) => b n (a n hn))) hNZ) hZX

end

/-! ### The records -/

/-- `c5-implies-arithmetic-necessitism`: numbers are persistent in `C`; in `C5` a persistent
property is inextensible (n. 41), and `ND` holds at the type of numbers. The antecedent
`□I*_σ` is not used. -/
theorem c5_implies_arithmetic_necessitism {σ : Type} [Ty σ] :
    NecNecessityOfDistinctness Prop → ArithmeticNecessitism σ := fun hnd _ =>
  ⟨⟨finiteCardinality_persistent,
    inextensible_of_persistent_c5 hnd FiniteCardinality finiteCardinality_persistent⟩,
   fun m n _ _ => nd_of_nd_t (box_elim hnd) m n⟩

/-- `necessary-rigid-comprehension-implies-arithmetic-necessitism` (Barton and Goodsell,
Theorem 3, at every type): persistence is a theorem of `C`; inextensibility is the weak
inextensibility that Rigid Comprehension gives, at every world; and `□I*` gives necessary
distinctness. -/
theorem necessary_rigid_comprehension_implies_arithmetic_necessitism {σ : Type} [Ty σ] :
    NecRigidComprehension (((σ → Prop) → Prop) → Prop) → ArithmeticNecessitism σ :=
  fun hrc hI =>
    ⟨⟨finiteCardinality_persistent,
      modal_K _ _ (nec% (finiteCardinality_weaklyInextensible_of_rc (σ := σ))) hrc⟩,
     fun m n hm hn => finiteCardinality_nd hI m hm n hn⟩

/-! ### Weakly inextensible numbers, and Possible Infinity at `t` (25 November 2026) -/

/-- **Countable Boolean Completeness makes the numbers weakly inextensible.** The
haecceities of the numbers at `σ` are countable relative to `σ`; let `Z` be their least upper
bound. Then `Z` necessarily holds of each number, so of zero; `λx. Z(Suc x)` is another upper
bound, so `Z` is necessarily closed under successor, and the numbers are necessarily among its
instances. And whatever necessarily holds of each number is an upper bound, so lies above
`Z`. -/
theorem finiteCardinality_weaklyInextensible_of_cbc {σ : Type} [Ty σ] :
    CountableBooleanCompleteness σ (((σ → Prop) → Prop) → Prop) →
      WeaklyInextensible (FiniteCardinality (σ := σ)) := fun cbc X hX =>
  (cbc (λ Y ↦ ∃ n : (σ → Prop) → Prop, FiniteCardinality n ∧ Y = (λ x ↦ x = n))
    ⟨λ Y n ↦ Y = (λ x ↦ x = n), fun _ _ hyz =>
      ⟨fun h => h.elim fun _ hn => hn.2.1.trans hn.2.2.symm,
       fun e => hyz.1.elim fun n hn => ⟨n, hn.1, hn.2, e ▸ hn.2⟩⟩⟩).elim fun Z hZ =>
    have ub : ∀ n : (σ → Prop) → Prop, FiniteCardinality n → □ (Z n) := fun n hn =>
      modal_K _ _ (nec% (fun (h : ∀ x : (σ → Prop) → Prop, x = n → Z x) => h n rfl))
        ((Order.le_iff _ _).1 (((hZ Z).2 (le_refl_arrow_prop Z)) (λ x ↦ x = n) ⟨n, hn, rfl⟩))
    have ubS : UB (λ x ↦ Z (SucCard x))
        (λ Y ↦ ∃ n : (σ → Prop) → Prop, FiniteCardinality n ∧ Y = (λ x ↦ x = n)) :=
      fun _ hY => hY.elim fun n hn => hn.2 ▸ le_of_box_incl (modal_K _ _
        (nec% (fun (h : Z (SucCard n)) (x : (σ → Prop) → Prop) (e : x = n) =>
          (e ▸ h : Z (SucCard x))))
        (ub (SucCard n) (finiteCardinality_suc n hn.1)))
    have hS : □ (∀ x : (σ → Prop) → Prop, Z x → Z (SucCard x)) :=
      (Order.le_iff _ _).1 ((hZ _).1 ubS)
    have hNZ : □ (∀ n : (σ → Prop) → Prop, FiniteCardinality n → Z n) :=
      modal_K _ _ (modal_K _ _
        (nec% (fun (h0 : Z (ZeroCard σ)) (hs : ∀ Y, Z Y → Z (SucCard Y)) n
          (hn : FiniteCardinality n) => hn Z ⟨h0, hs⟩)) (ub _ finiteCardinality_zero)) hS
    have ubX : UB X (λ Y ↦ ∃ n : (σ → Prop) → Prop, FiniteCardinality n ∧ Y = (λ x ↦ x = n)) :=
      fun _ hY => hY.elim fun n hn => hn.2 ▸ le_of_box_incl (modal_K _ _
        (nec% (fun (h : X n) (x : (σ → Prop) → Prop) (e : x = n) => (e ▸ h : X x)))
        (hX n hn.1))
    have hZX : □ (∀ x : (σ → Prop) → Prop, Z x → X x) := (Order.le_iff _ _).1 ((hZ X).1 ubX)
    modal_K _ _ (modal_K _ _
      (nec% (fun (a : ∀ n : (σ → Prop) → Prop, FiniteCardinality n → Z n)
          (b : ∀ x : (σ → Prop) → Prop, Z x → X x) n (hn : FiniteCardinality n) => b n (a n hn)))
      hNZ) hZX

/-- `countable-boolean-completeness-and-potential-infinity-t-imply-possible-infinity-t`:
Countable Boolean Completeness makes the numbers counted at `t` weakly inextensible, and
then Potential Infinity gives Possible Infinity (`possibleInfinity_of_weaklyInextensible`). -/
theorem countable_boolean_completeness_and_potential_infinity_t_imply_possible_infinity_t :
    CountableBooleanCompleteness Prop (((Prop → Prop) → Prop) → Prop) → PotentialInfinityT →
      PossibleInfinityT :=
  fun cbc hP => possibleInfinity_of_weaklyInextensible
    (finiteCardinality_weaklyInextensible_of_cbc cbc) hP

/-- `arithmetic-necessitism-and-necessary-potential-infinity-t-imply-possible-infinity-t`:
`□`Potential Infinity is `□I*`, so Arithmetic Necessitism makes the numbers counted at `t`
rigid, hence weakly inextensible. -/
theorem arithmetic_necessitism_and_necessary_potential_infinity_t_imply_possible_infinity_t :
    ArithmeticNecessitism Prop → NecPotentialInfinityT → PossibleInfinityT :=
  fun an hP => possibleInfinity_of_weaklyInextensible
    (weaklyInextensible_of_inextensible
      (an (modal_K _ _ (nec% (iStar_of_potentialInfinity (σ := Prop))) hP)).1.2)
    (box_elim hP)

end Classicism.Proofs
