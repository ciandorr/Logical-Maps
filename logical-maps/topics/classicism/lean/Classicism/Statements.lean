import Classicism.Certified.Signatures
import Classicism.Certified.Arithmetic

/-!
# Generated statements

Written by `pmap lean classicism` from the YAML records. **Do not edit.**

Each declaration below is the statement of one database record, assembled from its
premises and conclusion. A proof is supplied by inhabiting the corresponding `Prop`,
so a Lean proof cannot drift from the claim the map displays. Regenerate after any
change to a record or to a principle's `lean_def`.
-/

namespace Classicism.Statements
open Classicism

/-- Principle definition check: `actuality`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Actuality.schemaIn

/-- Principle definition check: `atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Atomicity.schemaIn

/-- Principle definition check: `atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AtomicityT.schemaIn

/-- Principle definition check: `atomlessness`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Atomlessness.schemaIn

/-- Principle definition check: `atoms-are-self-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AtomsAreSelfAtoms.schemaIn

/-- Principle definition check: `atoms-are-self-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- Principle definition check: `atoms-are-strong-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- Principle definition check: `atoms-are-strong-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- Principle definition check: `axiom-of-infinity-e`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AxiomOfInfinityE.schemaIn

/-- Principle definition check: `axiom-of-infinity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.AxiomOfInfinityT.schemaIn

/-- Principle definition check: `barcan-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Barcan.schemaIn

/-- Principle definition check: `barcan-relational`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.BarcanRelational.schemaIn

/-- Principle definition check: `barcan-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.BarcanT.schemaIn

/-- Principle definition check: `boolean-completeness-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.BooleanCompleteness.schemaIn

/-- Principle definition check: `boolean-completeness-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.BooleanCompletenessT.schemaIn

/-- Principle definition check: `converse-witnessed-possibility-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.converseWitnessedPossibility _)

/-- Principle definition check: `countable-boolean-completeness-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.CountableBooleanCompleteness.schemaIn

/-- Principle definition check: `distinctness-necessary-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecessityOfDistinctness.schemaIn

/-- Principle definition check: `distinctness-necessary-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- Principle definition check: `distinctness-preserving-collapse`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.DistinctnessPreservingCollapse.schemaIn

/-- Principle definition check: `distinctness-schema-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC)

/-- Principle definition check: `distinctness-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.distinctnessC _)

/-- Principle definition check: `extensionality-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Extensionality.schemaIn

/-- Principle definition check: `five-implies-nd-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.FiveImpliesNdNecessity.schemaIn

/-- Principle definition check: `five-implies-two-hat-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- Principle definition check: `fregean-axiom`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.FregeanAxiom.schemaIn

/-- Principle definition check: `functional-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.FunctionalChoice.schemaIn

/-- Principle definition check: `functionality-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Functionality.schemaIn

/-- Principle definition check: `gallin-extensional-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.GallinExtensionalComprehension.schemaIn

/-- Principle definition check: `independence-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.independence _)

/-- Principle definition check: `inextensible-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.InextensibleComprehension.schemaIn

/-- Principle definition check: `infinity-e`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- Principle definition check: `infinity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- Principle definition check: `intensional-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.IntensionalChoice.schemaIn

/-- Principle definition check: `logical-necessity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.logicalNecessity _)

/-- Principle definition check: `modal-b`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.ModalB.schemaIn

/-- Principle definition check: `modal-five`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.ModalFive.schemaIn

/-- Principle definition check: `modal-freedom-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.modalFreedom _)

/-- Principle definition check: `modal-well-ordering-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.ModalWellOrdering.schemaIn

/-- Principle definition check: `modalized-relational-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.ModalizedRelationalChoice.schemaIn

/-- Principle definition check: `necessary-actuality`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecActuality.schemaIn

/-- Principle definition check: `necessary-atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomicity.schemaIn

/-- Principle definition check: `necessary-atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomicityT.schemaIn

/-- Principle definition check: `necessary-atomlessness`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomlessness.schemaIn

/-- Principle definition check: `necessary-atoms-are-self-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomsAreSelfAtoms.schemaIn

/-- Principle definition check: `necessary-atoms-are-self-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomsAreSelfAtomsT.schemaIn

/-- Principle definition check: `necessary-atoms-are-strong-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- Principle definition check: `necessary-atoms-are-strong-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- Principle definition check: `necessary-barcan-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecBarcan.schemaIn

/-- Principle definition check: `necessary-barcan-relational`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecBarcanRelational.schemaIn

/-- Principle definition check: `necessary-barcan-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecBarcanT.schemaIn

/-- Principle definition check: `necessary-boolean-completeness-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecBooleanCompleteness.schemaIn

/-- Principle definition check: `necessary-boolean-completeness-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecBooleanCompletenessT.schemaIn

/-- Principle definition check: `necessary-countable-boolean-completeness-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecCountableBooleanCompleteness.schemaIn

/-- Principle definition check: `necessary-distinctness-necessary-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- Principle definition check: `necessary-distinctness-necessary-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecNecessityOfDistinctnessT.schemaIn

/-- Principle definition check: `necessary-distinctness-preserving-collapse`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecDistinctnessPreservingCollapse.schemaIn

/-- Principle definition check: `necessary-extensionality-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecExtensionality.schemaIn

/-- Principle definition check: `necessary-five-implies-nd-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecFiveImpliesNdNecessity.schemaIn

/-- Principle definition check: `necessary-five-implies-two-hat-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- Principle definition check: `necessary-fregean-axiom`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecFregeanAxiom.schemaIn

/-- Principle definition check: `necessary-functional-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecFunctionalChoice.schemaIn

/-- Principle definition check: `necessary-functionality-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecFunctionality.schemaIn

/-- Principle definition check: `necessary-gallin-extensional-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecGallinExtensionalComprehension.schemaIn

/-- Principle definition check: `necessary-inextensible-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecInextensibleComprehension.schemaIn

/-- Principle definition check: `necessary-intensional-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecIntensionalChoice.schemaIn

/-- Principle definition check: `necessary-modal-b`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecModalB.schemaIn

/-- Principle definition check: `necessary-modal-five`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecModalFive.schemaIn

/-- Principle definition check: `necessary-modalized-relational-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecModalizedRelationalChoice.schemaIn

/-- Principle definition check: `necessary-persistent-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecPersistentComprehension.schemaIn

/-- Principle definition check: `necessary-plenitude-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecPlenitude.schemaIn

/-- Principle definition check: `necessary-relational-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecRelationalChoice.schemaIn

/-- Principle definition check: `necessary-rigid-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecRigidComprehension.schemaIn

/-- Principle definition check: `necessary-rigid-power-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecRigidPower.schemaIn

/-- Principle definition check: `necessary-rigid-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecRigidRigidity.schemaIn

/-- Principle definition check: `necessary-self-atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomicity.schemaIn

/-- Principle definition check: `necessary-self-atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomicityT.schemaIn

/-- Principle definition check: `necessary-self-atoms-are-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomsAreAtoms.schemaIn

/-- Principle definition check: `necessary-self-atoms-are-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomsAreAtomsT.schemaIn

/-- Principle definition check: `necessary-self-atoms-are-strong-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- Principle definition check: `necessary-self-atoms-are-strong-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn

/-- Principle definition check: `necessary-strong-actuality`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecStrongActuality.schemaIn

/-- Principle definition check: `necessary-strong-atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecStrongAtomicity.schemaIn

/-- Principle definition check: `necessary-strong-atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecStrongAtomicityT.schemaIn

/-- Principle definition check: `necessary-tame-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTameRigidity.schemaIn

/-- Principle definition check: `necessary-tractarianism-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTractarianism.schemaIn

/-- Principle definition check: `necessary-transversal-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTransversalChoice.schemaIn

/-- Principle definition check: `necessary-transversal-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTransversal.schemaIn

/-- Principle definition check: `necessary-truth-implies-five-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- Principle definition check: `necessary-truth-implies-two-hat-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn

/-- Principle definition check: `necessary-two-hat-implies-nd-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- Principle definition check: `necessary-vicinity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecVicinity.schemaIn

/-- Principle definition check: `necessary-weak-rigid-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecWeakRigidComprehension.schemaIn

/-- Principle definition check: `necessary-weakly-inextensible-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- Principle definition check: `necessary-weakly-rigid-power-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecWeaklyRigidPower.schemaIn

/-- Principle definition check: `necessary-weakly-rigid-weak-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecWeaklyRigidWeakRigidity.schemaIn

/-- Principle definition check: `necessary-well-ordering-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.NecWellOrdering.schemaIn

/-- Principle definition check: `necessity-of-arithmetic`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.ofPure Classicism.Meta.AxiomSet.necessityOfArithmetic)

/-- Principle definition check: `no-contingency-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.noContingency _)

/-- Principle definition check: `no-pure-contingency-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- Principle definition check: `persistent-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.PersistentComprehension.schemaIn

/-- Principle definition check: `plenitude-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Plenitude.schemaIn

/-- Principle definition check: `possibility-plus-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.possibilityPlus)

/-- Principle definition check: `possibility-plus-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.possibilityPlusSig _)

/-- Principle definition check: `possible-infinity-e`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.PossibleInfinityE.schemaIn

/-- Principle definition check: `possible-infinity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.PossibleInfinityT.schemaIn

/-- Principle definition check: `possibly-witnessed-possibility-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _)

/-- Principle definition check: `pure-b-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- Principle definition check: `relational-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.RelationalChoice.schemaIn

/-- Principle definition check: `rigid-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.RigidComprehension.schemaIn

/-- Principle definition check: `rigid-power-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.RigidPower.schemaIn

/-- Principle definition check: `rigid-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.RigidRigidity.schemaIn

/-- Principle definition check: `self-atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomicity.schemaIn

/-- Principle definition check: `self-atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomicityT.schemaIn

/-- Principle definition check: `self-atoms-are-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomsAreAtoms.schemaIn

/-- Principle definition check: `self-atoms-are-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomsAreAtomsT.schemaIn

/-- Principle definition check: `self-atoms-are-strong-atoms-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomsAreStrongAtoms.schemaIn

/-- Principle definition check: `self-atoms-are-strong-atoms-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn

/-- Principle definition check: `separated-structure-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.separatedStructure _)

/-- Principle definition check: `signature-b-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.signatureB _)

/-- Principle definition check: `strong-actuality`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.StrongActuality.schemaIn

/-- Principle definition check: `strong-atomicity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.StrongAtomicity.schemaIn

/-- Principle definition check: `strong-atomicity-t`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.StrongAtomicityT.schemaIn

/-- Principle definition check: `strong-possibility-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility)

/-- Principle definition check: `strong-possibility-signature-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.strongPossibility _)

/-- Principle definition check: `tame-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.TameRigidity.schemaIn

/-- Principle definition check: `tractarianism-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Tractarianism.schemaIn

/-- Principle definition check: `transversal-choice-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.TransversalChoice.schemaIn

/-- Principle definition check: `transversal-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Transversal.schemaIn

/-- Principle definition check: `truth-implies-five-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.TruthImpliesFiveNecessity.schemaIn

/-- Principle definition check: `truth-implies-two-hat-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.TruthImpliesTwoHatNecessity.schemaIn

/-- Principle definition check: `two-hat-implies-nd-necessity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- Principle definition check: `vicinity`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Vicinity.schemaIn

/-- Principle definition check: `weak-rigid-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.WeakRigidComprehension.schemaIn

/-- Principle definition check: `weakly-inextensible-comprehension-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- Principle definition check: `weakly-rigid-power-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.WeaklyRigidPower.schemaIn

/-- Principle definition check: `weakly-rigid-weak-rigidity-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.WeaklyRigidWeakRigidity.schemaIn

/-- Principle definition check: `well-ordering-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.WellOrdering.schemaIn

