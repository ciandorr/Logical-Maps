# Full action model: infinite S5 [infinitely many fixed individuals; Σ true atom; ZF + ¬AC_ω(ℝ)]

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr, 7 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 7 October 2026.</p>

## Package

- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **ND.** Distinct things of any type are necessarily distinct.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The category whose objects are the members of an infinite set $W$, with exactly one arrow from each object to each object, evaluated at any object. The arrows out of an object correspond to the members of $W$, so this is the full S5 model with world set $W$ and a constant domain of individuals.

Individuals, fixed for this record: at every object the individuals are the members of an infinite set $D$, the same at every object, and every arrow acts on them as the identity.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition $\{1\}$; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

Metatheory, fixed for this record: the construction is carried out in ZF together with the hypothesis that some countable family $(A_n)_{n\in\omega}$ of nonempty sets of sets of natural numbers has no choice function ($\neg\mathrm{AC}_\omega(\mathbb R)$), which holds in Cohen's basic model. An infinite set the construction leaves unspecified is $\mathbb N$. ZF with this hypothesis is consistent if ZF is, so the verdicts of this record are relative-consistency claims of the same standing as those of a record in ZFC.

*A member of the group Full action models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds No Pure Contingency.

Any two objects are isomorphic, by the unique arrow between them, and composing with it carries the model based at one to the model based at the other. So a closed sentence has the same truth value at every object, and a true one is necessary. (The engine also derives this verdict, but the general argument for the Σ-schemata needs it recorded.)

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-07.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Gallin Extensional Comprehension.

Given $X$ with extension $E$ at the evaluation object, let $Y$ hold at an arrow $g$ of a tuple $\bar b$ at $g$'s target iff $r_g\cdot\bar b\in E$; it is in the domain since the model is full. It is coextensive with $X$, since $r_1=1$. And whether it holds is unchanged along every arrow: at $x\circ g$, of $x\cdot\bar b$, it holds iff $r_{x\circ g}\cdot x\cdot\bar b=r_g\cdot\bar b\in E$. So $Y$ and its negation are persistent. (The retract's own argument of 25 September, generalized.)

*General argument `arguments/coherent-retractions`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Every arrow $g$ out of the evaluation object has a retraction $r_g$, chosen so that $r_{x\circ g}\circ x=r_g$ for every arrow $x$ after $g$. Here: $r_g$ is the unique arrow back; any two arrows with the same ends are equal, so $r_{x\circ g}\circ x=r_g$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Intensional Choice, Relational Choice.

Let $(A_n)$ be the family with no choice function. For a set $C$ of natural numbers let $p_C:=\{h_m : m\in C\}$, a proposition at the evaluation object since the model is full; along $h_n$ it becomes $h_n\cdot p_C$, from which $C$ is recovered as $\{m : h_m\circ r_n\in h_n\cdot p_C\}$, since $h_m\circ r_n\circ h_n=h_m$. Intensional Choice at type $t$: let $F$ hold at $h_n$ of the propositions $h_n\cdot p_C$ with $C\in A_n$, and at every other arrow of every proposition. It is in the domain, the model being full, and necessarily instantiated. A $G\le F$ necessarily uniquely instantiated holds at $h_n$ of a single $h_n\cdot p_{C_n}$ with $C_n\in A_n$, and $n\mapsto C_n$ would be a choice function. Relational Choice at types $t$ and $t$: let $U$ relate $p_{\{n\}}$ to each $p_C$ with $C\in A_n$, and every other proposition to every proposition. It is serial, and a functional subrelation would relate each $p_{\{n\}}$ to a single $p_{C_n}$ with $C_n\in A_n$, again a choice function. Both principles therefore fail. (The analysis of 3 October 2026: Intensional Choice is choice over worlds, Relational Choice over the elements of a domain.)

*General argument `arguments/countable-choice-reals-full`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that There are pairwise distinct arrows $h_n$ out of the evaluation object, one for each natural number $n$, each with a retraction $r_n$, all given by the construction without choice. Here: $h_n$ is the arrow to world $n$, and $r_n$ the arrow back, once $W$ contains the natural numbers: by choice, or because $W$ is $\mathbb N$ in the variant without countable choice. With socks $W$ is their union, and no such arrows need be given. It requires that The construction is carried out in ZF together with a countable family $(A_n)_{n\in\omega}$ of nonempty sets of sets of natural numbers that has no choice function ($\neg\mathrm{AC}_\omega(\mathbb R)$). Here: This is the hypothesis. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Fails Truth implies ND-necessity.

