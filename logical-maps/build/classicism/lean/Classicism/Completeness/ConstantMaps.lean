import Classicism.Completeness.Theories
import Classicism.Syntax.Constants

/-!
# Constants put for terms, and fresh constants as variables

A **constant map** `θ` in a context `Γ` gives a term of `Γ` of each constant's type; the
term `t.cmap θ` replaces each constant of `t` by its value, carried under binders by
weakening. It commutes with renaming, substitution and conversion, and with holes, so it
carries a derivation to a derivation (`Derivable.cmap`), provided it leaves the constants of
the axioms in place. This is the device behind "a fresh constant behaves like a variable":
put a variable for the constant (`CMap.abstract`), and a derivation about the constant
becomes a derivation about an arbitrary object.

What the Lindenbaum–Henkin construction takes from it is the **witness lemma**
(`consistent_witness`): if a set containing `∃F` is consistent, and the constant `c`
occurs neither in the set nor in `F`, then the set with `F c` is consistent.

The constructions are by structural recursion: they are unfolded in proofs only, never
evaluated by the kernel on large terms.
-/

namespace Classicism.Meta

variable {Sig : Signature}

/-- A constant map in the context `Γ`: a term of each constant's type. -/
abbrev CMap (Sig : Signature) (Γ : Ctx) : Type := ∀ c : Sig.Const, Term Sig Γ (Sig.typeOf c)

namespace CMap

/-- A constant map, renamed. -/
def rename {Γ Δ : Ctx} (r : Ren Γ Δ) (θ : CMap Sig Γ) : CMap Sig Δ := fun c => (θ c).rename r

/-- A constant map, weakened under a binder. -/
abbrev weaken {Γ : Ctx} {τ : Ty} (θ : CMap Sig Γ) : CMap Sig (τ :: Γ) := θ.rename Ren.shift

/-- The map leaves every constant outside `M` in place. -/
def Fixes {Γ : Ctx} (θ : CMap Sig Γ) (M : Set Sig.Const) : Prop := ∀ c, c ∉ M → θ c = .const c

theorem Fixes.rename {Γ Δ : Ctx} {θ : CMap Sig Γ} {M : Set Sig.Const} (h : θ.Fixes M)
    (r : Ren Γ Δ) : (θ.rename r).Fixes M := fun c hc => by
  simp only [CMap.rename, h c hc, Term.rename_const]

end CMap

namespace Term

/-- **Put the values of a constant map for the constants of a term.** -/
def cmap : ∀ {Γ : Ctx} {σ : Ty}, CMap Sig Γ → Term Sig Γ σ → Term Sig Γ σ
  | _, _, _, .var v => .var v
  | _, _, θ, .const c => θ c
  | _, _, θ, .app f a => .app (cmap θ f) (cmap θ a)
  | _, _, θ, .lam b => .lam (cmap θ.weaken b)
  | _, _, _, .and => .and
  | _, _, _, .or => .or
  | _, _, _, .not => .not
  | _, _, _, .all σ => .all σ
  | _, _, _, .ex σ => .ex σ
  | _, _, _, .eq σ => .eq σ
  | _, _, _, .constR ρ => .constR ρ
  | _, _, _, .negR ρ => .negR ρ
  | _, _, _, .andR ρ => .andR ρ
  | _, _, _, .orR ρ => .orR ρ
  | _, _, _, .coextR ρ => .coextR ρ
  | _, _, _, .boxR ρ => .boxR ρ
  | _, _, _, .inclR ρ => .inclR ρ

/-- The constants of a renamed term are its constants. -/
theorem consts_rename : ∀ {Γ Δ : Ctx} (r : Ren Γ Δ) {σ : Ty} (a : Term Sig Γ σ),
    (a.rename r).consts = a.consts
  | _, _, _, _, .var _ | _, _, _, _, .const _ | _, _, _, _, .and | _, _, _, _, .or
  | _, _, _, _, .not | _, _, _, _, .all _ | _, _, _, _, .ex _ | _, _, _, _, .eq _
  | _, _, _, _, .constR _ | _, _, _, _, .negR _ | _, _, _, _, .andR _ | _, _, _, _, .orR _
  | _, _, _, _, .coextR _ | _, _, _, _, .boxR _ | _, _, _, _, .inclR _ => rfl
  | _, _, r, _, .app f a => by
    simp only [rename_app]
    show (f.rename r).consts ∪ (a.rename r).consts = f.consts ∪ a.consts
    rw [consts_rename r f, consts_rename r a]
  | _, _, r, _, .lam b => by
    simp only [rename_lam]
    exact consts_rename (Ren.lift r) b

