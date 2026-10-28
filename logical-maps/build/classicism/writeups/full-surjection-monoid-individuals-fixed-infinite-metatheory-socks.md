# Full action model: surjections of an infinite set [infinitely many fixed individuals; ZF + socks]

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

Use the monoid of surjections of an infinite set, at its sole object.

Individuals, fixed for this record: at every object the individuals are the members of an infinite set $D$, the same at every object, and every arrow acts on them as the identity.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

Metatheory, fixed for this record: the construction is carried out in ZF together with a countable family $(P_n)_{n\in\omega}$ of pairwise disjoint two-element sets that has no choice function (Russell's socks), which is consistent with ZF (Fraenkel's second permutation model, transferred to ZF by the Jech–Sochor theorem). Every infinite set the construction leaves unspecified (the individuals, the worlds, a carrier) is their union. The verdicts of this record are relative-consistency claims of the same standing as those of a record with choice.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Fails Intensional Choice, Relational Choice.

At type $t$, with the monoid that of the surjections of the union $X=\bigcup_n P_n$ of the socks. For $x\in X$ let $q_x:=\{k : k(x)=x\}$, a proposition since the model is full; $x$ is the one point fixed by every member of $q_x$, since for $y\ne x$ the transposition of $y$ with a third point is a surjection fixing $x$ and moving $y$. Relational Choice: let $U$ relate $q_x$ to each $q_y$ with $y$ in the pair after $x$'s, and every other proposition to every proposition. It is serial, and a functional subrelation would give $f$ with $f(x)$ in the pair after $x$'s; iterated from a member $s_0$ of $P_0$ it would choose a sock from every pair. Intensional Choice: let $F$ hold at each arrow $h$ of the $q_y$ with $y$ in the pair after $h(s_0)$'s. It is necessarily instantiated. A $G\le F$ necessarily uniquely instantiated holds at the transposition of $s_0$ and $x$ (the identity if $x=s_0$), an arrow given by $x$ without choice, of a single $q_y$ with $y$ in the pair after $x$'s, which gives the same $f$. Both fail, with one individual or many. The next pair is needed: with $h(s_0)$'s own pair, $G$ could hold at $h$ of $q_{h(s_0)}$. (The witness sketched in the analysis of 4 October 2026, for this model.)

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails Analytic Necessitism.

As in the argument analytic-necessitism-unretracted-arrow, with the individuals supplying the real numbers in place of the propositions. Let $k$ be an arrow out of the evaluation object $w$ with no retraction; as there, the model being full, no entity of a relational type at $w$ is determined by its transport along $k$, so no rigid real number structure of a relational type at $w$ is necessarily a real number structure. But there is a real number structure at $w$ of the relational type $((et)t)t$: the individuals at $w$ are infinitely many, the sets of sets of individuals are Dedekind-infinite (a theorem of ZF for any infinite set), so the entities of type $(et)t$, which include one with any given set of properties of individuals as extension at the identity, include a copy of the natural numbers, and the entities of type $((et)t)t$ a copy of the sets of natural numbers, hence of the reals; the full domains equip that copy, at the identity, with the order, sum, product and natural numbers of the reals, and the structure is complete, every subset of its carrier being the extension of a subproperty. So the antecedent of Analytic Necessitism holds at that type and its consequent fails: Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow-individuals`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: Halving is not injective, so no surjection $m$ has $m\circ k=1$ for it. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Analytic Necessitism.

Write $w$ for the evaluation object and $k$ for an arrow out of it with no retraction. No entity $x$ of a relational type at $w$ is determined by its transport along $k$: the identity of $w$ is not of the form $j\circ k$, such a $j$ being a retraction, and the model being full, the intension $y$ agreeing with $x$ at every arrow but the identity, where it takes another value, is in the domain, while $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. Suppose then that $\mathfrak R$ were a rigid real number structure at $w$ at a relational type, necessarily a real number structure (Background, Analysis), with carrier $X$. For an instance $x$ of $X$ and $y$ as above, persistence gives $k\cdot x\in X_k$, so $k\cdot y\in X_k$; inextensibility then gives $Xy$; and the necessary distinctness of the instances gives $k\cdot y\ne k\cdot x$, a contradiction. So $X$ has no instance and is no complete ordered field. The antecedent of Analytic Necessitism holds nevertheless, at some relational type. The propositions at $w$ are the sets of the infinitely many arrows out of it, the sets of sets of propositions are Dedekind-infinite (a theorem of ZF for any infinite set), and the entities of type $ttt$ at $w$, which include one with any given extension at the identity, include a copy of the sets of natural numbers and so of the real numbers; the model being full, the order, sum and product of the reals are the extensions at the identity of relations in the domain, every subset of that carrier is the extension of a subproperty, so the structure is complete, and its least inductive subproperty is its natural numbers. So $\exists\mathfrak R\,.\,\operatorname{Real}_{ttt}(\mathfrak R)$ holds at $w$ while the consequent of Analytic Necessitism fails there: Analytic Necessitism fails. (When the arrows out of $w$ include a copy of the natural numbers, as in the recorded instances, the same argument runs at type $t$.) No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: Halving is not injective, so no surjection $m$ has $m\circ k=1$ for it. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions are all the sets of arrows, and there are infinitely many surjections. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Truth implies ND-necessity.

Let $p:=\{1\}$, in the domain since the model is full, and true. Any witness $q$ for $\Box_{\ne}p$ is true, so contains the identity; under an arrow $i\ne 1$ with a retraction $r$, the arrow $r\circ i=1$ makes $\Diamond q$ true, while $p$ is false. So no true $q$ has $\Box(\Diamond q\to p)$. (The surjection monoid's own argument of 23 September, stated once.)

*General argument `arguments/dpc-returning-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object other than its identity has a retraction: an arrow back after which it composes to the identity. Here: A bijection other than the identity, which its inverse retracts. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

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

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

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

