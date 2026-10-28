import Classicism.Models.FiniteCompressionBase

/-!
# Finite-support maps for the labelled entrance

Original argument (misc), research/2026-10-23/finite-compression-labelled-entrance.md,
sections 5–6 (unpaginated).
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

def localPoints : Point ⊕ Label → Finset Point
  | .inl p => {p}
  | .inr (.finite s) => s
  | _ => ∅

def pinPoints (P : Finset (Point ⊕ Label)) : Finset Point :=
  P.biUnion localPoints

theorem point_mem_pinPoints {P : Finset (Point ⊕ Label)} {p : Point}
    (hp : Sum.inl p ∈ P) : p ∈ pinPoints P := by
  classical
  exact Finset.mem_biUnion.2 ⟨Sum.inl p, hp, by simp [localPoints]⟩

theorem finite_mem_pinPoints {P : Finset (Point ⊕ Label)} {s : Finset Point}
    (hs : Sum.inr (Label.finite s) ∈ P) : ∀ p ∈ s, p ∈ pinPoints P := by
  classical
  intro p hp
  exact Finset.mem_biUnion.2 ⟨Sum.inr (Label.finite s), hs, hp⟩

theorem finite_label_support (P : Set (cat.X B)) (hP : P.Finite)
    (hlabels : ∀ i, Sum.inr (Label.block i) ∉ P) :
    ∃ S : Set Point, S.Finite ∧ (∀ p, Sum.inl p ∈ P → p ∈ S) ∧
      ∀ q, Sum.inr q ∈ P → q = .top ∨ fibre q ⊆ S := by
  classical
  refine ⟨(pinPoints hP.toFinset : Set Point), Finset.finite_toSet _, ?_, ?_⟩
  · intro p hp
    exact point_mem_pinPoints (hP.mem_toFinset.2 hp)
  · intro q hq
    cases q with
    | block i => exact (hlabels i hq).elim
    | finite s =>
      right
      exact finite_mem_pinPoints (hP.mem_toFinset.2 hq)
    | top => exact Or.inl rfl

/-- Any point surjection fixing the finite fibres extends to an arrow fixing
the corresponding mixed pin. -/
theorem tail_fix_pin (P : Set (cat.X B)) (S : Set Point)
    (hpoints : ∀ p, Sum.inl p ∈ P → p ∈ S)
    (hlabels : ∀ q, Sum.inr q ∈ P → q = .top ∨ fibre q ⊆ S)
    (f : Point → Point) (hf : Function.Surjective f) (hfix : ∀ p ∈ S, f p = p) :
    ∃ u : B ⟶ B, (∀ p, pointMap u p = f p) ∧
      ∀ x ∈ P, FunCat.fn u x = x := by
  classical
  let g : Label → Label := fun q => if Sum.inr q ∈ P then q else .top
  have hg : g .top = .top := by simp [g]
  have hp : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q) := by
    intro q p hqp
    by_cases hq : Sum.inr q ∈ P
    · simp only [g, if_pos hq]
      rcases hlabels q hq with rfl | hsub
      · exact Set.mem_univ _
      · rw [hfix p (hsub hqp)]
        exact hqp
    · simp only [g, if_neg hq]
      exact Set.mem_univ _
  refine ⟨mkTail f g hf hg hp, fun p => pointMap_mkTail _ _ _ _ _ p, ?_⟩
  intro x hx
  cases x with
  | inl p =>
    change Sum.inl (f p) = Sum.inl p
    rw [hfix p (hpoints p hx)]
  | inr q =>
    change Sum.inr (g q) = Sum.inr q
    have hgq : g q = q := if_pos hx
    rw [hgq]

