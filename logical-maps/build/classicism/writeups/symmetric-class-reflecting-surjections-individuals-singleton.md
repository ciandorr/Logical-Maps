# Symmetric ideally-full model: class-reflecting surjections of infinitely many infinite classes [one individual]

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr, 16 October 2026 (the model, with infinitely many infinite classes, arrows collapsing only within a class and symmetries preserving the classes), with Claude Opus 5.5 (Anthropic), who fixed the arrows and wrote the verification; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 16 October 2026.</p>

## Package

- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over one object, the set of natural numbers, equipped with an equivalence relation $E$ that has infinitely many classes, each infinite. Its arrows are the surjections $h$ of that set that reflect $E$ ($hx\mathrel Ehy$ only if $x\mathrel Ey$), so that an arrow identifies two points only if they are in the same class; these are closed under composition. Its symmetry group is the automorphism group of $E$, the permutations that map classes onto classes. The evaluation point is the identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Truth implies ND-necessity.

For finite $N$, let $\delta_N$ be the set of arrows that are injective on $N$ and preserve the pattern of $E$ on $N$. It is symmetric, pinned down by $N$ and true, and $\Diamond\delta_N=\delta_N$: if $kh\in\delta_N$ then $h$ is injective on $N$, and $h$ preserves the pattern because $k$ reflects $E$. Every truth $p$ pinned down by $N$ contains $\delta_N$: an arrow in $\delta_N$ agrees on $N$ with a partial isomorphism of $E$, which extends to an automorphism $\sigma$, and $\sigma\in p$ by symmetry. So every truth is ND-necessary, with $\delta_N$ as the witness.

*Write-up: [symmetric-class-reflecting-surjections](symmetric-class-reflecting-surjections.html). Address: `symmetric-class-reflecting-surjections-individuals-singleton#truth-implies-nd-necessity`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Atomlessness.

Let $p$ be possible, pinned down by $N$, containing $h$. Choose $m\ne m^{\prime}$ in a class disjoint from $N$, and let $q$ be the arrows in $p$ that send $m$ and $m^{\prime}$ into one class: symmetric, pinned down by $N\cup\{m,m^{\prime}\}$, and $q\le p$. Arrows agreeing with $h$ on $N$ may send $m$ and $m^{\prime}$ into one class not met by $h(N)$, or into two such classes, and both are in $p$; so $q$ is possible and $q\ne p$.

*Address: `symmetric-class-reflecting-surjections-individuals-singleton#atomlessness`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: The arrows are surjections by definition. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: Every object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Fails Analytic Necessitism.

