import Classicism.Results.SentenceSchemas.Incompatibilities
import Classicism.Coalesced.Complete
import Classicism.MapDerived
import Classicism.Results.Other.Certificates
import Classicism.Completeness.Completeness
import Classicism.Semantics.Numerals

/-!
# Further results about the sentence schemas (1 November 2026)

- No Pure Contingency necessitates Atomlessness and Well-Ordering, as every pure principle
  (`npc_union_entails_box_pure`).
- **Maximalism excludes the necessitation of anything a model refutes**
  (`maximalist_box_inconsistent_of_model`): the model makes the negation of a failing instance
  consistent, and `max_box_inconsistent` applies. Its instances: `□`Atomlessness (it fails in
  `Prop`, whose one proposition `⊤` other than `⊥` is an atom), `□`Relational Choice (it fails
  in the symmetric model on all surjections, `symmetric-all-surjections`).
- `possibility-schema-r-implies-possible-infinity-t`: the Axiom of Infinity at `t` holds in the
  coalesced sum `coalesced-all-finite-individual-domains`, so it is consistent.
- `strong-possibility-r-implies-possibility-schema-r`: Maximalism (pure) is consistent (the
  maximalist root), so with `◇P` it is, for every consistent `P`; Strong Possibility gives
  `◇_≠◇P`, hence `◇P`.
-/

namespace Classicism

/-- `◇_≠◇p → ◇p`: `◇_≠` is below `◇`, and `4`. -/
theorem diaNe_dia_imp_dia (p : Prop) : P.DiaNe (◇ p) → ◇ p := fun h hn =>
  h ⟨True, trivial, modal_K _ _ (nec% (fun (hb : □ (¬ p)) (_ : ◇ True) (hd : ◇ p) =>
      not_dia_of_box_not p hb hd)) (modal_four _ ((box_not_eq p).mpr hn))⟩

#classicism_derive Classicism.diaNe_dia_imp_dia

/-- The second instance of the Infinity schema at `e`, as the schema writes it. -/
def TwoIndividuals : Prop := ∃ x y : e, ((¬ x = y) ∧ True) ∧ (True ∧ True)

/-- `◇(a ≠ b) → a ≠ b`, by the necessity of identity. -/
theorem ne_of_dia_ne_e (a b : e) : ◇ (¬ a = b) → ¬ a = b := fun hd h =>
  (dia_not_eq (a = b) ▸ hd) (necessity_of_identity a b h)

/-- Two distinct individuals make it ND-necessary that there are two: `a ≠ b` is true, and
wherever it is possible it is true. -/
theorem two_imp (a b : e) : ◇ (¬ a = b) → ¬ ¬ TwoIndividuals := fun hd hn =>
  hn ⟨a, b, ⟨ne_of_dia_ne_e a b hd, trivial⟩, trivial, trivial⟩

/-- `◇_≠¬T₂ → ¬T₂` (the lemma of `strong-possibility-and-infinity-e-incompatible`). -/
theorem diaNe_not_two : P.DiaNe (¬ TwoIndividuals) → ¬ TwoIndividuals := fun h ⟨a, b, hab⟩ =>
  h ⟨¬ a = b, hab.1.1, nec% (two_imp a b)⟩

/-- With `◇_≠T₂` and `◇_≠¬T₂`, the Distinctness-Preserving Collapse at whichever of `T₂`, `¬T₂` is
true contradicts the other. -/
theorem dpc_two_contra : P.TruthsAreNDNecessary → P.DiaNe TwoIndividuals →
    P.DiaNe (¬ TwoIndividuals) → False := fun h d₁ d₂ =>
  (em TwoIndividuals).elim (fun ht => d₂ (h _ (fun hn => hn ht))) (fun hn => d₁ (h _ hn))

/-- With `◇_≠T₂` and `◇_≠¬T₂`, two-hat necessity implying ND-necessity is contradicted: `¬T₂`
holds, and is two-hat necessary through itself (`◇_≠¬T₂ → ¬T₂`, necessitated), so
ND-necessary, against `◇_≠T₂`. -/
theorem twoHat_two_contra : P.TwoHatImpliesNdNecessity → P.DiaNe TwoIndividuals →
    P.DiaNe (¬ TwoIndividuals) → False := fun h d₁ d₂ =>
  d₁ (h _ ⟨¬ TwoIndividuals, diaNe_not_two d₂, nec% diaNe_not_two⟩)

