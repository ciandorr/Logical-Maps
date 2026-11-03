# Finite-support action model: permutations of N [one individual]

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **ND.** Distinct things of any type are necessarily distinct.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Weakly Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a weakly inextensible one.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Proposition D.5, part 1 (pp. 75–76): the one-object category whose arrows are all the permutations of $\mathbb N$, so that each arrow $h$ represents the possibility in which each individual $n$ plays the role actually played by $hn$, and the roles can be redistributed in any way. In every part, $W_0^\ddagger$ is the set of finite subsets of $\mathbb N$ and the model is ideally full: a proposition is a set of arrows whose membership depends only on the arrows’ values on some finite set of numbers (it is pinned down by that set), and an entity of a higher type is an applicative behaviour profile pinned down by a finite set in the same sense. There is a single individual, which every arrow fixes; the arrows still act on $\mathbb N$, which supplies the pinning sets. Propositions and properties are thus about finitely many numbers and indifferent to how the arrows treat the rest. Evaluation point: the sole object, at the identity arrow.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finite-support action models on one object, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds ND, Atomlessness.

Every arrow is invertible, so transport along it is injective at every type.

*Source: Classicism, Proposition D.5(1), pp. 75–76. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The reason for No Distinctness Necessity's holding, added so that it visibly covers the variant with a single individual; Atomlessness concerns propositions only.

### Fails Weakly Inextensible Comprehension.

At type $t\to t$, for the family $E$ of propositions $p_n$ that $n$ is fixed: for $Y$ weakly inextensible with extension $E$ pinned down by $S$, pick $k\notin S$ and let $X$, pinned down by $S_X:=S\cup\{k\}$, hold at an arrow $h$ exactly of the propositions $\{i : i(m)=n\}$ with $n\notin S_X$ and of the propositions $\{i : i(h(n))=n\}$ with $n\in S_X$; $X$ is necessary of every $p_n$, but at a permutation $h$ fixing $S$ pointwise and moving $k$ its extension omits $p_k$, which the extension of $Y$ at $h$ contains. Inextensible Comprehension fails with it.

*By Claude Fable 5.1 (Anthropic), answering Cian Dorr’s question whether the failure of Actuality can be sharpened to a failure of Inextensible Comprehension, 2026-09-23.*

*Revised 2026-09-25 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Merged the two sets of arguments recorded on 23 and 25 September into one: the simpler 25 September argument for Inextensible Comprehension, which also refutes the weak form, replaces the 23 September one.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Cut to its type $t\to t$ part; the type $e\to t$ part duplicated the group's shared argument weakly-inextensible-comprehension, which applies here.

### Holds Second-Order Analytic Necessitism.

At every type, so Analytic Necessitism holds too. At type $e$ the antecedent fails, the individuals being countable or one. At a relational type $\sigma$ the entities pinned down by $\{0\}$ are continuum many; choose a set $X_1$ of them in bijection with the reals and let $X_k$ be its transport $k\cdot X_1$, and likewise for the order, sum, product and natural numbers of the reals carried over to $X_1$ and for the represented powers, the rigid relations with a given extension among the instances. Every arrow being a permutation, transport is injective and reversible, so these intensions are rigid, with necessarily distinct instances, and they are pinned down by $\{0\}$, their value at $k$ depending only on $k0$; at every arrow the structure has the same instances and relations as at the identity, so it is necessarily a real number structure with represented powers of every arity (write-up).

*Write-up: [finite-support-permutations](finite-support-permutations.html). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, from a correction by OpenAI Codex (GPT-6), prompted by Daniel Kodsi, in his pull request:* In the write-up, the transported intension $k\cdot Y^A$ is pinned down by $\{k0\}$, not by $\{0\}$, its value at $j$ depending on $j(k0)$. Lemma 2, that $X$ and the relations are pinned down by $\{0\}$, is unaffected, and so are the verdicts.

### Holds Axiom of Infinity (type t).

The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct and each has that number as finite support, so there are infinitely many propositions. The set of numerals at type $t$ is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#axiom-of-infinity-t`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$t$ half of the old argument, "individual" becoming "number", so that it covers the one-individual variants.

### Fails Boolean Completeness (type t).

