import Classicism.Tools.Schema
import Classicism.Certified.Quoted
import Classicism.Syntax.ClosedTypes

/-!
# The principles quoted, and their schemas

Every principle of the shallow layer (from its strict twin where it has one), quoted into
the object language: `P.quoted`, its instance at given object types, a sentence;
`P.reflect`, that reading it back gives the strict twin, by `rfl`; and `P.schema`, its
schema, the axiom set of its instances at closed types. For a principle with a
Ty-parameter, also its list form: `P.listQuoted`, the instance at a list of types, and
`P.listSchema`. This is the one home of those declarations.
-/

#classicism_schema
  Classicism.P.ModalK Classicism.P.ModalT Classicism.P.ModalFour Classicism.P.ModalFive
  Classicism.P.ModalB Classicism.P.ModalizedFregean Classicism.P.FregeanAxiom
  Classicism.P.Intensionality Classicism.P.Extensionality Classicism.P.Functionality
  Classicism.P.ModalizedFunctionality Classicism.P.NecessityOfIdentity
  Classicism.P.NecessityOfDistinctness Classicism.P.NecessityOfDistinctnessT
  Classicism.P.NecNecessityOfDistinctnessT Classicism.P.NecNecessityOfDistinctness
  Classicism.P.Barcan Classicism.P.BarcanT Classicism.P.NecBarcan
  Classicism.P.NecBarcanT Classicism.P.ConverseBarcan Classicism.P.Tractarianism
  Classicism.P.RigidComprehension Classicism.P.WeakRigidComprehension
  Classicism.P.WeakRigidComprehensionPersistent Classicism.P.PersistentComprehension
  Classicism.P.InextensibleComprehension Classicism.P.GallinExtensionalComprehension
  Classicism.P.FunctionalChoice Classicism.P.RelationalChoice Classicism.P.Existence
  Classicism.P.Atomicity Classicism.P.AtomicityT Classicism.P.NecAtomicity
  Classicism.P.Atomlessness Classicism.P.NecAtomlessness Classicism.P.BooleanCompleteness Classicism.P.BooleanCompletenessLUB
  Classicism.P.BooleanCompletenessT
  Classicism.P.NecBooleanCompleteness Classicism.P.Actuality Classicism.P.NecActuality
  Classicism.P.ActualProfile Classicism.P.NecRigidComprehension Classicism.P.Plenitude
  Classicism.P.NecGallinExtensionalComprehension Classicism.P.NecPlenitude
  Classicism.P.NecModalB Classicism.P.NecModalFive Classicism.P.NecFregeanAxiom
  Classicism.P.NecExtensionality Classicism.P.NecFunctionality Classicism.P.NecTractarianism
  Classicism.P.NecFunctionalChoice Classicism.P.NecRelationalChoice
  Classicism.P.StrongAtomicity Classicism.P.StrongAtomicityT Classicism.P.NecStrongAtomicity
  Classicism.P.SelfAtomicity Classicism.P.NecSelfAtomicity Classicism.P.SelfAtomicityT Classicism.P.NecSelfAtomicityT
  Classicism.P.AtomsAreSelfAtoms Classicism.P.NecAtomsAreSelfAtoms Classicism.P.AtomsAreSelfAtomsT Classicism.P.NecAtomsAreSelfAtomsT
  Classicism.P.SelfAtomsAreAtoms Classicism.P.NecSelfAtomsAreAtoms Classicism.P.SelfAtomsAreAtomsT Classicism.P.NecSelfAtomsAreAtomsT
  Classicism.P.SelfAtomsAreStrongAtoms Classicism.P.NecSelfAtomsAreStrongAtoms Classicism.P.SelfAtomsAreStrongAtomsT Classicism.P.NecSelfAtomsAreStrongAtomsT
  Classicism.P.AtomsAreStrongAtoms Classicism.P.NecAtomsAreStrongAtoms Classicism.P.AtomsAreStrongAtomsT Classicism.P.NecAtomsAreStrongAtomsT
  Classicism.P.NecStrongAtomicityT Classicism.P.DistinctnessPreservingCollapse
  Classicism.P.NecDistinctnessPreservingCollapse Classicism.P.TruthImpliesFiveNecessity
  Classicism.P.TruthImpliesTwoHatNecessity Classicism.P.FiveImpliesTwoHatNecessity
  Classicism.P.FiveImpliesNdNecessity Classicism.P.TwoHatImpliesNdNecessity
  Classicism.P.NecTruthImpliesFiveNecessity Classicism.P.NecTruthImpliesTwoHatNecessity
  Classicism.P.NecFiveImpliesTwoHatNecessity Classicism.P.NecFiveImpliesNdNecessity
  Classicism.P.NecTwoHatImpliesNdNecessity
  Classicism.P.BroadNecessitism Classicism.P.Transversal Classicism.P.NecTransversal
  Classicism.P.TransversalChoice Classicism.P.NecTransversalChoice
  Classicism.P.WeaklyInextensibleComprehension Classicism.P.NecWeaklyInextensibleComprehension
  Classicism.P.Vicinity Classicism.P.NecVicinity Classicism.P.ModalizedPlenitude
  Classicism.P.StrongActuality Classicism.P.NecStrongActuality
  Classicism.P.AxiomOfInfinityE Classicism.P.AxiomOfInfinityT Classicism.P.PossibleInfinityE
  Classicism.P.PossibleInfinityT Classicism.P.CountableBooleanCompleteness
  Classicism.P.NecCountableBooleanCompleteness Classicism.P.NecAtomicityT
  Classicism.P.NecBooleanCompletenessT Classicism.P.NecWeakRigidComprehension
  Classicism.P.NecWeakRigidComprehensionPersistent
  Classicism.P.NecPersistentComprehension Classicism.P.NecInextensibleComprehension
  Classicism.P.TameRigidity Classicism.P.NecTameRigidity Classicism.P.RigidPower
  Classicism.P.NecRigidPower Classicism.P.IntensionalChoice Classicism.P.NecIntensionalChoice
  Classicism.P.WeaklyRigidPower Classicism.P.NecWeaklyRigidPower Classicism.P.RigidRigidity
  Classicism.P.NecRigidRigidity Classicism.P.WeaklyRigidWeakRigidity
  Classicism.P.NecWeaklyRigidWeakRigidity Classicism.P.BarcanRelational
  Classicism.P.NecBarcanRelational Classicism.P.WellOrdering Classicism.P.NecWellOrdering
  Classicism.P.ModalWellOrdering Classicism.P.Zorn Classicism.P.ModalizedRelationalChoice
  Classicism.P.NecModalizedRelationalChoice
  -- the equivalent forms (`Principles/`)
  Classicism.P.ModalKDual Classicism.P.ModalTDual Classicism.P.ModalFourDual
  Classicism.P.ConverseBarcanDual Classicism.P.ModalBDual Classicism.P.NecModalBDual
  Classicism.P.ModalFiveDual Classicism.P.NecModalFiveDual
  Classicism.P.NecessityOfDistinctnessDual Classicism.P.NecNecessityOfDistinctnessDual
  Classicism.P.BarcanDual Classicism.P.NecBarcanDual Classicism.P.BarcanUniversalWeaklyRigid
  Classicism.P.NecBarcanUniversalRigid Classicism.P.TractarianismDual
  Classicism.P.NecTractarianismDual Classicism.P.AtomicityDual Classicism.P.NecAtomicityDual
  Classicism.P.NecBooleanCompletenessLUB Classicism.P.StrongAtomicityDual
  Classicism.P.NecStrongAtomicityDual Classicism.P.NecessityOfDistinctnessTDual
  Classicism.P.NecNecessityOfDistinctnessTDual Classicism.P.BarcanTDual
  Classicism.P.NecBarcanTDual Classicism.P.AtomicityTDual
  Classicism.P.BooleanCompletenessTLUB Classicism.P.StrongAtomicityTDual
  Classicism.P.NecStrongAtomicityTDual Classicism.P.DistinctnessPreservingCollapseDual