#classicism_derive Classicism.diaNe_not_two Classicism.dpc_two_contra Classicism.twoHat_two_contra

namespace Meta

open AxiomSet

variable {Sig : Signature}

/-! ### No Pure Contingency -/

/-- `no-pure-contingency-and-atomlessness-imply-necessary-atomlessness`. -/
theorem npc_atomlessness_entails_necAtomlessness :
    npc Signature.pure ∪ P.Atomlessness.schema ⟹ P.NecAtomlessness.schema := by
  rintro a rfl
  exact npc_union_entails_box_pure P.Atomlessness.schema_closedTypes _ (AxiomSet.mem_box rfl)

/-- `no-pure-contingency-and-well-ordering-imply-necessary-well-ordering`, at every type. -/
theorem npc_wellOrdering_entails_necWellOrdering :
    npc Signature.pure ∪ P.WellOrdering.schema ⟹ P.NecWellOrdering.schema := by
  rintro a ⟨σ, hσ, rfl⟩
  exact npc_union_entails_box_pure P.WellOrdering.schema_closedTypes _
    (AxiomSet.mem_box ⟨σ, hσ, rfl⟩)

/-! ### Maximalism against the necessitation of what a model refutes -/

/-- **Maximalism (pure) is inconsistent with the necessitation of a schema some model of `C`
refutes**: a failing instance has a consistent negation. -/
theorem maximalist_box_inconsistent_of_model {C : Type} [CategoryTheory.SmallCategory C]
    (M : Intensional.Premodel Signature.pure C) (hM : M.IsModel) {X N : AxiomSet Signature.pure}
    (hX : ClosedTypes X) (hf : ¬ M.HoldsAx X) (hN : X.box ⊆ N) :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ N) := fun hc => hf fun p hp =>
  Classical.byContradiction fun hn =>
    max_box_inconsistent (Ax := empty) (Y := p)
      (Consistent.of_model M hM (Ax := empty ∪ single (Term.neg p)) fun a ha => ha.elim
        (fun h => h.elim) (fun h => by rw [show a = Term.neg p from h]; exact (M.holdsSentence_neg hM p).2 hn))
      (hX p hp)
      (Consistent.mono (fun a ha => ha.elim Or.inl (fun h => Or.inr (hN a (by
        rw [show a = Term.box p from h]; exact AxiomSet.mem_box hp)))) hc)

/-- Atomlessness fails in `Prop`: `⊤` is possible, and whatever is possible and below it is
true, hence `⊤`. -/
theorem not_atomlessness_holds_henkin : Sentence.holds henkin (Term.neg P.Atomlessness.quoted) := by
  simp only [Sentence.holds, Term.denote, Var.denote]
  intro h
  rcases h (True : Prop) with h1 | ⟨x₁, hx₁, _, hne⟩
  · exact h1 fun e => (show (∀ y : Prop, y) ∧ ¬ ∀ y : Prop, y from cast e trivial).2
      (show (∀ y : Prop, y) ∧ ¬ ∀ y : Prop, y from cast e trivial).1
  · refine hne (propext ⟨fun _ => trivial, fun _ => ?_⟩)
    by_contra hc
    exact hx₁ (propext ⟨fun h => absurd h hc, fun h => (h.2 h.1).elim⟩)

theorem not_atomlessness_consistent : Consistent (single (Term.neg P.Atomlessness.quoted)) :=
  Consistent.of_interp henkin fun _ h => h ▸ not_atomlessness_holds_henkin

/-- `maximalist-distinctness-incompatible-with-necessary-atomlessness`. -/
theorem maximalist_necAtomlessness_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecAtomlessness.schema) :=
  max_box_inconsistent (Consistent.empty_union not_atomlessness_consistent) rfl