The source (n. 92) conjectures this but does not show it. Any set $F$ of propositions is the extension at the identity of an element of the domain at type $t\to t$, namely the profile $\langle h,p\rangle\mapsto\{i : i\cdot p\in F\}$: it is natural, independent of $h$ and so pinned down by the empty set, and each of its values is pinned down by the pinning set of $p$, since $i\cdot p$ depends only on the values of $i$ there. A least upper bound of $F$ under entailment is a least finitely pinned superset of $\bigcup F$, and it exists only if the least $S$-pinned superset of $\bigcup F$ stops shrinking as the finite set $S$ grows. So the family $F$ of the condition has no least upper bound, and, taking pointwise negations, the family of complements has no greatest lower bound.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#boolean-completeness-t`. It requires that Some family $F$ of propositions has no least finitely pinned superset of its union $\bigcup F$. Here: Let $F$ be the family of propositions $A_m$ ($m\ge1$), each pinned down by $\{0,m\}$, that the permutation swaps $0$ and $m$. A permutation $\pi$ belongs to the least superset of $\bigcup F$ pinned down by $S=\{0,\ldots,N\}$ iff either $\pi(0)\in S\setminus\{0\}$ and $\pi(\pi(0))=0$, or $\pi(0)\notin S$ and $0\notin\pi(S)$; the $3$-cycle $(0\ N{+}1\ N{+}2)$ satisfies the second clause for $S$ but neither clause for $\{0,\ldots,N+1\}$, so these supersets strictly shrink. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The seven members' copies stated once, each member's family moved to the condition no-least-pinned-cover; the truncations' separate argument of 23 September, by Claude Fable 5.1 prompted by Cian Dorr, is now its witness, its own proof that the family is in the domain giving way to the profile above. The trawl's second arguments for the same verdict (25 September, DeepSeek, reviewed by OpenAI Codex) were dropped.

### Fails Countable Boolean Completeness.

At $\sigma=\tau=t$: the family $F$ of the condition no-least-pinned-cover, which has no least upper bound by the shared argument boolean-completeness-t, is in every member a sequence of propositions $A_m$, and it is countable relative to $t$. The numerals at type $t$ are the finite cardinalities and are pairwise distinct (the shared argument axiom-of-infinity-t), and extensional fullness puts in the domain the relation pairing each $A_m$ with the $m$-th numeral, which injects $F$ into them. This needs no infinity of individuals, so it covers the members with a single individual.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#countable-boolean-completeness-t`. It requires that Some family $F$ of propositions has no least finitely pinned superset of its union $\bigcup F$. Here: Let $F$ be the family of propositions $A_m$ ($m\ge1$), each pinned down by $\{0,m\}$, that the permutation swaps $0$ and $m$. A permutation $\pi$ belongs to the least superset of $\bigcup F$ pinned down by $S=\{0,\ldots,N\}$ iff either $\pi(0)\in S\setminus\{0\}$ and $\pi(\pi(0))=0$, or $\pi(0)\notin S$ and $0\notin\pi(S)$; the $3$-cycle $(0\ N{+}1\ N{+}2)$ satisfies the second clause for $S$ but neither clause for $\{0,\ldots,N+1\}$, so these supersets strictly shrink. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism.

At type $\tau:=tt$. For each object $V$ reachable from the evaluation point fix an injection $A\mapsto E^A_V$ from the sets of natural numbers into the sets of propositions at $V$, possible as these are infinitely many, and let $Y_A$ be the intension whose value at an arrow into $V$ is $E^A_V$: it depends only on the codomain, so it is in the domain, and its transport along an arrow into $V$ is the $Y_A$ of $V$, distinct for distinct $A$. Carry the real numbers onto the $Y_A$ and take as relations the codomain-only intensions whose value at $V$ is the corresponding set of tuples of the $Y_A$ of $V$. Along every arrow the structure is carried to the like structure at the target, an isomorphic copy, which is a real number structure there: bounded sets of its elements have least upper bounds among them and every inductive subproperty contains its natural numbers. Such a structure is rigid, its instances are necessarily distinct, and it is necessarily a real number structure; and the codomain-only intension of type $((\tau)^kt)t$ whose value at each object is the set of codomain-only $k$-ary relations among the carrier there is a represented power of arity $k$, since at every world each $k$-ary relation agrees on the carrier with one of them. So the consequents of Analytic Necessitism and of its second-order form hold, and both principles hold. (The argument of the withdrawn analytic-necessitism-unretracted-arrow would refute this structure; its step from inextensibility is the gap.)

*General argument `arguments/analytic-necessitism-codomain-everywhere`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: The evaluation object is the only object, and its propositions are infinitely many (as for infinitely-many-propositions). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, auditing the withdrawn arguments for the failure of Analytic Necessitism, 2026-10-29.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism.