Write $G$ for the symmetry group, which acts on the propositions by transport, $g\cdot p=\{j:j\circ g\in p\}$. For a finite set $N$ of points let $E_N$ be the set of arrows constant on $N$: a proposition in the domain, symmetric and pinned down by $N$, with $g\cdot E_N=E_{g(N)}$. Take for each $n\ge2$ a set $N_n$ of $n$ points and an arrow $j_n$ constant on $N_n$, injective off $N_n$ and taking other values there (the condition), so that the fibres of $j_n$ are $N_n$ and singletons. The orbits $O_n$ of the $E_{N_n}$ under $G$ are pairwise distinct: $E_{N_n}=E_N$ with $N=g(N_m)$ puts $j_n$ in $E_N$, so $N\subseteq N_n$, and puts $j_m\circ g^{-1}$, an arrow whose fibres are $N$ and singletons, in $E_{N_n}$, so $N_n\subseteq N$. For $A\subseteq\mathbb N$ the union $S_A$ of the $O_n$ with $n\in A$ is a $G$-invariant set of propositions, and $A\mapsto S_A$ is injective: there are continuum many $G$-invariant sets of propositions, in explicit bijection with the reals. Each $S_A$ is the value of a constant intension $Y_A$ of type $tt$, symmetric because $S_A$ is $G$-invariant, pinned down by the empty set, so in the domain, and fixed by transport along every arrow. The constant intensions whose values are the set of the $Y_A$, the order, sum and product of the reals carried over to it, and its natural numbers, with the $Y_A$ standing for $0$ and $1$, are symmetric, their values being made of fixed entities, and in the domain; they form a real number structure of type $tt$ at the evaluation point, complete since every bounded set of its elements has a least upper bound among them. So the antecedent of Analytic Necessitism holds at type $tt$. Its consequent fails there. Let $k$ be an arrow with $ka=kb$ for distinct points $a$ and $b$ (the condition at $n=2$) and $q$ the set of arrows $j$ with $ja\ne jb$: symmetric, pinned down by $\{a,b\}$, containing the identity and no arrow $j\circ k$. For $x$ of type $tt$ in the domain let $y$ agree with $x$ except at the arrows in $q$, where the top proposition is added to its value or removed from it: $y$ is symmetric and pinned down by a finite set, so in the domain, differs from $x$, and has $k\cdot y=k\cdot x$. If $\mathfrak R$ were a rigid real number structure of type $tt$, necessarily a real number structure, with carrier $X$ (Background, Analysis), an instance $x$ and this $y$ would give $k\cdot y=k\cdot x\in X_k$ by persistence, $Xy$ by inextensibility and $k\cdot y\ne k\cdot x$ by necessary distinctness: $X$ has no instance. So Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-exact-collapses-symmetric`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object (Dorr, draft, §3.1: closed pure terms denote entities fixed by every arrow). It requires that A group $G$ acts on the individuals at the evaluation object, and every element of a relational domain there is symmetric, meaning that $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ whenever $g\in G$ and $g\circ h$ is an arrow, and is pinned down by a finite set of individuals, its extension at an arrow depending only on the arrow's values there. Here: The relational domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18). It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: A relational domain holds exactly the symmetric intensions pinned down by a finite set, and every individual $n$ is pinned down by $\{n\}$. It requires that For every $n\ge2$ there are a set $N$ of $n$ points of the set the arrows act on and an arrow out of the evaluation object that is constant on $N$ and injective off $N$, with its values off $N$ different from its value on $N$. Here: Take $n\ge2$ points of one class: the surjection sending them to one of them, the rest of the class bijectively onto its other points, and fixing the other classes reflects $E$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: A relational domain holds exactly the symmetric intensions pinned down by a finite set, and every individual $n$ is pinned down by $\{n\}$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

A self-atom of any relational type at an object $W$ is instantiated at some arrow $k$ out of $W$, and its transport along $k$ is an atom at $k$’s target instantiated at the identity there. The existential projection of an atom $I$ of a relational type, the proposition $\exists\bar x\, .\,I\bar x$, is an atom of type $t$: it is in the domain, it is not bottom, and for any proposition $p$ the entity $I\land\lambda\bar x\, .\,p$ lies below the atom $I$, so is $I$ or bottom, which puts $p$ above the projection or disjoint from it. So the projection is a true atom at $k$’s target, which the condition excludes. Hence no reachable object has a self-atom, and Self-atoms are atoms and Self-atoms are strong atoms hold vacuously at every type and every reachable object, while Self-Atomicity (type t) fails at the evaluation point, the top proposition having no self-atom below it.

*General argument `arguments/no-actuality-no-self-atoms`. It requires that Actuality fails at the identity of every object reachable from the evaluation point: no atom of the domain of propositions there contains that identity. In a one-object model this is the failure of Actuality at the evaluation point, Actuality being a closed sentence. Here: One object, so Actuality, a closed pure sentence, holds at every world iff at the identity, where it fails (recorded in this model’s verdicts). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object (Dorr, draft, §3.1: closed pure terms denote entities fixed by every arrow). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


## Notes

Found on 16 October 2026 to show that the closed pure sentence "each individual is contingently distinct from some other, but no functional relation takes each individual to an individual contingently distinct from it" is consistent with C, a premise of maximalism-incompatible-with-modalized-relational-choice. Unlike symmetric-infinite-classes, whose arrows are all surjections, its arrows never merge classes; that makes every truth ND-necessary there, and it separates the Truth-implies-necessity principles from Transversal. The nearest recorded model, symmetric-all-surjections (Base 1), differs from it on Transversal. Boolean Completeness, Inextensible and Weakly Inextensible Comprehension fail (added later on 16 October), the arguments for them in symmetric-all-surjections needing arrows that cannot split a class. Left unknown: Countable Boolean Completeness, and the rigidity family (Tame Rigidity, Rigid Power, Rigid Rigidity and their weak forms), whose recorded arguments assume all surjections or section arrows, the latter failing here. No Lean verification is claimed.

## Sources

- **Dorr 16 Oct** — Cian Dorr, construction of 16 October 2026, with Claude Opus 5.5 (Anthropic); verification in the write-up.
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §3 (symmetric ideally-full models), Definitions 15–18, p. 8, and Proposition 20.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-class-reflecting-surjections.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §3, Definitions 15–18, p. 8; Proposition 20. The framework of symmetric ideally-full models, which are models of C for every base.
