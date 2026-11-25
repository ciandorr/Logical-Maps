# Full action model: ω-chain, one new individual at each step

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026; the construction extends Cian Dorr's two-object chain with a new individual (11 October 2026) along the natural numbers; recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Package

- **□Potential Infinity (type e).** Necessarily, for every natural number there could be at least that many individuals.
- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Truths are 5-necessary.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□BF (relational types).** Necessarily, BF holds at every relational type.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **□Two-hat necessities are ND-necessary.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ □Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

A full action model over the natural numbers in their order: objects $W_k$ for $k\in\mathbb N$, with exactly one arrow $f_{jk}:W_j\to W_k$ when $j\le k$ and none otherwise, evaluated at the identity of $W_0$. The individuals at $W_k$ are $0,\ldots,k$, and $f_{jk}$ acts on them as the inclusion. Every intension of every relational type is present at each object.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

## Arguments

### Holds □Potential Infinity (type e).

At every object the numbers counted at type $e$ are the numerals, the model being full (as in the argument arithmetic-necessitism-extensionally-full), and transport along an arrow carries each numeral to the same numeral at the target. The numeral $\operatorname{Suc}^n_e\mathbf 0_e$ holds at the identity of an object of exactly the properties whose extension there has $n$ members, identity at type $e$ being literal at an identity arrow. So at $W_k$, for each number $n$, the arrow $f_{kj}$ with $j\ge k$ and $j+1\ge n$ is a world at which that number holds of some property, $W_j$ having $j+1$ individuals, every set of which is the extension of a property. So Potential Infinity (type $e$) holds at the identity of every object. A closed sentence holds at an arrow exactly when it holds at the identity of the arrow's target, so its necessitation holds at the evaluation point.

*Address: `full-omega-chain-new-individuals#potential-infinity-e`. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-24.*

### Fails Possible Infinity (type e), Infinity Schema (type e).

There are $k+1$ individuals at $W_k$, so the numeral $\operatorname{Suc}^{k+1}_e\mathbf 0_e$, a finite cardinality, holds there of the universal property of individuals, and the Axiom of Infinity at type $e$ fails at every world. And the instance of the Infinity schema saying that there are at least two individuals is false at $W_0$, which has one.

*Address: `full-omega-chain-new-individuals#finitely-many-individuals`. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-24.*

### Fails B for pure sentences.

The closed pure sentence saying that there is exactly one individual, $\exists x^e\, .\,\forall y^e\, .\,y=x$, is true at the identity of $W_0$ and false at every other world, each later object having at least two individuals. So it is true at the evaluation point, and at the world $f_{01}$ it is not possible.

*Address: `full-omega-chain-new-individuals#pure-b`. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-24.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism.

At type $\tau:=tt$. For each object $V$ reachable from the evaluation point fix an injection $A\mapsto E^A_V$ from the sets of natural numbers into the sets of propositions at $V$, possible as these are infinitely many, and let $Y_A$ be the intension whose value at an arrow into $V$ is $E^A_V$: it depends only on the codomain, so it is in the domain, and its transport along an arrow into $V$ is the $Y_A$ of $V$, distinct for distinct $A$. Carry the real numbers onto the $Y_A$ and take as relations the codomain-only intensions whose value at $V$ is the corresponding set of tuples of the $Y_A$ of $V$. Along every arrow the structure is carried to the like structure at the target, an isomorphic copy, which is a real number structure there: bounded sets of its elements have least upper bounds among them and every inductive subproperty contains its natural numbers. Such a structure is rigid, its instances are necessarily distinct, and it is necessarily a real number structure; and the codomain-only intension of type $((\tau)^kt)t$ whose value at each object is the set of codomain-only $k$-ary relations among the carrier there is a represented power of arity $k$, since at every world each $k$-ary relation agrees on the carrier with one of them. So the consequents of Analytic Necessitism and of its second-order form hold, and both principles hold. (The argument of the withdrawn analytic-necessitism-unretracted-arrow would refute this structure; its step from inextensibility is the gap.)

