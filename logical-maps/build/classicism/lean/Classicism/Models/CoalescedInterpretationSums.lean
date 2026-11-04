import Classicism.Models.CoalescedInterpretations
import Classicism.Coalesced.SumData
import Classicism.Models.SymBase

/-!
# The interpretation-arrow members of `coalesced-sums` as group data

A coalesced sum over the **interpretation arrows** into every world of the canonical model of a
countable closed signature (`Models/CoalescedInterpretations.lean`), with any root endo-arrows
(`ConstMaps`: only the identity, or every map of the constants) and any root domains (a
`Selector`), is the group's parameter `SumData` (`SumData.ofInterp`); its model is `interpSum`.
So the group's arguments whose conditions it meets apply to it.

* `complete-components` (`SumData.completeComponents_ofInterp`): a sentence consistent with `C`
  holds at the base of some world of the canonical model, and so in the component seen from the
  arrow into that world interpreting the signature as the canonical model does.
* With the fullest root domains (`Selector.all`): `fullest-domains` and `free-root-component`, as
  over the distinguished arrows.

The members: `pinnedInterpData` (`coalesced-pinned-interpretations-root`), `pinnedSubstData`
(`coalesced-pinned-substitutions-root`), whose models are `pinnedInterpRoot` and `pinnedSubstRoot`,
and `substitutionsFullestData` (`coalesced-substitutions-fullest-root`): the substitution arrows
of `Σ⁺` with the fullest root domains.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory Classicism.Meta.Intensional Classicism.Meta.Completeness

section Interp

