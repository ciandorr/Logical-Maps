import Classicism.Coalesced.Pinned

/-!
# BF at the finitely pinned root

The `barcan` argument of `coalesced-pinned-interpretations-root` and
`coalesced-pinned-substitutions-root`: BF holds at every closed type at the root, in the form
`∀X. (∀y. □Xy) → □∀y. Xy` (`Sentence.bf`), when the signature has a fresh constant of every
closed type outside any finite set (`FreshConsts`) and the root endo-arrows can be undone off
any finite set (`Undoable`).

Let `X`, pinned down by a finite `N`, necessarily hold of every root entity.

* At an arrow `⟨V, J⟩` and an entity `a` at `V`: choose a constant `c` of the type outside `N`
  and let `J'` be `J` with `c` sent to `a`. Then `□Xĉ` puts `⟨a, ⟨V, J'⟩⟩` in `X`, since `ĉ`
  is transported to `J' c = a`; and `J'` agrees with `J` on `N`, so `⟨a, ⟨V, J⟩⟩` is in `X`.
* At a map `m` of the constants and a root entity `a` (the substitution member): choose maps
  `g` and `f` with `g` followed by `f` the identity and `f` agreeing with `m` on `N` (for the
  maps of `Σ⁺`, `g` shifts every index past `N` and `f` shifts back, agreeing with `m` below).
  Then `□X(g·a)` puts `⟨f·g·a, f⟩ = ⟨a, f⟩` in `X`, and so, by pinning, `⟨a, m⟩`.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {A : ∀ k, Premodel Sig (C k)} {M : ConstMaps Sig}

local notation "𝒮" => interpArrows A M

variable (Sig) in
/-- Fresh constants: outside any finite set there is a constant of each closed type. -/
def FreshConsts : Prop := ∀ σ : Ty, σ.Closed → ∀ N : Set Sig.Const, N.Finite → ∃ c, Sig.typeOf c = σ ∧ c ∉ N

variable (M) in
/-- The root endo-arrows can be undone off any finite set: for each `m` and finite `N`, maps `g`
and `f` with `g` followed by `f` the identity and `f` agreeing with `m` on `N`. -/
def Undoable : Prop :=
  ∀ (m : M.E) (N : Set Sig.Const), N.Finite → ∃ g f : M.E, M.mul g f = M.one ∧ ∀ c ∈ N, M.f f c = M.f m c

theorem undoable_trivial : Undoable (ConstMaps.trivial Sig) :=
  fun _ _ _ => ⟨PUnit.unit, PUnit.unit, rfl, fun _ _ => rfl⟩

/-- An interpretation with one constant re-interpreted. -/
noncomputable def Interp.update {k : ι} {V : C k} (J : Interp A k V) {σ : Ty} (c : Sig.Const) (hc : Sig.typeOf c = σ)
    (a : (A k).Dom V σ) : Interp A k V := by
  classical
  exact fun c' => if h : c' = c then castD (D := fun σ => (A k).Dom V σ) (h ▸ hc).symm a else J c'

theorem Interp.update_at {k : ι} {V : C k} (J : Interp A k V) {σ : Ty} (c : Sig.Const) (hc : Sig.typeOf c = σ)
    (a : (A k).Dom V σ) : (J.update c hc a).at c hc = a := by
  subst hc
  simp [Interp.update, Interp.at, castD]

theorem Interp.update_ne {k : ι} {V : C k} (J : Interp A k V) {σ : Ty} (c : Sig.Const) (hc : Sig.typeOf c = σ)
    (a : (A k).Dom V σ) {c' : Sig.Const} (h : c' ≠ c) : J.update c hc a c' = J c' := by
  simp [Interp.update, h]