/-- Principle definition check: `witnessed-possibility-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  (Classicism.Meta.AxiomSet.witnessedPossibility _)

/-- Principle definition check: `zorn-r`. -/
example {Sig : Classicism.Meta.Signature} : Classicism.Meta.AxiomSet Sig :=
  Classicism.P.Zorn.schemaIn

/-- `actuality-and-bf-imply-inextensible-comprehension`

Actuality ∧ BF ⇒ Inextensible Comprehension -/
def actuality_and_bf_imply_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `actuality-and-bf-t-imply-strong-actuality`

Actuality ∧ BF (type t) ⇒ Strong Actuality -/
def actuality_and_bf_t_imply_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `actuality-and-distinctness-preserving-collapse-imply-inextensible-comprehension`

Actuality ∧ Truths are ND-necessary ⇒ Inextensible Comprehension -/
def actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `actuality-and-distinctness-preserving-collapse-imply-strong-actuality`

Actuality ∧ Truths are ND-necessary ⇒ Strong Actuality -/
def actuality_and_distinctness_preserving_collapse_imply_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `actuality-and-five-implies-nd-necessity-imply-inextensible-comprehension`

Actuality ∧ 5-necessities are ND-necessary ⇒ Inextensible Comprehension -/
def actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `actuality-and-self-atoms-are-strong-atoms-t-imply-strong-actuality`

Actuality ∧ Self-atoms are strong atoms (type t) ⇒ Strong Actuality -/
def actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `actuality-and-two-hat-implies-nd-imply-strong-actuality`

Actuality ∧ Two-hat necessities are ND-necessary ⇒ Strong Actuality -/
def actuality_and_two_hat_implies_nd_imply_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `actuality-implies-five-implies-two-hat`

Actuality ⇒ 5-necessities are two-hat necessary -/
def actuality_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `actuality-implies-persistent-comprehension-r`

Actuality ⇒ Persistent Comprehension -/
def actuality_implies_persistent_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn

/-- `actuality-implies-transversal`

Actuality ⇒ Transversal -/
def actuality_implies_transversal : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn

/-- `actuality-implies-vicinity`

Actuality ⇒ Vicinity -/
def actuality_implies_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn

/-- `actuality-implies-weakly-inextensible-comprehension-r`

Actuality ⇒ Weakly Inextensible Comprehension -/
def actuality_implies_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- `actuality-incompatible-with-atomlessness`

Actuality ∧ Atomlessness ⇒ ⊥ -/
def actuality_incompatible_with_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `atomicity-and-bf-imply-necessary-actuality`

Atomicity ∧ BF ⇒ □Actuality -/
def atomicity_and_bf_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `atomicity-and-bf-imply-strong-atomicity`

Atomicity ∧ BF ⇒ Strong Atomicity -/
def atomicity_and_bf_imply_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn

/-- `atomicity-and-bf-relational-imply-strong-atomicity`

Atomicity ∧ BF (relational types) ⇒ Strong Atomicity -/
def atomicity_and_bf_relational_imply_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn

/-- `atomicity-and-rigid-comprehension-imply-rigid-power`

Atomicity ∧ Rigid Comprehension ⇒ Rigid Power -/
def atomicity_and_rigid_comprehension_imply_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn

/-- `atomicity-and-rigid-comprehension-imply-weakly-rigid-power`

Atomicity ∧ Rigid Comprehension ⇒ Weakly Rigid Power -/
def atomicity_and_rigid_comprehension_imply_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn

/-- `atomicity-r-and-atoms-are-self-atoms-r-imply-self-atomicity-r`

Atomicity ∧ Atoms are self-atoms ⇒ Self-Atomicity -/
def atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn

/-- `atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r`

Atomicity ∧ Atoms are strong atoms ⇒ Strong Atomicity -/
def atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn

/-- `atomicity-r-implies-atomicity-t`

Atomicity ⇒ Atomicity (type t) -/
def atomicity_r_implies_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn

/-- `atomicity-t-and-atoms-are-self-atoms-t-imply-self-atomicity-t`

Atomicity (type t) ∧ Atoms are self-atoms (type t) ⇒ Self-Atomicity (type t) -/
def atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `atomicity-t-and-atoms-are-strong-atoms-t-imply-strong-atomicity-t`

Atomicity (type t) ∧ Atoms are strong atoms (type t) ⇒ Strong Atomicity (type t) -/
def atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn

/-- `atomicity-t-and-bf-imply-atomicity`

Atomicity (type t) ∧ BF ⇒ Atomicity -/
def atomicity_t_and_bf_imply_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `atomicity-t-and-bf-imply-necessary-actuality`

Atomicity (type t) ∧ BF ⇒ □Actuality -/
def atomicity_t_and_bf_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `atomicity-t-and-bf-t-imply-strong-atomicity-t`

Atomicity (type t) ∧ BF (type t) ⇒ Strong Atomicity (type t) -/
def atomicity_t_and_bf_t_imply_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn

/-- `atomicity-t-and-weakly-inextensible-comprehension-imply-actuality`

Atomicity (type t) ∧ Weakly Inextensible Comprehension ⇒ Actuality -/
def atomicity_t_and_weakly_inextensible_comprehension_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `atomicity-t-incompatible-with-atomlessness`

Atomicity (type t) ∧ Atomlessness ⇒ ⊥ -/
def atomicity_t_incompatible_with_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `atomlessness-implies-atoms-are-strong-atoms-r`

Atomlessness ⇒ Atoms are strong atoms -/
def atomlessness_implies_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- `atomlessness-implies-axiom-of-infinity-t`

Atomlessness ⇒ Axiom of Infinity (type t) -/
def atomlessness_implies_axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn

/-- `atomlessness-implies-infinity-t`

Atomlessness ⇒ Infinity Schema (type t) -/
def atomlessness_implies_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `atoms-are-self-atoms-r-and-self-atoms-are-strong-atoms-r-imply-atoms-are-strong-atoms-r`

Atoms are self-atoms ∧ Self-atoms are strong atoms ⇒ Atoms are strong atoms -/
def atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- `atoms-are-self-atoms-r-implies-atoms-are-self-atoms-t`

Atoms are self-atoms ⇒ Atoms are self-atoms (type t) -/
def atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `atoms-are-self-atoms-t-and-self-atoms-are-strong-atoms-t-imply-atoms-are-strong-atoms-t`

Atoms are self-atoms (type t) ∧ Self-atoms are strong atoms (type t) ⇒ Atoms are strong atoms (type t) -/
def atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- `atoms-are-strong-atoms-r-and-self-atoms-are-atoms-r-imply-self-atoms-are-strong-atoms-r`

Atoms are strong atoms ∧ Self-atoms are atoms ⇒ Self-atoms are strong atoms -/
def atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn

/-- `atoms-are-strong-atoms-r-implies-atoms-are-self-atoms-r`

Atoms are strong atoms ⇒ Atoms are self-atoms -/
def atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn

/-- `atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-t`

Atoms are strong atoms ⇒ Atoms are strong atoms (type t) -/
def atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- `atoms-are-strong-atoms-t-and-actuality-imply-strong-actuality`

Atoms are strong atoms (type t) ∧ Actuality ⇒ Strong Actuality -/
def atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `atoms-are-strong-atoms-t-and-self-atoms-are-atoms-t-imply-self-atoms-are-strong-atoms-t`

Atoms are strong atoms (type t) ∧ Self-atoms are atoms (type t) ⇒ Self-atoms are strong atoms (type t) -/
def atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn

/-- `atoms-are-strong-atoms-t-implies-atoms-are-self-atoms-t`

Atoms are strong atoms (type t) ⇒ Atoms are self-atoms (type t) -/
def atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `axiom-of-infinity-e-implies-infinity-e`

Axiom of Infinity (type e) ⇒ Infinity Schema (type e) -/
def axiom_of_infinity_e_implies_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `axiom-of-infinity-e-implies-possible-infinity-e`

Axiom of Infinity (type e) ⇒ Possible Infinity (type e) -/
def axiom_of_infinity_e_implies_possible_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn

/-- `axiom-of-infinity-t-implies-infinity-t`

Axiom of Infinity (type t) ⇒ Infinity Schema (type t) -/
def axiom_of_infinity_t_implies_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `axiom-of-infinity-t-implies-possible-infinity-t`

Axiom of Infinity (type t) ⇒ Possible Infinity (type t) -/
def axiom_of_infinity_t_implies_possible_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn

/-- `barcan-and-intensional-choice-imply-necessary-intensional-choice`

BF ∧ Intensional Choice ⇒ □Intensional Choice -/
def barcan_and_intensional_choice_imply_necessary_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn

/-- `barcan-and-weakly-rigid-power-imply-necessary-tame-rigidity`

BF ∧ Weakly Rigid Power ⇒ □Tame Rigidity -/
def barcan_and_weakly_rigid_power_imply_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `barcan-and-weakly-rigid-power-imply-weakly-rigid-weak-rigidity`

BF ∧ Weakly Rigid Power ⇒ Weakly Rigid Weak Rigidity -/
def barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn

/-- `barcan-r-implies-barcan-relational`

BF ⇒ BF (relational types) -/
def barcan_r_implies_barcan_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn

/-- `barcan-r-implies-barcan-t`

BF ⇒ BF (type t) -/
def barcan_r_implies_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn

/-- `barcan-r-implies-functionality-r`

BF ⇒ Functionality -/
def barcan_r_implies_functionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn

/-- `barcan-relational-implies-atoms-are-strong-atoms-r`

BF (relational types) ⇒ Atoms are strong atoms -/
def barcan_relational_implies_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- `barcan-relational-implies-barcan-t`

BF (relational types) ⇒ BF (type t) -/
def barcan_relational_implies_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn

/-- `barcan-t-and-necessary-actuality-imply-self-atomicity-t`

BF (type t) ∧ □Actuality ⇒ Self-Atomicity (type t) -/
def barcan_t_and_necessary_actuality_imply_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `barcan-t-implies-atoms-are-strong-atoms-t`

BF (type t) ⇒ Atoms are strong atoms (type t) -/
def barcan_t_implies_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- `bf-weak-rigid-comprehension-atomicity-and-relational-choice-imply-intensional-choice`

BF ∧ Weak Rigid Comprehension ∧ Atomicity ∧ Relational Choice ⇒ Intensional Choice -/
def bf_weak_rigid_comprehension_atomicity_and_relational_choice_imply_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `boolean-completeness-and-modalized-relational-choice-imply-necessary-transversal`

Boolean Completeness ∧ Modalized Relational Choice ⇒ □Transversal -/
def boolean_completeness_and_modalized_relational_choice_imply_necessary_transversal : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn

/-- `boolean-completeness-r-implies-boolean-completeness-t`

Boolean Completeness ⇒ Boolean Completeness (type t) -/
def boolean_completeness_r_implies_boolean_completeness_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn

/-- `boolean-completeness-r-implies-countable-boolean-completeness-r`

Boolean Completeness ⇒ Countable Boolean Completeness -/
def boolean_completeness_r_implies_countable_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.CountableBooleanCompleteness.schemaIn

/-- `boolean-completeness-r-implies-weakly-inextensible-comprehension-r`

Boolean Completeness ⇒ Weakly Inextensible Comprehension -/
def boolean_completeness_r_implies_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- `c5-and-actuality-imply-completeness`

□ND ∧ Actuality ⇒ Boolean Completeness -/
def c5_and_actuality_imply_completeness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn

/-- `c5-and-actuality-imply-rigid-comprehension`

□ND ∧ Actuality ⇒ Rigid Comprehension -/
def c5_and_actuality_imply_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `c5-and-atomicity-imply-necessary-atomicity`

□ND ∧ Atomicity ⇒ □Atomicity -/
def c5_and_atomicity_imply_necessary_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `c5-and-atomicity-imply-necessary-completeness`

□ND ∧ Atomicity ⇒ □Boolean Completeness -/
def c5_and_atomicity_imply_necessary_completeness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn

/-- `c5-and-atomicity-imply-necessary-plenitude`

□ND ∧ Atomicity ⇒ □Plenitude -/
def c5_and_atomicity_imply_necessary_plenitude : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn

/-- `c5-and-atomicity-imply-necessary-rigid-comprehension`

□ND ∧ Atomicity ⇒ □Rigid Comprehension -/
def c5_and_atomicity_imply_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `c5-and-atomicity-imply-no-pure-contingency`

□ND ∧ Atomicity ⇒ No Pure Contingency -/
def c5_and_atomicity_imply_no_pure_contingency : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `c5-and-atomicity-t-imply-no-pure-contingency`

□ND ∧ Atomicity (type t) ⇒ No Pure Contingency -/
def c5_and_atomicity_t_imply_no_pure_contingency : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `c5-and-atomlessness-imply-necessary-atomlessness`

□ND ∧ Atomlessness ⇒ □Atomlessness -/
def c5_and_atomlessness_imply_necessary_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn

/-- `c5-and-completeness-imply-actuality`

□ND ∧ Boolean Completeness ⇒ Actuality -/
def c5_and_completeness_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `c5-and-completeness-imply-plenitude`

□ND ∧ Boolean Completeness ⇒ Plenitude -/
def c5_and_completeness_imply_plenitude : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn

/-- `c5-and-necessary-actuality-imply-atomicity`

□ND ∧ □Actuality ⇒ Atomicity -/
def c5_and_necessary_actuality_imply_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `c5-and-necessary-completeness-imply-atomicity`

□ND ∧ □Boolean Completeness ⇒ Atomicity -/
def c5_and_necessary_completeness_imply_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `c5-and-necessary-persistent-comprehension-imply-necessary-gallin`

□ND ∧ □Persistent Comprehension ⇒ □Gallin Extensional Comprehension -/
def c5_and_necessary_persistent_comprehension_imply_necessary_gallin : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn

/-- `c5-and-necessary-rigid-comprehension-imply-necessary-gallin-comprehension`

□ND ∧ □Rigid Comprehension ⇒ □Gallin Extensional Comprehension -/
def c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn

/-- `c5-and-necessary-strong-actuality-imply-necessary-gallin-comprehension`

□ND ∧ □Strong Actuality ⇒ □Gallin Extensional Comprehension -/
def c5_and_necessary_strong_actuality_imply_necessary_gallin_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn

/-- `c5-and-persistent-comprehension-imply-gallin`

□ND ∧ Persistent Comprehension ⇒ Gallin Extensional Comprehension -/
def c5_and_persistent_comprehension_imply_gallin : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `c5-implies-necessary-rigid-power`

□ND ⇒ □Rigid Power -/
def c5_implies_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `c5-implies-necessary-tame-rigidity`

□ND ⇒ □Tame Rigidity -/
def c5_implies_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `c5-implies-necessity-of-arithmetic`

□ND ⇒ Necessity of Arithmetic -/
def c5_implies_necessity_of_arithmetic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.ofPure Classicism.Meta.AxiomSet.necessityOfArithmetic)

/-- `c5-implies-tame-rigidity`

□ND ⇒ Tame Rigidity -/
def c5_implies_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn

/-- `completeness-and-actuality-imply-weak-rigid-comprehension`

Boolean Completeness ∧ Actuality ⇒ Weak Rigid Comprehension -/
def completeness_and_actuality_imply_weak_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn

/-- `converse-witnessed-possibility-r-implies-no-pure-contingency-r`

Converse Witnessed Possibility ⇒ No Pure Contingency -/
def converse_witnessed_possibility_r_implies_no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.converseWitnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `countable-boolean-completeness-implies-necessity-of-arithmetic`

Countable Boolean Completeness ⇒ Necessity of Arithmetic -/
def countable_boolean_completeness_implies_necessity_of_arithmetic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.CountableBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.ofPure Classicism.Meta.AxiomSet.necessityOfArithmetic)

/-- `distinctness-necessary-r-implies-distinctness-necessary-t`

ND ⇒ ND (type t) -/
def distinctness_necessary_r_implies_distinctness_necessary_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `distinctness-necessary-t-and-inextensible-comprehension-imply-weakly-rigid-power`

ND (type t) ∧ Inextensible Comprehension ⇒ Weakly Rigid Power -/
def distinctness_necessary_t_and_inextensible_comprehension_imply_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn

/-- `distinctness-necessary-t-implies-modal-five`

ND (type t) ⇒ 5 -/
def distinctness_necessary_t_implies_modal_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn

/-- `distinctness-necessary-t-implies-vicinity`

ND (type t) ⇒ Vicinity -/
def distinctness_necessary_t_implies_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn

/-- `distinctness-preserving-collapse-and-nd-imply-fregean-axiom`

Truths are ND-necessary ∧ ND ⇒ Fregean Axiom -/
def distinctness_preserving_collapse_and_nd_imply_fregean_axiom : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn

/-- `distinctness-signature-r-implies-distinctness-schema-r`

Maximalism (signature Σ) ⇒ Maximalism (pure) -/
def distinctness_signature_r_implies_distinctness_schema_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC)

/-- `distinctness-signature-r-implies-separated-structure-r`

Maximalism (signature Σ) ⇒ Separated Structure -/
def distinctness_signature_r_implies_separated_structure_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _)

/-- `extensionality-r-implies-actuality`

Extensionality ⇒ Actuality -/
def extensionality_r_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `extensionality-r-implies-atomicity-r`

Extensionality ⇒ Atomicity -/
def extensionality_r_implies_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `extensionality-r-implies-boolean-completeness-r`

Extensionality ⇒ Boolean Completeness -/
def extensionality_r_implies_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn

/-- `extensionality-r-implies-fregean-axiom`

Extensionality ⇒ Fregean Axiom -/
def extensionality_r_implies_fregean_axiom : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn

/-- `extensionality-r-implies-functionality-r`

Extensionality ⇒ Functionality -/
def extensionality_r_implies_functionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn

/-- `extensionality-r-implies-intensional-choice-r`

Extensionality ⇒ Intensional Choice -/
def extensionality_r_implies_intensional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `extensionality-r-implies-necessary-extensionality-r`

Extensionality ⇒ □Extensionality -/
def extensionality_r_implies_necessary_extensionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecExtensionality.schemaIn

/-- `extensionality-r-implies-plenitude-r`

Extensionality ⇒ Plenitude -/
def extensionality_r_implies_plenitude_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn

/-- `extensionality-r-implies-rigid-comprehension-r`

Extensionality ⇒ Rigid Comprehension -/
def extensionality_r_implies_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `five-and-self-atomicity-t-imply-necessary-b`

5 ∧ Self-Atomicity (type t) ⇒ □B -/
def five_and_self_atomicity_t_imply_necessary_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn

/-- `five-and-strong-atomicity-t-imply-necessary-b`

5 ∧ Strong Atomicity (type t) ⇒ □B -/
def five_and_strong_atomicity_t_imply_necessary_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn

/-- `five-implies-nd-and-truth-implies-five-imply-truth-implies-nd`

5-necessities are ND-necessary ∧ Truths are 5-necessary ⇒ Truths are ND-necessary -/
def five_implies_nd_and_truth_implies_five_imply_truth_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn

/-- `five-implies-nd-implies-five-implies-two-hat`

5-necessities are ND-necessary ⇒ 5-necessities are two-hat necessary -/
def five_implies_nd_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `five-implies-nd-implies-two-hat-implies-nd`

5-necessities are ND-necessary ⇒ Two-hat necessities are ND-necessary -/
def five_implies_nd_implies_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- `five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat`

5-necessities are two-hat necessary ∧ Truths are 5-necessary ⇒ Truths are two-hat necessary -/
def five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesTwoHatNecessity.schemaIn

/-- `fregean-axiom-implies-distinctness-preserving-collapse`

Fregean Axiom ⇒ Truths are ND-necessary -/
def fregean_axiom_implies_distinctness_preserving_collapse : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn

/-- `fregean-axiom-implies-extensionality-r`

Fregean Axiom ⇒ Extensionality -/
def fregean_axiom_implies_extensionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn

/-- `fregean-axiom-implies-necessary-distinctness-necessary-r`

Fregean Axiom ⇒ □ND -/
def fregean_axiom_implies_necessary_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `fregean-axiom-implies-necessary-fregean-axiom`

Fregean Axiom ⇒ □Fregean Axiom -/
def fregean_axiom_implies_necessary_fregean_axiom : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFregeanAxiom.schemaIn

/-- `fregean-axiom-implies-no-contingency-signature-r`

Fregean Axiom ⇒ No Contingency (signature Σ) -/
def fregean_axiom_implies_no_contingency_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _)

/-- `fregean-axiom-implies-no-pure-contingency-r`

Fregean Axiom ⇒ No Pure Contingency -/
def fregean_axiom_implies_no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `fregean-incompatible-with-infinity-t`

Fregean Axiom ∧ Infinity Schema (type t) ⇒ ⊥ -/
def fregean_incompatible_with_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `functional-choice-r-implies-plenitude-r`

Functional Choice ⇒ Plenitude -/
def functional_choice_r_implies_plenitude_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn

/-- `functional-choice-r-implies-relational-choice-r`

Functional Choice ⇒ Relational Choice -/
def functional_choice_r_implies_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn

/-- `functionality-r-implies-tractarianism-r`

Functionality ⇒ Tractarianism -/
def functionality_r_implies_tractarianism_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn

/-- `gallin-comprehension-and-bf-imply-rigid-comprehension`

Gallin Extensional Comprehension ∧ BF ⇒ Rigid Comprehension -/
def gallin_comprehension_and_bf_imply_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `gallin-comprehension-and-bf-imply-weak-rigid-comprehension`

Gallin Extensional Comprehension ∧ BF ⇒ Weak Rigid Comprehension -/
def gallin_comprehension_and_bf_imply_weak_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn

/-- `gallin-comprehension-implies-nd`

Gallin Extensional Comprehension ⇒ ND -/
def gallin_comprehension_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn

/-- `gallin-comprehension-implies-strong-actuality`

Gallin Extensional Comprehension ⇒ Strong Actuality -/
def gallin_comprehension_implies_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r`

Inextensible Comprehension ⇒ Weakly Inextensible Comprehension -/
def inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- `logical-necessity-r-implies-modal-freedom-signature-r`

Logical Necessity ⇒ Modal Freedom (signature Σ) -/
def logical_necessity_r_implies_modal_freedom_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.logicalNecessity _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.modalFreedom _)

/-- `logical-necessity-r-implies-no-pure-contingency-r`

Logical Necessity ⇒ No Pure Contingency -/
def logical_necessity_r_implies_no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.logicalNecessity _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `logical-necessity-r-implies-separated-structure-r`

Logical Necessity ⇒ Separated Structure -/
def logical_necessity_r_implies_separated_structure_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.logicalNecessity _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _)

/-- `logical-necessity-r-implies-witnessed-possibility-r`

Logical Necessity ⇒ Witnessed Possibility -/
def logical_necessity_r_implies_witnessed_possibility_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.logicalNecessity _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _)

/-- `maximalism-incompatible-with-intensional-choice`

Maximalism (pure) ∧ Intensional Choice ⇒ ⊥ -/
def maximalism_incompatible_with_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalism-incompatible-with-modalized-relational-choice`

Maximalism (pure) ∧ Modalized Relational Choice ⇒ ⊥ -/
def maximalism_incompatible_with_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalism-incompatible-with-self-atoms-are-atoms-t`

