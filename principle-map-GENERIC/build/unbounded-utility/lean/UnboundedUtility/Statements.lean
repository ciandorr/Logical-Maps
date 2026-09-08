import UnboundedUtility.Principles

/-!
# Generated statements

Written by `pmap lean unbounded-utility` from the YAML records. **Do not edit.**

Each declaration below is the statement of one database record, assembled from its
premises and conclusion. A proof is supplied by inhabiting the corresponding `Prop`,
so a Lean proof cannot drift from the claim the map displays. Regenerate after any
change to a record or to a principle's `lean_def`.
-/

namespace UnboundedUtility.Statements
open UnboundedUtility

/-- `dominance-implies-equivalence`

Stochastic Dominance ⇒ Stochastic Equivalence -/
def dominance_implies_equivalence : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.StochasticDominance P →
    UnboundedUtility.StochasticEquivalence P

/-- `dominance-implies-statewise`

Archimedean Outcomes ∧ Stochastic Dominance ⇒ Statewise Dominance -/
def dominance_implies_statewise : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.ArchimedeanOutcomes P →
    UnboundedUtility.StochasticDominance P →
    UnboundedUtility.StatewiseDominance P

/-- `equivalence-and-statewise-imply-dominance`

Rich Outcomes ∧ Archimedean Outcomes ∧ Stochastic Equivalence ∧ Statewise Dominance ⇒ Stochastic Dominance -/
def equivalence_and_statewise_imply_dominance : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.RichOutcomes P →
    UnboundedUtility.ArchimedeanOutcomes P →
    UnboundedUtility.StochasticEquivalence P →
    UnboundedUtility.StatewiseDominance P →
    UnboundedUtility.StochasticDominance P

/-- `expected-utility-implies-simple`

Expected Utility ⇒ Simple Expected Utility -/
def expected_utility_implies_simple : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.ExpectedUtility P →
    UnboundedUtility.SimpleEU P

/-- `independence-to-sure-thing`

Stochastic Equivalence ∧ Mixture Independence ⇒ Sure-Thing -/
def independence_to_sure_thing : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.StochasticEquivalence P →
    UnboundedUtility.MixtureIndependence P →
    UnboundedUtility.SureThing P

/-- `original-dtu-implies-simple-eu`

Rich Outcomes ∧ Archimedean Outcomes ∧ Totality ∧ Stochastic Dominance ∧ Sure-Thing ⇒ Simple Expected Utility -/
def original_dtu_implies_simple_eu : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.RichOutcomes P →
    UnboundedUtility.ArchimedeanOutcomes P →
    UnboundedUtility.Totality P →
    UnboundedUtility.StochasticDominance P →
    UnboundedUtility.SureThing P →
    UnboundedUtility.SimpleEU P

/-- `simple-eu-implies-archimedean-outcomes`

Simple Expected Utility ⇒ Archimedean Outcomes -/
def simple_eu_implies_archimedean_outcomes : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.SimpleEU P →
    UnboundedUtility.ArchimedeanOutcomes P

/-- `simple-eu-implies-restricted-equivalence`

Simple Expected Utility ⇒ Restricted Stochastic Equivalence -/
def simple_eu_implies_restricted_equivalence : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.SimpleEU P →
    UnboundedUtility.RestrictedStochasticEquivalence P

/-- `simple-eu-implies-restricted-totality`

Simple Expected Utility ⇒ Restricted Totality -/
def simple_eu_implies_restricted_totality : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.SimpleEU P →
    UnboundedUtility.RestrictedTotality P

/-- `stochastic-equivalence-restricts`

Stochastic Equivalence ⇒ Restricted Stochastic Equivalence -/
def stochastic_equivalence_restricts : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.StochasticEquivalence P →
    UnboundedUtility.RestrictedStochasticEquivalence P

/-- `sure-thing-to-independence`

Rich Outcomes ∧ Archimedean Outcomes ∧ Totality ∧ Stochastic Dominance ∧ Sure-Thing ⇒ Mixture Independence -/
def sure_thing_to_independence : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.RichOutcomes P →
    UnboundedUtility.ArchimedeanOutcomes P →
    UnboundedUtility.Totality P →
    UnboundedUtility.StochasticDominance P →
    UnboundedUtility.SureThing P →
    UnboundedUtility.MixtureIndependence P

/-- `totality-restricts`

Totality ⇒ Restricted Totality -/
def totality_restricts : Prop :=
  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O),
    UnboundedUtility.Totality P →
    UnboundedUtility.RestrictedTotality P

end UnboundedUtility.Statements