/-- A map leaving a term's constants in place leaves the term in place. -/
theorem cmap_of_fixes : ∀ {Γ : Ctx} {σ : Ty} {M : Set Sig.Const} (θ : CMap Sig Γ),
    θ.Fixes M → ∀ (t : Term Sig Γ σ), (∀ c ∈ t.consts, c ∉ M) → t.cmap θ = t
  | _, _, _, _, _, .var _, _ | _, _, _, _, _, .and, _ | _, _, _, _, _, .or, _
  | _, _, _, _, _, .not, _ | _, _, _, _, _, .all _, _ | _, _, _, _, _, .ex _, _
  | _, _, _, _, _, .eq _, _ | _, _, _, _, _, .constR _, _ | _, _, _, _, _, .negR _, _
  | _, _, _, _, _, .andR _, _ | _, _, _, _, _, .orR _, _ | _, _, _, _, _, .coextR _, _
  | _, _, _, _, _, .boxR _, _ | _, _, _, _, _, .inclR _, _ => rfl
  | _, _, _, _, hθ, .const c, h => hθ c (h c rfl)
  | _, _, _, θ, hθ, .app f a, h => by
    show Term.app (f.cmap θ) (a.cmap θ) = _
    rw [cmap_of_fixes θ hθ f (fun c hc => h c (Or.inl hc)),
      cmap_of_fixes θ hθ a (fun c hc => h c (Or.inr hc))]
  | _, _, _, θ, hθ, .lam b, h => by
    show Term.lam (b.cmap θ.weaken) = _
    rw [cmap_of_fixes θ.weaken (hθ.rename _) b h]

/-! ### Renaming and substitution -/

theorem CMap.weaken_rename {Γ Δ : Ctx} {τ : Ty} (r : Ren Γ Δ) (θ : CMap Sig Γ) :
    (θ.rename r).weaken (τ := τ) = (θ.weaken).rename (Ren.lift r) := by
  funext c
  exact Term.weaken_rename r (θ c)

/-- Putting constants for constants commutes with renaming. -/
theorem cmap_rename : ∀ {Γ Δ : Ctx} (r : Ren Γ Δ) (θ : CMap Sig Γ) {σ : Ty} (a : Term Sig Γ σ),
    (a.cmap θ).rename r = (a.rename r).cmap (θ.rename r)
  | _, _, _, _, _, .var _ | _, _, _, _, _, .and | _, _, _, _, _, .or
  | _, _, _, _, _, .not | _, _, _, _, _, .all _ | _, _, _, _, _, .ex _ | _, _, _, _, _, .eq _
  | _, _, _, _, _, .constR _ | _, _, _, _, _, .negR _ | _, _, _, _, _, .andR _
  | _, _, _, _, _, .orR _ | _, _, _, _, _, .coextR _ | _, _, _, _, _, .boxR _
  | _, _, _, _, _, .inclR _ | _, _, _, _, _, .const _ => rfl
  | _, _, r, θ, _, .app f a => by
    simp only [cmap, rename_app, cmap_rename r θ f, cmap_rename r θ a]
  | _, _, r, θ, _, .lam b => by
    simp only [cmap, rename_lam, cmap_rename (Ren.lift r) θ.weaken b, CMap.weaken_rename]

theorem cmap_weaken {Γ : Ctx} {τ σ : Ty} (θ : CMap Sig Γ) (a : Term Sig Γ σ) :
    (a.weaken (τ := τ)).cmap θ.weaken = (a.cmap θ).weaken :=
  (cmap_rename Ren.shift θ a).symm

end Term