Maximalism (pure) ∧ Self-atoms are atoms (type t) ⇒ ⊥ -/
def maximalism_incompatible_with_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalism-signature-incompatible-with-strong-possibility-pure`

Maximalism (signature Σ) ∧ Strong Possibility (pure) ⇒ ⊥ -/
def maximalism_signature_incompatible_with_strong_possibility_pure : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-atomicity-t`

Maximalism (pure) ∧ Atomicity (type t) ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-nd`

Maximalism (pure) ∧ ND ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-actuality`

Maximalism (pure) ∧ □Actuality ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-atomicity-r`

Maximalism (pure) ∧ □Atomicity ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-atomicity-t`

Maximalism (pure) ∧ □Atomicity (type t) ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-atomlessness`

Maximalism (pure) ∧ □Atomlessness ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-barcan-r`

Maximalism (pure) ∧ □BF ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-boolean-completeness-r`

Maximalism (pure) ∧ □Boolean Completeness ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-boolean-completeness-t`

Maximalism (pure) ∧ □Boolean Completeness (type t) ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_boolean_completeness_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-five-implies-nd-necessity`

Maximalism (pure) ∧ □5-necessities are ND-necessary ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_five_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-five-implies-two-hat-necessity`

Maximalism (pure) ∧ □5-necessities are two-hat necessary ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_five_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-functionality-r`

Maximalism (pure) ∧ □Functionality ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_functionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-rigid-comprehension-r`

Maximalism (pure) ∧ □Rigid Comprehension ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-tame-rigidity-r`

Maximalism (pure) ∧ □Tame Rigidity ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_tame_rigidity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-tractarianism-r`

Maximalism (pure) ∧ □Tractarianism ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_tractarianism_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-transversal-r`

Maximalism (pure) ∧ □Transversal ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_transversal_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-truth-implies-five-necessity`

Maximalism (pure) ∧ □Truths are 5-necessary ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_truth_implies_five_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-truth-implies-two-hat-necessity`

Maximalism (pure) ∧ □Truths are two-hat necessary ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_truth_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-two-hat-implies-nd-necessity`

Maximalism (pure) ∧ □Two-hat necessities are ND-necessary ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_two_hat_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-vicinity`

Maximalism (pure) ∧ □Vicinity ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-necessary-weakly-inextensible-comprehension-r`

Maximalism (pure) ∧ □Weakly Inextensible Comprehension ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_necessary_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `maximalist-distinctness-incompatible-with-rigid-comprehension`

Maximalism (pure) ∧ Rigid Comprehension ⇒ ⊥ -/
def maximalist_distinctness_incompatible_with_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `modal-b-implies-distinctness-necessary-r`

B ⇒ ND -/
def modal_b_implies_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn

/-- `modal-b-implies-pure-b-r`

B ⇒ B for pure sentences -/
def modal_b_implies_pure_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `modal-b-implies-signature-b-r`

B ⇒ B for sentences of Σ -/
def modal_b_implies_signature_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.signatureB _)

/-- `modal-five-implies-modal-b`

5 ⇒ B -/
def modal_five_implies_modal_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn

/-- `modal-five-implies-self-atoms-are-atoms-r`

5 ⇒ Self-atoms are atoms -/
def modal_five_implies_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn

/-- `modal-freedom-signature-r-implies-no-pure-contingency-r`

Modal Freedom (signature Σ) ⇒ No Pure Contingency -/
def modal_freedom_signature_r_implies_no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.modalFreedom _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `modal-well-ordering-implies-modalized-relational-choice`

Modal Well-Ordering ⇒ Modalized Relational Choice -/
def modal_well_ordering_implies_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn

/-- `modal-well-ordering-implies-necessary-modalized-relational-choice`

Modal Well-Ordering ⇒ □Modalized Relational Choice -/
def modal_well_ordering_implies_necessary_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn

/-- `modal-well-ordering-r-implies-intensional-choice-r`

Modal Well-Ordering ⇒ Intensional Choice -/
def modal_well_ordering_r_implies_intensional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `modal-well-ordering-r-implies-necessary-intensional-choice-r`

Modal Well-Ordering ⇒ □Intensional Choice -/
def modal_well_ordering_r_implies_necessary_intensional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn

/-- `modal-well-ordering-r-implies-necessary-well-ordering-r`

Modal Well-Ordering ⇒ □Well-Ordering -/
def modal_well_ordering_r_implies_necessary_well_ordering_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn

/-- `modalized-relational-choice-implies-intensional-choice`

Modalized Relational Choice ⇒ Intensional Choice -/
def modalized_relational_choice_implies_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `modalized-relational-choice-implies-necessary-modalized-relational-choice`

Modalized Relational Choice ⇒ □Modalized Relational Choice -/
def modalized_relational_choice_implies_necessary_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn

/-- `modalized-relational-choice-implies-relational-choice`

Modalized Relational Choice ⇒ Relational Choice -/
def modalized_relational_choice_implies_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn

/-- `nd-and-bf-imply-necessary-nd`

ND ∧ BF ⇒ □ND -/
def nd_and_bf_imply_necessary_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `nd-and-strong-actuality-imply-gallin-comprehension`

ND ∧ Strong Actuality ⇒ Gallin Extensional Comprehension -/
def nd_and_strong_actuality_imply_gallin_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `nd-t-and-bf-t-imply-necessary-nd-t`

ND (type t) ∧ BF (type t) ⇒ □ND (type t) -/
def nd_t_and_bf_t_imply_necessary_nd_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn

/-- `necessary-actuality-and-necessary-bf-imply-necessary-inextensible-comprehension`

□Actuality ∧ □BF ⇒ □Inextensible Comprehension -/
def necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn

/-- `necessary-actuality-and-necessary-bf-t-imply-necessary-strong-actuality`

□Actuality ∧ □BF (type t) ⇒ □Strong Actuality -/
def necessary_actuality_and_necessary_bf_t_imply_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-actuality-and-necessary-distinctness-preserving-collapse-imply-necessary-inextensible-comprehension`

□Actuality ∧ □Truths are ND-necessary ⇒ □Inextensible Comprehension -/
def necessary_actuality_and_necessary_distinctness_preserving_collapse_imply_necessary_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn

/-- `necessary-actuality-and-necessary-five-implies-nd-necessity-imply-necessary-inextensible-comprehension`

□Actuality ∧ □5-necessities are ND-necessary ⇒ □Inextensible Comprehension -/
def necessary_actuality_and_necessary_five_implies_nd_necessity_imply_necessary_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn

/-- `necessary-actuality-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-strong-actuality`

□Actuality ∧ □Self-atoms are strong atoms (type t) ⇒ □Strong Actuality -/
def necessary_actuality_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-actuality-and-necessary-two-hat-implies-nd-imply-necessary-strong-actuality`

□Actuality ∧ □Two-hat necessities are ND-necessary ⇒ □Strong Actuality -/
def necessary_actuality_and_necessary_two_hat_implies_nd_imply_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-actuality-implies-actuality`

□Actuality ⇒ Actuality -/
def necessary_actuality_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `necessary-actuality-implies-necessary-five-implies-two-hat`

□Actuality ⇒ □5-necessities are two-hat necessary -/
def necessary_actuality_implies_necessary_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-actuality-implies-necessary-persistent-comprehension`

□Actuality ⇒ □Persistent Comprehension -/
def necessary_actuality_implies_necessary_persistent_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn

/-- `necessary-actuality-implies-necessary-transversal`

□Actuality ⇒ □Transversal -/
def necessary_actuality_implies_necessary_transversal : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn

/-- `necessary-actuality-implies-necessary-vicinity`

□Actuality ⇒ □Vicinity -/
def necessary_actuality_implies_necessary_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn

/-- `necessary-actuality-implies-necessary-weakly-inextensible-comprehension-r`

□Actuality ⇒ □Weakly Inextensible Comprehension -/
def necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `necessary-atomicity-and-necessary-bf-imply-necessary-strong-atomicity`

□Atomicity ∧ □BF ⇒ □Strong Atomicity -/
def necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `necessary-atomicity-and-necessary-bf-relational-imply-necessary-strong-atomicity`

□Atomicity ∧ □BF (relational types) ⇒ □Strong Atomicity -/
def necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `necessary-atomicity-and-necessary-bf-t-imply-necessary-strong-atomicity-t`

□Atomicity ∧ □BF (type t) ⇒ □Strong Atomicity (type t) -/
def necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power`

□Atomicity ∧ □Rigid Comprehension ⇒ □Rigid Power -/
def necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `necessary-atomicity-completeness-bf-imply-rigid-comprehension`  (conjectured)

□Atomicity ∧ Boolean Completeness ∧ BF ⇒ Rigid Comprehension -/
def necessary_atomicity_completeness_bf_imply_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `necessary-atomicity-r-and-necessary-atoms-are-self-atoms-r-imply-necessary-self-atomicity-r`

□Atomicity ∧ □Atoms are self-atoms ⇒ □Self-Atomicity -/
def necessary_atomicity_r_and_necessary_atoms_are_self_atoms_r_imply_necessary_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn

/-- `necessary-atomicity-r-and-necessary-atoms-are-strong-atoms-r-imply-necessary-strong-atomicity-r`

□Atomicity ∧ □Atoms are strong atoms ⇒ □Strong Atomicity -/
def necessary_atomicity_r_and_necessary_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `necessary-atomicity-r-implies-atomicity-r`

□Atomicity ⇒ Atomicity -/
def necessary_atomicity_r_implies_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `necessary-atomicity-r-implies-necessary-atomicity-t`

□Atomicity ⇒ □Atomicity (type t) -/
def necessary_atomicity_r_implies_necessary_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn

/-- `necessary-atomicity-t-and-necessary-atoms-are-self-atoms-t-imply-necessary-self-atomicity-t`

□Atomicity (type t) ∧ □Atoms are self-atoms (type t) ⇒ □Self-Atomicity (type t) -/
def necessary_atomicity_t_and_necessary_atoms_are_self_atoms_t_imply_necessary_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn

/-- `necessary-atomicity-t-and-necessary-atoms-are-strong-atoms-t-imply-necessary-strong-atomicity-t`

□Atomicity (type t) ∧ □Atoms are strong atoms (type t) ⇒ □Strong Atomicity (type t) -/
def necessary_atomicity_t_and_necessary_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `necessary-atomicity-t-and-necessary-bf-imply-necessary-atomicity`

□Atomicity (type t) ∧ □BF ⇒ □Atomicity -/
def necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `necessary-atomicity-t-and-necessary-bf-t-imply-necessary-strong-atomicity-t`

□Atomicity (type t) ∧ □BF (type t) ⇒ □Strong Atomicity (type t) -/
def necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `necessary-atomicity-t-and-necessary-wic-imply-necessary-actuality`

□Atomicity (type t) ∧ □Weakly Inextensible Comprehension ⇒ □Actuality -/
def necessary_atomicity_t_and_necessary_wic_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-atomicity-t-implies-atomicity-t`

□Atomicity (type t) ⇒ Atomicity (type t) -/
def necessary_atomicity_t_implies_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn

/-- `necessary-atomlessness-implies-atomlessness`

□Atomlessness ⇒ Atomlessness -/
def necessary_atomlessness_implies_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn

/-- `necessary-atomlessness-implies-necessary-atoms-are-strong-atoms-r`

□Atomlessness ⇒ □Atoms are strong atoms -/
def necessary_atomlessness_implies_necessary_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- `necessary-atomlessness-implies-necessary-self-atoms-are-strong-atoms-r`

□Atomlessness ⇒ □Self-atoms are strong atoms -/
def necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- `necessary-atoms-are-self-atoms-r-and-necessary-self-atoms-are-strong-atoms-r-imply-necessary-atoms-are-strong-atoms-r`

□Atoms are self-atoms ∧ □Self-atoms are strong atoms ⇒ □Atoms are strong atoms -/
def necessary_atoms_are_self_atoms_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- `necessary-atoms-are-self-atoms-r-implies-atoms-are-self-atoms-r`

□Atoms are self-atoms ⇒ Atoms are self-atoms -/
def necessary_atoms_are_self_atoms_r_implies_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn

/-- `necessary-atoms-are-self-atoms-r-implies-necessary-atoms-are-self-atoms-t`

□Atoms are self-atoms ⇒ □Atoms are self-atoms (type t) -/
def necessary_atoms_are_self_atoms_r_implies_necessary_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn

/-- `necessary-atoms-are-self-atoms-t-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-atoms-are-strong-atoms-t`

□Atoms are self-atoms (type t) ∧ □Self-atoms are strong atoms (type t) ⇒ □Atoms are strong atoms (type t) -/
def necessary_atoms_are_self_atoms_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- `necessary-atoms-are-self-atoms-t-implies-atoms-are-self-atoms-t`

□Atoms are self-atoms (type t) ⇒ Atoms are self-atoms (type t) -/
def necessary_atoms_are_self_atoms_t_implies_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `necessary-atoms-are-strong-atoms-r-and-necessary-self-atoms-are-atoms-r-imply-necessary-self-atoms-are-strong-atoms-r`

□Atoms are strong atoms ∧ □Self-atoms are atoms ⇒ □Self-atoms are strong atoms -/
def necessary_atoms_are_strong_atoms_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- `necessary-atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-r`

□Atoms are strong atoms ⇒ Atoms are strong atoms -/
def necessary_atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- `necessary-atoms-are-strong-atoms-r-implies-necessary-atoms-are-self-atoms-r`

□Atoms are strong atoms ⇒ □Atoms are self-atoms -/
def necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn

/-- `necessary-atoms-are-strong-atoms-r-implies-necessary-atoms-are-strong-atoms-t`

□Atoms are strong atoms ⇒ □Atoms are strong atoms (type t) -/
def necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- `necessary-atoms-are-strong-atoms-t-and-necessary-actuality-imply-necessary-strong-actuality`

□Atoms are strong atoms (type t) ∧ □Actuality ⇒ □Strong Actuality -/
def necessary_atoms_are_strong_atoms_t_and_necessary_actuality_imply_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-atoms-are-strong-atoms-t-and-necessary-self-atoms-are-atoms-t-imply-necessary-self-atoms-are-strong-atoms-t`

□Atoms are strong atoms (type t) ∧ □Self-atoms are atoms (type t) ⇒ □Self-atoms are strong atoms (type t) -/
def necessary_atoms_are_strong_atoms_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn

/-- `necessary-atoms-are-strong-atoms-t-implies-atoms-are-strong-atoms-t`

□Atoms are strong atoms (type t) ⇒ Atoms are strong atoms (type t) -/
def necessary_atoms_are_strong_atoms_t_implies_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- `necessary-atoms-are-strong-atoms-t-implies-necessary-atoms-are-self-atoms-t`

□Atoms are strong atoms (type t) ⇒ □Atoms are self-atoms (type t) -/
def necessary_atoms_are_strong_atoms_t_implies_necessary_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn

/-- `necessary-barcan-and-rigid-power-imply-rigid-rigidity`

□BF ∧ Rigid Power ⇒ Rigid Rigidity -/
def necessary_barcan_and_rigid_power_imply_rigid_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn

/-- `necessary-barcan-r-implies-barcan-r`

□BF ⇒ BF -/
def necessary_barcan_r_implies_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn

/-- `necessary-barcan-r-implies-necessary-barcan-relational`

□BF ⇒ □BF (relational types) -/
def necessary_barcan_r_implies_necessary_barcan_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn

/-- `necessary-barcan-r-implies-necessary-barcan-t`

□BF ⇒ □BF (type t) -/
def necessary_barcan_r_implies_necessary_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn

/-- `necessary-barcan-r-implies-necessary-functionality-r`

□BF ⇒ □Functionality -/
def necessary_barcan_r_implies_necessary_functionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn

/-- `necessary-barcan-relational-implies-barcan-relational`

□BF (relational types) ⇒ BF (relational types) -/
def necessary_barcan_relational_implies_barcan_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn

/-- `necessary-barcan-relational-implies-necessary-atoms-are-strong-atoms-r`

□BF (relational types) ⇒ □Atoms are strong atoms -/
def necessary_barcan_relational_implies_necessary_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- `necessary-barcan-relational-implies-necessary-barcan-t`

□BF (relational types) ⇒ □BF (type t) -/
def necessary_barcan_relational_implies_necessary_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn

/-- `necessary-barcan-t-and-necessary-actuality-imply-necessary-self-atomicity-t`

□BF (type t) ∧ □Actuality ⇒ □Self-Atomicity (type t) -/
def necessary_barcan_t_and_necessary_actuality_imply_necessary_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn

/-- `necessary-barcan-t-implies-barcan-t`

□BF (type t) ⇒ BF (type t) -/
def necessary_barcan_t_implies_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn

/-- `necessary-barcan-t-implies-necessary-atoms-are-strong-atoms-t`

□BF (type t) ⇒ □Atoms are strong atoms (type t) -/
def necessary_barcan_t_implies_necessary_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- `necessary-bf-and-actuality-imply-inextensible-comprehension`

□BF ∧ Actuality ⇒ Inextensible Comprehension -/
def necessary_bf_and_actuality_imply_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power`

□BF ∧ □Atomicity ∧ □Rigid Comprehension ⇒ □Rigid Power -/
def necessary_bf_atomicity_and_rigid_comprehension_imply_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `necessary-boolean-completeness-implies-necessary-weakly-inextensible-comprehension`

□Boolean Completeness ⇒ □Weakly Inextensible Comprehension -/
def necessary_boolean_completeness_implies_necessary_weakly_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `necessary-boolean-completeness-r-implies-boolean-completeness-r`

