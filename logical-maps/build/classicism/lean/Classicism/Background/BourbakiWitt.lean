import Classicism.Background.Relations

/-!
# Background: the Bourbaki–Witt lemma

The lemmas `#bourbaki-witt` and `#bourbaki-witt-admissible` of the Background page
*Relations, orders and fixed points*, at a type parameter `σ` (any type, `e` included).

The Background proves the lemma first without a restrictor and leaves the admissible variant,
whose closure clause for suprema and whose tower are restricted by a property `𝒜` of
properties, to the reader. Here the general, restrictor-carrying form is proved once
(`bw_closed`, `bw_comparable`, `bw_sup`, packaged as `bourbaki_witt_admissible`), and the
Background's two lemmas are its corollaries:

* `bourbaki_witt_admissible`: the lemma for admissible chains, as the Background states it;
* `bourbaki_witt`: the original lemma, the case `𝒜 := λZ. ⊤`, with its own definitions of
  *closed* and of the tower (`Closed₀`, `Tower₀`), which are coextensive with the general ones
  at that `𝒜`;
* `bourbaki_witt_partial`: the special case of partial orders, where `≈` is identity on `X`
  and invariance is automatic, giving an `m` in `X` with `(Fm)m`; it is stated for any
  restrictor, since the uses at partial orders need the tower facts too.

Everything is at the evaluation point and unboxed: no modal reasoning, no choice, only `H`.
The proof is cut into the Background's steps — (a), Claim 1, Claim 2, (b), (c) — each a closed
lemma, so that the translator derives each once.

