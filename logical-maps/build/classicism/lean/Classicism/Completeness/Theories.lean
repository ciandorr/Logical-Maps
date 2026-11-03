import Classicism.Completeness.ObjectLemmas

/-!
# Theories as sets of hypotheses

The facts about derivability from a *set* of sentences that a Lindenbaum construction
uses. A derivation cites finitely many axioms (`Derivable.exists_list`), so a theorem of `C`
with an axiom set is a theorem of `C` from finitely many of its sentences as hypotheses
(`Theorem.exists_hyps`), and conversely (`Derivable.discharge`); consistency is then the
underivability of `⊥` from every finite list of the set's sentences (`consistent_iff`).
With hypotheses in place of axioms, the necessitation of a derivation from hypotheses is a
derivation from their necessitations (`Derivable.box_hyps`), by `nec` and `K`.

Turning axioms into hypotheses is what makes the side condition of the rule Subst, whose
premises are derived in the logical part of the axiom set, harmless: the hypotheses
never enter them, and the axioms left are `C`'s own.
-/

namespace Classicism.Meta

namespace Completeness

variable {Sig : Signature}

open Term

/-! ### Compactness -/

/-- **A derivation cites finitely many axioms.** By induction on the derivation; Subst's
premises are derived in the logical part of the set, and their axioms, being logical,
stay in the logical part of the list. -/
theorem Derivable.exists_list : ∀ {Ax : AxiomSet Sig} {Γ : Ctx} {Δ : List (Formula Sig Γ)}
    {p : Formula Sig Γ}, Derivable Ax Δ p →
    ∃ L : List (Sentence Sig), (∀ a ∈ L, Ax a) ∧ Derivable (fun a => a ∈ L) Δ p := by
  intro Ax Γ Δ p h
  induction h with
  | hyp h => exact ⟨[], by simp, Derivable.hyp h⟩
  | ax h => exact ⟨[_], by simpa using h, Derivable.ax (List.mem_singleton_self _)⟩
  | andI _ _ ih₁ ih₂ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L₁ ++ L₂, fun a ha => (List.mem_append.1 ha).elim (hL₁ a) (hL₂ a), ?_⟩
    exact Derivable.andI (Derivable.mono (fun a h => List.mem_append_left _ h) d₁)
      (Derivable.mono (fun a h => List.mem_append_right _ h) d₂)
  | andE₁ _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.andE₁ d⟩
  | andE₂ _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.andE₂ d⟩
  | orI₁ _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.orI₁ d⟩
  | orI₂ _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.orI₂ d⟩
  | orE _ _ _ ih ih₁ ih₂ =>
    obtain ⟨L, hL, d⟩ := ih; obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L ++ L₁ ++ L₂, fun a ha => ?_, ?_⟩
    · simp only [List.mem_append] at ha
      exact ha.elim (fun h => h.elim (hL a) (hL₁ a)) (hL₂ a)
    · exact Derivable.orE (Derivable.mono (fun a h => by simp [h]) d)
        (Derivable.mono (fun a h => by simp [h]) d₁) (Derivable.mono (fun a h => by simp [h]) d₂)
  | notI _ _ ih₁ ih₂ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L₁ ++ L₂, fun a ha => (List.mem_append.1 ha).elim (hL₁ a) (hL₂ a), ?_⟩
    exact Derivable.notI (Derivable.mono (fun a h => List.mem_append_left _ h) d₁)
      (Derivable.mono (fun a h => List.mem_append_right _ h) d₂)
  | notE _ _ ih₁ ih₂ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L₁ ++ L₂, fun a ha => (List.mem_append.1 ha).elim (hL₁ a) (hL₂ a), ?_⟩
    exact Derivable.notE (Derivable.mono (fun a h => List.mem_append_left _ h) d₁)
      (Derivable.mono (fun a h => List.mem_append_right _ h) d₂)
  | em p => exact ⟨[], by simp, Derivable.em p⟩
  | allE _ a ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.allE d a⟩
  | allI _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.allI d⟩
  | exI a _ ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.exI a d⟩
  | exE _ _ ih₁ ih₂ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L₁ ++ L₂, fun a ha => (List.mem_append.1 ha).elim (hL₁ a) (hL₂ a), ?_⟩
    exact Derivable.exE (Derivable.mono (fun a h => List.mem_append_left _ h) d₁)
      (Derivable.mono (fun a h => List.mem_append_right _ h) d₂)
  | refl a => exact ⟨[], by simp, Derivable.refl a⟩
  | ll F _ _ ih₁ ih₂ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂
    refine ⟨L₁ ++ L₂, fun a ha => (List.mem_append.1 ha).elim (hL₁ a) (hL₂ a), ?_⟩
    exact Derivable.ll F (Derivable.mono (fun a h => List.mem_append_left _ h) d₁)
      (Derivable.mono (fun a h => List.mem_append_right _ h) d₂)
  | conv _ c ih => obtain ⟨L, hL, d⟩ := ih; exact ⟨L, hL, Derivable.conv d c⟩
  | subst C _ _ _ ih₁ ih₂ ih₃ =>
    obtain ⟨L₁, hL₁, d₁⟩ := ih₁; obtain ⟨L₂, hL₂, d₂⟩ := ih₂; obtain ⟨L₃, hL₃, d₃⟩ := ih₃
    refine ⟨L₁ ++ L₂ ++ L₃, fun a ha => ?_, ?_⟩
    · simp only [List.mem_append] at ha
      exact ha.elim (fun h => h.elim (fun h => (hL₁ a h).1) (fun h => (hL₂ a h).1)) (hL₃ a)
    · refine Derivable.subst C (Derivable.mono (fun a h => ⟨by simp [h], (hL₁ a h).2⟩) d₁)
        (Derivable.mono (fun a h => ⟨by simp [h], (hL₂ a h).2⟩) d₂)
        (Derivable.mono (fun a h => by simp [h]) d₃)