□Boolean Completeness ⇒ Boolean Completeness -/
def necessary_boolean_completeness_r_implies_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn

/-- `necessary-boolean-completeness-r-implies-necessary-boolean-completeness-t`

□Boolean Completeness ⇒ □Boolean Completeness (type t) -/
def necessary_boolean_completeness_r_implies_necessary_boolean_completeness_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn

/-- `necessary-boolean-completeness-r-implies-necessary-countable-boolean-completeness-r`

□Boolean Completeness ⇒ □Countable Boolean Completeness -/
def necessary_boolean_completeness_r_implies_necessary_countable_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecCountableBooleanCompleteness.schemaIn

/-- `necessary-boolean-completeness-t-implies-boolean-completeness-t`

□Boolean Completeness (type t) ⇒ Boolean Completeness (type t) -/
def necessary_boolean_completeness_t_implies_boolean_completeness_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn

/-- `necessary-completeness-and-necessary-actuality-imply-necessary-weak-rigid-comprehension`

□Boolean Completeness ∧ □Actuality ⇒ □Weak Rigid Comprehension -/
def necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn

/-- `necessary-countable-boolean-completeness-r-implies-countable-boolean-completeness-r`

□Countable Boolean Completeness ⇒ Countable Boolean Completeness -/
def necessary_countable_boolean_completeness_r_implies_countable_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecCountableBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.CountableBooleanCompleteness.schemaIn

/-- `necessary-distinctness-necessary-r-implies-distinctness-necessary-r`

□ND ⇒ ND -/
def necessary_distinctness_necessary_r_implies_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn

/-- `necessary-distinctness-necessary-r-implies-necessary-barcan-r`

□ND ⇒ □BF -/
def necessary_distinctness_necessary_r_implies_necessary_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `necessary-distinctness-necessary-r-implies-necessary-distinctness-necessary-t`

□ND ⇒ □ND (type t) -/
def necessary_distinctness_necessary_r_implies_necessary_distinctness_necessary_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn

/-- `necessary-distinctness-necessary-r-implies-necessary-modal-five`

□ND ⇒ □5 -/
def necessary_distinctness_necessary_r_implies_necessary_modal_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn

/-- `necessary-distinctness-necessary-t-implies-distinctness-necessary-t`

□ND (type t) ⇒ ND (type t) -/
def necessary_distinctness_necessary_t_implies_distinctness_necessary_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `necessary-distinctness-necessary-t-implies-necessary-distinctness-necessary-r`

□ND (type t) ⇒ □ND -/
def necessary_distinctness_necessary_t_implies_necessary_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `necessary-distinctness-necessary-t-implies-necessary-two-hat-implies-nd`

□ND (type t) ⇒ □Two-hat necessities are ND-necessary -/
def necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `necessary-distinctness-necessary-t-implies-necessary-vicinity`

□ND (type t) ⇒ □Vicinity -/
def necessary_distinctness_necessary_t_implies_necessary_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn

/-- `necessary-distinctness-preserving-collapse-implies-distinctness-preserving-collapse`

□Truths are ND-necessary ⇒ Truths are ND-necessary -/
def necessary_distinctness_preserving_collapse_implies_distinctness_preserving_collapse : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn

/-- `necessary-extensionality-r-implies-extensionality-r`

□Extensionality ⇒ Extensionality -/
def necessary_extensionality_r_implies_extensionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecExtensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn

/-- `necessary-five-implies-nd-and-necessary-truth-implies-five-imply-necessary-truth-implies-nd`

□5-necessities are ND-necessary ∧ □Truths are 5-necessary ⇒ □Truths are ND-necessary -/
def necessary_five_implies_nd_and_necessary_truth_implies_five_imply_necessary_truth_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn

/-- `necessary-five-implies-nd-implies-five-implies-two-hat`

□5-necessities are ND-necessary ⇒ □5-necessities are two-hat necessary -/
def necessary_five_implies_nd_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-five-implies-nd-implies-two-hat-implies-nd`

□5-necessities are ND-necessary ⇒ □Two-hat necessities are ND-necessary -/
def necessary_five_implies_nd_implies_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `necessary-five-implies-nd-necessity-implies-five-implies-nd-necessity`

□5-necessities are ND-necessary ⇒ 5-necessities are ND-necessary -/
def necessary_five_implies_nd_necessity_implies_five_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn

/-- `necessary-five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat`

□5-necessities are two-hat necessary ∧ □Truths are 5-necessary ⇒ □Truths are two-hat necessary -/
def necessary_five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn

/-- `necessary-five-implies-two-hat-necessity-implies-five-implies-two-hat-necessity`

□5-necessities are two-hat necessary ⇒ 5-necessities are two-hat necessary -/
def necessary_five_implies_two_hat_necessity_implies_five_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-fregean-axiom-implies-fregean-axiom`

□Fregean Axiom ⇒ Fregean Axiom -/
def necessary_fregean_axiom_implies_fregean_axiom : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn

/-- `necessary-functional-choice-r-implies-functional-choice-r`

□Functional Choice ⇒ Functional Choice -/
def necessary_functional_choice_r_implies_functional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn

/-- `necessary-functional-choice-r-implies-necessary-plenitude-r`

□Functional Choice ⇒ □Plenitude -/
def necessary_functional_choice_r_implies_necessary_plenitude_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn

/-- `necessary-functional-choice-r-implies-necessary-relational-choice-r`

□Functional Choice ⇒ □Relational Choice -/
def necessary_functional_choice_r_implies_necessary_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn

/-- `necessary-functionality-r-implies-functionality-r`

□Functionality ⇒ Functionality -/
def necessary_functionality_r_implies_functionality_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn

/-- `necessary-functionality-r-implies-necessary-tractarianism-r`

□Functionality ⇒ □Tractarianism -/
def necessary_functionality_r_implies_necessary_tractarianism_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn

/-- `necessary-gallin-comprehension-implies-gallin-comprehension`

□Gallin Extensional Comprehension ⇒ Gallin Extensional Comprehension -/
def necessary_gallin_comprehension_implies_gallin_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `necessary-gallin-comprehension-implies-necessary-nd`

□Gallin Extensional Comprehension ⇒ □ND -/
def necessary_gallin_comprehension_implies_necessary_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `necessary-gallin-comprehension-implies-necessary-rigid-comprehension`

□Gallin Extensional Comprehension ⇒ □Rigid Comprehension -/
def necessary_gallin_comprehension_implies_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `necessary-gallin-comprehension-implies-necessary-strong-actuality`

□Gallin Extensional Comprehension ⇒ □Strong Actuality -/
def necessary_gallin_comprehension_implies_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-inextensible-comprehension-implies-necessary-wic`

□Inextensible Comprehension ⇒ □Weakly Inextensible Comprehension -/
def necessary_inextensible_comprehension_implies_necessary_wic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `necessary-inextensible-comprehension-r-implies-inextensible-comprehension-r`

□Inextensible Comprehension ⇒ Inextensible Comprehension -/
def necessary_inextensible_comprehension_r_implies_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `necessary-intensional-choice-r-implies-intensional-choice-r`

□Intensional Choice ⇒ Intensional Choice -/
def necessary_intensional_choice_r_implies_intensional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `necessary-modal-b-implies-modal-b`

□B ⇒ B -/
def necessary_modal_b_implies_modal_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn

/-- `necessary-modal-b-implies-necessary-distinctness-necessary-r`

□B ⇒ □ND -/
def necessary_modal_b_implies_necessary_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `necessary-modal-five-implies-modal-five`

□5 ⇒ 5 -/
def necessary_modal_five_implies_modal_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn

/-- `necessary-modal-five-implies-necessary-modal-b`

□5 ⇒ □B -/
def necessary_modal_five_implies_necessary_modal_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn

/-- `necessary-modal-five-implies-necessary-self-atoms-are-atoms-r`

□5 ⇒ □Self-atoms are atoms -/
def necessary_modal_five_implies_necessary_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn

/-- `necessary-modal-five-implies-necessary-self-atoms-are-strong-atoms-r`

□5 ⇒ □Self-atoms are strong atoms -/
def necessary_modal_five_implies_necessary_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- `necessary-modalized-relational-choice-implies-necessary-intensional-choice`

□Modalized Relational Choice ⇒ □Intensional Choice -/
def necessary_modalized_relational_choice_implies_necessary_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn

/-- `necessary-modalized-relational-choice-implies-necessary-relational-choice`

□Modalized Relational Choice ⇒ □Relational Choice -/
def necessary_modalized_relational_choice_implies_necessary_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn

/-- `necessary-modalized-relational-choice-r-implies-modalized-relational-choice-r`

□Modalized Relational Choice ⇒ Modalized Relational Choice -/
def necessary_modalized_relational_choice_r_implies_modalized_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn

/-- `necessary-nd-implies-bf`

□ND ⇒ BF -/
def necessary_nd_implies_bf : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn

/-- `necessary-persistent-comprehension-implies-necessary-actuality`

□Persistent Comprehension ⇒ □Actuality -/
def necessary_persistent_comprehension_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-persistent-comprehension-r-implies-persistent-comprehension-r`

□Persistent Comprehension ⇒ Persistent Comprehension -/
def necessary_persistent_comprehension_r_implies_persistent_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn

/-- `necessary-plenitude-r-implies-atomicity-r`

□Plenitude ⇒ Atomicity -/
def necessary_plenitude_r_implies_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `necessary-plenitude-r-implies-necessary-actuality`

□Plenitude ⇒ □Actuality -/
def necessary_plenitude_r_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-plenitude-r-implies-necessary-atomicity-r`

□Plenitude ⇒ □Atomicity -/
def necessary_plenitude_r_implies_necessary_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `necessary-plenitude-r-implies-necessary-distinctness-necessary-r`

□Plenitude ⇒ □ND -/
def necessary_plenitude_r_implies_necessary_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `necessary-plenitude-r-implies-plenitude-r`

□Plenitude ⇒ Plenitude -/
def necessary_plenitude_r_implies_plenitude_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn

/-- `necessary-relational-choice-and-intensional-choice-imply-modalized-relational-choice`

□Relational Choice ∧ Intensional Choice ⇒ Modalized Relational Choice -/
def necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn

/-- `necessary-relational-choice-and-necessary-intensional-choice-imply-necessary-modalized-relational-choice`

□Relational Choice ∧ □Intensional Choice ⇒ □Modalized Relational Choice -/
def necessary_relational_choice_and_necessary_intensional_choice_imply_necessary_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn

/-- `necessary-relational-choice-and-necessary-plenitude-imply-necessary-functional-choice`

□Relational Choice ∧ □Plenitude ⇒ □Functional Choice -/
def necessary_relational_choice_and_necessary_plenitude_imply_necessary_functional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn

/-- `necessary-relational-choice-r-implies-relational-choice-r`

□Relational Choice ⇒ Relational Choice -/
def necessary_relational_choice_r_implies_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn

/-- `necessary-rigid-comprehension-implies-necessary-inextensible-comprehension`

□Rigid Comprehension ⇒ □Inextensible Comprehension -/
def necessary_rigid_comprehension_implies_necessary_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn

/-- `necessary-rigid-comprehension-implies-necessary-tame-rigidity`

□Rigid Comprehension ⇒ □Tame Rigidity -/
def necessary_rigid_comprehension_implies_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `necessary-rigid-comprehension-implies-necessary-weak-rigid-comprehension`

□Rigid Comprehension ⇒ □Weak Rigid Comprehension -/
def necessary_rigid_comprehension_implies_necessary_weak_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn

/-- `necessary-rigid-comprehension-r-implies-necessary-actuality`

□Rigid Comprehension ⇒ □Actuality -/
def necessary_rigid_comprehension_r_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-rigid-comprehension-r-implies-necessary-boolean-completeness-r`

□Rigid Comprehension ⇒ □Boolean Completeness -/
def necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn

/-- `necessary-rigid-comprehension-r-implies-rigid-comprehension-r`

□Rigid Comprehension ⇒ Rigid Comprehension -/
def necessary_rigid_comprehension_r_implies_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `necessary-rigid-power-r-implies-rigid-power-r`

□Rigid Power ⇒ Rigid Power -/
def necessary_rigid_power_r_implies_rigid_power_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn

/-- `necessary-rigid-rigidity-r-implies-rigid-rigidity-r`

□Rigid Rigidity ⇒ Rigid Rigidity -/
def necessary_rigid_rigidity_r_implies_rigid_rigidity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn

/-- `necessary-self-atomicity-r-and-necessary-self-atoms-are-atoms-r-imply-necessary-atomicity-r`

□Self-Atomicity ∧ □Self-atoms are atoms ⇒ □Atomicity -/
def necessary_self_atomicity_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `necessary-self-atomicity-r-and-necessary-self-atoms-are-strong-atoms-r-imply-necessary-strong-atomicity-r`

□Self-Atomicity ∧ □Self-atoms are strong atoms ⇒ □Strong Atomicity -/
def necessary_self_atomicity_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `necessary-self-atomicity-r-implies-necessary-atoms-are-self-atoms-r`

□Self-Atomicity ⇒ □Atoms are self-atoms -/
def necessary_self_atomicity_r_implies_necessary_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn

/-- `necessary-self-atomicity-r-implies-necessary-self-atomicity-t`

□Self-Atomicity ⇒ □Self-Atomicity (type t) -/
def necessary_self_atomicity_r_implies_necessary_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn

/-- `necessary-self-atomicity-r-implies-self-atomicity-r`

□Self-Atomicity ⇒ Self-Atomicity -/
def necessary_self_atomicity_r_implies_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn

/-- `necessary-self-atomicity-t-and-necessary-bf-imply-necessary-self-atomicity-r`

□Self-Atomicity (type t) ∧ □BF ⇒ □Self-Atomicity -/
def necessary_self_atomicity_t_and_necessary_bf_imply_necessary_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn

/-- `necessary-self-atomicity-t-and-necessary-self-atoms-are-atoms-t-imply-necessary-atomicity-t`

□Self-Atomicity (type t) ∧ □Self-atoms are atoms (type t) ⇒ □Atomicity (type t) -/
def necessary_self_atomicity_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn

/-- `necessary-self-atomicity-t-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-strong-atomicity-t`

□Self-Atomicity (type t) ∧ □Self-atoms are strong atoms (type t) ⇒ □Strong Atomicity (type t) -/
def necessary_self_atomicity_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `necessary-self-atomicity-t-implies-necessary-atoms-are-self-atoms-t`

□Self-Atomicity (type t) ⇒ □Atoms are self-atoms (type t) -/
def necessary_self_atomicity_t_implies_necessary_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn

/-- `necessary-self-atomicity-t-implies-necessary-two-hat-implies-nd`

□Self-Atomicity (type t) ⇒ □Two-hat necessities are ND-necessary -/
def necessary_self_atomicity_t_implies_necessary_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `necessary-self-atomicity-t-implies-self-atomicity-t`

□Self-Atomicity (type t) ⇒ Self-Atomicity (type t) -/
def necessary_self_atomicity_t_implies_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `necessary-self-atoms-are-atoms-r-implies-necessary-self-atoms-are-atoms-t`

□Self-atoms are atoms ⇒ □Self-atoms are atoms (type t) -/
def necessary_self_atoms_are_atoms_r_implies_necessary_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn

/-- `necessary-self-atoms-are-atoms-r-implies-self-atoms-are-atoms-r`

□Self-atoms are atoms ⇒ Self-atoms are atoms -/
def necessary_self_atoms_are_atoms_r_implies_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn

/-- `necessary-self-atoms-are-atoms-t-and-necessary-bf-imply-necessary-self-atoms-are-atoms-r`

□Self-atoms are atoms (type t) ∧ □BF ⇒ □Self-atoms are atoms -/
def necessary_self_atoms_are_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn

/-- `necessary-self-atoms-are-atoms-t-implies-self-atoms-are-atoms-t`

□Self-atoms are atoms (type t) ⇒ Self-atoms are atoms (type t) -/
def necessary_self_atoms_are_atoms_t_implies_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-r-implies-necessary-self-atoms-are-atoms-r`

□Self-atoms are strong atoms ⇒ □Self-atoms are atoms -/
def necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-r-implies-necessary-self-atoms-are-strong-atoms-t`

□Self-atoms are strong atoms ⇒ □Self-atoms are strong atoms (type t) -/
def necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-r`

□Self-atoms are strong atoms ⇒ Self-atoms are strong atoms -/
def necessary_self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-t-and-necessary-bf-imply-necessary-self-atoms-are-strong-atoms-r`

□Self-atoms are strong atoms (type t) ∧ □BF ⇒ □Self-atoms are strong atoms -/
def necessary_self_atoms_are_strong_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-t-implies-necessary-self-atoms-are-atoms-t`

□Self-atoms are strong atoms (type t) ⇒ □Self-atoms are atoms (type t) -/
def necessary_self_atoms_are_strong_atoms_t_implies_necessary_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn

/-- `necessary-self-atoms-are-strong-atoms-t-implies-self-atoms-are-strong-atoms-t`

□Self-atoms are strong atoms (type t) ⇒ Self-atoms are strong atoms (type t) -/
def necessary_self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn

/-- `necessary-strong-actuality-implies-necessary-actuality`

□Strong Actuality ⇒ □Actuality -/
def necessary_strong_actuality_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-strong-actuality-implies-strong-actuality`

□Strong Actuality ⇒ Strong Actuality -/
def necessary_strong_actuality_implies_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `necessary-strong-atomicity-and-necessary-rigid-comprehension-imply-necessary-bf-relational`