Let $p:=\{1\}$, in the domain since the model is full, and true. Any witness $q$ for $\Box_{\ne}p$ is true, so contains the identity; under an arrow $i\ne 1$ with a retraction $r$, the arrow $r\circ i=1$ makes $\Diamond q$ true, while $p$ is false. So no true $q$ has $\Box(\Diamond q\to p)$. (The surjection monoid's own argument of 23 September, stated once.)

*General argument `arguments/dpc-returning-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object other than its identity has a retraction: an arrow back after which it composes to the identity. Here: The arrow to any other object, retracted by the arrow back. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Atomicity.

Entailment is inclusion of intensions. Below a relation $Y\ne\bot_\tau$ lies the relation whose intension is the singleton of one of $Y$'s tuples, which is in the domain since the model is full, and is an atom: its only proper part is $\bot_\tau$. Every object being full, the same holds at every arrow, so Atomicity is necessary. The source notes that full models are atomic (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-atomicity`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □BF.

BF holds at an object whose arrows out all act surjectively at every type (Proposition 3.24(ii)). In a full model the transport of intensions along an epimorphism $k$ is onto: an intension $Y$ at its target is the transport of $\{\langle\bar a,k\circ m\rangle : \langle\bar a,m\rangle\in Y\}$, since $k\circ m=k\circ m'$ only if $m=m'$; and on the individuals the arrows are onto by the condition. So BF holds at every object reachable from the evaluation point, and BF is necessary.

*Source: Classicism, §3.5, Proposition 3.24(ii). General argument `arguments/full-epic-barcan`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). It requires that Every arrow out of every object reachable from the evaluation point is an epimorphism (arrows after it that agree after it are equal) and acts surjectively on the individuals. Here: Every arrow is invertible; and on the individuals every arrow is the identity. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Rigid Comprehension.

Given $X$ of type $\tau$ at an object $W$, let $Y$ be the relation whose extension at an arrow $i$ out of $W$ is $X$'s extension at $W$ transported along $i$, which is in the domain since the model is full. It is coextensive with $X$. It is persistent, since its extension at $i\circ j$ is its extension at $i$ transported along $j$. And it is inextensible: if $\Box X'$ holds at $i$ of everything $Y$ holds of there, then at $i\circ j$ everything $Y$ holds of is the transport along $j$ of something $Y$ holds of at $i$, of which $X'$ then holds. Every object being full, the same holds at every arrow, so Rigid Comprehension is necessary. The source notes that full models satisfy it (p. 61); stated once for the topic, in place of the full models' own arguments.

*Source: Classicism, p. 61. General argument `arguments/full-rigid-comprehension`. It requires that The model is a full action model: an action model (Classicism, Appendix D) that is full at every object. Here: An action model, full at every object (Classicism, §3.5, p. 59; Appendix D). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many individuals at the evaluation world. Here: $D$ is infinite. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: A full model contains every intension, so in particular one with any given extension at the identity. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions are all the sets of arrows out of the evaluation object, one for each subset of $W$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □ND, □BF.

Every arrow's action is a bijection at every type, so ND and BF hold at every object reachable from the evaluation point (Proposition 3.24(i) and (ii)), and are necessary.

*Source: Classicism, §3.5, Proposition 3.24. General argument `arguments/invertible-arrows`. It requires that Every arrow out of every object reachable from the evaluation point is invertible. Here: The unique arrow from $u$ to $v$ is inverted by the unique arrow from $v$ to $u$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Fregean Axiom.

The propositions $\top$ and $\{1\}$ are in the domain, the model being full; they are both true at the evaluation point and differ at the other arrow, so the Fregean Axiom fails.

*Source: Classicism, p. 61. General argument `arguments/nonidentity-arrow`. It requires that The model is full: at each object, the domain of each relational type contains every intension of that type. Here: Every intension of every relational type is present at every object (Classicism, §3.5, p. 59). It requires that Some arrow out of the evaluation object is not its identity. Here: The arrow to any other object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds ND.

The action of an arrow out of the evaluation object is undone by the action of its retraction, so it is injective at every type, and ND holds there (Proposition 3.24(i)).

*Source: Classicism, §3.5, Proposition 3.24(i). General argument `arguments/retractions`. It requires that Every arrow out of the evaluation object has a retraction: an arrow back after which it composes to the identity. Here: Each arrow out of the evaluation object is retracted by the arrow back. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

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

### Holds Strong Actuality, □Strong Actuality.

Let $V$ be the evaluation object or the target of an arrow out of it, and $w:=\{1_V\}$, in the domain at $V$. It is true at $1_V$. Under an arrow $f$ out of $V$ it becomes $\{k : k\circ f=1_V\}$, the set of retractions of $f$, which has at most one member and so lies below $q$ or below $\neg q$ for every proposition $q$ at $f$'s target. So Strong Actuality holds at $1_V$. A closed sentence holds at an arrow iff it holds at the identity of the arrow's target, so Strong Actuality holds at every world after the evaluation point, and □Strong Actuality holds there.

*General argument `arguments/strong-actuality-unique-retractions`. It requires that At the evaluation object, and at the target of every arrow out of it, the singleton of the identity arrow is in the domain. Here: The singleton of the identity arrow at any object is in the domain, the model being full. It requires that At the evaluation object, and at the target of every arrow out of it, every arrow out of that object has at most one retraction. Here: Between two objects there is only one arrow, so an arrow has exactly one retraction. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*


## Notes

A basic reference model, recorded at Cian Dorr's request: the full S5 model with infinitely many worlds. Nothing depends on which infinite set $W$ is. In the variant with infinitely many individuals the group fixes them as the natural numbers; any infinite set gives the same verdicts under choice. Its verdicts are those of the full permutation group model, whose arrows are likewise all invertible. Without choice in the metatheory, the same construction over a family of nonempty sets with no choice function refutes Intensional Choice; that variant is not recorded.

## Sources

- **Dorr 7 Oct** — Cian Dorr, suggestion of 7 October 2026, as a basic reference model.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, pp. 58–61 (full action models).

<p class='cert'>Record: <code>topics/classicism/models/full-infinite-s5.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Full action models; on this category the construction is the standard full S5 model.
