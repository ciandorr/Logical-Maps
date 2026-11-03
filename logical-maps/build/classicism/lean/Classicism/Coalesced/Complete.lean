import Classicism.Coalesced.Distinguished
import Classicism.Completeness.Completeness
import Classicism.Semantics.IntensionalTheory
import Classicism.Certified.Signatures

/-!
# Complete components: Maximalism at the root

Classicism, §3.6 and Appendix E: the coalesced sum of a family of action models complete for
`C`, with distinguished arrows and the fullest root domains, is a model of **Maximalism**:
every sentence consistent with `C` is possible at its root.

* **The general theorem** (`RootAction.holds_dia_of_complete`,
  `RootAction.holdsAx_possibility_of_complete`): for any root arrows and root domains, if the
  coalesced sum is a model and its components are **complete** (every closed-type pure
  sentence consistent with `C` holds in the component seen from some root arrow,
  `RootAction.CompleteComponents`), every such sentence is possible at the root, since a
  sentence true in the component seen from a root arrow is true in the truncation by that
  arrow (`RootAction.holds_dia_of_component`). So Maximalism (pure) holds there in its
  possibility form, and in its distinctness form (`holdsAx_distinctness_of_complete`): an
  identity that is possibly false is false, the values of terms being transported along
  arrows. The same holds for the sentences of the signature when the components are
  complete for `C(Σ)` (`RootAction.CompleteComponentsSig`, `holdsAx_possibilityC_of_complete`,
  `holdsAx_distinctnessC_of_complete`).
* **Distinguished arrows** (`completeComponentsSig_distinguished`): over Appendix E's
  distinguished arrows, with root values of the constants transported to the components',
  the component seen from the distinguished arrow is the component, so a family in which
  every sentence consistent with `C(Σ)` holds at the base of some member has complete
  components.
* **The complete family** (`canonicalFamily`): for a countable signature whose constants have
  closed types, the canonical model of `Completeness/` with its base varying over the worlds
  (`exists_complete_family`); its members are models, and every closed-type sentence
  consistent with `C(Σ)` holds at the base of one (`canonicalFamily_complete`).
* **The maximalist root** (`maximalist`, Theorem 3.26 and Appendix E): the coalesced sum of
  the complete family, with Appendix E's product root individuals and constants. It is a model
  (`maximalist_isModel`) of Maximalism, pure and for the signature, in both forms
  (`maximalist_possibility`, `maximalist_possibilityC`, `maximalist_distinctness`,
  `maximalist_distinctnessC`); so Maximalism is consistent with `C`
  (`maximalism_consistent`, `maximalism_distinctness_consistent`).
-/

namespace Classicism.Meta.Intensional.Premodel

open CategoryTheory

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C)

