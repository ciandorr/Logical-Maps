# Coalesced sum: free root over the all-maps model and countable full S5

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□5-necessities are ND-necessary.** Necessarily, whatever is 5-necessary is ND-necessary. In C this is the identity $\Box_5=\Box_{\ne}$.
- **□Well-Ordering.** Necessarily, every type, including e, is well-ordered by some relation.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ □Truths are 5-necessary.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ □Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ □Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The components are $A$, the model of symmetry-constrained-full-all-maps (three individuals, all $27$ maps as arrows), and $B$, the model of full-infinite-s5 with $W=\mathbb N$ and a single individual, each evaluated at its root. Coalesce them at a new root as in Definition E.2. The root's individuals are the natural numbers, sent by the distinguished arrows into $A$ and $B$ by arbitrary fixed maps. Evaluation point: the root. Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

The root has one distinguished arrow to the root of each component, and every arrow from the root into a component factors through it.

Root domains are as full as compatibility allows: a root proposition is a choice, for each component, of a proposition of that component’s root domain, together with a truth value at the root’s identity arrow, and a root entity of a relational type is likewise a family of component entities with a root component that is an arbitrary function of the root arguments.

*A member of the group Coalesced sums at a new root, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Forcing Possibilism.

At every type. Every set of tuples of root entities is the root component of a root relation, so internal completeness, injections and isomorphisms at the root agree with the external ones. A root proposition is a truth value with a proposition of $A$ (of which there are $32$) and one of $B$ (a set of worlds), so there are continuum many, and among them infinitely many atoms, those false at the root, bottom in $A$, and a singleton in $B$. An infinite complete Boolean algebra has at least continuum many elements (it has infinitely many pairwise disjoint nonzero elements, whose subfamilies have distinct joins), so a complete Boolean algebra that is Dedekind finite, or has fewer elements than there are root propositions, is finite. A finite one with $k$ atoms is isomorphic to the propositions below the join of $k$ of those atoms, which is not $\top$.

*Address: `coalesced-all-maps-and-countable-s5-root#forcing-possibilism`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Intensional Choice.

Intensional Choice fails at the root of $A$ (symmetry-constrained-full-all-maps, at type $t$, and also at type $e$ by intensional-choice-collapse), for a necessarily instantiated $F_A$. Let $F$ be the root property with universal root component, $F_A$ as its component in $A$ and the universal property as its component in $B$: it is necessarily instantiated. A property entailing $F$ and necessarily uniquely instantiated would have as its component in $A$ a property entailing $F_A$ and necessarily uniquely instantiated there.

*Address: `coalesced-all-maps-and-countable-s5-root#intensional-choice`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Axiom of Infinity (type e).

There are infinitely many individuals at the root, and identity there is literal. Every set of root entities is the root component of a root property, so the finite cardinalities at the root are the standard ones, and none of them holds of the universal property of individuals. (The Axiom of Infinity at type $t$ follows from Forcing Possibilism.)

*Address: `coalesced-all-maps-and-countable-s5-root#infinity`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Atomicity, □Rigid Comprehension, □5-necessities are ND-necessary. Fails □Truths are 5-necessary.

The worlds of the root are its identity and the worlds of $A$ and $B$, and a closed sentence holds at a component world iff it holds there in the component; so a boxed principle holds at the root iff the principle holds at the root and the boxed one in $A$ and $B$. Atomicity: the singletons of root tuples, with zero components, are admitted, and a nonzero component lies above an atom of $A$ or of $B$, both of which satisfy □Atomicity. Rigid Comprehension: give a root entity's root extension $S$ the transports into $A$ and $B$ of the haecceity disjunction of $S$, rigid there ($A$'s domains contain the finite disjunctions of haecceities, $B$ is full); the result is rigid and coextensive with it, and $A$ and $B$ satisfy □Rigid Comprehension. 5-necessities are ND-necessary: at the root the proposition true at the root alone is in the domain and seen from no component world, so every truth is ND-necessary there; $A$ and $B$ satisfy the boxed principle. In $B$, an S5 model with more than one world, $\Box_5$ is $\Box$, so not every truth is 5-necessary.

*Address: `coalesced-all-maps-and-countable-s5-root#component-transfer`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Well-Ordering.

At the root every set of tuples is a root extension, so a well-order of the root domain chosen in the metatheory is the root extension of a relation, which well-orders the type there; $A$ and $B$ satisfy □Well-Ordering.

*Address: `coalesced-all-maps-and-countable-s5-root#well-ordering`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Self-Atomicity (type t).