theorem relative_factor (P : Set (cat.X B)) {S M : Set Point}
    (hS : S.Finite) (hM : M.Finite)
    (hpoints : ∀ p, Sum.inl p ∈ P → p ∈ S)
    (hlabels : ∀ q, Sum.inr q ∈ P → q = .top ∨ fibre q ⊆ S)
    (h h' : B ⟶ B)
    (hag : ∀ p ∈ S, pointMap h p = pointMap h' p) :
    ∃ u : B ⟶ B, (∀ x ∈ P, FunCat.fn u x = x) ∧
      ∀ p ∈ M, pointMap (u ≫ h) p = pointMap h' p := by
  classical
  let q : Point → Point := fun p => if p ∈ S then p else
    Classical.choose (pointMap_surj h (pointMap h' p))
  obtain ⟨f, hf, hfp⟩ := extend_points (hS.union hM) q
  have hfix : ∀ p ∈ S, f p = p := by
    intro p hp
    rw [hfp p (Or.inl hp)]
    simp [q, hp]
  obtain ⟨u, huf, hup⟩ := tail_fix_pin P S hpoints hlabels f hf hfix
  refine ⟨u, hup, ?_⟩
  intro p hp
  rw [pointMap_comp, huf, hfp p (Or.inr hp)]
  by_cases hs : p ∈ S
  · have hqp : q p = p := if_pos hs
    rw [hqp]
    exact hag p hs
  · have hqp : q p = Classical.choose (pointMap_surj h (pointMap h' p)) := if_neg hs
    rw [hqp]
    exact Classical.choose_spec (pointMap_surj h (pointMap h' p))

def localBlocks : Point ⊕ Label → Finset Nat
  | .inr (.block i) => {i}
  | _ => ∅

def pinBlocks (P : Finset (Point ⊕ Label)) : Finset Nat := P.biUnion localBlocks

@[simp] theorem mem_pinBlocks {P : Finset (Point ⊕ Label)} {i : Nat} :
    i ∈ pinBlocks P ↔ Sum.inr (Label.block i) ∈ P := by
  classical
  constructor
  · intro hi
    obtain ⟨x, hx, hi⟩ := Finset.mem_biUnion.1 hi
    cases x with
    | inl p => simp [localBlocks] at hi
    | inr q =>
      cases q with
      | block j =>
        have hij : i = j := by simpa [localBlocks] using hi
        subst i
        exact hx
      | finite s => simp [localBlocks] at hi
      | top => simp [localBlocks] at hi
  · intro hi
    exact Finset.mem_biUnion.2 ⟨Sum.inr (.block i), hi, by simp [localBlocks]⟩

/-- Compress every block label in a finite pin to a finite label, then return
that pin. The return arrow fixes all ordinary points. -/
theorem compress_return (P : Set (cat.X B)) (hP : P.Finite) :
    ∃ c r : B ⟶ B,
      (∀ x ∈ P, FunCat.fn (c ≫ r) x = x) ∧
      (∀ i, Sum.inr (Label.block i) ∉ FunCat.fn c '' P) ∧
      (∀ p, pointMap r p = p) := by
  classical
  let T := hP.toFinset
  let S := pinPoints T
  let I := pinBlocks T
  have hsp : ∀ p, Sum.inl p ∈ P → p ∈ S := by
    intro p hp
    exact point_mem_pinPoints (hP.mem_toFinset.2 hp)
  have hsf : ∀ s, Sum.inr (Label.finite s) ∈ P → ∀ p ∈ s, p ∈ S := by
    intro s hs
    exact finite_mem_pinPoints (hP.mem_toFinset.2 hs)
  have hib : ∀ i, i ∈ I ↔ Sum.inr (Label.block i) ∈ P := by
    intro i
    exact mem_pinBlocks.trans hP.mem_toFinset
  obtain ⟨b, hb⟩ := (S.finite_toSet.image Prod.snd).bddAbove
  let z : Nat → Point := fun i => (i, b + 1)
  have hz : ∀ i, z i ∉ S := by
    intro i hi
    have := hb (Set.mem_image_of_mem Prod.snd hi)
    change b + 1 ≤ b at this
    omega
  let D : Nat → Finset Point := fun i => insert (z i) (S.filter (fun p => p.1 = i))
  have hzD : ∀ i, z i ∈ D i := by intro i; simp [D]
  have hDi : ∀ i p, p ∈ D i → p.1 = i := by
    intro i p hp
    rcases Finset.mem_insert.1 hp with rfl | hp
    · rfl
    · exact (Finset.mem_filter.1 hp).2
  have hDinj : Function.Injective D := by
    intro i j he
    have hh := hDi j (z i) (he ▸ hzD i)
    exact hh
  have hDne : ∀ i s, Sum.inr (Label.finite s) ∈ P → D i ≠ s := by
    intro i s hs he
    exact hz i (hsf s hs (z i) (he ▸ hzD i))
  obtain ⟨b₁, hb₁⟩ := (S.finite_toSet.image Prod.fst).bddAbove
  obtain ⟨b₂, hb₂⟩ := I.finite_toSet.bddAbove
  let R := max b₁ b₂ + 1
  let f : Point → Point := fun p => if p ∈ S then p else
    if p.1 ∈ I then z p.1 else (p.1 - R, p.2)
  have hfix : ∀ p ∈ S, f p = p := by intro p hp; simp [f, hp]
  have hsurj : Function.Surjective f := by
    intro y
    let p : Point := (y.1 + R, y.2)
    have hpS : p ∉ S := by
      intro hp
      have hh := hb₁ (Set.mem_image_of_mem Prod.fst hp)
      change y.1 + R ≤ b₁ at hh
      dsimp [R] at hh
      omega
    have hpI : p.1 ∉ I := by
      intro hp
      have hh := hb₂ hp
      change y.1 + R ≤ b₂ at hh
      dsimp [R] at hh
      omega
    refine ⟨p, ?_⟩
    simp [f, hpS, hpI, p]
  let g : Label → Label := fun q => match q with
    | .block i => if Sum.inr (.block i) ∈ P then .finite (D i) else .top
    | .finite s => if Sum.inr (.finite s) ∈ P then .finite s else .top
    | .top => .top
  have hg : g .top = .top := rfl
  have hpres : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q) := by
    intro q p hp
    cases q with
    | block i =>
      by_cases hi : Sum.inr (Label.block i) ∈ P
      · simp only [g, if_pos hi]
        change f p ∈ D i
        have hpi : p.1 = i := hp
        by_cases hs : p ∈ S
        · rw [hfix p hs]
          exact Finset.mem_insert_of_mem (Finset.mem_filter.2 ⟨hs, hpi⟩)
        · have hip : p.1 ∈ I := by rw [hpi]; exact (hib i).2 hi
          have hfp : f p = z p.1 := by
            dsimp only [f]
            rw [if_neg hs, if_pos hip]
          rw [hfp, hpi]
          exact hzD i
      · simp only [g, if_neg hi]
        exact Set.mem_univ _
    | finite s =>
      by_cases hs : Sum.inr (Label.finite s) ∈ P
      · simp only [g, if_pos hs]
        rw [hfix p (hsf s hs p hp)]
        exact hp
      · simp only [g, if_neg hs]
        exact Set.mem_univ _
    | top => exact Set.mem_univ _
  let c := mkTail f g hsurj hg hpres
  let hit : Label → Prop := fun q => ∃ i, Sum.inr (Label.block i) ∈ P ∧ q = .finite (D i)
  let back : Label → Label := fun q => if hh : hit q then .block (Classical.choose hh)
    else if Sum.inr q ∈ P then q else .top
  have htop : ¬ hit .top := by
    rintro ⟨i, _, he⟩
    cases he
  have hbacktop : back .top = .top := by simp [back, htop]
  have hback : ∀ q p, p ∈ fibre q → p ∈ fibre (back q) := by
    intro q p hp
    by_cases hh : hit q
    · simp only [back, dif_pos hh]
      obtain ⟨hi, he⟩ := Classical.choose_spec hh
      rw [he] at hp
      exact hDi _ p hp
    · simp only [back, dif_neg hh]
      by_cases hq : Sum.inr q ∈ P
      · simpa only [if_pos hq] using hp
      · simp only [if_neg hq]
        exact Set.mem_univ _
  let r := mkTail id back Function.surjective_id hbacktop hback
  have hrestore : ∀ q, Sum.inr q ∈ P → back (g q) = q := by
    intro q hq
    cases q with
    | block i =>
      have hh : hit (.finite (D i)) := ⟨i, hq, rfl⟩
      simp only [g, if_pos hq, back, dif_pos hh]
      apply congrArg Label.block
      have he := (Classical.choose_spec hh).2
      exact hDinj (Label.finite.inj he).symm
    | finite s =>
      have hh : ¬ hit (.finite s) := by
        rintro ⟨i, _, he⟩
        exact hDne i s hq (Label.finite.inj he).symm
      simp [g, hq, back, hh]
    | top => exact hbacktop
  refine ⟨c, r, ?_, ?_, ?_⟩
  · intro x hx
    cases x with
    | inl p =>
      change Sum.inl (f p) = Sum.inl p
      rw [hfix p (hsp p hx)]
    | inr q =>
      change Sum.inr (back (g q)) = Sum.inr q
      rw [hrestore q hx]
  · intro i hi
    obtain ⟨x, _, he⟩ := hi
    cases x with
    | inl p => cases he
    | inr q =>
      have hh : g q = .block i := Sum.inr.inj he
      cases q with
      | block j =>
        dsimp [g] at hh
        split_ifs at hh <;> cases hh
      | finite s =>
        dsimp [g] at hh
        split_ifs at hh <;> cases hh
      | top => cases hh
  · intro p
    exact pointMap_mkTail _ _ _ _ _ p

end
end Classicism.Meta.Intensional.FiniteCompression