/-- A substitution with constants put for constants in its terms. -/
def Sub.cmap {Γ Δ : Ctx} (θ : CMap Sig Δ) (s : Sub Sig Γ Δ) : Sub Sig Γ Δ :=
  fun _ v => (s _ v).cmap θ

theorem Sub.cmap_lift {Γ Δ : Ctx} {σ : Ty} (θ : CMap Sig Δ) (s : Sub Sig Γ Δ) :
    Sub.cmap θ.weaken (Sub.lift s (σ := σ)) = Sub.lift (Sub.cmap θ s) := by
  funext τ v
  cases v with
  | zero => rfl
  | succ v => exact Term.cmap_weaken θ (s _ v)

namespace Term

theorem subst_weaken_lift {Γ Δ : Ctx} {σ τ : Ty} (s : Sub Sig Γ Δ) (a : Term Sig Γ σ) :
    (a.weaken (τ := τ)).subst (Sub.lift s) = (a.subst s).weaken := by
  simp only [weaken, subst_rename, rename_subst]
  rfl

/-- Putting constants for constants commutes with substitution, when the map at the target
is the map at the source with the substitution applied. -/
theorem cmap_subst : ∀ {Γ Δ : Ctx} (s : Sub Sig Γ Δ) (θΓ : CMap Sig Γ) (θΔ : CMap Sig Δ),
    (∀ c, (θΓ c).subst (Sub.cmap θΔ s) = θΔ c) → ∀ {σ : Ty} (a : Term Sig Γ σ),
    (a.cmap θΓ).subst (Sub.cmap θΔ s) = (a.subst s).cmap θΔ
  | _, _, _, _, _, _, _, .var _ | _, _, _, _, _, _, _, .and | _, _, _, _, _, _, _, .or
  | _, _, _, _, _, _, _, .not | _, _, _, _, _, _, _, .all _ | _, _, _, _, _, _, _, .ex _
  | _, _, _, _, _, _, _, .eq _ | _, _, _, _, _, _, _, .constR _ | _, _, _, _, _, _, _, .negR _
  | _, _, _, _, _, _, _, .andR _ | _, _, _, _, _, _, _, .orR _ | _, _, _, _, _, _, _, .coextR _
  | _, _, _, _, _, _, _, .boxR _ | _, _, _, _, _, _, _, .inclR _ => rfl
  | _, _, _, _, _, h, _, .const c => h c
  | _, _, s, θΓ, θΔ, h, _, .app f a => by
    simp only [cmap, subst_app, cmap_subst s θΓ θΔ h f, cmap_subst s θΓ θΔ h a]
  | _, _, s, θΓ, θΔ, h, _, .lam b => by
    simp only [cmap, subst_lam]
    rw [← Sub.cmap_lift, cmap_subst (Sub.lift s) θΓ.weaken θΔ.weaken (fun c => by
      show ((θΓ c).weaken).subst (Sub.cmap θΔ.weaken (Sub.lift s)) = (θΔ c).weaken
      rw [Sub.cmap_lift, subst_weaken_lift, h c]) b]

theorem cmap_instantiate {Γ : Ctx} {σ τ : Ty} (θ : CMap Sig Γ) (b : Term Sig (σ :: Γ) τ)
    (a : Term Sig Γ σ) :
    (b.instantiate a).cmap θ = (b.cmap θ.weaken).instantiate (a.cmap θ) := by
  have e : Sub.cmap θ (Sub.cons a Sub.id) = Sub.cons (a.cmap θ) Sub.id := by
    funext τ v; cases v <;> rfl
  simp only [instantiate]
  rw [← e, cmap_subst (Sub.cons a Sub.id) θ.weaken θ (fun c => by
    rw [e]; exact instantiate_weaken (θ c) (a.cmap θ)) b]

