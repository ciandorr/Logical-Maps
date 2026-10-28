# Finite-support action model: N and singleton, all maps, evaluated at the singleton

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr, 16 October 2026 (the re-rooting, to separate Atomicity from □Atomicity), with Claude Opus 5.5 (Anthropic), who wrote the verification; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 16 October 2026.</p>

## Package

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ □Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **¬ □Atomicity (type t).** Necessarily, every non-bottom proposition has an atom below it.
- **¬ □Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An ideally full action model in the sense of Classicism, Appendix D, over a category with two objects, each carrying the ideal of finite sets: a model of C by Proposition D.4. The member's construction and evaluation point follow.

The model of finite-support-two-object-all-maps: two objects, $W_0=\mathbb N$ and $W_1=\{0\}$, with all functions between them as arrows, $W_i^\ddagger$ the finite subsets of $W_i$, ideally full. Evaluation point: $W_1$, at its identity arrow. The worlds it sees are its identity and the maps $c_n:0\mapsto n$ into $W_0$.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finitely pinned action models on two objects, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Strong Actuality, □Self-atoms are strong atoms. Fails □Strong Actuality.

At $W_1$ the true atom is $\{1_{W_1}\}$, which under $c_n$ becomes $\{!\}$, a set of one arrow, so it is a strong atom and Strong Actuality holds. It fails at $W_0$, which $c_n$ reaches, since Actuality fails there; so □Strong Actuality fails. The self-atoms are $\{1_{W_1}\}$ at $W_1$ and $\{!\}$ at $W_0$, both strong atoms, and at relational types they carry one tuple (the argument of finite-support-two-object-all-maps); so Self-atoms are strong atoms holds at both objects, at every type.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Atomicity, Boolean Completeness, Actuality.

An arrow out of $W_1$ is fixed by its value at $0$, so any two arrows with a common target that agree on $\{0\}$ are equal, and every intension at $W_1$ is pinned down by $\{0\}$. The model being ideally full, every domain at $W_1$ holds all intensions of its type, ordered by inclusion at each arrow: a complete atomic Boolean algebra. So Atomicity and Boolean Completeness hold at every type, and the singleton of the identity arrow is a true proposition entailing every truth.

*Address: `finite-support-two-object-all-maps-at-singleton#full-at-singleton`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Fails □Atomicity (type t), □Boolean Completeness (type t).

A closed sentence holds at $c_n$ iff it holds at the identity of $W_0$, the evaluation point of finite-support-two-object-all-maps. Boolean Completeness (type t) fails there by that model's argument; and Atomicity (type t) fails there, since BF holds and Inextensible Comprehension fails, while Atomicity (type t) with BF gives $\Box$Actuality, hence Actuality, which with BF gives Inextensible Comprehension. So neither is necessary at $W_1$.

*Address: `finite-support-two-object-all-maps-at-singleton#necessary-atomicity-t`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Possible Infinity (type e). Fails No Pure Contingency, BF, Infinity Schema (type e).

At $W_1$ there is one individual, at $c_n$ the natural numbers. The closed pure sentence that there is exactly one individual is true at $W_1$ and false at each $c_n$, so No Pure Contingency fails, as does the Infinity Schema (type e) at $W_1$. BF fails for the haecceity of $0$: it holds necessarily of every individual, but not of every individual at $c_n$. The Axiom of Infinity (type e) holds at $c_n$, by the argument of finite-support-two-object-all-maps, so it is possible.

*Address: `finite-support-two-object-all-maps-at-singleton#one-individual`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Plenitude.

ND holds at $W_1$: $(c_n\cdot Y)_k=Y_{k\circ c_n}$, and $k\circ c_n$ is $1_{W_1}$ for the map back to $W_1$ and $c_m$ for each $m$ as $k$ ranges over the maps on $\mathbb N$, so transport along $c_n$ determines $Y$ at every world. Given $U$ functional at the identity with values $Z_y$, put $X_k:=\{(k\cdot y,\bar a):\bar a\in(Z_y)_k\}$, well defined by ND, and in the domain, which at $W_1$ holds every intension (see full-at-singleton); and $Xy=Z_y$.

*Address: `finite-support-two-object-all-maps-at-singleton#plenitude`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Fails Analytic Necessitism.

At $W_1$, at type $t$. The propositions at $W_1$ are all the sets of its arrows out, the identity and the $c_n$, each such set being pinned down by $\{0\}$; they are continuum many, and the model being extensionally full at $W_1$ there is a real number structure of propositions there, complete since every subset of its carrier is the extension of a subproperty. Suppose $\mathfrak R$ were a rigid one, necessarily a real number structure, with carrier $X$. Its boxed clauses hold at $c_1$ and along the arrows after it, and $X_{c_1}$, its instances at $W_0$, is a complete ordered field there. But no proposition $x$ at $W_0$ is determined by its transport along the arrow $k$ of $W_0$ collapsing $0$ and $1$: with $q$ the set of arrows out of $W_0$ separating $0$ from $1$, pinned down by $\{0,1\}$ and containing no arrow after $k$, $y:=x\mathbin{\triangle}q$ is in the domain, differs from $x$, and has $k\cdot y=k\cdot x$; for $x\in X_{c_1}$ persistence gives $k\cdot y\in X_{k\circ c_1}$, inextensibility $y\in X_{c_1}$, and necessary distinctness $k\cdot y\ne k\cdot x$. So $X_{c_1}$ is empty, a contradiction, and Analytic Necessitism fails.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every intension at $W_1$ is in the domain (see the argument for Atomicity), so any set of tuples is the extension at the identity of one of them. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full at both objects, and an intension whose value at an arrow depends only on the arrow's codomain is pinned down by $\emptyset$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full at both objects, and an intension whose value at an arrow depends only on the arrow's codomain is pinned down by $\emptyset$. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every intension at $W_1$ is in the domain (see the argument for Atomicity), so any set of tuples is the extension at the identity of one of them. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every intension at $W_1$ is in the domain (see the argument for Atomicity), so any set of tuples is the extension at the identity of one of them. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

Suggested by Cian Dorr on 16 October 2026 as a separation of Atomicity from □Atomicity, which no recorded model gave: Atomicity holds at every type at the singleton object, and fails at type t at the worlds into $W_0$. No Lean verification is claimed.

## Sources

- **Dorr 16 Oct** — Cian Dorr, suggestion of 16 October 2026, re-rooting the model of Classicism, Appendix D, p. 79.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, paragraph beginning “One particularly interesting result”.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-two-object-all-maps-at-singleton.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, paragraph beginning “One particularly interesting result”. The construction, there evaluated at $W_0$.
