# Symmetry-constrained full model: permutations and collapses on three individuals [one individual]

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr (the construction and the failure of Intensional Choice, 3 and 4 October 2026); Claude Fable 5.1 (Anthropic) (verification that it is a model of C and the other verdicts, 4 October 2026); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 4 October 2026.</p>

## Package

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The arrows are the six permutations of $X$ and the three collapses $c_i$, the constant maps with value $i\in X$; they compose as maps, so $c_i\circ h=c_i$ and $g\circ c_i=c_{g(i)}$. The arrows act on a three-element set $X$, and $G$ is the group of all its permutations, which are arrows in every member. An intension $D$ of a relational type is admitted exactly when it is symmetric: $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ for every $g\in G$, where $g$ acts on individuals as itself and on entities of higher types by relabelling (Dorr's Definition 17). At a collapse $c_i$, the constant map with value $i$, it says that $D(c_{g(i)})=g\cdot D(c_i)$. Every such domain is finite and closed under the operations of C: each $g$ is an automorphism of the whole structure, and every parameter transported along a collapse is fixed by $G$, so the extension at a collapse of any definable intension is invariant. The member has one object, $X$. Evaluation point: the sole object, at the identity arrow.

Individuals, fixed for this record: there is a single individual, which every arrow fixes; the arrows still act on the three-element set $X$, which supplies the symmetry.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetry-constrained full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Atomicity.

At every type the domain is finite and closed under the pointwise lattice operations, since the union and intersection of symmetric intensions are symmetric; in a finite lattice every nonzero element has an atom below it.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#atomicity`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Holds □Atomicity, □Actuality.

At every object $V$ reachable from the evaluation point, not only there. Every domain at $V$ is finite and closed under the pointwise lattice operations, so it is atomic, as in the argument for Atomicity. For Actuality, the orbit of $1_V$ under the symmetry group at $V$, the set of arrows $g\circ1_V$, is a symmetric proposition, so in the domain, and true; and a true symmetric proposition contains $1_V$, hence the whole orbit, so the orbit entails every truth. A closed sentence holds at an arrow into $V$ iff it holds at $1_V$, so Atomicity and Actuality are necessary.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#necessary-atomicity-actuality`. By Cian Dorr, recorded by Claude Opus 5.5 (Anthropic), 2026-10-16.*

### Holds Boolean Completeness.

The entailment order is the pointwise order on intensions, and the pointwise intersection of any set of symmetric intensions is symmetric and in the domain, so every set has a greatest lower bound at every type.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#boolean-completeness`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Holds Rigid Comprehension.

For a set $S$ of tuples at the identity, the intension $Y$ with $Y(h):=h\cdot S$, the transports of the members of $S$ along $h$, is symmetric: relabelling by $g$ the transport of a tuple along $h$ gives its transport along $g\circ h$ (when the permutations are arrows because transport composes; otherwise because $g\cdot(c\cdot z)=c_{g(i)}\cdot z$ for a collapse $c=c_i$ and every admissible $z$, the collapses being absorbed, $l\circ c=l$ for $l\ne1$, and $z$ symmetric). $Y$ is coextensive with $S$, persistent, and inextensible at every world $h$, since any persistent $B$ with $B(h)\supseteq Y(h)$ has $B(k\circ h)\supseteq k\cdot Y(h)= Y(k\circ h)$. So every extension has a rigid coextension, at every type.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#rigid-comprehension`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Holds Tame Rigidity.

Let $Y$ be weakly rigid with extension $E$ at the identity. The intension $h\mapsto h\cdot E$ is symmetric, as in the argument for Rigid Comprehension, and satisfies the hypothesis of weak inextensibility, so $Y(h)\subseteq h\cdot E$ for every $h$; persistence gives the converse. So $Y$ is that intension, which is rigid.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#tame-rigidity`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Fails BF (type t).

Transport along a collapse $c$ sends every proposition to $\bot$ or $\top$: $l\circ c$ is the constant map with value $l(i)$ for $c=c_i$, and the constant maps form one orbit of the symmetry group, so a symmetric proposition contains all of them or none. The intension $X$ of type $t\to t$ with $X(c):=\{\bot,\top\}$ at every collapse and $X(h):=$ every proposition elsewhere is symmetric, since both values are fixed by every relabelling. So $\forall p\, .\,\Box Xp$ holds at the identity while $\Box\forall p\, .\,Xp$ fails.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#barcan-t-collapse`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Fails ND (type t).

The actual-world proposition $a$ and $\bot$ are distinct, and a collapse $c$ transports both to $\bot$, since $l\circ c$ is a collapse for every $l$ and so never in $a$.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#distinctness-necessary-t`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Fails Axiom of Infinity (type t), Infinity Schema (type t).

There are finitely many propositions, $n$ say, with literal identity. The numerals are closed terms, so in the domain, and the numeral $n$ holds of the universal property of propositions, so the Axiom of Infinity at type $t$ fails, as does the instance of the schema asking for $n+1$ pairwise distinct propositions.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#axiom-of-infinity-t`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Fails Strong Atomicity (type t).

The constant maps form one orbit of the symmetry group, so the proposition $C$ that the arrow is constant (for individuals $a,b,c$, the proposition that $a=b=c$) is an atom: it is possible, and a symmetric proposition contains all the constant maps or none. It is not a strong atom. At a constant map $c_i$, every composite $l\circ c_i$ is constant, so $C$ transported there is $\top$; and $\top$ there lies neither below the proposition $P$ that the arrow is a permutation nor below its negation, both being possible. As an atom, $C$ has no possible proposition below it but itself, so no strong atom lies below it, and the type-$t$ Strong Atomicity fails.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#strong-atomicity-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, from Cian Dorr's observation, 2026-10-08.*

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t), Atoms are self-atoms (type t).

