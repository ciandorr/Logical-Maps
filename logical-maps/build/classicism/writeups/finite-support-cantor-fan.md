# Finitely pinned action model: Cantor fan of terminal worlds

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026 (the construction, as a model of Self-Atomicity without Atomicity); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.
- **¬ 5.** Every possible proposition is necessarily possible.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An ideally full action model in the sense of Classicism, Appendix D, with the ideal of finite sets. The category has two objects $W_0$ and $V$; its non-identity arrows are $k_u:W_0\to V$, one for each $u\in2^{\mathbb N}$, so $V$ is terminal and every composite is an identity or some $k_u$. The individuals are $\mathbb N$ at $W_0$ and $\{0,1\}$ at $V$, and $k_u$ acts on them as $u$. The domain of propositions at $W_0$ therefore consists of the sets of arrows pinned down by a finite $N\subseteq\mathbb N$: the sets $p$ such that $k_u\in p$ and $u^{\prime}|_N=u|_N$ imply $k_{u^{\prime}}\in p$, that is, $\{1\}$ or not together with a clopen subset of Cantor space; at $V$ the domain is $\{\varnothing,\{1_V\}\}$. Evaluation point: $1_{W_0}$. Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

## Arguments

### Holds □Self-Atomicity, □Atoms are self-atoms, □Atoms are strong atoms.

At $W_0$ an entity of a relational type is a pinned intension $I$, a set of pairs $\langle k,\bar a\rangle$. Its pairs at $1_{W_0}$ form singletons $\{\langle1,\bar a\rangle\}$, each pinned down by $\varnothing$ (its transport along every $k_u$ is empty), which are atoms, self-atoms and strong atoms, the transport being empty. Its pairs at arrows $k_u$ form sets $\{\langle k_u,b_u\rangle : u\in C\}$ with $C$ clopen and $b_u$ depending on finitely many coordinates of $u$; such a set is pinned, and it is a self-atom, since at each $k_u$ it becomes $\{\langle1_V,b_u\rangle\}$, an atom of the full domain at $V$. So every possible entity at $W_0$ has a self-atom below it. No atom lies over the $k_u$: a nonempty pinned set over a cylinder splits by a further coordinate. So at $W_0$ the atoms are the singletons at $1_{W_0}$, which are self-atoms and strong atoms. At $V$ the domain is full with one arrow, so all three principles hold there; hence all three are necessary.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails Atomicity (type t), Self-atoms are atoms (type t).

The proposition $\neg\{1_{W_0}\}$, the set of all $k_u$, is possible and pinned down by $\varnothing$, and no atom lies below it: a nonempty pinned subset contains a cylinder, which splits into two nonempty cylinders. So Atomicity (type t) fails. The same set is a self-atom that is not an atom, so Self-atoms are atoms (type t) fails.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds BF (type t).

Each $k_u$ acts surjectively at type $t$, the two propositions at $V$ being the transports of $\varnothing$ and of the set of all arrows; so BF (type t) holds at $W_0$ (Classicism, Proposition 3.24(ii)).

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails ND (type t), 5.

$k_u$ sends both $\varnothing$ and $\{1_{W_0}\}$ to $\varnothing$, so it is not injective at type $t$ and ND (type t) fails (Proposition 3.24(i)). And $\Diamond\{1_{W_0}\}$ is true while $\Box\Diamond\{1_{W_0}\}$ is false, every $k_u$ transporting $\{1_{W_0}\}$ to $\varnothing$; so 5 fails.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: $\{1_{W_0}\}$ is pinned down by $\varnothing$, since its transport along every $k_u$ is empty, and it entails every truth; no arrow leads back to $W_0$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: $\{1_{W_0}\}$ is pinned down by $\varnothing$, and at $V$ the domain is full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: No arrow leads into $W_0$, and $V$ has only its identity. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

Built to show that Self-Atomicity does not imply Atomicity, even with Actuality, Strong Actuality and BF (type t): a root whose propositions are the clopen sets of Cantor space, each point of which is a terminal world. Every nonempty clopen set is a self-atom, becoming the actual-world proposition at each of its points, but none is an atom. Strong Atomicity (type t) fails with Atomicity.

## Sources

- **Fable 25 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, survey of Strong Atomicity results under Self-Atomicity, 25 October 2026 (session transcript).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Definitions D.1–D.3 and Proposition D.4, pp. 73–74.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-cantor-fan.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Definitions D.1–D.3 and Proposition D.4, pp. 73–74. Ideally full action models with the ideal of finite sets are models of C.