□Strong Atomicity ∧ □Rigid Comprehension ⇒ □BF (relational types) -/
def necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn

/-- `necessary-strong-atomicity-and-rigid-comprehension-imply-necessary-bf-relational`  (conjectured)

□Strong Atomicity ∧ Rigid Comprehension ⇒ □BF (relational types) -/
def necessary_strong_atomicity_and_rigid_comprehension_imply_necessary_bf_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn

/-- `necessary-strong-atomicity-implies-necessary-atomicity`

□Strong Atomicity ⇒ □Atomicity -/
def necessary_strong_atomicity_implies_necessary_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `necessary-strong-atomicity-r-implies-necessary-atoms-are-strong-atoms-r`

□Strong Atomicity ⇒ □Atoms are strong atoms -/
def necessary_strong_atomicity_r_implies_necessary_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- `necessary-strong-atomicity-r-implies-necessary-self-atomicity-r`

□Strong Atomicity ⇒ □Self-Atomicity -/
def necessary_strong_atomicity_r_implies_necessary_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn

/-- `necessary-strong-atomicity-r-implies-necessary-strong-atomicity-t`

□Strong Atomicity ⇒ □Strong Atomicity (type t) -/
def necessary_strong_atomicity_r_implies_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `necessary-strong-atomicity-r-implies-strong-atomicity-r`

□Strong Atomicity ⇒ Strong Atomicity -/
def necessary_strong_atomicity_r_implies_strong_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn

/-- `necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity`

□Strong Atomicity (type t) ∧ □BF ⇒ □Strong Atomicity -/
def necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `necessary-strong-atomicity-t-implies-necessary-atomicity-t`

□Strong Atomicity (type t) ⇒ □Atomicity (type t) -/
def necessary_strong_atomicity_t_implies_necessary_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn

/-- `necessary-strong-atomicity-t-implies-necessary-atoms-are-strong-atoms-t`

□Strong Atomicity (type t) ⇒ □Atoms are strong atoms (type t) -/
def necessary_strong_atomicity_t_implies_necessary_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- `necessary-strong-atomicity-t-implies-necessary-self-atomicity-t`

□Strong Atomicity (type t) ⇒ □Self-Atomicity (type t) -/
def necessary_strong_atomicity_t_implies_necessary_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn

/-- `necessary-strong-atomicity-t-implies-necessary-strong-actuality`

□Strong Atomicity (type t) ⇒ □Strong Actuality -/
def necessary_strong_atomicity_t_implies_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `necessary-strong-atomicity-t-implies-necessary-two-hat-implies-nd`

□Strong Atomicity (type t) ⇒ □Two-hat necessities are ND-necessary -/
def necessary_strong_atomicity_t_implies_necessary_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `necessary-strong-atomicity-t-implies-strong-atomicity-t`

□Strong Atomicity (type t) ⇒ Strong Atomicity (type t) -/
def necessary_strong_atomicity_t_implies_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn

/-- `necessary-tame-rigidity-and-necessary-rigid-power-imply-necessary-weakly-rigid-power`

□Tame Rigidity ∧ □Rigid Power ⇒ □Weakly Rigid Power -/
def necessary_tame_rigidity_and_necessary_rigid_power_imply_necessary_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidPower.schemaIn

/-- `necessary-tame-rigidity-and-necessary-weak-rigid-comprehension-imply-necessary-rigid-comprehension`

□Tame Rigidity ∧ □Weak Rigid Comprehension ⇒ □Rigid Comprehension -/
def necessary_tame_rigidity_and_necessary_weak_rigid_comprehension_imply_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `necessary-tame-rigidity-and-rigid-power-imply-weakly-rigid-power`

□Tame Rigidity ∧ Rigid Power ⇒ Weakly Rigid Power -/
def necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn

/-- `necessary-tame-rigidity-r-implies-tame-rigidity-r`

□Tame Rigidity ⇒ Tame Rigidity -/
def necessary_tame_rigidity_r_implies_tame_rigidity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn

/-- `necessary-tractarianism-r-implies-necessary-barcan-r`

□Tractarianism ⇒ □BF -/
def necessary_tractarianism_r_implies_necessary_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `necessary-tractarianism-r-implies-tractarianism-r`

□Tractarianism ⇒ Tractarianism -/
def necessary_tractarianism_r_implies_tractarianism_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn

/-- `necessary-transversal-and-necessary-relational-choice-imply-necessary-transversal-choice`

□Transversal ∧ □Relational Choice ⇒ □Transversal Choice -/
def necessary_transversal_and_necessary_relational_choice_imply_necessary_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn

/-- `necessary-transversal-choice-r-implies-necessary-relational-choice-r`

□Transversal Choice ⇒ □Relational Choice -/
def necessary_transversal_choice_r_implies_necessary_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn

/-- `necessary-transversal-choice-r-implies-necessary-transversal-r`

□Transversal Choice ⇒ □Transversal -/
def necessary_transversal_choice_r_implies_necessary_transversal_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn

/-- `necessary-transversal-choice-r-implies-necessary-well-ordering-r`

□Transversal Choice ⇒ □Well-Ordering -/
def necessary_transversal_choice_r_implies_necessary_well_ordering_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn

/-- `necessary-transversal-choice-r-implies-transversal-choice-r`

□Transversal Choice ⇒ Transversal Choice -/
def necessary_transversal_choice_r_implies_transversal_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `necessary-transversal-r-implies-transversal-r`

□Transversal ⇒ Transversal -/
def necessary_transversal_r_implies_transversal_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn

/-- `necessary-truth-implies-five-necessity-implies-truth-implies-five-necessity`

□Truths are 5-necessary ⇒ Truths are 5-necessary -/
def necessary_truth_implies_five_necessity_implies_truth_implies_five_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn

/-- `necessary-truth-implies-nd-implies-necessary-five-implies-nd`

□Truths are ND-necessary ⇒ □5-necessities are ND-necessary -/
def necessary_truth_implies_nd_implies_necessary_five_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn

/-- `necessary-truth-implies-nd-implies-necessary-truth-implies-five`

□Truths are ND-necessary ⇒ □Truths are 5-necessary -/
def necessary_truth_implies_nd_implies_necessary_truth_implies_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `necessary-truth-implies-two-hat-implies-five-implies-two-hat`

□Truths are two-hat necessary ⇒ □5-necessities are two-hat necessary -/
def necessary_truth_implies_two_hat_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-truth-implies-two-hat-implies-truth-implies-five`

□Truths are two-hat necessary ⇒ □Truths are 5-necessary -/
def necessary_truth_implies_two_hat_implies_truth_implies_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `necessary-truth-implies-two-hat-necessity-implies-truth-implies-two-hat-necessity`

□Truths are two-hat necessary ⇒ Truths are two-hat necessary -/
def necessary_truth_implies_two_hat_necessity_implies_truth_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesTwoHatNecessity.schemaIn

/-- `necessary-two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd`

□Two-hat necessities are ND-necessary ∧ □5-necessities are two-hat necessary ⇒ □5-necessities are ND-necessary -/
def necessary_two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn

/-- `necessary-two-hat-implies-nd-implies-necessary-five-implies-two-hat`

□Two-hat necessities are ND-necessary ⇒ □5-necessities are two-hat necessary -/
def necessary_two_hat_implies_nd_implies_necessary_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-two-hat-implies-nd-necessity-implies-two-hat-implies-nd-necessity`

□Two-hat necessities are ND-necessary ⇒ Two-hat necessities are ND-necessary -/
def necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- `necessary-vicinity-and-necessary-atomicity-t-imply-necessary-actuality`

□Vicinity ∧ □Atomicity (type t) ⇒ □Actuality -/
def necessary_vicinity_and_necessary_atomicity_t_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-vicinity-and-necessary-barcan-t-imply-necessary-two-hat-implies-nd`

□Vicinity ∧ □BF (type t) ⇒ □Two-hat necessities are ND-necessary -/
def necessary_vicinity_and_necessary_barcan_t_imply_necessary_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `necessary-vicinity-and-necessary-distinctness-preserving-collapse-imply-necessary-actuality`

□Vicinity ∧ □Truths are ND-necessary ⇒ □Actuality -/
def necessary_vicinity_and_necessary_distinctness_preserving_collapse_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecDistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-vicinity-and-necessary-relational-choice-imply-necessary-transversal-choice`

□Vicinity ∧ □Relational Choice ⇒ □Transversal Choice -/
def necessary_vicinity_and_necessary_relational_choice_imply_necessary_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn

/-- `necessary-vicinity-and-necessary-weakly-inextensible-comprehension-imply-necessary-actuality`