/-- Axioms of a finite list, beyond those of `C`, become hypotheses. -/
theorem Derivable.hyps_of_list {A : AxiomSet Sig} {p : Sentence Sig} :
    ∀ (L₀ : List (Sentence Sig)) (Δ : List (Sentence Sig)), (∀ a ∈ L₀, (C.axioms ∪ A) a) →
      Derivable (fun b => b ∈ L₀ ∨ C.axioms b) Δ p →
      ∃ L : List (Sentence Sig), (∀ q ∈ L, A q) ∧ C.Derivable (L ++ Δ) p
  | [], Δ, _, d => ⟨[], by simp, Derivable.mono (fun b h => by simpa using h) d⟩
  | a :: L₀, Δ, hL, d => by
    have hL' : ∀ b ∈ L₀, (C.axioms ∪ A) b := fun b hb => hL b (List.mem_cons_of_mem _ hb)
    rcases hL a List.mem_cons_self with ha | ha
    · refine Derivable.hyps_of_list L₀ Δ hL' (Derivable.mono (fun b h => ?_) d)
      rcases h with h | h
      · rcases List.mem_cons.1 h with rfl | h
        · exact Or.inr ha
        · exact Or.inl h
      · exact Or.inr h
    · have d' := Derivable.ofAxiom (Ax := fun b => b ∈ L₀ ∨ C.axioms b) (a := a)
        (fun b h => by
          rcases h with h | h
          · rcases List.mem_cons.1 h with rfl | h
            · exact Or.inr rfl
            · exact Or.inl (Or.inl h)
          · exact Or.inl (Or.inr h))
        (fun h => Or.inr h) d
      rw [Term.close_nil] at d'
      obtain ⟨L, hL₂, d₂⟩ := Derivable.hyps_of_list L₀ (a :: Δ) hL' d'
      refine ⟨a :: L, fun q hq => ?_, Derivable.weaken d₂ ?_⟩
      · rcases List.mem_cons.1 hq with rfl | hq
        · exact ha
        · exact hL₂ q hq
      · intro x hx
        simp only [List.mem_append, List.mem_cons] at hx ⊢
        rcases hx with hx | hx | hx
        · exact Or.inl (Or.inr hx)
        · exact Or.inl (Or.inl hx)
        · exact Or.inr hx

/-- **Compactness**: a theorem of `C` with an axiom set is derivable in `C` from finitely
many of the set's sentences, as hypotheses. -/
theorem Theorem.exists_hyps {A : AxiomSet Sig} {p : Sentence Sig}
    (h : Theorem (C.axioms ∪ A) p) :
    ∃ L : List (Sentence Sig), (∀ q ∈ L, A q) ∧ C.Derivable L p := by
  obtain ⟨L₀, hL₀, d⟩ := Derivable.exists_list h
  obtain ⟨L, hL, d'⟩ := Derivable.hyps_of_list L₀ [] hL₀ (Derivable.mono (fun b h => Or.inl h) d)
  exact ⟨L, hL, by simpa using d'⟩

