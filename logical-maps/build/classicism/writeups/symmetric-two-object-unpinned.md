# Symmetric ideally-full model: two objects, the second unpinned

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), prompted by Cian Dorr, 19 September 2026.</p>

## Package

- **Atoms are self-atoms.** At each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **Atoms are strong atoms.** At each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **Self-atoms are strong atoms.** At each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.
- **□Boolean Completeness.** Necessarily, every property of entities of a relational type has a greatest lower bound in that type.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Truth implies 5-necessity.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **¬ □Atoms are self-atoms (type t).** Necessarily, every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ □Atoms are strong atoms (type t).** Necessarily, every atom is a strong atom.
- **¬ □Self-atoms are strong atoms (type t).** Necessarily, every self-atom is a strong atom.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ □BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ ND.** Distinct things of any type are necessarily distinct.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ □Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **¬ BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ □Two-hat necessity implies ND-necessity.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over two objects, each a copy of the natural numbers. The arrows from the first object to itself are the permutations; the arrows from the first to the second and from the second to itself are all the functions; there are none back. Both symmetry groups are all the permutations. The first object carries the ideal of finite sets, the second the improper ideal, so at the second object every symmetric intension belongs to the domain. The evaluation point is the identity arrow on the first object.

Individuals, fixed for this record: the individuals at each object are the base the construction describes, and the arrows act on them as on the base.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Atoms are self-atoms, Atoms are strong atoms, □Self-atoms are atoms, Self-atoms are strong atoms. Fails □Atoms are self-atoms (type t), □Atoms are strong atoms (type t), □Self-atoms are strong atoms (type t), Self-Atomicity (type t).

At $W_0$ the orbit $G$ of the identity, all permutations, is pinned down by $\varnothing$ and is the only atom, the symmetric propositions over the arrows into $W_1$ refining by kernels; it is a self-atom and a strong atom, its transport along an arrow into $W_1$ being empty. So Atoms are self-atoms and Atoms are strong atoms hold at $W_0$, at every type, atoms of relational types sitting over $G$ as orbits of one pair. At $W_1$, where every symmetric intension is in the domain, the atoms are the orbits of single arrows, and the orbit of a non-injective or non-surjective $k$ is not a self-atom: some non-permutation $m$ has $m\circ k=k$ or $m\circ k$ in the orbit, as $m$ may act freely off the range of $k$. So the boxed forms of both fail at $W_0$. No self-atom at $W_0$ contains an arrow $f$ into $W_1$: the transport along $f$ would be the orbit of $1_{W_1}$, but a non-permutation fixing $f(N)$ pointwise, for $N$ pinning the self-atom, carries $f$ to an arrow agreeing with it on $N$. So the self-atoms at $W_0$ are $G$ and its relational counterparts, atoms and strong atoms; at $W_1$ the only self-atoms are the orbits of permutations, by the same reasoning, which are atoms; so Self-atoms are atoms holds at both objects. But the orbit of $1_{W_1}$ is not a strong atom there (the recorded failure of Strong Actuality at $W_1$), so Self-atoms are strong atoms (type t) fails at $W_1$ and its boxed form fails at $W_0$. Self-Atomicity (type t) fails at $W_0$: the proposition of the arrows into $W_1$ is pinned down by $\varnothing$, possible, and has no self-atom below it.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Actuality.

At both objects, and hence necessarily: at each, the orbit of the identity under the symmetry group is the smallest symmetric set of arrows containing it, and it is in the domain, at the first object because it is pinned down by the empty set and at the second because nothing is required there.

*By Cian Dorr, 2026-09-19.*

### Holds □Boolean Completeness.

At both, and hence necessarily: at the first by the draft's main theorem with the empty distinguished set, since an arrow to the first object is automatically a permutation and so separated, while for arrows to the second splicing is unconstrained; at the second trivially, since its domains are closed under arbitrary unions.

