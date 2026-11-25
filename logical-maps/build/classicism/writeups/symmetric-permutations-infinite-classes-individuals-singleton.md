# Symmetric ideally-full model: permutations, with the automorphisms of infinitely many infinite classes as symmetries [one individual]

<p class='cert'>Model — Source: Misc.; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026 (the construction, a variant of symmetric-infinite-classes with permutations as arrows, and the verification); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Possible failure of Cardinal CH.** Cardinal CH possibly fails.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Possible Cardinal CH.** Cardinal CH possibly holds.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Potential Infinity (type e).** For every natural number, there could be at least that many individuals: each number counted at type $e$ possibly holds of some property of individuals.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over one object, the set of natural numbers, equipped with an equivalence relation that has infinitely many classes, each infinite. Its arrows are all the permutations of that set, and its symmetry group is the automorphism group of the equivalence relation: the permutations that map classes onto classes. The object carries the ideal of finite sets. The evaluation point is the identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □ND.

Every arrow is invertible, so transport along any arrow is injective at every type, at every world: distinct entities stay distinct along every arrow, and ND holds at every world, at every type.

*Address: `symmetric-permutations-infinite-classes-individuals-singleton#c5`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Atomlessness.

Let $p$ be a possible proposition, pinned down by a finite $N$ and containing the arrow $h$. Take distinct points $m,m^{\prime}\notin N$ and put $q:=\{k\in p : km\sim km^{\prime}\}$, symmetric and pinned down by $N\cup\{m,m^{\prime}\}$, so in the domain, with $q\le p$. A permutation agreeing with $h$ on $N$ and sending $m$ and $m^{\prime}$ to two fresh points of one class lies in $q$, and one sending them to fresh points of different classes lies in $p$ but not in $q$, both lying in $p$ by pinning. So $q$ is possible and $q\ne p$.

*Address: `symmetric-permutations-infinite-classes-individuals-singleton#atomlessness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Boolean Completeness (type t).

Write $E_k:=\{(x,y) : kx\sim ky\}$ for an arrow $k$. If $E_k$ and $E_{k^{\prime}}$ agree on a finite $M$, the map $k(m)\mapsto k^{\prime}(m)$ preserves and reflects $\sim$, so it extends to an automorphism $g$ of the equivalence relation, the classes being infinitely many and infinite, and $g\circ k$ agrees with $k^{\prime}$ on $M$; so a proposition pinned down by $M$ contains $k$ iff it contains $k^{\prime}$. And for finite sets $A$ and $B$ and arrows $k_A$, $k_B$ with $E_{k_A}$ and $E_{k_B}$ agreeing on $A\cap B$, some permutation $k$ has $E_k$ equal to $E_{k_A}$ on $A$ and to $E_{k_B}$ on $B$: amalgamate the two equivalence relations over $A\cap B$ and send each class of the result into its own class. Now let $X$ be a property of propositions, pinned down by a finite $N$, and let $\ell$ hold at $h$ iff every arrow $k$ with $E_k=E_h$ on $N$ belongs to every member of $X$'s extension at the identity. $\ell$ is symmetric and pinned down by $N$, and it entails every member. Let $q$, pinned down by $M\supseteq N$, entail every member, and let $h\in q$; suppose some $k$ with $E_k=E_h$ on $N$ lies outside some member $p$, pinned down by $P$. Take a symmetry $g$ fixing $N$ pointwise that moves each point of $P\setminus N$ inside its class to a point outside $M$. Then $g\cdot p=\{k^{\prime} : k^{\prime}\circ g\in p\}$ is a member, $X$ being fixed by $g$, it is pinned down by $g(P)$, whose intersection with $M$ lies in $N$, and $k\circ g^{-1}$, which agrees with $k$ on $N$, lies outside it. An arrow $h^{\prime}$ with $E_{h^{\prime}}$ equal to $E_h$ on $M$ and to $E_{k\circ g^{-1}}$ on $g(P)$ lies in $q$ but not in $g\cdot p$, a contradiction. So $q\le\ell$, and $\ell$ is the greatest lower bound.

*Address: `symmetric-permutations-infinite-classes-individuals-singleton#boolean-completeness-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Countable Boolean Completeness.