Self-Atomicity at $t$ fails at the root of $A$, for a possible $p_A$. The root proposition false at the root, equal to $p_A$ in $A$ and $\bot$ in $B$, is possible, and the propositions below it are of the same form, with self-atomhood that of their $A$-component in $A$.

*Address: `coalesced-all-maps-and-countable-s5-root#self-atomicity-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails B for pure sentences.

Distinctness-Necessity at $t$ fails at the root and holds at every world of $B$, an S5 model with invertible arrows; so its negation is true at the root and not possible at $B$'s root.

*Address: `coalesced-all-maps-and-countable-s5-root#pure-b`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Analytic Necessitism.

At type $t$. There are continuum many root propositions and every set of root tuples is a root extension, so there is a real number structure at the root. A rigid one necessarily a real number structure would carry one in $A$, whose domains are finite.

*Address: `coalesced-all-maps-and-countable-s5-root#analytic-necessitism`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Relational Choice.

The functionality of a subrelation is evaluated at the root’s identity arrow only, while the subrelation condition is boxed; so for a serial root relation take the subrelation whose root component is a functional choice from the root component, by choice in the metatheory, and whose component parts are empty. Where some component refutes Relational Choice at its root, as when the components are complete for C, its necessitation fails.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#relational-choice-free-root`. It requires that A root entity of a relational type has a root component that is an arbitrary function of the root arguments. Here: The root domains are as full as compatibility allows. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three complete members' copies stated once; "Its necessitation fails, since some component refutes Relational Choice at its root" became conditional on that, since in the all-finite-domains member every component satisfies Relational Choice.

### Holds Actuality.

The singleton root proposition witnesses Actuality.

*Source: Classicism, Appendix E, p. 83. From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#actuality-singleton-root`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once.

### Fails Self-atoms are atoms (type t), Self-atoms are strong atoms (type t).

Let $N$ and $M$ be two components whose roots satisfy Actuality, with true atoms $a_N$ and $a_M$, and let $P$ be the root proposition false at the root, with component $a_N$ at $N$, $a_M$ at $M$ and bottom elsewhere. $P$ is possible, and it is a self-atom: under the distinguished arrow into $N$ it becomes $a_N$, and a true atom is a self-atom, as it entails every truth, including the truth that it entails every truth; likewise at $M$; and at the root it is false. It is not an atom, since the root proposition with component $a_N$ alone lies strictly below it. So Self-atoms are atoms (type t) fails at the root, and with it Self-atoms are strong atoms (type t).

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#self-atom-of-two-actual-components`. It requires that At least two components are action models whose roots satisfy Actuality, and the root domain contains every family of component propositions with a truth value at the root (the fullest root domains). Here: $A$ and $B$ are action models whose roots satisfy Actuality, and the root domains are the fullest. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails □Axiom of Infinity (type e).

At the identity arrow of a reachable object $v$ with $n$ individuals there are not $n+1$ individuals any two of which are distinct, distinctness implying literal distinctness, identity being reflexive. So the Infinity schema at type $e$ fails there, and with it the Axiom of Infinity at type $e$, which implies it in C (axiom-of-infinity-e-implies-infinity-e). A closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target (at the world seen, in a Kripke-style model), so the arrow into $v$ is a world at which the Axiom fails, and its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-individuals-somewhere`. It requires that Some object reachable from the evaluation point has finitely many individuals. Here: The root of $A$, reached by the distinguished arrow, has three individuals. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails □Axiom of Infinity (type t).

As for individuals (finitely-many-individuals-somewhere), at type $t$: at the identity arrow of a reachable object with $n$ propositions the Infinity schema at type $t$ fails, and so does the Axiom of Infinity at type $t$, which implies it in C (axiom-of-infinity-t-implies-infinity-t); so its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-propositions-somewhere`. It requires that Some object reachable from the evaluation point has finitely many propositions. Here: The root of $A$, reached by the distinguished arrow, has $32$ propositions. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the construction fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Recorded for the separation of Forcing Possibilism, even with both Axioms of Infinity, from Intensional Choice; every other recorded model of Forcing Possibilism satisfies Intensional Choice. Forcing Possibilism is not claimed to be necessary here: it fails at the root of $A$, whose 32 propositions have only five atoms. Relational Choice and Actuality hold at the root by the group's arguments.

## Sources

- **Astra via Kodsi 23 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Forcing Possibilism, Choice and Infinity, research note of 23 October 2026, §§1 and 4 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps), listed in his pull request #18 of 26 October 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix E, Definition E.2, pp. 80–83.

<p class='cert'>Record: <code>topics/classicism/models/coalesced-all-maps-and-countable-s5-root.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix E, Definition E.2, pp. 80–83. The coalesced sum, here of two components.
