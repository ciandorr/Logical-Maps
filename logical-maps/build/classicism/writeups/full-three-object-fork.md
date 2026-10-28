# Full action model: three-object fork with a merged composite

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026 (the construction, as a separating model for Self-Atomicity); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **Self-atoms are atoms.** At each relational type, every self-atom is an atom.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **□Two-hat necessity implies ND-necessity.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ □Self-atoms are atoms (type t).** Necessarily, every self-atom is an atom.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

The category with objects $W_0$, $V$, $U$ generated by $h:W_0\to V$ and $g_1,g_2:V\to U$ subject to $g_1\circ h=g_2\circ h$; its arrows are the identities, $h$, $g_1$, $g_2$ and $d:=g_1\circ h$. Evaluated at $W_0$. Every endomorphism monoid is trivial and no arrow leads back towards $W_0$.

Individuals, fixed for this record: there is a single individual at every object, and every arrow sends it to the single individual at its target.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

Metatheory, fixed for this record: the axiom of choice is used freely, as in ordinary mathematics in ZFC, or in Lean's classical type theory for the verdicts certified there.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Fails □Self-atoms are atoms (type t).

At $V$, which $h$ reaches: the arrows $g_1,g_2$ out of it are each fixed only by $1_U$ and neither is a left multiple of the other, $U$ having only its identity, so $\{g_1,g_2\}$ is a self-atom at $V$ (its transport along either is $\{1_U\}$) that is not an atom. So Self-atoms are atoms (type t) fails at $V$, and its boxed form fails at $W_0$.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism, Necessity of Second-Order Analysis.

Every type is finite at every object $v$ reachable from the evaluation point, by induction on types: the individuals at $v$ are finitely many by hypothesis, the propositions at $v$ are sets of the finitely many arrows out of it, and an entity of a relational type $\bar\sigma t$ at $v$ is an intension assigning to each of those arrows a set of tuples of entities of types $\bar\sigma$ at its target, which is reachable too, so that finitely many values are available at each arrow. An ordered field has infinitely many elements, its $0$, $1$, $1+1,\ldots$ being pairwise distinct, so no real number structure exists at any reachable object, at any type. The antecedents $\Diamond\exists\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)$ of Analytic Necessitism and of Second-Order Analytic Necessitism are therefore false at every type, and both hold; and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds for every sentence $A$, so the Necessity of Second-Order Analysis holds, with the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis. No choice is used.

*General argument `arguments/analysis-finite-everywhere`. It requires that Out of every object reachable from the evaluation point there are finitely many arrows. Here: Three arrows out of $W_0$, three out of $V$, one out of $U$. It requires that There are finitely many individuals at every object reachable from the evaluation point. Here: There is a single individual at every object. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition $\{1_{W_0}\}$ is in the domain, the model being full; no arrow leads back to $W_0$, so no other world sees it. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Possible Infinity (type t).

At a world with $n$ propositions, the numeral $\operatorname{Suc}^n_t\mathbf{0}_t$, a finite cardinality, holds of the universal property of propositions, so the Axiom of Infinity at type $t$ fails there. It fails at every world, so Possible Infinity at type $t$ fails.

*General argument `arguments/finitely-many-propositions-everywhere`. It requires that There are finitely many propositions at every object reachable from the evaluation point. Here: Eight propositions at $W_0$ and at $V$, two at $U$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Infinity Schema (type t), Axiom of Infinity (type t).

The propositions at the evaluation world are finitely many, and every intension of a full model is present, so the numerals are the finite cardinalities and one of them holds of the universal property of propositions: the Axiom of Infinity at type t fails, as does an instance of the schema.

*General argument `arguments/finitely-many-propositions`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are finitely many propositions at the evaluation world. Here: Eight propositions at $W_0$, the subsets of $\{1,h,d\}$. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The copies in three full action models (each with four propositions) stated once for the topic; each record's count is its reason for meeting finitely-many-propositions.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Axiom of Infinity's failure, which the text states, recorded as a verdict of its own, so that it is certified without the result that the Axiom implies the schema.

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Self-atoms are atoms.

Let $I$ be a self-atom of a relational type at the evaluation object. For $\langle k,\bar a\rangle\in I$, the transport of $I$ along $k$ is $\{\langle m,\bar b\rangle : \langle m\circ k,\bar b\rangle\in I\}$, an atom containing $\langle1,\bar a\rangle$, hence the singleton of it: so $k$ is fixed only by the identity, $I$ has no other pair at $k$, and no pair of $I$ sits at a proper left multiple of $k$. If $I$ had pairs at two arrows $k\ne k^{\prime}$, both fixed only by identities, comparability would make one a proper left multiple of the other. So $I$ is a singleton, an atom.

*General argument `arguments/full-comparable-free-arrows-self-atoms`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Any two arrows out of the evaluation object that are each fixed under post-composition only by the identity are comparable: one is a left multiple of the other. Here: The arrows out of $W_0$ are $1$, $h=h\circ1$ and $d=g_1\circ h$: each is a left multiple of the one before. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails Self-atoms are strong atoms (type t).

Let $j\circ h=j^{\prime}\circ h$ with $j\ne j^{\prime}$, the composite fixed only by the identity. The singleton of the composite is a self-atom: it is true only at the composite, where its transport is $\{m : m\circ j\circ h=j\circ h\}=\{1\}$, an atom. It is not a strong atom: under $h$ it becomes $\{m : m\circ h=j\circ h\}$, which contains $j$ and $j^{\prime}$, and the proposition $\{j\}$ at $h$’s target neither contains nor excludes it.

