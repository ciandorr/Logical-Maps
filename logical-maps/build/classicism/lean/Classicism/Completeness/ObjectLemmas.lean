import Classicism.Syntax.Entailment
import Classicism.Syntax.Blocks

/-!
# The object-language facts the completeness proof uses

Theorems of `C`, in any signature, about closed terms: the modal logic of `□` that makes
the canonical accessibility relation a preorder and lets a missing box be refuted at a
successor; the Necessity of Identity, which makes identities persist along accessibility;
and Intensionality, which makes the canonical inclusion of term classes into intensions
injective.

INTERFACE (31 October 2026): the statements are fixed (workstream W1b supplied the
proofs). Change a statement only after reporting why.

The proofs are direct derivations in `Derivable`, by its rules, following the shallow
proofs of `Background/Necessity.lean`: `K` is Leibniz's Law over the identity
`q = (⊤ → q)`, got by Subst; the Necessity of Identity necessitates `a = a` and
substitutes; `T` and `4` are immediate. Intensionality at a relational type `ρ` is the
paper's argument (Classicism, §1.5), with the class laws it uses derived by induction on
`ρ`: with `H` the coextension sentence `a ≡_ρ b`, the identity
`a ∧_ρ const_ρ H = b ∧_ρ const_ρ H` is a theorem (`mask_eq`: at `t` a Subst, at `σ → ρ`
the pointwise identity moved under an abstraction by `substEq`), `□H` turns `H` into `⊤`
by Leibniz's Law, and `X ∧_ρ ⊤_ρ = X` (`andR_topR`) removes the mask.

Beyond the interface: `□` distributes over `∧` both ways (`box_conj_elim`,
`box_conj_intro`), and `◇p ↔ ¬□¬p` (`dia_iff_not_box_neg`, through `p = ⊥ ↔ □¬p`).
-/

namespace Classicism.Meta

namespace Completeness

variable {Sig : Signature}

open Term

/-! ### One-step unfoldings of the type-subscripted operations -/

section Unfold

variable {Γ : Ctx}

/-- `const_t p ≡ p`. -/
theorem conv_constR_t (p : Formula Sig Γ) : Term.app (Term.constR RTy.t) p ≡ p :=
  Conv.trans (Conv.app_congr (Conv.delta rfl) (Conv.refl p)) (Conv.beta _ p)

/-- `const_{σ→ρ} p x ≡ const_ρ p`. -/
theorem conv_constR_arr_app {σ : Ty} {ρ : RTy} (p : Formula Sig Γ) (x : Term Sig Γ σ) :
    Term.app (Term.app (Term.constR (σ ⇒ ρ)) p) x ≡ Term.app (Term.constR ρ) p := by
  refine Conv.trans (Conv.app_congr
    (Conv.trans (Conv.app_congr (Conv.delta rfl) (Conv.refl p)) (Conv.beta _ p)) (Conv.refl x)) ?_
  refine Conv.trans (Conv.beta _ x) (Conv.of_eq ?_)
  show Term.app (Term.constR ρ) ((p.weaken (τ := σ)).instantiate x) = _
  rw [Term.instantiate_weaken]

/-- `X ∧_t Y ≡ X ∧ Y`. -/
theorem conv_andR_t (X Y : Formula Sig Γ) :
    Term.app (Term.app (Term.andR RTy.t) X) Y ≡ conj X Y :=
  Conv.app_congr (Conv.app_congr (Conv.delta rfl) (Conv.refl X)) (Conv.refl Y)

/-- `X ∧_{σ→ρ} Y ≡ λz. X z ∧_ρ Y z`. -/
theorem conv_andR_arr {σ : Ty} {ρ : RTy} (X Y : Term Sig Γ (σ ⇒ ρ)) :
    Term.app (Term.app (Term.andR (σ ⇒ ρ)) X) Y
      ≡ Term.lam (Term.app (Term.app (Term.andR ρ) (Term.app X.weaken (Term.var .zero)))
          (Term.app Y.weaken (Term.var .zero))) := by
  refine Conv.trans (Conv.app_congr (Conv.app_congr (Conv.delta rfl) (Conv.refl X)) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.app_congr (Conv.beta _ X) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.beta _ Y) ?_
  show Term.lam (Term.app (Term.app (Term.andR ρ)
      (Term.app (((X.weaken).weaken).subst (Sub.lift (Sub.cons Y Sub.id))) (Term.var .zero)))
      (Term.app Y.weaken (Term.var .zero))) ≡ _
  rw [Term.weaken_weaken_subst_lift]
  exact Conv.refl _

