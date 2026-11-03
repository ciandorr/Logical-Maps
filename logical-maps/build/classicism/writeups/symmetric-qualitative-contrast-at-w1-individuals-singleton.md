# Symmetric ideally-full model: qualitative contrast, evaluated at W1 [one individual]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (evaluation at $W_1$ and the Relational Choice verdict), on the construction of Andrew Bacon and Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Transversal.** Necessarily, there is a property of properties that picks out exactly one property from each coextension class, that is, exactly one property coextensive with any given property.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The construction of symmetric-qualitative-contrast (Bacon and Dorr, Appendix D, p. 79): two objects $W_0$ and $W_1$, both copies of $\mathbb N$, all permutations of $\mathbb N$ as the arrows between any pair of objects, the ideal of finite sets at each, and the symmetry groups $G_{W_0}$ = all permutations and $G_{W_1}$ trivial. Evaluation point: $W_1$, at its identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □ND.

As at $W_0$ (symmetric-qualitative-contrast): every arrow is invertible, so transport along an arrow is injective at every type, and identity and distinctness persist along every arrow, from every object.

*Address: `symmetric-qualitative-contrast-at-w1-individuals-singleton#c5`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Relational Choice.

At $W_1$ every relation between the entities there is the extension of a relation in the domain. Given a set $R$ of tuples, let $\hat R$ have value $R$ at every arrow into $W_1$ and $\emptyset$ at every arrow into $W_0$. Parallel arrows get the same value, so $\hat R$ is pinned down by $\emptyset$; at $W_1$ there is no symmetry condition, $G_{W_1}$ being trivial, and the empty value meets the one at $W_0$. So for a serial relation, a choice of one output for each input, made in the metatheory, is the extension of a functional subrelation in the domain.

*Address: `symmetric-qualitative-contrast-at-w1-individuals-singleton#relational-choice`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Transversal, Necessity of Second-Order Analysis.

Every arrow leads to $W_0$ or $W_1$, and from each object to both, so a boxed sentence, or a disjunction of them, holds at $W_1$ iff at $W_0$. Transversal holds at $W_0$ (from Actuality) and at $W_1$ (from Transversal Choice), so □Transversal holds; Necessity of Second-Order Analysis holds at $W_0$ (recorded).

*Address: `symmetric-qualitative-contrast-at-w1-individuals-singleton#transfer-boxed`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Axiom of Infinity (type t).

The numerals at $t$ form a property pinned down by $\varnothing$, so finite cardinality is standard, and the propositions that an arrow into $W_1$ sends $0$ to $n$, one for each $n$, are distinct.

*Address: `symmetric-qualitative-contrast-at-w1-individuals-singleton#infinity-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Atomlessness, Forcing Possibilism.

Any two arrows into $W_0$ differ by a member of $G_{W_0}$, so a proposition contains all of them or none; the proposition $q_0$ of the arrows into $W_0$, pinned down by $\varnothing$, is an atom. A nonzero set of arrows into $W_1$, pinned down by a finite $N$, is split by the value of the arrow at a point outside $N$; so the propositions below a proposition other than $\top$ number $1$, $2$ or infinitely many. But $\bot$, $q_0$, $\neg q_0$ and $\top$ form a complete four-element Boolean algebra, so Forcing Possibilism fails.

*Address: `symmetric-qualitative-contrast-at-w1-individuals-singleton#atom-at-w0`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Each object carries the ideal of finite sets, and the domains hold the finitely pinned symmetric entities of every type. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds □Axiom of Infinity (type t).

As for individuals (necessary-axiom-of-infinity-individuals), at type $t$. At the identity arrow of each reachable object $v$, with $\Phi$ of type $(tt)t$ holding there of exactly the properties of propositions with finite extension, $\lambda Y^{(tt)t}\, .\,\forall X^{tt}\, .\,YX\to\Phi X$ is in the domain, holds of $\mathbf 0_t$, and passes to successors, identity at $t$ being literal at $1_v$; so every finite cardinality holds only of properties with finite extension, and none holds of the universal property of propositions, whose extension is the infinite set of propositions at $v$. So the Axiom of Infinity at type $t$ holds at every reachable object, and its necessitation at the evaluation point.

*General argument `arguments/necessary-axiom-of-infinity-propositions`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: Each object's domains hold every symmetric intension pinned down by a set in its ideal (the finite sets, at both objects). The intension holding at each arrow, into $U$, of exactly the entities of type $\sigma t$ at $U$ with finite extension at $1_U$ depends only on the codomain and is preserved by the symmetries, so it is symmetric and pinned down by $\emptyset$; haecceities are symmetric and pinned down by the sets pinning their entities, so identity is literal. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: Both objects are reachable from each. At either object the sets $\{h:\operatorname{cod}h=W_1,\ h(0)=n\}$, one for each $n$, are pinned down by $\{0\}$ and symmetric, $W_1$'s symmetry group being trivial; they are pairwise distinct. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Recorded for the separation of Relational Choice from its necessitation under C5: Relational Choice holds at $W_1$ because its symmetry group is trivial, and fails at $W_0$, which $W_1$ sees. Astra's note also shows that □Relational Choice fails at $W_1$ with relational outputs as well (input and output type $e\to t$, through haecceities), and that the model satisfies its strong "logical observer" separation principles, which the map does not record.

## Sources

- **Astra via Kodsi 25 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Logical observers and Choice, research note of 25 October 2026, §§3–4 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, final construction (two copies of N).

<p class='cert'>Record: <code>topics/classicism/models/symmetric-qualitative-contrast-at-w1.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, final construction (two copies of N). The construction of symmetric-qualitative-contrast, evaluated at the other object.
