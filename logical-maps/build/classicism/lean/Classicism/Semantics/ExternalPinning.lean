import Classicism.Semantics.Symmetric

/-!
# Semantic closure with an independent pinning action

The action used to compare arrows need not interpret the individual type.
This isolates the generalization needed by `fixed-point-entrance-cone.md`,
section 1 (research/2026-10-22/notes; original construction, misc, unpaginated).
The proof adapts the existing `sem_pinned` induction and the symmetric model
closure argument without changing either shared source. No modelhood or
semantic closure conclusion is assumed: the hypotheses concern inner values
and admission of externally pinned symmetric intensions.
-/

namespace Classicism.Meta.Intensional.ExternalPinning

open CategoryTheory

variable {C : Type} [SmallCategory C] {Sig : Signature}
variable (B : Premodel Sig C) (De : C ⥤ Type)

/-- Outer pinning through an external action `De`. -/
def PinnedO (σ : Ty) {W : C} (N : Set (De.obj W))
    (x : Outer B.inner σ W) : Prop :=
  ∀ (V : C) (h i : W ⟶ V), AgreeOn De N h i →
    Outer.map B.inner σ h x = Outer.map B.inner σ i x

theorem PinnedO.mono {σ : Ty} {W : C} {N M : Set (De.obj W)}
    (hNM : N ⊆ M) {x : Outer B.inner σ W}
    (hx : PinnedO B De σ N x) : PinnedO B De σ M x :=
  fun _ h i ha => hx _ h i (ha.mono De hNM)

theorem pinnedO_Incl_iff (σ : Ty) {W : C} (N : Set (De.obj W)) (x : B.Dom W σ) :
    PinnedO B De σ N (B.Incl σ W x) ↔ PinnedBy De (B.inner σ) N x := by
  constructor
  · intro hp V h i ha
    apply B.Incl_injective
    rw [B.Incl_map, B.Incl_map]
    exact hp V h i ha
  · intro hp V h i ha
    rw [← B.Incl_map, ← B.Incl_map, hp V h i ha]

theorem pinnedO_apply {σ : Ty} {ρ : RTy} {W : C} {N : Set (De.obj W)}
    {F : Intension B.inner (.arr σ ρ) W} {x : Outer B.inner σ W}
    (hF : PinnedO B De (.rel (.arr σ ρ)) N F) (hx : PinnedO B De σ N x) :
    PinnedO B De (.rel ρ) N (B.apply F x) := by
  intro V h i ha
  rw [Outer.map_rel, Outer.map_rel, ← B.apply_map, ← B.apply_map, hx V h i ha]
  have hf := hF V h i ha
  rw [Outer.map_rel, Outer.map_rel] at hf
  rw [hf]

theorem push_eq_of_pinned {Γ : Ctx} {W V : C} (g : IEnv (B.Dom W) Γ)
    (N : Set (De.obj W))
    (hg : ∀ τ (v : Var Γ τ), PinnedO B De τ N (B.Incl τ W (g.get v)))
    {h i : W ⟶ V} (ha : AgreeOn De N h i) : B.push h g = B.push i g := by
  apply IEnv.ext
  intro τ v
  simp only [Premodel.push, IEnv.get_map]
  exact (pinnedO_Incl_iff B De τ N (g.get v)).1 (hg τ v) V h i ha