*General argument `arguments/full-free-nonepic-composite-self-atom-not-strong`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are an arrow $h$ out of the evaluation object and arrows $j\ne j^{\prime}$ after it with $j\circ h=j^{\prime}\circ h$, where the composite $j\circ h$ is fixed under post-composition only by the identity. Here: $d=g_1\circ h=g_2\circ h$ with $g_1\ne g_2$, and $d$ is fixed only by $1_U$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-Atomicity, □Atoms are self-atoms.

In a full model the atoms of a relational type at an object are the singleton intensions $\{\langle k,\bar a\rangle\}$, with $k$ an arrow out of it. Such a singleton is instantiated only at $k$, and its transport along $k$ is $\{\langle m,\bar a\rangle : m\circ k=k\}$, which is the atom $\{\langle 1,\bar a\rangle\}$ at $k$’s target when only the identity fixes $k$. So every atom is a self-atom, and the atom below a non-bottom entity, which the full model supplies, is a self-atom below it. The same holds at every reachable object, so both principles are necessary.

*General argument `arguments/full-self-atomicity-trivial-stabilisers`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object reachable from the evaluation point, the only arrow $m$ with $m\circ k=k$, for an arrow $k$ out of that object, is the identity of $k$’s target. Here: Every endomorphism monoid is $\{1\}$, so $m\circ k=k$ forces $m=1$ everywhere. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Intensional Choice.

At an object reachable from the evaluation point the propositions are all the sets of arrows out of it, so there are finitely many arrows out. A necessarily instantiated $F$ there assigns to each of them a nonempty set, and a finite family of nonempty sets has a choice function without the axiom of choice; the intension holding at each arrow of the chosen member alone is in the domain, the model being full, lies below $F$ and is necessarily uniquely instantiated. So Intensional Choice holds at every reachable object, at every type. (The finite-germ argument of the 3 October 2026 analysis, for full models; with choice the well-ordering argument gives the same.)

*General argument `arguments/intensional-choice-finitely-many-arrows`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are finitely many propositions at every object reachable from the evaluation point. Here: Eight propositions at $W_0$ and at $V$, two at $U$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Strong Atomicity (type t).

Let $k$ out of the evaluation object have distinct $j\ne j^{\prime}$ after it with $j\circ k= j^{\prime}\circ k$. The proposition $\{j\circ k\}$, in the domain since the model is full, is possible, and the only possible proposition below it is itself. It is not a strong atom: under $k$ it becomes $\{m : m\circ k=j\circ k\}$, which contains $j$ and $j^{\prime}$, and the proposition $\{j\}$ at $k$'s target, in the domain there, neither contains nor excludes it. So the type-$t$ Strong Atomicity fails. (The idempotent monoid's and the retract's own arguments of 22–23 September, stated once.)

*General argument `arguments/nonepic-strong-atomicity`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not an epimorphism: two distinct arrows after it agree after it. Here: $g_1\circ h=g_2\circ h$ with $g_1\ne g_2$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not its identity. Here: $h$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds □Relational Choice.

The truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61).

*General argument `arguments/relational-choice-full-boxed`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The two-object full action models' copies stated once for the topic, for every full action model.

### Holds Relational Choice.

With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models.

*General argument `arguments/relational-choice-full`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The full action models' copies stated once for the topic.

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

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: The singleton of the identity arrow at any object is in the domain, the model being full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: No non-identity arrow has a retraction: the only arrows into $W_0$, $V$ and $U$ from elsewhere go forward along the fork. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds □Two-hat necessity implies ND-necessity.

In a full action model the actual-world proposition $\{1\}$ is in the domain at every object. Taking it as the witness, $\Box_{\ne}p$ holds at an identity iff $p$ contains every arrow out of that object with a retraction (these are the arrows at which $\Diamond\{1\}$ holds), and $\hat{\hat\Box}p$ iff $p$ contains every invertible arrow out of it (an arrow lies in $\hat\Diamond\{1\}$ iff some retraction of it has a retraction, i.e. iff it is invertible). Full models satisfy necessary Actuality, so $\Box_5=\hat{\hat\Box}$ by Proposition D21 of The Bounds of Possibility. When every retracted arrow is invertible, the two boxes coincide at every reachable object, so $\Box_{\ne}=\hat{\hat\Box}$.

*General argument `arguments/two-hat-nd-retracted-invertible`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Out of every object reachable from the evaluation point, every arrow that has a retraction is invertible. Here: Only identities are retracted. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object has no retraction. Here: No arrow leads into $W_0$ but its identity, so $h$ has no retraction. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

Built to separate Self-Atomicity from Strong Atomicity: every arrow is fixed only by the identity, so every singleton is a self-atom, but $h$ is not epic. With □Atomicity, □Actuality, □Strong Actuality, □Rigid Comprehension and Rigid Power all holding, it shows that no result deriving BF, or Strong Atomicity, from them can replace the latter by Self-Atomicity with any of those added. Self-atoms are atoms holds at $W_0$ but not at $V$.

## Sources

- **Fable 25 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, survey of Strong Atomicity results under Self-Atomicity, 25 October 2026 (session transcript).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, pp. 58–61 (full action models).

<p class='cert'>Record: <code>topics/classicism/models/full-three-object-fork.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Full action models.
