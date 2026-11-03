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
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

section
variable {σ : Type} [Ty σ]

/-! ### Numbers, in `C` -/

/-- **Numbers are necessarily numbers**, in `C`: the property `λn. □ℕn` holds of `𝟎`, since
`ℕ𝟎` is a theorem, and passes to successors by `K`, so every number has it. -/
theorem finiteCardinality_box (n : (σ → Prop) → Prop) :
    FiniteCardinality n → □ (FiniteCardinality n) := fun hn =>
  hn (fun Z => □ (FiniteCardinality Z))
    ⟨nec% (finiteCardinality_zero (σ := σ)),
     fun Y hY => modal_K _ _ (nec% (finiteCardinality_suc (σ := σ) Y)) hY⟩

/-- The numbers are persistent, `□∀n. ℕn → □ℕn`: the last lemma, necessitated. -/
theorem finiteCardinality_persistent :
    □ (∀ n : (σ → Prop) → Prop, FiniteCardinality n → □ (FiniteCardinality n)) :=
  nec% (finiteCardinality_box (σ := σ))

/-- A number is zero or the successor of a number, by induction. -/
theorem finiteCardinality_zero_or_suc (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) :
    n = ZeroCard σ ∨ ∃ k : (σ → Prop) → Prop, FiniteCardinality k ∧ n = SucCard k :=
  (hn (fun Z => FiniteCardinality Z ∧
      (Z = ZeroCard σ ∨ ∃ k : (σ → Prop) → Prop, FiniteCardinality k ∧ Z = SucCard k))
    ⟨⟨finiteCardinality_zero, Or.inl rfl⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, Or.inr ⟨Y, hY.1, rfl⟩⟩⟩).2

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

end Classicism.Proofs
