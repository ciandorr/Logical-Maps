# The Lean formalisation

The map's [Lean project](lean/) formalises C in base Lean 4 and checks many of the
map's claims. A **Lean ✓** on a result, on a model's verdict, or on a lemma on these
pages means that a proof has passed an audit. This page says what each audit
establishes. The project's own README has the details.

## Classicism as a theory in Lean

The *shallow layer* treats C as a theory in Lean itself. Individuals form a type `e`,
`Prop` plays the role of $t$, and the classes `Ty` and `Rel` mark the Lean types that
are types of the relational type system and the relational types among them. $\Box p$
is $p=\top$, as on [[necessity]].

Lean's rules for the connectives, the quantifiers and identity are the rules of H, short
of two things that the library adds as axioms: excluded middle (`em`) and the existence
of an individual (`e_exists`). Lean's own three axioms are principles of the map, and
none is a theorem of C:

| Lean axiom | Principle on the map |
| --- | --- |
| `propext` | Fregean Axiom |
| `funext` | Functionality |
| `Classical.choice` | Functional Choice, and more |

The rule of Logical Equivalence is rendered as a restriction on the first two, the
*gate*: `propext h` and `funext h` may appear only when the proof `h` is closed, using
no hypothesis. Applied to a closed proof they are exactly the rules C is closed under;
applied to a hypothesis they would be the Fregean Axiom and Functionality.
`#classicism_check` audits a shallow proof: it rests only on `propext`, `funext`, `e`,
`e_exists` and `em`, and it passes the gate. It also reports whether the proof avoids
`e_exists`, and so is a theorem of C⁻, the theory without Existence at $e$.

No formula quantifies over types. A principle is a family of formulas indexed by types,
and a lemma is a theorem with type parameters, a schema in the sense of
[[framework|the conventions]].

## Lemmas on these pages

A lemma's **Lean ✓** badge opens a menu linking the shallow theorems that prove it.
The ✓ means that each of them passes `#classicism_check`, and the menu says whether the
lemma is a theorem of C or of C⁻. A badge in the running text, after a claim such as
"$\le_\tau$ is a partial order", opens the same kind of menu for the theorems that
prove that claim. Shallow proofs elsewhere in the library use these theorems directly. Whether a
Lean statement says what the prose says is checked by reading the two together.

## Results and their certificates

The *metalogical layer* makes the object language into Lean data: terms over a
signature, derivability in C, and models. A result $A_1,\ldots,A_n\Rightarrow B$ is
stated, by a statement generated from the records, as an entailment between schemas:
for every admitted signature $\Sigma$ and every set of sentences over $\Sigma$, if it
entails each $A_i$ then it entails $B$. An incompatibility concludes instead that the
set is inconsistent. Each principle's schema comes from its record's Lean definition.

A result's certificate usually comes from a shallow proof, which a translator turns into
a derivation in the object language. Stating results metalogically lets ordinary
principles, schematic only in their types, be treated like the principles whose instances
are sentences picked out by a condition on syntax, such as No Pure Contingency and
Maximalism, which no shallow formula with type parameters can state. `lean-check`
confirms that each certificate proves its generated statement in ordinary classical Lean,
the metatheory, with no `sorry`.

## Models

A model's verdict is stated as the existence of a consistent, complete theory, deciding
every sentence, that entails the principles the model satisfies and none of those it
violates. The proof constructs the model, an action model or another of the map's
constructions, and applies the soundness theorem.

## The strict layer

A third layer re-proves the shallow theorems from the eleven closed identities of
*Classicism*, carrying out its Appendix A on Lean proof terms. It explores how the
paper's type system sits inside Lean's and is not on the route to any certificate.

## Where things are

| What | Where in the Lean project |
| --- | --- |
| The language, the gate, the axioms | `Classicism/Core.lean`, `Equivalence.lean` |
| The lemmas of these pages, a module per page | `Classicism/Background/` |
| The map's principles | `Classicism/Principles/` |
| The shallow proofs of results | `Classicism/Results/Records/` |
| The object language and its models | `Classicism/Syntax/`, `Classicism/Semantics/`, `Classicism/Models/` |
| The certificates | `Classicism/Map.lean`, `MapModels.lean`, `MapDerived.lean`, `MapArguments.lean` |
| The statements they prove | `Classicism/Statements.lean`, `ModelStatements.lean`, generated from the records |