/-- The unfoldings have no constants, so they are left as they are. -/
theorem unfoldR_cmap {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) :
    ∀ {a b : Term Sig Γ σ}, a.unfoldR = some b → (a.cmap θ).unfoldR = some (b.cmap θ)
  | .var _, _, h | .const _, _, h | .app _ _, _, h | .lam _, _, h | .and, _, h | .or, _, h
  | .not, _, h | .all _, _, h | .ex _, _, h | .eq _, _, h => nomatch h
  | .constR ρ, _, h | .negR ρ, _, h | .andR ρ, _, h | .orR ρ, _, h | .coextR ρ, _, h
  | .boxR ρ, _, h | .inclR ρ, _, h => by
    cases ρ <;> (simp only [unfoldR, unfoldConst, unfoldNeg, unfoldAnd, unfoldOr, unfoldCoext,
      unfoldBox, unfoldIncl, Option.some.injEq] at h; subst h; rfl)

end Term

/-! ### Conversion -/

theorem Beta.cmap {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) {a b : Term Sig Γ σ} (h : Beta a b) :
    Beta (a.cmap θ) (b.cmap θ) := by
  cases h with
  | intro b a =>
    show Beta (.app (.lam (b.cmap θ.weaken)) (a.cmap θ)) _
    rw [Term.cmap_instantiate]
    exact Beta.intro _ _

theorem Eta.cmap {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) {a b : Term Sig Γ σ} (h : Eta a b) :
    Eta (a.cmap θ) (b.cmap θ) := by
  cases h with
  | intro f =>
    show Eta (.lam (.app (f.weaken.cmap θ.weaken) (.var .zero))) (f.cmap θ)
    rw [Term.cmap_weaken]
    exact Eta.intro _

theorem Step.cmap : ∀ {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) {a b : Term Sig Γ σ},
    Step BetaEta a b → Step BetaEta (a.cmap θ) (b.cmap θ)
  | _, _, θ, _, _, .here h => .here (h.elim (fun h => Or.inl (Beta.cmap θ h))
      (fun h => h.elim (fun h => Or.inr (Or.inl (Eta.cmap θ h)))
        (fun h => Or.inr (Or.inr (Term.unfoldR_cmap θ h)))))
  | _, _, θ, _, _, .appL h => .appL (Step.cmap θ h)
  | _, _, θ, _, _, .appR h => .appR (Step.cmap θ h)
  | _, _, θ, _, _, .lam h => .lam (Step.cmap θ.weaken h)

theorem Conv.cmap {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) {a b : Term Sig Γ σ} (h : a ≡ b) :
    a.cmap θ ≡ b.cmap θ := by
  induction h with
  | rel h => exact EqvGen.rel (Step.cmap θ h)
  | refl _ => exact EqvGen.refl _
  | symm _ ih => exact EqvGen.symm ih
  | trans _ _ ih₁ ih₂ => exact EqvGen.trans ih₁ ih₂

/-! ### Holes -/

namespace Hole