□Vicinity ∧ □Weakly Inextensible Comprehension ⇒ □Actuality -/
def necessary_vicinity_and_necessary_weakly_inextensible_comprehension_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-vicinity-boolean-completeness-t-and-relational-choice-imply-necessary-actuality`

□Vicinity ∧ □Boolean Completeness (type t) ∧ □Relational Choice ⇒ □Actuality -/
def necessary_vicinity_boolean_completeness_t_and_relational_choice_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `necessary-vicinity-implies-necessary-five-implies-two-hat`

□Vicinity ⇒ □5-necessities are two-hat necessary -/
def necessary_vicinity_implies_necessary_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `necessary-vicinity-implies-vicinity`

□Vicinity ⇒ Vicinity -/
def necessary_vicinity_implies_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn

/-- `necessary-weak-rigid-comprehension-implies-necessary-boolean-completeness`

□Weak Rigid Comprehension ⇒ □Boolean Completeness -/
def necessary_weak_rigid_comprehension_implies_necessary_boolean_completeness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn

/-- `necessary-weak-rigid-comprehension-implies-necessary-persistent-comprehension`

□Weak Rigid Comprehension ⇒ □Persistent Comprehension -/
def necessary_weak_rigid_comprehension_implies_necessary_persistent_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn

/-- `necessary-weak-rigid-comprehension-r-implies-weak-rigid-comprehension-r`

□Weak Rigid Comprehension ⇒ Weak Rigid Comprehension -/
def necessary_weak_rigid_comprehension_r_implies_weak_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn

/-- `necessary-weakly-inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r`

□Weakly Inextensible Comprehension ⇒ Weakly Inextensible Comprehension -/
def necessary_weakly_inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- `necessary-weakly-rigid-power-implies-necessary-rigid-power`

□Weakly Rigid Power ⇒ □Rigid Power -/
def necessary_weakly_rigid_power_implies_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `necessary-weakly-rigid-power-implies-necessary-tame-rigidity`

□Weakly Rigid Power ⇒ □Tame Rigidity -/
def necessary_weakly_rigid_power_implies_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `necessary-weakly-rigid-power-r-implies-weakly-rigid-power-r`

□Weakly Rigid Power ⇒ Weakly Rigid Power -/
def necessary_weakly_rigid_power_r_implies_weakly_rigid_power_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn

/-- `necessary-weakly-rigid-weak-rigidity-r-implies-weakly-rigid-weak-rigidity-r`

□Weakly Rigid Weak Rigidity ⇒ Weakly Rigid Weak Rigidity -/
def necessary_weakly_rigid_weak_rigidity_r_implies_weakly_rigid_weak_rigidity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidWeakRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn

/-- `necessary-well-ordering-and-intensional-choice-imply-modal-well-ordering`

□Well-Ordering ∧ Intensional Choice ⇒ Modal Well-Ordering -/
def necessary_well_ordering_and_intensional_choice_imply_modal_well_ordering : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn

/-- `necessary-well-ordering-r-implies-necessary-transversal-choice-r`

□Well-Ordering ⇒ □Transversal Choice -/
def necessary_well_ordering_r_implies_necessary_transversal_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn

/-- `necessary-well-ordering-r-implies-well-ordering-r`

□Well-Ordering ⇒ Well-Ordering -/
def necessary_well_ordering_r_implies_well_ordering_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WellOrdering.schemaIn

/-- `no-contingency-signature-incompatible-with-witnessed-possibility`

No Contingency (signature Σ) ∧ Witnessed Possibility ⇒ ⊥ -/
def no_contingency_signature_incompatible_with_witnessed_possibility : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `no-contingency-signature-r-implies-modal-freedom-signature-r`

No Contingency (signature Σ) ⇒ Modal Freedom (signature Σ) -/
def no_contingency_signature_r_implies_modal_freedom_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.modalFreedom _)

/-- `no-contingency-signature-r-implies-no-pure-contingency-r`

No Contingency (signature Σ) ⇒ No Pure Contingency -/
def no_contingency_signature_r_implies_no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `no-contingency-signature-r-implies-signature-b-r`

No Contingency (signature Σ) ⇒ B for sentences of Σ -/
def no_contingency_signature_r_implies_signature_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.signatureB _)

/-- `no-pure-contingency-and-actuality-imply-necessary-actuality`

No Pure Contingency ∧ Actuality ⇒ □Actuality -/
def no_pure_contingency_and_actuality_imply_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `no-pure-contingency-and-atomicity-imply-necessary-atomicity`

No Pure Contingency ∧ Atomicity ⇒ □Atomicity -/
def no_pure_contingency_and_atomicity_imply_necessary_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn

/-- `no-pure-contingency-and-atomicity-t-imply-necessary-atomicity-t`

No Pure Contingency ∧ Atomicity (type t) ⇒ □Atomicity (type t) -/
def no_pure_contingency_and_atomicity_t_imply_necessary_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityT.schemaIn

/-- `no-pure-contingency-and-atomlessness-imply-necessary-atomlessness`

No Pure Contingency ∧ Atomlessness ⇒ □Atomlessness -/
def no_pure_contingency_and_atomlessness_imply_necessary_atomlessness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn

/-- `no-pure-contingency-and-atoms-are-self-atoms-r-imply-necessary-atoms-are-self-atoms-r`

No Pure Contingency ∧ Atoms are self-atoms ⇒ □Atoms are self-atoms -/
def no_pure_contingency_and_atoms_are_self_atoms_r_imply_necessary_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtoms.schemaIn

/-- `no-pure-contingency-and-atoms-are-self-atoms-t-imply-necessary-atoms-are-self-atoms-t`

No Pure Contingency ∧ Atoms are self-atoms (type t) ⇒ □Atoms are self-atoms (type t) -/
def no_pure_contingency_and_atoms_are_self_atoms_t_imply_necessary_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn

/-- `no-pure-contingency-and-atoms-are-strong-atoms-r-imply-necessary-atoms-are-strong-atoms-r`

No Pure Contingency ∧ Atoms are strong atoms ⇒ □Atoms are strong atoms -/
def no_pure_contingency_and_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn

/-- `no-pure-contingency-and-atoms-are-strong-atoms-t-imply-necessary-atoms-are-strong-atoms-t`

No Pure Contingency ∧ Atoms are strong atoms (type t) ⇒ □Atoms are strong atoms (type t) -/
def no_pure_contingency_and_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn

/-- `no-pure-contingency-and-b-imply-necessary-b`

No Pure Contingency ∧ B ⇒ □B -/
def no_pure_contingency_and_b_imply_necessary_b : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn

/-- `no-pure-contingency-and-bf-imply-necessary-bf`

No Pure Contingency ∧ BF ⇒ □BF -/
def no_pure_contingency_and_bf_imply_necessary_bf : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `no-pure-contingency-and-bf-relational-imply-necessary-bf-relational`

No Pure Contingency ∧ BF (relational types) ⇒ □BF (relational types) -/
def no_pure_contingency_and_bf_relational_imply_necessary_bf_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn

/-- `no-pure-contingency-and-bf-t-imply-necessary-bf-t`

No Pure Contingency ∧ BF (type t) ⇒ □BF (type t) -/
def no_pure_contingency_and_bf_t_imply_necessary_bf_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn

/-- `no-pure-contingency-and-boolean-completeness-t-imply-necessary-boolean-completeness-t`

No Pure Contingency ∧ Boolean Completeness (type t) ⇒ □Boolean Completeness (type t) -/
def no_pure_contingency_and_boolean_completeness_t_imply_necessary_boolean_completeness_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn

/-- `no-pure-contingency-and-completeness-imply-necessary-completeness`

No Pure Contingency ∧ Boolean Completeness ⇒ □Boolean Completeness -/
def no_pure_contingency_and_completeness_imply_necessary_completeness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn

/-- `no-pure-contingency-and-countable-boolean-completeness-imply-necessary-countable-boolean-completeness`

No Pure Contingency ∧ Countable Boolean Completeness ⇒ □Countable Boolean Completeness -/
def no_pure_contingency_and_countable_boolean_completeness_imply_necessary_countable_boolean_completeness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.CountableBooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecCountableBooleanCompleteness.schemaIn

/-- `no-pure-contingency-and-extensionality-imply-necessary-extensionality`

No Pure Contingency ∧ Extensionality ⇒ □Extensionality -/
def no_pure_contingency_and_extensionality_imply_necessary_extensionality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecExtensionality.schemaIn

/-- `no-pure-contingency-and-five-implies-nd-necessity-imply-necessary-five-implies-nd-necessity`

No Pure Contingency ∧ 5-necessities are ND-necessary ⇒ □5-necessities are ND-necessary -/
def no_pure_contingency_and_five_implies_nd_necessity_imply_necessary_five_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesNdNecessity.schemaIn

/-- `no-pure-contingency-and-five-implies-two-hat-necessity-imply-necessary-five-implies-two-hat-necessity`

No Pure Contingency ∧ 5-necessities are two-hat necessary ⇒ □5-necessities are two-hat necessary -/
def no_pure_contingency_and_five_implies_two_hat_necessity_imply_necessary_five_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFiveImpliesTwoHatNecessity.schemaIn

/-- `no-pure-contingency-and-five-imply-necessary-five`

No Pure Contingency ∧ 5 ⇒ □5 -/
def no_pure_contingency_and_five_imply_necessary_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn

/-- `no-pure-contingency-and-fregean-imply-necessary-fregean`

No Pure Contingency ∧ Fregean Axiom ⇒ □Fregean Axiom -/
def no_pure_contingency_and_fregean_imply_necessary_fregean : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FregeanAxiom.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFregeanAxiom.schemaIn

/-- `no-pure-contingency-and-functional-choice-imply-necessary-functional-choice`

No Pure Contingency ∧ Functional Choice ⇒ □Functional Choice -/
def no_pure_contingency_and_functional_choice_imply_necessary_functional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn

/-- `no-pure-contingency-and-functionality-imply-necessary-functionality`

No Pure Contingency ∧ Functionality ⇒ □Functionality -/
def no_pure_contingency_and_functionality_imply_necessary_functionality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn

/-- `no-pure-contingency-and-gallin-comprehension-imply-necessary-gallin-comprehension`

No Pure Contingency ∧ Gallin Extensional Comprehension ⇒ □Gallin Extensional Comprehension -/
def no_pure_contingency_and_gallin_comprehension_imply_necessary_gallin_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.GallinExtensionalComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecGallinExtensionalComprehension.schemaIn

/-- `no-pure-contingency-and-inextensible-comprehension-imply-necessary-inextensible-comprehension`

No Pure Contingency ∧ Inextensible Comprehension ⇒ □Inextensible Comprehension -/
def no_pure_contingency_and_inextensible_comprehension_imply_necessary_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecInextensibleComprehension.schemaIn

/-- `no-pure-contingency-and-intensional-choice-imply-necessary-intensional-choice`

No Pure Contingency ∧ Intensional Choice ⇒ □Intensional Choice -/
def no_pure_contingency_and_intensional_choice_imply_necessary_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn

/-- `no-pure-contingency-and-modalized-relational-choice-imply-necessary-modalized-relational-choice`

No Pure Contingency ∧ Modalized Relational Choice ⇒ □Modalized Relational Choice -/
def no_pure_contingency_and_modalized_relational_choice_imply_necessary_modalized_relational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalizedRelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalizedRelationalChoice.schemaIn

/-- `no-pure-contingency-and-nd-imply-necessary-nd`

No Pure Contingency ∧ ND ⇒ □ND -/
def no_pure_contingency_and_nd_imply_necessary_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `no-pure-contingency-and-nd-t-imply-necessary-nd-t`

No Pure Contingency ∧ ND (type t) ⇒ □ND (type t) -/
def no_pure_contingency_and_nd_t_imply_necessary_nd_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn

/-- `no-pure-contingency-and-persistent-comprehension-imply-necessary-persistent-comprehension`

No Pure Contingency ∧ Persistent Comprehension ⇒ □Persistent Comprehension -/
def no_pure_contingency_and_persistent_comprehension_imply_necessary_persistent_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPersistentComprehension.schemaIn

/-- `no-pure-contingency-and-plenitude-imply-necessary-plenitude`

No Pure Contingency ∧ Plenitude ⇒ □Plenitude -/
def no_pure_contingency_and_plenitude_imply_necessary_plenitude : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn

/-- `no-pure-contingency-and-relational-choice-imply-necessaryelational-choice`

No Pure Contingency ∧ Relational Choice ⇒ □Relational Choice -/
def no_pure_contingency_and_relational_choice_imply_necessaryelational_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn

/-- `no-pure-contingency-and-rigid-comprehension-imply-necessary-rigid-comprehension`

No Pure Contingency ∧ Rigid Comprehension ⇒ □Rigid Comprehension -/
def no_pure_contingency_and_rigid_comprehension_imply_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `no-pure-contingency-and-rigid-power-imply-necessary-rigid-power`

No Pure Contingency ∧ Rigid Power ⇒ □Rigid Power -/
def no_pure_contingency_and_rigid_power_imply_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `no-pure-contingency-and-self-atomicity-r-imply-necessary-self-atomicity-r`

No Pure Contingency ∧ Self-Atomicity ⇒ □Self-Atomicity -/
def no_pure_contingency_and_self_atomicity_r_imply_necessary_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicity.schemaIn

/-- `no-pure-contingency-and-self-atomicity-t-imply-necessary-self-atomicity-t`

No Pure Contingency ∧ Self-Atomicity (type t) ⇒ □Self-Atomicity (type t) -/
def no_pure_contingency_and_self_atomicity_t_imply_necessary_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomicityT.schemaIn

/-- `no-pure-contingency-and-self-atoms-are-atoms-r-imply-necessary-self-atoms-are-atoms-r`

No Pure Contingency ∧ Self-atoms are atoms ⇒ □Self-atoms are atoms -/
def no_pure_contingency_and_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn

/-- `no-pure-contingency-and-self-atoms-are-atoms-t-imply-necessary-self-atoms-are-atoms-t`

No Pure Contingency ∧ Self-atoms are atoms (type t) ⇒ □Self-atoms are atoms (type t) -/
def no_pure_contingency_and_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn

/-- `no-pure-contingency-and-self-atoms-are-strong-atoms-r-imply-necessary-self-atoms-are-strong-atoms-r`

No Pure Contingency ∧ Self-atoms are strong atoms ⇒ □Self-atoms are strong atoms -/
def no_pure_contingency_and_self_atoms_are_strong_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn

/-- `no-pure-contingency-and-self-atoms-are-strong-atoms-t-imply-necessary-self-atoms-are-strong-atoms-t`

No Pure Contingency ∧ Self-atoms are strong atoms (type t) ⇒ □Self-atoms are strong atoms (type t) -/
def no_pure_contingency_and_self_atoms_are_strong_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn

/-- `no-pure-contingency-and-strong-actuality-imply-necessary-strong-actuality`

No Pure Contingency ∧ Strong Actuality ⇒ □Strong Actuality -/
def no_pure_contingency_and_strong_actuality_imply_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `no-pure-contingency-and-strong-atomicity-imply-necessary-strong-atomicity`

No Pure Contingency ∧ Strong Atomicity ⇒ □Strong Atomicity -/
def no_pure_contingency_and_strong_atomicity_imply_necessary_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `no-pure-contingency-and-strong-atomicity-t-imply-necessary-strong-atomicity-t`

No Pure Contingency ∧ Strong Atomicity (type t) ⇒ □Strong Atomicity (type t) -/
def no_pure_contingency_and_strong_atomicity_t_imply_necessary_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn

/-- `no-pure-contingency-and-tame-rigidity-imply-necessary-tame-rigidity`

No Pure Contingency ∧ Tame Rigidity ⇒ □Tame Rigidity -/
def no_pure_contingency_and_tame_rigidity_imply_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `no-pure-contingency-and-tractarianism-imply-necessary-tractarianism`

No Pure Contingency ∧ Tractarianism ⇒ □Tractarianism -/
def no_pure_contingency_and_tractarianism_imply_necessary_tractarianism : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn

/-- `no-pure-contingency-and-transversal-choice-imply-necessary-transversal-choice`

No Pure Contingency ∧ Transversal Choice ⇒ □Transversal Choice -/
def no_pure_contingency_and_transversal_choice_imply_necessary_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn

/-- `no-pure-contingency-and-transversal-imply-necessary-transversal`

No Pure Contingency ∧ Transversal ⇒ □Transversal -/
def no_pure_contingency_and_transversal_imply_necessary_transversal : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn

/-- `no-pure-contingency-and-truth-implies-five-necessity-imply-necessary-truth-implies-five-necessity`

No Pure Contingency ∧ Truths are 5-necessary ⇒ □Truths are 5-necessary -/
def no_pure_contingency_and_truth_implies_five_necessity_imply_necessary_truth_implies_five_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `no-pure-contingency-and-truth-implies-two-hat-necessity-imply-necessary-truth-implies-two-hat-necessity`

No Pure Contingency ∧ Truths are two-hat necessary ⇒ □Truths are two-hat necessary -/
def no_pure_contingency_and_truth_implies_two_hat_necessity_imply_necessary_truth_implies_two_hat_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesTwoHatNecessity.schemaIn

/-- `no-pure-contingency-and-two-hat-implies-nd-necessity-imply-necessary-two-hat-implies-nd-necessity`

No Pure Contingency ∧ Two-hat necessities are ND-necessary ⇒ □Two-hat necessities are ND-necessary -/
def no_pure_contingency_and_two_hat_implies_nd_necessity_imply_necessary_two_hat_implies_nd_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `no-pure-contingency-and-vicinity-imply-necessary-vicinity`

No Pure Contingency ∧ Vicinity ⇒ □Vicinity -/
def no_pure_contingency_and_vicinity_imply_necessary_vicinity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecVicinity.schemaIn

/-- `no-pure-contingency-and-weak-rigid-comprehension-imply-necessary-weak-rigid-comprehension`

No Pure Contingency ∧ Weak Rigid Comprehension ⇒ □Weak Rigid Comprehension -/
def no_pure_contingency_and_weak_rigid_comprehension_imply_necessary_weak_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn

/-- `no-pure-contingency-and-weakly-inextensible-comprehension-imply-necessary-weakly-inextensible-comprehension`

No Pure Contingency ∧ Weakly Inextensible Comprehension ⇒ □Weakly Inextensible Comprehension -/
def no_pure_contingency_and_weakly_inextensible_comprehension_imply_necessary_weakly_inextensible_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `no-pure-contingency-and-weakly-rigid-power-imply-necessary-weakly-rigid-power`

No Pure Contingency ∧ Weakly Rigid Power ⇒ □Weakly Rigid Power -/
def no_pure_contingency_and_weakly_rigid_power_imply_necessary_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidPower.schemaIn

/-- `no-pure-contingency-and-well-ordering-imply-necessary-well-ordering`

No Pure Contingency ∧ Well-Ordering ⇒ □Well-Ordering -/
def no_pure_contingency_and_well_ordering_imply_necessary_well_ordering : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn

/-- `no-pure-contingency-implies-necessity-of-arithmetic`

No Pure Contingency ⇒ Necessity of Arithmetic -/
def no_pure_contingency_implies_necessity_of_arithmetic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.ofPure Classicism.Meta.AxiomSet.necessityOfArithmetic)

/-- `no-pure-contingency-r-implies-converse-witnessed-possibility-r`

No Pure Contingency ⇒ Converse Witnessed Possibility -/
def no_pure_contingency_r_implies_converse_witnessed_possibility_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.converseWitnessedPossibility _)

/-- `no-pure-contingency-r-implies-pure-b-r`

No Pure Contingency ⇒ B for pure sentences -/
def no_pure_contingency_r_implies_pure_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `persistent-comprehension-r-implies-actuality`

Persistent Comprehension ⇒ Actuality -/
def persistent_comprehension_r_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `plenitude-r-implies-actuality`

Plenitude ⇒ Actuality -/
def plenitude_r_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `plenitude-r-implies-distinctness-necessary-r`

Plenitude ⇒ ND -/
def plenitude_r_implies_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn

/-- `possibility-and-countable-boolean-completeness-incompatible`

Maximalism (pure) ∧ Countable Boolean Completeness ⇒ ⊥ -/
def possibility_and_countable_boolean_completeness_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.CountableBooleanCompleteness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-atoms-are-self-atoms-t-incompatible`

Maximalism (pure) ∧ □Atoms are self-atoms (type t) ⇒ ⊥ -/
def possibility_and_necessary_atoms_are_self_atoms_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreSelfAtomsT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-atoms-are-strong-atoms-t-incompatible`

Maximalism (pure) ∧ □Atoms are strong atoms (type t) ⇒ ⊥ -/
def possibility_and_necessary_atoms_are_strong_atoms_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtomsT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-barcan-t-incompatible`

Maximalism (pure) ∧ □BF (type t) ⇒ ⊥ -/
def possibility_and_necessary_barcan_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-intensional-choice-incompatible`

Maximalism (pure) ∧ □Intensional Choice ⇒ ⊥ -/
def possibility_and_necessary_intensional_choice_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-relational-choice-incompatible`

Maximalism (pure) ∧ □Relational Choice ⇒ ⊥ -/
def possibility_and_necessary_relational_choice_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-rigid-power-incompatible`

Maximalism (pure) ∧ □Rigid Power ⇒ ⊥ -/
def possibility_and_necessary_rigid_power_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-self-atoms-are-atoms-t-incompatible`

Maximalism (pure) ∧ □Self-atoms are atoms (type t) ⇒ ⊥ -/
def possibility_and_necessary_self_atoms_are_atoms_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtomsT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-self-atoms-are-strong-atoms-t-incompatible`

Maximalism (pure) ∧ □Self-atoms are strong atoms (type t) ⇒ ⊥ -/
def possibility_and_necessary_self_atoms_are_strong_atoms_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtomsT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessary-strong-atomicity-t-incompatible`

Maximalism (pure) ∧ □Strong Atomicity (type t) ⇒ ⊥ -/
def possibility_and_necessary_strong_atomicity_t_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-necessity-of-arithmetic-incompatible`

Maximalism (pure) ∧ Necessity of Arithmetic ⇒ ⊥ -/
def possibility_and_necessity_of_arithmetic_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.ofPure Classicism.Meta.AxiomSet.necessityOfArithmetic) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-and-no-pure-contingency-incompatible`

Maximalism (pure) ∧ No Pure Contingency ⇒ ⊥ -/
def possibility_and_no_pure_contingency_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `possibility-plus-r-implies-possibility-schema-r`

Possibility+ (pure) ⇒ Maximalism (pure) -/
def possibility_plus_r_implies_possibility_schema_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.possibilityPlus) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC)

/-- `possibility-plus-signature-r-implies-possibility-plus-r`

Possibility+ (signature Σ) ⇒ Possibility+ (pure) -/
def possibility_plus_signature_r_implies_possibility_plus_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possibilityPlusSig _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.possibilityPlus)

/-- `possibility-plus-signature-r-implies-possibility-signature-r`

Possibility+ (signature Σ) ⇒ Maximalism (signature Σ) -/
def possibility_plus_signature_r_implies_possibility_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possibilityPlusSig _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `possibility-schema-r-implies-possible-infinity-e`

Maximalism (pure) ⇒ Possible Infinity (type e) -/
def possibility_schema_r_implies_possible_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn

/-- `possibility-schema-r-implies-possible-infinity-t`

Maximalism (pure) ⇒ Possible Infinity (type t) -/
def possibility_schema_r_implies_possible_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn

/-- `possibility-signature-r-implies-witnessed-possibility-r`

Maximalism (signature Σ) ⇒ Witnessed Possibility -/
def possibility_signature_r_implies_witnessed_possibility_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _)

/-- `possible-infinity-e-and-bf-imply-axiom-of-infinity-e`

Possible Infinity (type e) ∧ BF ⇒ Axiom of Infinity (type e) -/
def possible_infinity_e_and_bf_imply_axiom_of_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn

/-- `possible-infinity-e-and-no-pure-contingency-imply-axiom-of-infinity-e`

Possible Infinity (type e) ∧ No Pure Contingency ⇒ Axiom of Infinity (type e) -/
def possible_infinity_e_and_no_pure_contingency_imply_axiom_of_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn

/-- `possible-infinity-e-implies-axiom-of-infinity-e`  (conjectured)

Possible Infinity (type e) ⇒ Axiom of Infinity (type e) -/
def possible_infinity_e_implies_axiom_of_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn

/-- `possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t`

Possible Infinity (type t) ∧ BF (type t) ⇒ Axiom of Infinity (type t) -/
def possible_infinity_t_and_bf_t_imply_axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn

/-- `possible-infinity-t-and-no-pure-contingency-imply-axiom-of-infinity-t`

Possible Infinity (type t) ∧ No Pure Contingency ⇒ Axiom of Infinity (type t) -/
def possible_infinity_t_and_no_pure_contingency_imply_axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn

/-- `possible-infinity-t-implies-axiom-of-infinity-t`  (conjectured)

Possible Infinity (type t) ⇒ Axiom of Infinity (type t) -/
def possible_infinity_t_implies_axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn

/-- `possibly-witnessed-possibility-r-implies-separated-structure-r`

Possibly Witnessed Possibility ⇒ Separated Structure -/
def possibly_witnessed_possibility_r_implies_separated_structure_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _)

/-- `possibly-witnessed-possibility-r-implies-witnessed-possibility-r`

Possibly Witnessed Possibility ⇒ Witnessed Possibility -/
def possibly_witnessed_possibility_r_implies_witnessed_possibility_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _)

/-- `pure-b-and-pure-possibility-incompatible`

B for pure sentences ∧ Maximalism (pure) ⇒ ⊥ -/
def pure_b_and_pure_possibility_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `pure-distinctness-and-separated-structure-imply-signature-distinctness`

Maximalism (pure) ∧ Separated Structure ⇒ Maximalism (signature Σ) -/
def pure_distinctness_and_separated_structure_imply_signature_distinctness : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `pure-distinctness-implies-infinity-t`

Maximalism (pure) ⇒ Infinity Schema (type t) -/
def pure_distinctness_implies_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `pure-possibility-implies-axiom-of-infinity-t`

Maximalism (pure) ⇒ Axiom of Infinity (type t) -/
def pure_possibility_implies_axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn

/-- `relational-choice-and-boolean-completeness-imply-actuality`