*By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Boolean Completeness at the first object is now the group argument boolean-completeness, by hull-conditions; this argument still gives its necessitation, through the second object.

### Fails Rigid Comprehension.

No rigid property of individuals is coextensive with the universal one. Weak persistence together with finite pinning forces any candidate to contain every pair whose arrow targets the second object, so its transport there is the top property. But the property of being in the range of one's arrow is symmetric and persistent, its extension at that world is everything, and the top property does not entail it, because the arrows out of the second object include non-surjections. So the rigidity criterion fails at that world.

*By Cian Dorr, 2026-09-19.*

### Fails □BF, No Pure Contingency.

The draft records that the type-e instance of BF is true at the base world and false at the second object, so BF is true while boxed BF is false; that is what the violation of boxed BF records, and it also refutes No Pure Contingency, since that instance is a closed pure sentence true at the base and false at an accessible world.

*By Cian Dorr, 2026-09-19.*

### Fails ND.

At type e because some arrow to the second object collapses two individuals.

*By Cian Dorr, 2026-09-19.*

### Fails Atomicity (type t).

The symmetry group of $W_0$ is an atom, but no atom lies inside the nonempty proposition of the arrows into $W_1$, which is pinned down by the empty set since targets are: a nonempty symmetric $p$ of such arrows pinned down by $N$ and containing $h$ contains every arrow into $W_1$ whose restriction to $N$ has the same fibres as $h$’s, the symmetry group of $W_1$ being all permutations, and those agreeing in that sense on $N\cup\{m\}$ form a smaller nonempty symmetric proposition.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

### Fails B for pure sentences.

The type-$e$ instance of BF is a closed pure sentence true at the base world and false at the second object, and no arrow leads back from the second object, so at that world the sentence is not even possible.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

### Fails □Strong Actuality.

Strong Actuality fails at the second object, which an arrow from the first reaches. There a true proposition contains the identity and, being symmetric, every permutation. Let $s$ be the successor map, an arrow from the second object to itself, and $k_0,k_1$ its retractions sending $n+1$ to $n$ and $0$ to $0$ and to $1$ respectively. Under $s$ the true proposition becomes one containing $k_0$ and $k_1$. The proposition that the arrow sends $0$ and $1$ to the same individual is closed under composition with permutations, so in the domain at the second object, where every symmetric intension is; it contains $k_0$ and not $k_1$. So no true proposition at the second object is a strong atom. (Strong Actuality holds at the first object, by Actuality and the Distinctness-preserving collapse.)

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Rigid Power.

Boxed Rigid Power, for either choice of individuals. At $W_1$ every symmetric intension is in the domain, so every $X_0(A)$ ($k\mapsto kA$) is, and a weakly rigid relation is $X_0$ of its extension; a rigid $X\le h\cdot F$ is $h\cdot X_0(A)$ for the inverse image $A$ of its extension, so Rigid Power holds there. At $W_0$ let $F$ be rigid, pinned down by a nonempty finite $S$, with extension $E_0$. For $h:W_0\to W_1$, $h\cdot F=X_0(F_h)$ is pinned down by $hS$; for an idempotent retraction $r$ onto $hS$, $F_h=F_{rh}=rF_h$, so $r$ fixes every tuple of $F_h$, and for $k,k^{\prime}$ agreeing on $hS$, $kz=krz=k^{\prime}rz=k^{\prime}z$. Through a bijection $W_0\to W_1$, every $h:W_0\to W_1$ acts on the tuples of $E_0$ through $h|_S$; with the invariance of $E_0$ under the permutations fixing $S$, $X_0(E_0)$ is in the domain, so $F=X_0(E_0)$. For a rigid $X\le h\cdot F$, $X=X_0(D)$ and $X=h\cdot X_0(A)$ with $A:=\{z\in E_0:hz\in D\}$, in the domain for the same reason; permutations are lifted by their inverses. So the power property is $X_0$ of its extension and rigid, at both objects.

