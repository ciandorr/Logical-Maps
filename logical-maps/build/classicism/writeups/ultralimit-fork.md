# Action model: a fork with an ultralimit world

<p class='cert'>Model — Source: Misc.; produced by Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI), prompted by Cian Dorr, equally involved, construction and Isabelle/HOL verification, 1 October 2026; Cian Dorr, with Claude Opus 5.5 (Anthropic), the presentation as an intensional action model, 1 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 1 October 2026.</p>

## Package

- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Boolean Completeness.** Necessarily, every property of entities of a relational type has a greatest lower bound in that type.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **□Truth implies 5-necessity.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An intensional action model with one individual. The objects are the root $o$, $s$, $u$, and $n$ for each $n\ge1$; besides identities the arrows are $h_s\colon o\to s$, $j\colon s\to u$, $h_u:=j\circ h_s$ and $h_n\colon o\to n$, so the root reaches each object by exactly one arrow and worlds may be identified with objects. The domains at $s$, $u$ and each $n$ are full. Identify the domains at the terminal objects $u$ and $n$ with one finite full type structure $M$ over one individual. Fix a non-principal ultrafilter $\mathcal U$ on the positive integers. At the root, an element of a relational type is any element of the full intension space whose extension at $u$ is the $\mathcal U$-limit of its extensions at the worlds $n$; its extensions at $o$, at $s$ and at each $n$ are unconstrained. So a root proposition is any choice of truth values at $o$, $s$ and the $n$s, with its value at $u$ fixed as the limit. Evaluation point: the root. Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

## Arguments

### Fails Self-atoms are atoms (type t).

At the root, a proposition is a choice of truth values at $o$, $s$ and the $n$s, its value at $u$ the limit. Let $P$ be true at two worlds $n_1,n_2$ and false elsewhere, so false at $u$. It is possible. It is a self-atom: at $n_1$ and $n_2$, which see only themselves, it becomes the top proposition of the two-element domain, an atom. It is not an atom, since the proposition true at $n_1$ alone lies strictly below it. So Self-atoms are atoms (type t) fails at the root.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Atomicity, □Boolean Completeness.

At the root, the map sending an element to its extensions at $o$, $s$ and the $n$s is an order isomorphism onto a product of powerset algebras, the extension at $u$ being recomputed as the limit. So every family has a meet and a join, computed coordinatewise except at $u$, and every nonzero element lies above an atom with one tuple in one free coordinate. The other worlds carry finite full powerset algebras. Hence Boolean Completeness and Atomicity hold at every world and every relational type.

*By Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI), prompted by Cian Dorr, equally involved, construction and Isabelle/HOL verification, 1 October 2026; Cian Dorr, with Claude Opus 5.5 (Anthropic), the presentation as an intensional action model, 1 October 2026.*

### Holds □BF.

Every arrow acts surjectively at every type, so BF holds at every world (write-up, Proposition 4).

*By Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI), prompted by Cian Dorr, equally involved, construction and Isabelle/HOL verification, 1 October 2026; Cian Dorr, with Claude Opus 5.5 (Anthropic), the presentation as an intensional action model, 1 October 2026.*

### Fails Rigid Comprehension.

At type $t\to t$ (write-up, Theorem 6). Let $A_0$ be the root propositions false at $s$ and at $u$, and $X$ the property with extension $A_0$ at the root and empty extensions elsewhere. A persistent property coextensive with $X$ contains both truth values at every world $n$, since members of $A_0$ take both values there; the limit condition then puts the true proposition in its extension at $u$. Rigidity at the root forces its extension at $s$ to be the proposition false at $s$ and $u$, and rigidity at $s$, tested against that proposition's haecceity, forbids the true proposition at $u$. The least upper bound of the haecceities of the $X$s, the candidate rigid coextension in the proof of Proposition 2.11, is weakly rigid but fails the rigidity condition at $s$. The model therefore refutes Proposition 2.11 (necessary-atomicity-completeness-bf-imply-rigid-comprehension); the gap is the normalization step of n. 42, part (iv), which the write-up runs inside the model (§5).

*By Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI), prompted by Cian Dorr, equally involved, construction and Isabelle/HOL verification, 1 October 2026; Cian Dorr, with Claude Opus 5.5 (Anthropic), the presentation as an intensional action model, 1 October 2026.*

### Holds □Intensional Choice.