Relational Choice ∧ Boolean Completeness ⇒ Actuality -/
def relational_choice_and_boolean_completeness_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `relational-choice-and-boolean-completeness-imply-transversal-choice`  (conjectured)

Relational Choice ∧ Boolean Completeness ⇒ Transversal Choice -/
def relational_choice_and_boolean_completeness_imply_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `relational-choice-and-extensionality-imply-transversal-choice`

Relational Choice ∧ Extensionality ⇒ Transversal Choice -/
def relational_choice_and_extensionality_imply_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Extensionality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `relational-choice-and-plenitude-imply-functional-choice-r`

Relational Choice ∧ Plenitude ⇒ Functional Choice -/
def relational_choice_and_plenitude_imply_functional_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn

/-- `relational-choice-and-weak-rigid-comprehension-imply-transversal-choice`

Relational Choice ∧ Weak Rigid Comprehension ⇒ Transversal Choice -/
def relational_choice_and_weak_rigid_comprehension_imply_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `relational-choice-r-implies-transversal-choice-r`  (conjectured)

Relational Choice ⇒ Transversal Choice -/
def relational_choice_r_implies_transversal_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `rigid-comprehension-and-bf-imply-necessary-bf`

Rigid Comprehension ∧ BF ⇒ □BF -/
def rigid_comprehension_and_bf_imply_necessary_bf : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `rigid-comprehension-and-bf-t-imply-necessary-bf-t`

Rigid Comprehension ∧ BF (type t) ⇒ □BF (type t) -/
def rigid_comprehension_and_bf_t_imply_necessary_bf_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn

/-- `rigid-comprehension-implies-tame-rigidity`

Rigid Comprehension ⇒ Tame Rigidity -/
def rigid_comprehension_implies_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn

/-- `rigid-comprehension-r-implies-actuality`

Rigid Comprehension ⇒ Actuality -/
def rigid_comprehension_r_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `rigid-comprehension-r-implies-boolean-completeness-r`

Rigid Comprehension ⇒ Boolean Completeness -/
def rigid_comprehension_r_implies_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn

/-- `rigid-comprehension-r-implies-inextensible-comprehension-r`

Rigid Comprehension ⇒ Inextensible Comprehension -/
def rigid_comprehension_r_implies_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.InextensibleComprehension.schemaIn

/-- `rigid-comprehension-r-implies-persistent-comprehension-r`

Rigid Comprehension ⇒ Persistent Comprehension -/
def rigid_comprehension_r_implies_persistent_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn

/-- `rigid-comprehension-r-implies-weak-rigid-comprehension-r`

Rigid Comprehension ⇒ Weak Rigid Comprehension -/
def rigid_comprehension_r_implies_weak_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn

/-- `rigid-rigidity-and-necessary-tame-rigidity-imply-weakly-rigid-weak-rigidity`

Rigid Rigidity ∧ □Tame Rigidity ⇒ Weakly Rigid Weak Rigidity -/
def rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn

/-- `rigid-rigidity-and-rigid-power-imply-necessary-rigid-power`

Rigid Rigidity ∧ Rigid Power ⇒ □Rigid Power -/
def rigid_rigidity_and_rigid_power_imply_necessary_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidPower.schemaIn

/-- `rigid-rigidity-implies-necessary-barcan`

Rigid Rigidity ⇒ □BF -/
def rigid_rigidity_implies_necessary_barcan : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `rigid-rigidity-implies-necessary-rigid-rigidity`

Rigid Rigidity ⇒ □Rigid Rigidity -/
def rigid_rigidity_implies_necessary_rigid_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidRigidity.schemaIn

/-- `rigid-rigidity-implies-rigid-power`  (conjectured)

Rigid Rigidity ⇒ Rigid Power -/
def rigid_rigidity_implies_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn

/-- `self-atomicity-atomicity-t-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice`

Self-Atomicity ∧ Atomicity (type t) ∧ Weak Rigid Comprehension ∧ Relational Choice ⇒ Intensional Choice -/
def self_atomicity_atomicity_t_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `self-atomicity-r-and-self-atoms-are-atoms-r-imply-atomicity-r`

Self-Atomicity ∧ Self-atoms are atoms ⇒ Atomicity -/
def self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `self-atomicity-r-and-self-atoms-are-strong-atoms-r-imply-strong-atomicity-r`

Self-Atomicity ∧ Self-atoms are strong atoms ⇒ Strong Atomicity -/
def self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn

/-- `self-atomicity-r-implies-atoms-are-self-atoms-r`

Self-Atomicity ⇒ Atoms are self-atoms -/
def self_atomicity_r_implies_atoms_are_self_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtoms.schemaIn

/-- `self-atomicity-r-implies-self-atomicity-t`

Self-Atomicity ⇒ Self-Atomicity (type t) -/
def self_atomicity_r_implies_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `self-atomicity-t-and-bf-imply-self-atomicity-r`

Self-Atomicity (type t) ∧ BF ⇒ Self-Atomicity -/
def self_atomicity_t_and_bf_imply_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn

/-- `self-atomicity-t-and-self-atoms-are-atoms-t-imply-atomicity-t`

Self-Atomicity (type t) ∧ Self-atoms are atoms (type t) ⇒ Atomicity (type t) -/
def self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn

/-- `self-atomicity-t-and-self-atoms-are-strong-atoms-t-imply-strong-atomicity-t`

Self-Atomicity (type t) ∧ Self-atoms are strong atoms (type t) ⇒ Strong Atomicity (type t) -/
def self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn

/-- `self-atomicity-t-implies-atoms-are-self-atoms-t`

Self-Atomicity (type t) ⇒ Atoms are self-atoms (type t) -/
def self_atomicity_t_implies_atoms_are_self_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `self-atomicity-t-implies-necessary-actuality`

Self-Atomicity (type t) ⇒ □Actuality -/
def self_atomicity_t_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `self-atomicity-t-implies-two-hat-implies-nd`

Self-Atomicity (type t) ⇒ Two-hat necessities are ND-necessary -/
def self_atomicity_t_implies_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- `self-atoms-are-atoms-r-implies-self-atoms-are-atoms-t`

Self-atoms are atoms ⇒ Self-atoms are atoms (type t) -/
def self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn

/-- `self-atoms-are-atoms-t-and-bf-imply-self-atoms-are-atoms-r`

Self-atoms are atoms (type t) ∧ BF ⇒ Self-atoms are atoms -/
def self_atoms_are_atoms_t_and_bf_imply_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn

/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-atoms-r`

Self-atoms are strong atoms ⇒ Self-atoms are atoms -/
def self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtoms.schemaIn

/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-t`

Self-atoms are strong atoms ⇒ Self-atoms are strong atoms (type t) -/
def self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn

/-- `self-atoms-are-strong-atoms-t-and-bf-imply-self-atoms-are-strong-atoms-r`

Self-atoms are strong atoms (type t) ∧ BF ⇒ Self-atoms are strong atoms -/
def self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtoms.schemaIn

/-- `self-atoms-are-strong-atoms-t-implies-self-atoms-are-atoms-t`

Self-atoms are strong atoms (type t) ⇒ Self-atoms are atoms (type t) -/
def self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn

/-- `separated-structure-incompatible-with-nd`

Separated Structure ∧ ND ⇒ ⊥ -/
def separated_structure_incompatible_with_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `separated-structure-r-implies-independence-signature-r`

Separated Structure ⇒ Independence (signature Σ) -/
def separated_structure_r_implies_independence_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.independence _)

/-- `separated-structure-r-implies-possibly-witnessed-possibility-r`

Separated Structure ⇒ Possibly Witnessed Possibility -/
def separated_structure_r_implies_possibly_witnessed_possibility_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _)

/-- `signature-b-and-witnessed-possibility-incompatible`

B for sentences of Σ ∧ Witnessed Possibility ⇒ ⊥ -/
def signature_b_and_witnessed_possibility_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.signatureB _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `signature-b-r-implies-pure-b-r`

B for sentences of Σ ⇒ B for pure sentences -/
def signature_b_r_implies_pure_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.signatureB _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `strong-actuality-implies-actuality`

Strong Actuality ⇒ Actuality -/
def strong_actuality_implies_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `strong-atomicity-and-rigid-comprehension-imply-necessary-rigid-comprehension`

Strong Atomicity ∧ Rigid Comprehension ⇒ □Rigid Comprehension -/
def strong_atomicity_and_rigid_comprehension_imply_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `strong-atomicity-and-rigid-comprehension-imply-necessary-strong-atomicity`

Strong Atomicity ∧ Rigid Comprehension ⇒ □Strong Atomicity -/
def strong_atomicity_and_rigid_comprehension_imply_necessary_strong_atomicity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn

/-- `strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational`

Strong Atomicity ∧ □Rigid Comprehension ∧ Rigid Power ⇒ BF (relational types) -/
def strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn

/-- `strong-atomicity-r-implies-atomicity-r`

Strong Atomicity ⇒ Atomicity -/
def strong_atomicity_r_implies_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn

/-- `strong-atomicity-r-implies-atoms-are-strong-atoms-r`

Strong Atomicity ⇒ Atoms are strong atoms -/
def strong_atomicity_r_implies_atoms_are_strong_atoms_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtoms.schemaIn

/-- `strong-atomicity-r-implies-self-atomicity-r`

Strong Atomicity ⇒ Self-Atomicity -/
def strong_atomicity_r_implies_self_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicity.schemaIn

/-- `strong-atomicity-r-implies-strong-atomicity-t`

Strong Atomicity ⇒ Strong Atomicity (type t) -/
def strong_atomicity_r_implies_strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn

/-- `strong-atomicity-t-implies-atomicity-t`

Strong Atomicity (type t) ⇒ Atomicity (type t) -/
def strong_atomicity_t_implies_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn

/-- `strong-atomicity-t-implies-atoms-are-strong-atoms-t`

Strong Atomicity (type t) ⇒ Atoms are strong atoms (type t) -/
def strong_atomicity_t_implies_atoms_are_strong_atoms_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomsAreStrongAtomsT.schemaIn

/-- `strong-atomicity-t-implies-necessary-actuality`

Strong Atomicity (type t) ⇒ □Actuality -/
def strong_atomicity_t_implies_necessary_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn

/-- `strong-atomicity-t-implies-necessary-strong-actuality`

Strong Atomicity (type t) ⇒ □Strong Actuality -/
def strong_atomicity_t_implies_necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongActuality.schemaIn

/-- `strong-atomicity-t-implies-self-atomicity-t`

Strong Atomicity (type t) ⇒ Self-Atomicity (type t) -/
def strong_atomicity_t_implies_self_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `strong-atomicity-t-implies-strong-actuality`

Strong Atomicity (type t) ⇒ Strong Actuality -/
def strong_atomicity_t_implies_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn

/-- `strong-atomicity-t-implies-two-hat-implies-nd`

Strong Atomicity (type t) ⇒ Two-hat necessities are ND-necessary -/
def strong_atomicity_t_implies_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- `strong-atomicity-t-necessary-rigid-comprehension-and-rigid-power-imply-bf-t`

Strong Atomicity (type t) ∧ □Rigid Comprehension ∧ Rigid Power ⇒ BF (type t) -/
def strong_atomicity_t_necessary_rigid_comprehension_and_rigid_power_imply_bf_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn

/-- `strong-atomicity-t-rigid-comprehension-and-barcan-relational-imply-necessary-rigid-comprehension`

Strong Atomicity (type t) ∧ Rigid Comprehension ∧ BF (relational types) ⇒ □Rigid Comprehension -/
def strong_atomicity_t_rigid_comprehension_and_barcan_relational_imply_necessary_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn

/-- `strong-atomicity-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice`

Strong Atomicity ∧ Weak Rigid Comprehension ∧ Relational Choice ⇒ Intensional Choice -/
def strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.IntensionalChoice.schemaIn

/-- `strong-possibility-and-distinctness-preserving-collapse-incompatible`

Strong Possibility (pure) ∧ Truths are ND-necessary ⇒ ⊥ -/
def strong_possibility_and_distinctness_preserving_collapse_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-and-infinity-e-incompatible`

Strong Possibility (pure) ∧ Infinity Schema (type e) ⇒ ⊥ -/
def strong_possibility_and_infinity_e_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE) →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-and-strong-actuality-incompatible`

Strong Possibility (pure) ∧ Strong Actuality ⇒ ⊥ -/
def strong_possibility_and_strong_actuality_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongActuality.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-and-two-hat-implies-nd-incompatible`

Strong Possibility (pure) ∧ Two-hat necessities are ND-necessary ⇒ ⊥ -/
def strong_possibility_and_two_hat_implies_nd_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-incompatible-with-barcan-t`