*Address: `symmetric-two-object-unpinned#rigid-power`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Fails BF (type t).

At the base world. Every transport of a proposition $p$ of the first object along an arrow $h$ into the second is pinned down by $h(N)$, for $N$ a finite set pinning $p$ down, since $k\circ h$ and $k^{\prime}\circ h$ agree on $N$ when $k,k^{\prime}$ agree on $h(N)$. Let $X$ hold, at an arrow into the first object, of every proposition, and at an arrow into the second, of the finitely pinned ones; it depends only on the codomain, so is pinned down by $\emptyset$, and it is symmetric, a permutation carrying finitely pinned propositions to finitely pinned ones. Then $\forall p\, .\,\Box Xp$ holds at the base world. But the second object's domain is unrestricted and contains $q:=\{k:k\text{ injective}\}$, symmetric and pinned down by no finite set, so after any arrow into the second object $X$ fails of $q$ and $\Box\forall p\, .\,Xp$ fails. This does not involve the individuals.

*Address: `symmetric-two-object-unpinned#barcan-t`. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request to settle BF at the relational types, 2026-10-11.*

### Holds □Truth implies 5-necessity. Fails □Two-hat necessity implies ND-necessity.

At the second object the domains are the symmetric intensions, so a proposition is a set of functions determined by their kernels, and the least true proposition is the set $B$ of bijections. $\Diamond B$ is the set of injections (an injection is completed to a bijection by a further map), so $\Box_{\ne}p$ holds there iff $p$ contains every injection; but $\hat\Diamond B=B$, since $v\circ u$ bijective with $v$ injective forces $u$ to be bijective, so $\hat{\hat\Box}$ is the identity operator at the second object. Hence $B$ is two-hat necessary but not ND-necessary there, and the identity $\Box_{\ne}=\hat{\hat\Box}$ fails; while every truth at either object is 5-necessary: at the second because $\hat{\hat\Box}$ is the identity, at the first because every truth there is ND-necessary (recorded).

*Address: `symmetric-two-object-unpinned#collapse-split`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Relational Choice.

At the types $(e\to t)$ and $e$. Let $U:=\lambda Xy\, .\,Xy\lor\neg\exists z\, .\,Xz$, a closed term, hence in the domain, and serial. A functional subrelation $S$ of $U$ would lie in the domain at the evaluation object, so it is symmetric and pinned down by a finite set $N$. Two facts about such an $S$ (Dorr, draft, Lemma 19(iv)): every $g\in G$ fixing $N$ pointwise satisfies $g^{[\sigma]}S=S$, and symmetry gives $\langle gA,gy,g\rangle\in S$ whenever $\langle A,y,1\rangle\in S$; together, $\langle gA,gy,1\rangle\in S$. Now let $A$ be the property the condition gives for $N$. Its extension is nonempty, so $S$ relates $A$ at the identity to some $y$ in its extension. The condition gives a member $g$ of the symmetry group that fixes $N$ pointwise, fixes $A$ and moves $y$ to some $gy\ne y$, so $S$ relates $A$ to $gy$ as well, and $S$ is not functional at the identity arrow. The well-ordering of the individuals that Cian Dorr had in mind is refuted by the same two facts, but the direct route needs no derivation of a well-ordering from Relational Choice in C.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#relational-choice`. It requires that For each finite set $N$ of individuals at the evaluation object, some property $A$ in the domain has a nonempty extension there, and each individual $y$ in that extension is moved by a member of the symmetry group that fixes $N$ pointwise and fixes $A$. Here: $M=\emptyset$, and for $N$ the property of not belonging to $N$, at the first object, where the domain is symmetric and finitely pinned: the transposition of $y$ with another individual of the first object outside $N$ lies in its symmetry group. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, after Cian Dorr’s observation that a choice over the individuals cannot be finitely pinned down, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The members' seven copies, which differed in the property $A$ and the transposition, stated once; each member's $A$ and transposition moved to the condition transposable. The qualitative-contrast model's second argument (OpenAI Codex, 24 September) was dropped.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The condition transposable no longer mentions the finite set $M$ or the pinning of $A$ by $N\cup M$: the argument uses only that $g$ fixes $N$, the set pinning down $S$, and that $A$ is in the domain. So $g$ is now said to fix $N$ pointwise. Proved in Lean.