At the root: given $F$ with $\Box\exists x\, .\,Fx$, let $G$ pick the least element of $F$ at $o$, $s$ and each $n$, under fixed well-orderings, the same ordering of $M^\sigma$ at every $n$. The sets $\{n : G(n)=\{a\}\}$ for $a\in M^\sigma$ partition the positive integers into finitely many pieces, so exactly one is in $\mathcal U$, say for $a_0$; then $\lim_{\mathcal U}G(n)=\{a_0\}$, and $a_0\in F(u)=\lim_{\mathcal U}F(n)$. Setting $G(u):=\{a_0\}$ puts $G$ in the root domain, with $G\le F$ and every extension a singleton. At $s$, $u$ and the $n$ the domains are full, and the well-ordering argument (arguments/intensional-choice-well-ordering) applies there, so the boxed form holds too.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Rigid Power.

At every relational type and every world. Write $k\cdot E$ for the transport of a set $E$ of tuples along an arrow $k$, and $X_0(E)$ for the relation $k\mapsto k\cdot E$, the disjunction of the haecceities of the members of $E$. At $s$, $u$ and each $n$ the model is full, and Rigid Power holds there as in every full model (arguments/rigid-power-tight). At the root, call a set $E$ of root tuples admissible when $X_0(E)$ is in the domain, that is, when $h_u\cdot E$ is the $\mathcal U$-limit of the sets $h_n\cdot E$ (subsets of a finite set, so the limit is the set taken at $\mathcal U$-many $n$). Since each member of $E$ has its value at $u$ as the limit of its values at the $n$, $h_u\cdot E$ is always included in that limit; and every finite $E$ is admissible, the finitely many limits being attained together at $\mathcal U$-many $n$.

(1) The rigid relations at the root are exactly the $X_0(E)$ with $E$ admissible. Such an $X_0(E)$, being in the domain, is rigid: it is persistent, and at every world $w$ it is $X_0(w\cdot E)$ there, included in every $X$ that necessarily holds of the members of $w\cdot E$. Conversely let $Y$ be rigid with extension $E$. Persistence gives $Y_k\supseteq k\cdot E$ at every arrow $k$. The root element $X$ with extensions $E$ at $o$, $h_s\cdot E$ at $s$, $h_n\cdot E$ at each $n$, and the limit at $u$, necessarily holds of every member of $E$ (its extension at $u$ includes $h_u\cdot E$, by the above), so inextensibility at the root gives $Y\le X$: $Y$ has extension $h_s\cdot E$ at $s$ and $h_n\cdot E$ at each $n$. Rigidity at $s$, in the full model on $s$ and $u$, makes the extension of $Y$ at $u$ the transport $j\cdot(h_s\cdot E)=h_u\cdot E$, and since $Y$ is in the domain that is also the limit of the $h_n\cdot E$. So $E$ is admissible and $Y=X_0(E)$.

(2) Let $F=X_0(S)$ be rigid at the root, and $P:=\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$, in the domain since it is definable from $F$. By (1) its extension at the root is $E_P:=\{X_0(T) : T\subseteq S\text{ admissible}\}$, and at a world $k$ among $s$, $u$ and the $n$ it is the set of rigid relations there below $k\cdot F$, which in those full models are the $X_0(T')$ with $T'\subseteq k\cdot S$. Each such $T'$ is finite, the domains there being finite, so it is $k\cdot T$ for a finite, hence admissible, $T\subseteq S$ (one preimage for each member), and $X_0(T')=k\cdot X_0(T)$. So the extension of $P$ at every $k$ is $k\cdot E_P$: $P=X_0(E_P)$, a rigid relation. Hence Rigid Power holds at the root, and so at every world.

*Address: `ultralimit-fork#rigid-power`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Holds □Transversal Choice.

At the root by the general argument transversal-choice-extensionally-full, the model being extensionally full there; at $s$, $u$ and each $n$ by the same argument, those worlds' domains being full and so extensionally full.

*Address: `ultralimit-fork#transversal-choice-everywhere`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-08.*

### Holds □Truth implies 5-necessity.

The category is a poset: no non-identity arrow has a retraction. The actual-world proposition is in the domain at every object (at the root the proposition true at $o$ alone; the other objects are full), so $\Box_{\ne}p$ holds at an identity iff $p$ contains $\Diamond\{1\}=\{1\}$, i.e. iff $p$ is true: $\Box_{\ne}$ is the identity operator at every object, hence so are $\hat{\hat\Box}$ and $\Box_5$, and every truth is 5-necessary everywhere.

*Address: `ultralimit-fork#five-necessity-is-truth`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Analytic Necessitism.

