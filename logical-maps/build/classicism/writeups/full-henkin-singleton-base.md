# Full Henkin model: singleton individual domain

<p class='cert'>Model — Source: Misc.; produced by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Possible failure of Cardinal CH.** Cardinal CH possibly fails.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Cardinal CH.** Cardinal CH possibly holds.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Potential Infinity (type e).** For every natural number, there could be at least that many individuals: each number counted at type $e$ possibly holds of some property of individuals.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The individual domain $D_e$ is a singleton, $D_t=\{0,1\}$, and every relational type holds all functions between its domains. There is one world, so $\Box p$ is $p=\top$, and identity is genuine identity: a full Henkin interpretation (Classicism, Definition 3.6), a model of C by Proposition 3.7.

Metatheory, fixed for this record: ZFC.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Henkin models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Extensionality.

Every relation is a function between the lower domains, and identity is identity of functions, so coextensive relations are identical. With one world, the boxed principles reduce to their unboxed forms, and the comprehension, completeness and atomicity principles hold as in every two-valued full model: each relational type is the complete atomic Boolean algebra of the subsets of a domain.

*From the group *Henkin models*, shared argument `henkin#extensionality`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Functional Choice.

Every function between the domains is present, so choice in the metatheory gives every serial relation a functional subrelation, and, when the output type is relational, a selecting operation.

*From the group *Henkin models*, shared argument `henkin#functional-choice`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Infinity Schema (type e).

In a full model the numbers are the standard finite cardinalities, and with finitely many individuals one of them holds of the universal property of individuals.

*From the group *Henkin models*, shared argument `henkin#finitely-many-individuals`. It requires that There are finitely many individuals. Here: There is one individual. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Possible failure of Cardinal CH. Fails Possible Cardinal CH.

Cardinal CH fails at every world, so it is not possible, and its failure, being actual, is possible. With one individual at every world, $N=\operatorname{LowerNat}_e$ has exactly three instances at every world. At-least zero, $z=\lambda A\, .\,\top$, and its successor, which holds of the properties with an instance, differ at the empty property. The successor of that holds of the properties with two distinct instances, so of none at any world; it is $\lambda A\, .\,\bot$ by Intensionality, so is its own successor, and differs from the other two, which hold of the universal property. Being one of the three is a property of cardinalities that $z$ has and that passes to successors, so $N$ has no other instance. The rest is the argument cardinal-ch-boundedly-many-individuals with $m=3$: the rigid subproperties of $N$ are the eight disjunctions of haecceities of its instances, and a property holding of four of them neither injects into the three instances of $N$ nor is in bijection with the eight. No choice is used.

*General argument `arguments/cardinal-ch-one-individual`. It requires that There is exactly one individual, at every world. Here: The individual domain is a singleton. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-25.*

### Holds Necessity of Arithmetic.

At each type $\sigma$. At any object $v$ reachable from the evaluation point the numbers at $\sigma$ are the numerals there, as in the argument arithmetic-necessitism-extensionally-full. If the numerals are pairwise distinct at $v$, as they are when $\sigma$ has infinitely many entities there, the $n$th being the cardinality of the properties with $n$ instances, then $\operatorname{Sum}_\sigma$ and $\operatorname{Prod}_\sigma$ are the least relations closed under their clauses, and by extensional fullness the relations whose extensions are the graphs of addition and multiplication on the numerals are present and closed under them, so the two are standard. So an arithmetical sentence $A$ at $\sigma$ has at $v$ its truth value in the standard model. If two numerals coincide at $v$, then $I^*_\sigma$ fails at $v$, since zero is a numeral other than every successor and successor is injective on the numerals only when they are pairwise distinct; and then $I_\sigma=\Diamond I^*_\sigma$ is false at $v$ too, $I^*_\sigma$ being true if possible (Background, [[potential-infinity-forms]]). So $\Box(I_\sigma\to A)$ holds when $A$ is true in the standard model and $\Box(I_\sigma\to\neg A)$ when it is false. No choice is used.

*General argument `arguments/necessity-of-arithmetic-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-30.*

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The case of a type with finitely many entities at $v$ had argued that two numerals then coincide at every object $v$ sees, the type being finite at each by the condition finite-types-stay-finite. That needs a finite bound on those objects, not only that each is finite: in [[full-omega-chain-new-individuals]] every object has finitely many individuals and the numerals at type $e$ are pairwise distinct at each. The cases are now divided by whether the numerals are pairwise distinct at $v$, and the condition is no longer required: where they coincide $I^*_\sigma$ fails, and with it $I_\sigma$, which is Potential Infinity at $\sigma$.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e), Potential Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world. And the numeral $\operatorname{Suc}_e\operatorname{Suc}_e\mathbf{0}_e$, a finite cardinality, holds of no property at any world, a property it holds of having two distinct instances; so Potential Infinity (type $e$) fails.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: The individual domain is a singleton. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The failure of Potential Infinity (type e) added, with its sentence of the text. It is the strongest of the four verdicts: the Axiom of Infinity and Possible Infinity each imply Potential Infinity.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: The individual domain is a singleton. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

Explicit specialization of the source’s standard Henkin construction to a singleton individual domain. No independent checking or formal verification is claimed. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Strong Atomicity and its necessitation. Box is truth in this model, so a strong atom is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Atomicity, □Strong Atomicity.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Verified the Possible Infinity principles added on this date. Box is the identity on truth values, so each fails with the corresponding Axiom of Infinity. Now violates: Possible Infinity (type e), Possible Infinity (type t).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Listed the strongest principles the model obviously satisfies, at Cian Dorr's request. Since Box is truth and identity is genuine, each boxed principle reduces to its unboxed form; coextensive relations are identical because every function type is full; every relation is persistent, inextensible and Gallin-extensional trivially; Actuality holds with top as the actual world; each relational type is a complete atomic Boolean algebra, giving Atomicity and Boolean Completeness; Tractarianism is the tautology that a proposition entailing each instance entails the universal claim; and ND holds outright, giving C5. Now satisfies: □Fregean Axiom, modalized-fregean, Extensionality, □Extensionality, intensionality-r, □Functionality, □Plenitude, Tractarianism, □Tractarianism, □ND, □Actuality, □Atomicity, □Boolean Completeness, □Rigid Comprehension, □Gallin Extensional Comprehension.
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Restricted the example and its recorded choice properties to the map’s relational type system at the user’s request. Now satisfies: Fregean Axiom, Functionality, modalized-functionality-r, Plenitude, Functional Choice, Relational Choice, No Pure Contingency, Truths are ND-necessary.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-singleton-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16