*General argument `arguments/analytic-necessitism-codomain-everywhere`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: The propositions at $W_j$ are the sets of the infinitely many arrows $f_{jk}$, $k\ge j$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, auditing the withdrawn arguments for the failure of Analytic Necessitism, 2026-10-29.*

### Fails Analytic Necessitism.

*Withdrawn 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, after a trawl subagent's report: The step from $k\cdot y=k\cdot x\in X_k$ to $Xy$ (or $y\in X_h$) by inextensibility does not follow: inextensibility bounds a rigid carrier from above, by the transports of its actual instances, and puts nothing new into its actual extension. The conclusion is false in many of the models the argument was applied to: entities fixed by every arrow, or transported injectively, can carry a rigid real number structure that is necessarily one (see analytic-necessitism-codomain-fixed and analytic-necessitism-full-continuum).*

Write $w$ for the evaluation object and $k$ for an arrow out of it with no retraction. No entity $x$ of a relational type at $w$ is determined by its transport along $k$: the identity of $w$ is not of the form $j\circ k$, such a $j$ being a retraction, and the model being full, the intension $y$ agreeing with $x$ at every arrow but the identity, where it takes another value, is in the domain, while $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. Suppose then that $\mathfrak R$ were a rigid real number structure at $w$ at a relational type, necessarily a real number structure (Background, Analysis), with carrier $X$. For an instance $x$ of $X$ and $y$ as above, persistence gives $k\cdot x\in X_k$, so $k\cdot y\in X_k$; inextensibility then gives $Xy$; and the necessary distinctness of the instances gives $k\cdot y\ne k\cdot x$, a contradiction. So $X$ has no instance and is no complete ordered field. The antecedent of Analytic Necessitism holds nevertheless, at some relational type. The propositions at $w$ are the sets of the infinitely many arrows out of it, the sets of sets of propositions are Dedekind-infinite (a theorem of ZF for any infinite set), and the entities of type $ttt$ at $w$, which include one with any given extension at the identity, include a copy of the sets of natural numbers and so of the real numbers; the model being full, the order, sum and product of the reals are the extensions at the identity of relations in the domain, every subset of that carrier is the extension of a subproperty, so the structure is complete, and its least inductive subproperty is its natural numbers. So $\exists\mathfrak R\,.\,\operatorname{Real}_{ttt}(\mathfrak R)$ holds at $w$ while the consequent of Analytic Necessitism fails there: Analytic Necessitism fails. (When the arrows out of $w$ include a copy of the natural numbers, as in the recorded instances, the same argument runs at type $t$.) No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object. It requires that Some arrow out of the evaluation object has no retraction. Here: No arrow leads from $W_1$ back to $W_0$, so $f_{01}$ has no retraction. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $W_0$ are the sets of the arrows $f_{0k}$, of which there are infinitely many. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails □Axiom of Infinity (type e).