/-- `possibility-and-necessary-relational-choice-incompatible`: Relational Choice fails in
`symmetric-all-surjections` (the argument `relational-choice` of `symmetric-ideally-full`). -/
theorem maximalist_necRelationalChoice_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecRelationalChoice.schema) :=
  have h := Map.Models.symmetric_all_surjections.relational_choice_r
  maximalist_box_inconsistent_of_model _ h.1 P.RelationalChoice.schema_closedTypes
    (by rw [← Intensional.Premodel.holdsAx_schemaIn_iff]; exact h.2)
    (by rintro _ ⟨_, ⟨_, _, hc₁, hc₂, rfl⟩, rfl⟩; exact ⟨_, _, hc₁, hc₂, rfl⟩)

/-! ### The Axiom of Infinity at `t` is consistent -/

/-- The Axiom of Infinity at `t` holds in `coalesced-all-finite-individual-domains`. -/
theorem axiomOfInfinityT_consistent : Consistent (single P.AxiomOfInfinityT.quoted) :=
  have h := Map.Models.coalesced_all_finite_individual_domains.axiom_of_infinity_t
  Consistent.of_model _ h.1 (by rw [← Intensional.Premodel.holdsAx_schemaIn_iff]; exact h.2)

/-- `possibility-schema-r-implies-possible-infinity-t`. -/
theorem possibility_entails_possibleInfinityT :
    possibility (empty : AxiomSet Signature.pure) ⟹ P.PossibleInfinityT.schema := by
  rintro a rfl
  exact Theorem.ax (possibility_mem rfl (Consistent.empty_union axiomOfInfinityT_consistent))

/-! ### Strong Possibility gives Possibility -/

/-- Maximalist Classicism (pure) is consistent: the maximalist root. -/
theorem maximalist_pure_consistent : Consistent (maximalist (Sig := Signature.pure)) :=
  Consistent.mono (fun _ ha => ha.elim (fun h => h.elim) id)
    Coalesced.maximalism_distinctness_consistent

/-- `strong-possibility-r-implies-possibility-schema-r`: for `P` consistent with `C`,
Maximalism proves `◇P`, so `◇P` is consistent with it, and Strong Possibility gives `◇_≠◇P`,
whence `◇P`. -/
theorem strongPossibility_entails_possibility :
    strongPossibility Signature.pure ⟹ possibility (empty : AxiomSet Signature.pure) := by
  rintro a ⟨hc, p, hp, rfl⟩
  have hcp : p.closedTypes = true := by simpa using hc
  have hcons : Consistent (maximalist ∪ single (Term.dia p)) :=
    Consistent.of_entails (Entails.union (Entails.refl _) (fun b hb => by
      rw [show b = Term.dia p from hb]
      exact maximalist_entails_possibility _ (possibility_mem hcp hp))) maximalist_pure_consistent
  have hmem : strongPossibility Signature.pure (Term.diaNe (Term.dia p)) :=
    ⟨by simpa [Term.diaNe, Term.closedTypes_rename] using hcp, Term.dia p, hcons, rfl⟩
  exact Theorem.mp (Derivable.allEβ (Theorem.ofCMinus diaNe_dia_imp_dia.derivable) p)
    (Theorem.ax hmem)

/-- The second instance of the Infinity schema at `e`. -/
abbrev twoE {Sig : Signature} : Sentence Sig :=
  Term.existsBlock (List.replicate 2 Ty.e) (Term.distinct 2 (Terms.vars _ []))

/-- A model of the pure language where Maximalism (pure) holds is a model of Maximalist
Classicism. -/
theorem holdsAx_maximalist_of {C : Type} [CategoryTheory.SmallCategory C]
    (M : Intensional.Premodel Signature.pure C) (h : M.HoldsAx (pureVersion distinctnessC)) :
    M.HoldsAx (maximalist (Sig := Signature.pure)) := fun a ha =>
  ha.elim (fun h => h.elim) (fun hd => ((Intensional.Premodel.holdsAx_schemaIn_iff M _).1 h) a hd)

/-- Maximalism (pure) holds at the single-individual root (`coalesced-single-individual-root`):
its components are complete. -/
theorem singleIndividual_maximalism :
    Coalesced.singleIndividualData.model.HoldsAx (pureVersion distinctnessC) :=
  Coalesced.RootAction.holdsAx_distinctness_of_complete _ _ _ _
    Coalesced.singleIndividualData.isModel
    (Coalesced.SumData.completeComponents_root Coalesced.singleIndividualData_distinguished
      Coalesced.singleIndividualData_complete)

