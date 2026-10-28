import Classicism.Models.FiniteCompressionLogic
import Mathlib.Data.Nat.Pairing
import Mathlib.Data.Finset.Lattice.Fold

/-!
# A bounded weakly rigid fibre which is not rigid

Original formalization (misc), 23 October 2026. Source:
research/2026-10-23/finite-compression-labelled-entrance.md, sections 3–4.
The bound is the exact image of the old individuals, not the universal
intension. All interpolation and collapse arrows are constructed below.
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

private def witnessPinBound : Point ⊕ Label → Nat
  | .inl p => max p.1 p.2
  | .inr (.block i) => i
  | .inr (.finite D) => D.sup (fun p => max p.1 p.2)
  | .inr .top => 0

/-- A fresh member of a block can reach any member of its prescribed target
fibre while an arbitrary finite pin is held fixed. -/
theorem block_interpolation (i : Nat) (h : B ⟶ B)
    {P : Set (cat.X B)} (hP : P.Finite) (y : Point)
    (hy : y ∈ fibre (labelMap h (.block i))) :
    ∃ n : Point, n.1 = i ∧ ∃ j : B ⟶ B,
      AgreeOn cat.De (W := B) P j h ∧ pointMap j n = y := by
  classical
  let K := hP.toFinset.sup witnessPinBound
  have hbound : ∀ z ∈ P, witnessPinBound z ≤ K := by
    intro z hz
    exact Finset.le_sup (hP.mem_toFinset.mpr hz)
  let n : Point := (i, K + 1)
  let r := max i K + 1
  have hri : r ≠ i := by dsimp [r]; omega
  have hrK : K < r := by dsimp [r]; omega
  let f : Point → Point := fun p =>
    if p = n then y else if p.1 = r then Nat.unpair p.2 else pointMap h p
  let g : Label → Label := fun q =>
    if Sum.inr q ∈ P then labelMap h q else .top
  have hf : Function.Surjective f := by
    intro z
    have hne : (r, Nat.pair z.1 z.2) ≠ n := by
      intro he
      have := congrArg Prod.fst he
      exact hri this
    refine ⟨(r, Nat.pair z.1 z.2), ?_⟩
    simp [f, hne, Nat.unpair_pair]
  have hg : g .top = .top := by simp [g]
  have hf_fixed : ∀ p : Point, max p.1 p.2 ≤ K → f p = pointMap h p := by
    intro p hp
    have hn : p ≠ n := by
      intro he
      subst p
      dsimp [n] at hp
      omega
    have hr : p.1 ≠ r := by omega
    simp [f, hn, hr]
  have hp : ∀ q p, p ∈ fibre q → f p ∈ fibre (g q) := by
    intro q p hp
    by_cases hq : Sum.inr q ∈ P
    · simp only [g, if_pos hq]
      cases q with
      | top => simp [labelMap_top, fibre]
      | finite D =>
        have hd : p ∈ D := hp
        have hb : max p.1 p.2 ≤ K :=
          (Finset.le_sup hd).trans (hbound _ hq)
        rw [hf_fixed p hb]
        exact tail_preserves h (.finite D) p hp
      | block b =>
        have hb : b ≤ K := hbound _ hq
        have hpb : p.1 = b := hp
        have hpr : p.1 ≠ r := by omega
        by_cases hpn : p = n
        · subst p
          have hbi : b = i := hpb.symm
          subst b
          simpa [f] using hy
        · simp only [f, if_neg hpn, if_neg hpr]
          exact tail_preserves h (.block b) p hp
    · simp [g, hq, fibre]
  let j := mkTail f g hf hg hp
  refine ⟨n, rfl, j, ?_, ?_⟩
  · intro z hz
    cases z with
    | inl p =>
      change Sum.inl (f p) = FunCat.fn h (Sum.inl p)
      exact (congrArg (point B) (hf_fixed p (hbound _ hz))).trans
        (fn_point h p).symm
    | inr q =>
      change Sum.inr (g q) = FunCat.fn h (Sum.inr q)
      rw [fn_label]
      have hgq : g q = labelMap h q := if_pos hz
      rw [hgq]
  · change pointMap (mkTail f g hf hg hp) n = y
    rw [pointMap_mkTail]
    simp [f]

