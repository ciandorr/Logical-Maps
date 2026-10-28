# Full action model: two-object chain with a free loop at the second object [infinitely many fixed individuals; Σ true atom; ZF + socks]

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026.</p>

## Package

- **Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.

## Definition

Use two objects $W_0$ and $W_1$. The arrows are the identities, one arrow $h\colon W_0\to W_1$, and the powers $s^n$ ($n\ge0$) of one endomorphism $s$ of $W_1$, which compose as $s^m\circ s^n=s^{m+n}$ and $s^n\circ h=h$, $h$ being the only arrow from $W_0$ to $W_1$; there is no arrow from $W_1$ to $W_0$. Evaluate at $W_0$.

Individuals, fixed for this record: at every object the individuals are the members of an infinite set $D$, the same at every object, and every arrow acts on them as the identity.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition $\{1\}$; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

Metatheory, fixed for this record: the construction is carried out in ZF together with a countable family $(P_n)_{n\in\omega}$ of pairwise disjoint two-element sets that has no choice function (Russell's socks), which is consistent with ZF (Fraenkel's second permutation model, transferred to ZF by the Jech–Sochor theorem). Every infinite set the construction leaves unspecified (the individuals, the worlds, a carrier) is their union. The verdicts of this record are relative-consistency claims of the same standing as those of a record with choice.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Possible Infinity (type t).

$W_1$ sees itself through infinitely many arrows, so, the model being full, it has infinitely many propositions, and at $W_1$ the Axiom of Infinity at type $t$ holds: the finite cardinalities of propositions there are the numerals, the inductive property of being a numeral being in the full domain, and the $k$-th numeral says that there are exactly $k$ propositions, which is false for every $k$. The arrow $h$ out of $W_0$ reaches $W_1$, so at $W_0$ the Axiom of Infinity at type $t$ is possible, although it fails there, $W_0$ having four propositions.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026.*

### Fails B for pure sentences.

The closed pure sentence that there are exactly four propositions is true at $W_0$ and false at $W_1$, which sees only itself; so it is not necessarily possible, and B fails for it.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026.*

### Fails Analytic Necessitism.

At $W_0$, at type $tt$. The propositions at $W_1$ are the sets of the arrows $s^n$, continuum many, and an entity of type $tt$ at $W_0$ assigns any set of them to $h$ and any set of the four propositions at $W_0$ to the identity; so the entities of type $tt$ at $W_0$ include a copy of the reals and, the model being full, there is a real number structure of type $tt$ at $W_0$, complete since every subset of its carrier is the extension of a subproperty. A rigid one, necessarily a real number structure, is impossible: $h$ has no retraction, so, as in the general argument analytic-necessitism-unretracted-arrow, no entity of type $tt$ at $W_0$ is determined by its transport along $h$, its value at the identity being free, while the instances of a rigid carrier would have to be. With infinitely many individuals the general argument applies as it stands; this one covers the single individual, where the infinite type lies at $W_1$.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Analytic Necessitism.