At every relational type. First, an entity $Y$ pinned down by a finite $T$ and fixed by every symmetry fixing a finite $N$ pointwise is pinned down by $N$. For $Y$'s extension at $k\circ w$ equals its extension at $k$ both when $w$ is a symmetry fixing $N$ pointwise and, by pinning, when $w$ is any permutation fixing $T$ pointwise. These $w$ generate every permutation fixing $N$ pointwise: a transposition $(a\,b)$ of points outside $N$, with $a\in T$ say, is $(a\,c)(c\,b)(a\,c)$ for $c\notin T\cup N$ in the class of $a$, where $(a\,c)$ is a symmetry fixing $N$ and $(c\,b)$ fixes $T$ if $b\notin T$ (if $b\in T$, do the same for $b$); so every finitary permutation of the points outside $N$ is generated, and every permutation fixing $N$ pointwise agrees on $T$ with one of those. Now let $X$ be countable, and let a finite $N$ pin down both $X$ and an injection $I$ of $X$ into the finite cardinalities. These are standard and fixed by every arrow, as in the group's arguments for the Axiom of Infinity, so for a symmetry $g$ fixing $N$ pointwise and a member $Y$ of $X$'s extension, $g\cdot Y$ is a member too and $I$ assigns it the cardinality it assigns $Y$; so $g\cdot Y=Y$, and every member is pinned down by $N$. Their union, taken arrow by arrow, is then symmetric and pinned down by $N$, so in the domain, and it is the least upper bound, the order being inclusion of intensions.

*Address: `symmetric-permutations-infinite-classes-individuals-singleton#countable-boolean-completeness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: The arrows are permutations. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: The object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Possible failure of Cardinal CH. Fails Possible Cardinal CH.

Cardinal CH fails at every world, so it is not possible, and its failure, being actual, is possible. With one individual at every world, $N=\operatorname{LowerNat}_e$ has exactly three instances at every world. At-least zero, $z=\lambda A\, .\,\top$, and its successor, which holds of the properties with an instance, differ at the empty property. The successor of that holds of the properties with two distinct instances, so of none at any world; it is $\lambda A\, .\,\bot$ by Intensionality, so is its own successor, and differs from the other two, which hold of the universal property. Being one of the three is a property of cardinalities that $z$ has and that passes to successors, so $N$ has no other instance. The rest is the argument cardinal-ch-boundedly-many-individuals with $m=3$: the rigid subproperties of $N$ are the eight disjunctions of haecceities of its instances, and a property holding of four of them neither injects into the three instances of $N$ nor is in bijection with the eight. No choice is used.

*General argument `arguments/cardinal-ch-one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-25.*

### Fails Intensional Choice.

At the type of the condition's $F$. Suppose $G\le F$ is necessarily uniquely instantiated. $G$ is in the domain, so it is symmetric and pinned down by a finite set $N$. Let $h$ be the arrow the condition gives for $N$ and $\{y\}$ the extension of $G$ at $h$; $y$ is in $F$'s extension at $h$, since $G\le F$. Let $g$ be the symmetry the condition gives, fixing $h(N)$ pointwise and moving $y$. Then $g\circ h$ agrees with $h$ on $N$, so by pinning $G$'s extension at $g\circ h$ is $\{y\}$, while by symmetry it contains $g\cdot y$. So $g\cdot y=y$, a contradiction. $\Box$Intensional Choice fails with it, by T. The condition collapse-onto-point is the case in which $h(N)$ is a single point outside $F$'s extension at $h$; with invertible arrows there are no collapses, but an arrow may still carry $N$ to a position where every instance of $F$ is moved by the symmetries fixing the image of $N$.