def fibreExtension (q : Label) (x : cat.X B) : Prop :=
  ∃ p : Point, x = Sum.inl p ∧ p ∈ fibre q

def fibreRaw (q : Label) : Intension model.inner et B :=
  fun p => match p with
    | ⟨.A, _, _⟩ => False
    | ⟨.B, a, h⟩ => fibreExtension (labelMap h q) a.1

theorem fibre_mem (q : Label) : fibreRaw q ∈ Set.range (model.incl et B) := by
  apply (mem_range_symIncl cat.De syms (PinIdeal.fin cat.De) et B (fibreRaw q)).2
  refine ⟨⟨{Sum.inr q}, Set.finite_singleton _, ?_⟩, ?_⟩
  · intro V h i ha
    have hV := target_from_B h
    subst V
    have hq : labelMap h q = labelMap i q := by
      apply Sum.inr_injective
      rw [← fn_label, ← fn_label]
      exact ha _ (Set.mem_singleton _)
    ext ⟨U, a, k⟩
    cases U with
    | A => exact (no_BA k).elim
    | B =>
      change fibreExtension (labelMap (h ≫ k) q) a.1 ↔
        fibreExtension (labelMap (i ≫ k) q) a.1
      simp only [labelMap_comp, hq]
  · intro V a k g _ ha
    have hV := target_from_B k
    subst V
    rcases ha with ⟨p, hp, hf⟩
    refine ⟨pointMap g p, ?_, ?_⟩
    · change FunCat.fn g a.1 = Sum.inl (pointMap g p)
      rw [hp]
      exact fn_point g p
    · change pointMap g p ∈ fibre (labelMap (k ≫ g) q)
      rw [labelMap_comp]
      exact tail_preserves g _ p hf

def fibreEntity (q : Label) : RD B et := Classical.choose (fibre_mem q)

theorem incl_fibre (q : Label) : model.incl et B (fibreEntity q) = fibreRaw q :=
  Classical.choose_spec (fibre_mem q)

@[simp] theorem prof_fibre (q : Label) (h : B ⟶ B) (a : TA et B) :
    prof (fibreEntity q) h a ↔ fibreExtension (labelMap h q) a.1 := by
  unfold prof
  rw [incl_fibre]
  rfl

@[simp] theorem prof_fibre_point (q : Label) (h : B ⟶ B) (p : Point) :
    prof (fibreEntity q) h (Sum.inl p, PUnit.unit) ↔
      p ∈ fibre (labelMap h q) := by
  rw [prof_fibre]
  constructor
  · rintro ⟨a, ha, hf⟩
    have he : p = a := Sum.inl_injective ha
    exact he.symm ▸ hf
  · intro hp
    exact ⟨p, rfl, hp⟩

theorem block_weak (i : Nat) : WeakData (fibreEntity (.block i)) := by
  constructor
  · intro a ha V h
    have hV := target_from_B h
    subst V
    rcases (prof_fibre _ _ _).1 ha with ⟨p, hp, hf⟩
    have hpf : p ∈ fibre (.block i) := by simpa using hf
    apply (prof_fibre _ h _).2
    refine ⟨pointMap h p, ?_, tail_preserves h _ p hpf⟩
    change FunCat.fn h a.1 = Sum.inl (pointMap h p)
    rw [hp]
    exact fn_point h p
  · intro Z hZ
    obtain ⟨P, hP, hpZ⟩ := fin_pin (.rel et) B Z
    rintro ⟨V, a, h⟩ ha
    have hV := target_from_B h
    subst V
    rcases (prof_fibre _ h a).1 ha with ⟨p, hp, hf⟩
    obtain ⟨n, hn, j, hj, hjn⟩ := block_interpolation i h hP p hf
    have hnmem : prof (fibreEntity (.block i)) (𝟙 B) (Sum.inl n, PUnit.unit) := by
      rw [prof_fibre_point, labelMap_id]
      exact hn
    have hZj := hZ (Sum.inl n, PUnit.unit) hnmem j
    have hjnp : FunCat.fn j (Sum.inl n) = Sum.inl p :=
      (fn_point j n).trans (congrArg (point B) hjn)
    have hZj' : prof Z j (Sum.inl p, PUnit.unit) :=
      Eq.mp (congrArg (fun x : cat.X B => prof Z j (x, PUnit.unit)) hjnp) hZj
    have hZh := (prof_agree hpZ hj (Sum.inl p, PUnit.unit)).1 hZj'
    have hea : (Sum.inl p, PUnit.unit) = a := by
      exact Prod.ext hp.symm (Subsingleton.elim _ _)
    exact Eq.mp (congrArg (fun t : TA et B => prof Z h t) hea) hZh