/-- There are not two individuals at the single-individual root. -/
theorem singleIndividual_not_twoE :
    ¬ Coalesced.singleIndividualData.model.HoldsSentence twoE := fun H => by
  obtain ⟨f, hf⟩ := (Intensional.Premodel.holds_count Coalesced.singleIndividualData.isModel
    (CategoryTheory.CategoryStruct.id _) .e 2).1 H
  have : Subsingleton (Coalesced.singleIndividualData.model.Dom
      Coalesced.singleIndividualData.model.W₀ .e) := inferInstanceAs (Subsingleton PUnit)
  exact absurd (hf (Subsingleton.elim (f 0) (f 1))) (by decide)

/-- `¬T₂` is consistent with Maximalist Classicism (pure). -/
theorem maximalist_not_twoE_consistent :
    Consistent (maximalist (Sig := Signature.pure) ∪ single (Term.neg twoE)) :=
  Consistent.of_model _ Coalesced.singleIndividualData.isModel fun a ha => ha.elim
    (holdsAx_maximalist_of _ singleIndividual_maximalism a)
    (fun h => by
      rw [show a = Term.neg twoE from h]
      exact (Coalesced.singleIndividualData.model.holdsSentence_neg
        Coalesced.singleIndividualData.isModel _).2 singleIndividual_not_twoE)

/-- `strong-possibility-and-infinity-e-incompatible`: Strong Possibility gives `◇_≠¬T₂`, so
`¬T₂`, against the second instance of the Infinity schema at `e`. -/
theorem strongPossibility_infinityE_inconsistent :
    ¬ Consistent (strongPossibility Signature.pure ∪ infinityE Signature.pure) := fun hc => hc <|
  have h₁ : Theorem (C.axioms ∪ (strongPossibility Signature.pure ∪ infinityE Signature.pure))
      (Term.diaNe (Term.neg twoE)) :=
    Theorem.ax (Or.inl ⟨rfl, Term.neg twoE, maximalist_not_twoE_consistent, rfl⟩)
  have h₂ : Theorem (C.axioms ∪ (strongPossibility Signature.pure ∪ infinityE Signature.pure))
      twoE := Theorem.ax (Or.inr ⟨2, by decide, rfl⟩)
  Derivable.notE h₂ (Theorem.mp (Theorem.ofCMinus diaNe_not_two.derivable) h₁)

/-- There are two individuals at the maximalist root of the pure signature: its root
individuals are infinitely many (`maximalistData_infinite`). -/
theorem maximalistPure_twoE :
    (Coalesced.maximalistData Signature.pure).model.HoldsSentence twoE := by
  have hinf : Infinite ((Coalesced.maximalistData Signature.pure).model.Dom
      (Coalesced.maximalistData Signature.pure).model.W₀ .e) :=
    Coalesced.maximalistData_infinite (Sig := Signature.pure) Coalesced.pure_closed
  refine (Intensional.Premodel.holds_count (Coalesced.maximalistData Signature.pure).isModel
    (CategoryTheory.CategoryStruct.id _) .e 2).2 ⟨fun i => Infinite.natEmbedding _ i.val, ?_⟩
  intro i j hij
  exact Fin.ext ((Infinite.natEmbedding _).injective hij)

/-- `T₂` is consistent with Maximalist Classicism (pure). -/
theorem maximalist_twoE_consistent :
    Consistent (maximalist (Sig := Signature.pure) ∪ single twoE) :=
  Consistent.of_model _ (Coalesced.maximalistData Signature.pure).isModel fun a ha => ha.elim
    (holdsAx_maximalist_of _ (Coalesced.RootAction.holdsAx_distinctness_of_complete _ _ _ _
      (Coalesced.maximalistData Signature.pure).isModel
      (Coalesced.SumData.completeComponents_root Coalesced.maximalistData_distinguished
        (Coalesced.maximalistData_complete Coalesced.pure_closed))) a)
    (fun h => by rw [show a = twoE from h]; exact maximalistPure_twoE)