/-- `X ≡_t Y` unfolds to `X ↔ Y`. -/
theorem conv_coextR_t (X Y : Formula Sig Γ) :
    Term.app (Term.app (Term.coextR RTy.t) X) Y ≡ iff X Y := by
  refine Conv.trans (Conv.app_congr (Conv.app_congr (Conv.delta rfl) (Conv.refl X)) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.app_congr (Conv.beta _ X) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.beta _ Y) (Conv.of_eq ?_)
  have e : (X.weaken (τ := Ty.t)).subst (Sub.cons Y Sub.id) = X := Term.instantiate_weaken X Y
  simp only [Term.instantiate, Term.subst_app, Term.subst_var, Term.subst_and,
    Term.subst_or, Term.subst_not, Sub.lift_zero, Sub.lift_succ, Sub.cons_zero, e]

/-- `X ≡_{σ→ρ} Y` unfolds to `∀z. X z ≡_ρ Y z`. -/
theorem conv_coextR_arr {σ : Ty} {ρ : RTy} (X Y : Term Sig Γ (σ ⇒ ρ)) :
    Term.app (Term.app (Term.coextR (σ ⇒ ρ)) X) Y
      ≡ forall' (Term.app (Term.app (Term.coextR ρ) (Term.app X.weaken (Term.var .zero)))
          (Term.app Y.weaken (Term.var .zero))) := by
  refine Conv.trans (Conv.app_congr (Conv.app_congr (Conv.delta rfl) (Conv.refl X)) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.app_congr (Conv.beta _ X) (Conv.refl Y)) ?_
  refine Conv.trans (Conv.beta _ Y) ?_
  show forall' (Term.app (Term.app (Term.coextR ρ)
      (Term.app (((X.weaken).weaken).subst (Sub.lift (Sub.cons Y Sub.id))) (Term.var .zero)))
      (Term.app Y.weaken (Term.var .zero))) ≡ _
  rw [Term.weaken_weaken_subst_lift]
  exact Conv.refl _

end Unfold

/-! ### Derived rules -/

open Classicism.Meta.Derivable

section Rules

variable {Ax : AxiomSet Sig}

/-- Formulas each derivable from the other in the logical part of the theory are
identical: Subst at the hole `P = ⬚`, from `P = P`. -/
theorem eqOfEquiv {Γ : Ctx} {Δ : List (Formula Sig Γ)} {P Q : Formula Sig Γ}
    (h₁ : Derivable Ax.logical [P] Q) (h₂ : Derivable Ax.logical [Q] P) :
    Derivable Ax Δ (eq' P Q) :=
  Derivable.subst (P := P) (Q := Q) (Hole.appR (Term.app (Term.eq Ty.t) P) Hole.hole) h₁ h₂
    (Derivable.refl P)

/-- Coextensiveness is reflexive, at every relational type. -/
theorem coextRefl : ∀ (ρ : RTy) {Γ : Ctx} {Δ : List (Formula Sig Γ)} (a : Term Sig Γ ρ),
    Derivable Ax Δ (Term.app (Term.app (Term.coextR ρ) a) a) := by
  intro ρ
  induction ρ using RTy.induction with
  | t =>
    intro Γ Δ a
    exact conv (iffI hyp₀ hyp₀) (Conv.symm (conv_coextR_t a a))
  | arr σ ρ ih =>
    intro Γ Δ a
    exact conv (allI (ih (Term.app a.weaken (Term.var .zero)))) (Conv.symm (conv_coextR_arr a a))

/-- **`X ∧_ρ ⊤_ρ = X`**, at every relational type, for any term `X`, in any theory with no
hypotheses. At `t` a Subst; at `σ → ρ` the identity at `ρ` for `X z`, moved under the
abstraction `λz` by `substEq`, and η. -/
theorem andR_topR : ∀ (ρ : RTy) {Ax : AxiomSet Sig} {Γ : Ctx} (X : Term Sig Γ ρ),
    Derivable Ax [] (eq' (Term.app (Term.app (Term.andR ρ) X) (topR ρ)) X) := by
  intro ρ
  induction ρ using RTy.induction with
  | t =>
    intro Ax Γ X
    have h : Derivable Ax [] (eq' (conj X top) X) :=
      eqSymm (eqOfEquiv (andI hyp₀ Derivable.top) (andE₁ hyp₀))
    have c : Term.app (Term.app (Term.andR RTy.t) X) (topR RTy.t) ≡ conj X top :=
      Conv.trans (conv_andR_t X _) (Conv.app_congr (Conv.refl _) (conv_constR_t Term.top))
    exact conv h (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm c)) (Conv.refl X))
  | arr σ ρ ih =>
    intro Ax Γ X
    have h' := ih (Ax := Ax.logical) (Term.app X.weaken (Term.var .zero))
    have r := substEq (Ax := Ax) (Δ := []) ρ
      (Hole.appR (Term.app (Term.eq (σ ⇒ ρ))
        (Term.lam (Term.app (Term.app (Term.andR ρ) (Term.app X.weaken (Term.var .zero))) (topR ρ))))
        (Hole.lam Hole.hole)) h' (refl _)
    have c : Term.app (Term.app (Term.andR (σ ⇒ ρ)) X) (topR (σ ⇒ ρ))
        ≡ Term.lam (Term.app (Term.app (Term.andR ρ) (Term.app X.weaken (Term.var .zero))) (topR ρ)) :=
      Conv.trans (conv_andR_arr X _)
        (Conv.lam_congr (Conv.app_congr (Conv.refl _) (conv_constR_arr_app Term.top _)))
    exact conv r (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm c)) (Conv.eta X))

