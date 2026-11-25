import Classicism.Paper
import Classicism.Background.Necessity

/-!
# Finite cardinalities and countability

The Background of `topics/classicism` defines, at a type `σ`,

    𝟎_σ                  := λX. ∀u. ¬Xu
    Suc_σ(Z)             := λX. ∃y. Xy ∧ Z(λu. Xu ∧ u ≠ y)
    FiniteCardinality_σ(Z) := ∀W. (W𝟎_σ ∧ ∀Y. WY → W(Suc_σ Y)) → WZ

so `𝟎_σ` is the cardinality of the empty property, `Suc_σ` adds one, and the finite
cardinalities are those reached from `𝟎_σ` by finitely many successors, in the
impredicative sense: they have every property of cardinalities that `𝟎_σ` has and that
passes from a cardinality to its successor. Every type here ends in `t`, so no type `σσ` is
needed. The Axioms of Infinity (`Principles.lean`) say that no finite cardinality holds of
the universal property.

Following Goodsell's *Arithmetic is Necessary*, the numbers counted at a type `σ` are its
finite cardinalities, of type `ν_σ := (σ → t) → t`, and a property `X` is countable
relative to `σ` when it injects into them:

    Ctbl_{σ,τ}(X) := ∃R^{τν_σt}. ∀y z. Xy ∧ Xz → ((∃n ∈ ℕ_σ. Ryn ∧ Rzn) ↔ y = z)

with `n ∈ ℕ_σ` for `FiniteCardinality_σ(n)`. Countable Boolean Completeness uses it, as a
schema in `σ`.

The first lemmas below are the two of the write-up for
`possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t`: finite cardinalities respect
coextension (Lemma A, `finiteCardinality_coext`), and under BF at the type a finite count is
necessary, of a property including the one counted (Lemma B, `finite_count_necessary`).

**Potential Infinity** (24 November 2026). `I*_σ`, the Peano conditions on the numbers, is
defined here, with `PotInf_σ := ∀n ∈ ℕ_σ. ◇∃X. nX`, Potential Infinity at `σ`, and the
at-least numbers `LowerNat_σ`, counted from `λX. ⊤`, with their Peano conditions `LowerPeano`.
The rest of the module is the Background's four lemmas on them:

* `finite-cardinality-arithmetic`: exchange, removal, addition, and that no proper subproperty
  has the same finite cardinality (`finiteCardinality_exchange`, `_remove`, `_add`, `_subset`);
* `numbers-with-a-common-instance`: numbers that could hold of one property are identical
  (`finiteCardinality_eq_of_dia_common`);
* `potential-infinity-forms`: `PotInf_σ ↔ I*_σ` (`iStar_of_potentialInfinity`,
  `potentialInfinity_of_iStar`), `◇PotInf_σ → PotInf_σ` (`potentialInfinity_of_dia`), and the
  Axiom of Infinity gives it (`potentialInfinity_of_axiomOfInfinity`); with BF at the type it
  gives the Axiom back (`axiomOfInfinity_of_potentialInfinity_bf`, by `finite_count_bound`);
* `at-least-numbers`: `I*_σ ↔ LowerPeano σ` (`lowerPeano_of_iStar`, `iStar_of_lowerPeano`),
  through `n ↦ n^≥` (`AtLeast`), which commutes with successor and is injective on numbers.