variable {Sig : Signature} [Countable Sig.Const] {M : ConstMaps Sig}
  (sel : Selector (interpArrows (canonicalFamily Sig) M) (canonicalFamily Sig))
  (hs : sel.AdmitsConsts) (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

/-- **The coalesced sum over the interpretation arrows into the canonical family, as group
data**: the selected root domains, each constant denoting `ĉ`. -/
noncomputable abbrev SumData.ofInterp (hM : (interpSum sel hs ne).IsModel) : SumData where
  Sig := Sig
  ι := World Sig
  C := fun _ => World Sig
  S := interpArrows (canonicalFamily Sig) M
  A := canonicalFamily Sig
  RA := interpAction sel
  RI := interpIncl sel
  ne := ne
  I := hatI hs
  isModel' := hM

variable {sel hs ne}

/-- A pure sentence consistent with `C` holds at the base of some world of the canonical model. -/
theorem exists_world_ofPure (hS : Sig.Closed) {p : Sentence Signature.pure} (hp : p.closedTypes = true)
    (hc : AxiomSet.Consistent (AxiomSet.single p)) :
    ∃ w, (canonicalFamily Sig w).HoldsSentence (Term.ofPure p) :=
  canonicalFamily_complete hS (Term.ofPure p) (by rw [Term.closedTypes_ofPure]; exact hp)
    (by
      have := (AxiomSet.consistent_ofPure_iff (Sig := Sig) hS (A := AxiomSet.single p)).2 hc
      refine AxiomSet.Consistent.mono ?_ this
      rintro _ rfl
      exact ⟨p, rfl, rfl⟩)

/-- **They meet `complete-components`**: the components are the canonical model at each of its
worlds, and the arrow into a world interpreting the signature as the canonical model does sees
that world's model. -/
theorem SumData.completeComponents_ofInterp (hS : Sig.Closed) (hM : (interpSum sel hs ne).IsModel) :
    (SumData.ofInterp sel hs ne hM).CompleteComponents := by
  refine ⟨fun p hp hc => exists_world_ofPure hS hp hc, fun p hp hc => ?_⟩
  obtain ⟨w, hw⟩ := exists_world_ofPure hS hp hc
  refine ⟨w, w, iarr M (canonicalFamily Sig w).I, ?_⟩
  show ((interpAction sel).component (hatI hs) (iarr M (canonicalFamily Sig w).I)).HoldsSentence _
  rw [component_hat]
  exact hw

end Interp

section Fullest

variable {Sig : Signature} [Countable Sig.Const] {M : ConstMaps Sig}
  (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

/-- The fullest root domains over the interpretation arrows admit the constants. -/
theorem selectorAll_admitsConsts :
    (Selector.all (S := interpArrows (canonicalFamily Sig) M) (A := canonicalFamily Sig)).AdmitsConsts :=
  fun _ _ _ _ => trivial

variable {ne}

/-- With the fullest root domains they meet `fullest-domains` (`fullest_full`). -/
theorem SumData.fullestDomains_ofInterp_all (hM : (interpSum (M := M) Selector.all selectorAll_admitsConsts ne).IsModel) :
    (SumData.ofInterp Selector.all selectorAll_admitsConsts ne hM).FullestDomains :=
  fullest_full (constAtom (canonicalFamily Sig) M .e) (fun i => constAtom (canonicalFamily Sig) M (.var i))

/-- With the fullest root domains they meet `free-root-component`: an intension agreeing with a
root entity off the root has its transports along the arrows into the components, so lands. -/
theorem SumData.freeRootComponent_ofInterp_all
    (hM : (interpSum (M := M) Selector.all selectorAll_admitsConsts ne).IsModel) :
    (SumData.ofInterp Selector.all selectorAll_admitsConsts ne hM).FreeRootComponent := by
  intro ρ x Y hY
  refine fullest_full (constAtom (canonicalFamily Sig) M .e) (fun i => constAtom (canonicalFamily Sig) M (.var i))
    ρ Y fun {k V} r => ?_
  have e : (interpAction (M := M) Selector.all).transport r Y =
      (interpAction (M := M) Selector.all).transport r ((interpIncl (M := M) Selector.all).incl ρ x) := by
    ext p
    exact hY _ (fun h => by cases h)
  rw [e]
  exact (interpAction (M := M) Selector.all).lands_incl (interpIncl (M := M) Selector.all) x r

end Fullest

/-! ### The members -/

/-- `coalesced-pinned-interpretations-root` as group data. -/
noncomputable abbrev pinnedInterpData : SumData :=
  SumData.ofInterp (pinnedSel _ _) pinnedSel_admitsConsts plus_ne pinnedInterpRoot_isModel

theorem pinnedInterpData_complete : pinnedInterpData.CompleteComponents :=
  SumData.completeComponents_ofInterp Signature.plus_closed _

section Free

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {A : ∀ k, Premodel Sig (C k)} {M : ConstMaps Sig} {sel : Selector (interpArrows A M) A}

/-- An intension at the root agreeing with a root entity off the root, read as root tuples, has
that entity's transports along every arrow into a component. -/
theorem rootTransport_agree {ρ : RTy} (x : (interpAction sel).D (.rel ρ))
    (Y : Intension (interpAction sel).inner ρ (CoalescedSum.base (interpArrows A M)))
    (hY : ∀ p : Tuple (interpAction sel).inner ρ (CoalescedSum.base (interpArrows A M)),
      p.1 ≠ CoalescedSum.root → (p ∈ Y ↔ p ∈ (interpIncl sel).incl ρ x))
    {k : ι} {V : C k} (r : (interpArrows A M).R.obj ⟨k, V⟩) :
    rootTransport {q | ofRT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel q ∈ Y} r =
      rootTransport (x : {X : Set (RootTuple (interpArrows A M) A ρ
        (selArgsT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel ρ)) //
        LandsT X ∧ X ∈ sel.sel ρ _}).1 r := by
  ext p
  refine (hY _ fun h => by cases h).trans ?_
  exact Iff.of_eq (congrArg (fun q => q ∈ (x : {X : Set (RootTuple (interpArrows A M) A ρ
        (selArgsT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel ρ)) //
        LandsT X ∧ X ∈ sel.sel ρ _}).1)
    (toRT_ofRT (constAtom A M .e) (fun i => constAtom A M (.var i)) sel _))

end Free

/-- `coalesced-pinned-interpretations-root` meets `free-root-component`: an intension agreeing off
the root with a root entity pinned down by `N` has its transports, so lands and is pinned down by
`N`, the root having no endo-arrow but the identity. -/
theorem pinnedInterpData_free : pinnedInterpData.FreeRootComponent := by
  intro ρ x Y hY
  obtain ⟨hL, N, hN, h1, -⟩ := x.2
  refine ⟨⟨{q | ofRT _ _ _ q ∈ Y}, fun r => ?_, N, hN, fun k V J J' hJ => ?_, fun m m' _ => ?_⟩, ?_⟩
  · rw [rootTransport_agree x Y hY r]
    exact hL r
  · rw [rootTransport_agree x Y hY, rootTransport_agree x Y hY]
    exact h1 k V J J' hJ
  · cases m; cases m'; rfl
  · ext p
    change ofRT _ _ _ (toRT _ _ _ p) ∈ Y ↔ p ∈ Y
    rw [ofRT_toRT]

/-- `coalesced-pinned-substitutions-root` as group data. -/
noncomputable abbrev pinnedSubstData : SumData :=
  SumData.ofInterp (pinnedSel _ _) pinnedSel_admitsConsts plus_ne pinnedSubstRoot_isModel

theorem pinnedSubstData_complete : pinnedSubstData.CompleteComponents :=
  SumData.completeComponents_ofInterp Signature.plus_closed _

/-- **`coalesced-substitutions-fullest-root`**: the interpretation arrows of `Σ⁺` into every world
of its canonical model, every type-preserving map of its constants as a root endo-arrow, and the
fullest root domains. -/
noncomputable abbrev substitutionsFullestRoot : Premodel Signature.plus (CoalescedSum (interpArrows
    (canonicalFamily Signature.plus) (ConstMaps.all _))) :=
  interpSum Selector.all selectorAll_admitsConsts plus_ne

theorem substitutionsFullestRoot_isModel : substitutionsFullestRoot.IsModel :=
  isModel_interpSum_all _ (canonicalFamily_modelsEverywhere _)

/-- `coalesced-substitutions-fullest-root` as group data. -/
noncomputable abbrev substitutionsFullestData : SumData :=
  SumData.ofInterp Selector.all selectorAll_admitsConsts plus_ne substitutionsFullestRoot_isModel

theorem substitutionsFullestData_complete : substitutionsFullestData.CompleteComponents :=
  SumData.completeComponents_ofInterp Signature.plus_closed _

theorem substitutionsFullestData_fullest : substitutionsFullestData.FullestDomains :=
  SumData.fullestDomains_ofInterp_all _

theorem substitutionsFullestData_free : substitutionsFullestData.FreeRootComponent :=
  SumData.freeRootComponent_ofInterp_all _

/-! ### The definable root -/

/-- `coalesced-definable-root`'s sum over `Σ₀ = {d}` as group data: its model is `definableSum`,
whose pure reduct is the record's model `definableRoot`. -/
noncomputable abbrev definableData : SumData :=
  SumData.ofInterp (definableSel _) definableSel_admitsConsts oneIndividual_ne definableSum_isModel

theorem definableData_complete : definableData.CompleteComponents :=
  SumData.completeComponents_ofInterp Signature.oneIndividual_closed _

/-- A pure schema holding in a model of a signature holds in its pure reduct. -/
theorem holdsAx_reduct_of {Sig : Signature} {C : Type} [SmallCategory C] {B : Premodel Sig C}
    {X : AxiomSet Signature.pure} (h : B.HoldsAx (AxiomSet.ofPure X)) :
    B.reduct.HoldsAx (AxiomSet.ofPure X) :=
  (Premodel.holdsAx_schemaIn_iff _ X).2 ((Premodel.holdsAx_ofPure B X).1 h)

/-- A pure schema failing in a model of a signature fails in its pure reduct. -/
theorem not_holdsAx_reduct_of {Sig : Signature} {C : Type} [SmallCategory C] {B : Premodel Sig C}
    {X : AxiomSet Signature.pure} (h : ¬ B.HoldsAx (AxiomSet.ofPure X)) :
    ¬ B.reduct.HoldsAx (AxiomSet.ofPure X) := fun H =>
  h ((Premodel.holdsAx_ofPure B X).2 ((Premodel.holdsAx_schemaIn_iff _ X).1 H))

/-! ### Actuality with a free root component -/

/-- **With a free root component, Actuality holds at the root**: the proposition true at the root's
identity arrow alone is a root entity, true and below every truth (the first half of
`SumData.actualWorldIsolated_of`, which needs no condition on the root endo-arrows). -/
theorem SumData.holds_actuality_of_free {D : SumData} (hF : D.FreeRootComponent) :
    D.model.HoldsAx P.Actuality.schemaIn := by
  obtain ⟨b, hb⟩ := D.isModel (𝟙 _) (Term.bot (Sig := D.Sig) (Γ := [])) .nil
  have hb' : D.RI.incl .t b = ∅ := hb.trans (D.model.sem_bot D.isModel _ _)
  let a0 : Tuple D.RA.inner .t (CoalescedSum.base D.S) := ⟨CoalescedSum.root, PUnit.unit, D.S.one⟩
  obtain ⟨a, ha⟩ := hF .t b {a0} fun p hp => by
    rw [hb']
    exact ⟨fun h => hp (by rw [show p = a0 from h]), fun h => h.elim⟩
  rw [Premodel.holdsAx_ofPure]
  rintro _ rfl
  refine Premodel.holds_actuality_of (D.model.reduct_isModel D.isModel) a ?_ fun p hp => ?_
  · show a0 ∈ D.RI.incl .t a
    rw [ha]; rfl
  · show D.RI.incl .t a ⊆ D.RI.incl .t p
    rw [ha]
    rintro _ rfl
    exact hp

end Classicism.Meta.Coalesced