/-! ### Every principle's schema is in the paper's language

`P.X.schema_closedTypes`: each instance of a principle, at closed types, has only closed
types in it — a sentence of the paper's language, so one the sentence schemas range over
(`Syntax/ClosedTypes.lean`). Proved for every principle by evaluating `Term.closedTypes` on
the quoted sentence, the type arguments being closed. -/

open Lean Elab Command in
/-- `#classicism_schema_closed`: declare `P.X.schema_closedTypes` for every principle `P.X`
with a schema. -/
elab "#classicism_schema_closed" : command => do
  let env ← getEnv
  let names := env.constants.fold (init := #[]) fun acc n _ =>
    match n with
    | .str p "schema" => if (`Classicism.P).isPrefixOf p then acc.push p else acc
    | _ => acc
  for p in names.qsort (·.toString < ·.toString) do
    -- one type argument of the quoted sentence per binder of the schema
    let some qi := env.find? (p ++ `quoted) | continue
    let n := qi.type.getForallBinderNames.length
    let vars := (List.range n).map (s!"σ{·}")
    let hyps := (List.range n).map (s!"h{·}")
    let pat := String.intercalate ", " (vars ++ hyps ++ ["rfl"])
    let pat := if n == 0 then "rfl" else s!"⟨{pat}⟩"
    let src := s!"set_option linter.unusedSimpArgs false in
/-- Every instance of the principle is a sentence of the paper's language. -/
theorem {p}.schema_closedTypes : Classicism.Meta.AxiomSet.ClosedTypes {p}.schema := by
  rintro a {pat}
  simp [{p}.quoted, Classicism.Meta.Term.closedTypes, *]"
    match Parser.runParserCategory env `command src with
    | .ok stx => elabCommand stx
    | .error e => logError m!"{p}: {e}"
  logInfo m!"{names.size} schemas in the paper's language"

#classicism_schema_closed

