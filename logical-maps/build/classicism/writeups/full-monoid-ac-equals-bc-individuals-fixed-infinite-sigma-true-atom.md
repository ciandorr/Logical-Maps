# Full action model: the monoid with ac = bc [infinitely many fixed individuals; Σ true atom]

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026 (the construction, as a separating model for Self-Atomicity); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **□Two-hat necessity implies ND-necessity.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

The full model over the monoid $M:=\langle a,b,c\mid ac=bc\rangle$, the free monoid on three generators modulo the congruence generated by $ac=bc$, evaluated at its sole object. Its elements are the words in $a,b,c$ with no factor $ac$, since the rewriting $ac\to bc$ has no overlaps; the relation preserves length.

Individuals, fixed for this record: at every object the individuals are the members of an infinite set $D$, the same at every object, and every arrow acts on them as the identity.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition $\{1\}$; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

Metatheory, fixed for this record: the axiom of choice is used freely, as in ordinary mathematics in ZFC, or in Lean's classical type theory for the verdicts certified there.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Fails Analytic Necessitism.

As in the argument analytic-necessitism-unretracted-arrow, with the individuals supplying the real numbers in place of the propositions. Let $k$ be an arrow out of the evaluation object $w$ with no retraction; as there, the model being full, no entity of a relational type at $w$ is determined by its transport along $k$, so no rigid real number structure of a relational type at $w$ is necessarily a real number structure. But there is a real number structure at $w$ of the relational type $((et)t)t$: the individuals at $w$ are infinitely many, the sets of sets of individuals are Dedekind-infinite (a theorem of ZF for any infinite set), so the entities of type $(et)t$, which include one with any given set of properties of individuals as extension at the identity, include a copy of the natural numbers, and the entities of type $((et)t)t$ a copy of the sets of natural numbers, hence of the reals; the full domains equip that copy, at the identity, with the order, sum, product and natural numbers of the reals, and the structure is complete, every subset of its carrier being the extension of a subproperty. So the antecedent of Analytic Necessitism holds at that type and its consequent fails: Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow-individuals`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: The relation preserves length, so $m\cdot k=1$ forces $m=k=1$: no non-identity element has a retraction. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Analytic Necessitism.

Write $w$ for the evaluation object and $k$ for an arrow out of it with no retraction. No entity $x$ of a relational type at $w$ is determined by its transport along $k$: the identity of $w$ is not of the form $j\circ k$, such a $j$ being a retraction, and the model being full, the intension $y$ agreeing with $x$ at every arrow but the identity, where it takes another value, is in the domain, while $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. Suppose then that $\mathfrak R$ were a rigid real number structure at $w$ at a relational type, necessarily a real number structure (Background, Analysis), with carrier $X$. For an instance $x$ of $X$ and $y$ as above, persistence gives $k\cdot x\in X_k$, so $k\cdot y\in X_k$; inextensibility then gives $Xy$; and the necessary distinctness of the instances gives $k\cdot y\ne k\cdot x$, a contradiction. So $X$ has no instance and is no complete ordered field. The antecedent of Analytic Necessitism holds nevertheless, at some relational type. The propositions at $w$ are the sets of the infinitely many arrows out of it, the sets of sets of propositions are Dedekind-infinite (a theorem of ZF for any infinite set), and the entities of type $ttt$ at $w$, which include one with any given extension at the identity, include a copy of the sets of natural numbers and so of the real numbers; the model being full, the order, sum and product of the reals are the extensions at the identity of relations in the domain, every subset of that carrier is the extension of a subproperty, so the structure is complete, and its least inductive subproperty is its natural numbers. So $\exists\mathfrak R\,.\,\operatorname{Real}_{ttt}(\mathfrak R)$ holds at $w$ while the consequent of Analytic Necessitism fails there: Analytic Necessitism fails. (When the arrows out of $w$ include a copy of the natural numbers, as in the recorded instances, the same argument runs at type $t$.) No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: The relation preserves length, so $m\cdot k=1$ forces $m=k=1$: no non-identity element has a retraction. It requires that There are infinitely many propositions at the evaluation world. Here: The subsets of an infinite monoid. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition $\{1\}$ is in the domain, the model being full; no product with a non-identity element is $1$, the relation preserving length. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Self-atoms are strong atoms (type t).

Let $j\circ h=j^{\prime}\circ h$ with $j\ne j^{\prime}$, the composite fixed only by the identity. The singleton of the composite is a self-atom: it is true only at the composite, where its transport is $\{m : m\circ j\circ h=j\circ h\}=\{1\}$, an atom. It is not a strong atom: under $h$ it becomes $\{m : m\circ h=j\circ h\}$, which contains $j$ and $j^{\prime}$, and the proposition $\{j\}$ at $h$’s target neither contains nor excludes it.

*General argument `arguments/full-free-nonepic-composite-self-atom-not-strong`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are an arrow $h$ out of the evaluation object and arrows $j\ne j^{\prime}$ after it with $j\circ h=j^{\prime}\circ h$, where the composite $j\circ h$ is fixed under post-composition only by the identity. Here: $ac=bc$ with $a\ne b$, and $ac$ is fixed only by $1$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails Self-atoms are atoms (type t).

The proposition $\{k,k^{\prime}\}$ is a self-atom: its transport along $k$ is $\{m : m\circ k\in\{k,k^{\prime}\}\}$, which is $\{1\}$ since only the identity fixes $k$ and $k^{\prime}$ is not a left multiple of $k$, and likewise along $k^{\prime}$; at every other arrow it is false. It is not an atom, since $\{k\}$ lies strictly below it.

*General argument `arguments/full-incomparable-free-arrows-self-atom`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Two distinct arrows $k,k^{\prime}$ out of the evaluation object are each fixed under post-composition only by the identity, and neither is a left multiple of the other: $k^{\prime}\ne m\circ k$ and $k\ne m\circ k^{\prime}$ for every $m$. Here: $a$ and $b$: each is fixed only by $1$, and neither is a left multiple of the other, both having length $1$ and being distinct. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-Atomicity, □Atoms are self-atoms.

In a full model the atoms of a relational type at an object are the singleton intensions $\{\langle k,\bar a\rangle\}$, with $k$ an arrow out of it. Such a singleton is instantiated only at $k$, and its transport along $k$ is $\{\langle m,\bar a\rangle : m\circ k=k\}$, which is the atom $\{\langle 1,\bar a\rangle\}$ at $k$’s target when only the identity fixes $k$. So every atom is a self-atom, and the atom below a non-bottom entity, which the full model supplies, is a self-atom below it. The same holds at every reachable object, so both principles are necessary.

*General argument `arguments/full-self-atomicity-trivial-stabilisers`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object reachable from the evaluation point, the only arrow $m$ with $m\circ k=k$, for an arrow $k$ out of that object, is the identity of $k$’s target. Here: The relation preserves length, so $m\cdot k=k$ forces $m$ to have length $0$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many propositions at the evaluation world. Here: The subsets of an infinite monoid. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The domains are full at every object. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Strong Atomicity (type t).

Let $k$ out of the evaluation object have distinct $j\ne j^{\prime}$ after it with $j\circ k= j^{\prime}\circ k$. The proposition $\{j\circ k\}$, in the domain since the model is full, is possible, and the only possible proposition below it is itself. It is not a strong atom: under $k$ it becomes $\{m : m\circ k=j\circ k\}$, which contains $j$ and $j^{\prime}$, and the proposition $\{j\}$ at $k$'s target, in the domain there, neither contains nor excludes it. So the type-$t$ Strong Atomicity fails. (The idempotent monoid's and the retract's own arguments of 22–23 September, stated once.)

*General argument `arguments/nonepic-strong-atomicity`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not an epimorphism: two distinct arrows after it agree after it. Here: $a\cdot c=b\cdot c$ with $a\ne b$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not its identity. Here: $c$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

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

### Fails B for sentences of Σ.

B for sentences of Σ fails: the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, which is true, and under an arrow from which no world in $a$ is accessible $\Diamond a$ is false, so $\Box\Diamond a$ fails.

*General argument `arguments/sigma-true-atom-b`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The singleton $a$ of the identity arrow is in the domain, the model being full. It is necessary at no world: a world other than the identity sees itself, which lies outside $a$, and the identity sees an arrow other than itself. And a non-identity arrow $k$ does not fix it, since $1\in k\cdot a$ would need $1\circ k=1$. It requires that Some world sees no world at which the actual-world proposition is true. Here: $c$, as no composite with it has length $0$. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The B clause of the records' Σ-as-true-atom argument, stated once for the topic.

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The singleton $a$ of the identity arrow is in the domain, the model being full. It is necessary at no world: a world other than the identity sees itself, which lies outside $a$, and the identity sees an arrow other than itself. And a non-identity arrow $k$ does not fix it, since $1\in k\cdot a$ would need $1\circ k=1$. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: The singleton of the identity arrow at any object is in the domain, the model being full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: No non-identity element has a retraction, at the one object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds □Two-hat necessity implies ND-necessity.

In a full action model the actual-world proposition $\{1\}$ is in the domain at every object. Taking it as the witness, $\Box_{\ne}p$ holds at an identity iff $p$ contains every arrow out of that object with a retraction (these are the arrows at which $\Diamond\{1\}$ holds), and $\hat{\hat\Box}p$ iff $p$ contains every invertible arrow out of it (an arrow lies in $\hat\Diamond\{1\}$ iff some retraction of it has a retraction, i.e. iff it is invertible). Full models satisfy necessary Actuality, so $\Box_5=\hat{\hat\Box}$ by Proposition D21 of The Bounds of Possibility. When every retracted arrow is invertible, the two boxes coincide at every reachable object, so $\Box_{\ne}=\hat{\hat\Box}$.

*General argument `arguments/two-hat-nd-retracted-invertible`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Out of every object reachable from the evaluation point, every arrow that has a retraction is invertible. Here: Only $1$ is retracted. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object has no retraction. Here: The relation preserves length, so $m\cdot k=1$ forces $m=k=1$: no non-identity element has a retraction. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

A one-object companion to [[full-three-object-fork]]: Self-Atomicity, Atomicity, Strong Actuality and No Pure Contingency hold, all boxed, while Strong Atomicity (type t) and BF (type t) fail. The self-atom $\{a,b\}$ is not an atom.

## Sources

- **Fable 25 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, survey of Strong Atomicity results under Self-Atomicity, 25 October 2026 (session transcript).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, pp. 58–61 (full action models).

<p class='cert'>Record: <code>topics/classicism/models/full-monoid-ac-equals-bc.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Full action models.
