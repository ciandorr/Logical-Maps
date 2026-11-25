# Cardinal CH under Mathematical Possibilism

Andrew Bacon's forcing argument, formalized by OpenAI Codex (GPT-6), prompted by Andrew Bacon.

Let $N$ be the inductive property of the at-least cardinalities over individuals, generated from $\lambda A.\top$ by cardinal successor. Let $S$ consist of its rigid subproperties. Write $C$ for the assertion that every subcollection of $S$ either embeds into $N$ or admits a bijection with $S$. All maps are relations at the evaluation world. Necessary lower-Peano says that necessarily the zero of $N$ is outside the range of successor and successor is injective on $N$.

| Conclusion | Premises in addition to Mathematical Possibilism, necessary Rigid Comprehension, Intensional Choice and necessary lower-Peano |
| --- | --- |
| $\Diamond\neg C$ | None |
| $\Diamond C$ | Relational Choice, at two unboxed instances |
| $\Diamond C\land\Diamond\neg C$ | The same two instances |

### Why the two forcing algebras qualify

Put $H=\mathrm{Ordinal}_e$, the inductively generated inexact order predicates over individuals. A carrier is small if it has no power-closed subcollection strictly larger than $H$. Suppose $Y$ is power-closed and $H<Y$. Every carrier represented by a finite succession of powers starting from $H$ is smaller than $Y$. For the induction step, embed the preceding carrier as a subcollection of $Y$; power closure supplies a smaller subcollection coding every subset of the image, with one code per extension. Transporting the codes along the embedding proves the step without a choice of representatives. A carrier which embeds into any of these finite powers is therefore small. Coding the forcing graphs, their conditions and the regular-open completions by finitely many such powers establishes the two instances of Mathematical Possibilism required below. This argument supplies the size bounds internally.

### Possible failure

Use finite Cohen conditions indexed by the second Hartogs carrier. The formalization well-orders the conditions from the Hartogs presentation, constructs the regular-open completion and represents it as a principal entailment interval. The top condition is nonzero and the interval is nontrivial. The Cohen names give a subcollection of the rigid power which does not embed into $N$; the whole rigid power cannot embed into that subcollection. The first obstruction rules out the countable disjunct of $C$, the second rules out a bijection with $S$. The forcing proposition thus yields $\Diamond\neg C$. Rigid Comprehension and Intensional Choice occur in the construction and interpretation of names. There is no Relational Choice premise in this derivation.

### Possible truth

Use countable partial collapse conditions, ordered by extension, and represent their regular-open completion by a second application of Mathematical Possibilism. The stable first Hartogs presentation comes from necessary lower-Peano and Rigid Comprehension. The first instance of Relational Choice selects codes for a sequence of countable domains. The second selects extensions meeting successive dense requirements. The countable fusion argument and the collapse names give the cardinal dichotomy for every subcollection of the rigid power on a nonzero proposition. This yields $\Diamond C$. Conjoining the two possibility conclusions proves contingency for the same $N$ and $S$.

The proof files are `FinitePowerSmallness.lean`, `SmallForcingCompletions.lean`, `SmallPositiveForcing.lean`, `SmallNegativeForcing.lean`, and `FinitePowerCHContingency.lean` in the companion Lean contribution, under `Classicism/Results/MathematicalContingency/`. Checkpoint 151 version 349 contains the three closed object-language derivations. The original structural claim in *Could the truths of mathematics have been different?*, §6, Theorem 6.1, concerned possible real-field structures. The corrected conclusions above use a fixed cardinal formulation.
