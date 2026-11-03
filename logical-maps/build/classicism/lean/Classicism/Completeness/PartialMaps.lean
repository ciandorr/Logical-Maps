import Classicism.Completeness.ConstantMaps

/-!
# Partial constant maps, and the finite support of a derivation

A **partial constant map** from `Sig₁` to `Sig₂` in a context `Δ` gives, for some
constants of `Sig₁`, a term of `Sig₂` in `Δ` of the constant's type. With a renaming of the
variables it acts on terms (`Term.omap`), defined on a term just when every constant of
the term is in the map's domain. It commutes with renaming and substitution and
preserves conversion, and it carries a derivation to a derivation, **for every map whose
domain contains a finite set of constants depending on the derivation**
(`Derivable.omap_support`): the constants the derivation uses beyond those of its
conclusion and hypotheses (an instance in `∀`-elimination, the eliminated formula of a
cut, the middle term of a chain of conversions). This is the sense in which a derivation
uses finitely many constants.

Its use (`Completeness/ReserveConservativity.lean`) is to eliminate the reserve constants
from a derivation in the ambient signature: those at a type variable have no closed term
to become, so they become variables, finitely many, and a total map cannot do that.
-/

namespace Classicism.Meta

variable {Sig₁ Sig₂ : Signature}

/-- A partial constant map in the context `Δ`. -/
abbrev OMap (Sig₁ Sig₂ : Signature) (Δ : Ctx) : Type :=
  ∀ c : Sig₁.Const, Option (Term Sig₂ Δ (Sig₁.typeOf c))

namespace OMap

/-- A partial constant map, renamed. -/
def rename {Δ Δ' : Ctx} (r : Ren Δ Δ') (θ : OMap Sig₁ Sig₂ Δ) : OMap Sig₁ Sig₂ Δ' :=
  fun c => (θ c).map (Term.rename r)

/-- A partial constant map, weakened under a binder. -/
abbrev weaken {Δ : Ctx} {τ : Ty} (θ : OMap Sig₁ Sig₂ Δ) : OMap Sig₁ Sig₂ (τ :: Δ) :=
  θ.rename Ren.shift

/-- The map is defined on every constant of `F`. -/
def Covers {Δ : Ctx} (θ : OMap Sig₁ Sig₂ Δ) (F : Set Sig₁.Const) : Prop :=
  ∀ c ∈ F, (θ c).isSome