Strong Possibility (pure) ∧ BF (type t) ⇒ ⊥ -/
def strong_possibility_incompatible_with_barcan_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-r-implies-possibility-schema-r`

Strong Possibility (pure) ⇒ Maximalism (pure) -/
def strong_possibility_r_implies_possibility_schema_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.strongPossibility) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC)

/-- `strong-possibility-signature-and-distinctness-preserving-collapse-incompatible`

Strong Possibility (signature Σ) ∧ Truths are ND-necessary ⇒ ⊥ -/
def strong_possibility_signature_and_distinctness_preserving_collapse_incompatible : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.strongPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `strong-possibility-signature-r-implies-possibility-signature-r`

Strong Possibility (signature Σ) ⇒ Maximalism (signature Σ) -/
def strong_possibility_signature_r_implies_possibility_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.strongPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `tame-rigidity-and-barcan-imply-necessary-barcan`

Tame Rigidity ∧ BF ⇒ □BF -/
def tame_rigidity_and_barcan_imply_necessary_barcan : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn

/-- `tame-rigidity-and-bf-relational-imply-necessary-bf-relational`

Tame Rigidity ∧ BF (relational types) ⇒ □BF (relational types) -/
def tame_rigidity_and_bf_relational_imply_necessary_bf_relational : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanRelational.schemaIn

/-- `tame-rigidity-and-bf-t-imply-necessary-bf-t`

Tame Rigidity ∧ BF (type t) ⇒ □BF (type t) -/
def tame_rigidity_and_bf_t_imply_necessary_bf_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn

/-- `tame-rigidity-and-rigid-power-imply-weakly-rigid-power`  (conjectured)

Tame Rigidity ∧ Rigid Power ⇒ Weakly Rigid Power -/
def tame_rigidity_and_rigid_power_imply_weakly_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn

/-- `tame-rigidity-and-weak-rigid-comprehension-imply-rigid-comprehension`

Tame Rigidity ∧ Weak Rigid Comprehension ⇒ Rigid Comprehension -/
def tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn

/-- `tractarianism-r-implies-barcan-r`

Tractarianism ⇒ BF -/
def tractarianism_r_implies_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn

/-- `transversal-and-relational-choice-imply-transversal-choice`

Transversal ∧ Relational Choice ⇒ Transversal Choice -/
def transversal_and_relational_choice_imply_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `transversal-choice-r-implies-relational-choice-r`

Transversal Choice ⇒ Relational Choice -/
def transversal_choice_r_implies_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn

/-- `transversal-choice-r-implies-transversal-r`

Transversal Choice ⇒ Transversal -/
def transversal_choice_r_implies_transversal_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn

/-- `transversal-choice-r-implies-zorn-r`

Transversal Choice ⇒ Zorn's Lemma -/
def transversal_choice_r_implies_zorn_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Zorn.schemaIn

/-- `truth-implies-nd-implies-five-implies-nd`

Truths are ND-necessary ⇒ 5-necessities are ND-necessary -/
def truth_implies_nd_implies_five_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn

/-- `truth-implies-nd-implies-truth-implies-five`

Truths are ND-necessary ⇒ Truths are 5-necessary -/
def truth_implies_nd_implies_truth_implies_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn

/-- `truth-implies-two-hat-implies-five-implies-two-hat`

Truths are two-hat necessary ⇒ 5-necessities are two-hat necessary -/
def truth_implies_two_hat_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `truth-implies-two-hat-implies-truth-implies-five`

Truths are two-hat necessary ⇒ Truths are 5-necessary -/
def truth_implies_two_hat_implies_truth_implies_five : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TruthImpliesFiveNecessity.schemaIn

/-- `two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd`

Two-hat necessities are ND-necessary ∧ 5-necessities are two-hat necessary ⇒ 5-necessities are ND-necessary -/
def two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesNdNecessity.schemaIn

/-- `vicinity-and-atomicity-t-imply-actuality`

Vicinity ∧ Atomicity (type t) ⇒ Actuality -/
def vicinity_and_atomicity_t_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `vicinity-and-barcan-t-imply-five-implies-two-hat`

Vicinity ∧ BF (type t) ⇒ 5-necessities are two-hat necessary -/
def vicinity_and_barcan_t_imply_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `vicinity-and-barcan-t-imply-two-hat-implies-nd`

Vicinity ∧ BF (type t) ⇒ Two-hat necessities are ND-necessary -/
def vicinity_and_barcan_t_imply_two_hat_implies_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TwoHatImpliesNdNecessity.schemaIn

/-- `vicinity-and-distinctness-preserving-collapse-imply-actuality`

Vicinity ∧ Truths are ND-necessary ⇒ Actuality -/
def vicinity_and_distinctness_preserving_collapse_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `vicinity-and-relational-choice-imply-transversal-choice`

Vicinity ∧ Relational Choice ⇒ Transversal Choice -/
def vicinity_and_relational_choice_imply_transversal_choice : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `vicinity-and-weakly-inextensible-comprehension-imply-actuality`

Vicinity ∧ Weakly Inextensible Comprehension ⇒ Actuality -/
def vicinity_and_weakly_inextensible_comprehension_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `vicinity-boolean-completeness-t-and-relational-choice-imply-actuality`

Vicinity ∧ Boolean Completeness (type t) ∧ Relational Choice ⇒ Actuality -/
def vicinity_boolean_completeness_t_and_relational_choice_imply_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn

/-- `vicinity-implies-five-implies-two-hat`

Vicinity ⇒ 5-necessities are two-hat necessary -/
def vicinity_implies_five_implies_two_hat : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Vicinity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FiveImpliesTwoHatNecessity.schemaIn

/-- `weak-rigid-comprehension-and-nd-imply-plenitude`

Weak Rigid Comprehension ∧ ND ⇒ Plenitude -/
def weak_rigid_comprehension_and_nd_imply_plenitude : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn

/-- `weak-rigid-comprehension-r-implies-boolean-completeness-r`

Weak Rigid Comprehension ⇒ Boolean Completeness -/
def weak_rigid_comprehension_r_implies_boolean_completeness_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn

/-- `weak-rigid-comprehension-r-implies-persistent-comprehension-r`

Weak Rigid Comprehension ⇒ Persistent Comprehension -/
def weak_rigid_comprehension_r_implies_persistent_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PersistentComprehension.schemaIn

/-- `weak-rigid-comprehension-r-implies-weakly-inextensible-comprehension-r`

Weak Rigid Comprehension ⇒ Weakly Inextensible Comprehension -/
def weak_rigid_comprehension_r_implies_weakly_inextensible_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyInextensibleComprehension.schemaIn

/-- `weakly-rigid-power-implies-rigid-power`

Weakly Rigid Power ⇒ Rigid Power -/
def weakly_rigid_power_implies_rigid_power : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidPower.schemaIn

/-- `weakly-rigid-power-implies-tame-rigidity`

Weakly Rigid Power ⇒ Tame Rigidity -/
def weakly_rigid_power_implies_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidPower.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TameRigidity.schemaIn

/-- `weakly-rigid-weak-rigidity-implies-necessary-tame-rigidity`

Weakly Rigid Weak Rigidity ⇒ □Tame Rigidity -/
def weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTameRigidity.schemaIn

/-- `weakly-rigid-weak-rigidity-implies-necessary-weakly-rigid-weak-rigidity`

Weakly Rigid Weak Rigidity ⇒ □Weakly Rigid Weak Rigidity -/
def weakly_rigid_weak_rigidity_implies_necessary_weakly_rigid_weak_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeaklyRigidWeakRigidity.schemaIn

/-- `weakly-rigid-weak-rigidity-implies-rigid-rigidity`

Weakly Rigid Weak Rigidity ⇒ Rigid Rigidity -/
def weakly_rigid_weak_rigidity_implies_rigid_rigidity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeaklyRigidWeakRigidity.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidRigidity.schemaIn

/-- `well-ordering-r-implies-transversal-choice-r`

Well-Ordering ⇒ Transversal Choice -/
def well_ordering_r_implies_transversal_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn

/-- `well-ordering-weak-rigid-comprehension-and-bf-imply-modal-well-ordering`

Well-Ordering ∧ Weak Rigid Comprehension ∧ BF ⇒ Modal Well-Ordering -/
def well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WellOrdering.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalWellOrdering.schemaIn

/-- `witnessed-possibility-and-no-pure-contingency-imply-logical-necessity`

Witnessed Possibility ∧ No Pure Contingency ⇒ Logical Necessity -/
def witnessed_possibility_and_no_pure_contingency_imply_logical_necessity : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.logicalNecessity _)

/-- `witnessed-possibility-and-npc-imply-possibly-witnessed-possibility`

Witnessed Possibility ∧ No Pure Contingency ⇒ Possibly Witnessed Possibility -/
def witnessed_possibility_and_npc_imply_possibly_witnessed_possibility : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _)

/-- `witnessed-possibility-incompatible-with-nd`

Witnessed Possibility ∧ ND ⇒ ⊥ -/
def witnessed_possibility_incompatible_with_nd : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn →
    ¬ Classicism.Meta.AxiomSet.Consistent Ax

/-- `witnessed-possibility-r-implies-independence-signature-r`

Witnessed Possibility ⇒ Independence (signature Σ) -/
def witnessed_possibility_r_implies_independence_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) →
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.independence _)

/-- `zorn-r-implies-well-ordering-r`

Zorn's Lemma ⇒ Well-Ordering -/
def zorn_r_implies_well_ordering_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Zorn.schemaIn →
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WellOrdering.schemaIn

/-- `coalesced-all-finite-individual-domains`

Coalesced sum: root over all finite individual domains: a witness satisfying 13 principles
and violating 8. -/
def coalesced_all_finite_individual_domains : Prop :=
  ∃ (Sig : Classicism.Meta.Signature) (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig), Classicism.Meta.AxiomSet.Consistent Ax ∧ Classicism.Meta.AxiomSet.Complete Ax ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityE.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AxiomOfInfinityT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTruthImpliesFiveNecessity.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreStrongAtomsT.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.independence _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `coalesced-pinned-substitutions-one-world-root`

Coalesced sum: substitution arrows over a one-world component: a witness satisfying 2 principles
and violating 1. -/
def coalesced_pinned_substitutions_one_world_root : Prop :=
  ∃ (Sig : Classicism.Meta.Signature) (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig), Classicism.Meta.AxiomSet.Consistent Ax ∧ Classicism.Meta.AxiomSet.Complete Ax ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomsAreStrongAtoms.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomsAreAtomsT.schemaIn

/-- `coalesced-pinned-substitutions-truncations-root`

Coalesced sum: substitution arrows over the truncations model: a witness satisfying 3 principles
and violating 2. -/
def coalesced_pinned_substitutions_truncations_root : Prop :=
  ∃ (Sig : Classicism.Meta.Signature) (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig), Classicism.Meta.AxiomSet.Consistent Ax ∧ Classicism.Meta.AxiomSet.Complete Ax ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomlessness.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreAtoms.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecSelfAtomsAreStrongAtoms.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomlessness.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.SelfAtomicityT.schemaIn

/-- `stitched-cohen-coalesced-middle`

Stitched Cohen model with a coalesced middle world: a witness satisfying 5 principles
and violating 9. -/
def stitched_cohen_coalesced_middle : Prop :=
  ∃ (Sig : Classicism.Meta.Signature) (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig), Classicism.Meta.AxiomSet.Consistent Ax ∧ Classicism.Meta.AxiomSet.Complete Ax ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RigidComprehension.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessT.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanRelational.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.independence _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `ultraproduct-finite-full-s5`

Henkin ultraproduct: finite full S5 models, n worlds and n individuals: a witness satisfying 14 principles
and violating 6. -/
def ultraproduct_finite_full_s5 : Prop :=
  ∃ (Sig : Classicism.Meta.Signature) (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig), Classicism.Meta.AxiomSet.Consistent Ax ∧ Classicism.Meta.AxiomSet.Complete Ax ∧
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT) ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecIntensionalChoice.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecActuality.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRigidComprehension.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWellOrdering.schemaIn ∧
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) ∧
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE) ∧
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.noContingency _) ∧
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.signatureB _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityT.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax Classicism.P.PossibleInfinityE.schemaIn ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.witnessedPossibility _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.independence _) ∧
    ¬ Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `actuality`, variant `actual-profile`

Actuality ⇔ Actual Profile -/
def actuality.actual_profile : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Actuality.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ActualProfile.listSchemaIn

/-- `atomicity-r`, variant `dual`

Atomicity ⇔ Dual form -/
def atomicity_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Atomicity.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityDual.schemaIn

/-- `atomicity-t`, variant `dual`

Atomicity (type t) ⇔ Dual form -/
def atomicity_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.AtomicityTDual.schemaIn

/-- `barcan-r`, variant `polyadic`

BF ⇔ Polyadic form -/
def barcan_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.listSchemaIn

/-- `barcan-r`, variant `dual`

BF ⇔ Dual form -/
def barcan_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanDual.schemaIn

/-- `barcan-r`, variant `dual-polyadic`

BF ⇔ Dual polyadic form -/
def barcan_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanDual.listSchemaIn

/-- `barcan-r`, variant `universal-weakly-rigid`

BF ⇔ Weak rigidity of the universal property -/
def barcan_r.universal_weakly_rigid : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Barcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanUniversalWeaklyRigid.schemaIn

/-- `barcan-t`, variant `dual`

BF (type t) ⇔ Dual form -/
def barcan_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BarcanTDual.schemaIn

/-- `boolean-completeness-r`, variant `lub`

Boolean Completeness ⇔ Least-upper-bound form -/
def boolean_completeness_r.lub : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompleteness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessLUB.schemaIn

/-- `boolean-completeness-t`, variant `lub`

Boolean Completeness (type t) ⇔ Least-upper-bound form -/
def boolean_completeness_t.lub : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.BooleanCompletenessTLUB.schemaIn

/-- `distinctness-necessary-r`, variant `polyadic`

ND ⇔ Polyadic form -/
def distinctness_necessary_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.listSchemaIn

/-- `distinctness-necessary-r`, variant `dual`

ND ⇔ Dual form -/
def distinctness_necessary_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessDual.schemaIn

/-- `distinctness-necessary-r`, variant `dual-polyadic`

ND ⇔ Dual polyadic form -/
def distinctness_necessary_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessDual.listSchemaIn

/-- `distinctness-necessary-t`, variant `dual`

ND (type t) ⇔ Dual form -/
def distinctness_necessary_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecessityOfDistinctnessTDual.schemaIn

/-- `distinctness-preserving-collapse`, variant `dual`

Truths are ND-necessary ⇔ Dual form -/
def distinctness_preserving_collapse.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapse.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.DistinctnessPreservingCollapseDual.schemaIn

/-- `distinctness-schema-r`, variant `possibility`

Maximalism (pure) ⇔ Possibility form -/
def distinctness_schema_r.possibility : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC) ↔
      Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.possibilityC)

/-- `distinctness-signature-r`, variant `possibility`

Maximalism (signature Σ) ⇔ Possibility form -/
def distinctness_signature_r.possibility : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.distinctnessC _) ↔
      Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.possibilityC _)

/-- `functional-choice-r`, variant `polyadic`

Functional Choice ⇔ Polyadic form -/
def functional_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.FunctionalChoice.listSchemaIn

/-- `functionality-r`, variant `polyadic`

Functionality ⇔ Polyadic form -/
def functionality_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Functionality.listSchemaIn

/-- `modal-b`, variant `dual`

B ⇔ Dual form -/
def modal_b.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalB.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalBDual.schemaIn

/-- `modal-five`, variant `dual`

5 ⇔ Dual form -/
def modal_five.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFive.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.ModalFiveDual.schemaIn

/-- `necessary-atomicity-r`, variant `dual`

□Atomicity ⇔ Dual form -/
def necessary_atomicity_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicity.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecAtomicityDual.schemaIn

/-- `necessary-barcan-r`, variant `polyadic`

□BF ⇔ Polyadic form -/
def necessary_barcan_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.listSchemaIn

/-- `necessary-barcan-r`, variant `dual`

□BF ⇔ Dual form -/
def necessary_barcan_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanDual.schemaIn

/-- `necessary-barcan-r`, variant `dual-polyadic`

□BF ⇔ Dual polyadic form -/
def necessary_barcan_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanDual.listSchemaIn

/-- `necessary-barcan-r`, variant `universal-rigid`

□BF ⇔ Rigidity of the universal property -/
def necessary_barcan_r.universal_rigid : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcan.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanUniversalRigid.schemaIn

/-- `necessary-barcan-t`, variant `dual`

□BF (type t) ⇔ Dual form -/
def necessary_barcan_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBarcanTDual.schemaIn

/-- `necessary-boolean-completeness-r`, variant `lub`

□Boolean Completeness ⇔ Least-upper-bound form -/
def necessary_boolean_completeness_r.lub : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompleteness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecBooleanCompletenessLUB.schemaIn

/-- `necessary-distinctness-necessary-r`, variant `polyadic`

□ND ⇔ Polyadic form -/
def necessary_distinctness_necessary_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.listSchemaIn

/-- `necessary-distinctness-necessary-r`, variant `dual`

□ND ⇔ Dual form -/
def necessary_distinctness_necessary_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessDual.schemaIn

/-- `necessary-distinctness-necessary-r`, variant `dual-polyadic`

□ND ⇔ Dual polyadic form -/
def necessary_distinctness_necessary_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctness.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessDual.listSchemaIn

/-- `necessary-distinctness-necessary-t`, variant `dual`

□ND (type t) ⇔ Dual form -/
def necessary_distinctness_necessary_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecNecessityOfDistinctnessTDual.schemaIn

/-- `necessary-functional-choice-r`, variant `polyadic`

□Functional Choice ⇔ Polyadic form -/
def necessary_functional_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionalChoice.listSchemaIn

/-- `necessary-functionality-r`, variant `polyadic`

□Functionality ⇔ Polyadic form -/
def necessary_functionality_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecFunctionality.listSchemaIn

/-- `necessary-modal-b`, variant `dual`

□B ⇔ Dual form -/
def necessary_modal_b.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalB.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalBDual.schemaIn

/-- `necessary-modal-five`, variant `dual`

□5 ⇔ Dual form -/
def necessary_modal_five.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFive.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecModalFiveDual.schemaIn

/-- `necessary-plenitude-r`, variant `polyadic`

□Plenitude ⇔ Polyadic form -/
def necessary_plenitude_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecPlenitude.listSchemaIn

/-- `necessary-relational-choice-r`, variant `polyadic`

□Relational Choice ⇔ Polyadic form -/
def necessary_relational_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecRelationalChoice.listSchemaIn

/-- `necessary-strong-atomicity-r`, variant `dual`

□Strong Atomicity ⇔ Dual form -/
def necessary_strong_atomicity_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicity.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityDual.schemaIn

/-- `necessary-strong-atomicity-t`, variant `dual`

□Strong Atomicity (type t) ⇔ Dual form -/
def necessary_strong_atomicity_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecStrongAtomicityTDual.schemaIn

/-- `necessary-tractarianism-r`, variant `polyadic`

□Tractarianism ⇔ Polyadic form -/
def necessary_tractarianism_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.listSchemaIn

/-- `necessary-tractarianism-r`, variant `dual`

□Tractarianism ⇔ Dual form -/
def necessary_tractarianism_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianismDual.schemaIn

/-- `necessary-tractarianism-r`, variant `dual-polyadic`

□Tractarianism ⇔ Dual polyadic form -/
def necessary_tractarianism_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTractarianismDual.listSchemaIn

/-- `necessary-transversal-choice-r`, variant `polyadic`

□Transversal Choice ⇔ Polyadic form -/
def necessary_transversal_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversalChoice.listSchemaIn

/-- `necessary-transversal-r`, variant `polyadic`

□Transversal ⇔ Polyadic form -/
def necessary_transversal_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecTransversal.listSchemaIn

/-- `necessary-weak-rigid-comprehension-r`, variant `persistent`

□Weak Rigid Comprehension ⇔ Persistent form -/
def necessary_weak_rigid_comprehension_r.persistent : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehension.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.NecWeakRigidComprehensionPersistent.schemaIn

/-- `plenitude-r`, variant `polyadic`

Plenitude ⇔ Polyadic form -/
def plenitude_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Plenitude.listSchemaIn

/-- `relational-choice-r`, variant `polyadic`

Relational Choice ⇔ Polyadic form -/
def relational_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.RelationalChoice.listSchemaIn

/-- `separated-structure-r`, variant `general`

Separated Structure ⇔ General form -/
def separated_structure_r.general : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.separatedStructure _) ↔
      Classicism.Meta.AxiomSet.Entails Ax (Classicism.Meta.AxiomSet.generalSeparatedStructure _)

/-- `strong-atomicity-r`, variant `dual`

Strong Atomicity ⇔ Dual form -/
def strong_atomicity_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicity.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityDual.schemaIn

/-- `strong-atomicity-t`, variant `dual`

Strong Atomicity (type t) ⇔ Dual form -/
def strong_atomicity_t.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityT.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.StrongAtomicityTDual.schemaIn

/-- `tractarianism-r`, variant `polyadic`

Tractarianism ⇔ Polyadic form -/
def tractarianism_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.listSchemaIn

/-- `tractarianism-r`, variant `dual`

Tractarianism ⇔ Dual form -/
def tractarianism_r.dual : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TractarianismDual.schemaIn

/-- `tractarianism-r`, variant `dual-polyadic`

Tractarianism ⇔ Dual polyadic form -/
def tractarianism_r.dual_polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Tractarianism.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TractarianismDual.listSchemaIn

/-- `transversal-choice-r`, variant `polyadic`

Transversal Choice ⇔ Polyadic form -/
def transversal_choice_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.TransversalChoice.listSchemaIn

/-- `transversal-r`, variant `polyadic`

Transversal ⇔ Polyadic form -/
def transversal_r.polyadic : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.Transversal.listSchemaIn

/-- `weak-rigid-comprehension-r`, variant `persistent`

Weak Rigid Comprehension ⇔ Persistent form -/
def weak_rigid_comprehension_r.persistent : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} (_ : Sig.Admitted) (Ax : Classicism.Meta.AxiomSet Sig),
    Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehension.schemaIn ↔
      Classicism.Meta.AxiomSet.Entails Ax Classicism.P.WeakRigidComprehensionPersistent.schemaIn

end Classicism.Statements