/-- An identity that is possibly false is false: along every arrow the values of the two
sides are transported, so equal values stay equal. -/
theorem not_holds_eq_of_dia_neg (M : A.IsModel) {σ : Ty} {x y : Term Sig [] σ}
    (h : A.HoldsSentence (Term.dia (Term.neg (Term.eq' x y)))) :
    ¬ A.HoldsSentence (Term.eq' x y) := by
  intro he
  rw [HoldsSentence, A.holds_dia M] at h
  obtain ⟨V, k, hk⟩ := h
  rw [A.holds_neg M, A.holds_eq M, A.sem_push, A.sem_push] at hk
  rw [HoldsSentence, A.holds_eq M] at he
  exact hk (congrArg _ he)

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)}

namespace RootAction

variable (RA : RootAction S A) (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c))

/-- **Complete components**: every closed-type pure sentence consistent with `C` holds in the
component seen from some root arrow. Over distinguished arrows, the component seen from the
distinguished arrow into a component is the component itself, so this says that every such
sentence is true at the root of some component. -/
def CompleteComponents : Prop :=
  ∀ p : Sentence Signature.pure, p.closedTypes = true →
    AxiomSet.Consistent (AxiomSet.single p) →
      ∃ (k : ι) (V : C k) (r : S.R.obj ⟨k, V⟩), (RA.component I r).HoldsSentence (Term.ofPure p)

/-- **Complete components for `C(Σ)`**: every closed-type sentence of the signature consistent
with `C(Σ)` holds in the component seen from some root arrow. -/
def CompleteComponentsSig : Prop :=
  ∀ p : Sentence Sig, p.closedTypes = true → AxiomSet.Consistent (AxiomSet.single p) →
    ∃ (k : ι) (V : C k) (r : S.R.obj ⟨k, V⟩), (RA.component I r).HoldsSentence p

/-- Components complete for `C(Σ)` are complete for `C`, the signature being closed:
`C(Σ)` is conservative over `C` (`consistent_ofPure_iff`). -/
theorem CompleteComponentsSig.complete (hS : Sig.Closed) (h : RA.CompleteComponentsSig I) :
    RA.CompleteComponents I := fun p hp hc =>
  h (Term.ofPure p) (by rw [Term.closedTypes_ofPure]; exact hp)
    (by
      have := (AxiomSet.consistent_ofPure_iff (Sig := Sig) hS (A := AxiomSet.single p)).2 hc
      refine AxiomSet.Consistent.mono ?_ this
      rintro _ rfl
      exact ⟨p, rfl, rfl⟩)

variable (RI : RootIncl RA) (ne : Nonempty (RA.D .e))

local notation "P" => RA.coalescedSum RI ne I

/-- **Every sentence consistent with `C` is possible at the root**, when the coalesced sum is a
model and its components are complete. -/
theorem holds_dia_of_complete (M : (P).IsModel) (hc : RA.CompleteComponents I)
    {p : Sentence Signature.pure} (hp : p.closedTypes = true)
    (h : AxiomSet.Consistent (AxiomSet.single p)) :
    (P).HoldsSentence (Term.dia (Term.ofPure p)) := by
  obtain ⟨k, V, r, hr⟩ := hc p hp h
  exact RA.holds_dia_of_component RI ne I M r hr

/-- Likewise for the sentences of the signature, when the components are complete for
`C(Σ)`. -/
theorem holds_dia_of_completeSig (M : (P).IsModel) (hc : RA.CompleteComponentsSig I)
    {p : Sentence Sig} (hp : p.closedTypes = true) (h : AxiomSet.Consistent (AxiomSet.single p)) :
    (P).HoldsSentence (Term.dia p) := by
  obtain ⟨k, V, r, hr⟩ := hc p hp h
  exact RA.holds_dia_of_component RI ne I M r hr

/-- A closed-type pure sentence whose negation is consistent with `C` is not necessary at the
root. -/
theorem not_holds_box_of_complete (M : (P).IsModel) (hc : RA.CompleteComponents I)
    {p : Sentence Signature.pure} (hp : p.closedTypes = true)
    (h : AxiomSet.Consistent (AxiomSet.single (Term.neg p))) :
    ¬ (P).HoldsSentence (Term.box (Term.ofPure p)) := by
  intro hb
  obtain ⟨k, V, r, hr⟩ := hc (Term.neg p) (by simpa using hp) h
  have := RA.component_of_holds_box RI ne I M hb r
  exact ((RA.component I r).holdsSentence_neg (((RA.isModel_iff RI ne I).1 M).1 r) _).1 hr this

theorem consistent_single_of {Sig' : Signature} {p : Sentence Sig'}
    (hc : AxiomSet.Consistent (AxiomSet.empty ∪ AxiomSet.single p)) :
    AxiomSet.Consistent (AxiomSet.single (Sig := Sig') p) :=
  AxiomSet.Consistent.mono (fun _ hb => Or.inr hb) hc

/-- **Maximalism (pure), possibility form, at the root**: with complete components, `◇P` for
every closed-type pure sentence `P` consistent with `C`. -/
theorem holdsAx_possibility_of_complete (M : (P).IsModel) (hc : RA.CompleteComponents I) :
    (P).HoldsAx (AxiomSet.pureVersion AxiomSet.possibilityC) := by
  rintro _ ⟨_, ⟨ht, p, hcons, rfl⟩, rfl⟩
  exact RA.holds_dia_of_complete I RI ne M hc (by simpa using ht) (consistent_single_of hcons)

/-- **Maximalism (pure), distinctness form, at the root**: with complete components,
`A ≠ B` for every closed-type pure identity `A = B` that `C` does not prove. -/
theorem holdsAx_distinctness_of_complete (M : (P).IsModel) (hc : RA.CompleteComponents I) :
    (P).HoldsAx (AxiomSet.pureVersion AxiomSet.distinctnessC) := by
  rintro _ ⟨_, ⟨ht, σ, x, y, hn, rfl⟩, rfl⟩
  have hcons := consistent_single_of (AxiomSet.consistent_neg_of_not_theorem hn)
  have hd := RA.holds_dia_of_complete I RI ne M hc (by simpa using ht) hcons
  exact ((P).holdsSentence_neg M _).2 ((P).not_holds_eq_of_dia_neg M hd)

/-- **Maximalism for the signature, possibility form, at the root**: with components complete
for `C(Σ)`. -/
theorem holdsAx_possibilityC_of_complete (M : (P).IsModel) (hc : RA.CompleteComponentsSig I) :
    (P).HoldsAx (AxiomSet.possibilityC Sig) := by
  rintro _ ⟨ht, p, hcons, rfl⟩
  exact RA.holds_dia_of_completeSig I RI ne M hc (by simpa using ht) (consistent_single_of hcons)

/-- **Maximalism for the signature, distinctness form, at the root.** -/
theorem holdsAx_distinctnessC_of_complete (M : (P).IsModel) (hc : RA.CompleteComponentsSig I) :
    (P).HoldsAx (AxiomSet.distinctnessC Sig) := by
  rintro _ ⟨ht, σ, x, y, hn, rfl⟩
  have hcons := consistent_single_of (AxiomSet.consistent_neg_of_not_theorem hn)
  have hd := RA.holds_dia_of_completeSig I RI ne M hc (by simpa using ht) hcons
  exact ((P).holdsSentence_neg M _).2 ((P).not_holds_eq_of_dia_neg M hd)

end RootAction

/-! ### Distinguished arrows -/

section Distinguished

variable (ae : AtomAction (baseArrows A) A .e) (av : ∀ i, AtomAction (baseArrows A) A (.var i))
  (I : ∀ c : Sig.Const, (fullAction ae av).D (Sig.typeOf c))

/-- Over the distinguished arrows, with the constants transported to the components' values,
a family in which every sentence consistent with `C(Σ)` holds at the base of some member has
complete components: the component seen from the distinguished arrow is the member. -/
theorem completeComponentsSig_distinguished (hI : TransportsConstants (fullAction ae av) I)
    (hA : ∀ p : Sentence Sig, p.closedTypes = true → AxiomSet.Consistent (AxiomSet.single p) →
      ∃ k : ι, (A k).HoldsSentence p) :
    (fullAction ae av).CompleteComponentsSig I := fun p hp hc => by
  obtain ⟨k, hk⟩ := hA p hp hc
  exact ⟨k, (A k).W₀, dist A k, by rw [component_dist hI k]; exact hk⟩

end Distinguished

/-! ### The complete family -/

section Family

open Completeness

variable (Sig) [Countable Sig.Const]

/-- **The complete family**: the canonical model of `Completeness/` with its base varying over
the worlds. -/
noncomputable abbrev canonicalFamily : World Sig → Premodel Sig (World Sig) :=
  fun w => Canonical.premodel w

variable {Sig}

theorem canonicalFamily_isModel (w : World Sig) : (canonicalFamily Sig w).IsModel :=
  Canonical.isModel w

/-- Every closed-type sentence consistent with `C(Σ)` holds at the base of a member of the
complete family (`exists_complete_family`). -/
theorem canonicalFamily_complete (hS : Sig.Closed) (p : Sentence Sig) (hp : p.closedTypes = true)
    (h : AxiomSet.Consistent (AxiomSet.single p)) : ∃ w, (canonicalFamily Sig w).HoldsSentence p := by
  obtain ⟨w, hw⟩ := exists_world hS (fun a ha => by rw [show a = p from ha]; exact hp) h
  exact ⟨w, (Canonical.holdsSentence_iff w p).2 (hw _ ⟨p, rfl, rfl⟩)⟩

end Family

/-! ### The maximalist root -/

section Maximalist

open Completeness

variable (Sig) [Countable Sig.Const]

/-- Appendix E's product root individuals are nonempty. -/
theorem maximalist_nonempty : Nonempty (productAtom (canonicalFamily Sig) .e).D :=
  ⟨fun k => Classical.choice ((canonicalFamily Sig k).nonempty_e _)⟩

/-- **The maximalist root** (Theorem 3.26, Appendix E): the coalesced sum of the complete
family over the distinguished arrows, with the fullest root domains, the product of the
components' individuals as root individuals, and the unions of the components' intensions as
the root values of the constants. -/
noncomputable abbrev maximalist : Premodel Sig (CoalescedSum (baseArrows (canonicalFamily Sig))) :=
  (appendixE (canonicalFamily Sig)).coalescedSum (fullRootIncl _ _) (maximalist_nonempty Sig)
    (appendixEConst (canonicalFamily Sig))

variable {Sig}

/-- The maximalist root is a model (`isModel_distinguished`). -/
theorem maximalist_isModel : (maximalist Sig).IsModel :=
  isModel_distinguished _ _ _ _ _ (transportsConstants_appendixE _) canonicalFamily_isModel

/-- Its components are complete for `C(Σ)`. -/
theorem maximalist_completeSig (hS : Sig.Closed) :
    (appendixE (canonicalFamily Sig)).CompleteComponentsSig (appendixEConst (canonicalFamily Sig)) :=
  completeComponentsSig_distinguished _ _ _ (transportsConstants_appendixE _)
    (canonicalFamily_complete hS)

/-- And complete for `C`. -/
theorem maximalist_complete (hS : Sig.Closed) :
    (appendixE (canonicalFamily Sig)).CompleteComponents (appendixEConst (canonicalFamily Sig)) :=
  RootAction.CompleteComponentsSig.complete _ _ hS (maximalist_completeSig hS)

/-- **Maximalism (pure), possibility form, holds at the maximalist root**: every closed-type
pure sentence consistent with `C` is possible there. -/
theorem maximalist_possibility (hS : Sig.Closed) :
    (maximalist Sig).HoldsAx (AxiomSet.pureVersion AxiomSet.possibilityC) :=
  RootAction.holdsAx_possibility_of_complete _ _ _ _ maximalist_isModel (maximalist_complete hS)

/-- **Maximalism (pure), distinctness form**, at the maximalist root. -/
theorem maximalist_distinctness (hS : Sig.Closed) :
    (maximalist Sig).HoldsAx (AxiomSet.pureVersion AxiomSet.distinctnessC) :=
  RootAction.holdsAx_distinctness_of_complete _ _ _ _ maximalist_isModel (maximalist_complete hS)

/-- **Maximalism for the signature**, possibility form, at the maximalist root. -/
theorem maximalist_possibilityC (hS : Sig.Closed) :
    (maximalist Sig).HoldsAx (AxiomSet.possibilityC Sig) :=
  RootAction.holdsAx_possibilityC_of_complete _ _ _ _ maximalist_isModel (maximalist_completeSig hS)

/-- **Maximalism for the signature**, distinctness form, at the maximalist root. -/
theorem maximalist_distinctnessC (hS : Sig.Closed) :
    (maximalist Sig).HoldsAx (AxiomSet.distinctnessC Sig) :=
  RootAction.holdsAx_distinctnessC_of_complete _ _ _ _ maximalist_isModel (maximalist_completeSig hS)

end Maximalist

instance : Countable Signature.pure.Const := inferInstanceAs (Countable Empty)

/-- **Maximalism is consistent with `C`**, in its possibility form: it holds in the
maximalist root over the pure signature. -/
theorem maximalism_consistent :
    AxiomSet.Consistent (AxiomSet.possibility (AxiomSet.empty : AxiomSet Signature.pure)) := by
  have hS : Signature.pure.Closed := fun c => c.elim
  have := maximalist_possibility (Sig := Signature.pure) hS
  rw [Premodel.holdsAx_schemaIn_iff] at this
  exact AxiomSet.Consistent.of_model _ maximalist_isModel this

/-- **Maximalism is consistent with `C`**, in its distinctness form. -/
theorem maximalism_distinctness_consistent :
    AxiomSet.Consistent (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Signature.pure)) := by
  have hS : Signature.pure.Closed := fun c => c.elim
  have := maximalist_distinctness (Sig := Signature.pure) hS
  rw [Premodel.holdsAx_schemaIn_iff] at this
  exact AxiomSet.Consistent.of_model _ maximalist_isModel this

end Classicism.Meta.Coalesced
