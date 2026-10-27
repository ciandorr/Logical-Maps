import Classicism.Certified.Schemas
import Classicism.Syntax.SentenceSchemas
import Classicism.Syntax.Pure

/-!
# Possibility and Distinctness are equivalent

The map's records `distinctness-schema-r-implies-possibility-schema-r`,
`possibility-schema-r-implies-distinctness-schema-r`, and the same two for the signature
versions, `distinctness-signature-r-implies-possibility-signature-r` and
`possibility-signature-r-implies-distinctness-signature-r` (Classicism, §2.4, pp. 35–36;
§2.5, pp. 37–39). Both schemas are relative to a theory `C ∪ Ax` over a signature `Sig`;
the theorems are proved for any `Sig` and `Ax`, so the pure and the signature records are
the same two theorems, at `Signature.pure` and `empty` or at `Σ` and its axioms.

**Distinctness gives Possibility.** If `P` is consistent with the theory, `P = ⊥` is not
its theorem — else `P` and `P = ⊥` would give `⊥` — so Distinctness has `¬(P = ⊥)`, which
is `◇P` as the map and this layer define it. No object-level reasoning: the two schemas
meet at the sentence.

**Possibility gives Distinctness.** If `A = B` is not a theorem, `A ≠ B` is consistent
(the deduction theorem and excluded middle, `consistent_neg_of_not_theorem`), so
Possibility has `◇(A ≠ B)`; and `◇(A ≠ B) → A ≠ B` is a theorem of Classicism by the
necessity of identity — proved in the shallow layer (`ne_of_dia_ne`), certified, carried
into the signature (`ofPure`), and applied to `A` and `B` (`allE₂β`).

The maximalization of a theory contains its Distinctness schema, so `Max T` entails both.
-/

namespace Classicism

#classicism_derive Classicism.ne_of_dia_ne

namespace Meta

open AxiomSet

variable {Sig : Signature} (Ax : AxiomSet Sig)

/-- **Distinctness entails Possibility**, relative to any theory. -/
theorem distinctness_entails_possibility : distinctness Ax ⟹ possibility Ax := by
  rintro a ⟨hc, p, hp, rfl⟩
  exact Theorem.ax ⟨hc, Ty.t, p, Term.bot, not_theorem_eq_bot_of_consistent hp, rfl⟩

/-- **Possibility entails Distinctness**, relative to any theory. -/
theorem possibility_entails_distinctness : possibility Ax ⟹ distinctness Ax := by
  rintro a ⟨hc, σ, x, y, hxy, rfl⟩
  have hd : Theorem (C.axioms ∪ possibility Ax) (Term.dia (Term.neg (Term.eq' x y))) :=
    Theorem.ax ⟨by simpa using hc, Term.neg (Term.eq' x y), consistent_neg_of_not_theorem hxy, rfl⟩
  exact Theorem.mp (Derivable.allE₂β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure (ne_of_dia_ne.derivable σ))) x y) hd

theorem max_entails_distinctness : max Ax ⟹ distinctness Ax :=
  Entails.of_subset (distinctness_subset_max Ax)

theorem max_entails_possibility : max Ax ⟹ possibility Ax :=
  Entails.trans (max_entails_distinctness Ax) (distinctness_entails_possibility Ax)

/-- Maximalist Classicism entails Possibility (pure). -/
theorem maximalist_entails_possibility : maximalist ⟹ possibility (empty : AxiomSet Sig) :=
  max_entails_possibility empty

/-! ### The map's records -/

/-- `distinctness-schema-r-implies-possibility-schema-r`. -/
theorem distinctness_schema_r_implies_possibility_schema_r :
    distinctness (empty : AxiomSet Signature.pure) ⟹ possibility empty :=
  distinctness_entails_possibility empty

/-- `possibility-schema-r-implies-distinctness-schema-r`. -/
theorem possibility_schema_r_implies_distinctness_schema_r :
    possibility (empty : AxiomSet Signature.pure) ⟹ distinctness empty :=
  possibility_entails_distinctness empty

/-- `distinctness-signature-r-implies-possibility-signature-r`, for any signature. -/
theorem distinctness_signature_r_implies_possibility_signature_r :
    distinctness (empty : AxiomSet Sig) ⟹ possibility empty :=
  distinctness_entails_possibility empty

/-- `possibility-signature-r-implies-distinctness-signature-r`, for any signature. -/
theorem possibility_signature_r_implies_distinctness_signature_r :
    possibility (empty : AxiomSet Sig) ⟹ distinctness empty :=
  possibility_entails_distinctness empty

end Meta

end Classicism