At the identity arrow of a reachable object $v$ with $n$ individuals there are not $n+1$ individuals any two of which are distinct, distinctness implying literal distinctness, identity being reflexive. So the Infinity schema at type $e$ fails there, and with it the Axiom of Infinity at type $e$, which implies it in C (axiom-of-infinity-e-implies-infinity-e). A closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target (at the world seen, in a Kripke-style model), so the arrow into $v$ is a world at which the Axiom fails, and its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-individuals-somewhere`. It requires that Some object reachable from the evaluation point has finitely many individuals. Here: $W_0$, reached by its identity, has one individual. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Truths are 5-necessary.

In a full action model the actual-world proposition $\{1\}$ is in the domain at every object. Taking it as the witness, $\Box_{\ne}p$ holds at an identity iff $p$ contains every arrow out of that object with a retraction (these are the arrows at which $\Diamond\{1\}$ holds), and $\hat{\hat\Box}p$ iff $p$ contains every invertible arrow out of it (an arrow lies in $\hat\Diamond\{1\}$ iff some retraction of it has a retraction, i.e. iff it is invertible). Full models satisfy necessary Actuality, so $\Box_5=\hat{\hat\Box}$ by Proposition D21 of The Bounds of Possibility. With only identities invertible, $\Box_5$ is the identity operator at every reachable object, so every truth is 5-necessary everywhere.

*General argument `arguments/five-necessity-trivial-isomorphisms`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that Out of every object reachable from the evaluation point, the identity is the only invertible arrow. Here: An arrow $f_{jk}$ with $j<k$ has no arrow back, so only the identities are invertible. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-atoms are atoms.

The argument of full-comparable-free-arrows-self-atoms at every reachable object: a self-atom there is a singleton intension, so an atom.

*General argument `arguments/full-comparable-free-arrows-everywhere-self-atoms`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that At every object reachable from the evaluation point, any two arrows out of it that are each fixed under post-composition only by the identity are comparable: one is a left multiple of the other. Here: Out of $W_j$ the arrows are the $f_{jk}$ with $k\ge j$, each fixed under post-composition only by an identity, and $f_{jl}=f_{kl}\circ f_{jk}$ for $k\le l$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □BF (relational types).

The relational half of full-epic-barcan. In an action model BF at a type $\sigma$ holds at a world iff transport along every arrow out of it is onto the entities of type $\sigma$ at its target: if some $z$ there is no transport, the property of being one is necessary of everything at the world and fails of $z$ after the arrow; and if transport is onto, a property necessary of everything holds of every transport. In a full model the transport of intensions along an epimorphism $k$ is onto at every relational type: an intension $Y$ at its target is the transport of $\{\langle\bar a,k\circ m\rangle:\langle\bar a,m\rangle\in Y\}$, since $k\circ m=k\circ m'$ only if $m=m'$. Nothing here concerns the individuals. So BF holds at every relational type at every object reachable from the evaluation point.

*General argument `arguments/full-epic-barcan-relational`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object. It requires that Every arrow out of every object reachable from the evaluation point is an epimorphism: arrows after it that agree after it are equal. (Unlike epic-arrows, nothing is required of its action on the individuals.) Here: Between two objects there is at most one arrow, so arrows after a given one that agree after it are equal. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-11.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-Atomicity, □Atoms are self-atoms.

In a full model the atoms of a relational type at an object are the singleton intensions $\{\langle k,\bar a\rangle\}$, with $k$ an arrow out of it. Such a singleton is instantiated only at $k$, and its transport along $k$ is $\{\langle m,\bar a\rangle : m\circ k=k\}$, which is the atom $\{\langle 1,\bar a\rangle\}$ at $k$’s target when only the identity fixes $k$. So every atom is a self-atom, and the atom below a non-bottom entity, which the full model supplies, is a self-atom below it. The same holds at every reachable object, so both principles are necessary.

*General argument `arguments/full-self-atomicity-trivial-stabilisers`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that At every object reachable from the evaluation point, the only arrow $m$ with $m\circ k=k$, for an arrow $k$ out of that object, is the identity of $k$’s target. Here: The only arrow from an object to itself is its identity, so $m\circ k=k$ only for $m$ the identity of the target of $k$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Self-atoms are strong atoms.

The argument of full-uniquely-factored-self-atoms-strong at every reachable object.

*General argument `arguments/full-uniquely-factored-everywhere-self-atoms-strong`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that At every object reachable from the evaluation point, any two arrows out of it that are each fixed under post-composition only by the identity are comparable: one is a left multiple of the other. Here: Out of $W_j$ the arrows are the $f_{jk}$ with $k\ge j$, each fixed under post-composition only by an identity, and $f_{jl}=f_{kl}\circ f_{jk}$ for $k\le l$. It requires that At every object reachable from the evaluation point, every arrow $k$ out of it that is fixed only by the identity factors through each arrow $h$ out of it in at most one way: $m\circ h=m^{\prime}\circ h=k$ implies $m=m^{\prime}$. Here: There is at most one arrow between two objects, so an arrow factors through another in at most one way. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $W_0$ are the sets of the arrows $f_{0k}$, of which there are infinitely many. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition, the singleton of the identity of $W_0$, is in the domain and lies below every proposition containing that identity; no arrow leads back to $W_0$ from a later object, so no world outside it sees a world in it. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds □Axiom of Infinity (type t).

As for individuals (necessary-axiom-of-infinity-individuals), at type $t$. At the identity arrow of each reachable object $v$, with $\Phi$ of type $(tt)t$ holding there of exactly the properties of propositions with finite extension, $\lambda Y^{(tt)t}\, .\,\forall X^{tt}\, .\,YX\to\Phi X$ is in the domain, holds of $\mathbf 0_t$, and passes to successors, identity at $t$ being literal at $1_v$; so every finite cardinality holds only of properties with finite extension, and none holds of the universal property of propositions, whose extension is the infinite set of propositions at $v$. So the Axiom of Infinity at type $t$ holds at every reachable object, and its necessitation at the evaluation point.

*General argument `arguments/necessary-axiom-of-infinity-propositions`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: The domains are full at every object, so they contain the haecceities, making identity literal, and an intension with any given extension at each identity arrow. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: The propositions at $W_j$ are the sets of the infinitely many arrows $f_{jk}$, $k\ge j$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds Necessity of Arithmetic.

At each type $\sigma$. At any object $v$ reachable from the evaluation point the numbers at $\sigma$ are the numerals there, as in the argument arithmetic-necessitism-extensionally-full. If the numerals are pairwise distinct at $v$, as they are when $\sigma$ has infinitely many entities there, the $n$th being the cardinality of the properties with $n$ instances, then $\operatorname{Sum}_\sigma$ and $\operatorname{Prod}_\sigma$ are the least relations closed under their clauses, and by extensional fullness the relations whose extensions are the graphs of addition and multiplication on the numerals are present and closed under them, so the two are standard. So an arithmetical sentence $A$ at $\sigma$ has at $v$ its truth value in the standard model. If two numerals coincide at $v$, then $I^*_\sigma$ fails at $v$, since zero is a numeral other than every successor and successor is injective on the numerals only when they are pairwise distinct; and then $I_\sigma=\Diamond I^*_\sigma$ is false at $v$ too, $I^*_\sigma$ being true if possible (Background, [[potential-infinity-forms]]). So $\Box(I_\sigma\to A)$ holds when $A$ is true in the standard model and $\Box(I_\sigma\to\neg A)$ when it is false. No choice is used.

*General argument `arguments/necessity-of-arithmetic-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-30.*

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The case of a type with finitely many entities at $v$ had argued that two numerals then coincide at every object $v$ sees, the type being finite at each by the condition finite-types-stay-finite. That needs a finite bound on those objects, not only that each is finite: in [[full-omega-chain-new-individuals]] every object has finitely many individuals and the numerals at type $e$ are pairwise distinct at each. The cases are now divided by whether the numerals are pairwise distinct at $v$, and the condition is no longer required: where they coincide $I^*_\sigma$ fails, and with it $I_\sigma$, which is Potential Infinity at $\sigma$.

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that Some arrow out of the evaluation object is not its identity. Here: The arrow $f_{01}$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Relational Choice.

The truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61).

*General argument `arguments/relational-choice-full-boxed`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The two-object full action models' copies stated once for the topic, for every full action model.

### Holds Relational Choice.

With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models.

*General argument `arguments/relational-choice-full`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The full action models' copies stated once for the topic.

### Holds Rigid Power, □Rigid Power.

Write $X_0(E)$ for the intension $k\mapsto k\cdot E$. The extension at an arrow $h$ of the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ is the set of rigid $X$ with $X\le h\cdot F$, the bound variable ranging over the domain untransported and the parameter transported. By the condition the rigid relations are the $X_0(E)$, and $X_0(T)\le X_0(S)$ iff $T\subseteq S$; so for rigid $F=X_0(S)$ the power property has extension $\{X_0(T'):T'\subseteq k\cdot S\}$ at $k$, while transporting its extension at the identity along $k$ gives $\{X_0(k\cdot T):T\subseteq S\}$. These coincide, since every $T'\subseteq k\cdot S$ is $k\cdot T$ for $T:=\{s\in S:k\cdot s\in T'\}$. So the power property is itself $X_0$ of its extension, hence rigid, and the same at every reachable object gives the boxed form.

*General argument `arguments/rigid-power-tight`. It requires that At every object reachable from the evaluation point, the rigid relations of each relational type are exactly the intensions $k\mapsto k\cdot E$, the disjunctions of the haecceities of the members of $E$, for $E$ any set of tuples from the domains there; in particular every such intension is in the domain. Here: Every intension is present, so for any set $E$ the intension $k\mapsto k\cdot E$ is in the domain, and with persistence a rigid relation equals it (as for the group full-action-models). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026 (full action models); extended by Claude Fable 5.1, prompted by Cian Dorr (Anthropic), 4 October 2026, at Cian Dorr's direction.*

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* The argument deferred in extraction.md on 3 October for the full action models, where every intension is present, stated under the condition it actually uses, which the symmetry-constrained full models also meet.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: The singleton of the identity arrow at any object is in the domain, the model being full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: Only the identities have retractions, and each has just itself. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds □Two-hat necessities are ND-necessary.