/-- A term is pinned by any external set pinning its parameters and constants. -/
theorem sem_pinned : ∀ {Γ : Ctx} {σ : Ty} {W : C} (h : B.W₀ ⟶ W)
    (t : Term Sig Γ σ) (g : IEnv (B.Dom W) Γ) (N : Set (De.obj W)),
    (∀ τ (v : Var Γ τ), PinnedO B De τ N (B.Incl τ W (g.get v))) →
    (∀ c ∈ t.consts, PinnedO B De _ N (B.Incl _ W ((B.inner _).map h (B.I c)))) →
    PinnedO B De σ N (B.sem h t g)
  | _, _, _, _, .var v, g, N, hg, _ => hg _ v
  | _, _, _, _, .const c, _, N, _, hc => hc c (Set.mem_singleton c)
  | _, _, _, h, .app f a, g, N, hg, hc =>
    pinnedO_apply B De
      (sem_pinned h f g N hg (fun c hc' => hc c (Term.consts_app_left f a hc')))
      (sem_pinned h a g N hg (fun c hc' => hc c (Term.consts_app_right f a hc')))
  | _, _, _, h, .lam b, g, N, hg, hc => by
    intro V h' i' ha
    rw [← B.sem_push, ← B.sem_push, push_eq_of_pinned B De g N hg ha]
    apply B.sem_congr_const
    intro c hc'
    rw [Functor.map_comp, Functor.map_comp]
    exact (pinnedO_Incl_iff B De _ N _).1 (hc c hc') V h' i' ha
  | _, _, _, _, .and, _, _, _, _ | _, _, _, _, .or, _, _, _, _
  | _, _, _, _, .not, _, _, _, _ | _, _, _, _, .all _, _, _, _, _
  | _, _, _, _, .ex _, _, _, _, _ | _, _, _, _, .eq _, _, _, _, _
  | _, _, _, _, .constR _, _, _, _, _ | _, _, _, _, .negR _, _, _, _, _
  | _, _, _, _, .andR _, _, _, _, _ | _, _, _, _, .orR _, _, _, _, _
  | _, _, _, _, .coextR _, _, _, _, _ | _, _, _, _, .boxR _, _, _, _, _
  | _, _, _, _, .inclR _, _, _, _, _ => fun _ _ _ _ => rfl

theorem env_idealPinned (J : PinIdeal De)
    (hfin : ∀ (σ : Ty) (W : C) (x : B.Dom W σ),
      ∃ N, N ∈ J.mem W ∧ PinnedO B De σ N (B.Incl σ W x)) :
    ∀ {Γ : Ctx} {W : C} (g : IEnv (B.Dom W) Γ),
      ∃ N, N ∈ J.mem W ∧ ∀ τ (v : Var Γ τ),
        PinnedO B De τ N (B.Incl τ W (g.get v))
  | _, _, .nil => ⟨∅, J.finite Set.finite_empty, fun _ v => nomatch v⟩
  | _, _, .cons x g => by
    obtain ⟨N, hN, hg⟩ := env_idealPinned J hfin g
    obtain ⟨M, hM, hx⟩ := hfin _ _ x
    refine ⟨N ∪ M, J.union hN hM, fun τ v => ?_⟩
    cases v with
    | zero => exact PinnedO.mono B De Set.subset_union_right hx
    | succ v => exact PinnedO.mono B De Set.subset_union_left (hg _ v)

theorem consts_idealPinned (J : PinIdeal De)
    (hfin : ∀ (σ : Ty) (W : C) (x : B.Dom W σ),
      ∃ N, N ∈ J.mem W ∧ PinnedO B De σ N (B.Incl σ W x))
    {Γ : Ctx} {σ : Ty} {W : C} (h : B.W₀ ⟶ W) (t : Term Sig Γ σ) :
    ∃ N, N ∈ J.mem W ∧ ∀ c ∈ t.consts,
      PinnedO B De _ N (B.Incl _ W ((B.inner _).map h (B.I c))) := by
  classical
  choose N hN using fun c : Sig.Const => hfin (Sig.typeOf c) W ((B.inner _).map h (B.I c))
  refine ⟨⋃ c ∈ t.consts, N c, J.biUnion (Term.consts_finite t) fun c _ => (hN c).1,
    fun c hc => ?_⟩
  exact PinnedO.mono B De (Set.subset_biUnion_of_mem (u := N) hc) (hN c).2

/-- External pinning plus symmetric admission gives actual term closure. -/
theorem isModel_of_pinned_sym (J : PinIdeal De) {G : ∀ V : C, Set (V ⟶ V)}
    (hG : SymGroup G) (hD : B.DomSym G)
    (hfin : ∀ (σ : Ty) (W : C) (x : B.Dom W σ),
      ∃ N, N ∈ J.mem W ∧ PinnedO B De σ N (B.Incl σ W x))
    (hinner : ∀ (ρ : RTy) (W : C) (F : Intension B.inner ρ W),
      (∃ N, N ∈ J.mem W ∧ PinnedO B De (.rel ρ) N F) → B.Sym G F →
        F ∈ Set.range (B.incl ρ W)) : B.IsModel := fun {_ σ W} h t g => by
  obtain ⟨N, hN, hg⟩ := env_idealPinned B De J hfin g
  obtain ⟨M, hM, hc⟩ := consts_idealPinned B De J hfin h t
  have hp := sem_pinned B De h t g (N ∪ M)
    (fun τ v => PinnedO.mono B De Set.subset_union_left (hg τ v))
    (fun c hc' => PinnedO.mono B De Set.subset_union_right (hc c hc'))
  have hs := B.sem_symmetric hG hD h t g
  cases σ with
  | e => exact ⟨_, rfl⟩
  | rel ρ => exact hinner ρ W _ ⟨N ∪ M, J.union hN hM, hp⟩ hs
  | var _ => exact ⟨_, rfl⟩

end Classicism.Meta.Intensional.ExternalPinning
