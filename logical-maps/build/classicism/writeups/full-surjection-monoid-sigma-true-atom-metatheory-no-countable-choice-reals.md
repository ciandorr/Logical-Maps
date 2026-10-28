# Full action model: surjections of an infinite set [Σ true atom; ZF + ¬AC_ω(ℝ)]

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

Use the monoid of surjections of an infinite set, at its sole object.

Individuals, fixed for this record: there is a single individual at every object, and every arrow sends it to the single individual at its target.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition $\{1\}$; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

Metatheory, fixed for this record: the construction is carried out in ZF together with the hypothesis that some countable family $(A_n)_{n\in\omega}$ of nonempty sets of sets of natural numbers has no choice function ($\neg\mathrm{AC}_\omega(\mathbb R)$), which holds in Cohen's basic model. An infinite set the construction leaves unspecified is $\mathbb N$. ZF with this hypothesis is consistent if ZF is, so the verdicts of this record are relative-consistency claims of the same standing as those of a record in ZFC.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Fails Analytic Necessitism.

Write $w$ for the evaluation object and $k$ for an arrow out of it with no retraction. No entity $x$ of a relational type at $w$ is determined by its transport along $k$: the identity of $w$ is not of the form $j\circ k$, such a $j$ being a retraction, and the model being full, the intension $y$ agreeing with $x$ at every arrow but the identity, where it takes another value, is in the domain, while $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. Suppose then that $\mathfrak R$ were a rigid real number structure at $w$ at a relational type, necessarily a real number structure (Background, Analysis), with carrier $X$. For an instance $x$ of $X$ and $y$ as above, persistence gives $k\cdot x\in X_k$, so $k\cdot y\in X_k$; inextensibility then gives $Xy$; and the necessary distinctness of the instances gives $k\cdot y\ne k\cdot x$, a contradiction. So $X$ has no instance and is no complete ordered field. The antecedent of Analytic Necessitism holds nevertheless, at some relational type. The propositions at $w$ are the sets of the infinitely many arrows out of it, the sets of sets of propositions are Dedekind-infinite (a theorem of ZF for any infinite set), and the entities of type $ttt$ at $w$, which include one with any given extension at the identity, include a copy of the sets of natural numbers and so of the real numbers; the model being full, the order, sum and product of the reals are the extensions at the identity of relations in the domain, every subset of that carrier is the extension of a subproperty, so the structure is complete, and its least inductive subproperty is its natural numbers. So $\exists\mathfrak R\,.\,\operatorname{Real}_{ttt}(\mathfrak R)$ holds at $w$ while the consequent of Analytic Necessitism fails there: Analytic Necessitism fails. (When the arrows out of $w$ include a copy of the natural numbers, as in the recorded instances, the same argument runs at type $t$.) No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: Halving is not injective, so no surjection $m$ has $m\circ k=1$ for it. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions are all the sets of arrows, and there are infinitely many surjections. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Intensional Choice, Relational Choice.

Let $(A_n)$ be the family with no choice function. For a set $C$ of natural numbers let $p_C:=\{h_m : m\in C\}$, a proposition at the evaluation object since the model is full; along $h_n$ it becomes $h_n\cdot p_C$, from which $C$ is recovered as $\{m : h_m\circ r_n\in h_n\cdot p_C\}$, since $h_m\circ r_n\circ h_n=h_m$. Intensional Choice at type $t$: let $F$ hold at $h_n$ of the propositions $h_n\cdot p_C$ with $C\in A_n$, and at every other arrow of every proposition. It is in the domain, the model being full, and necessarily instantiated. A $G\le F$ necessarily uniquely instantiated holds at $h_n$ of a single $h_n\cdot p_{C_n}$ with $C_n\in A_n$, and $n\mapsto C_n$ would be a choice function. Relational Choice at types $t$ and $t$: let $U$ relate $p_{\{n\}}$ to each $p_C$ with $C\in A_n$, and every other proposition to every proposition. It is serial, and a functional subrelation would relate each $p_{\{n\}}$ to a single $p_{C_n}$ with $C_n\in A_n$, again a choice function. Both principles therefore fail. (The analysis of 3 October 2026: Intensional Choice is choice over worlds, Relational Choice over the elements of a domain.)