abbrev witnessFirst : Point := (0, 0)
abbrev witnessSecond : Point := (0, 1)
def witnessPair : Finset Point := {witnessFirst, witnessSecond}

private def witnessCollapseFn (p : Point) : Point :=
  if p.1 = 0 then witnessFirst else Nat.unpair p.2

private theorem witnessCollapse_surj : Function.Surjective witnessCollapseFn := by
  intro p
  exact ⟨(1, Nat.pair p.1 p.2), by simp [witnessCollapseFn, Nat.unpair_pair]⟩

def witnessCollapse : B ⟶ B :=
  mkTail witnessCollapseFn
    (fun q => if q = .block 0 then .finite witnessPair else .top)
    witnessCollapse_surj (by simp) (by
      intro q p hp
      by_cases hq : q = .block 0
      · subst q
        have hp0 : p.1 = 0 := hp
        simp [witnessCollapseFn, hp0, fibre, witnessPair]
      · simp [hq, fibre])

private def witnessMergeFn (p : Point) : Point := (p.1, p.2 / 2)

private theorem witnessMerge_surj : Function.Surjective witnessMergeFn := by
  intro p
  refine ⟨(p.1, 2 * p.2), ?_⟩
  simp [witnessMergeFn]

def witnessMerge : B ⟶ B :=
  mkTail witnessMergeFn
    (fun q => if q = .finite witnessPair then .finite witnessPair else .top)
    witnessMerge_surj (by simp) (by
      intro q p hp
      by_cases hq : q = .finite witnessPair
      · subst q
        have hp' : p = witnessFirst ∨ p = witnessSecond := by
          simpa [fibre, witnessPair] using hp
        rcases hp' with rfl | rfl <;>
          simp [witnessMergeFn, fibre, witnessPair]
      · simp [hq, fibre])

theorem witnessCollapse_label : labelMap witnessCollapse (.block 0) = .finite witnessPair := by
  apply Sum.inr_injective
  rw [← fn_label]
  rfl

theorem witnessMerge_label : labelMap witnessMerge (.finite witnessPair) = .finite witnessPair := by
  unfold witnessMerge
  rw [labelMap_mkTail]
  exact if_pos rfl

def pairRaw : Intension model.inner et B := fun p =>
  p.2.1.1 = FunCat.fn p.2.2 (Sum.inl witnessFirst) ∨
    p.2.1.1 = FunCat.fn p.2.2 (Sum.inl witnessSecond)

theorem pair_mem : pairRaw ∈ Set.range (model.incl et B) := by
  apply (mem_range_symIncl cat.De syms (PinIdeal.fin cat.De) et B pairRaw).2
  refine ⟨⟨{Sum.inl witnessFirst, Sum.inl witnessSecond},
    (Set.finite_singleton _).insert _, ?_⟩, ?_⟩
  · intro V h i ha
    ext ⟨U, a, k⟩
    change (a.1 = FunCat.fn k (FunCat.fn h (Sum.inl witnessFirst)) ∨
      a.1 = FunCat.fn k (FunCat.fn h (Sum.inl witnessSecond))) ↔
      (a.1 = FunCat.fn k (FunCat.fn i (Sum.inl witnessFirst)) ∨
      a.1 = FunCat.fn k (FunCat.fn i (Sum.inl witnessSecond)))
    have h0 : FunCat.fn h (Sum.inl witnessFirst) = FunCat.fn i (Sum.inl witnessFirst) :=
      ha _ (Or.inl rfl)
    have h1 : FunCat.fn h (Sum.inl witnessSecond) = FunCat.fn i (Sum.inl witnessSecond) :=
      ha _ (Or.inr rfl)
    rw [h0, h1]
  · intro V a k g _ ha
    exact ha.imp (congrArg (FunCat.fn g)) (congrArg (FunCat.fn g))

