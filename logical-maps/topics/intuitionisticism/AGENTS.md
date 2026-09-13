# Working on Intuitionisticism

Read `background.md` and `topic.yaml` before editing mathematical records.
The parent `CLAUDE.md` certificate and source rules apply.

- Keep Intuitionisticism (II = IH + Intensionality) as the fixed base theory.
  Propositional and function intensionality are standing rules, not removable
  background principles. Clearing optional assumptions must leave II in force.
- For a rule/schema principle, an incoming arrow requires derivations of every
  instance; an outgoing arrow may use particular instances, which the proof must
  identify. This also applies to type-ambiguous schemata. Do not infer the whole
  schema from a proof at one type or for one formula.
- Preserve every rule side condition. The standing propositional and function intensionality
  require an empty assumption context. Selected rule principles provide rule
  applications, not object-language conditionals; selected formula premises do
  not become assumption-free theorems eligible for intensionality or necessitation.
- Keep the scopes of higher-order quantifiers and modal operators explicit.
  Do not replace a quantified formula with a schema, or a formula with its
  necessitation, without a separate justification.
- Name a necessitated counterpart by prefixing the base principle's label with
  □, for example LEM and □LEM, or PSd (◇_∨) and □PSd (◇_∨). Preserve stable
  IDs and retain former labels and [] spellings as aliases. Box the whole
  sentence; for a type-ambiguous schema, box each type instance. Do not apply
  this naming rule to a formula merely containing an internal □.
- Look for elementary connecting results as well as manuscript theorems:
  candidate-class inclusions, upper bounds, spouse/equality equivalences,
  identity substitution/transitivity, and boxed versions of proved formula
  implications. Give new connecting proofs their own Misc. source and credit.
  `connections.yaml` records the current audit and boxed counterparts. Do not
  lift conjectures or treat rules/schemata as single object-language formulas.
- Use □ only for =⊤. Name the defined possibility operator in every modal record:
  ◇_∨, ◇₂, ◇_∞, or ≠⊥. Do not reintroduce an unindexed possibility symbol or a
  generic possibility parameter. Keep □₂ distinct from □ when it is introduced.
  Claims equating defined operators require separate evidence.
- Models must interpret the named operators by their definitions and identify
  the world or evaluation witnessing formula assertions. For rules/schemata,
  satisfaction covers all admitted instances and violation needs a failing
  instance. Distinguish global validity from truth at an evaluation, and failure
  of A from truth of intuitionistic ¬A.
- The manuscript supplies the initial formulations. Preserve original
  attribution when adding results it credits to earlier authors. A definition
  reference alone is not a source for a connecting theorem.
- Keep manuscript reading copies and research notes in the root private
  workspace. The public sources directory is for documents authorised for
  redistribution.