*General argument `arguments/countable-choice-reals-full`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are pairwise distinct arrows $h_n$ out of the evaluation object, one for each natural number $n$, each with a retraction $r_n$, all given by the construction without choice. Here: $h_0$ the identity and $h_n$ a transposition, a surjection that is its own retraction: of $0$ and $n$ when the infinite set is $\mathbb N$ (with choice, or in the variant without countable choice), and of the two members of $P_n$ when it is the union of the socks. It requires that The construction is carried out in ZF together with a countable family $(A_n)_{n\in\omega}$ of nonempty sets of sets of natural numbers that has no choice function ($\neg\mathrm{AC}_\omega(\mathbb R)$). Here: This is the hypothesis. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails Truth implies ND-necessity.

Let $p:=\{1\}$, in the domain since the model is full, and true. Any witness $q$ for $\Box_{\ne}p$ is true, so contains the identity; under an arrow $i\ne 1$ with a retraction $r$, the arrow $r\circ i=1$ makes $\Diamond q$ true, while $p$ is false. So no true $q$ has $\Box(\Diamond q\to p)$. (The surjection monoid's own argument of 23 September, stated once.)

*General argument `arguments/dpc-returning-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object other than its identity has a retraction: an arrow back after which it composes to the identity. Here: A bijection other than the identity, which its inverse retracts. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Forcing Possibilism.

In a full action model the propositions at the evaluation object are all the sets of arrows out of it, so the algebra of propositions is atomic, the singletons being its atoms, and it has $2^{|A|}$ elements for $A$ the set of those arrows. Since the sets of natural numbers inject into $A$, the sets of sets of natural numbers inject into the propositions. Take the regular-open algebra $B$ of Cantor space: a complete atomless Boolean algebra in ZF, of the size of the continuum, which therefore injects into the propositions while the propositions do not inject into it (Cantor), so that, realised as a property of propositions with its order as a relation among them, both present since the model is full, it is an internal complete Boolean algebra that is small. Forcing Possibilism would give a proposition $p\ne\top$ whose entailment algebra is isomorphic to $B$. But the entailment algebra below a nonzero proposition is atomic, every nonempty set of arrows including a singleton, and the one below $\bot$ has one element; neither is isomorphic to an infinite atomless algebra. So Forcing Possibilism fails. No choice is used: the injection into the arrows is given by the condition, and Cantor's theorem and the completeness of the regular-open algebra hold in ZF.

*General argument `arguments/forcing-possibilism-continuum-arrows`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that The continuum injects into the arrows out of the evaluation object: there is an injection from the sets of natural numbers into them, given outright, without choice. Here: Once the infinite set contains the natural numbers (by choice, or because it is $\mathbb N$ in the variant without countable choice), a set $C$ of natural numbers is sent to the surjection that swaps $2n$ and $2n+1$ for each $n\in C$ and fixes everything else, a bijection; distinct sets give distinct surjections. With socks the set need contain no copy of the natural numbers. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □BF.

BF holds at an object whose arrows out all act surjectively at every type (Proposition 3.24(ii)). In a full model the transport of intensions along an epimorphism $k$ is onto: an intension $Y$ at its target is the transport of $\{\langle\bar a,k\circ m\rangle : \langle\bar a,m\rangle\in Y\}$, since $k\circ m=k\circ m'$ only if $m=m'$; and on the individuals the arrows are onto by the condition. So BF holds at every object reachable from the evaluation point, and BF is necessary.

*Source: Classicism, §3.5, Proposition 3.24(ii). General argument `arguments/full-epic-barcan`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Every arrow out of every object reachable from the evaluation point is an epimorphism (arrows after it that agree after it are equal) and acts surjectively on the individuals. Here: A surjection $k$ is an epimorphism among the surjections, $m\circ k=m^{\prime}\circ k$ giving $m=m^{\prime}$; and on the individuals every arrow is the identity. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Self-atoms are atoms (type t).

The proposition $\{k,k^{\prime}\}$ is a self-atom: its transport along $k$ is $\{m : m\circ k\in\{k,k^{\prime}\}\}$, which is $\{1\}$ since only the identity fixes $k$ and $k^{\prime}$ is not a left multiple of $k$, and likewise along $k^{\prime}$; at every other arrow it is false. It is not an atom, since $\{k\}$ lies strictly below it.

*General argument `arguments/full-incomparable-free-arrows-self-atom`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Two distinct arrows $k,k^{\prime}$ out of the evaluation object are each fixed under post-composition only by the identity, and neither is a left multiple of the other: $k^{\prime}\ne m\circ k$ and $k\ne m\circ k^{\prime}$ for every $m$. Here: Two surjections of $\mathbb N$ with incomparable kernels, say one identifying only $0,1$ and one identifying only $2,3$: a surjection is fixed only by the identity, and $k^{\prime}=m\circ k$ requires the kernel of $k$ to lie inside that of $k^{\prime}$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions are all the sets of arrows, and there are infinitely many surjections. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not its identity. Here: Halving. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Rigid Power, □Rigid Power.

Write $X_0(E)$ for the intension $k\mapsto k\cdot E$. The extension at an arrow $h$ of the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ is the set of rigid $X$ with $X\le h\cdot F$, the bound variable ranging over the domain untransported and the parameter transported. By the condition the rigid relations are the $X_0(E)$, and $X_0(T)\le X_0(S)$ iff $T\subseteq S$; so for rigid $F=X_0(S)$ the power property has extension $\{X_0(T'):T'\subseteq k\cdot S\}$ at $k$, while transporting its extension at the identity along $k$ gives $\{X_0(k\cdot T):T\subseteq S\}$. These coincide, since every $T'\subseteq k\cdot S$ is $k\cdot T$ for $T:=\{s\in S:k\cdot s\in T'\}$. So the power property is itself $X_0$ of its extension, hence rigid, and the same at every reachable object gives the boxed form.

*General argument `arguments/rigid-power-tight`. It requires that At every object reachable from the evaluation point, the rigid relations of each relational type are exactly the intensions $k\mapsto k\cdot E$, the disjunctions of the haecceities of the members of $E$, for $E$ any set of tuples from the domains there; in particular every such intension is in the domain. Here: Every intension is present, so for any set $E$ the intension $k\mapsto k\cdot E$ is in the domain, and a relation is weakly inextensible at a world iff it lies below that intension over its extension there, since that is the smallest intension satisfying the hypothesis; with persistence, a rigid relation equals it (the argument deferred in extraction.md, 3 October 2026). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026 (full action models); extended by Claude Fable 5.1, prompted by Cian Dorr (Anthropic), 4 October 2026, at Cian Dorr's direction.*

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* The argument deferred in extraction.md on 3 October for the full action models, where every intension is present, stated under the condition it actually uses, which the symmetry-constrained full models also meet.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails B for sentences of Σ.

B for sentences of Σ fails: the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, which is true, and under an arrow from which no world in $a$ is accessible $\Diamond a$ is false, so $\Box\Diamond a$ fails.

*General argument `arguments/sigma-true-atom-b`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The singleton $a$ of the identity arrow is in the domain, the model being full. It is necessary at no world: a world other than the identity sees itself, which lies outside $a$, and the identity sees an arrow other than itself. And a non-identity arrow $k$ does not fix it, since $1\in k\cdot a$ would need $1\circ k=1$. It requires that Some world sees no world at which the actual-world proposition is true. Here: A surjection that is not injective: no composite with it is the identity. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The B clause of the records' Σ-as-true-atom argument, stated once for the topic.

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The singleton $a$ of the identity arrow is in the domain, the model being full. It is necessary at no world: a world other than the identity sees itself, which lies outside $a$, and the identity sees an arrow other than itself. And a non-identity arrow $k$ does not fix it, since $1\in k\cdot a$ would need $1\circ k=1$. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object has no retraction. Here: Halving is not injective, so no surjection $m$ has $m\circ k=1$ for it. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References.
The source takes infinitely many individuals with a surjective action, such as the surjections' action on the set by evaluation. That action gives, on the map's principles, what the variant with infinitely many fixed individuals gives: it is surjective and homogeneous, and the failure of ND at type $e$ that its non-injectivity brings adds nothing, ND failing already at type $t$.

## History

The record's revision log before it was written as arguments.

- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell) — Added Transversal Choice, by the argument recorded for Relational Choice: a full model contains every intension, in particular one whose extension at the evaluation point is a transversal, chosen in the metatheory, of the extension there of an equivalence relation; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the Distinctness-preserving collapse; see the notes. Now violates: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Corrected the justification of □Strong Atomicity (type t): the 22 September argument tacitly used that the monoid is right-cancellative, which holds here; no verdict changes.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added □Strong Atomicity (type t): every singleton of an arrow is a strong atom in a propositionally full one-object model; see the notes. Now satisfies: □Strong Atomicity (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. Added both Axioms of Infinity: the individuals are an infinite set and the arrows an infinite monoid, identity at the identity arrow is literal, and the numeral sets at each type are intensions of a full model, so no finite cardinality holds of the universal property at type e or at type t. Now satisfies: Relational Choice, Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality, □BF, No Pure Contingency. Now violates: ND (type t).

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, third paragraph; p. 61 and n. 84.

<p class='cert'>Record: <code>topics/classicism/models/full-surjection-monoid.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, third paragraph; p. 61 and n. 84
- **Proof: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — Proposition A.3, as cited in Classicism p. 59