def pairEntity : RD B et := Classical.choose pair_mem

theorem incl_pair : model.incl et B pairEntity = pairRaw := Classical.choose_spec pair_mem

theorem prof_pair {V : cat.Ob} (h : B ⟶ V) (a : TA et V) :
    prof pairEntity h a ↔
      a.1 = FunCat.fn h (Sum.inl witnessFirst) ∨
      a.1 = FunCat.fn h (Sum.inl witnessSecond) := by
  unfold prof
  rw [incl_pair]
  rfl

theorem block_not_rigid : ¬ RigidData (fibreEntity (.block 0)) := by
  intro hr
  have hc := hr witnessCollapse
  have htest : ∀ a : TA et B,
      prof ((model.inner (.rel et)).map witnessCollapse (fibreEntity (.block 0))) (𝟙 B) a →
      ∀ {V : cat.Ob} (j : B ⟶ V), prof pairEntity j (Args.map model.inner et j a) := by
    intro a ha V j
    have hcol := (prof_map _ witnessCollapse (𝟙 B) a).1 ha
    rw [Category.comp_id, prof_fibre, witnessCollapse_label] at hcol
    rcases hcol with ⟨p, hp, hf⟩
    have hp' : p = witnessFirst ∨ p = witnessSecond := by
      simpa [fibre, witnessPair] using hf
    apply (prof_pair j _).2
    change FunCat.fn j a.1 = _ ∨ FunCat.fn j a.1 = _
    rw [hp]
    exact hp'.imp (fun he => congrArg (fun x => FunCat.fn j (Sum.inl x)) he)
      (fun he => congrArg (fun x => FunCat.fn j (Sum.inl x)) he)
  have hub := hc.2 pairEntity htest
  have hmem : prof ((model.inner (.rel et)).map witnessCollapse
      (fibreEntity (.block 0))) witnessMerge (Sum.inl witnessSecond, PUnit.unit) := by
    rw [prof_map, prof_fibre_point, labelMap_comp, witnessCollapse_label, witnessMerge_label]
    simp [fibre, witnessPair]
  have hbad := (prof_pair witnessMerge _).1 (hub hmem)
  rcases hbad with hbad | hbad <;>
    change Sum.inl witnessSecond = Sum.inl witnessFirst at hbad <;> cases hbad

theorem bound_mem : exactRaw (Set.univ : Set (TA et A)) ∈ Set.range (model.incl et A) :=
  root_exact_mem Set.finite_empty Set.univ (fun _ _ _ _ => Set.mem_univ _)

def oldBound : RD A et := exactEntity Set.univ bound_mem

theorem oldBound_rigid : RigidData oldBound := exactEntity_rigid Set.univ bound_mem

theorem prof_oldBound {V : cat.Ob} (h : A ⟶ V) (a : TA et V) :
    prof oldBound h a ↔ ∃ p : Point, a.1 = FunCat.fn h p := by
  rw [show oldBound = exactEntity Set.univ bound_mem from rfl, prof_exactEntity]
  constructor
  · rintro ⟨⟨p, pu⟩, _, he⟩
    exact ⟨p, (congrArg Prod.fst he).symm⟩
  · rintro ⟨p, hp⟩
    exact ⟨(p, PUnit.unit), Set.mem_univ _, Prod.ext hp.symm (Subsingleton.elim _ _)⟩

theorem fibre_below_oldBound (q : Label) :
    model.incl et B (fibreEntity q) ⊆
      model.incl et B ((model.inner (.rel et)).map entrance oldBound) := by
  rintro ⟨V, a, h⟩ ha
  have hV := target_from_B h
  subst V
  rcases (prof_fibre q h a).1 ha with ⟨p, hp, hf⟩
  obtain ⟨n, hn⟩ := pointMap_surj h p
  apply (prof_map oldBound entrance h a).2
  apply (prof_oldBound (entrance ≫ h) a).2
  refine ⟨n, ?_⟩
  change a.1 = FunCat.fn h (Sum.inl n)
  have hhn : FunCat.fn h (Sum.inl n) = Sum.inl p :=
    (fn_point h n).trans (congrArg (point B) hn)
  exact hp.trans hhn.symm

end
end Classicism.Meta.Intensional.FiniteCompression