theorem Covers.rename {Δ Δ' : Ctx} {θ : OMap Sig₁ Sig₂ Δ} {F : Set Sig₁.Const} (h : θ.Covers F)
    (r : Ren Δ Δ') : (θ.rename r).Covers F := fun c hc => by
  simpa [OMap.rename] using h c hc

theorem Covers.mono {Δ : Ctx} {θ : OMap Sig₁ Sig₂ Δ} {F G : Set Sig₁.Const} (h : θ.Covers G)
    (hFG : F ⊆ G) : θ.Covers F := fun c hc => h c (hFG hc)

end OMap

namespace Term

/-- A term with its variables renamed by `r` and its constants mapped by `θ`; `none` when
some constant is outside the domain. -/
def omap : ∀ {Γ Δ : Ctx} {σ : Ty}, Ren Γ Δ → OMap Sig₁ Sig₂ Δ → Term Sig₁ Γ σ →
    Option (Term Sig₂ Δ σ)
  | _, _, _, r, _, .var v => some (.var (r _ v))
  | _, _, _, _, θ, .const c => θ c
  | _, _, _, r, θ, .app f a => (omap r θ f).bind fun f' => (omap r θ a).map fun a' => .app f' a'
  | _, _, _, r, θ, .lam b => (omap (Ren.lift r) θ.weaken b).map .lam
  | _, _, _, _, _, .and => some .and
  | _, _, _, _, _, .or => some .or
  | _, _, _, _, _, .not => some .not
  | _, _, _, _, _, .all σ => some (.all σ)
  | _, _, _, _, _, .ex σ => some (.ex σ)
  | _, _, _, _, _, .eq σ => some (.eq σ)
  | _, _, _, _, _, .constR ρ => some (.constR ρ)
  | _, _, _, _, _, .negR ρ => some (.negR ρ)
  | _, _, _, _, _, .andR ρ => some (.andR ρ)
  | _, _, _, _, _, .orR ρ => some (.orR ρ)
  | _, _, _, _, _, .coextR ρ => some (.coextR ρ)
  | _, _, _, _, _, .boxR ρ => some (.boxR ρ)
  | _, _, _, _, _, .inclR ρ => some (.inclR ρ)

section
variable {Γ Δ : Ctx} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ)

theorem omap_app_eq_some {σ : Ty} {ρ : RTy} {f : Term Sig₁ Γ (σ ⇒ ρ)} {a : Term Sig₁ Γ σ}
    {x : Term Sig₂ Δ ρ} :
    omap r θ (.app f a) = some x ↔
      ∃ f' a', omap r θ f = some f' ∧ omap r θ a = some a' ∧ x = .app f' a' := by
  simp only [omap, Option.bind_eq_some_iff, Option.map_eq_some_iff]
  constructor
  · rintro ⟨f', hf, a', ha, rfl⟩; exact ⟨f', a', hf, ha, rfl⟩
  · rintro ⟨f', a', hf, ha, rfl⟩; exact ⟨f', hf, a', ha, rfl⟩

theorem omap_app_of {σ : Ty} {ρ : RTy} {f : Term Sig₁ Γ (σ ⇒ ρ)} {a : Term Sig₁ Γ σ}
    {f' : Term Sig₂ Δ (σ ⇒ ρ)} {a' : Term Sig₂ Δ σ} (hf : omap r θ f = some f')
    (ha : omap r θ a = some a') : omap r θ (.app f a) = some (.app f' a') :=
  (omap_app_eq_some r θ).2 ⟨f', a', hf, ha, rfl⟩

theorem omap_lam_eq_some {σ : Ty} {ρ : RTy} {b : Term Sig₁ (σ :: Γ) ρ} {x : Term Sig₂ Δ (σ ⇒ ρ)} :
    omap r θ (.lam b) = some x ↔ ∃ b', omap (Ren.lift r) θ.weaken b = some b' ∧ x = .lam b' := by
  simp only [omap, Option.map_eq_some_iff]
  constructor
  · rintro ⟨b', hb, rfl⟩; exact ⟨b', hb, rfl⟩
  · rintro ⟨b', hb, rfl⟩; exact ⟨b', hb, rfl⟩

theorem omap_lam_of {σ : Ty} {ρ : RTy} {b : Term Sig₁ (σ :: Γ) ρ} {b' : Term Sig₂ (σ :: Δ) ρ}
    (hb : omap (Ren.lift r) θ.weaken b = some b') : omap r θ (.lam b) = some (.lam b') :=
  (omap_lam_eq_some r θ).2 ⟨b', hb, rfl⟩

end

/-- **Defined on a term whose constants are in the domain.** -/
theorem omap_isSome : ∀ {Γ Δ : Ctx} {σ : Ty} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ)
    (t : Term Sig₁ Γ σ), θ.Covers t.consts → ∃ t', omap r θ t = some t'
  | _, _, _, _, _, .var _, _ | _, _, _, _, _, .and, _ | _, _, _, _, _, .or, _
  | _, _, _, _, _, .not, _ | _, _, _, _, _, .all _, _ | _, _, _, _, _, .ex _, _
  | _, _, _, _, _, .eq _, _ | _, _, _, _, _, .constR _, _ | _, _, _, _, _, .negR _, _
  | _, _, _, _, _, .andR _, _ | _, _, _, _, _, .orR _, _ | _, _, _, _, _, .coextR _, _
  | _, _, _, _, _, .boxR _, _ | _, _, _, _, _, .inclR _, _ => ⟨_, rfl⟩
  | _, _, _, _, θ, .const c, h => Option.isSome_iff_exists.1 (h c rfl)
  | _, _, _, r, θ, .app f a, h => by
    obtain ⟨f', hf⟩ := omap_isSome r θ f (h.mono Set.subset_union_left)
    obtain ⟨a', ha⟩ := omap_isSome r θ a (h.mono Set.subset_union_right)
    exact ⟨_, omap_app_of r θ hf ha⟩
  | _, _, _, r, θ, .lam b, h => by
    obtain ⟨b', hb⟩ := omap_isSome (Ren.lift r) θ.weaken b (h.rename _)
    exact ⟨_, omap_lam_of r θ hb⟩

/-! ### Renaming -/

/-- Renaming first, then mapping, is mapping along the composite. -/
theorem omap_rename : ∀ {Γ Γ' Δ : Ctx} {σ : Ty} (r : Ren Γ Γ') (r' : Ren Γ' Δ)
    (θ : OMap Sig₁ Sig₂ Δ) (t : Term Sig₁ Γ σ),
    omap r' θ (t.rename r) = omap (Ren.comp r' r) θ t
  | _, _, _, _, _, _, _, .var _ | _, _, _, _, _, _, _, .const _ | _, _, _, _, _, _, _, .and
  | _, _, _, _, _, _, _, .or | _, _, _, _, _, _, _, .not | _, _, _, _, _, _, _, .all _
  | _, _, _, _, _, _, _, .ex _ | _, _, _, _, _, _, _, .eq _ | _, _, _, _, _, _, _, .constR _
  | _, _, _, _, _, _, _, .negR _ | _, _, _, _, _, _, _, .andR _ | _, _, _, _, _, _, _, .orR _
  | _, _, _, _, _, _, _, .coextR _ | _, _, _, _, _, _, _, .boxR _
  | _, _, _, _, _, _, _, .inclR _ => rfl
  | _, _, _, _, r, r', θ, .app f a => by
    simp only [rename_app, omap, omap_rename r r' θ f, omap_rename r r' θ a]
  | _, _, _, _, r, r', θ, .lam b => by
    simp only [rename_lam, omap, omap_rename (Ren.lift r) (Ren.lift r') θ.weaken b, Ren.lift_comp]

/-- Mapping, then renaming, is mapping along the composite with the renamed map. -/
theorem rename_omap : ∀ {Γ Δ Δ' : Ctx} {σ : Ty} (r : Ren Γ Δ) (r₂ : Ren Δ Δ')
    (θ : OMap Sig₁ Sig₂ Δ) (t : Term Sig₁ Γ σ),
    (omap r θ t).map (Term.rename r₂) = omap (Ren.comp r₂ r) (θ.rename r₂) t
  | _, _, _, _, _, _, _, .var _ | _, _, _, _, _, _, _, .and
  | _, _, _, _, _, _, _, .or | _, _, _, _, _, _, _, .not | _, _, _, _, _, _, _, .all _
  | _, _, _, _, _, _, _, .ex _ | _, _, _, _, _, _, _, .eq _ | _, _, _, _, _, _, _, .constR _
  | _, _, _, _, _, _, _, .negR _ | _, _, _, _, _, _, _, .andR _ | _, _, _, _, _, _, _, .orR _
  | _, _, _, _, _, _, _, .coextR _ | _, _, _, _, _, _, _, .boxR _
  | _, _, _, _, _, _, _, .inclR _ | _, _, _, _, _, _, _, .const _ => rfl
  | _, _, _, _, r, r₂, θ, .app f a => by
    simp only [omap, ← rename_omap r r₂ θ f, ← rename_omap r r₂ θ a]
    cases omap r θ f <;> cases omap r θ a <;> rfl
  | _, _, _, _, r, r₂, θ, .lam (σ := τ) b => by
    simp only [omap, Option.map_map]
    have e : (θ.rename r₂).weaken (τ := τ) = θ.weaken.rename (Ren.lift r₂) := by
      funext c
      simp only [OMap.rename, Option.map_map]
      congr 1; funext u; exact Term.weaken_rename r₂ u
    rw [e, Ren.lift_comp, ← rename_omap (Ren.lift r) (Ren.lift r₂) θ.weaken b, Option.map_map]
    rfl

/-- Mapping a weakened term. -/
theorem omap_weaken {Γ Δ : Ctx} {σ τ : Ty} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ) (t : Term Sig₁ Γ σ) :
    omap (Ren.lift r (σ := τ)) θ.weaken (t.weaken) = (omap r θ t).map Term.weaken := by
  rw [omap_rename, rename_omap]; rfl

/-! ### Substitution -/

theorem omap_subst : ∀ {Γ₁ Γ₂ Δ₁ Δ₂ : Ctx} {σ : Ty} (s : Sub Sig₁ Γ₁ Γ₂) (r₁ : Ren Γ₁ Δ₁)
    (r₂ : Ren Γ₂ Δ₂) (θ₁ : OMap Sig₁ Sig₂ Δ₁) (θ₂ : OMap Sig₁ Sig₂ Δ₂) (s' : Sub Sig₂ Δ₁ Δ₂),
    (∀ τ (v : Var Γ₁ τ), omap r₂ θ₂ (s τ v) = some (s' τ (r₁ τ v))) →
    (∀ c, (θ₁ c).map (Term.subst s') = θ₂ c) → ∀ (t : Term Sig₁ Γ₁ σ),
    omap r₂ θ₂ (t.subst s) = (omap r₁ θ₁ t).map (Term.subst s')
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .and | _, _, _, _, _, _, _, _, _, _, _, _, _, .or
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .not | _, _, _, _, _, _, _, _, _, _, _, _, _, .all _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .ex _ | _, _, _, _, _, _, _, _, _, _, _, _, _, .eq _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .constR _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .negR _ | _, _, _, _, _, _, _, _, _, _, _, _, _, .andR _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .orR _ | _, _, _, _, _, _, _, _, _, _, _, _, _, .coextR _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .boxR _
  | _, _, _, _, _, _, _, _, _, _, _, _, _, .inclR _ => rfl
  | _, _, _, _, _, _, _, _, _, _, _, hs, _, .var v => hs _ v
  | _, _, _, _, _, _, _, _, _, _, _, _, hθ, .const c => (hθ c).symm
  | _, _, _, _, _, s, r₁, r₂, θ₁, θ₂, s', hs, hθ, .app f a => by
    simp only [subst_app, omap, omap_subst s r₁ r₂ θ₁ θ₂ s' hs hθ f,
      omap_subst s r₁ r₂ θ₁ θ₂ s' hs hθ a]
    cases omap r₁ θ₁ f <;> cases omap r₁ θ₁ a <;> rfl
  | _, _, _, _, _, s, r₁, r₂, θ₁, θ₂, s', hs, hθ, .lam b => by
    simp only [subst_lam, omap]
    rw [omap_subst (Sub.lift s) (Ren.lift r₁) (Ren.lift r₂) θ₁.weaken θ₂.weaken (Sub.lift s')
      (fun τ v => by
        cases v with
        | zero => rfl
        | succ v =>
          show omap (Ren.lift r₂) θ₂.weaken ((s _ v).weaken) = some ((s' _ (r₁ _ v)).weaken)
          rw [omap_weaken, hs]; rfl)
      (fun c => by
        show Option.map _ (Option.map (Term.rename Ren.shift) (θ₁ c)) =
          Option.map (Term.rename Ren.shift) (θ₂ c)
        rw [← hθ c]
        cases θ₁ c with
        | none => rfl
        | some u => exact congrArg some (subst_weaken_lift s' u)) b]
    cases omap (Ren.lift r₁) θ₁.weaken b <;> rfl

theorem omap_instantiate {Γ Δ : Ctx} {σ τ : Ty} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ)
    (b : Term Sig₁ (σ :: Γ) τ) (a : Term Sig₁ Γ σ) {b' : Term Sig₂ (σ :: Δ) τ} {a' : Term Sig₂ Δ σ}
    (hb : omap (Ren.lift r) θ.weaken b = some b') (ha : omap r θ a = some a') :
    omap r θ (b.instantiate a) = some (b'.instantiate a') := by
  rw [instantiate, omap_subst (Sub.cons a Sub.id) (Ren.lift r) r θ.weaken θ (Sub.cons a' Sub.id)
    (fun τ v => by cases v with
      | zero => exact ha
      | succ v => rfl)
    (fun c => by
      show Option.map _ (Option.map (Term.rename Ren.shift) (θ c)) = θ c
      cases θ c with
      | none => rfl
      | some u => exact congrArg some (instantiate_weaken u a')) b, hb]
  rfl

/-- The unfoldings have no constants. -/
theorem omap_unfoldR {Γ Δ : Ctx} {σ : Ty} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ) :
    ∀ {a b : Term Sig₁ Γ σ} {a' : Term Sig₂ Δ σ}, a.unfoldR = some b → omap r θ a = some a' →
      ∃ b', a'.unfoldR = some b' ∧ omap r θ b = some b'
  | .var _, _, _, h, _ | .const _, _, _, h, _ | .app _ _, _, _, h, _ | .lam _, _, _, h, _
  | .and, _, _, h, _ | .or, _, _, h, _ | .not, _, _, h, _ | .all _, _, _, h, _
  | .ex _, _, _, h, _ | .eq _, _, _, h, _ => nomatch h
  | .constR ρ, _, _, h, ha | .negR ρ, _, _, h, ha | .andR ρ, _, _, h, ha | .orR ρ, _, _, h, ha
  | .coextR ρ, _, _, h, ha | .boxR ρ, _, _, h, ha | .inclR ρ, _, _, h, ha => by
    cases Option.some.inj ha
    cases ρ <;> (simp only [unfoldR, unfoldConst, unfoldNeg, unfoldAnd, unfoldOr, unfoldCoext,
      unfoldBox, unfoldIncl, Option.some.injEq] at h; subst h; exact ⟨_, rfl, rfl⟩)


/-- A term with a known head: the head's image is the image's head. -/
theorem omap_app_inv {Γ Δ : Ctx} {σ : Ty} {ρ : RTy} {r : Ren Γ Δ} {θ : OMap Sig₁ Sig₂ Δ}
    {f : Term Sig₁ Γ (σ ⇒ ρ)} {a : Term Sig₁ Γ σ} {x : Term Sig₂ Δ ρ} {f' : Term Sig₂ Δ (σ ⇒ ρ)}
    (h : omap r θ (.app f a) = some x) (hf : omap r θ f = some f') :
    ∃ a', omap r θ a = some a' ∧ x = .app f' a' := by
  obtain ⟨f'', a', hf'', ha, rfl⟩ := (omap_app_eq_some r θ).1 h
  rw [hf] at hf''; cases hf''
  exact ⟨a', ha, rfl⟩

/-- Two arguments of a known head. -/
theorem omap_app₂_inv {Γ Δ : Ctx} {σ τ : Ty} {ρ : RTy} {r : Ren Γ Δ} {θ : OMap Sig₁ Sig₂ Δ}
    {o : Term Sig₁ Γ (σ ⇒ τ ⇒ ρ)} {a : Term Sig₁ Γ σ} {b : Term Sig₁ Γ τ} {x : Term Sig₂ Δ ρ}
    {o' : Term Sig₂ Δ (σ ⇒ τ ⇒ ρ)} (h : omap r θ (.app (.app o a) b) = some x)
    (ho : omap r θ o = some o') :
    ∃ a' b', omap r θ a = some a' ∧ omap r θ b = some b' ∧ x = .app (.app o' a') b' := by
  obtain ⟨y, b', hy, hb, rfl⟩ := (omap_app_eq_some r θ).1 h
  obtain ⟨a', ha, rfl⟩ := omap_app_inv hy ho
  exact ⟨a', b', ha, hb, rfl⟩

end Term


/-! ### Conversion -/

theorem Step.omap : ∀ {Γ Δ : Ctx} {σ : Ty} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ)
    {a b : Term Sig₁ Γ σ} {a' b' : Term Sig₂ Δ σ}, Step BetaEta a b →
    a.omap r θ = some a' → b.omap r θ = some b' → Step BetaEta a' b'
  | _, _, _, r, θ, _, _, a', b', .here (.inl hβ), ha, hb => by
    cases hβ with
    | intro B A =>
      obtain ⟨y, A', hy, hA, rfl⟩ := (Term.omap_app_eq_some r θ).1 ha
      obtain ⟨B', hB, rfl⟩ := (Term.omap_lam_eq_some r θ).1 hy
      rw [Term.omap_instantiate r θ B A hB hA] at hb
      cases hb
      exact .here (.inl (Beta.intro B' A'))
  | _, _, _, r, θ, _, _, a', b', .here (.inr (.inl hη)), ha, hb => by
    cases hη with
    | intro f =>
      obtain ⟨y, hy, rfl⟩ := (Term.omap_lam_eq_some r θ).1 ha
      obtain ⟨f'', v', hf, hv, rfl⟩ := (Term.omap_app_eq_some _ _).1 hy
      rw [Term.omap_weaken, hb] at hf
      cases hf; cases hv
      exact .here (.inr (.inl (Eta.intro b')))
  | _, _, _, r, θ, _, _, a', b', .here (.inr (.inr hδ)), ha, hb => by
    obtain ⟨b'', h₁, h₂⟩ := Term.omap_unfoldR r θ hδ ha
    rw [hb] at h₂; cases h₂
    exact .here (.inr (.inr h₁))
  | _, _, _, r, θ, _, _, a', b', .appL h, ha, hb => by
    obtain ⟨f₁, c₁, hf₁, hc₁, rfl⟩ := (Term.omap_app_eq_some r θ).1 ha
    obtain ⟨f₂, c₂, hf₂, hc₂, rfl⟩ := (Term.omap_app_eq_some r θ).1 hb
    rw [hc₁] at hc₂; cases hc₂
    exact .appL (Step.omap r θ h hf₁ hf₂)
  | _, _, _, r, θ, _, _, a', b', .appR h, ha, hb => by
    obtain ⟨f₁, c₁, hf₁, hc₁, rfl⟩ := (Term.omap_app_eq_some r θ).1 ha
    obtain ⟨f₂, c₂, hf₂, hc₂, rfl⟩ := (Term.omap_app_eq_some r θ).1 hb
    rw [hf₁] at hf₂; cases hf₂
    exact .appR (Step.omap r θ h hc₁ hc₂)
  | _, _, _, r, θ, _, _, a', b', .lam h, ha, hb => by
    obtain ⟨y₁, h₁, rfl⟩ := (Term.omap_lam_eq_some r θ).1 ha
    obtain ⟨y₂, h₂, rfl⟩ := (Term.omap_lam_eq_some r θ).1 hb
    exact .lam (Step.omap _ _ h h₁ h₂)

/-- **A conversion uses finitely many constants**: it carries over to the images under
every map defined on a finite set of constants, those of the terms the chain of
conversions passes through. -/
theorem Conv.omap_support {Γ : Ctx} {σ : Ty} {a b : Term Sig₁ Γ σ} (h : a ≡ b) :
    ∃ F : Set Sig₁.Const, F.Finite ∧ ∀ {Δ : Ctx} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ),
      θ.Covers F → ∀ {a' b' : Term Sig₂ Δ σ}, a.omap r θ = some a' → b.omap r θ = some b' →
      a' ≡ b' := by
  induction h with
  | rel h => exact ⟨∅, Set.finite_empty, fun r θ _ _ _ ha hb => EqvGen.rel (Step.omap r θ h ha hb)⟩
  | refl a => exact ⟨∅, Set.finite_empty, fun r θ _ _ _ ha hb => by
      rw [ha] at hb; cases hb; exact EqvGen.refl _⟩
  | symm _ ih =>
    obtain ⟨F, hF, h⟩ := ih
    exact ⟨F, hF, fun r θ hθ _ _ ha hb => EqvGen.symm (h r θ hθ hb ha)⟩
  | trans h₁ h₂ ih₁ ih₂ =>
    rename_i _ b _
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁
    obtain ⟨F₂, hF₂, h₂⟩ := ih₂
    refine ⟨F₁ ∪ F₂ ∪ b.consts, (hF₁.union hF₂).union (Term.consts_finite b),
      fun r θ hθ _ _ ha hc => ?_⟩
    obtain ⟨b', hb⟩ := Term.omap_isSome r θ b (hθ.mono Set.subset_union_right)
    exact EqvGen.trans (h₁ r θ (hθ.mono (fun x hx => Or.inl (Or.inl hx))) ha hb)
      (h₂ r θ (hθ.mono (fun x hx => Or.inl (Or.inr hx))) hb hc)

/-! ### Holes -/

/-- The image of a filled hole is a filled hole, and filling it with images gives images. -/
theorem Hole.omap_plug : ∀ {Γ Γ' : Ctx} {σ τ : Ty} (C : Hole Sig₁ Γ σ Γ' τ) {Δ : Ctx}
    (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ) {P : Term Sig₁ Γ' τ} {x : Term Sig₂ Δ σ},
    (C.plug P).omap r θ = some x →
    ∃ (Δ' : Ctx) (C' : Hole Sig₂ Δ σ Δ' τ) (r' : Ren Γ' Δ') (θ' : OMap Sig₁ Sig₂ Δ')
      (P' : Term Sig₂ Δ' τ), (∀ F, θ.Covers F → θ'.Covers F) ∧ P.omap r' θ' = some P' ∧
      x = C'.plug P' ∧ ∀ (Q : Term Sig₁ Γ' τ) (Q' : Term Sig₂ Δ' τ), Q.omap r' θ' = some Q' →
        (C.plug Q).omap r θ = some (C'.plug Q')
  | _, _, _, _, .hole, Δ, r, θ, P, x, h => ⟨Δ, .hole, r, θ, x, fun _ h => h, h, rfl, fun _ _ h => h⟩
  | _, _, _, _, .appL C b, _, r, θ, P, x, h => by
    obtain ⟨y, b', hy, hb, rfl⟩ := (Term.omap_app_eq_some r θ).1 h
    obtain ⟨Δ', C', r', θ', P', hc, hP, rfl, hQ⟩ := Hole.omap_plug C r θ hy
    exact ⟨Δ', .appL C' b', r', θ', P', hc, hP, rfl,
      fun Q Q' h => Term.omap_app_of r θ (hQ Q Q' h) hb⟩
  | _, _, _, _, .appR f C, _, r, θ, P, x, h => by
    obtain ⟨f', y, hf, hy, rfl⟩ := (Term.omap_app_eq_some r θ).1 h
    obtain ⟨Δ', C', r', θ', P', hc, hP, rfl, hQ⟩ := Hole.omap_plug C r θ hy
    exact ⟨Δ', .appR f' C', r', θ', P', hc, hP, rfl,
      fun Q Q' h => Term.omap_app_of r θ hf (hQ Q Q' h)⟩
  | _, _, _, _, .lam C, _, r, θ, P, x, h => by
    obtain ⟨y, hy, rfl⟩ := (Term.omap_lam_eq_some r θ).1 h
    obtain ⟨Δ', C', r', θ', P', hc, hP, rfl, hQ⟩ := Hole.omap_plug C _ _ hy
    exact ⟨Δ', .lam C', r', θ', P', fun F h => hc F (h.rename _), hP, rfl,
      fun Q Q' h => Term.omap_lam_of r θ (hQ Q Q' h)⟩

/-! ### Derivations -/

namespace OMap

/-- Hypotheses and their images. -/
abbrev Hyps {Γ Δ : Ctx} (r : Ren Γ Δ) (θ : OMap Sig₁ Sig₂ Δ) (L : List (Formula Sig₁ Γ))
    (L' : List (Formula Sig₂ Δ)) : Prop :=
  List.Forall₂ (fun q q' => q.omap r θ = some q') L L'

theorem Hyps.mem {Γ Δ : Ctx} {r : Ren Γ Δ} {θ : OMap Sig₁ Sig₂ Δ} :
    ∀ {L : List (Formula Sig₁ Γ)} {L' : List (Formula Sig₂ Δ)}, Hyps r θ L L' →
      ∀ {p : Formula Sig₁ Γ} {p' : Formula Sig₂ Δ}, p ∈ L → p.omap r θ = some p' → p' ∈ L'
  | _, _, .nil, _, _, h, _ => absurd h List.not_mem_nil
  | _, _, .cons hq hL, p, p', h, hp => by
    rcases List.mem_cons.1 h with rfl | h
    · rw [hq] at hp; cases hp; exact List.mem_cons_self
    · exact List.mem_cons_of_mem _ (Hyps.mem hL h hp)

theorem Hyps.weaken {Γ Δ : Ctx} {σ : Ty} {r : Ren Γ Δ} {θ : OMap Sig₁ Sig₂ Δ} :
    ∀ {L : List (Formula Sig₁ Γ)} {L' : List (Formula Sig₂ Δ)}, Hyps r θ L L' →
      Hyps (Ren.lift r (σ := σ)) θ.weaken (Meta.Hyps.weaken L) (Meta.Hyps.weaken L')
  | _, _, .nil => .nil
  | _, _, .cons hq hL => .cons (by rw [Term.omap_weaken, hq]; rfl) (Hyps.weaken hL)

end OMap

open Term in
/-- **A derivation uses finitely many constants.** For a derivation in `C` (or with no
axioms at all) there is a finite set of constants such that, for every map defined on it
and on the constants of the hypotheses and the conclusion, the images form a derivation
in `C`. By induction on the derivation; each rule adds the constants of the formulas and
terms it uses that its conclusion does not show. -/
theorem Derivable.omap_support {Ax : AxiomSet Sig₁} {Γ : Ctx} {Δ : List (Formula Sig₁ Γ)}
    {p : Formula Sig₁ Γ} (h : Derivable Ax Δ p) : (∀ a, Ax a → Logical a) →
    ∃ F : Set Sig₁.Const, F.Finite ∧ ∀ {Θ : Ctx} (r : Ren Γ Θ) (θ : OMap Sig₁ Sig₂ Θ),
      θ.Covers F → ∀ {Δ' : List (Formula Sig₂ Θ)} {p' : Formula Sig₂ Θ}, OMap.Hyps r θ Δ Δ' →
      p.omap r θ = some p' → Derivable (Logical (Sig := Sig₂)) Δ' p' := by
  induction h with
  | hyp hm =>
    exact fun _ => ⟨∅, Set.finite_empty, fun r θ _ _ _ hΔ hp => Derivable.hyp (hΔ.mem hm hp)⟩
  | ax ha =>
    intro hAx
    refine ⟨∅, Set.finite_empty, fun r θ _ _ _ _ hp => ?_⟩
    have e : _ = existence_e := hAx _ ha
    subst e
    have : (existence_e : Sentence Sig₁).close.omap r θ =
        some ((existence_e : Sentence Sig₂).close) := rfl
    rw [this] at hp; cases hp
    exact Derivable.ax rfl
  | andI _ _ ih₁ ih₂ =>
    intro hAx
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx
    refine ⟨F₁ ∪ F₂, hF₁.union hF₂, fun r θ hθ _ _ hΔ hp => ?_⟩
    obtain ⟨a', b', ha, hb, rfl⟩ := omap_app₂_inv hp rfl
    exact Derivable.andI (h₁ r θ (hθ.mono Set.subset_union_left) hΔ ha)
      (h₂ r θ (hθ.mono Set.subset_union_right) hΔ hb)
  | @andE₁ _ _ _ p q _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F ∪ q.consts, hF.union (consts_finite q), fun r θ hθ _ p' hΔ hp => ?_⟩
    obtain ⟨q', hq⟩ := omap_isSome r θ q (hθ.mono Set.subset_union_right)
    exact Derivable.andE₁ (h r θ (hθ.mono Set.subset_union_left) hΔ
      (omap_app_of r θ (omap_app_of r θ rfl hp) hq))
  | @andE₂ _ _ _ p q _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F ∪ p.consts, hF.union (consts_finite p), fun r θ hθ _ q' hΔ hq => ?_⟩
    obtain ⟨p', hp⟩ := omap_isSome r θ p (hθ.mono Set.subset_union_right)
    exact Derivable.andE₂ (h r θ (hθ.mono Set.subset_union_left) hΔ
      (omap_app_of r θ (omap_app_of r θ rfl hp) hq))
  | orI₁ _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F, hF, fun r θ hθ _ _ hΔ hp => ?_⟩
    obtain ⟨a', b', ha, hb, rfl⟩ := omap_app₂_inv hp rfl
    exact Derivable.orI₁ (h r θ hθ hΔ ha)
  | orI₂ _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F, hF, fun r θ hθ _ _ hΔ hp => ?_⟩
    obtain ⟨a', b', ha, hb, rfl⟩ := omap_app₂_inv hp rfl
    exact Derivable.orI₂ (h r θ hθ hΔ hb)
  | @orE _ _ _ p q _ _ _ _ ih ih₁ ih₂ =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx; obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx
    refine ⟨F ∪ F₁ ∪ F₂ ∪ p.consts ∪ q.consts,
      (((hF.union hF₁).union hF₂).union (consts_finite p)).union (consts_finite q),
      fun r θ hθ _ _ hΔ hc => ?_⟩
    obtain ⟨p', hp⟩ := omap_isSome r θ p (hθ.mono fun x hx => Or.inl (Or.inr hx))
    obtain ⟨q', hq⟩ := omap_isSome r θ q (hθ.mono fun x hx => Or.inr hx)
    exact Derivable.orE
      (h r θ (hθ.mono fun x hx => Or.inl (Or.inl (Or.inl (Or.inl hx)))) hΔ
        (omap_app_of r θ (omap_app_of r θ rfl hp) hq))
      (h₁ r θ (hθ.mono fun x hx => Or.inl (Or.inl (Or.inl (Or.inr hx)))) (.cons hp hΔ) hc)
      (h₂ r θ (hθ.mono fun x hx => Or.inl (Or.inl (Or.inr hx))) (.cons hq hΔ) hc)
  | @notI _ _ _ p q _ _ ih₁ ih₂ =>
    intro hAx
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx
    refine ⟨F₁ ∪ F₂ ∪ q.consts, (hF₁.union hF₂).union (consts_finite q),
      fun r θ hθ _ _ hΔ hn => ?_⟩
    obtain ⟨p', hp, rfl⟩ := omap_app_inv hn rfl
    obtain ⟨q', hq⟩ := omap_isSome r θ q (hθ.mono Set.subset_union_right)
    exact Derivable.notI (h₁ r θ (hθ.mono fun x hx => Or.inl (Or.inl hx)) (.cons hp hΔ) hq)
      (h₂ r θ (hθ.mono fun x hx => Or.inl (Or.inr hx)) (.cons hp hΔ) (omap_app_of r θ rfl hq))
  | @notE _ _ _ p q _ _ ih₁ ih₂ =>
    intro hAx
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx
    refine ⟨F₁ ∪ F₂ ∪ p.consts, (hF₁.union hF₂).union (consts_finite p),
      fun r θ hθ _ _ hΔ hq => ?_⟩
    obtain ⟨p', hp⟩ := omap_isSome r θ p (hθ.mono Set.subset_union_right)
    exact Derivable.notE (h₁ r θ (hθ.mono fun x hx => Or.inl (Or.inl hx)) hΔ hp)
      (h₂ r θ (hθ.mono fun x hx => Or.inl (Or.inr hx)) hΔ (omap_app_of r θ rfl hp))
  | em p =>
    intro _
    refine ⟨∅, Set.finite_empty, fun r θ _ _ _ _ hx => ?_⟩
    obtain ⟨a', b', ha, hb, rfl⟩ := omap_app₂_inv hx rfl
    obtain ⟨a'', ha'', rfl⟩ := omap_app_inv hb rfl
    rw [ha] at ha''; cases ha''
    exact Derivable.em _
  | allE _ a ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F, hF, fun r θ hθ _ _ hΔ hx => ?_⟩
    obtain ⟨F', a', hF', ha', rfl⟩ := (omap_app_eq_some r θ).1 hx
    exact Derivable.allE (h r θ hθ hΔ (omap_app_of r θ rfl hF')) a'
  | allI _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F, hF, fun r θ hθ _ _ hΔ hx => ?_⟩
    obtain ⟨y, hy, rfl⟩ := omap_app_inv hx rfl
    obtain ⟨b', hb, rfl⟩ := (omap_lam_eq_some r θ).1 hy
    exact Derivable.allI (h (Ren.lift r) θ.weaken (hθ.rename _) hΔ.weaken hb)
  | @exI _ _ _ σ G a _ ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    refine ⟨F ∪ a.consts, hF.union (consts_finite a), fun r θ hθ _ _ hΔ hx => ?_⟩
    obtain ⟨G', hG, rfl⟩ := omap_app_inv hx rfl
    obtain ⟨a', ha⟩ := omap_isSome r θ a (hθ.mono Set.subset_union_right)
    exact Derivable.exI a' (h r θ (hθ.mono Set.subset_union_left) hΔ (omap_app_of r θ hG ha))
  | @exE _ _ _ σ G q _ _ ih ih' =>
    intro hAx
    obtain ⟨F₁, hF₁, h₁⟩ := ih hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih' hAx
    refine ⟨F₁ ∪ F₂ ∪ G.consts, (hF₁.union hF₂).union (consts_finite G),
      fun r θ hθ _ q' hΔ hq => ?_⟩
    obtain ⟨G', hG⟩ := omap_isSome r θ G (hθ.mono Set.subset_union_right)
    refine Derivable.exE (h₁ r θ (hθ.mono fun x hx => Or.inl (Or.inl hx)) hΔ
      (omap_app_of r θ rfl hG)) ?_
    refine h₂ (Ren.lift r) θ.weaken ((hθ.mono fun x hx => Or.inl (Or.inr hx)).rename _)
      (.cons ?_ hΔ.weaken) ?_
    · exact omap_app_of _ _ (by rw [omap_weaken, hG]; rfl) rfl
    · rw [omap_weaken, hq]; rfl
  | refl a =>
    intro _
    refine ⟨∅, Set.finite_empty, fun r θ _ _ _ _ hx => ?_⟩
    obtain ⟨a', b', ha, hb, rfl⟩ := omap_app₂_inv hx rfl
    rw [ha] at hb; cases hb
    exact Derivable.refl _
  | @ll _ _ _ σ a b G _ _ ih₁ ih₂ =>
    intro hAx
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx
    refine ⟨F₁ ∪ F₂ ∪ a.consts, (hF₁.union hF₂).union (consts_finite a),
      fun r θ hθ _ _ hΔ hx => ?_⟩
    obtain ⟨G', b', hG, hb, rfl⟩ := (omap_app_eq_some r θ).1 hx
    obtain ⟨a', ha⟩ := omap_isSome r θ a (hθ.mono Set.subset_union_right)
    exact Derivable.ll G' (h₁ r θ (hθ.mono fun x hx => Or.inl (Or.inl hx)) hΔ
        (omap_app_of r θ (omap_app_of r θ rfl ha) hb))
      (h₂ r θ (hθ.mono fun x hx => Or.inl (Or.inr hx)) hΔ (omap_app_of r θ hG ha))
  | @conv _ _ _ p q _ c ih =>
    intro hAx
    obtain ⟨F, hF, h⟩ := ih hAx
    obtain ⟨Fc, hFc, hc⟩ := Conv.omap_support (Sig₂ := Sig₂) c
    refine ⟨F ∪ Fc ∪ p.consts, (hF.union hFc).union (consts_finite p),
      fun r θ hθ _ _ hΔ hq => ?_⟩
    obtain ⟨p', hp⟩ := omap_isSome r θ p (hθ.mono Set.subset_union_right)
    exact Derivable.conv (h r θ (hθ.mono fun x hx => Or.inl (Or.inl hx)) hΔ hp)
      (hc r θ (hθ.mono fun x hx => Or.inl (Or.inr hx)) hp hq)
  | @subst Ax₀ _ _ _ P Q C _ _ _ ih₁ ih₂ ih₃ =>
    intro hAx
    have hAx' : ∀ a, Ax₀.logical a → Logical a := fun a ha => ha.2
    obtain ⟨F₁, hF₁, h₁⟩ := ih₁ hAx'; obtain ⟨F₂, hF₂, h₂⟩ := ih₂ hAx'
    obtain ⟨F₃, hF₃, h₃⟩ := ih₃ hAx
    refine ⟨F₁ ∪ F₂ ∪ F₃ ∪ P.consts, ((hF₁.union hF₂).union hF₃).union (consts_finite P),
      fun r θ hθ _ _ hΔ hx => ?_⟩
    obtain ⟨Δ', C', r', θ', Q', hc, hQ, rfl, hplug⟩ := Hole.omap_plug C r θ hx
    have hθ' := hc _ hθ
    obtain ⟨P', hP⟩ := omap_isSome r' θ' P (hθ'.mono Set.subset_union_right)
    have hm : ∀ a, (Logical (Sig := Sig₂)) a → (Logical (Sig := Sig₂)).logical a :=
      fun a ha => ⟨ha, ha⟩
    exact Derivable.subst C'
      (Derivable.mono hm (h₁ r' θ' (hθ'.mono fun x hx => Or.inl (Or.inl (Or.inl hx)))
        (.cons hP .nil) hQ))
      (Derivable.mono hm (h₂ r' θ' (hθ'.mono fun x hx => Or.inl (Or.inl (Or.inr hx)))
        (.cons hQ .nil) hP))
      (h₃ r θ (hθ.mono fun x hx => Or.inl (Or.inr hx)) hΔ (hplug P P' hP))

end Classicism.Meta
