# Symmetric ideally-full model: qualitative contrast (Appendix D precursor) [one individual; Σ true atom]

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **¬ Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **¬ □Countable Boolean Completeness.** Necessarily, every countable property of entities of a relational type has a least upper bound in that type, with countability relative to a type $\sigma$ as in Countable Boolean Completeness; one instance for each $\sigma$.
- **¬ □Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Appendix D, p. 79, the final construction, the paper’s precursor of the symmetric ideally-full models of Dorr’s draft (Definitions 15–18, p. 8): the base has two objects $W_0$ and $W_1$, both copies of $\mathbb N$, all permutations of $\mathbb N$ as the arrows between any pair of objects, the ideal of finite sets at each, and the symmetry groups $G_{W_0}$ = all permutations and $G_{W_1}$ trivial. The paper states the symmetry condition on propositions only, as the constraint that a set of arrows in $W_i^t$ containing an arrow $h$ into $W_0$ contains $g\circ h$ for every permutation $g$ of $W_0$, and takes the finitely pinned entities at higher types; since every arrow is invertible, that is the draft’s symmetry condition at every type, applied to the entities’ values. Intuitively $W_0$ is a state in which all individuals are qualitatively indiscernible and $W_1$ one in which each plays a unique role. Evaluation point: $W_0$, at its identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition, the symmetry group; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □ND, Actuality. Fails Atomicity.

The smallest proposition of $W_0^t$ containing the identity is the set of all arrows $W_0\to W_0$, which witnesses Actuality at $W_0$; Actuality fails at $W_1$ as in part 1, so $\Box$Actuality and hence Atomicity fail at $W_0$ although C5 holds.

*Source: Classicism, Appendix D, p. 79. By Andrew Bacon and Cian Dorr, 2026-09-17.*

### Holds Axiom of Infinity (type t).

The propositions that the arrow leads to $W_1$ and sends a given individual to itself, one for each individual, are pairwise distinct and each is pinned down by that individual; they meet the symmetry condition since $G_{W_1}$ is trivial. So there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$t$ half of the old argument, which used the propositions that the arrow fixes a given individual; those include arrows into $W_0$, where the symmetry condition asks for closure under every permutation of $W_0$. Restricted to arrows into $W_1$, where the symmetry group is trivial.

### Holds □Intensional Choice.

At every type. (i) An element $a$ of an ideally full domain at $W_0$ is fixed by every permutation fixing its pinning set $T$ pointwise, since $(g\cdot a)(k)=a(k\circ g)$ and $k\circ g$ agrees with $k$ on $T$. (ii) The arrows into $W_0$ are exactly the symmetries, so $F(h)=h\cdot F(1)$ for them. Given $F$ at $W_0$, pick $a\in F(1)$ with pinning set $T$ and let $G(h):=\{h\cdot a\}$ for $h$ into $W_0$: the haecceity of $a$, inside $F(h)$ by (ii), symmetric, and pinned down by $T$ by (i). For $h$ into $W_1$ there is no symmetry constraint, $G_{W_1}$ being trivial, so let $G(h)$ be the least element of $F(h)$ under a fixed well-ordering, which depends only on $h$ on $F$'s pinning set. The combined $G$ is in the domain, entails $F$, and has singleton extensions. At $W_1$ the same two moves work: the arrows $W_1\to W_0$ are one orbit $h=g\circ h_0$, where $G(h):=\{g\cdot a_0\}$ for some $a_0\in F(h_0)$, and the arrows $W_1\to W_1$ are unconstrained. So Intensional Choice holds at both objects, hence necessarily. In general, the haecceity of an actual instance witnesses Intensional Choice wherever every arrow out of the object is a symmetry.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Fails □Countable Boolean Completeness, □Boolean Completeness (type t).

At $W_1$, reached from $W_0$, whose symmetry group is trivial, at $\sigma=\tau=t$. Let $A_m$ ($m\ge1$) be the set of permutations $h:W_1\to W_1$ with $h0=m$ and $hm=0$, pinned down by $\{0,m\}$ and symmetric, holding at no arrow into $W_0$. An upper bound pinned down by a finite $S$ may omit every arrow into $W_0$, and among arrows into $W_1$ the computation is that of the one-object permutation model: a permutation $\pi$ lies in the least $S$-pinned superset of $\bigcup_m A_m$ iff $\pi0\in S\setminus\{0\}$ and $\pi\pi0=0$, or $\pi0\notin S$ and $0\notin\pi(S)$, and the 3-cycle $(0\ N{+}1\ N{+}2)$ shows these strictly shrink for $S=\{0,\ldots,N\}$. So the family has no least upper bound. It is in the domain, and so is the relation pairing $A_m$ with the $m$-th numeral at type $t$: both are codomain intensions, holding at arrows into $W_1$ as at the identity and of nothing at arrows into $W_0$, so pinned down by $\emptyset$ and symmetric. The numerals at $t$ are standard at $W_1$ by the same fullness, so the family is countable relative to $t$. This uses no individuals, so it holds in every variant.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Each object carries the ideal of finite sets, and the domains hold the finitely pinned symmetric entities of every type. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Necessity of Second-Order Analysis.