Reflexivity of `R` on `X` (the Background's hypothesis 1) is not needed for (a)–(c): the
general lemma omits it, and the corollaries keep it so as to state the Background's lemma as
written.
-/

set_option linter.unusedSectionVars false

namespace Classicism.BW

variable {σ : Type} [Ty σ]

/-! ### The vocabulary -/

/-- `Total(R, Z)`: any two instances of `Z` are `R`-comparable. -/
def TotalOn (R : σ → σ → Prop) (Z : σ → Prop) : Prop := ∀ x y, Z x → Z y → R x y ∨ R y x

/-- `UB(s, Z) := Xs ∧ ∀z. Zz → z ≼ s`. -/
def UBIn (X : σ → Prop) (R : σ → σ → Prop) (s : σ) (Z : σ → Prop) : Prop :=
  X s ∧ ∀ z, Z z → R z s

/-- `Sup(s, Z) := UB(s, Z) ∧ ∀u. UB(u, Z) → s ≼ u`. -/
def SupIn (X : σ → Prop) (R : σ → σ → Prop) (s : σ) (Z : σ → Prop) : Prop :=
  UBIn X R s Z ∧ ∀ u, UBIn X R u Z → R s u

/-- `Y` is *closed*: `Y ⊆ X`, closed under `F`, and under suprema of admissible chains. -/
def Closed (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop) (Y : σ → Prop) : Prop :=
  (∀ x, Y x → X x) ∧ (∀ x y, Y x → F x y → Y y) ∧
    ∀ Z s, 𝒜 Z → (∀ z, Z z → Y z) → TotalOn R Z → SupIn X R s Z → Y s

/-- The tower `M := λx. ∀Y. 𝒜Y ∧ Closed(Y) → Yx`. -/
def Tower (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop) : σ → Prop :=
  λ x ↦ ∀ Y, 𝒜 Y → Closed 𝒜 X R F Y → Y x

/-- `c` is a *pivot*: `Mc ∧ ∀b d. Mb ∧ b ≺ c ∧ (Fb)d → d ≼ c`, with `b ≺ c := b ≼ c ∧ ¬ c ≼ b`. -/
def Pivot (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop) : σ → Prop :=
  λ c ↦ Tower 𝒜 X R F c ∧ ∀ b d, Tower 𝒜 X R F b → R b c → ¬ R c b → F b d → R d c

/-- Claim 1's `M_{c,e} := λb. Mb ∧ (b ≼ c ∨ e ≼ b)`. -/
def Mce (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop) (c e : σ) : σ → Prop :=
  λ b ↦ Tower 𝒜 X R F b ∧ (R b c ∨ R e b)

/-- `Y` is coextensive with an admissible property. -/
def Admits (𝒜 : (σ → Prop) → Prop) (Y : σ → Prop) : Prop := ∃ Y', 𝒜 Y' ∧ ∀ x, Y' x ↔ Y x

/-! ### Closedness and suprema depend only on extensions -/

theorem totalOn_coext (R : σ → σ → Prop) (Z Z' : σ → Prop) (e : ∀ x, Z' x ↔ Z x)
    (h : TotalOn R Z) : TotalOn R Z' :=
  fun x y hx hy => h x y ((e x).1 hx) ((e y).1 hy)

theorem supIn_coext (X : σ → Prop) (R : σ → σ → Prop) (s : σ) (Z Z' : σ → Prop)
    (e : ∀ x, Z' x ↔ Z x) (h : SupIn X R s Z) : SupIn X R s Z' :=
  ⟨⟨h.1.1, fun z hz => h.1.2 z ((e z).1 hz)⟩,
   fun u hu => h.2 u ⟨hu.1, fun z hz => hu.2 z ((e z).2 hz)⟩⟩

theorem closed_coext (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (Y Y' : σ → Prop) (e : ∀ x, Y' x ↔ Y x) (h : Closed 𝒜 X R F Y) : Closed 𝒜 X R F Y' :=
  ⟨fun x hx => h.1 x ((e x).1 hx),
   fun x y hx hxy => (e y).2 (h.2.1 x y ((e x).1 hx) hxy),
   fun Z s hA hZ hT hs => (e s).2 (h.2.2 Z s hA (fun z hz => (e z).1 (hZ z hz)) hT hs)⟩

/-! ### (a) The tower is closed, and the least closed property -/

/-- `X` itself is closed, given that `F` maps `X` into `X`. -/
theorem closed_X (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (hF : ∀ x y, X x → F x y → X y) : Closed 𝒜 X R F X :=
  ⟨fun _ hx => hx, hF, fun _ _ _ _ _ hs => hs.1.1⟩

/-- Tower induction: a closed property coextensive with an admissible one includes the tower. -/
theorem tower_sub (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (Y : σ → Prop) (hA : Admits 𝒜 Y) (hY : Closed 𝒜 X R F Y) :
    ∀ x, Tower 𝒜 X R F x → Y x :=
  fun x hx => hA.elim fun Y' hY' =>
    (hY'.2 x).1 (hx Y' hY'.1 (closed_coext 𝒜 X R F Y Y' hY'.2 hY))

/-- (a): the tower is closed. -/
theorem bw_closed (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (hF : ∀ x y, X x → F x y → X y) (hAX : Admits 𝒜 X) : Closed 𝒜 X R F (Tower 𝒜 X R F) :=
  ⟨tower_sub 𝒜 X R F X hAX (closed_X 𝒜 X R F hF),
   fun x y hx hxy Y hA hY => hY.2.1 x y (hx Y hA hY) hxy,
   fun Z s hAZ hZ hT hs Y hA hY => hY.2.2 Z s hAZ (fun z hz => hZ z hz Y hA hY) hT hs⟩

/-- (a): the tower is included in every admissible closed property. -/
theorem bw_least (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (Y : σ → Prop) (hA : 𝒜 Y) (hY : Closed 𝒜 X R F Y) : ∀ x, Tower 𝒜 X R F x → Y x :=
  fun _ hx => hx Y hA hY

/-! ### Claim 1 -/

/-- `M_{c,e}` is closed under `F`, for a pivot `c` and `(Fc)e`. -/
theorem mce_step (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (c e : σ) (hc : Pivot 𝒜 X R F c) (hce : F c e) :
    ∀ b d, Mce 𝒜 X R F c e b → F b d → Mce 𝒜 X R F c e d := by
  intro b d hb hbd
  have hM := bw_closed 𝒜 X R F hF hAX
  have Xb := hM.1 b hb.1
  have Xc := hM.1 c hc.1
  have Xd := hF b d Xb hbd
  have Xe := hF c e Xc hce
  refine ⟨hM.2.1 b d hb.1 hbd, ?_⟩
  rcases hb.2 with hbc | heb
  · rcases em (R c b) with hcb | hcb
    · exact Or.inr (hinv b c d e Xb Xc hbc hcb hbd hce).2
    · exact Or.inl (hc.2 b d hb.1 hbc hcb hbd)
  · exact Or.inr (htrans e b d Xe Xb Xd heb (hprog b d Xb hbd))

/-- `M_{c,e}` is closed under suprema of admissible chains. -/
theorem mce_sup (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hAX : Admits 𝒜 X) (c e : σ) (hc : Pivot 𝒜 X R F c) (hce : F c e) :
    ∀ Z s, 𝒜 Z → (∀ z, Z z → Mce 𝒜 X R F c e z) → TotalOn R Z → SupIn X R s Z →
      Mce 𝒜 X R F c e s := by
  intro Z s hAZ hZ hT hs
  have hM := bw_closed 𝒜 X R F hF hAX
  refine ⟨hM.2.2 Z s hAZ (fun z hz => (hZ z hz).1) hT hs, ?_⟩
  rcases em (∃ z, Z z ∧ R e z) with hz | hz
  · obtain ⟨z, hZz, hez⟩ := hz
    have Xz := hM.1 z (hZ z hZz).1
    have Xe := hF c e (hM.1 c hc.1) hce
    exact Or.inr (htrans e z s Xe Xz hs.1.1 hez (hs.1.2 z hZz))
  · refine Or.inl (hs.2 c ⟨hM.1 c hc.1, fun z hZz => ?_⟩)
    rcases (hZ z hZz).2 with hzc | hez
    · exact hzc
    · exact (hz ⟨z, hZz, hez⟩).elim

/-- **Claim 1.** For a pivot `c` and `(Fc)e`, every member `b` of the tower has `b ≼ c` or
`e ≼ b`. -/
theorem claim1 (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X)
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e))
    (c e : σ) (hc : Pivot 𝒜 X R F c) (hce : F c e) :
    ∀ b, Tower 𝒜 X R F b → R b c ∨ R e b :=
  fun b hb => (tower_sub 𝒜 X R F (Mce 𝒜 X R F c e) (hAM c e hc hce)
    ⟨fun x hx => (bw_closed 𝒜 X R F hF hAX).1 x hx.1,
     mce_step 𝒜 X R F htrans hF hprog hinv hAX c e hc hce,
     mce_sup 𝒜 X R F htrans hF hAX c e hc hce⟩ b hb).2

/-! ### Claim 2 -/

/-- The pivots are closed under `F`. -/
theorem pivot_step (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X)
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ c e, Pivot 𝒜 X R F c → F c e → Pivot 𝒜 X R F e := by
  intro c e hc hce
  have hM := bw_closed 𝒜 X R F hF hAX
  refine ⟨hM.2.1 c e hc.1 hce, ?_⟩
  intro b d hb hbe heb hbd
  have Xb := hM.1 b hb
  have Xc := hM.1 c hc.1
  have Xd := hF b d Xb hbd
  have Xe := hF c e Xc hce
  rcases claim1 𝒜 X R F htrans hF hprog hinv hAX hAM c e hc hce b hb with hbc | heb'
  · rcases em (R c b) with hcb | hcb
    · exact (hinv b c d e Xb Xc hbc hcb hbd hce).1
    · exact htrans d c e Xd Xc Xe (hc.2 b d hb hbc hcb hbd) (hprog c e Xc hce)
  · exact (heb heb').elim

/-- The pivots are closed under suprema of admissible chains. -/
theorem pivot_sup (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X)
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ Z s, 𝒜 Z → (∀ z, Z z → Pivot 𝒜 X R F z) → TotalOn R Z → SupIn X R s Z →
      Pivot 𝒜 X R F s := by
  intro Z s hAZ hZ hT hs
  have hM := bw_closed 𝒜 X R F hF hAX
  refine ⟨hM.2.2 Z s hAZ (fun z hz => (hZ z hz).1) hT hs, ?_⟩
  intro b d hb hbs hsb hbd
  have Xb := hM.1 b hb
  have Xd := hF b d Xb hbd
  rcases em (∃ z, Z z ∧ ¬ R z b) with hz | hz
  · obtain ⟨z, hZz, hzb⟩ := hz
    have Xz := hM.1 z (hZ z hZz).1
    obtain ⟨e, hze⟩ := hser z Xz
    have Xe := hF z e Xz hze
    rcases claim1 𝒜 X R F htrans hF hprog hinv hAX hAM z e (hZ z hZz) hze b hb with hbz | heb
    · exact htrans d z s Xd Xz hs.1.1 ((hZ z hZz).2 b d hb hbz hzb hbd) (hs.1.2 z hZz)
    · exact (hzb (htrans z e b Xz Xe Xb (hprog z e Xz hze) heb)).elim
  · refine (hsb (hs.2 b ⟨Xb, fun z hZz => ?_⟩)).elim
    rcases em (R z b) with h | h
    · exact h
    · exact (hz ⟨z, hZz, h⟩).elim

/-- **Claim 2.** Every member of the tower is a pivot. -/
theorem claim2 (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ c, Tower 𝒜 X R F c → Pivot 𝒜 X R F c :=
  tower_sub 𝒜 X R F (Pivot 𝒜 X R F) hAP
    ⟨fun x hx => (bw_closed 𝒜 X R F hF hAX).1 x hx.1,
     pivot_step 𝒜 X R F htrans hF hprog hinv hAX hAM,
     pivot_sup 𝒜 X R F htrans hF hser hprog hinv hAX hAM⟩

/-! ### (b) and (c) -/

/-- (b): for `Mb`, `Mc` and `(Fb)d`, `c ≼ b` or `d ≼ c`. -/
theorem bw_comparable (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ b c d, Tower 𝒜 X R F b → Tower 𝒜 X R F c → F b d → R c b ∨ R d c :=
  fun b c d hb hc hbd => claim1 𝒜 X R F htrans hF hprog hinv hAX hAM b d
    (claim2 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM b hb) hbd c hc

/-- (b): if `b ≺ c` in the tower and `(Fb)d`, then `d ≼ c`. -/
theorem bw_below (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ b c d, Tower 𝒜 X R F b → Tower 𝒜 X R F c → ¬ R c b → F b d → R d c :=
  fun b c d hb hc hcb hbd =>
    (bw_comparable 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM b c d hb hc hbd).elim
      (fun h => (hcb h).elim) id

/-- (b): the tower is a chain. -/
theorem bw_total (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    TotalOn R (Tower 𝒜 X R F) := by
  intro b c hb hc
  have hM := bw_closed 𝒜 X R F hF hAX
  have Xb := hM.1 b hb
  obtain ⟨d, hbd⟩ := hser b Xb
  rcases bw_comparable 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM b c d hb hc hbd with
    hcb | hdc
  · exact Or.inr hcb
  · exact Or.inl (htrans b d c Xb (hF b d Xb hbd) (hM.1 c hc) (hprog b d Xb hbd) hdc)

/-- (c): every supremum of the tower is in it, and `≈` each of its `F`-values. -/
theorem bw_sup_fixed (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAT : Admits 𝒜 (Tower 𝒜 X R F)) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∀ m, SupIn X R m (Tower 𝒜 X R F) →
      Tower 𝒜 X R F m ∧ ∀ n, F m n → R n m ∧ R m n := by
  intro m hm
  have hM := bw_closed 𝒜 X R F hF hAX
  obtain ⟨Y, hAY, hY⟩ := hAT
  have hTm : Tower 𝒜 X R F m :=
    hM.2.2 Y m hAY (fun z hz => (hY z).1 hz)
      (totalOn_coext R _ Y hY (bw_total 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM))
      (supIn_coext X R m _ Y hY hm)
  exact ⟨hTm, fun n hmn => ⟨hm.1.2 n (hM.2.1 m n hTm hmn), hprog m n hm.1.1 hmn⟩⟩

/-- (c): the tower has a supremum, given suprema of admissible chains. -/
theorem bw_sup_exists (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hsup : ∀ Z, 𝒜 Z → (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hF : ∀ x y, X x → F x y → X y)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAT : Admits 𝒜 (Tower 𝒜 X R F)) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∃ m, SupIn X R m (Tower 𝒜 X R F) := by
  obtain ⟨Y, hAY, hY⟩ := hAT
  have hM := bw_closed 𝒜 X R F hF hAX
  obtain ⟨m, hm⟩ := hsup Y hAY (fun z hz => hM.1 z ((hY z).1 hz))
    (totalOn_coext R _ Y hY (bw_total 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM))
  exact ⟨m, supIn_coext X R m Y _ (fun x => (hY x).symm) hm⟩

/-! ### The lemma for admissible chains, packaged -/

/-- **The Bourbaki–Witt lemma for admissible chains** (`#bourbaki-witt-admissible`): for a
preorder `R` on `X`, suprema of admissible chains, and a progressive invariant `F`, with `X`,
the tower, the pivots and each `M_{c,e}` coextensive with admissible properties: (a) the tower
is closed and included in every admissible closed property; (b) for `Mb`, `Mc`, `(Fb)d`,
`c ≼ b ∨ d ≼ c`; (c) the tower has a supremum, and each supremum `m` of it is in it with
`n ≈ m` whenever `(Fm)n`. -/
theorem bourbaki_witt_admissible (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (_hrefl : ∀ x, X x → R x x)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hsup : ∀ Z, 𝒜 Z → (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y)
    (hAX : Admits 𝒜 X) (hAT : Admits 𝒜 (Tower 𝒜 X R F)) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    (Closed 𝒜 X R F (Tower 𝒜 X R F) ∧
      ∀ Y, 𝒜 Y → Closed 𝒜 X R F Y → ∀ x, Tower 𝒜 X R F x → Y x) ∧
    (∀ b c d, Tower 𝒜 X R F b → Tower 𝒜 X R F c → F b d → R c b ∨ R d c) ∧
    ((∃ m, SupIn X R m (Tower 𝒜 X R F)) ∧
      ∀ m, SupIn X R m (Tower 𝒜 X R F) → Tower 𝒜 X R F m ∧ ∀ n, F m n → R n m ∧ R m n) :=
  ⟨⟨bw_closed 𝒜 X R F hF hAX, bw_least 𝒜 X R F⟩,
   bw_comparable 𝒜 X R F htrans hF hser hprog hinv hAX hAP hAM,
   bw_sup_exists 𝒜 X R F htrans hsup hF hser hprog hinv hAX hAT hAP hAM,
   bw_sup_fixed 𝒜 X R F htrans hF hser hprog hinv hAX hAT hAP hAM⟩

/-! ### The special case of partial orders -/

/-- For an antisymmetric `R` and an `F` functional on `X`, invariance is automatic. -/
theorem invariant_of_partial (X : σ → Prop) (R F : σ → σ → Prop)
    (hrefl : ∀ x, X x → R x x)
    (hanti : ∀ x y, X x → X y → R x y → R y x → x = y)
    (hF : ∀ x y, X x → F x y → X y)
    (hfun : ∀ x y y', X x → F x y → F x y' → y = y') :
    ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y := by
  intro x x' y y' hx hx' hxx' hx'x hxy hx'y'
  have e : x = x' := hanti x x' hx hx' hxx' hx'x
  rw [← e] at hx'y'
  have e' : y = y' := hfun x y y' hx hxy hx'y'
  rw [← e']
  exact ⟨hrefl y (hF x y hx hxy), hrefl y (hF x y hx hxy)⟩

/-- **Partial orders**: if `R` partially orders `X` and `F` is functional on `X`, the supremum
of the tower is an `m` in `X` with `(Fm)m`, and it is in the tower. -/
theorem bourbaki_witt_fixed_point (𝒜 : (σ → Prop) → Prop) (X : σ → Prop) (R F : σ → σ → Prop)
    (hrefl : ∀ x, X x → R x x)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hanti : ∀ x y, X x → X y → R x y → R y x → x = y)
    (hsup : ∀ Z, 𝒜 Z → (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hfun : ∀ x y y', X x → F x y → F x y' → y = y')
    (hAX : Admits 𝒜 X) (hAT : Admits 𝒜 (Tower 𝒜 X R F)) (hAP : Admits 𝒜 (Pivot 𝒜 X R F))
    (hAM : ∀ c e, Pivot 𝒜 X R F c → F c e → Admits 𝒜 (Mce 𝒜 X R F c e)) :
    ∃ m, (Tower 𝒜 X R F m ∧ SupIn X R m (Tower 𝒜 X R F)) ∧ F m m := by
  have hinv := invariant_of_partial X R F hrefl hanti hF hfun
  obtain ⟨m, hm⟩ := bw_sup_exists 𝒜 X R F htrans hsup hF hser hprog hinv hAX hAT hAP hAM
  have hfix := bw_sup_fixed 𝒜 X R F htrans hF hser hprog hinv hAX hAT hAP hAM m hm
  obtain ⟨n, hmn⟩ := hser m hm.1.1
  have e : n = m := hanti n m (hF m n hm.1.1 hmn) hm.1.1 (hfix.2 n hmn).1 (hfix.2 n hmn).2
  rw [e] at hmn
  exact ⟨m, ⟨hfix.1, hm⟩, hmn⟩

/-! ### The original lemma: no restrictor -/

/-- The trivial restrictor `λZ. ⊤`. -/
def AllProps : (σ → Prop) → Prop := λ _ ↦ True

theorem admits_all (Y : σ → Prop) : Admits AllProps Y := ⟨Y, trivial, fun _ => Iff.rfl⟩

/-- The original lemma's *closed*: the clause for suprema covers every chain. -/
def Closed₀ (X : σ → Prop) (R F : σ → σ → Prop) (Y : σ → Prop) : Prop :=
  (∀ x, Y x → X x) ∧ (∀ x y, Y x → F x y → Y y) ∧
    ∀ Z s, (∀ z, Z z → Y z) → TotalOn R Z → SupIn X R s Z → Y s

/-- The original lemma's tower `M := λx. ∀Y. Closed(Y) → Yx`. -/
def Tower₀ (X : σ → Prop) (R F : σ → σ → Prop) : σ → Prop :=
  λ x ↦ ∀ Y, Closed₀ X R F Y → Y x

theorem closed₀_iff (X : σ → Prop) (R F : σ → σ → Prop) (Y : σ → Prop) :
    Closed₀ X R F Y ↔ Closed AllProps X R F Y :=
  ⟨fun h => ⟨h.1, h.2.1, fun Z s _ hZ hT hs => h.2.2 Z s hZ hT hs⟩,
   fun h => ⟨h.1, h.2.1, fun Z s hZ hT hs => h.2.2 Z s trivial hZ hT hs⟩⟩

theorem tower₀_iff (X : σ → Prop) (R F : σ → σ → Prop) (x : σ) :
    Tower₀ X R F x ↔ Tower AllProps X R F x :=
  ⟨fun h Y _ hY => h Y ((closed₀_iff X R F Y).2 hY),
   fun h Y hY => h Y trivial ((closed₀_iff X R F Y).1 hY)⟩

/-- (a), without a restrictor. -/
theorem bw₀_closed (X : σ → Prop) (R F : σ → σ → Prop) (hF : ∀ x y, X x → F x y → X y) :
    Closed₀ X R F (Tower₀ X R F) ∧ ∀ Y, Closed₀ X R F Y → ∀ x, Tower₀ X R F x → Y x :=
  ⟨(closed₀_iff X R F _).2 (closed_coext AllProps X R F _ _ (tower₀_iff X R F)
      (bw_closed AllProps X R F hF (admits_all X))),
   fun _ hY _ hx => hx _ hY⟩

/-- (b), without a restrictor. -/
theorem bw₀_comparable (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y) :
    ∀ b c d, Tower₀ X R F b → Tower₀ X R F c → F b d → R c b ∨ R d c :=
  fun b c d hb hc hbd => bw_comparable AllProps X R F htrans hF hser hprog hinv (admits_all X)
    (admits_all _) (fun _ _ _ _ => admits_all _) b c d
    ((tower₀_iff X R F b).1 hb) ((tower₀_iff X R F c).1 hc) hbd

/-- (c), without a restrictor. -/
theorem bw₀_sup (X : σ → Prop) (R F : σ → σ → Prop)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hsup : ∀ Z, (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y) :
    (∃ m, SupIn X R m (Tower₀ X R F)) ∧
      ∀ m, SupIn X R m (Tower₀ X R F) → Tower₀ X R F m ∧ ∀ n, F m n → R n m ∧ R m n := by
  have e : ∀ x, Tower AllProps X R F x ↔ Tower₀ X R F x := fun x => (tower₀_iff X R F x).symm
  refine ⟨?_, fun m hm => ?_⟩
  · obtain ⟨m, hm⟩ := bw_sup_exists AllProps X R F htrans (fun Z _ => hsup Z) hF hser hprog hinv
      (admits_all X) (admits_all _) (admits_all _) (fun _ _ _ _ => admits_all _)
    exact ⟨m, supIn_coext X R m _ _ (fun x => (e x).symm) hm⟩
  · have h := bw_sup_fixed AllProps X R F htrans hF hser hprog hinv (admits_all X)
      (admits_all _) (admits_all _) (fun _ _ _ _ => admits_all _) m
      (supIn_coext X R m _ _ e hm)
    exact ⟨(e m).1 h.1, h.2⟩

/-- **The Bourbaki–Witt lemma** (`#bourbaki-witt`): for a preorder `R` on `X` in which every
chain has a supremum, and a progressive invariant `F` on `X`: (a) the tower is closed and the
least closed property; (b) for `Mb`, `Mc` and `(Fb)d`, `c ≼ b ∨ d ≼ c`; (c) the tower has a
supremum, and each supremum `m` of it is in it with `n ≈ m` whenever `(Fm)n`. The corollary of
`bourbaki_witt_admissible` at `𝒜 := λZ. ⊤`. -/
theorem bourbaki_witt (X : σ → Prop) (R F : σ → σ → Prop)
    (_hrefl : ∀ x, X x → R x x)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hsup : ∀ Z, (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hinv : ∀ x x' y y', X x → X x' → R x x' → R x' x → F x y → F x' y' → R y y' ∧ R y' y) :
    (Closed₀ X R F (Tower₀ X R F) ∧ ∀ Y, Closed₀ X R F Y → ∀ x, Tower₀ X R F x → Y x) ∧
    (∀ b c d, Tower₀ X R F b → Tower₀ X R F c → F b d → R c b ∨ R d c) ∧
    ((∃ m, SupIn X R m (Tower₀ X R F)) ∧
      ∀ m, SupIn X R m (Tower₀ X R F) → Tower₀ X R F m ∧ ∀ n, F m n → R n m ∧ R m n) :=
  ⟨bw₀_closed X R F hF, bw₀_comparable X R F htrans hser hF hprog hinv,
   bw₀_sup X R F htrans hsup hser hF hprog hinv⟩

/-- **Partial orders**, without a restrictor: an `m` in `X` with `(Fm)m`. -/
theorem bourbaki_witt_fixed_point₀ (X : σ → Prop) (R F : σ → σ → Prop)
    (hrefl : ∀ x, X x → R x x)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hanti : ∀ x y, X x → X y → R x y → R y x → x = y)
    (hsup : ∀ Z, (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hfun : ∀ x y y', X x → F x y → F x y' → y = y') :
    ∃ m, X m ∧ F m m :=
  (bourbaki_witt_fixed_point AllProps X R F hrefl htrans hanti (fun Z _ => hsup Z) hser hF hprog
    hfun (admits_all X) (admits_all _) (admits_all _) (fun _ _ _ _ => admits_all _)).elim
    fun m hm => ⟨m, hm.1.2.1.1, hm.2⟩

end Classicism.BW