### Holds Rigid Power, □Rigid Power.

Write $X_0(E)$ for the intension $k\mapsto k\cdot E$. The extension at an arrow $h$ of the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ is the set of rigid $X$ with $X\le h\cdot F$, the bound variable ranging over the domain untransported and the parameter transported. By the condition the rigid relations are the $X_0(E)$, and $X_0(T)\le X_0(S)$ iff $T\subseteq S$; so for rigid $F=X_0(S)$ the power property has extension $\{X_0(T'):T'\subseteq k\cdot S\}$ at $k$, while transporting its extension at the identity along $k$ gives $\{X_0(k\cdot T):T\subseteq S\}$. These coincide, since every $T'\subseteq k\cdot S$ is $k\cdot T$ for $T:=\{s\in S:k\cdot s\in T'\}$. So the power property is itself $X_0$ of its extension, hence rigid, and the same at every reachable object gives the boxed form.

*General argument `arguments/rigid-power-tight`. It requires that At every object reachable from the evaluation point, the rigid relations of each relational type are exactly the intensions $k\mapsto k\cdot E$, the disjunctions of the haecceities of the members of $E$, for $E$ any set of tuples from the domains there; in particular every such intension is in the domain. Here: Every intension is present, so for any set $E$ the intension $k\mapsto k\cdot E$ is in the domain, and a relation is weakly inextensible at a world iff it lies below that intension over its extension there, since that is the smallest intension satisfying the hypothesis; with persistence, a rigid relation equals it (the argument deferred in extraction.md, 3 October 2026). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026 (full action models); extended by Claude Fable 5.1, prompted by Cian Dorr (Anthropic), 4 October 2026, at Cian Dorr's direction.*

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* The argument deferred in extraction.md on 3 October for the full action models, where every intension is present, stated under the condition it actually uses, which the symmetry-constrained full models also meet.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Fails Intensional Choice.

At type $e$. The individuals, which every arrow fixes, are an unspecified infinite set, so here the union $D=\bigcup_n P_n$. Let $F$ hold at $h_n$ of the members of $P_n$, and at every other arrow of every individual. It is in the domain, the model being full, and necessarily instantiated. A $G\le F$ necessarily uniquely instantiated holds at $h_n$ of a single member of $P_n$, and $n\mapsto$ that member would be a choice function for the socks. (The witness of the 3 October 2026 analysis, with the numbered arrows in place of the transpositions of the pairs.)

*General argument `arguments/socks-full`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are pairwise distinct arrows $h_n$ out of the evaluation object, one for each natural number $n$, each with a retraction $r_n$, all given by the construction without choice. Here: $h_0$ the identity and $h_n$ a transposition, a surjection that is its own retraction: of $0$ and $n$ when the infinite set is $\mathbb N$ (with choice, or in the variant without countable choice), and of the two members of $P_n$ when it is the union of the socks. It requires that At every object the individuals are the same infinite set, and every arrow acts on them as the identity. Here: This is the choice of individuals. It requires that The construction is carried out in ZF with a countable family $(P_n)_{n\in\omega}$ of pairwise disjoint two-element sets that has no choice function, and every infinite set the construction leaves unspecified is their union. Here: This is the hypothesis. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails Relational Choice.

At type $e$. The individuals, which every arrow fixes, are an unspecified infinite set, so here the union $D=\bigcup_n P_n$. Let $U$ relate each member of $P_n$ to the members of $P_{n+1}$; it is in the domain, the model being full, and serial. A functional subrelation would send each sock to a sock of the next pair, and iterated from one member of $P_0$ it would choose a sock from every pair.

*General argument `arguments/socks-relational-choice`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object the individuals are the same infinite set, and every arrow acts on them as the identity. Here: This is the choice of individuals. It requires that The construction is carried out in ZF with a countable family $(P_n)_{n\in\omega}$ of pairwise disjoint two-element sets that has no choice function, and every infinite set the construction leaves unspecified is their union. Here: This is the hypothesis. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object has no retraction. Here: Halving is not injective, so no surjection $m$ has $m\circ k=1$ for it. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


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
