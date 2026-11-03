import Classicism.Coalesced
import Classicism.Coalesced.PinnedBarcan
import Classicism.Completeness.Completeness
import Classicism.Results.SentenceSchemas.PossibilityDistinctness
import Classicism.Semantics.FullModels

/-!
# The interpretation-arrow members of `coalesced-sums`

The map's `coalesced-definable-root`, `coalesced-pinned-interpretations-root` and
`coalesced-pinned-substitutions-root`, over one complete family: the canonical model of a
countable closed signature with its base at each world (`canonicalFamily`, as in
`Completeness.exists_complete_family`). Each member is a model whose components are models
everywhere (`canonicalFamily_modelsEverywhere`, the canonical premodel at every world being a
model), by `isModel_definableSum` and `isModel_pinnedSum`.

* **Definable root** (`definableRoot`): the signature `Σ₀ = {d}`, one constant of type `e`
  (`Signature.oneIndividual`); the record's model is the sum's pure reduct.
* **Finitely pinned roots** (`pinnedInterpRoot`, `pinnedSubstRoot`): the signature `Σ⁺` with
  countably many constants of every closed type (`Signature.plus`), each denoting `ĉ`;
  the record's model is the sum itself, a model of `Σ⁺`, which is admitted. The record's `Σ`
  is here `Σ⁺` itself.

**Maximalism**: a sentence consistent with `C(Σ)` holds at the base of some component, under
the canonical interpretation there, so it is possible at the root (`holdsAx_possibility`), and
Possibility entails Distinctness (`possibility_entails_distinctness`).

The family is complete for `C(Σ⁺)`, so in particular for `C(Σ)` and for `C`; the records ask
only for a family complete for `C(Σ)` (or `C`), and the constructions use the components'
objects, arrows and domains, not their own interpretations of the signature.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory Classicism.Meta.Intensional Classicism.Meta.Completeness

/-! ### The canonical family -/

section Family

variable (Sig : Signature) [Countable Sig.Const]

/-- The canonical family's members are models everywhere: the reduct at a world `v` is the
reduct of the canonical premodel based at `v`. -/
theorem canonicalFamily_modelsEverywhere : ModelsEverywhere (canonicalFamily Sig) :=
  fun _ v => (Canonical.premodel v).reduct_isModel (Canonical.isModel v)

variable {Sig}

variable {M : ConstMaps Sig} {sel : Selector (interpArrows (canonicalFamily Sig) M) (canonicalFamily Sig)}

/-- **Possibility at the root**: over the canonical family, every sentence consistent with
`C(Sig)` is possible at the root of the sum over the interpretation arrows, whatever the root
domains, when the sum is a model. -/
theorem holdsAx_possibility (hS : Sig.Closed) (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})
    (hM : (interpSum sel hs ne).IsModel) :
    (interpSum sel hs ne).HoldsAx (AxiomSet.possibility (AxiomSet.empty : AxiomSet Sig)) := by
  rintro _ ⟨hc, p, hcons, rfl⟩
  have hpc : p.closedTypes = true := by simpa using hc
  obtain ⟨w, hw⟩ := canonicalFamily_complete hS _ hpc
    (AxiomSet.Consistent.mono (AxiomSet.subset_union_right _ _) hcons)
  refine (interpAction sel).holds_dia_of_component (interpIncl sel) ne (hatI hs) hM
    (k := w) (V := w) (iarr M (canonicalFamily Sig w).I) ?_
  rw [component_hat]
  exact hw

/-- **Maximalism at the root**: Distinctness relative to `C(Sig)`, from Possibility. -/
theorem holdsAx_distinctness (hS : Sig.Closed) (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})
    (hM : (interpSum sel hs ne).IsModel) :
    (interpSum sel hs ne).HoldsAx (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Sig)) :=
  (interpSum sel hs ne).entails_holds hM (possibility_entails_distinctness _) (holdsAx_possibility hS hs ne hM)

