# Full Henkin model: finite individual domain

<p class='cert'>Model — Source: Misc.; produced by OpenAI Codex (GPT-6), prompted by Daniel Kodsi, 22 October 2026 (two individuals, with one independent predicate); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The individual domain $D_e$ is finite with at least two members (with independent constants, at least twice as many as Σ has relational constants, plus one for each individual constant), $D_t=\{0,1\}$, and every relational type holds all functions between its domains. There is one world, so $\Box p$ is $p=\top$, and identity is genuine identity: a full Henkin interpretation (Classicism, Definition 3.6), a model of C by Proposition 3.7.

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

*From the group *Henkin models*, shared argument `henkin#finitely-many-individuals`. It requires that There are finitely many individuals. Here: The individual domain is finite. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Necessity of Arithmetic.

At each type $\sigma$. At any object $v$ reachable from the evaluation point the numbers at $\sigma$ are the numerals there, as in the argument arithmetic-necessitism-extensionally-full. If the numerals are pairwise distinct at $v$, as they are when $\sigma$ has infinitely many entities there, the $n$th being the cardinality of the properties with $n$ instances, then $\operatorname{Sum}_\sigma$ and $\operatorname{Prod}_\sigma$ are the least relations closed under their clauses, and by extensional fullness the relations whose extensions are the graphs of addition and multiplication on the numerals are present and closed under them, so the two are standard. So an arithmetical sentence $A$ at $\sigma$ has at $v$ its truth value in the standard model. If two numerals coincide at $v$, then $I^*_\sigma$ fails at $v$, since zero is a numeral other than every successor and successor is injective on the numerals only when they are pairwise distinct; and then $I_\sigma=\Diamond I^*_\sigma$ is false at $v$ too, $I^*_\sigma$ being true if possible (Background, [[potential-infinity-forms]]). So $\Box(I_\sigma\to A)$ holds when $A$ is true in the standard model and $\Box(I_\sigma\to\neg A)$ when it is false. No choice is used.

*General argument `arguments/necessity-of-arithmetic-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-30.*

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The case of a type with finitely many entities at $v$ had argued that two numerals then coincide at every object $v$ sees, the type being finite at each by the condition finite-types-stay-finite. That needs a finite bound on those objects, not only that each is finite: in [[full-omega-chain-new-individuals]] every object has finitely many individuals and the numerals at type $e$ are pairwise distinct at each. The cases are now divided by whether the numerals are pairwise distinct at $v$, and the condition is no longer required: where they coincide $I^*_\sigma$ fails, and with it $I_\sigma$, which is Potential Infinity at $\sigma$.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

With independent constants (the generated variant), it witnesses the consistency of Independence (signature Σ) with Extensionality and the failure of both Infinity schemata, for every finite Σ whose constants all have types in which $e$ occurs. Codex's model is the case Σ $=\{c\}$, $c$ of type $et$ denoting $\{0\}$, over $\{0,1\}$; two individuals suffice for one relational constant only. Whether infinitely many constants are possible with finitely many individuals is open (write-up extensional-independent-constants).

## Sources

- **Codex via Kodsi 22 Oct** — OpenAI Codex (GPT-6), prompted by Daniel Kodsi, Central question audit, 22 October 2026 (unpaginated), and the model extensional-single-predicate-two-individuals in Daniel Kodsi's pull request #21 of 28 October 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-finite-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48