/-- **The mask**: if `H` gives `a ≡_ρ b` on its own, `a ∧_ρ const_ρ H = b ∧_ρ const_ρ H`
is derivable with no hypotheses. At `t` a Subst, the two premises got from `H → (a ↔ b)`;
at `σ → ρ` the identity at `ρ` for `a z` and `b z`, moved under `λz` by `substEq`. -/
theorem mask_eq : ∀ (ρ : RTy) {Ax : AxiomSet Sig} {Γ : Ctx} (a b : Term Sig Γ ρ) (H : Formula Sig Γ),
    Derivable Ax.logical [H] (Term.app (Term.app (Term.coextR ρ) a) b) →
    Derivable Ax [] (eq' (Term.app (Term.app (Term.andR ρ) a) (Term.app (Term.constR ρ) H))
      (Term.app (Term.app (Term.andR ρ) b) (Term.app (Term.constR ρ) H))) := by
  intro ρ
  induction ρ using RTy.induction with
  | t =>
    intro Ax Γ a b H h
    have hI : Derivable Ax.logical [] (imp H (iff a b)) := impI (conv h (conv_coextR_t a b))
    have p₁ : Derivable Ax.logical [conj a H] (conj b H) :=
      andI (iffE₁ (impE (weaken hI (List.nil_subset _)) (andE₂ hyp₀)) (andE₁ hyp₀)) (andE₂ hyp₀)
    have p₂ : Derivable Ax.logical [conj b H] (conj a H) :=
      andI (iffE₂ (impE (weaken hI (List.nil_subset _)) (andE₂ hyp₀)) (andE₁ hyp₀)) (andE₂ hyp₀)
    have c : ∀ x : Formula Sig Γ,
        Term.app (Term.app (Term.andR RTy.t) x) (Term.app (Term.constR RTy.t) H) ≡ conj x H :=
      fun x => Conv.trans (conv_andR_t x _) (Conv.app_congr (Conv.refl _) (conv_constR_t H))
    exact conv (eqOfEquiv (Ax := Ax) (Δ := []) p₁ p₂)
      (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm (c a))) (Conv.symm (c b)))
  | arr σ ρ ih =>
    intro Ax Γ a b H h
    have hw := rename (Ren.shift (σ := σ)) h
    have hw₂ := conv hw (conv_coextR_arr a.weaken b.weaken)
    have hw₃ : Derivable Ax.logical [H.weaken]
        (Term.app (Term.app (Term.coextR ρ) (Term.app a.weaken (Term.var .zero)))
          (Term.app b.weaken (Term.var .zero))) := by
      have := allEβ hw₂ (Term.var .zero)
      simpa [Term.instantiate_weaken] using this
    have h' := ih (Ax := Ax.logical) (Term.app a.weaken (Term.var .zero))
      (Term.app b.weaken (Term.var .zero)) H.weaken (mono (fun _ h => ⟨h, h.2⟩) hw₃)
    have r := substEq (Ax := Ax) (Δ := []) ρ
      (Hole.appR (Term.app (Term.eq (σ ⇒ ρ))
        (Term.lam (Term.app (Term.app (Term.andR ρ) (Term.app a.weaken (Term.var .zero)))
          (Term.app (Term.constR ρ) H.weaken))))
        (Hole.lam Hole.hole)) h' (refl _)
    have c : ∀ x : Term Sig Γ (σ ⇒ ρ),
        Term.app (Term.app (Term.andR (σ ⇒ ρ)) x) (Term.app (Term.constR (σ ⇒ ρ)) H)
        ≡ Term.lam (Term.app (Term.app (Term.andR ρ) (Term.app x.weaken (Term.var .zero)))
            (Term.app (Term.constR ρ) H.weaken)) :=
      fun x => Conv.trans (conv_andR_arr x _)
        (Conv.lam_congr (Conv.app_congr (Conv.refl _) (conv_constR_arr_app H.weaken _)))
    exact conv r (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm (c a))) (Conv.symm (c b)))

