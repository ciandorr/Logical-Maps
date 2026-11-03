# Finitely pinned action model: Cantor fan of terminal worlds

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026 (the construction, as a model of Self-Atomicity without Atomicity); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **□Well-Ordering.** Necessarily, every type, including e, is well-ordered by some relation.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.
- **¬ 5.** Every possible proposition is necessarily possible.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ □Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ □Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An ideally full action model in the sense of Classicism, Appendix D, over a category with two objects, each carrying the ideal of finite sets: a model of C by Proposition D.4. The member's construction and evaluation point follow.

The category has two objects $W_0$ and $V$; its non-identity arrows are $k_u:W_0\to V$, one for each $u\in2^{\mathbb N}$, so $V$ is terminal and every composite is an identity or some $k_u$. The individuals are $\mathbb N$ at $W_0$ and $\{0,1\}$ at $V$, and $k_u$ acts on them as $u$. The domain of propositions at $W_0$ therefore consists of the sets of arrows pinned down by a finite $N\subseteq\mathbb N$: the sets $p$ such that $k_u\in p$ and $u^{\prime}|_N=u|_N$ imply $k_{u^{\prime}}\in p$, that is, $\{1\}$ or not together with a clopen subset of Cantor space; at $V$ the domain is $\{\varnothing,\{1_V\}\}$. Evaluation point: $1_{W_0}$. Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finitely pinned action models on two objects, which supplies this definition with the record's settings, and the arguments marked as shared.*

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

### Holds Necessity of Arithmetic.

$V$ is a one-world full model with finitely many entities of every type, so $I_\sigma$ fails at the worlds into $V$; $W_0$ is extensionally full with infinitely many individuals and propositions, so arithmetic is standard there.

*Address: `finite-support-cantor-fan#necessity-of-arithmetic`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Well-Ordering.

At $W_0$ extensional fullness makes a well-order of the domain at the identity an extension there; $V$ is finite and full.

*Address: `finite-support-cantor-fan#well-ordering`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Boolean Completeness (type t), Countable Boolean Completeness, Forcing Possibilism, B for pure sentences.

The propositions at $W_0$ are $\{1_{W_0}\}$ or not with a clopen subset of Cantor space, so the family $a_{2m}$ of finite-support-sections-and-projection has no least upper bound; it is countable relative to $e$, the numerals at $e$ being standard and distinct, and the relation pairing $a_{2m}$ with the $m$th numeral being an extension. $\{1_{W_0}\}$ is the only atom, so no proposition has exactly four below it, though $\bot$, $\{1_{W_0}\}$, its negation and $\top$ form a complete algebra. And there are at least three individuals at $W_0$ and not at $V$, which every $k_u$ sees alone.

*Address: `finite-support-cantor-fan#boolean-completeness-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At $W_0$ the identity is the only arrow into $W_0$, so an intension with any value at the identity and $\varnothing$ at the $k_u$ is pinned down by $\varnothing$; at $V$ the domain is full. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails □Axiom of Infinity (type e).

At the identity arrow of a reachable object $v$ with $n$ individuals there are not $n+1$ individuals any two of which are distinct, distinctness implying literal distinctness, identity being reflexive. So the Infinity schema at type $e$ fails there, and with it the Axiom of Infinity at type $e$, which implies it in C (axiom-of-infinity-e-implies-infinity-e). A closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target (at the world seen, in a Kripke-style model), so the arrow into $v$ is a world at which the Axiom fails, and its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-individuals-somewhere`. It requires that Some object reachable from the evaluation point has finitely many individuals. Here: The terminal object $V$, reached by every $k_u$, has the two individuals $0$ and $1$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails □Axiom of Infinity (type t).

As for individuals (finitely-many-individuals-somewhere), at type $t$: at the identity arrow of a reachable object with $n$ propositions the Infinity schema at type $t$ fails, and so does the Axiom of Infinity at type $t$, which implies it in C (axiom-of-infinity-t-implies-infinity-t); so its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-propositions-somewhere`. It requires that Some object reachable from the evaluation point has finitely many propositions. Here: The terminal object $V$, reached by every $k_u$, has the two propositions $\varnothing$ and $\{1_V\}$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At $W_0$ the identity is the only arrow into $W_0$, so an intension with any value at the identity and $\varnothing$ at the $k_u$ is pinned down by $\varnothing$; at $V$ the domain is full. It requires that There are infinitely many individuals at the evaluation world. Here: The individuals at $W_0$ are the natural numbers. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At $W_0$ the identity is the only arrow into $W_0$, so an intension with any value at the identity and $\varnothing$ at the $k_u$ is pinned down by $\varnothing$; at $V$ the domain is full. It requires that There are infinitely many propositions at the evaluation world. Here: The clopen subsets of Cantor space. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: An intension depending only on the codomain is pinned down by $\varnothing$, and the model is ideally full. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: $\{1_{W_0}\}$ is pinned down by $\varnothing$, since its transport along every $k_u$ is empty, and it entails every truth; no arrow leads back to $W_0$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: An intension depending only on the codomain is pinned down by $\varnothing$, and the model is ideally full. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At $W_0$ the identity is the only arrow into $W_0$, so an intension with any value at the identity and $\varnothing$ at the $k_u$ is pinned down by $\varnothing$; at $V$ the domain is full. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: $\{1_{W_0}\}$ is pinned down by $\varnothing$, and at $V$ the domain is full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: No arrow leads into $W_0$, and $V$ has only its identity. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At $W_0$ the identity is the only arrow into $W_0$, so an intension with any value at the identity and $\varnothing$ at the $k_u$ is pinned down by $\varnothing$; at $V$ the domain is full. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

Built to show that Self-Atomicity does not imply Atomicity, even with Actuality, Strong Actuality and BF (type t): a root whose propositions are the clopen sets of Cantor space, each point of which is a terminal world. Every nonempty clopen set is a self-atom, becoming the actual-world proposition at each of its points, but none is an atom. Strong Atomicity (type t) fails with Atomicity.

## Sources

- **Fable 25 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, survey of Strong Atomicity results under Self-Atomicity, 25 October 2026 (session transcript).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Definitions D.1–D.3 and Proposition D.4, pp. 73–74.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-cantor-fan.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Definitions D.1–D.3 and Proposition D.4, pp. 73–74. Ideally full action models with the ideal of finite sets are models of C.