/-- Hypotheses that are theorems can be discharged. -/
theorem Derivable.discharge {Ax : AxiomSet Sig} :
    ∀ {L : List (Sentence Sig)} {p : Sentence Sig}, Derivable Ax L p →
      (∀ q ∈ L, Theorem Ax q) → Theorem Ax p
  | [], _, d, _ => d
  | q :: _, _, d, hL =>
    Theorem.mp (Derivable.discharge (Derivable.impI d) (fun r hr => hL r (List.mem_cons_of_mem _ hr)))
      (hL q List.mem_cons_self)

/-- A derivation in `C` from hypotheses in a set is a theorem of `C` with the set. -/
theorem Theorem.of_hyps {A : AxiomSet Sig} {L : List (Sentence Sig)} {p : Sentence Sig}
    (hL : ∀ q ∈ L, A q) (d : C.Derivable L p) : Theorem (C.axioms ∪ A) p :=
  Derivable.discharge (Derivable.mono (fun _ h => Or.inl h) d) (fun q hq => Theorem.ax (hL q hq))

theorem Theorem.iff_exists_hyps {A : AxiomSet Sig} {p : Sentence Sig} :
    Theorem (C.axioms ∪ A) p ↔ ∃ L : List (Sentence Sig), (∀ q ∈ L, A q) ∧ C.Derivable L p :=
  ⟨Theorem.exists_hyps, fun ⟨_, hL, d⟩ => Theorem.of_hyps hL d⟩

/-- **Consistency** of a set: no finite list of its sentences derives `⊥` in `C`. -/
theorem consistent_iff {A : AxiomSet Sig} :
    AxiomSet.Consistent A ↔ ∀ L : List (Sentence Sig), (∀ q ∈ L, A q) → ¬ C.Derivable L Term.bot :=
  ⟨fun h L hL d => h (Theorem.of_hyps hL d), fun h hb => by
    obtain ⟨L, hL, d⟩ := Theorem.exists_hyps hb
    exact h L hL d⟩

/-- Consistency passes to subsets. -/
theorem Consistent.of_subset {A B : AxiomSet Sig} (hAB : ∀ a, A a → B a)
    (h : AxiomSet.Consistent B) : AxiomSet.Consistent A :=
  fun hb => h (Derivable.mono (fun a ha => ha.elim Or.inl (fun ha => Or.inr (hAB a ha))) hb)

/-- A set and a sentence are inconsistent together just when the set refutes it: the
classical form, `Γ ∪ {p} ⊢ ⊥` iff `Γ ⊢ ¬p`. -/
theorem not_consistent_insert_iff {A : AxiomSet Sig} {p : Sentence Sig} :
    ¬ AxiomSet.Consistent (fun q => A q ∨ q = p) ↔ Theorem (C.axioms ∪ A) (Term.neg p) := by
  constructor
  · intro h
    have hb : Theorem (C.axioms ∪ (A ∪ AxiomSet.single p)) Term.bot := by
      refine Classical.byContradiction fun hc => ?_
      exact h (fun hb => hc (Derivable.mono (fun a ha => ha.elim Or.inl (fun ha => Or.inr ha)) hb))
    have himp := Theorem.deductionC hb
    have hb' : Derivable (C.axioms ∪ A) [p] Term.bot := Derivable.impE (Derivable.weaken₁ himp) Derivable.hyp₀
    exact Derivable.notI (Derivable.andE₁ hb') (Derivable.andE₂ hb')
  · intro h hc
    exact hc (Derivable.notE (Derivable.axiom (Or.inr (Or.inr rfl)))
      (Derivable.mono (fun a ha => ha.elim Or.inl (fun ha => Or.inr (Or.inl ha))) h))

/-! ### Necessitating a derivation from hypotheses -/

/-- **From `q₁, …, qₙ ⊢ p` in `C`, `□q₁, …, □qₙ ⊢ □p`**: by the deduction theorem, `nec`
and `K`, one hypothesis at a time. -/
theorem Derivable.box_hyps : ∀ {L : List (Sentence Sig)} {p : Sentence Sig},
    C.Derivable L p → C.Derivable (L.map Term.box) (Term.box p)
  | [], _, d => C.Theorem.nec d
  | q :: L, p, d => by
    have ih := Derivable.box_hyps (L := L) (Derivable.impI d)
    have hK : C.Derivable (Term.box q :: L.map Term.box)
        (Term.imp (Term.box (Term.imp q p)) (Term.imp (Term.box q) (Term.box p))) := by
      have := Derivable.ofTheorem (Δ := Term.box q :: L.map Term.box) (box_K q p)
      rwa [Term.close_nil] at this
    exact Derivable.impE (Derivable.impE hK (Derivable.weaken₁ ih)) Derivable.hyp₀

end Completeness

end Classicism.Meta