theorem PinnedT.endo_mem {ρ : RTy} {RA : Type} {N : Set Sig.Const} {X : Set (RootTuple 𝒮 A ρ RA)}
    (hX : PinnedT N X) {m m' : M.E} (h : ∀ c ∈ N, M.f m c = M.f m' c) (x : RA) :
    (Sum.inl (m, x) : RootTuple 𝒮 A ρ RA) ∈ X ↔ Sum.inl (m', x) ∈ X := by
  have := Set.ext_iff.mp (hX.2 m m' h) (Sum.inl (M.one, x))
  simp only [Set.mem_ofPred_eq, shift] at this
  rwa [M.mul_one, M.mul_one] at this

theorem PinnedT.arr_mem {ρ : RTy} {RA : Type} {N : Set Sig.Const} {X : Set (RootTuple 𝒮 A ρ RA)}
    (hX : PinnedT N X) {k : ι} {U : C k} {J J' : Interp A k U} (h : ∀ c ∈ N, J c = J' c)
    (x : Args (A k).inner ρ U) :
    (Sum.inr ⟨k, U, x, J⟩ : RootTuple 𝒮 A ρ RA) ∈ X ↔ Sum.inr ⟨k, U, x, J'⟩ ∈ X := by
  have := Set.ext_iff.mp (hX.1 k U J J' h) ⟨U, x, 𝟙 U⟩
  have e : ∀ J'' : Interp A k U, (interpArrows A M).R.map (SigmaHom.mk (𝟙 U)) J'' = J'' := Interp.map_id
  simp only [rootTransport, Set.mem_ofPred_eq, e] at this
  exact this

variable (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

local notation "P" => interpSum (pinnedSel A M) pinnedSel_admitsConsts ne
local notation "R" => Premodel.reductAt (interpSum (pinnedSel A M) pinnedSel_admitsConsts ne) (CoalescedSum.base 𝒮)

/-- **BF at every closed type at the finitely pinned root.** -/
theorem pinned_bf (hF : FreshConsts Sig) (hU : Undoable M) (hA : ModelsEverywhere A) (σ : Ty) (hσ : σ.Closed) :
    (P).reduct.HoldsSentence (Sentence.bf σ) := by
  show (R).HoldsSentence (Sentence.bf σ)
  have Mo : (R).IsModel := (P).reduct_isModel (isModel_pinnedSum ne hA)
  have key : ∀ (X : (R).Dom (CoalescedSum.base 𝒮) (.rel (σ ⇒ RTy.t))) {V : CoalescedSum 𝒮}
      (l : CoalescedSum.base 𝒮 ⟶ V) (c : (R).Dom V σ),
      (R).Holds (𝟙 _ ≫ l) (Term.app Term.v1 Term.v0) (.cons c ((R).push l (.cons X .nil))) ↔
        (⟨V, (c, PUnit.unit), l⟩ : Tuple (R).inner (σ ⇒ RTy.t) _) ∈ (R).incl _ _ X :=
    fun X _ l c => (R).holds_app_push (𝟙 _) l X c .nil
  simp only [Premodel.HoldsSentence, Sentence.bf, (R).holds_forall Mo, (R).holds_imp Mo,
    (R).holds_box Mo]
  intro X H V k a
  obtain ⟨N, hN, hX⟩ := X.2.2
  rw [key]
  match V, k, a with
  | .root, m, a =>
    obtain ⟨g, f, hgf, hfm⟩ := hU m N hN
    have hb := (key X (CoalescedSum.endo 𝒮 f) _).1
      (H ((interpAction (pinnedSel A M)).trE σ g a) (CoalescedSum.endo 𝒮 f))
    have e1 : (interpAction (pinnedSel A M)).trE σ f ((interpAction (pinnedSel A M)).trE σ g a) = a :=
      ((interpAction (pinnedSel A M)).trE_mul σ g f a).symm.trans
        ((congrArg (fun m => (interpAction (pinnedSel A M)).trE σ m a) hgf).trans
          ((interpAction (pinnedSel A M)).trE_one σ a))
    have hb' : Sum.inl (f, (a, PUnit.unit)) ∈ X.1 := by
      have : Sum.inl (f, ((interpAction (pinnedSel A M)).trE σ f
          ((interpAction (pinnedSel A M)).trE σ g a), PUnit.unit)) ∈ X.1 := hb
      rwa [e1] at this
    exact (hX.endo_mem hfm _).1 hb'
  | .of ⟨k', U⟩, J, a =>
    obtain ⟨c, hc, hcN⟩ := hF σ hσ N hN
    have hb := (key X (CoalescedSum.arr 𝒮 (iarr M (J.update c hc a))) _).1
      (H (hatConst pinnedSel_admitsConsts σ c hc) (CoalescedSum.arr 𝒮 (iarr M (J.update c hc a))))
    have e1 : (interpAction (pinnedSel A M)).tr σ (iarr M (J.update c hc a))
        (hatConst pinnedSel_admitsConsts σ c hc) = a :=
      (tr_hatConst _ σ c hc _).trans (Interp.update_at J c hc a)
    have hb' : Sum.inr ⟨k', U, (a, PUnit.unit), J.update c hc a⟩ ∈ X.1 := by
      have : Sum.inr ⟨k', U, ((interpAction (pinnedSel A M)).tr σ (iarr M (J.update c hc a))
          (hatConst pinnedSel_admitsConsts σ c hc), PUnit.unit), J.update c hc a⟩ ∈ X.1 := hb
      rwa [e1] at this
    have hJ : ∀ c' ∈ N, J c' = J.update c hc a c' := fun c' hc' =>
      (Interp.update_ne J c hc a fun e => hcN (e ▸ hc')).symm
    exact (hX.arr_mem hJ _).2 hb'

end Classicism.Meta.Coalesced