At every object the atoms are the orbits of single pairs under the symmetry group. The orbit $C$ of a collapse $c$ (in the two-object member, of the arrows $c_i:W_0\to X$) is an atom; its transport along $c$ is the set of arrows $m$ with $m\circ c$ in $C$, which includes every arrow $X\to X$, since $m\circ c$ is again a collapse, and so is not an atom there, the orbit of the permutations being a proper symmetric part. So $C$ is an atom and not a self-atom, and the only possible proposition below $C$ is $C$ itself: Atoms are self-atoms (type t) and Self-Atomicity (type t) fail. Conversely a self-atom $I$ at a relational type has, at each of its pairs $\langle k,\bar a\rangle$, a transport along $k$ that is an atom containing $\langle1,\cdot\rangle$, hence the orbit of the identity; so $m\circ k$ carries a pair of $I$ only for symmetries $m$, which excludes collapses ($c\circ c=c$) and leaves pairs at permutations, where symmetry makes $I$ the orbit of one pair, an atom, whose transport along a collapse is empty and along a permutation is an atom again: a strong atom. The same holds at every reachable object, the domains being the symmetric intensions everywhere.

*From the group *Symmetry-constrained full models*, shared argument `symmetry-constrained-full#self-atoms`. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism, Necessity of Second-Order Analysis.

Every type is finite at every object $v$ reachable from the evaluation point, by induction on types: the individuals at $v$ are finitely many by hypothesis, the propositions at $v$ are sets of the finitely many arrows out of it, and an entity of a relational type $\bar\sigma t$ at $v$ is an intension assigning to each of those arrows a set of tuples of entities of types $\bar\sigma$ at its target, which is reachable too, so that finitely many values are available at each arrow. An ordered field has infinitely many elements, its $0$, $1$, $1+1,\ldots$ being pairwise distinct, so no real number structure exists at any reachable object, at any type. The antecedents $\Diamond\exists\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)$ of Analytic Necessitism and of Second-Order Analytic Necessitism are therefore false at every type, and both hold; and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds for every sentence $A$, so the Necessity of Second-Order Analysis holds, with the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis. No choice is used.

*General argument `arguments/analysis-finite-everywhere`. It requires that Out of every object reachable from the evaluation point there are finitely many arrows. Here: The arrows are maps among the three-element set $X$ and, in the two-object member, the one-point $W_0$: finitely many out of every object. It requires that There are finitely many individuals at every object reachable from the evaluation point. Here: The individuals are the three elements of $X$ or one, and in the two-object member the single point of $W_0$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Any set $S$ of tuples at the identity is the extension there of a symmetric intension: put $S$ at the identity, $g\cdot S$ at each permutation $g$, and the empty set at every other arrow. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: $a$, the orbit of the identity, is in the domain and entails every truth; from a world outside $a$, a non-permutation $h$, every $l\circ h$ is again a non-permutation, outside $a$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: An action model with a single object. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Rigid Power, □Rigid Power.