* `potential-infinity-and-possible-infinity` (25 November 2026): where the numbers counted at
  `t` are weakly inextensible, Potential Infinity at `t` gives Possible Infinity at `t`
  (`possibleInfinity_of_weaklyInextensible`, Goodsell's argument): the possible counts of the
  propositions are then our numbers, they are bounded if the propositions are finitely many
  (`counts_bounded`, with the comparability of numbers, `reach_comparable`), and Potential
  Infinity at the bound contradicts that.

All are theorems of `C⁻`, under the gate; the principles they serve are in
`Principles/Infinity.lean`.
-/

namespace Classicism

/-- `𝟎_σ := λX. ∀u. ¬Xu`, the cardinality of the empty property. -/
def ZeroCard (σ : Type) [Ty σ] : (σ → Prop) → Prop := λ X ↦ ∀ u, ¬ X u

/-- `Suc_σ Z := λX. ∃y. Xy ∧ Z(λu. Xu ∧ u ≠ y)`, one more than the cardinality `Z`. -/
def SucCard {σ : Type} [Ty σ] (Z : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ X ↦ ∃ y, X y ∧ Z (λ u ↦ X u ∧ u ≠ y)

/-- `FiniteCardinality_σ(Z)`: `Z` has every property of cardinalities that `𝟎_σ` has and
that passes from a cardinality to its successor. -/
def FiniteCardinality {σ : Type} [Ty σ] (Z : (σ → Prop) → Prop) : Prop :=
  ∀ W : ((σ → Prop) → Prop) → Prop, (W (ZeroCard σ) ∧ ∀ Y, W Y → W (SucCard Y)) → W Z

/-- `Ctbl_{σ,τ}(X)`: `X` injects into the natural numbers counted at `σ`, the finite
cardinalities of properties of type `σ`. -/
def Ctbl (σ : Type) [Ty σ] {τ : Type} [Ty τ] (X : τ → Prop) : Prop :=
  ∃ R : τ → ((σ → Prop) → Prop) → Prop, ∀ y z : τ, X y ∧ X z →
    ((∃ n, FiniteCardinality n ∧ R y n ∧ R z n) ↔ y = z)

/-- `I*_σ := ∀m n ∈ ℕ_σ. 𝟎_σ ≠ Suc_σ m ∧ (Suc_σ m = Suc_σ n → m = n)`: zero is not a
successor and successor is injective on numbers. -/
def IStar (σ : Type) [Ty σ] : Prop :=
  ∀ m n : (σ → Prop) → Prop, FiniteCardinality m → FiniteCardinality n →
    ZeroCard σ ≠ SucCard m ∧ (SucCard m = SucCard n → m = n)

/-- `PotInf_σ := ∀n ∈ ℕ_σ. ◇∃X. nX`, Potential Infinity at `σ`: every number counted at `σ`
possibly holds of some property, so that for each number there could be at least that many
entities of type `σ`. Equivalent in `C` to `I*_σ` (`iStar_of_potentialInfinity`,
`potentialInfinity_of_iStar`). -/
def PotInf (σ : Type) [Ty σ] : Prop :=
  ∀ n : (σ → Prop) → Prop, FiniteCardinality n → ◇ (∃ X : σ → Prop, n X)

/-- `𝟎^≥_σ := λX. ⊤`, at-least zero: it holds of every property. -/
def ZeroLower (σ : Type) [Ty σ] : (σ → Prop) → Prop := λ _ ↦ True

/-- `LowerNat_σ(Z)`: `Z` is an at-least number, reached from `𝟎^≥_σ` by finitely many
successors (Bacon's formalization of the cardinal continuum hypothesis counts with these). -/
def LowerNat {σ : Type} [Ty σ] (Z : (σ → Prop) → Prop) : Prop :=
  ∀ W : ((σ → Prop) → Prop) → Prop, (W (ZeroLower σ) ∧ ∀ Y, W Y → W (SucCard Y)) → W Z

/-- The Peano conditions on the at-least numbers (Bacon's lower-Peano conditions): at-least
zero is not a successor, and successor is injective on the at-least numbers. Equivalent in
`C` to `I*_σ` (`lowerPeano_of_iStar`, `iStar_of_lowerPeano`). -/
def LowerPeano (σ : Type) [Ty σ] : Prop :=
  ∀ m n : (σ → Prop) → Prop, LowerNat m → LowerNat n →
    ZeroLower σ ≠ SucCard m ∧ (SucCard m = SucCard n → m = n)

/-- `n^≥ := λX. ∃X' ⊆ X. nX'`, at least `n`: holding of the properties with a subproperty
that `n` holds of. -/
def AtLeast {σ : Type} [Ty σ] (n : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ X ↦ ∃ X' : σ → Prop, (∀ u, X' u → X u) ∧ n X'

/-- `Reach a b`: `b` is reached from `a` by finitely many successors, the ancestral of
`Suc`. A number is what is reached from zero. -/
def Reach {σ : Type} [Ty σ] (a b : (σ → Prop) → Prop) : Prop :=
  ∀ W : ((σ → Prop) → Prop) → Prop, (W a ∧ ∀ Y, W Y → W (SucCard Y)) → W b

section lemmas

variable {σ : Type} [Ty σ]

/-- `𝟎` is a finite cardinality. -/
theorem finiteCardinality_zero : FiniteCardinality (ZeroCard σ) := fun _ hW => hW.1

/-- The successor of a finite cardinality is one. -/
theorem finiteCardinality_suc (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    FiniteCardinality (SucCard Z) := fun W hW => hW.2 Z (hZ W hW)

/-- **Finite cardinalities respect coextension** (Lemma A): if `Z` is finite and `ZX`,
then `ZX'` for every `X'` coextensive with `X`. By the induction `FiniteCardinality`
provides; `𝟎` and `Suc` are defined by quantification over instances. -/
theorem finiteCardinality_coext (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X X' : σ → Prop, Z X → (∀ u, X u ↔ X' u) → Z X' :=
  hZ (λ Z ↦ ∀ X X' : σ → Prop, Z X → (∀ u, X u ↔ X' u) → Z X')
    ⟨fun _ _ hX h u hu => hX u ((h u).2 hu),
     fun _ hY _ _ hX h => hX.elim fun y hy =>
       ⟨y, (h y).1 hy.1, hY _ _ hy.2 fun u =>
         ⟨fun hu => ⟨(h u).1 hu.1, hu.2⟩, fun hu => ⟨(h u).2 hu.1, hu.2⟩⟩⟩⟩

/-- The step of Lemma B, a theorem of `C`: a finite cardinality of a property including `X`
less `y` gives one of a property including `X`, either the same or, with `y` added, its
successor. -/
theorem finite_superset_step (X : σ → Prop) (y : σ) :
    (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, (X u ∧ u ≠ y) → X' u) →
    ∃ Z'', FiniteCardinality Z'' ∧ ∃ X'', Z'' X'' ∧ ∀ u, X u → X'' u :=
  fun h => h.elim fun Z' hZ' => hZ'.2.elim fun X' hX' =>
    (em (X' y)).elim
      (fun hy => ⟨Z', hZ'.1, X', hX'.1, fun u hu =>
        (em (u = y)).elim (fun e => e ▸ hy) (fun ne => hX'.2 u ⟨hu, ne⟩)⟩)
      (fun hy => ⟨SucCard Z', finiteCardinality_suc Z' hZ'.1, λ u ↦ X' u ∨ u = y,
        ⟨y, Or.inr rfl, finiteCardinality_coext Z' hZ'.1 X' _ hX'.1 fun _ =>
          ⟨fun hu => ⟨Or.inl hu, fun e => hy (e ▸ hu)⟩,
           fun hu => hu.1.elim id (fun e => absurd e hu.2)⟩⟩,
        fun u hu => (em (u = y)).elim Or.inr (fun ne => Or.inl (hX'.2 u ⟨hu, ne⟩))⟩)

/-- **A finite count is necessary, under BF** (Lemma B): if a finite cardinality holds of
`X`, and what is not `X` is necessarily not `X`, then necessarily some finite cardinality
holds of a property including `X`. BF at the type is used in the base case only. -/
theorem finite_count_necessary (bf : ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x))
    (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, X u → X' u) :=
  (hZ (λ Z ↦ FiniteCardinality Z ∧ ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, X u → X' u))
    ⟨⟨finiteCardinality_zero, fun X hX hc =>
        modal_K _ _ (nec% (fun (h : ∀ u, ¬ X u) =>
          ⟨ZeroCard σ, finiteCardinality_zero, X, h, fun _ hu => hu⟩))
          (bf (λ u ↦ ¬ X u) fun u => hc u (hX u))⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun X hX hc => hX.elim fun y hy =>
       modal_K _ _ (nec% (finite_superset_step X y))
         (hY.2 _ hy.2 fun u hu => (em (X u)).elim
           (fun hXu => modal_K _ _ (nec% (fun (e : u = y) (h : X u ∧ u ≠ y) => h.2 e))
             (necessity_of_identity u y ((em (u = y)).elim id fun ne => absurd ⟨hXu, ne⟩ hu)))
           (fun hXu => modal_K _ _ (nec% (fun (h : ¬ X u) (h' : X u ∧ u ≠ y) => h h'.1)) (hc u hXu)))⟩⟩).2

/-! ### Numbers, in `C` -/

/-- **Numbers are necessarily numbers**, in `C`: the property `λn. □ℕn` holds of `𝟎`, since
`ℕ𝟎` is a theorem, and passes to successors by `K`, so every number has it. -/
theorem finiteCardinality_box (n : (σ → Prop) → Prop) :
    FiniteCardinality n → □ (FiniteCardinality n) := fun hn =>
  hn (fun Z => □ (FiniteCardinality Z))
    ⟨nec% (finiteCardinality_zero (σ := σ)),
     fun Y hY => modal_K _ _ (nec% (finiteCardinality_suc (σ := σ) Y)) hY⟩

/-- A number is zero or the successor of a number, by induction. -/
theorem finiteCardinality_zero_or_suc (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) :
    n = ZeroCard σ ∨ ∃ k : (σ → Prop) → Prop, FiniteCardinality k ∧ n = SucCard k :=
  (hn (fun Z => FiniteCardinality Z ∧
      (Z = ZeroCard σ ∨ ∃ k : (σ → Prop) → Prop, FiniteCardinality k ∧ Z = SucCard k))
    ⟨⟨finiteCardinality_zero, Or.inl rfl⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, Or.inr ⟨Y, hY.1, rfl⟩⟩⟩).2

/-! ### Exchange, removal, addition and subproperties

The Background's lemma `finite-cardinality-arithmetic`. -/

/-- **Exchange**: a finite cardinality that holds of `X` holds of `X` with an instance `a`
replaced by a non-instance `b`. By induction: if the witness of a successor is `a`, the new
witness is `b`; otherwise the witness is kept and the induction hypothesis exchanges `a` for
`b` in the rest. -/
theorem finiteCardinality_exchange (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ (X : σ → Prop) (a b : σ), X a → ¬ X b → Z X → Z (λ u ↦ (X u ∧ u ≠ a) ∨ u = b) :=
  (hZ (λ Z ↦ FiniteCardinality Z ∧
      ∀ (X : σ → Prop) (a b : σ), X a → ¬ X b → Z X → Z (λ u ↦ (X u ∧ u ≠ a) ∨ u = b))
    ⟨⟨finiteCardinality_zero, fun _ a _ ha _ h0 => absurd ha (h0 a)⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun X a b ha hb hS => hS.elim fun y hy =>
       (em (y = a)).elim
         (fun e => ⟨b, Or.inr rfl, finiteCardinality_coext Y hY.1 _ _ hy.2 fun u =>
           ⟨fun hu => ⟨Or.inl ⟨hu.1, fun eu => hu.2 (eu.trans e.symm)⟩,
              fun eb => hb (eb ▸ hu.1)⟩,
            fun hu => hu.1.elim (fun h => ⟨h.1, fun eu => h.2 (eu.trans e)⟩)
              (fun eb => absurd eb hu.2)⟩⟩)
         (fun ne => ⟨y, Or.inl ⟨hy.1, ne⟩,
           finiteCardinality_coext Y hY.1 _ _
             (hY.2 (λ u ↦ X u ∧ u ≠ y) a b ⟨ha, fun e => ne e.symm⟩ (fun h => hb h.1) hy.2)
             fun u =>
               ⟨fun hu => hu.elim (fun h => ⟨Or.inl ⟨h.1.1, h.2⟩, h.1.2⟩)
                  (fun eb => ⟨Or.inr eb, fun ey => hb ((eb.symm.trans ey) ▸ hy.1)⟩),
                fun hu => hu.1.elim (fun h => Or.inl ⟨⟨h.1, hu.2⟩, h.2⟩) Or.inr⟩⟩)⟩⟩).2

/-- **Removal**: if the successor of a finite cardinality `Z` holds of `X`, then `Z` holds of
`X` less any one of its instances. The witness is that instance, or is exchanged for it. -/
theorem finiteCardinality_remove (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z)
    (X : σ → Prop) (y : σ) : SucCard Z X → X y → Z (λ u ↦ X u ∧ u ≠ y) :=
  fun hS hy => hS.elim fun z hz =>
    (em (z = y)).elim (fun e => e ▸ hz.2)
      (fun ne => finiteCardinality_coext Z hZ _ _
        (finiteCardinality_exchange Z hZ (λ u ↦ X u ∧ u ≠ z) y z
          ⟨hy, fun e => ne e.symm⟩ (fun h => h.2 rfl) hz.2)
        fun u =>
          ⟨fun hu => hu.elim (fun h => ⟨h.1.1, h.2⟩) (fun e => e ▸ ⟨hz.1, ne⟩),
           fun hu => (em (u = z)).elim Or.inr (fun nz => Or.inl ⟨⟨hu.1, nz⟩, hu.2⟩)⟩)

/-- **Addition**: if a finite cardinality `Z` holds of `X`, its successor holds of `X` with a
non-instance added. -/
theorem finiteCardinality_add (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z)
    (X : σ → Prop) (y : σ) : Z X → ¬ X y → SucCard Z (λ u ↦ X u ∨ u = y) :=
  fun hX hy => ⟨y, Or.inr rfl, finiteCardinality_coext Z hZ X _ hX fun u =>
    ⟨fun hu => ⟨Or.inl hu, fun e => hy (e ▸ hu)⟩,
     fun hu => hu.1.elim id (fun e => absurd e hu.2)⟩⟩

/-- **No proper subproperty has the same finite cardinality**: if a finite cardinality holds
of `X` and of a subproperty `X'` of `X`, then `X` is included in `X'`. By induction, removing
a witness of `X'` from both. -/
theorem finiteCardinality_subset (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X X' : σ → Prop, Z X → Z X' → (∀ u, X' u → X u) → ∀ u, X u → X' u :=
  (hZ (λ Z ↦ FiniteCardinality Z ∧
      ∀ X X' : σ → Prop, Z X → Z X' → (∀ u, X' u → X u) → ∀ u, X u → X' u)
    ⟨⟨finiteCardinality_zero, fun _ _ h0 _ _ u hu => absurd hu (h0 u)⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun X X' hX hX' hsub u hu =>
       hX'.elim fun y hy => (em (u = y)).elim (fun e => e ▸ hy.1) fun ne =>
         (hY.2 (λ u ↦ X u ∧ u ≠ y) (λ u ↦ X' u ∧ u ≠ y)
           (finiteCardinality_remove Y hY.1 X y hX (hsub y hy.1)) hy.2
           (fun v hv => ⟨hsub v hv.1, hv.2⟩) u ⟨hu, ne⟩).1⟩⟩).2

/-! ### Numbers that could hold of one property

The Background's lemma `numbers-with-a-common-instance`. -/

/-- Zero is not a successor, in `C`: they differ at the empty property. -/
theorem zero_ne_suc (m : (σ → Prop) → Prop) : ZeroCard σ ≠ SucCard m := fun e =>
  have h0 : ZeroCard σ (λ _ ↦ False) := fun _ h => h
  have h1 : SucCard m (λ _ ↦ False) := e ▸ h0
  h1.elim fun _ hy => hy.1

/-- No property has both cardinality zero and a successor cardinality. -/
theorem not_zero_and_suc (k : (σ → Prop) → Prop) :
    ¬ ∃ X : σ → Prop, ZeroCard σ X ∧ SucCard k X :=
  fun h => h.elim fun _ hX => hX.2.elim fun y hy => hX.1 y hy.1

/-- Two successors that hold of one property are successors of cardinalities that hold of
one property, the second predecessor being finite: remove a witness of the first. -/
theorem common_pred (Y k : (σ → Prop) → Prop) (hk : FiniteCardinality k) :
    (∃ X : σ → Prop, SucCard Y X ∧ SucCard k X) → ∃ X : σ → Prop, Y X ∧ k X :=
  fun h => h.elim fun X hX => hX.1.elim fun y hy =>
    ⟨λ u ↦ X u ∧ u ≠ y, hy.2, finiteCardinality_remove k hk X y hX.2 hy.1⟩

/-- **Numbers that could hold of one property are identical**, in `C`: by induction on `m`,
and on whether `n` is zero or a successor. No assumption of infinity is used; that distinct
numbers are necessarily distinct needs `□I*`. -/
theorem finiteCardinality_eq_of_dia_common (m : (σ → Prop) → Prop) (hm : FiniteCardinality m) :
    ∀ n : (σ → Prop) → Prop, FiniteCardinality n → ◇ (∃ X : σ → Prop, m X ∧ n X) → m = n :=
  (hm (λ Z ↦ FiniteCardinality Z ∧
      ∀ n : (σ → Prop) → Prop, FiniteCardinality n → ◇ (∃ X : σ → Prop, Z X ∧ n X) → Z = n)
    ⟨⟨finiteCardinality_zero, fun n hn hd =>
        (finiteCardinality_zero_or_suc n hn).elim (fun e => e.symm)
          fun hk => hk.elim fun k hk =>
            absurd (hk.2 ▸ hd) (not_dia_of_box_not _ (nec% (not_zero_and_suc k)))⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun n hn hd =>
        (finiteCardinality_zero_or_suc n hn).elim
          (fun e => absurd (e ▸ hd) (not_dia_of_box_not _
            (nec% (fun (h : ∃ X : σ → Prop, SucCard Y X ∧ ZeroCard σ X) =>
              h.elim fun _ hX => hX.1.elim fun y hy => hX.2 y hy.1))))
          fun hk => hk.elim fun k hk => hk.2 ▸ congrArg SucCard
            (hY.2 k hk.1 (dia_mono _ _
              (modal_K _ _ (nec% (common_pred Y k)) (finiteCardinality_box k hk.1))
              (hk.2 ▸ hd)))⟩⟩).2

/-! ### The forms of Potential Infinity

The Background's lemma `potential-infinity-forms`. -/

/-- **Potential Infinity gives the Peano conditions** `I*`: a property that could have
cardinality `Suc m = Suc n` has an instance whose removal leaves a property with both
cardinalities `m` and `n`. -/
theorem iStar_of_potentialInfinity : PotInf σ → IStar σ :=
  fun hP m n hm hn => ⟨zero_ne_suc m, fun e =>
    finiteCardinality_eq_of_dia_common m hm n hn
      (dia_mono _ _
        (modal_K _ _ (modal_K _ _
          (nec% (fun (hn : FiniteCardinality n) (e : SucCard m = SucCard n)
              (h : ∃ X : σ → Prop, SucCard m X) => h.elim fun X hX => hX.elim fun y hy =>
                (⟨λ u ↦ X u ∧ u ≠ y, hy.2,
                  finiteCardinality_remove n hn X y (e ▸ hX) hy.1⟩ :
                  ∃ X : σ → Prop, m X ∧ n X)))
          (finiteCardinality_box n hn)) (necessity_of_identity _ _ e))
        (hP (SucCard m) (finiteCardinality_suc m hm)))⟩

/-- If no property has cardinality `Suc k`, none has cardinality `Suc (Suc k)`. -/
theorem not_exists_suc_suc (k : (σ → Prop) → Prop) :
    (¬ ∃ X : σ → Prop, SucCard k X) → ¬ ∃ X : σ → Prop, SucCard (SucCard k) X :=
  fun h h' => h'.elim fun X hX => hX.elim fun y hy => h ⟨λ u ↦ X u ∧ u ≠ y, hy.2⟩

/-- Cardinalities that hold of nothing are coextensive. -/
theorem coext_of_not_exists (a b : (σ → Prop) → Prop) :
    (¬ ∃ X : σ → Prop, a X) → (¬ ∃ X : σ → Prop, b X) → ∀ X : σ → Prop, a X ↔ b X :=
  fun ha hb X => ⟨fun h => absurd ⟨X, h⟩ ha, fun h => absurd ⟨X, h⟩ hb⟩

/-- **The Peano conditions give Potential Infinity**: were some number never instantiated,
the least such, `Suc k`, and its successor would be necessarily empty, hence identical by
Intensionality, so `k = Suc k` by injectivity, though `k` is possibly instantiated. -/
theorem potentialInfinity_of_iStar : IStar σ → PotInf σ :=
  fun hI n hn =>
    (hn (λ Z ↦ FiniteCardinality Z ∧ ◇ (∃ X : σ → Prop, Z X))
      ⟨⟨finiteCardinality_zero, dia_intro _ ⟨λ _ ↦ False, fun _ h => h⟩⟩,
       fun k hk => ⟨finiteCardinality_suc k hk.1,
         (em (◇ (∃ X : σ → Prop, SucCard k X))).elim id fun hnd =>
           have hb : □ (¬ ∃ X : σ → Prop, SucCard k X) := box_not_of_not_dia _ hnd
           have hb' : □ (¬ ∃ X : σ → Prop, SucCard (SucCard k) X) :=
             modal_K _ _ (nec% (not_exists_suc_suc k)) hb
           have hco : □ (∀ X : σ → Prop, SucCard k X ↔ SucCard (SucCard k) X) :=
             modal_K _ _ (modal_K _ _
               (nec% (coext_of_not_exists (SucCard k) (SucCard (SucCard k)))) hb) hb'
           have e : SucCard k = SucCard (SucCard k) := intensionality _ _ hco
           have ek : k = SucCard k :=
             (hI k (SucCard k) hk.1 (finiteCardinality_suc k hk.1)).2 e
           absurd (Eq.mp (congrArg (fun z : (σ → Prop) → Prop => ◇ (∃ X : σ → Prop, z X)) ek)
             hk.2) hnd⟩⟩).2

/-- **Potential Infinity is true if possible**, in `C`: a number never instantiated is
necessarily a number that is never instantiated, by `4`. -/
theorem potentialInfinity_of_dia : ◇ (PotInf σ) → PotInf σ :=
  fun hd n hn => (em (◇ (∃ X : σ → Prop, n X))).elim id fun hnd =>
    absurd hd (not_dia_of_box_not _
      (modal_K _ _ (modal_K _ _
        (nec% (fun (hn : FiniteCardinality n) (hb : □ (¬ ∃ X : σ → Prop, n X))
            (hP : PotInf σ) => not_dia_of_box_not _ hb (hP n hn)))
        (finiteCardinality_box n hn)) (modal_four _ (box_not_of_not_dia _ hnd))))

/-- **The Axiom of Infinity gives Potential Infinity**: every number holds of some property,
a property that a number holds of not being universal. The Axiom is stated unfolded, the
principles being defined after this module. -/
theorem potentialInfinity_of_axiomOfInfinity :
    (¬ ∃ Z : (σ → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) → PotInf σ :=
  fun hA n hn => dia_intro _
    (hn (λ Z ↦ FiniteCardinality Z ∧ ∃ X : σ → Prop, Z X)
      ⟨⟨finiteCardinality_zero, λ _ ↦ False, fun _ h => h⟩,
       fun k hk => ⟨finiteCardinality_suc k hk.1, hk.2.elim fun X hX =>
         (em (∃ y, ¬ X y)).elim
           (fun h => h.elim fun y hy => ⟨λ u ↦ X u ∨ u = y, finiteCardinality_add k hk.1 X y hX hy⟩)
           (fun h => absurd ⟨k, hk.1, finiteCardinality_coext k hk.1 X _ hX fun u =>
             ⟨fun _ => trivial, fun _ => (em (X u)).elim id fun hu => absurd ⟨u, hu⟩ h⟩⟩ hA)⟩⟩).2

/-! ### Potential Infinity and BF -/

/-- The step of the bound under BF: if no subproperty of `X` less `y` has cardinality
`Suc Y`, no subproperty of `X` has cardinality `Suc (Suc Y)`. -/
theorem bound_step (Y : (σ → Prop) → Prop) (X : σ → Prop) (y : σ) (hY : FiniteCardinality Y) :
    (∀ X'' : σ → Prop, (∀ u, X'' u → X u ∧ u ≠ y) → ¬ SucCard Y X'') →
    ∀ X'' : σ → Prop, (∀ u, X'' u → X u) → ¬ SucCard (SucCard Y) X'' :=
  fun h X'' hsub hS => (em (X'' y)).elim
    (fun hy => h (λ u ↦ X'' u ∧ u ≠ y) (fun u hu => ⟨hsub u hu.1, hu.2⟩)
      (finiteCardinality_remove (SucCard Y) (finiteCardinality_suc Y hY) X'' y hS hy))
    (fun hy => hS.elim fun z hz => h (λ u ↦ X'' u ∧ u ≠ z)
      (fun u hu => ⟨hsub u hu.1, fun e => hy (e ▸ hu.1)⟩) hz.2)

/-- **A finite count is a necessary bound, under BF**: if a finite cardinality `Z` holds of
`X`, and what is not `X` is necessarily not `X`, then necessarily no subproperty of `X` has
cardinality `Suc Z`. As in `finite_count_necessary`, BF at the type is used in the base case
only; here the count is shown not to grow. -/
theorem finite_count_bound (bf : ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x))
    (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∀ X'' : σ → Prop, (∀ u, X'' u → X u) → ¬ SucCard Z X'') :=
  (hZ (λ Z ↦ FiniteCardinality Z ∧ ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∀ X'' : σ → Prop, (∀ u, X'' u → X u) → ¬ SucCard Z X''))
    ⟨⟨finiteCardinality_zero, fun X hX hc =>
        modal_K _ _ (nec% (fun (h : ∀ u, ¬ X u) (X'' : σ → Prop) (hsub : ∀ u, X'' u → X u)
            (hS : SucCard (ZeroCard σ) X'') => hS.elim fun y hy => h y (hsub y hy.1)))
          (bf (λ u ↦ ¬ X u) fun u => hc u (hX u))⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun X hX hc => hX.elim fun y hy =>
       modal_K _ _ (modal_K _ _ (nec% (bound_step Y X y)) (finiteCardinality_box Y hY.1))
         (hY.2 _ hy.2 fun u hu => (em (X u)).elim
           (fun hXu => modal_K _ _ (nec% (fun (e : u = y) (h : X u ∧ u ≠ y) => h.2 e))
             (necessity_of_identity u y ((em (u = y)).elim id fun ne => absurd ⟨hXu, ne⟩ hu)))
           (fun hXu => modal_K _ _ (nec% (fun (h : ¬ X u) (h' : X u ∧ u ≠ y) => h h'.1)) (hc u hXu)))⟩⟩).2

/-- **Potential Infinity and BF at a type give the Axiom of Infinity there**: were a number
`Z` to hold of the universal property, necessarily no property would have cardinality
`Suc Z`, against Potential Infinity at that number. -/
theorem axiomOfInfinity_of_potentialInfinity_bf
    (bf : ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x)) :
    PotInf σ → ¬ ∃ Z : (σ → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True) :=
  fun hP h => h.elim fun Z hZ =>
    not_dia_of_box_not _
      (modal_K _ _ (nec% (fun (h : ∀ X'' : σ → Prop, (∀ u, X'' u → True) → ¬ SucCard Z X'')
          (h' : ∃ X : σ → Prop, SucCard Z X) => h'.elim fun X hX => h X (fun _ _ => trivial) hX))
        (finite_count_bound bf Z hZ.1 _ hZ.2 fun _ h => absurd trivial h))
      (hP (SucCard Z) (finiteCardinality_suc Z hZ.1))

/-! ### The at-least numbers

The Background's lemma `at-least-numbers`: the Peano conditions on the at-least numbers are
those on the numbers. -/

/-- At-least zero is an at-least number. -/
theorem lowerNat_zero : LowerNat (ZeroLower σ) := fun _ hW => hW.1

/-- The successor of an at-least number is one. -/
theorem lowerNat_suc (Z : (σ → Prop) → Prop) (hZ : LowerNat Z) : LowerNat (SucCard Z) :=
  fun W hW => hW.2 Z (hZ W hW)

/-- At least zero is at-least zero: every property has an empty subproperty. -/
theorem atLeast_zero : AtLeast (ZeroCard σ) = ZeroLower σ :=
  intensionality _ _ (nec% (fun (X : σ → Prop) =>
    (⟨fun _ => trivial, fun _ => ⟨λ _ ↦ False, fun _ h => h.elim, fun _ h => h⟩⟩ :
      AtLeast (ZeroCard σ) X ↔ ZeroLower σ X)))

/-- At least `Suc n` is the successor of at least `n`, pointwise, for a finite `n`. -/
theorem atLeast_suc_iff (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) (X : σ → Prop) :
    AtLeast (SucCard n) X ↔ SucCard (AtLeast n) X :=
  ⟨fun h => h.elim fun X' hX' => hX'.2.elim fun y hy =>
     ⟨y, hX'.1 y hy.1, λ u ↦ X' u ∧ u ≠ y, fun u hu => ⟨hX'.1 u hu.1, hu.2⟩, hy.2⟩,
   fun h => h.elim fun y hy => hy.2.elim fun X' hX' =>
     ⟨λ u ↦ X' u ∨ u = y, fun u hu => hu.elim (fun h => (hX'.1 u h).1) (fun e => e ▸ hy.1),
      finiteCardinality_add n hn X' y hX'.2 (fun h => (hX'.1 y h).2 rfl)⟩⟩

/-- At least `Suc n` is the successor of at least `n`, by Intensionality. -/
theorem atLeast_suc (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) :
    AtLeast (SucCard n) = SucCard (AtLeast n) :=
  intensionality _ _ (modal_K _ _ (nec% (atLeast_suc_iff n)) (finiteCardinality_box n hn))

/-- At least a number is an at-least number. -/
theorem lowerNat_atLeast (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) :
    LowerNat (AtLeast n) :=
  (hn (λ Z ↦ FiniteCardinality Z ∧ LowerNat (AtLeast Z))
    ⟨⟨finiteCardinality_zero, atLeast_zero (σ := σ) ▸ lowerNat_zero⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1,
       atLeast_suc Y hY.1 ▸ lowerNat_suc (AtLeast Y) hY.2⟩⟩).2

/-- Every at-least number is at least a number. -/
theorem lowerNat_eq_atLeast (a : (σ → Prop) → Prop) (ha : LowerNat a) :
    ∃ n : (σ → Prop) → Prop, FiniteCardinality n ∧ a = AtLeast n :=
  ha (λ Z ↦ ∃ n : (σ → Prop) → Prop, FiniteCardinality n ∧ Z = AtLeast n)
    ⟨⟨ZeroCard σ, finiteCardinality_zero, atLeast_zero.symm⟩,
     fun _ hY => hY.elim fun n hn =>
       ⟨SucCard n, finiteCardinality_suc n hn.1, hn.2 ▸ (atLeast_suc n hn.1).symm⟩⟩

/-- Exactly `n` is at least `n` and not at least its successor, for a number `n`. -/
theorem exact_iff (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) (X : σ → Prop) :
    n X ↔ (AtLeast n X ∧ ¬ SucCard (AtLeast n) X) :=
  ⟨fun hX => ⟨⟨X, fun _ h => h, hX⟩, fun h => h.elim fun y hy => hy.2.elim fun X' hX' =>
     (hX'.1 y (finiteCardinality_subset n hn X X' hX hX'.2 (fun u hu => (hX'.1 u hu).1) y hy.1)).2 rfl⟩,
   fun h => h.1.elim fun X' hX' => (em (∃ y, X y ∧ ¬ X' y)).elim
     (fun hy => hy.elim fun y hy => absurd
       ⟨y, hy.1, X', fun u hu => ⟨hX'.1 u hu, fun e => hy.2 (e ▸ hu)⟩, hX'.2⟩ h.2)
     (fun hno => finiteCardinality_coext n hn X' X hX'.2 fun u =>
       ⟨hX'.1 u, fun hu => (em (X' u)).elim id fun hnu => absurd ⟨u, hu, hnu⟩ hno⟩)⟩

/-- Numbers with the same at-least number are coextensive. -/
theorem coext_of_atLeast_eq (m n : (σ → Prop) → Prop) (hm : FiniteCardinality m)
    (hn : FiniteCardinality n) (e : AtLeast m = AtLeast n) : ∀ X : σ → Prop, m X ↔ n X :=
  fun X => ⟨fun h => (exact_iff n hn X).2 (e ▸ (exact_iff m hm X).1 h),
            fun h => (exact_iff m hm X).2 (e ▸ (exact_iff n hn X).1 h)⟩

/-- `AtLeast` is injective on the numbers, by Intensionality. -/
theorem atLeast_inj (m n : (σ → Prop) → Prop) (hm : FiniteCardinality m)
    (hn : FiniteCardinality n) : AtLeast m = AtLeast n → m = n := fun e =>
  intensionality _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _ (nec% (coext_of_atLeast_eq m n))
    (finiteCardinality_box m hm)) (finiteCardinality_box n hn))
    (necessity_of_identity _ _ e))

/-- **The Peano conditions on the numbers give them on the at-least numbers.** -/
theorem lowerPeano_of_iStar : IStar σ → LowerPeano σ := fun hI a b ha hb =>
  ⟨fun e =>
     have h1 : SucCard a (λ _ ↦ False) := e ▸ (trivial : ZeroLower σ (λ _ ↦ False))
     h1.elim fun _ hy => hy.1,
   fun e => (lowerNat_eq_atLeast a ha).elim fun m hm => (lowerNat_eq_atLeast b hb).elim fun n hn =>
     have e' : SucCard (AtLeast m) = SucCard (AtLeast n) := hm.2 ▸ hn.2 ▸ e
     have e'' : AtLeast (SucCard m) = AtLeast (SucCard n) :=
       (atLeast_suc m hm.1).trans (e'.trans (atLeast_suc n hn.1).symm)
     have emn : m = n := (hI m n hm.1 hn.1).2
       (atLeast_inj _ _ (finiteCardinality_suc m hm.1) (finiteCardinality_suc n hn.1) e'')
     hm.2.trans ((congrArg AtLeast emn).trans hn.2.symm)⟩

/-- **And conversely.** -/
theorem iStar_of_lowerPeano : LowerPeano σ → IStar σ := fun hL m n hm hn =>
  ⟨zero_ne_suc m, fun e =>
    atLeast_inj m n hm hn ((hL (AtLeast m) (AtLeast n) (lowerNat_atLeast m hm)
      (lowerNat_atLeast n hn)).2
      ((atLeast_suc m hm).symm.trans ((congrArg AtLeast e).trans (atLeast_suc n hn))))⟩

/-! ### The order of the numbers

Reachability by successors, for the Background's lemma
`potential-infinity-and-possible-infinity`. -/


theorem reach_refl (a : (σ → Prop) → Prop) : Reach a a := fun _ hW => hW.1

theorem reach_suc (a b : (σ → Prop) → Prop) : Reach a b → Reach a (SucCard b) :=
  fun h W hW => hW.2 b (h W hW)

theorem reach_trans (a b c : (σ → Prop) → Prop) : Reach a b → Reach b c → Reach a c :=
  fun hab hbc W hW => hbc W ⟨hab W hW, hW.2⟩

/-- Reachability is necessary if true: by the induction it provides, as for numbers. -/
theorem reach_box (a b : (σ → Prop) → Prop) : Reach a b → □ (Reach a b) := fun h =>
  h (fun Z => □ (Reach a Z))
    ⟨nec% (reach_refl a), fun Y hY => modal_K _ _ (nec% (reach_suc a Y)) hY⟩

/-- What is reached from `a` is `a` or is reached from its successor. -/
theorem reach_eq_or_suc (a b : (σ → Prop) → Prop) :
    Reach a b → b = a ∨ Reach (SucCard a) b := fun h =>
  h (fun Z => Z = a ∨ Reach (SucCard a) Z)
    ⟨Or.inl rfl, fun Y hY => Or.inr (hY.elim (fun e => e ▸ reach_refl (SucCard a))
      (fun h' => reach_suc _ _ h'))⟩

/-- **Numbers are comparable**: of two numbers, one is reached from the other. No
assumption of infinity is used. -/
theorem reach_comparable (a : (σ → Prop) → Prop) (ha : FiniteCardinality a) :
    ∀ c : (σ → Prop) → Prop, FiniteCardinality c → Reach a c ∨ Reach c a :=
  (ha (λ Z ↦ FiniteCardinality Z ∧
      ∀ c : (σ → Prop) → Prop, FiniteCardinality c → Reach Z c ∨ Reach c Z)
    ⟨⟨finiteCardinality_zero, fun _ hc => Or.inl hc⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun c hc => (hY.2 c hc).elim
       (fun h => (reach_eq_or_suc Y c h).elim
         (fun e => Or.inr (e ▸ reach_suc Y Y (reach_refl Y)))
         Or.inl)
       (fun h => Or.inr (reach_suc c Y h))⟩⟩).2

/-- A property with a cardinality reached from `a` has a subproperty with cardinality `a`. -/
theorem reach_sub (a b : (σ → Prop) → Prop) : Reach a b →
    ∀ X : σ → Prop, b X → ∃ X' : σ → Prop, (∀ u, X' u → X u) ∧ a X' := fun h =>
  h (λ Z ↦ ∀ X : σ → Prop, Z X → ∃ X' : σ → Prop, (∀ u, X' u → X u) ∧ a X')
    ⟨fun X hX => ⟨X, fun _ hu => hu, hX⟩,
     fun _ hY X hX => hX.elim fun _ hy => (hY _ hy.2).elim fun X' hX' =>
       ⟨X', fun u hu => (hX'.1 u hu).1, hX'.2⟩⟩

/-- No subproperty of a property with a finite cardinality has its successor. -/
theorem not_suc_of_sub (n : (σ → Prop) → Prop) (hn : FiniteCardinality n) (X X' : σ → Prop) :
    n X → (∀ u, X' u → X u) → ¬ SucCard n X' := fun hX hsub hS =>
  hS.elim fun y hy =>
    (finiteCardinality_subset n hn X (λ u ↦ X' u ∧ u ≠ y) hX hy.2
      (fun u hu => hsub u hu.1) y (hsub y hy.1)).2 rfl

/-- Numbers that could count the universal property, and for which that it has that number
is one proposition, are identical. -/
theorem count_eq (n s : (σ → Prop) → Prop) (hn : FiniteCardinality n)
    (hs : FiniteCardinality s) :
    ◇ (n (λ _ ↦ True)) → n (λ _ ↦ True) = s (λ _ ↦ True) → n = s := fun hd e =>
  finiteCardinality_eq_of_dia_common n hn s hs
    (dia_mono _ _ (nec% (fun (h : n (λ _ ↦ True) ∧ s (λ _ ↦ True)) =>
        (⟨λ _ ↦ True, h.1, h.2⟩ : ∃ X : σ → Prop, n X ∧ s X)))
      (Eq.mp (congrArg (fun q : Prop => ◇ (n (λ _ ↦ True) ∧ q)) e)
        (dia_mono _ _ (nec% (fun (h : n (λ _ ↦ True)) =>
          (⟨h, h⟩ : n (λ _ ↦ True) ∧ n (λ _ ↦ True)))) hd)))

end lemmas

/-! ### Weakly inextensible numbers: Potential Infinity gives Possible Infinity at `t` -/

/-- **The possible counts of the propositions are bounded, if the propositions are
finitely many.** For a property `Y` of propositions with a finite cardinality `j`, some
number is reached from the successor of every number `n` such that the propositions could
be exactly `n` and that they are is an instance of `Y`. By induction on `j`: the propositions
`there are exactly n propositions`, for possible counts `n`, are pairwise distinct
(`count_eq`), so removing one instance of `Y` removes at most one count, and numbers are
comparable. -/
theorem counts_bounded (j : (Prop → Prop) → Prop) (hj : FiniteCardinality j) :
    ∀ Y : Prop → Prop, j Y →
      ∃ b : (Prop → Prop) → Prop, FiniteCardinality b ∧
        ∀ n : (Prop → Prop) → Prop, FiniteCardinality n → ◇ (n (λ _ ↦ True)) →
          Y (n (λ _ ↦ True)) → Reach (SucCard n) b :=
  (hj (λ j ↦ FiniteCardinality j ∧ ∀ Y : Prop → Prop, j Y →
      ∃ b : (Prop → Prop) → Prop, FiniteCardinality b ∧
        ∀ n : (Prop → Prop) → Prop, FiniteCardinality n → ◇ (n (λ _ ↦ True)) →
          Y (n (λ _ ↦ True)) → Reach (SucCard n) b)
    ⟨⟨finiteCardinality_zero, fun _ h0 => ⟨ZeroCard Prop, finiteCardinality_zero,
        fun _ _ _ hY => absurd hY (h0 _)⟩⟩,
     fun j' hj' => ⟨finiteCardinality_suc j' hj'.1, fun Y hS => hS.elim fun p hp =>
       (hj'.2 _ hp.2).elim fun b' hb' =>
         (em (∃ s : (Prop → Prop) → Prop, FiniteCardinality s ∧ ◇ (s (λ _ ↦ True)) ∧
             p = s (λ _ ↦ True))).elim
           (fun hs => hs.elim fun s hs =>
             (reach_comparable b' hb'.1 (SucCard s) (finiteCardinality_suc s hs.1)).elim
               (fun h1 => ⟨SucCard s, finiteCardinality_suc s hs.1, fun n hn hd hY =>
                 (em (n (λ _ ↦ True) = p)).elim
                   (fun e => (count_eq n s hn hs.1 hd (e.trans hs.2.2)) ▸
                     reach_refl (SucCard s))
                   (fun ne => reach_trans _ _ _ (hb'.2 n hn hd ⟨hY, ne⟩) h1)⟩)
               (fun h2 => ⟨b', hb'.1, fun n hn hd hY =>
                 (em (n (λ _ ↦ True) = p)).elim
                   (fun e => (count_eq n s hn hs.1 hd (e.trans hs.2.2)) ▸ h2)
                   (fun ne => hb'.2 n hn hd ⟨hY, ne⟩)⟩))
           (fun hno => ⟨b', hb'.1, fun n hn hd hY =>
             hb'.2 n hn hd ⟨hY, fun e => hno ⟨n, hn, hd, e.symm⟩⟩⟩)⟩⟩).2

/-- **Weakly inextensible numbers and Potential Infinity at `t` give Possible Infinity at
`t`** (Goodsell's argument). Were every world to have finitely many propositions, each
possible count would be one of our numbers, by weak inextensibility; the possible counts
would be bounded, by `counts_bounded` at our finitely many propositions; and Potential
Infinity at the bound would give a possible count below it at a world with at least that
many propositions. Weak inextensibility is stated unfolded:
`WeaklyInextensible (FiniteCardinality (σ := Prop))`. -/
theorem possibleInfinity_of_weaklyInextensible
    (wi : ∀ X : ((Prop → Prop) → Prop) → Prop,
      (∀ n, FiniteCardinality n → □ (X n)) → □ (∀ n, FiniteCardinality n → X n)) :
    PotInf Prop →
      ◇ (¬ ∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) :=
  fun hP =>
    (em (◇ (¬ ∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)))).elim id
      fun hnd =>
    have hfin : □ (∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) :=
      modal_K _ _
        (nec% (fun (h : ¬ ¬ ∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) =>
          (em (∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True))).elim id
            (fun h' => absurd h' h)))
        (box_not_of_not_dia _ hnd)
    (box_elim hfin).elim fun n0 hn0 =>
      (counts_bounded n0 hn0.1 (λ _ ↦ True) hn0.2).elim fun b hb =>
        have h1 : ◇ ((∃ X : Prop → Prop, b X) ∧
            ∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) :=
          dia_and_of_dia_box _ _ (hP b hb.1) hfin
        (em (∃ n : (Prop → Prop) → Prop, FiniteCardinality n ∧
            ◇ (n (λ _ ↦ True) ∧ ∃ X : Prop → Prop, b X))).elim
          (fun hn => hn.elim fun n hn =>
            have hreach : □ (Reach (SucCard n) b) := reach_box _ _
              (hb.2 n hn.1
                (dia_mono _ _ (nec% (fun (h : n (λ _ ↦ True) ∧ ∃ X : Prop → Prop, b X) => h.1))
                  hn.2) trivial)
            absurd hn.2 (not_dia_of_box_not _ (modal_K _ _ (modal_K _ _
              (nec% (fun (hn : FiniteCardinality n) (hr : Reach (SucCard n) b)
                  (h : n (λ _ ↦ True) ∧ ∃ X : Prop → Prop, b X) => h.2.elim fun X hX =>
                    (reach_sub _ _ hr X hX).elim fun X' hX' =>
                      not_suc_of_sub n hn (λ _ ↦ True) X' h.1 (fun _ _ => trivial) hX'.2))
              (finiteCardinality_box n hn.1)) hreach)))
          (fun hno => absurd h1 (not_dia_of_box_not _ (modal_K _ _
            (nec% (fun (h : ∀ n : (Prop → Prop) → Prop, FiniteCardinality n →
                  ¬ (n (λ _ ↦ True) ∧ ∃ X : Prop → Prop, b X))
                (h' : (∃ X : Prop → Prop, b X) ∧
                  ∃ Z : (Prop → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)) =>
                  h'.2.elim fun Z hZ => h Z hZ.1 ⟨hZ.2, h'.1⟩))
            (wi (λ n ↦ ¬ (n (λ _ ↦ True) ∧ ∃ X : Prop → Prop, b X)) fun n hn =>
              box_not_of_not_dia _ (fun hd => hno ⟨n, hn, hd⟩)))))

end Classicism