Let $v$ be reachable from the evaluation point. If every type is finite at $v$ there is no real number structure there, an ordered field having the infinitely many distinct elements $0$, $1$, $1+1$, and so on. Otherwise let $D$ be as in the condition. Carry the real numbers onto $D$ by a bijection: the carrier, order, sum, product, $0$, $1$ and natural numbers are sets of tuples from $D$, so extensions at $v$ of entities there, which form a real number structure $\mathfrak R^*$ at $v$, its completeness and the leastness of its natural numbers being tested against subproperties whose extensions are all the subsets of $D$. Its second-order quantifiers, applied to tuples from $D$, range over all relations on $D$, so for each second-order analytical sentence $A$, $A(\mathfrak R^*)$ holds at $v$ iff $A$ is true of the real numbers under full second-order semantics. Any real number structure $\mathfrak R$ at $v$, of any type, is isomorphic to $\mathfrak R^*$ by a relation in the domain there (Huntington's theorem, a theorem of C: Background, Analysis), and $A(\mathfrak R)\leftrightarrow A(\mathfrak R^*)$ is a theorem of C given such an isomorphism, relations on one carrier being carried to the other by comprehension. So at every reachable object every real number structure satisfies exactly the second-order analytical sentences true of the reals, and each instance $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R) \to A(\mathfrak R)$ or $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ of the Necessity of Second-Order Analysis holds, with the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis. The choice of the bijection with the reals needs no choice principle, $D$ having the cardinality of the continuum.

*General argument `arguments/second-order-analysis-full-continuum`. It requires that At every object $v$ reachable from the evaluation point, either every type has finitely many entities at $v$, or there is a set $D$ of continuum many entities of one type at $v$ such that, for each $k\ge1$, every set of $k$-tuples from $D$ is the extension at $v$ of an entity in the domain there. Here: At a reachable object $v$, let $\tau$ be a type with infinitely many orbits there, and for a set $A$ of them let $Y_A$ be the intension of type $\tau t$ whose value at an arrow into $v$ is the union of the orbits in $A$ and at other arrows is empty: symmetric, the values being invariant, and pinned down by $\emptyset$, so in the domain; its transport along any arrow depends only on the arrow's codomain. The $Y_A$ are continuum many and pairwise distinct at $v$. For a set $T$ of $k$-tuples of them, the intension whose value at an arrow $h$ is the set of transports along $h$ of the tuples in $T$ depends only on $h$'s codomain, is symmetric, each such transport being fixed by the target's symmetries, and is pinned down by $\emptyset$; its extension at $v$ is $T$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The actual-world proposition is the set of all arrows $W_0\to W_0$, in the domain by the source argument; at every world an arrow into $W_1$ leads outside it, and such an arrow carries it to the empty set. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.


## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Everything that implies these fails with them. Plenitude still holds by C5 plus Actuality and Propositions 2.5 and 2.14, so this model separates it from Functional Choice even under C5, Rigid Comprehension and Boolean Completeness. This does not settle whether C5 plus Functional Choice implies Atomicity: the model fails the proposed premise.

## History

The record's revision log before it was written as arguments.

- **2026-09-24** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Resolved the choice questions by the finite-support transposition argument in the accompanying write-up. Relational Choice fails already for selection from two-element properties of individuals; haecceity coding gives an admitted relational-output counterinstance to Functional Choice. The original construction and its source attribution are unchanged; these choice verifications are new. Now violates: Relational Choice, Functional Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Expanded the description from Appendix D; settled the Distinctness-preserving collapse. Now violates: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Noted why Relational Choice is left unknown: the construction goes beyond ideal fullness, so the extensional-fullness argument used for the other Appendix D models does not apply as stated.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Relabelled as a symmetric ideally-full model, the precursor of the draft’s construction, at Cian Dorr’s direction; the id changed from finite-support-qualitative-contrast, which nothing referenced.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Relational Choice, at types (e→t) and e: a functional subrelation of the serial relation pairing each property with its members would be symmetric and finitely pinned, and a symmetry fixing its pinning set would carry its choice for the property of lying outside that set to a second choice. Cian Dorr’s observation that a choice cannot be finitely pinned; argument in the notes. Now violates: Relational Choice.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □ND, Actuality. Now violates: □Actuality, Atomicity.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, final construction (two copies of N).
- **GPT-6 proof 24 Sep** — OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 24 September 2026. Finite-support transposition proof that Relational Choice and Functional Choice fail at W0, following the user’s suggestion to transfer Plenitude countermodels to Functional Choice; see the accompanying write-up.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-qualitative-contrast.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, final construction (two copies of N)
- **Related: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Definition 39, p. 19. The draft’s symmetric ideally-full models generalise this construction; its two-object model of Definition 39 is the closest relative.
