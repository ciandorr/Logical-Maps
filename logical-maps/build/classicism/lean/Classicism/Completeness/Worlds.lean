import Mathlib.Order.Basic
import Mathlib.Data.Countable.Basic
import Classicism.Completeness.Reserve
import Classicism.Completeness.ObjectLemmas
import Classicism.Completeness.Lindenbaum
import Classicism.Completeness.ReserveConservativity
import Classicism.Syntax.Blocks

/-!
# Canonical worlds

Bacon, *A Philosophical Introduction to Higher-Order Logics*, Definition 18.8, for the
paper's relational types. A **world** is a language, `Sig` with a roomy set `S` of reserve
constants, together with a theory `Γ` in that language that is consistent (with `C`),
complete for the language, and witnessed: every existential sentence in it has a closed
instance in the language. Accessibility is literal: `w ≤ v` when every sentence boxed in
`w` is in `v`. It is a preorder by `T` and `4`, and it includes languages, since `□(c = c)`
is in `w` for each constant `c` of `w`'s language.

The worlds and this preorder are the category of the canonical intensional action model;
there is at most one arrow between two objects.

INTERFACE (31 October 2026): the definitions and statements are fixed; the proofs are to be
supplied (workstream W1a). Change a statement only after reporting why. Lemmas may be
added freely.
-/

namespace Classicism.Meta

namespace Completeness

open Term

variable {Sig : Signature}

/-- A canonical world: a roomy language and a maximal consistent witnessed theory in it. -/
structure World (Sig : Signature) where
  /-- The reserve constants of the world's language. -/
  S : Set Reserve
  /-- Infinitely many reserve constants are left unused at every type. -/
  roomy : Roomy S
  /-- The world's theory. -/
  Γ : Set (Sentence (ext Sig))
  /-- Its sentences are in its language. -/
  lang : ∀ p ∈ Γ, InLang S p
  /-- It is consistent with `C`. -/
  consistent : AxiomSet.Consistent (fun p => p ∈ Γ)
  /-- It is complete for its language. -/
  complete : ∀ p : Sentence (ext Sig), InLang S p → p ∈ Γ ∨ neg p ∈ Γ
  /-- It is witnessed: an existential sentence in it has a closed instance in the language. -/
  witnessed : ∀ {σ : Ty} (F : Term (ext Sig) [] (σ ⇒ RTy.t)), app (.ex σ) F ∈ Γ →
    ∃ a : Term (ext Sig) [] σ, InLang S a ∧ app F a ∈ Γ

namespace World

variable (w v u : World Sig)

/-- Accessibility: whatever is necessary at `w` is true at `v`. -/
def Le : Prop := ∀ p : Sentence (ext Sig), box p ∈ w.Γ → p ∈ v.Γ