As in the argument analytic-necessitism-unretracted-arrow, with the individuals supplying the real numbers in place of the propositions. Let $k$ be an arrow out of the evaluation object $w$ with no retraction; as there, the model being full, no entity of a relational type at $w$ is determined by its transport along $k$, so no rigid real number structure of a relational type at $w$ is necessarily a real number structure. But there is a real number structure at $w$ of the relational type $((et)t)t$: the individuals at $w$ are infinitely many, the sets of sets of individuals are Dedekind-infinite (a theorem of ZF for any infinite set), so the entities of type $(et)t$, which include one with any given set of properties of individuals as extension at the identity, include a copy of the natural numbers, and the entities of type $((et)t)t$ a copy of the sets of natural numbers, hence of the reals; the full domains equip that copy, at the identity, with the order, sum, product and natural numbers of the reals, and the structure is complete, every subset of its carrier being the extension of a subproperty. So the antecedent of Analytic Necessitism holds at that type and its consequent fails: Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-unretracted-arrow-individuals`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Some arrow out of the evaluation object has no retraction. Here: There is no arrow from $W_1$ back to $W_0$. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition, the singleton of the identity of $W_0$, is in the domain, the model being full; the only other world out of $W_0$ is $h$, and every arrow after $h$ is $h$ again, so no world outside it sees a world in it. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Infinity Schema (type t), Axiom of Infinity (type t).

The propositions at the evaluation world are finitely many, and every intension of a full model is present, so the numerals are the finite cardinalities and one of them holds of the universal property of propositions: the Axiom of Infinity at type t fails, as does an instance of the schema.

*General argument `arguments/finitely-many-propositions`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are finitely many propositions at the evaluation world. Here: The propositions at $W_0$ are the subsets of the two arrows out of it, four in all. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The copies in three full action models (each with four propositions) stated once for the topic; each record's count is its reason for meeting finitely-many-propositions.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Axiom of Infinity's failure, which the text states, recorded as a verdict of its own, so that it is certified without the result that the Axiom implies the schema.

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-atoms are atoms.

The argument of full-comparable-free-arrows-self-atoms at every reachable object: a self-atom there is a singleton intension, so an atom.

*General argument `arguments/full-comparable-free-arrows-everywhere-self-atoms`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object reachable from the evaluation point, any two arrows out of it that are each fixed under post-composition only by the identity are comparable: one is a left multiple of the other. Here: Out of $W_0$ only $1$ is fixed by nothing but the identity, $h$ being fixed by $s$; out of $W_1$ the arrows $s^n$ are comparable, $s^m=s^{m-n}\circ s^n$ for $n\le m$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails Self-Atomicity (type t), Atoms are self-atoms (type t).

Let $m\ne1$ fix $k$: $m\circ k=k$. The singleton $\{k\}$, in the domain since the model is full, is an atom. Its transport along $k$ is $\{x : x\circ k=k\}$, which contains $1$ and $m$, and the proposition $\{1\}$ at $k$’s target, in the domain there, separates them; so $\{k\}$ is true at $k$ without being an atom there, and it is not a self-atom. As $\{k\}$ is the only possible proposition below itself, Self-Atomicity (type t) fails too.

*General argument `arguments/full-fixed-arrow-no-self-atom`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow $k$ out of the evaluation object is fixed by a non-identity arrow: $m\circ k=k$ with $m\ne1$. Here: $s\circ h=h$ with $s\ne1_{W_1}$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Self-atoms are strong atoms.

The argument of full-uniquely-factored-self-atoms-strong at every reachable object.

*General argument `arguments/full-uniquely-factored-everywhere-self-atoms-strong`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object reachable from the evaluation point, any two arrows out of it that are each fixed under post-composition only by the identity are comparable: one is a left multiple of the other. Here: Out of $W_0$ only $1$ is fixed by nothing but the identity, $h$ being fixed by $s$; out of $W_1$ the arrows $s^n$ are comparable, $s^m=s^{m-n}\circ s^n$ for $n\le m$. It requires that At every object reachable from the evaluation point, every arrow $k$ out of it that is fixed only by the identity factors through each arrow $h$ out of it in at most one way: $m\circ h=m^{\prime}\circ h=k$ implies $m=m^{\prime}$. Here: At $W_0$, $1=m\circ h$ is impossible and $1=m\circ1$ forces $m=1$; at $W_1$, $s^n=m\circ s^a$ forces $m=s^{n-a}$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Strong Atomicity (type t).

Let $k$ out of the evaluation object have distinct $j\ne j^{\prime}$ after it with $j\circ k= j^{\prime}\circ k$. The proposition $\{j\circ k\}$, in the domain since the model is full, is possible, and the only possible proposition below it is itself. It is not a strong atom: under $k$ it becomes $\{m : m\circ k=j\circ k\}$, which contains $j$ and $j^{\prime}$, and the proposition $\{j\}$ at $k$'s target, in the domain there, neither contains nor excludes it. So the type-$t$ Strong Atomicity fails. (The idempotent monoid's and the retract's own arguments of 22–23 September, stated once.)

*General argument `arguments/nonepic-strong-atomicity`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not an epimorphism: two distinct arrows after it agree after it. Here: The distinct arrows $s^0$ and $s$ out of $W_1$ agree after $h$, both composites being $h$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not its identity. Here: The arrow $h$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Rigid Power, □Rigid Power.

Write $X_0(E)$ for the intension $k\mapsto k\cdot E$. The extension at an arrow $h$ of the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ is the set of rigid $X$ with $X\le h\cdot F$, the bound variable ranging over the domain untransported and the parameter transported. By the condition the rigid relations are the $X_0(E)$, and $X_0(T)\le X_0(S)$ iff $T\subseteq S$; so for rigid $F=X_0(S)$ the power property has extension $\{X_0(T'):T'\subseteq k\cdot S\}$ at $k$, while transporting its extension at the identity along $k$ gives $\{X_0(k\cdot T):T\subseteq S\}$. These coincide, since every $T'\subseteq k\cdot S$ is $k\cdot T$ for $T:=\{s\in S:k\cdot s\in T'\}$. So the power property is itself $X_0$ of its extension, hence rigid, and the same at every reachable object gives the boxed form.

*General argument `arguments/rigid-power-tight`. It requires that At every object reachable from the evaluation point, the rigid relations of each relational type are exactly the intensions $k\mapsto k\cdot E$, the disjunctions of the haecceities of the members of $E$, for $E$ any set of tuples from the domains there; in particular every such intension is in the domain. Here: Every intension is present, so for any set $E$ the intension $k\mapsto k\cdot E$ is in the domain, and a relation is weakly inextensible at a world iff it lies below that intension over its extension there, since that is the smallest intension satisfying the hypothesis; with persistence, a rigid relation equals it (the argument deferred in extraction.md, 3 October 2026). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026 (full action models); extended by Claude Fable 5.1, prompted by Cian Dorr (Anthropic), 4 October 2026, at Cian Dorr's direction.*

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* The argument deferred in extraction.md on 3 October for the full action models, where every intension is present, stated under the condition it actually uses, which the symmetry-constrained full models also meet.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The singleton $a$ of the identity arrow is in the domain, the model being full. It is necessary at no world: a world other than the identity sees itself, which lies outside $a$, and the identity sees an arrow other than itself. And a non-identity arrow $k$ does not fix it, since $1\in k\cdot a$ would need $1\circ k=1$. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.

### Fails Relational Choice.

At type $e$. The individuals, which every arrow fixes, are an unspecified infinite set, so here the union $D=\bigcup_n P_n$. Let $U$ relate each member of $P_n$ to the members of $P_{n+1}$; it is in the domain, the model being full, and serial. A functional subrelation would send each sock to a sock of the next pair, and iterated from one member of $P_0$ it would choose a sock from every pair.

*General argument `arguments/socks-relational-choice`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that At every object the individuals are the same infinite set, and every arrow acts on them as the identity. Here: This is the choice of individuals. It requires that The construction is carried out in ZF with a countable family $(P_n)_{n\in\omega}$ of pairwise disjoint two-element sets that has no choice function, and every infinite set the construction leaves unspecified is their union. Here: This is the hypothesis. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails ND (type t).

Let $k$ out of the evaluation object have no retraction. The propositions $\bot$ and $\{1\}$ are in the domain, the model being full, and $k$ transports both to $\bot$: no arrow $m$ after $k$ has $m\circ k=1$. So $k$'s action at type $t$ is not injective, and ND fails there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/unretracted-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object has no retraction. Here: There is no arrow from $W_1$ back to $W_0$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

The two-object chain with an infinite monoid of endomorphisms at the second object. It is recorded to refute the conjecture possible-infinity-t-implies-axiom-of-infinity-t: the evaluation object has four propositions and sees one with infinitely many. As the conjecture's notes anticipate, BF at type $t$ and No Pure Contingency both fail; the engine derives both from Possible Infinity (type $t$) and the failure of the Axiom of Infinity (type $t$), and they can be seen directly: transport along $h$ sends a proposition $p$ at $W_0$ to every arrow out of $W_1$ if $h\in p$ and to none otherwise, so the property of propositions whose extension at $h$ is $\{\emptyset,\{s^n:n\ge0\}\}$ and whose extension at the identity is everything necessarily holds of every proposition at $W_0$ and fails at $W_1$ of $\{s\}$; and the pure sentence that there are exactly four propositions is true at $W_0$ and false at $W_1$. With one individual the model is finite at $W_0$ in every type, and infinite at $W_1$ from type $t$ up.

## Sources

- **Claude Fable 5.1 19 Oct** — Original construction of 19 October 2026, to settle the recorded conjecture possible-infinity-t-implies-axiom-of-infinity-t; the full action model on the category described, which is a model of C by Classicism, §3.5 and Appendix D.

<p class='cert'>Record: <code>topics/classicism/models/full-two-object-chain-free-loop.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61; Appendix D, pp. 73–74. Full action models over a category are models of C.