At the root, at type $t$. A root proposition is any choice of truth values at $o$, $s$ and the $n$s, so the root propositions are continuum many, and the root being extensionally full there is a real number structure of propositions at it: its carrier, order, sum, product and natural numbers are the extensions at $o$ of root entities, and every subset of the carrier is the extension of a subproperty, so it is complete. A rigid one, necessarily a real number structure, is impossible: transport along $h_1$ reads only a proposition's value at $1$, and the root proposition differing from $p$ at $o$ alone is in the domain, so no proposition is determined by its transport along $h_1$; but an instance $x$ of a rigid carrier $X$ is, since for $y$ with $h_1\cdot y=h_1\cdot x$ persistence gives $h_1\cdot y\in X_{h_1}$, inextensibility $Xy$, and necessary distinctness $y=x$.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At the root an element's extension at $o$ is unconstrained, so every set of tuples is the extension there of an element of the domain; the domains at $s$, $u$ and each $n$ are full. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The proposition true at $o$ alone (false at $s$, at every $n$, and so in the limit at $u$) is in the root domain and entails every truth, every true proposition being true at $o$; no world other than $o$ sees $o$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails B for pure sentences.

The pure sentence $\exists p_1\ldots p_n\bigwedge_{i<j}p_i\ne p_j$ is true at the evaluation object and false at the world $V$ after it and at every world after $V$; so $\Diamond$ of it is false at $V$, and $\Box\Diamond$ of it false at the evaluation object. (The chain's own argument of 25 September, stated once.)

*General argument `arguments/fewer-propositions-after`. It requires that For some $n$, the evaluation object has $n$ distinct propositions, while some world after it, and every world after that one, has fewer. Here: The root has at least three distinct propositions, while each world $n$, which sees only itself, has two. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At the root an element's extension at $o$ is unconstrained, so every set of tuples is the extension there of an element of the domain; the domains at $s$, $u$ and each $n$ are full. It requires that There are infinitely many propositions at the evaluation world. Here: A root proposition is any choice of truth values at $o$, $s$ and the $n$s, so there are infinitely many. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: The definition fixes one individual, at every world. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At the root an element's extension at $o$ is unconstrained, so every set of tuples is the extension there of an element of the domain; the domains at $s$, $u$ and each $n$ are full. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: The definition fixes one individual, at every world. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At the root an element's extension at $o$ is unconstrained, so every set of tuples is the extension there of an element of the domain; the domains at $s$, $u$ and each $n$ are full. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: At the root an element's extension at $o$ is unconstrained, so every set of tuples is the extension there of an element of the domain; the domains at $s$, $u$ and each $n$ are full. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

It is a model: the limit condition commutes with every finite operation, so every term denotes in the domains (write-up, Lemma 2).

## Sources

- **Fitelson 1 Oct** — Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI), prompted by Cian Dorr, A proposed counterexample to Proposition 2.11, note communicated to Cian Dorr, 1 October 2026; Isabelle/HOL verification at github.com/fitelson/hom-isabelle, commit 4042cc0, Applications/2.11.
- **Intensional write-up 1 Oct** — Cian Dorr, with Claude Opus 5.5 (Anthropic), A counterexample to Proposition 2.11 of 'Classicism': Fitelson's model, as an intensional action model, draft of 1 October 2026, sources/prop-2-11-counterexample.pdf.

<p class='cert'>Record: <code>topics/classicism/models/ultralimit-fork.yaml</code></p>

## Paper references

- **Proof: [A counterexample to Proposition 2.11 of 'Classicism'](https://github.com/zwlgzwlg/Logical-Maps/blob/main/logical-maps/topics/classicism/sources/prop-2-11-counterexample.pdf).** ([PDF](../sources/prop-2-11-counterexample.pdf)) Cian Dorr, with Claude Opus 5.5 (Anthropic). A counterexample to Proposition 2.11 of 'Classicism': Fitelson's model, as an intensional action model. Draft of 1 October 2026, reworking a construction by Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI). — §§2–4
- **Proof: [Proposition 2.11 refuted (Isabelle/HOL)](https://github.com/fitelson/hom-isabelle/tree/4042cc0/Applications/2.11).** Branden Fitelson, with Claude (Anthropic) and GPT-6 Astra (OpenAI). Isabelle/HOL verification that Rigid Comprehension for properties of propositions is not derivable from Classicism with □Atomicity, Boolean Completeness and BF; theorem proposition_2_11_refuted. Commit 4042cc0, 1 October 2026. — theorem proposition_2_11_refuted. Verifies the failure of Rigid Comprehension under the hypotheses; the boxed forms of Boolean Completeness and BF are not formalized there.
- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §2. Definitions of intensional action models and the rigidity criterion used in the verification.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Proposition 2.11 and n. 42. The proposition this model refutes.