At type $\tau:=tt$. With one object, an intension whose value is the same at every arrow is in the domain by the condition, and it is fixed by transport along every arrow: $(h\cdot Y)_j=Y_{jh}=Y_j$. The propositions are infinitely many, so the constant intensions $Y_E$, for $E$ a set of propositions, are at least continuum many and pairwise distinct. Carry the real numbers onto continuum many of them, and take as carrier, order, sum, product, $0$, $1$ and natural numbers the constant intensions whose values are the corresponding sets of tuples of the $Y_E$. All parameters are fixed, so a formula about them has the same truth value at every world, and at the evaluation point they form a real number structure: any bounded set of carrier elements has a least upper bound among them, and every inductive subproperty contains the copy of the natural numbers. Such a structure is rigid, its instances are necessarily distinct, and it is necessarily a real number structure; and the codomain-only intension of type $((\tau)^kt)t$ whose value at each object is the set of codomain-only $k$-ary relations among the carrier there is a represented power of arity $k$, since at every world each $k$-ary relation agrees on the carrier with one of them. So the consequents of Analytic Necessitism and of its second-order form hold, and both principles hold. (The argument of the withdrawn analytic-necessitism-unretracted-arrow would refute this structure; its step from inextensibility is the gap.)

*General argument `arguments/analytic-necessitism-codomain-fixed`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: Each part of Proposition D.5 is a one-object category acting on $\mathbb N$ (Appendix D, Definitions D.1–D.3). It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct, each pinned down by that number (the shared argument axiom-of-infinity-t). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, auditing the withdrawn arguments for the failure of Analytic Necessitism, 2026-10-29.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The model is ideally full: every entity is pinned down by a finite set of numbers, and every intension pinned down by one is in the domain (Definitions D.1–D.3). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct, each pinned down by that number (the shared argument axiom-of-infinity-t). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Axiom of Infinity (type t).

As for individuals (necessary-axiom-of-infinity-individuals), at type $t$. At the identity arrow of each reachable object $v$, with $\Phi$ of type $(tt)t$ holding there of exactly the properties of propositions with finite extension, $\lambda Y^{(tt)t}\, .\,\forall X^{tt}\, .\,YX\to\Phi X$ is in the domain, holds of $\mathbf 0_t$, and passes to successors, identity at $t$ being literal at $1_v$; so every finite cardinality holds only of properties with finite extension, and none holds of the universal property of propositions, whose extension is the infinite set of propositions at $v$. So the Axiom of Infinity at type $t$ holds at every reachable object, and its necessitation at the evaluation point.

*General argument `arguments/necessary-axiom-of-infinity-propositions`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: The evaluation object is the only object. The model is ideally full, so it contains every intension pinned down by $\emptyset$, among them the constant intensions, which give any extension at $1$; and the haecceity of an entity is pinned down by the set pinning the entity, so identity is literal. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: The evaluation object is the only object, and its propositions are infinitely many (as for infinitely-many-propositions). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: Each part of Proposition D.5 is a one-object category acting on $\mathbb N$ (Appendix D, Definitions D.1–D.3). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. The source derives the failure of Boolean Completeness through C5 and the failure of Actuality (Propositions 2.5–2.6), which gives nothing about countable families.

## History

The record's revision log before it was written as arguments.

- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell) — Added Transversal Choice, by the argument recorded for Relational Choice: the model is extensionally full at every object, so for an equivalence relation at the evaluation point a transversal of its extension there, chosen in the metatheory, is the extension of an element pinned down by the empty set; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added the failure of Boolean Completeness (type t) and of Inextensible Comprehension, with the arguments in the notes. Now violates: Boolean Completeness (type t), Inextensible Comprehension.
- **2026-09-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — Merged the two sets of arguments recorded on 23 and 25 September into one: the simpler 25 September argument for Inextensible Comprehension, which also refutes the weak form, replaces the 23 September one. Now violates: Weakly Inextensible Comprehension.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Expanded the description from Appendix D, naming Proposition D.5 and its part; added the failure of Countable Boolean Completeness at type e→t; settled Truths are ND-necessary. Now violates: Countable Boolean Completeness, Truths are ND-necessary.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Relational Choice and its necessitation at Cian Dorr’s direction: ideally full models are extensionally full at every object, and choice in the metatheory supplies the functional subrelation; see the notes. Now satisfies: Relational Choice, □Relational Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Inextensible Comprehension at type e→t for the property of being even, sharpening the failure of Actuality; argument in the notes. Now violates: Inextensible Comprehension.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: ND, BF, No Pure Contingency, □ND, □BF, Atomlessness. Now violates: Atomicity, Actuality, Boolean Completeness, Rigid Comprehension.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Proposition D.5, part 1, pp. 74–76; p. 79 (No Pure Contingency).

<p class='cert'>Record: <code>topics/classicism/models/finite-support-permutations.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Proposition D.5(1), pp. 74–75; construction pp. 75–76; p. 79 (No Pure Contingency)