Write $X_0(E)$ for the intension $k\mapsto k\cdot E$. The extension at an arrow $h$ of the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ is the set of rigid $X$ with $X\le h\cdot F$, the bound variable ranging over the domain untransported and the parameter transported. By the condition the rigid relations are the $X_0(E)$, and $X_0(T)\le X_0(S)$ iff $T\subseteq S$; so for rigid $F=X_0(S)$ the power property has extension $\{X_0(T'):T'\subseteq k\cdot S\}$ at $k$, while transporting its extension at the identity along $k$ gives $\{X_0(k\cdot T):T\subseteq S\}$. These coincide, since every $T'\subseteq k\cdot S$ is $k\cdot T$ for $T:=\{s\in S:k\cdot s\in T'\}$. So the power property is itself $X_0$ of its extension, hence rigid, and the same at every reachable object gives the boxed form.

*General argument `arguments/rigid-power-tight`. It requires that At every object reachable from the evaluation point, the rigid relations of each relational type are exactly the intensions $k\mapsto k\cdot E$, the disjunctions of the haecceities of the members of $E$, for $E$ any set of tuples from the domains there; in particular every such intension is in the domain. Here: For any set $E$ the intension $k\mapsto k\cdot E$ is symmetric (as in the argument for Rigid Comprehension), so in the domain, and it is the smallest symmetric intension containing the transports of the members of $E$; so a weakly inextensible relation lies below it over its extension, and a rigid one equals it (as in the argument for Tame Rigidity). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026 (full action models); extended by Claude Fable 5.1, prompted by Cian Dorr (Anthropic), 4 October 2026, at Cian Dorr's direction.*

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* The argument deferred in extraction.md on 3 October for the full action models, where every intension is present, stated under the condition it actually uses, which the symmetry-constrained full models also meet.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Any set $S$ of tuples at the identity is the extension there of a symmetric intension: put $S$ at the identity, $g\cdot S$ at each permutation $g$, and the empty set at every other arrow. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Any set $S$ of tuples at the identity is the extension there of a symmetric intension: put $S$ at the identity, $g\cdot S$ at each permutation $g$, and the empty set at every other arrow. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Any set $S$ of tuples at the identity is the extension there of a symmetric intension: put $S$ at the identity, $g\cdot S$ at each permutation $g$, and the empty set at every other arrow. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


## Notes

The propositions are $\bot$, the set $P$ of the six permutations, the set of the three collapses, and $\top$: the symmetry condition makes a proposition contain all the permutations or none, and all the collapses or none. $P$ is the strongest true proposition, the true atom. So the propositional structure is that of the full model on the two-arrow idempotent monoid, the quotient of this one by the symmetries, and the relabellings act trivially on it; Intensional Choice fails only at type $e$, by the shared argument, and holds at type $t$, where every proposition is fixed by the relabellings. The variant with one individual therefore refutes nothing that the two-arrow full model does not. BF also fails at type $e$ when there are three individuals: the image intension $h\mapsto h(X)$, $X$ at a permutation and $\{i\}$ at $c_i$, is symmetric, holds necessarily of every individual, yet is not necessarily universal. That failure, and the failure of ND at type $e$ from two individuals that a collapse identifies, are derived from the group's arguments at type $t$ and are not recorded separately.

## Sources

- **Dorr 3–4 Oct** — Cian Dorr, suggestion of 3 and 4 October 2026, in conversation with Claude Fable 5.1 (Anthropic): a one-object model with the identity and the collapses of three individuals, whose intensions must be permutation-invariant at the collapses, so that nothing distinguishes the individuals once they have been identified and Intensional Choice fails; transcript in .private.
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8 (the symmetry condition).
- **Dorr 6 Oct** — Cian Dorr, revision of 6 October 2026, in conversation with Claude Opus 5.5 (Anthropic): the six permutations made arrows alongside the three collapses, so that the member is a symmetry-constrained full model under Dorr's condition as it stands, the strongest true proposition being the set of permutations.

<p class='cert'>Record: <code>topics/classicism/models/symmetry-constrained-full-collapse.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8. The symmetry condition, here imposed on a full model over three individuals.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59. Full action models; the two-arrow idempotent monoid is the quotient of this monoid by the symmetries.
