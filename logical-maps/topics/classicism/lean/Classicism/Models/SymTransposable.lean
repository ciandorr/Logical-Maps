import Classicism.Models.SymBase

/-!
# `transposable` for any base whose symmetries move points off a finite set

The group `symmetric-ideally-full`'s condition `transposable` (`SymBase.Transposable`), for
every base at once: when the base object has a point outside every finite set, and for every
finite `K` and every point `y` outside it some symmetry fixes `K` pointwise and moves `y`,
the property of not being in `K` (`avoidK`), symmetric and pinned down by `K`, has the
points outside `K` as its extension at the identity, and the symmetry fixes it.

This is `SymIdeal.transposable_of` (`Models/SymmetricIdeal.lean`) without the restriction to
one object over `ℕ` and to transpositions: any symmetry fixing `K` will do, so the lemma
serves the two-object members and the members over other individuals.
-/

namespace Classicism.Meta.Intensional

open CategoryTheory

namespace SymBase

variable {S : SymBase}

/-- A symmetry is injective: it has an inverse. -/
theorem G_injective {V : S.F.Ob} {g : V ⟶ V} (hg : g ∈ S.G V) : Function.Injective (FunCat.fn g) := by
  obtain ⟨g', -, hgg', -⟩ := S.G_inv V g hg
  intro x y e
  have h := congrArg (fun f => FunCat.fn f x) hgg'
  have h' := congrArg (fun f => FunCat.fn f y) hgg'
  simp only [FunCat.fn_comp, Function.comp_apply, FunCat.fn_id, id] at h h'
  rw [← h, ← h', e]

variable (S) in
/-- Satisfying `P` and not being one of the members of `K`: `P x ∧ x ∉ k[K]` at the arrow `k`. -/
def avoidK (P : ∀ V : S.F.Ob, S.F.X V → Prop) (K : Set (S.F.X S.W₀)) :
    Intension (SymT S.F.De S.G S.J) (.arr .e .t) S.W₀ :=
  {p | P p.1 p.2.1.1 ∧ p.2.1.1 ∉ FunCat.fn p.2.2 '' K}

theorem avoidK_mem (P : ∀ V : S.F.Ob, S.F.X V → Prop)
    (hP : ∀ V (g : V ⟶ V), g ∈ S.G V → ∀ x, P V x → P V (FunCat.fn g x))
    (K : Set (S.F.X S.W₀)) (hK : K.Finite) :
    S.avoidK P K ∈ Set.range (S.model.incl (.arr .e .t) S.W₀) := by
  refine (mem_range_iff _ _).2 ⟨⟨K, hK, fun V h i ha => ?_⟩, ?_⟩
  · ext ⟨U, ⟨x, ⟨⟩⟩, j⟩
    have e : (FunCat.fn j ∘ FunCat.fn h) '' K = (FunCat.fn j ∘ FunCat.fn i) '' K :=
      Set.image_congr fun a ha' => by
        show FunCat.fn j (FunCat.fn h a) = FunCat.fn j (FunCat.fn i a)
        have e' : FunCat.fn h a = FunCat.fn i a := ha a ha'
        rw [e']
    show P U x ∧ x ∉ (FunCat.fn j ∘ FunCat.fn h) '' K ↔ P U x ∧ x ∉ (FunCat.fn j ∘ FunCat.fn i) '' K
    rw [e]
  · rintro V ⟨x, ⟨⟩⟩ k g hg ⟨hPx, (hx : x ∉ FunCat.fn k '' K)⟩
    refine ⟨hP V g hg x hPx, ?_⟩
    rintro ⟨a, ha, e⟩
    exact hx ⟨a, ha, G_injective hg e⟩

/-- **`transposable` from moving symmetries**: for a property `P` of individuals preserved by
the symmetries, a `P`-point outside every finite set, and for every finite `K` and `P`-point
`y ∉ K` a symmetry of the base object fixing `K` pointwise and moving `y`. -/
theorem transposable_of_moves (P : ∀ V : S.F.Ob, S.F.X V → Prop)
    (hP : ∀ V (g : V ⟶ V), g ∈ S.G V → ∀ x, P V x → P V (FunCat.fn g x))
    (hfresh : ∀ K : Set (S.F.X S.W₀), K.Finite → ∃ y, P S.W₀ y ∧ y ∉ K)
    (hmove : ∀ K : Set (S.F.X S.W₀), K.Finite → ∀ y, P S.W₀ y → y ∉ K →
      ∃ g ∈ S.G S.W₀, (∀ x ∈ K, FunCat.fn g x = x) ∧ FunCat.fn g y ≠ y) :
    S.Transposable := by
  intro N hN
  obtain ⟨a, ha⟩ := avoidK_mem (S := S) P hP N hN
  have ha' : S.model.incl (.arr .e .t) S.W₀ a = S.avoidK P N := ha
  have hext : ∀ y : S.F.X S.W₀, (⟨S.W₀, (y, PUnit.unit), 𝟙 S.W₀⟩ : Tuple S.model.inner (.arr .e .t) S.W₀) ∈
      S.model.incl _ S.W₀ a ↔ P S.W₀ y ∧ y ∉ N := fun y => by
    rw [ha']
    show P S.W₀ y ∧ y ∉ FunCat.fn (𝟙 S.W₀) '' N ↔ _
    rw [FunCat.fn_id, Set.image_id]
  obtain ⟨y₀, hy₀⟩ := hfresh N hN
  refine ⟨a, ⟨y₀, (hext y₀).2 hy₀⟩, fun y hy => ?_⟩
  have hy := (hext y).1 hy
  obtain ⟨g, hg, hfix, hmv⟩ := hmove N hN y hy.1 hy.2
  refine ⟨g, hg, fun x hx => hfix x hx, ?_, hmv⟩
  apply S.model.incl_injective
  erw [S.model.incl_map, ha']
  ext ⟨U, ⟨x, ⟨⟩⟩, j⟩
  show P U x ∧ x ∉ (FunCat.fn j ∘ FunCat.fn g) '' N ↔ P U x ∧ x ∉ FunCat.fn j '' N
  refine and_congr_right' (not_congr ⟨fun ⟨b, hb, e⟩ => ⟨b, hb, ?_⟩, fun ⟨b, hb, e⟩ => ⟨b, hb, ?_⟩⟩)
  · rw [← e]; show FunCat.fn j b = FunCat.fn j (FunCat.fn g b); rw [hfix b hb]
  · rw [← e]; show FunCat.fn j (FunCat.fn g b) = FunCat.fn j b; rw [hfix b hb]

/-- `transposable_of_moves` with no restriction on the points. -/
theorem transposable_of_moves'
    (hfresh : ∀ K : Set (S.F.X S.W₀), K.Finite → ∃ y, y ∉ K)
    (hmove : ∀ K : Set (S.F.X S.W₀), K.Finite → ∀ y, y ∉ K →
      ∃ g ∈ S.G S.W₀, (∀ x ∈ K, FunCat.fn g x = x) ∧ FunCat.fn g y ≠ y) :
    S.Transposable :=
  transposable_of_moves (fun _ _ => True) (fun _ _ _ _ _ => trivial)
    (fun K hK => (hfresh K hK).imp fun _ h => ⟨trivial, h⟩) (fun K hK y _ hy => hmove K hK y hy)

/-! ### The symmetry group as a proposition, on one object -/

theorem mem_groupProp (k : S.W₀ ⟶ S.W₀) :
    (⟨S.W₀, PUnit.unit, k⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.groupProp ↔ k ∈ S.G S.W₀ := by
  constructor
  · rintro ⟨g, hg, he⟩
    obtain ⟨-, he⟩ := Sigma.mk.inj_iff.1 he
    rw [(Prod.mk.inj (eq_of_heq he)).2]; exact hg
  · exact fun hk => ⟨k, hk, rfl⟩

/-- **`symmetry-group-pinned` on one object**: whether a composite `h ≫ k` is a symmetry
depends on `h` only through its values on a finite `N`. -/
theorem symmetryGroupPinned_of_one (hob : ∀ V : S.F.Ob, V = S.W₀) (N : Set (S.F.X S.W₀)) (hN : N.Finite)
    (hpin : ∀ h i k : S.W₀ ⟶ S.W₀, AgreeOn S.F.De N h i → (h ≫ k ∈ S.G S.W₀ ↔ i ≫ k ∈ S.G S.W₀)) :
    S.SymmetryGroupPinned := by
  refine ⟨N, hN, fun V h i ha => ?_⟩
  obtain rfl := hob V
  ext ⟨U, ⟨⟩, k⟩
  obtain rfl := hob U
  show (⟨S.W₀, PUnit.unit, h ≫ k⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.groupProp ↔
    (⟨S.W₀, PUnit.unit, i ≫ k⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.groupProp
  rw [mem_groupProp, mem_groupProp]
  exact hpin h i k ha

/-- **The actual world is the symmetry group, and isolated**, when the group is finitely
pinned and a composite is in it only if its first factor is. -/
theorem actualWorldIsolated_of_pinned (h : S.SymmetryGroupPinned)
    (hcl : ∀ {V U : S.F.Ob} (i : S.W₀ ⟶ V) (j : V ⟶ U),
      (⟨U, PUnit.unit, i ≫ j⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.groupProp →
      (⟨V, PUnit.unit, i⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.groupProp) :
    S.model.ActualWorldIsolated := by
  obtain ⟨a, ha⟩ := (mem_range_iff .t S.groupProp).2 ⟨h, groupProp_sym⟩
  have ha' : S.model.incl .t S.W₀ a = S.groupProp := ha
  refine ⟨a, ?_, fun p hp => ?_, fun {V U} i j hi => ?_⟩
  · show (⟨S.W₀, PUnit.unit, 𝟙 S.W₀⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∈ S.model.incl .t S.W₀ a
    rw [ha']; exact ⟨𝟙 _, S.G_id _, rfl⟩
  · show S.model.incl .t S.W₀ a ⊆ S.model.incl .t S.W₀ p
    rw [ha']
    rintro _ ⟨g, hg, rfl⟩
    exact Premodel.Sym.at_id (symIdeal_domSym .t S.W₀ p) PUnit.unit hg hp
  · change (⟨V, PUnit.unit, i⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∉ S.model.incl .t S.W₀ a at hi
    show (⟨U, PUnit.unit, i ≫ j⟩ : Tuple (SymT S.F.De S.G S.J) .t S.W₀) ∉ S.model.incl .t S.W₀ a
    rw [ha'] at hi ⊢
    exact fun hm => hi (hcl i j hm)

end SymBase

end Classicism.Meta.Intensional