### Holds Axiom of Infinity (type e).

There are infinitely many individuals, and identity at the identity arrow is literal, so no numeral counts them. The set of numerals at type $e$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-e`. It requires that There are infinitely many individuals at the evaluation world. Here: The base is infinite. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$e$ half of the members' argument, stated once; "the individuals are the natural numbers" became "there are infinitely many individuals", which also covers the qualitative links model. The type-$t$ half is axiom-of-infinity-t.

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{n,m\}$ of individuals of the first object: a function into the second object that collapses $n$ with $m$ and nothing else is an arrow, all functions being arrows there. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0=\emptyset$ (the draft's argument for this model, Proposition 40): an arrow to the first object is a permutation and so separated by any set, while for arrows to the second, splicing is unconstrained, every function being an arrow; points are moved off a finite set by a permutation of the first object. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The first object, the evaluation point, carries the ideal of finite sets, so its domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition is the set of arrows from the first object to itself, all permutations, in the domain by the source argument for Actuality; no arrow from the second object returns to the first. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Intensional Choice.

At type $e$. Let $F$ and $a$ be as the condition gives them, and suppose $G\le F$ is necessarily uniquely instantiated. $G$ is in the domain, so it is symmetric and pinned down by a finite set, which we may take to contain $a$; call it $N$. Let $h$ be the arrow the condition gives for $N$. Then $G_h=\{y\}$ for some $y$ in $F_h$. If $\sigma$ in the symmetry group fixes $p$, then $\sigma\circ h$ agrees with $h$ on $N$, so $G_{\sigma\circ h}=G_h$ by pinning, while symmetry gives $G_{\sigma\circ h}=\{\sigma y\}$. So no symmetry fixing $p$ moves $y$, and by the condition $y=p$. Each model's witness takes $F$ with $p$ outside its extension at $h$, a contradiction. $\Box$Intensional Choice fails with it, by T.

*General argument `arguments/intensional-choice-collapse`. It requires that A group $G$ acts on the individuals at the evaluation object, and every element of a relational domain there is symmetric, meaning that $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ whenever $g\in G$ and $g\circ h$ is an arrow, and is pinned down by a finite set of individuals, its extension at an arrow depending only on the arrow's values there. Here: The relational domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18). It requires that The individuals at the evaluation object are those the construction acts on, and the arrows act on them as the construction says. Here: The individuals are the base, acted on as the construction says. It requires that There are an individual $a$ and a necessarily instantiated property $F$ in the domain such that, for every finite set $N$ of individuals at the evaluation object, some arrow $h$ sends $N\cup\{a\}$ to a single individual $p$, and every individual $y\ne p$ in $F$'s extension at $h$ is moved by a member $\sigma$ of the symmetry group that fixes $p$, with $\sigma\circ h$ again an arrow. Here: Take $F:=\lambda x\, .\,x\ne a$, so $p\notin F_h$. $h$ is a function from the first object to the second that is constant on $N\cup\{a\}$; the symmetry group of the second object is all permutations. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-03.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Recorded from the collapse lemma deferred in extraction.md on 3 October until the model records' new format landed (not yet checked by a human). It needs the individuals the construction gives. Not covered: the qualitative-links model, whose arrows preserve a ternary relation and so cannot send everything to one point, and the qualitative-contrast model, whose arrows are bijections and where Intensional Choice holds.

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* Moved from the group symmetric-ideally-full to the topic, so that the symmetry-constrained full models use it too: in those models every intension is pinned down by the finite set of all individuals, and the collapses are the constant maps. The group's `when: individuals: base` is now the condition construction-individuals, met by that parameter value.

### Holds Necessity of Second-Order Analysis.

Let $v$ be reachable from the evaluation point. If every type is finite at $v$ there is no real number structure there, an ordered field having the infinitely many distinct elements $0$, $1$, $1+1$, and so on. Otherwise let $D$ be as in the condition. Carry the real numbers onto $D$ by a bijection: the carrier, order, sum, product, $0$, $1$ and natural numbers are sets of tuples from $D$, so extensions at $v$ of entities there, which form a real number structure $\mathfrak R^*$ at $v$, its completeness and the leastness of its natural numbers being tested against subproperties whose extensions are all the subsets of $D$. Its second-order quantifiers, applied to tuples from $D$, range over all relations on $D$, so for each second-order analytical sentence $A$, $A(\mathfrak R^*)$ holds at $v$ iff $A$ is true of the real numbers under full second-order semantics. Any real number structure $\mathfrak R$ at $v$, of any type, is isomorphic to $\mathfrak R^*$ by a relation in the domain there (Huntington's theorem, a theorem of C: Background, Analysis), and $A(\mathfrak R)\leftrightarrow A(\mathfrak R^*)$ is a theorem of C given such an isomorphism, relations on one carrier being carried to the other by comprehension. So at every reachable object every real number structure satisfies exactly the second-order analytical sentences true of the reals, and each instance $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R) \to A(\mathfrak R)$ or $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ of the Necessity of Second-Order Analysis holds, with the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis. The choice of the bijection with the reals needs no choice principle, $D$ having the cardinality of the continuum.

*General argument `arguments/second-order-analysis-full-continuum`. It requires that At every object $v$ reachable from the evaluation point, either every type has finitely many entities at $v$, or there is a set $D$ of continuum many entities of one type at $v$ such that, for each $k\ge1$, every set of $k$-tuples from $D$ is the extension at $v$ of an entity in the domain there. Here: At a reachable object $v$, let $\tau$ be a type with infinitely many orbits there, and for a set $A$ of them let $Y_A$ be the intension of type $\tau t$ whose value at an arrow into $v$ is the union of the orbits in $A$ and at other arrows is empty: symmetric, the values being invariant, and pinned down by $\emptyset$, so in the domain; its transport along any arrow depends only on the arrow's codomain. The $Y_A$ are continuum many and pairwise distinct at $v$. For a set $T$ of $k$-tuples of them, the intension whose value at an arrow $h$ is the set of transports along $h$ of the tuples in $T$ depends only on $h$'s codomain, is symmetric, each such transport being fixed by the target's symmetries, and is pinned down by $\emptyset$; its extension at $v$ is $T$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

The point of the model is that boxed Boolean Completeness and boxed Actuality, and so Weak Rigid Comprehension, do not yield Rigid Comprehension. The gap is exactly the leading box of the inextensibility conjunct. The status of the unboxed BF schema at the base world is left unknown here: the draft's working comments report that higher-type instances fail there, which would make the schema fail, but its text does not. The source is a work in progress. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added the failure of B for pure sentences; see the notes. Now violates: B for pure sentences.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the Distinctness-preserving collapse; see the notes. Now satisfies: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Relational Choice, at types (e→t) and e: a functional subrelation of the serial relation pairing each property with its members would be symmetric and finitely pinned, and a symmetry fixing its pinning set would carry its choice for the property of lying outside that set to a second choice. Cian Dorr’s observation that a choice cannot be finitely pinned; argument in the notes. Now violates: Relational Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Atomicity (type t), and with it of Strong Atomicity; see the notes. Now violates: Atomicity (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definition 39, p. 19; Proposition 40 and Proposition 41, p. 20; Remark 42, p. 21.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-two-object-unpinned.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definition 39, p. 19; Proposition 40 and Proposition 41, p. 20; Remark 42, p. 21
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, pp. 73–79. The per-object ideals that this construction uses, and the two-object models built on them.