*General argument `arguments/intensional-choice-moved-instances`. It requires that A group $G$ acts on the individuals at the evaluation object, and every element of a relational domain there is symmetric, meaning that $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ whenever $g\in G$ and $g\circ h$ is an arrow, and is pinned down by a finite set of individuals, its extension at an arrow depending only on the arrow's values there. Here: The relational domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18). It requires that There is a necessarily instantiated entity $F$ of some type $\sigma t$ in the domain at the evaluation object such that, for every finite set $N$ of points of the pinning base there, some arrow $h$ out of the evaluation object has every member of $F$'s extension at $h$ moved by a member $g$ of the symmetry group of $h$'s codomain that fixes $h(N)$ pointwise, with $g\circ h$ again an arrow. Here: At type $t$, so with either individuals. Write $[u\sim v]$ for the proposition $\{k : ku\sim kv\}$, symmetric and pinned down by $\{u,v\}$; a symmetry $g$ carries it to $[gu\sim gv]$, and $[u\sim v]=[u'\sim v']$ only if $\{u,v\}=\{u',v'\}$. Fix a point $a$ and let $F$, of type $tt$, have as extension at $h$ the propositions $[u\sim v]$ with $u\ne v$, $u\sim v$ and $u\not\sim h(a)$: symmetric, pinned down by $\{a\}$, and necessarily instantiated, there being other classes. Given $N$, let $h$ be a permutation carrying $N\cup\{a\}$ into one class. For $[u\sim v]$ in $F$'s extension at $h$, $u$ and $v$ lie in another class, so the transposition of $u$ with a third member $w$ of its class fixes $h(N)$ pointwise, is an automorphism of the equivalence relation, and carries $[u\sim v]$ to $[w\sim v]\ne[u\sim v]$; composed with $h$ it is again a permutation. With the base as individuals, $F:=\lambda x\, .\,\neg(x\sim a)$ at type $e$ works the same way: every instance at $h$ lies outside the class containing $h(N)$ and is moved by a transposition inside its own class. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e), Potential Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world. And the numeral $\operatorname{Suc}_e\operatorname{Suc}_e\mathbf{0}_e$, a finite cardinality, holds of no property at any world, a property it holds of having two distinct instances; so Potential Infinity (type $e$) fails.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The failure of Potential Infinity (type e) added, with its sentence of the text. It is the strongest of the four verdicts: the Axiom of Infinity and Possible Infinity each imply Potential Infinity.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


## Notes

With all surjections as arrows this is symmetric-infinite-classes. Separates C5 from Transversal (and so from Transversal Choice and Actuality, which implies Transversal): a symmetric ideally-full model with invertible arrows, so C5 holds, in which the symmetry group, the automorphisms of an equivalence relation with infinitely many infinite classes, leaves no canonical representative of a class, as in symmetric-infinite-classes. Transversal holds in ideally full models with codomain intensions whatever the metatheory, the constant intension with value $E$ being a canonical member of each coextension class; it is the symmetry that removes those representatives. Intensional Choice fails too, at types $e$ and $t$, although no arrow collapses: an arrow carrying the pinning set into one class leaves every instance of $\lambda x\, .\,\neg(x\sim a)$ movable by the symmetries fixing its image (topic argument intensional-choice-moved-instances). Recorded with the base as individuals; the argument against Transversal does not apply to the generated variant with one individual.

## Sources

- **Opus 29 Oct** — Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026, on Cian Dorr's question whether C5 implies Transversal; the symmetry group and the argument against Transversal are those of symmetric-infinite-classes (Cian Dorr, 27 September 2026).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §3 (symmetric ideally-full models).

<p class='cert'>Record: <code>topics/classicism/models/symmetric-permutations-infinite-classes.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §3. The framework of symmetric ideally-full models.