/-- Deductive closure within the language (the form used before the preorder). -/
theorem mem_of_theorem₀ {p : Sentence (ext Sig)} (hp : InLang w.S p)
    (h : Theorem (C.axioms ∪ fun q => q ∈ w.Γ) p) : p ∈ w.Γ := by
  rcases w.complete p hp with h' | h'
  · exact h'
  · exact absurd (Derivable.notE h (Theorem.ax h')) w.consistent

theorem le_refl : w.Le w := by
  intro p hp
  exact mem_of_theorem₀ w (inLang_box.1 (w.lang _ hp))
    (Theorem.mp (Theorem.ofC (box_T p)) (Theorem.ax hp))

theorem le_trans {w v u : World Sig} : w.Le v → v.Le u → w.Le u := by
  intro h₁ h₂ p hp
  refine h₂ p (h₁ _ (mem_of_theorem₀ w (inLang_box.2 (w.lang _ hp)) ?_))
  exact Theorem.mp (Theorem.ofC (box_4 p)) (Theorem.ax hp)

instance : Preorder (World Sig) where
  le := Le
  le_refl := le_refl
  le_trans _ _ _ := le_trans

variable {w v}

/-! ### A world is a maximal theory of its language -/

/-- Deductive closure within the language. -/
theorem mem_of_theorem {p : Sentence (ext Sig)} (hp : InLang w.S p)
    (h : Theorem (C.axioms ∪ fun q => q ∈ w.Γ) p) : p ∈ w.Γ := by
  exact mem_of_theorem₀ w hp h

theorem mem_neg_iff {p : Sentence (ext Sig)} (hp : InLang w.S p) : neg p ∈ w.Γ ↔ p ∉ w.Γ := by
  constructor
  · intro hn hp'
    exact w.consistent (Derivable.notE (Theorem.ax hp') (Theorem.ax hn))
  · intro hn
    exact (w.complete p hp).resolve_left hn

theorem mem_conj_iff {p q : Sentence (ext Sig)} (hp : InLang w.S p) (hq : InLang w.S q) :
    conj p q ∈ w.Γ ↔ p ∈ w.Γ ∧ q ∈ w.Γ := by
  constructor
  · intro h
    exact ⟨mem_of_theorem hp (Derivable.andE₁ (Theorem.ax h)),
      mem_of_theorem hq (Derivable.andE₂ (Theorem.ax h))⟩
  · intro h
    exact mem_of_theorem (inLang_conj.2 ⟨hp, hq⟩)
      (Derivable.andI (Theorem.ax h.1) (Theorem.ax h.2))

theorem mem_disj_iff {p q : Sentence (ext Sig)} (hp : InLang w.S p) (hq : InLang w.S q) :
    disj p q ∈ w.Γ ↔ p ∈ w.Γ ∨ q ∈ w.Γ := by
  constructor
  · intro h
    by_contra hn
    simp only [not_or] at hn
    have h₁ := (mem_neg_iff hp).2 hn.1
    have h₂ := (mem_neg_iff hq).2 hn.2
    exact w.consistent (Derivable.orE (Theorem.ax h)
      (Derivable.notE Derivable.hyp₀ (Derivable.weaken₁ (Theorem.ax h₁)))
      (Derivable.notE Derivable.hyp₀ (Derivable.weaken₁ (Theorem.ax h₂))))
  · rintro (h | h)
    · exact mem_of_theorem (inLang_disj.2 ⟨hp, hq⟩) (Derivable.orI₁ (Theorem.ax h))
    · exact mem_of_theorem (inLang_disj.2 ⟨hp, hq⟩) (Derivable.orI₂ (Theorem.ax h))

theorem mem_all_iff {σ : Ty} {F : Term (ext Sig) [] (σ ⇒ RTy.t)} (hF : InLang w.S F) :
    app (.all σ) F ∈ w.Γ ↔ ∀ a : Term (ext Sig) [] σ, InLang w.S a → app F a ∈ w.Γ := by
  constructor
  · intro h a ha
    exact mem_of_theorem (inLang_app.2 ⟨hF, ha⟩) (Derivable.allE (Theorem.ax h) a)
  · intro h
    by_contra hn
    have hneg := (mem_neg_iff (inLang_all_app.2 hF)).2 hn
    have hFw : InLang w.S (F.weaken (τ := σ)) := (inLang_rename _).2 hF
    have hb : InLang w.S (Term.lam (neg (Term.app F.weaken (.var .zero)))) :=
      inLang_lam.2 (inLang_neg.2 (inLang_app.2 ⟨hFw, fun _ h => h.elim⟩))
    have hex : Term.app (.ex σ) (Term.lam (neg (Term.app F.weaken (.var .zero)))) ∈ w.Γ :=
      mem_of_theorem (inLang_ex_app.2 hb)
        (Derivable.existsBlock_neg_of_not_forallBlock [σ]
          (Derivable.conv (Theorem.ax hneg)
            (Conv.app_congr (Conv.refl _) (Conv.app_congr (Conv.refl _) (Conv.symm (Conv.eta F))))))
    obtain ⟨a, ha, hFa⟩ := w.witnessed _ hex
    have e : (neg (Term.app F.weaken (.var .zero))).instantiate a = neg (Term.app F a) := by
      simp only [Term.instantiate, Term.subst_app, Term.subst_not, Term.subst_var, Sub.cons_zero]
      rw [← Term.instantiate, Term.instantiate_weaken]
    have hn' : neg (Term.app F a) ∈ w.Γ :=
      mem_of_theorem (inLang_neg.2 (inLang_app.2 ⟨hF, ha⟩))
        (Derivable.conv (Theorem.ax hFa) (e ▸ Conv.beta _ a))
    exact (mem_neg_iff (inLang_app.2 ⟨hF, ha⟩)).1 hn' (h a ha)

theorem mem_ex_iff {σ : Ty} {F : Term (ext Sig) [] (σ ⇒ RTy.t)} (hF : InLang w.S F) :
    app (.ex σ) F ∈ w.Γ ↔ ∃ a : Term (ext Sig) [] σ, InLang w.S a ∧ app F a ∈ w.Γ := by
  constructor
  · exact w.witnessed F
  · rintro ⟨a, _, h⟩
    exact mem_of_theorem (inLang_ex_app.2 hF) (Derivable.exI a (Theorem.ax h))

/-- Membership transfers along conversion, within the language. -/
theorem mem_conv {p q : Sentence (ext Sig)} (hpq : p ≡ q) (hq : InLang w.S q) (hp : p ∈ w.Γ) :
    q ∈ w.Γ := by
  exact mem_of_theorem hq (Derivable.conv (Theorem.ax hp) hpq)

theorem eq_refl {σ : Ty} {a : Term (ext Sig) [] σ} (ha : InLang w.S a) : eq' a a ∈ w.Γ := by
  exact mem_of_theorem (inLang_eq'.2 ⟨ha, ha⟩) (Derivable.refl a)

theorem eq_symm {σ : Ty} {a b : Term (ext Sig) [] σ} (h : eq' a b ∈ w.Γ) : eq' b a ∈ w.Γ := by
  have hl := inLang_eq'.1 (w.lang _ h)
  exact mem_of_theorem (inLang_eq'.2 ⟨hl.2, hl.1⟩) (Derivable.eqSymm (Theorem.ax h))

theorem eq_trans {σ : Ty} {a b c : Term (ext Sig) [] σ} (h₁ : eq' a b ∈ w.Γ) (h₂ : eq' b c ∈ w.Γ) :
    eq' a c ∈ w.Γ := by
  exact mem_of_theorem (inLang_eq'.2 ⟨(inLang_eq'.1 (w.lang _ h₁)).1, (inLang_eq'.1 (w.lang _ h₂)).2⟩)
    (Derivable.eqTrans (Theorem.ax h₁) (Theorem.ax h₂))

/-- Leibniz's Law within a world. -/
theorem mem_ll {σ : Ty} {a b : Term (ext Sig) [] σ} (F : Term (ext Sig) [] (σ ⇒ RTy.t))
    (hFb : InLang w.S F) (h : eq' a b ∈ w.Γ) (hFa : app F a ∈ w.Γ) : app F b ∈ w.Γ := by
  exact mem_of_theorem (inLang_app.2 ⟨hFb, (inLang_eq'.1 (w.lang _ h)).2⟩)
    (Derivable.ll F (Theorem.ax h) (Theorem.ax hFa))

/-! ### Accessibility -/

/-- Accessible worlds have larger languages. -/
theorem inLang_of_le (h : w ≤ v) {Γ : Ctx} {σ : Ty} {t : Term (ext Sig) Γ σ}
    (ht : InLang w.S t) : InLang v.S t := by
  intro r hr
  let c : Term (ext Sig) [] r.1 := Term.const (Sig := ext Sig) (Sum.inr r)
  have hc : InLang w.S c := inLang_reserve.2 (ht r hr)
  have hrefl : C.Theorem (Sig := ext Sig) (eq' c c) := Derivable.refl c
  have hbox : box (eq' c c) ∈ w.Γ :=
    mem_of_theorem (inLang_box.2 (inLang_eq'.2 ⟨hc, hc⟩)) (Theorem.ofC (C.Theorem.nec hrefl))
  exact inLang_reserve.1 (inLang_eq'.1 (v.lang _ (h _ hbox))).1

/-- Identities persist along accessibility. -/
theorem eq_of_le (h : w ≤ v) {σ : Ty} {a b : Term (ext Sig) [] σ} (hab : eq' a b ∈ w.Γ) :
    eq' a b ∈ v.Γ := by
  refine h _ (mem_of_theorem (inLang_box.2 (w.lang _ hab)) ?_)
  exact Theorem.mp (Theorem.ofC (nec_identity a b)) (Theorem.ax hab)

/-- **The successor lemma** (Proposition 18.3 of the book): a sentence of the language that
is not necessary at `w` is false at some accessible world. -/
theorem exists_le_of_not_box [Countable Sig.Const] {p : Sentence (ext Sig)} (hp : InLang w.S p)
    (h : box p ∉ w.Γ) : ∃ v : World Sig, w ≤ v ∧ neg p ∈ v.Γ := by
  let A : AxiomSet (ext Sig) := fun q => box q ∈ w.Γ ∨ q = neg p
  have hA : ∀ q, A q → InLang w.S q := by
    rintro q (hq | rfl)
    · exact inLang_box.1 (w.lang _ hq)
    · exact inLang_neg.2 hp
  have hc : AxiomSet.Consistent A := by
    refine Classical.byContradiction fun hn => h ?_
    have hnn := not_consistent_insert_iff.1 hn
    have hp' : Theorem (C.axioms ∪ fun q => box q ∈ w.Γ) p :=
      Derivable.orE (Derivable.em p) Derivable.hyp₀
        (Derivable.notE Derivable.hyp₀ (Derivable.weaken₁ hnn))
    obtain ⟨L, hL, d⟩ := Theorem.exists_hyps hp'
    refine mem_of_theorem (inLang_box.2 hp) (Theorem.of_hyps (fun q hq => ?_) (Derivable.box_hyps d))
    obtain ⟨q', hq', rfl⟩ := List.mem_map.1 hq
    exact hL q' hq'
  obtain ⟨S, Γ, hS, hroomy, hAΓ, hlang, hcons, hcompl, hwit⟩ := lindenbaum w.roomy hA hc
  exact ⟨⟨S, hroomy, Γ, hlang, hcons, hcompl, hwit⟩, fun q hq => hAΓ q (Or.inl hq),
    hAΓ _ (Or.inr rfl)⟩

variable (w) in
/-- **Every world says that every type is inhabited**, type variables included: the
reserve has a constant `(σ, 0)` of each type `σ`, so `∃x:σ. x = x` is a theorem of `C` in
the ambient signature, and it has no reserve constant. This is why `exists_world` needs
more than the consistency of `Ax` (see there). -/
theorem exists_self_mem (σ : Ty) :
    Term.exists' (σ := σ) (eq' (Term.var .zero) (Term.var .zero)) ∈ w.Γ :=
  mem_of_theorem (inLang_ex_app.2 (inLang_lam.2 (inLang_eq'.2 ⟨fun _ h => h.elim, fun _ h => h.elim⟩)))
    (Derivable.exIβ (Term.const (Sig := ext Sig) (Sum.inr (σ, 0))) (Derivable.refl _))

end World

/-- **Lindenbaum–Henkin**, from consistency in the ambient signature: an axiom set whose
reading in the ambient signature is consistent with `C` is included in some world. -/
theorem exists_world_of_consistent_lift [Countable Sig.Const] {Ax : AxiomSet Sig}
    (h : AxiomSet.Consistent (AxiomSet.lift Ax)) :
    ∃ w : World Sig, ∀ a, AxiomSet.lift Ax a → a ∈ w.Γ := by
  have hA : ∀ p, AxiomSet.lift Ax p → InLang ∅ p := by
    rintro _ ⟨b, -, rfl⟩
    exact inLang_lift b
  obtain ⟨S, Γ, -, hroomy, hAΓ, hlang, hcons, hcompl, hwit⟩ :=
    lindenbaum (fun τ => by simpa using Set.infinite_univ) hA h
  exact ⟨⟨S, hroomy, Γ, hlang, hcons, hcompl, hwit⟩, hAΓ⟩

/-- **Lindenbaum–Henkin**, from consistency with Existence at the type variables: such
an axiom set is included in some world. The hypothesis is needed as well as sufficient,
since every world says that every type is inhabited (`World.exists_self_mem`). -/
theorem exists_world_of_varExistence [Countable Sig.Const] {Ax : AxiomSet Sig}
    (h : AxiomSet.Consistent (Ax ∪ AxiomSet.varExistence)) :
    ∃ w : World Sig, ∀ a, AxiomSet.lift Ax a → a ∈ w.Γ :=
  exists_world_of_consistent_lift (AxiomSet.Consistent.lift_of_varExistence h)

/-- **Lindenbaum–Henkin**: an axiom set of the paper's language, in a signature of the
paper's language, consistent with `C`, is included in some world.

The restriction to the paper's language is needed: every world contains `∃x:σ. x = x` at
every type `σ`, type variables included (`World.exists_self_mem`), and `C` does not prove
that of a type variable, so `{¬∃x:var 0. x = x}`, consistent with `C`, is in no world. For
the paper's language, Existence at the type variables is consistent with any consistent
theory (`AxiomSet.Consistent.union_varExistence`, by vectorizing along `var i ↦ e`), and
the reserve is conservative over it (`AxiomSet.Consistent.lift_of_varExistence`). -/
theorem exists_world [Countable Sig.Const] (hS : Sig.Closed) {Ax : AxiomSet Sig}
    (hc : AxiomSet.ClosedTypes Ax) (h : AxiomSet.Consistent Ax) :
    ∃ w : World Sig, ∀ a, AxiomSet.lift Ax a → a ∈ w.Γ :=
  exists_world_of_varExistence (h.union_varExistence hS hc)

end Completeness

end Classicism.Meta