/-- The pure version: Distinctness relative to `C`, read in `Sig`, from Possibility for
`C(Sig)` (a pure sentence consistent with `C` is consistent with `C(Sig)`). -/
theorem holdsAx_distinctness_pure (hS : Sig.Closed) (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})
    (hM : (interpSum sel hs ne).IsModel) :
    (interpSum sel hs ne).reduct.HoldsAx (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Signature.pure)) := by
  have hP : (interpSum sel hs ne).HoldsAx (AxiomSet.ofPure (AxiomSet.possibility AxiomSet.empty)) :=
    fun a ha => holdsAx_possibility hS hs ne hM a (AxiomSet.ofPure_possibility_subset hS a ha)
  rw [Premodel.holdsAx_ofPure] at hP
  exact (interpSum sel hs ne).reduct.entails_holds ((interpSum sel hs ne).reduct_isModel hM)
    (possibility_entails_distinctness _) hP

end Family

/-! ### The actual world, with only the identity at the root -/

section ActualWorld

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)] {A : ∀ k, Premodel Sig (C k)}

/-- The actual-world proposition at a root with only the identity: true at the root's identity
arrow and at no arrow into a component, as a set of root tuples. -/
def actualTuples {RA : Type} : Set (RootTuple (interpArrows A (ConstMaps.trivial Sig)) A .t RA)
  | .inl _ => True
  | .inr _ => False

theorem rootTransport_actualTuples {RA : Type} {k : ι} {V : C k} (J : Interp A k V) :
    rootTransport (actualTuples (A := A) (RA := RA)) J = ∅ := rfl

/-- In a component that is a model everywhere, `⊥` is in the domain at every object. -/
theorem exists_incl_empty (hA : ModelsEverywhere A) (k : ι) (V : C k) : ∃ y, (A k).incl .t V y = ∅ := by
  obtain ⟨y, hy⟩ := hA k V (𝟙 V) (Term.bot : Sentence Signature.pure) .nil
  exact ⟨y, hy.trans (((A k).reductAt V).sem_bot (hA k V) (𝟙 V) .nil)⟩

theorem landsT_actualTuples {RA : Type} (hA : ModelsEverywhere A) : LandsT (actualTuples (A := A) (RA := RA)) :=
  fun {k V} J => (exists_incl_empty hA k V).imp fun _ h => h.trans (rootTransport_actualTuples (A := A) (RA := RA) J).symm