In a full action model the actual-world proposition $\{1\}$ is in the domain at every object. Taking it as the witness, $\Box_{\ne}p$ holds at an identity iff $p$ contains every arrow out of that object with a retraction (these are the arrows at which $\Diamond\{1\}$ holds), and $\hat{\hat\Box}p$ iff $p$ contains every invertible arrow out of it (an arrow lies in $\hat\Diamond\{1\}$ iff some retraction of it has a retraction, i.e. iff it is invertible). Full models satisfy necessary Actuality, so $\Box_5=\hat{\hat\Box}$ by Proposition D21 of The Bounds of Possibility. When every retracted arrow is invertible, the two boxes coincide at every reachable object, so $\Box_{\ne}=\hat{\hat\Box}$.

*General argument `arguments/two-hat-nd-retracted-invertible`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that Out of every object reachable from the evaluation point, every arrow that has a retraction is invertible. Here: No non-identity arrow has a retraction: nothing returns from a later object. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object. It requires that Some arrow out of the evaluation object has no retraction. Here: No arrow leads from $W_1$ back to $W_0$, so $f_{01}$ has no retraction. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

Every world has finitely many individuals and sees worlds with more, so Potential Infinity (type e) holds, necessarily, while Possible Infinity (type e) fails: Potential Infinity does not imply Possible Infinity at type $e$, even with □Rigid Comprehension, □Relational Choice and the boxed Axiom of Infinity at type $t$, which the model has by its fullness. BF fails at type $e$, as it must ([[potential-infinity-e-and-bf-imply-axiom-of-infinity-e]]): the haecceity of the individual $0$ is necessary of everything at $W_0$ and fails of $1$ after $f_{01}$. The numbers counted at type $e$ are rigid with necessarily distinct instances, though no world has more than finitely many individuals.

## Sources

- **Claude Fable 5.2, 24 Nov** — Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026, in a survey of the connections of Potential Infinity; after Cian Dorr's two-object chain with a new individual, suggestion of 11 October 2026.

<p class='cert'>Record: <code>topics/classicism/models/full-omega-chain-new-individuals.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61; Appendix D, pp. 73–74. Full action models; the category is the natural numbers in their order.