/-- Strong Possibility (pure) has `◇_≠T₂` and `◇_≠¬T₂`. -/
theorem strongPossibility_diaNe_twoE {Ax : AxiomSet Signature.pure} (h : strongPossibility _ ⊆ Ax) :
    Theorem (C.axioms ∪ Ax) (Term.diaNe twoE) ∧ Theorem (C.axioms ∪ Ax) (Term.diaNe (Term.neg twoE)) :=
  ⟨Theorem.ax (h _ ⟨rfl, twoE, maximalist_twoE_consistent, rfl⟩),
   Theorem.ax (h _ ⟨rfl, Term.neg twoE, maximalist_not_twoE_consistent, rfl⟩)⟩

/-- `strong-possibility-and-distinctness-preserving-collapse-incompatible`. -/
theorem strongPossibility_dpc_inconsistent :
    ¬ Consistent (strongPossibility Signature.pure ∪ P.TruthsAreNDNecessary.schema) :=
  fun hc => hc <|
  have h := strongPossibility_diaNe_twoE (Ax := strongPossibility _ ∪ _) (subset_union_left _ _)
  Derivable.notE h.2 (Theorem.mp₂ (Theorem.ofCMinus dpc_two_contra.derivable) (Theorem.ax (Or.inr rfl)) h.1)

/-- `strong-possibility-and-two-hat-implies-nd-incompatible`. -/
theorem strongPossibility_twoHat_inconsistent :
    ¬ Consistent (strongPossibility Signature.pure ∪ P.TwoHatImpliesNdNecessity.schema) :=
  fun hc => hc <|
  have h := strongPossibility_diaNe_twoE (Ax := strongPossibility _ ∪ _) (subset_union_left _ _)
  Derivable.notE h.2 (Theorem.mp₂ (Theorem.ofCMinus twoHat_two_contra.derivable) (Theorem.ax (Or.inr rfl)) h.1)

/-! ### The Axioms of Infinity give the Infinity schemas, by completeness

In a model where the Axiom of Infinity at `σ` holds, the entities of type `σ` at the base are
infinitely many (`not_holds_axInf_of_finite`), so every instance of the Infinity schema at `σ`
holds there (`holds_count`); by completeness (`theorem_of_valid`) it is a theorem. -/

theorem axInf_entails_infinitySchema (σ : Ty) (hσ : σ.Closed)
    (hc : (Intensional.axInf σ).closedTypes = true) :
    single (Intensional.axInf σ) ⟹ infinitySchema Signature.pure σ := by
  rintro a ⟨n, _, rfl⟩
  refine Completeness.theorem_of_valid Coalesced.pure_closed
    (fun b hb => by rw [show b = Intensional.axInf σ from hb]; exact hc)
    (Intensional.Count.closedTypes_count hσ n) ?_
  intro W _ A hA hAx
  have hinf : Infinite (A.Dom A.W₀ σ) := by
    by_contra hfin
    rw [not_infinite_iff_finite] at hfin
    exact Intensional.Premodel.not_holds_axInf_of_finite hA (CategoryTheory.CategoryStruct.id _) σ
      (hAx _ rfl)
  exact (A.holds_count hA (CategoryTheory.CategoryStruct.id _) σ n).2
    ⟨fun i => Infinite.natEmbedding _ i.val, fun i j h => Fin.ext ((Infinite.natEmbedding _).injective h)⟩

/-- `axiom-of-infinity-e-implies-infinity-e`. -/
theorem axiomOfInfinityE_entails_infinityE :
    P.AxiomOfInfinityE.schema ⟹ infinityE Signature.pure :=
  axInf_entails_infinitySchema .e (by decide) (P.AxiomOfInfinityE.schema_closedTypes _ rfl)

/-- `axiom-of-infinity-t-implies-infinity-t`. -/
theorem axiomOfInfinityT_entails_infinityT :
    P.AxiomOfInfinityT.schema ⟹ infinityT Signature.pure :=
  axInf_entails_infinitySchema (.rel .t) (by decide) (P.AxiomOfInfinityT.schema_closedTypes _ rfl)

end Meta

end Classicism