end Rules

/-! ### The modal logic of `□` -/

/-- `K`: `□(p → q) → □p → □q`. -/
theorem box_K (p q : Sentence Sig) :
    C.Theorem (imp (box (imp p q)) (imp (box p) (box q))) := by
  refine impI (impI ?_)
  -- `q = (⊤ → q)`, by Subst
  have e₁ : C.Derivable [box p, box (imp p q)] (eq' q (imp top q)) :=
    eqOfEquiv (orI₂ hyp₀) (impE hyp₀ top)
  -- `⊤ = p`, so `q = (p → q)`, by Leibniz's Law
  have e₂ : C.Derivable [box p, box (imp p q)] (eq' q (imp p q)) := by
    have := llβ (P := eq' (q.weaken (τ := Ty.t)) (imp (Term.var .zero) q.weaken))
      (eqSymm (hyp₀ (p := box p))) (by simpa [Term.instantiate_weaken] using e₁)
    simpa [Term.instantiate_weaken] using this
  exact eqTrans e₂ (weaken₁ hyp₀)

/-- `T`: `□p → p`. -/
theorem box_T (p : Sentence Sig) : C.Theorem (imp (box p) p) :=
  impI (eqMpr hyp₀ top)

/-- The Necessity of Identity, for closed terms of any type: `a = b → □(a = b)`. -/
theorem nec_identity {σ : Ty} (a b : Term Sig [] σ) :
    C.Theorem (imp (eq' a b) (box (eq' a b))) := by
  refine impI ?_
  have hn : C.Derivable [eq' a b] (box (eq' a a)) := weaken₁ (C.Theorem.nec (refl a))
  have := llβ (P := box (eq' (a.weaken (τ := σ)) (Term.var .zero))) (hyp₀ (p := eq' a b))
    (by simpa [Term.instantiate_weaken] using hn)
  simpa [Term.instantiate_weaken] using this

/-- `4`: `□p → □□p`, the Necessity of Identity for `p = ⊤`. -/
theorem box_4 (p : Sentence Sig) : C.Theorem (imp (box p) (box (box p))) :=
  nec_identity p top

/-! ### Further laws of `□` and `◇` -/

/-- A theorem of `C`, from any hypotheses in the empty context. -/
theorem ofThm {Δ : List (Sentence Sig)} {p : Sentence Sig} (h : C.Theorem p) : C.Derivable Δ p :=
  weaken h (List.nil_subset _)

/-- `□(p ∧ q) → □p ∧ □q`. -/
theorem box_conj_elim (p q : Sentence Sig) :
    C.Theorem (imp (box (conj p q)) (conj (box p) (box q))) :=
  impI (andI
    (impE (impE (ofThm (box_K (conj p q) p)) (ofThm (C.Theorem.nec (impI (andE₁ hyp₀))))) hyp₀)
    (impE (impE (ofThm (box_K (conj p q) q)) (ofThm (C.Theorem.nec (impI (andE₂ hyp₀))))) hyp₀))

/-- `□p ∧ □q → □(p ∧ q)`. -/
theorem box_conj_intro (p q : Sentence Sig) :
    C.Theorem (imp (conj (box p) (box q)) (box (conj p q))) := by
  have n : C.Theorem (box (imp p (imp q (conj p q)))) :=
    C.Theorem.nec (impI (impI (andI (weaken₁ hyp₀) hyp₀)))
  exact impI (impE (impE (ofThm (box_K q (conj p q)))
    (impE (impE (ofThm (box_K p (imp q (conj p q)))) (ofThm n)) (andE₁ hyp₀))) (andE₂ hyp₀))

/-- `p = ⊥ ↔ □¬p`. -/
theorem eq_bot_iff_box_neg (p : Sentence Sig) : C.Theorem (iff (eq' p bot) (box (neg p))) := by
  refine iffI ?_ ?_
  · -- `¬⊥ = ⊤`, and `⊥ = p`
    have e : C.Derivable [eq' p bot] (eq' (neg bot) top) :=
      eqOfEquiv Derivable.top (notI (q := forall' (Term.var .zero)) (andE₁ hyp₀) (andE₂ hyp₀))
    have := llβ (P := eq' (neg (Term.var .zero)) top) (eqSymm (hyp₀ (Δ := []) (p := eq' p bot)))
      (by simpa using e)
    simpa using this
  · -- `p = ¬¬p`, `¬p = ⊤`, and `¬⊤ = ⊥`
    have e₁ : C.Derivable [box (neg p)] (eq' p (neg (neg p))) :=
      eqOfEquiv (notI (q := p) (weaken₁ hyp₀) hyp₀) (orE (em p) hyp₀ (notE hyp₀ (weaken₁ hyp₀)))
    have e₂ : C.Derivable [box (neg p)] (eq' p (neg top)) := by
      have := llβ (P := eq' (p.weaken (τ := Ty.t)) (neg (Term.var .zero)))
        (hyp₀ (Δ := []) (p := box (neg p))) (by simpa [Term.instantiate_weaken] using e₁)
      simpa [Term.instantiate_weaken] using this
    exact eqTrans e₂ (eqOfEquiv (notE Derivable.top hyp₀) (botE hyp₀))

/-- `◇p ↔ ¬□¬p`: `◇p` is `¬(p = ⊥)`. -/
theorem dia_iff_not_box_neg (p : Sentence Sig) : C.Theorem (iff (dia p) (neg (box (neg p)))) := by
  have h := eq_bot_iff_box_neg p
  exact iffI (notI (impE (ofThm (andE₂ h)) hyp₀) (weaken₁ hyp₀))
    (notI (impE (ofThm (andE₁ h)) hyp₀) (weaken₁ hyp₀))

/-- Intensionality at a relational type: `a = b ↔ □(a ≡_ρ b)`, coextensiveness at `ρ`
being, at `t`, `↔`, and at `σ → ρ`, `λX Y. ∀z. X z ≡_ρ Y z` (its δ-unfolding). -/
theorem intensionality {ρ : RTy} (a b : Term Sig [] ρ) :
    C.Theorem (iff (eq' a b) (box (app (app (coextR ρ) a) b))) := by
  refine iffI ?_ ?_
  · -- `a = b → □(a ≡ b)`: necessitate `a ≡ a` and substitute
    have hn : C.Derivable [eq' a b] (box (app (app (coextR ρ) a) a)) :=
      weaken₁ (C.Theorem.nec (coextRefl ρ a))
    have := llβ (P := box (app (app (coextR ρ) (a.weaken (τ := ρ))) (Term.var .zero)))
      (hyp₀ (p := eq' a b)) (by simpa [Term.instantiate_weaken] using hn)
    simpa [Term.instantiate_weaken] using this
  · -- `□(a ≡ b) → a = b`: `a = a ∧ ⊤ = a ∧ H = b ∧ H = b ∧ ⊤ = b`
    have m := mask_eq (Ax := C.axioms) ρ a b (app (app (coextR ρ) a) b) hyp₀
    have m' : C.Derivable [box (app (app (coextR ρ) a) b)]
        (eq' (app (app (andR ρ) a) (topR ρ)) (app (app (andR ρ) b) (topR ρ))) := by
      have := llβ (P := eq' (app (app (andR ρ) (a.weaken (τ := Ty.t))) (app (constR ρ) (Term.var .zero)))
          (app (app (andR ρ) b.weaken) (app (constR ρ) (Term.var .zero))))
        (hyp₀ (Δ := []) (p := box (app (app (coextR ρ) a) b)))
        (by simpa [Term.instantiate_weaken] using weaken m (List.nil_subset _))
      simpa [Term.instantiate_weaken] using this
    exact eqTrans (eqSymm (weaken (andR_topR ρ a) (List.nil_subset _)))
      (eqTrans m' (weaken (andR_topR ρ b) (List.nil_subset _)))

end Completeness

end Classicism.Meta