/-- The constant map, carried under the binders above the hole. -/
def cθ : ∀ {Γ Γ' : Ctx} {σ τ : Ty}, Hole Sig Γ σ Γ' τ → CMap Sig Γ → CMap Sig Γ'
  | _, _, _, _, .hole, θ => θ
  | _, _, _, _, .appL C _, θ => cθ C θ
  | _, _, _, _, .appR _ C, θ => cθ C θ
  | _, _, _, _, .lam C, θ => cθ C θ.weaken

/-- A hole with constants put for its constants. -/
def cmap : ∀ {Γ Γ' : Ctx} {σ τ : Ty}, CMap Sig Γ → Hole Sig Γ σ Γ' τ → Hole Sig Γ σ Γ' τ
  | _, _, _, _, _, .hole => .hole
  | _, _, _, _, θ, .appL C b => .appL (cmap θ C) (b.cmap θ)
  | _, _, _, _, θ, .appR f C => .appR (f.cmap θ) (cmap θ C)
  | _, _, _, _, θ, .lam C => .lam (cmap θ.weaken C)

theorem plug_cmap : ∀ {Γ Γ' : Ctx} {σ τ : Ty} (θ : CMap Sig Γ) (C : Hole Sig Γ σ Γ' τ)
    (a : Term Sig Γ' τ), (C.plug a).cmap θ = (C.cmap θ).plug (a.cmap (C.cθ θ))
  | _, _, _, _, _, .hole, _ => rfl
  | _, _, _, _, θ, .appL C b, a => by simp only [plug, cmap, cθ, Term.cmap, plug_cmap θ C a]
  | _, _, _, _, θ, .appR f C, a => by simp only [plug, cmap, cθ, Term.cmap, plug_cmap θ C a]
  | _, _, _, _, θ, .lam C, a => by simp only [plug, cmap, cθ, Term.cmap, plug_cmap θ.weaken C a]

theorem cθ_fixes : ∀ {Γ Γ' : Ctx} {σ τ : Ty} (C : Hole Sig Γ σ Γ' τ) {θ : CMap Sig Γ}
    {M : Set Sig.Const}, θ.Fixes M → (C.cθ θ).Fixes M
  | _, _, _, _, .hole, _, _, h => h
  | _, _, _, _, .appL C _, _, _, h => cθ_fixes C h
  | _, _, _, _, .appR _ C, _, _, h => cθ_fixes C h
  | _, _, _, _, .lam C, _, _, h => cθ_fixes C (h.rename _)

end Hole

/-! ### Derivations -/

theorem Hyps.map_cmap_weaken {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) (Δ : List (Formula Sig Γ)) :
    (Hyps.weaken (σ := σ) Δ).map (Term.cmap θ.weaken) = Hyps.weaken (Δ.map (Term.cmap θ)) := by
  simp only [Hyps.weaken, List.map_map]
  congr 1
  funext a
  exact Term.cmap_weaken θ a

/-- **A derivation, with constants put for constants**, is a derivation, provided the map
leaves the constants of the axioms in place. By induction on the derivation, as
`Derivable.elim` is. -/
theorem Derivable.cmap {M : Set Sig.Const} : ∀ {Ax : AxiomSet Sig},
    (∀ a, Ax a → ∀ c ∈ a.consts, c ∉ M) → ∀ {Γ : Ctx} (θ : CMap Sig Γ), θ.Fixes M →
    ∀ {Δ : List (Formula Sig Γ)} {p : Formula Sig Γ},
    Derivable Ax Δ p → Derivable Ax (Δ.map (Term.cmap θ)) (p.cmap θ)
  | _, _, _, _, _, _, _, hyp h => hyp (List.mem_map.2 ⟨_, h, rfl⟩)
  | _, hA, _, θ, hθ, _, _, ax (a := a) h => by
    rw [Term.cmap_of_fixes θ hθ _ (fun c hc => hA a h c (by rwa [Term.consts_rename] at hc))]
    exact ax h
  | _, hA, _, θ, hθ, _, _, andI h₁ h₂ => andI (Derivable.cmap hA θ hθ h₁) (Derivable.cmap hA θ hθ h₂)
  | _, hA, _, θ, hθ, _, _, andE₁ h => andE₁ (Derivable.cmap hA θ hθ h)
  | _, hA, _, θ, hθ, _, _, andE₂ h => andE₂ (Derivable.cmap hA θ hθ h)
  | _, hA, _, θ, hθ, _, _, orI₁ h => orI₁ (Derivable.cmap hA θ hθ h)
  | _, hA, _, θ, hθ, _, _, orI₂ h => orI₂ (Derivable.cmap hA θ hθ h)
  | _, hA, _, θ, hθ, _, _, orE h h₁ h₂ =>
    orE (Derivable.cmap hA θ hθ h) (Derivable.cmap hA θ hθ h₁) (Derivable.cmap hA θ hθ h₂)
  | _, hA, _, θ, hθ, _, _, notI h₁ h₂ => notI (Derivable.cmap hA θ hθ h₁) (Derivable.cmap hA θ hθ h₂)
  | _, hA, _, θ, hθ, _, _, notE h₁ h₂ => notE (Derivable.cmap hA θ hθ h₁) (Derivable.cmap hA θ hθ h₂)
  | _, _, _, _, _, _, _, em _ => em _
  | _, hA, _, θ, hθ, _, _, allE h a => allE (Derivable.cmap hA θ hθ h) (a.cmap θ)
  | _, hA, _, θ, hθ, _, _, exI a h => exI (a.cmap θ) (Derivable.cmap hA θ hθ h)
  | _, hA, _, θ, hθ, _, _, allI h => by
    have := Derivable.cmap hA θ.weaken (hθ.rename _) h
    rw [Hyps.map_cmap_weaken] at this
    exact allI this
  | _, hA, _, θ, hθ, Δ, _, exE (F := F) (r := q) h h' => by
    have this := Derivable.cmap hA θ.weaken (hθ.rename _) h'
    have e : (Term.app F.weaken (.var .zero) :: Hyps.weaken Δ).map (Term.cmap θ.weaken)
        = Term.app (F.cmap θ).weaken (.var .zero) :: Hyps.weaken (Δ.map (Term.cmap θ)) := by
      simp only [List.map_cons, Hyps.map_cmap_weaken, Term.cmap, Term.cmap_weaken]
    rw [e, Term.cmap_weaken] at this
    exact exE (Derivable.cmap hA θ hθ h) this
  | _, _, _, _, _, _, _, refl a => refl _
  | _, hA, _, θ, hθ, _, _, ll F h₁ h₂ => ll (F.cmap θ) (Derivable.cmap hA θ hθ h₁) (Derivable.cmap hA θ hθ h₂)
  | _, hA, _, θ, hθ, _, _, subst C h₁ h₂ h₃ => by
    have hA' : ∀ a, AxiomSet.logical _ a → ∀ c ∈ a.consts, c ∉ M := fun a ha => hA a ha.1
    have h₁' := Derivable.cmap hA' (C.cθ θ) (Hole.cθ_fixes C hθ) h₁
    have h₂' := Derivable.cmap hA' (C.cθ θ) (Hole.cθ_fixes C hθ) h₂
    have h₃' := Derivable.cmap hA θ hθ h₃
    rw [Hole.plug_cmap] at h₃' ⊢
    exact subst (C.cmap θ) h₁' h₂' h₃'
  | _, hA, _, θ, hθ, _, _, conv h c => conv (Derivable.cmap hA θ hθ h) (Conv.cmap θ c)

/-! ### A constant as a variable -/

open Classical in
/-- Put the variable `x` for the constant `c`, and leave the other constants. -/
noncomputable def CMap.abstract {Γ : Ctx} (c : Sig.Const) (x : Var Γ (Sig.typeOf c)) : CMap Sig Γ :=
  fun c' => if h : c' = c then h ▸ Term.var x else Term.const c'

theorem CMap.abstract_self {Γ : Ctx} (c : Sig.Const) (x : Var Γ (Sig.typeOf c)) :
    CMap.abstract c x c = Term.var x := by
  simp [CMap.abstract]

theorem CMap.abstract_fixes {Γ : Ctx} (c : Sig.Const) (x : Var Γ (Sig.typeOf c)) :
    (CMap.abstract c x).Fixes {c} := fun c' hc' => by
  simp only [Set.mem_singleton_iff] at hc'
  simp [CMap.abstract, hc']

/-- The axioms of `C` have no constants. -/
theorem C.axioms_consts {a : Sentence Sig} (h : C.axioms a) (c : Sig.Const) : c ∉ a.consts := by
  cases h; simp [Meta.existence_e, Term.consts]

namespace Completeness

/-- A list of sentences from `A` with `p`, as `p` with a list from `A`. -/
theorem List.exists_sub_cons {α : Type} {A : α → Prop} {p : α} :
    ∀ (L : List α), (∀ q ∈ L, A q ∨ q = p) → ∃ L₀ : List α, (∀ q ∈ L₀, A q) ∧ L ⊆ p :: L₀
  | [], _ => ⟨[], by simp, by simp⟩
  | q :: L, h => by
    obtain ⟨L₀, hL₀, hs⟩ := List.exists_sub_cons L (fun r hr => h r (List.mem_cons_of_mem _ hr))
    rcases h q List.mem_cons_self with hq | rfl
    · refine ⟨q :: L₀, fun r hr => ?_, ?_⟩
      · rcases List.mem_cons.1 hr with rfl | hr
        · exact hq
        · exact hL₀ r hr
      · intro r hr
        rcases List.mem_cons.1 hr with rfl | hr
        · simp
        · rcases List.mem_cons.1 (hs hr) with rfl | hr'
          · simp
          · simp [hr']
    · exact ⟨L₀, hL₀, List.cons_subset.2 ⟨List.mem_cons_self, hs⟩⟩

/-- **The witness lemma.** If a consistent set contains `∃F`, and the constant `c` occurs
neither in the set nor in `F`, the set with `F c` is consistent. A derivation of `⊥` from
`F c` and sentences of the set becomes, with a variable put for `c`, a derivation of `⊥`
from `F v` and the same sentences, which with `∃F` discharges `F v`. -/
theorem consistent_witness {A : AxiomSet Sig} (c : Sig.Const)
    {F : Term Sig [] (Sig.typeOf c ⇒ RTy.t)} (hA : ∀ q, A q → c ∉ q.consts) (hF : c ∉ F.consts)
    (hex : A (.app (.ex _) F)) (h : AxiomSet.Consistent A) :
    AxiomSet.Consistent (fun q => A q ∨ q = .app F (.const c)) := by
  rw [consistent_iff] at h ⊢
  intro L hL d
  obtain ⟨L₀, hL₀, hs⟩ := List.exists_sub_cons L hL
  have d₀ : C.Derivable (.app F (.const c) :: L₀) Term.bot := Derivable.weaken d hs
  -- into the context of one variable, then the variable for `c`
  have d₁ := Derivable.cmap (M := {c}) (fun a ha c' hc' => absurd hc' (C.axioms_consts ha c'))
    (CMap.abstract c (.zero : Var [Sig.typeOf c] _)) (CMap.abstract_fixes _ _)
    (Derivable.rename (Ren.shift (σ := Sig.typeOf c)) d₀)
  have eF : (F.weaken (τ := Sig.typeOf c)).cmap (CMap.abstract c .zero) = F.weaken :=
    Term.cmap_of_fixes _ (CMap.abstract_fixes _ _) _ (fun c' hc' => by
      rw [Term.consts_rename] at hc'
      simp only [Set.mem_singleton_iff]
      rintro rfl; exact hF hc')
  have eL : (L₀.map (Term.rename Ren.shift)).map (Term.cmap (CMap.abstract c .zero)) =
      Hyps.weaken (σ := Sig.typeOf c) L₀ := by
    simp only [List.map_map, Hyps.weaken]
    refine List.map_congr_left fun q hq => ?_
    show (q.weaken).cmap _ = q.weaken
    refine Term.cmap_of_fixes _ (CMap.abstract_fixes _ _) _ (fun c' hc' => ?_)
    rw [Term.consts_rename] at hc'
    simp only [Set.mem_singleton_iff]
    rintro rfl; exact hA q (hL₀ q hq) hc'
  have e₁ : ((Term.app F (.const c) :: L₀ : List (Sentence Sig)).map (Term.rename Ren.shift)).map
      (Term.cmap (CMap.abstract c (.zero : Var [Sig.typeOf c] _))) =
      Term.app F.weaken (.var .zero) :: Hyps.weaken L₀ := by
    rw [List.map_cons, List.map_cons, ← eL]
    congr 1
    show Term.app ((F.weaken).cmap _) (CMap.abstract c .zero c) = _
    rw [eF, CMap.abstract_self]
  have e₂ : (Term.bot : Sentence Sig).weaken.cmap (CMap.abstract c (.zero : Var [Sig.typeOf c] _)) =
      (Term.bot : Sentence Sig).weaken := rfl
  simp only [Hyps.rename] at d₁
  rw [e₁, e₂] at d₁
  refine h (.app (.ex _) F :: L₀) (fun q hq => ?_) ?_
  · rcases List.mem_cons.1 hq with rfl | hq
    · exact hex
    · exact hL₀ q hq
  · exact Derivable.exE Derivable.hyp₀ (Derivable.weaken d₁ (List.cons_subset_cons _
      (List.map_subset_of_subset _ (List.subset_cons_self _ _))))

end Completeness

end Classicism.Meta
