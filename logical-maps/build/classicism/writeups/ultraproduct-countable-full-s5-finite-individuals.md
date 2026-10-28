# Henkin ultraproduct: countable full S5 models with n individuals

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **□Functional Choice.** Necessarily, every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Strong Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation.
- **□Well-Ordering.** Necessarily, every type, including e, is well-ordered by some relation.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

As ultraproduct-finite-full-s5, with factors $M_n$ the full S5 models with the worlds $\mathbb N$ and $n$ individuals: the full action model on the category with objects $\mathbb N$ and exactly one arrow between any two, the same $n$ individuals at every object, fixed by every arrow. $M:=\prod_nM_n/U$ for a nonprincipal ultrafilter $U$ on the positive integers, a Henkin model of C in which a sentence is true iff it is true in $U$-many $M_n$.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type in every factor, hence in $M$.

## Arguments

### Holds □Functional Choice, □Intensional Choice, □BF, □ND, □Atomicity, □Actuality, □Rigid Comprehension, □Strong Atomicity, □Well-Ordering, No Pure Contingency, Axiom of Infinity (type t).

As for ultraproduct-finite-full-s5, each instance holds in every factor: the factors are full, with constant domains, crisp identity, atomic algebras whose atoms are the worlds, and automorphisms taking any world to any other. In each factor there are infinitely many propositions, and the finite cardinalities, the domains being full, are the standard ones, so the Axiom of Infinity (type $t$) is true in each factor, hence in $M$.

*Write-up: [ultraproduct-finite-full-s5](ultraproduct-finite-full-s5.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026, 2026-10-25.*

### Holds Forcing Possibilism.

In each factor the propositions are the $2^{\aleph_0}$ subsets of $\mathbb N$, and every relation on each domain is present. An infinite complete Boolean algebra has a countably infinite antichain, so at least $2^{\aleph_0}$ elements; so a complete Boolean algebra represented in a factor that is Dedekind-finite or strictly smaller than the propositions is finite, with $k$ atoms say, and is isomorphic to the propositions below any proposition true at exactly $k$ worlds, which is not $\top$. So each instance holds in every factor, hence in $M$.

*Write-up: [ultraproduct-finite-full-s5](ultraproduct-finite-full-s5.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026, 2026-10-25.*

### Holds Infinity Schema (type e).

The instance asking for $k$ distinct individuals holds in $M_n$ for $n\ge k$.

*Write-up: [ultraproduct-finite-full-s5](ultraproduct-finite-full-s5.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026, 2026-10-25.*

### Fails Possible Infinity (type e).

In $M_n$, at every world, the $n$-th finite cardinality counts the universal property of individuals, so $\Box\exists Z\, .\,\operatorname{FiniteCardinality}_e(Z)\land Z(\lambda u\, .\,\top)$ is true in every factor, hence in $M$.

*Write-up: [ultraproduct-finite-full-s5](ultraproduct-finite-full-s5.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026, 2026-10-25.*

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

The Axiom of Infinity at $t$ with the Infinity Schema at $e$ does not imply the Axiom of Infinity at $e$, nor its possibility, even with Forcing Possibilism, □Functional Choice, C5 and BF.

## Sources

- **Astra (Kodsi) 23 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Forcing Possibilism, Choice and Infinity, research note of 23 October 2026, §§2, 5 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps, proofs/forcing-possibilism.md).

<p class='cert'>Record: <code>topics/classicism/models/ultraproduct-countable-full-s5-finite-individuals.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Full action models; the factors are full S5 models with countably many worlds.