variable {sel : Selector (interpArrows A (ConstMaps.trivial Sig)) A} (hs : sel.AdmitsConsts)
  (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

/-- **The actual world is isolated** at a root with only the identity, when the selector admits
the actual-world proposition: it is true, it is the root's identity alone, and nothing in a
component sees the root. -/
theorem actualWorldIsolated_interpSum (hA : ModelsEverywhere A) (hX : actualTuples ∈ sel.sel .t PUnit) :
    (interpSum sel hs ne).ActualWorldIsolated := by
  refine ⟨⟨actualTuples, landsT_actualTuples hA, hX⟩, trivial, fun p hp => ?_, fun {V U} i j hi => ?_⟩
  · rintro ⟨_ | _, ⟨⟩, i⟩ h
    · cases i
      exact hp
    · exact h.elim
  · match V, U, i, j with
    | .root, .root, _, _ => exact (hi trivial).elim
    | _, .of _, _, _ => exact fun h => h
    | .of _, .root, _, e => exact nomatch e

theorem definableSel_actualTuples (hA : ModelsEverywhere A) : actualTuples ∈ (definableSel A).sel .t PUnit :=
  ⟨Term.bot, fun k V J => (rootTransport_actualTuples J).trans
    ((((A k).rebase V J).sem_bot ((A k).isModel_rebase V J (hA k V)) (𝟙 V) .nil).symm)⟩

theorem pinnedSel_actualTuples : actualTuples ∈ (pinnedSel A (ConstMaps.trivial Sig)).sel .t PUnit :=
  ⟨∅, Set.finite_empty, fun _ _ _ _ _ => rfl, fun _ _ _ => rfl⟩

end ActualWorld

/-! ### The signatures -/

/-- `Σ₀ = {d}`: one constant, of type `e`. -/
abbrev _root_.Classicism.Meta.Signature.oneIndividual : Signature := ⟨Unit, fun _ => .e⟩

theorem _root_.Classicism.Meta.Signature.oneIndividual_closed : Signature.oneIndividual.Closed :=
  fun _ => trivial

instance : Countable Signature.oneIndividual.Const := inferInstanceAs (Countable Unit)

/-- `Σ⁺`: countably many constants of every closed type. -/
abbrev _root_.Classicism.Meta.Signature.plus : Signature := ⟨{σ : Ty // σ.Closed} × ℕ, fun c => c.1.1⟩

theorem _root_.Classicism.Meta.Signature.plus_closed : Signature.plus.Closed := fun c => c.1.2

instance : Countable Signature.plus.Const := inferInstanceAs (Countable ({σ : Ty // σ.Closed} × ℕ))

theorem _root_.Classicism.Meta.Signature.plus_admitted : Signature.plus.Admitted :=
  ⟨Signature.plus_closed, ⟨⟨.rel .t, trivial⟩, 0⟩, fun h => nomatch h⟩

/-- The constant `d` of `Σ₀`. -/
theorem oneIndividual_ne : Nonempty {c : Signature.oneIndividual.Const // Signature.oneIndividual.typeOf c = .e} :=
  ⟨⟨(), rfl⟩⟩

theorem plus_ne : Nonempty {c : Signature.plus.Const // Signature.plus.typeOf c = .e} :=
  ⟨⟨(⟨.e, trivial⟩, 0), rfl⟩⟩

/-- `Σ⁺` has fresh constants of every closed type: one with an index past those of any finite set. -/
theorem plus_fresh : FreshConsts Signature.plus := by
  intro σ hσ N hN
  obtain ⟨n, hn⟩ := (hN.image Prod.snd).bddAbove
  refine ⟨(⟨σ, hσ⟩, n + 1), rfl, fun h => ?_⟩
  have := hn ⟨_, h, rfl⟩
  simp at this

/-- The maps of the constants of `Σ⁺` can be undone off any finite set: shift every index past
the set's, and back, agreeing below with the given map. -/
theorem plus_undoable : Undoable (ConstMaps.all Signature.plus) := by
  classical
  intro m N hN
  obtain ⟨n, hn⟩ := (hN.image Prod.snd).bddAbove
  refine ⟨⟨fun c => (c.1, c.2 + (n + 1)), fun _ => rfl⟩,
    ⟨fun c => if n + 1 ≤ c.2 then (c.1, c.2 - (n + 1)) else m.1 c, fun c => ?_⟩, ?_, ?_⟩
  · show Signature.plus.typeOf (if n + 1 ≤ c.2 then (c.1, c.2 - (n + 1)) else m.1 c) = _
    split
    · rfl
    · exact m.2 c
  · apply Subtype.ext
    funext c
    simp only [ConstMaps.all]
    simp
    omega
  · intro c hc
    have : c.2 ≤ n := hn ⟨c, hc, rfl⟩
    show (if n + 1 ≤ c.2 then ((c.1, c.2 - (n + 1)) : Signature.plus.Const) else m.1 c) = m.1 c
    rw [if_neg (by omega)]

/-! ### The members -/

/-- `coalesced-definable-root`, as a model of `Σ₀`: interpretation arrows into every world of
the canonical model of `Σ₀`, the definable root domains, `d` denoting itself. -/
noncomputable abbrev definableSum : Premodel Signature.oneIndividual (CoalescedSum (interpArrows
    (canonicalFamily Signature.oneIndividual) (ConstMaps.trivial _))) :=
  interpSum (definableSel _) definableSel_admitsConsts oneIndividual_ne

/-- **`coalesced-definable-root`**: the pure reduct of `definableSum`. -/
noncomputable abbrev definableRoot := definableSum.reduct

theorem definableSum_isModel : definableSum.IsModel :=
  isModel_definableSum _ (canonicalFamily_modelsEverywhere _)

theorem definableRoot_isModel : definableRoot.IsModel :=
  definableSum.reduct_isModel definableSum_isModel

/-- **`coalesced-pinned-interpretations-root`**: interpretation arrows of `Σ⁺` into every
world of its canonical model, finitely pinned root domains, each constant denoting `ĉ`. -/
noncomputable abbrev pinnedInterpRoot : Premodel Signature.plus (CoalescedSum (interpArrows
    (canonicalFamily Signature.plus) (ConstMaps.trivial _))) :=
  interpSum (pinnedSel _ _) pinnedSel_admitsConsts plus_ne

theorem pinnedInterpRoot_isModel : pinnedInterpRoot.IsModel :=
  isModel_pinnedSum _ (canonicalFamily_modelsEverywhere _)

/-- **`coalesced-pinned-substitutions-root`**: as `pinnedInterpRoot`, with every
type-preserving map of the constants of `Σ⁺` as a root endo-arrow. -/
noncomputable abbrev pinnedSubstRoot : Premodel Signature.plus (CoalescedSum (interpArrows
    (canonicalFamily Signature.plus) (ConstMaps.all _))) :=
  interpSum (pinnedSel _ _) pinnedSel_admitsConsts plus_ne

theorem pinnedSubstRoot_isModel : pinnedSubstRoot.IsModel :=
  isModel_pinnedSum _ (canonicalFamily_modelsEverywhere _)

/-! ### Maximalism -/

/-- `coalesced-definable-root`: Maximalism (pure) holds. -/
theorem definableRoot_distinctness :
    definableRoot.HoldsAx (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Signature.pure)) :=
  holdsAx_distinctness_pure Signature.oneIndividual_closed _ _ definableSum_isModel

/-- `coalesced-pinned-interpretations-root`: Maximalism (for `Σ⁺`) holds. -/
theorem pinnedInterpRoot_distinctness :
    pinnedInterpRoot.HoldsAx (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Signature.plus)) :=
  holdsAx_distinctness Signature.plus_closed _ _ pinnedInterpRoot_isModel

/-- `coalesced-pinned-substitutions-root`: Maximalism (for `Σ⁺`) holds. -/
theorem pinnedSubstRoot_distinctness :
    pinnedSubstRoot.HoldsAx (AxiomSet.distinctness (AxiomSet.empty : AxiomSet Signature.plus)) :=
  holdsAx_distinctness Signature.plus_closed _ _ pinnedSubstRoot_isModel

/-! ### The actual world at the interpretation-only roots -/

/-- `coalesced-definable-root`: the actual world is isolated. -/
theorem definableRoot_actualWorldIsolated : definableRoot.ActualWorldIsolated :=
  actualWorldIsolated_interpSum definableSel_admitsConsts oneIndividual_ne (canonicalFamily_modelsEverywhere _)
    (definableSel_actualTuples (canonicalFamily_modelsEverywhere _))

/-- `coalesced-pinned-interpretations-root`: the actual world is isolated. -/
theorem pinnedInterpRoot_actualWorldIsolated : pinnedInterpRoot.ActualWorldIsolated :=
  actualWorldIsolated_interpSum pinnedSel_admitsConsts plus_ne (canonicalFamily_modelsEverywhere _)
    pinnedSel_actualTuples

/-! ### BF at the finitely pinned roots -/

/-- `coalesced-pinned-interpretations-root`: BF at every closed type. -/
theorem pinnedInterpRoot_bf (σ : Ty) (hσ : σ.Closed) : pinnedInterpRoot.reduct.HoldsSentence (Sentence.bf σ) :=
  pinned_bf plus_ne plus_fresh undoable_trivial (canonicalFamily_modelsEverywhere _) σ hσ

/-- `coalesced-pinned-substitutions-root`: BF at every closed type. -/
theorem pinnedSubstRoot_bf (σ : Ty) (hσ : σ.Closed) : pinnedSubstRoot.reduct.HoldsSentence (Sentence.bf σ) :=
  pinned_bf plus_ne plus_fresh plus_undoable (canonicalFamily_modelsEverywhere _) σ hσ

/-! ### One individual at the definable root -/

/-- The only individual at the definable root is `d`. -/
theorem definableRoot_subsingleton : Subsingleton (definableRoot.Dom definableRoot.W₀ .e) :=
  ⟨fun _ _ => Subtype.ext rfl⟩

end Classicism.Meta.Coalesced
