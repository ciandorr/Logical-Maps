# Symmetric ideally-full model: permutations and collapsers of a fixed pair (Base 2) [one individual; Σ true atom]

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), prompted by Cian Dorr, 19 September 2026.</p>

## Package

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Self-Atomicity (type t).** Necessarily, every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **¬ Rigid Rigidity.** Being rigid is a rigid property of relations, including propositions.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over one object, the set of natural numbers. Its symmetry group is the permutations that preserve a fixed pair of individuals setwise, and its arrows are those permutations together with all the surjections that collapse the two members of that pair. Every arrow is therefore invertible or a collapser, and which it is can be read off from its behaviour on that pair. The evaluation point is the identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition, the symmetry group; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Self-Atomicity.

Self-Atomicity at every relational type, necessarily, there being one object. Let $I\ne\bot$ be an entity of type $\bar\sigma t$, pinned down by $N$, and take a pair $\langle k,\bar x\rangle$ in it, $k$ an arrow and $\bar x$ a tuple of individuals and of symmetric entities at $k$’s world. A symmetry $g$ acts on such a pair by relabelling, fixing every symmetric entity and permuting the individuals. Choose a finite $N^{\prime}\supseteq N$ with $k(N^{\prime})$ containing the collapsed pair and every individual in $\bar x$, which surjectivity allows (if $k$ is a symmetry, $N^{\prime}\supseteq k^{-1}$ of those individuals suffices), and let $J$ be the set of pairs $\langle g\circ k_1,g\cdot\bar x\rangle$ with $g$ a symmetry and $k_1$ agreeing with $k$ on $N^{\prime}$. $J$ lies below $I$, since $I$ is pinned down by $N$ and symmetric; it is symmetric and pinned down by $N^{\prime}$. Its transport along a member $\langle g\circ k_1,g\cdot\bar x\rangle$ consists of the pairs $\langle m,\bar y\rangle$ with $m\circ g\circ k_1=g^{\prime}\circ k_2$ and $\bar y=g^{\prime}\cdot\bar x$; then $h:=g^{\prime-1}\circ m\circ g$ fixes $k(N^{\prime})$ pointwise, so is a symmetry fixing the individuals of $\bar x$, and $\bar y=m\cdot g\cdot\bar x$. So the transport is the orbit of the single pair $\langle1,g\cdot\bar x\rangle$, an atom, and $J$ is a self-atom below $I$.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Self-Atomicity (type t). Fails Self-atoms are atoms (type t), Self-atoms are strong atoms (type t).

Write $\{a,b\}$ for the collapsed pair and $G$ for the symmetry group, the orbit of the identity and the only atom containing it, pinned down by the pair. Let $k$ be a collapser and $N$ a finite set such that $k(N)\supseteq\{a,b\}$; one exists for any collapser, every arrow being surjective. Let $q$ be the set of arrows agreeing on $N$, up to symmetry, with $k$: it is symmetric and pinned down by $N$. For $k^{\prime}\in q$, an arrow $m$ has $m\circ k^{\prime}\in q$ only if some $g\circ m$ fixes $k^{\prime}(N)\supseteq\{a,b\}$ pointwise, which no collapser does; so $m\in G$, and conversely $G\circ k^{\prime}\subseteq q$. So the transport of $q$ along each of its members is $G$, and $q$ is a self-atom. It is not an atom: the arrows agreeing with $k$ on a larger finite set, up to symmetry, form a proper nonempty symmetric pinned part. So Self-atoms are atoms (type t) fails, and with it Self-atoms are strong atoms (type t). Self-Atomicity (type t) holds, and necessarily, there being one object: a possible proposition $p$, pinned down by $N$, contains some arrow; if a permutation, $p\supseteq G$, a self-atom; if a collapser $k$, $p$ contains the self-atom built from $k$ and a finite $N^{\prime}\supseteq N$ with $k(N^{\prime})\supseteq\{a,b\}$. The relational form is the argument that follows.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Rigid Comprehension.

At every relational type. Given a relation with extension S pinned down by a finite set, take the least upper bound of the union of the haecceities of the members of S, computed with the fixed pair adjoined to the pinning set. Persistence is immediate, and the extension is exactly S because an arrow agreeing with the identity on a set containing the fixed pair is invertible. The rigidity criterion is then checked separately at invertible worlds, where leastness delivers it, and at collapsing worlds, where surjectivity supplies the preimages that persistence demands.

*By Cian Dorr, 2026-09-19.*

### Fails Atomicity (type t).

With the proposition that the two members of the fixed pair are identical as a nonzero proposition having no atom below it.

*By Cian Dorr, 2026-09-19.*

### Fails Rigid Power.

The type $(t\to t)\to t$ argument of finite-support-pair-injections-or-collapses (for its variant with one individual), with $\{a,b\}$ for $\{0,1\}$ and the collapses kept surjective: $F:=\top$ of type $t\to t$, rigid since BF and $\Box$BF hold at type $t$; $p_n:=\{g:gn\in\{ga, gb\}\}$, which is symmetric, with $m\cdot p_n=p_{mn}$ for the permutations $m$ preserving $\{a,b\}$; $Y$ built from $E:=\{p_n:n\notin\{a,b,2\}\}$ with $S:=\{a,b,2\}$, symmetric since the symmetry group consists of arrows; in step (2), $\tau$ sends $x$ to $2$, some fresh $y$ to $x$, and fixes every other number, so that $\tau g$ is still a surjection; and $\mathbf X$, pinned down by $\{a,b\}$, is symmetric because $g^{-1}k^{\prime}$ agrees with $k$ on $\{a,b\}$ when $k^{\prime}$ agrees with $gk$ there.

*By Claude Opus 5.5 (Anthropic), on Cian Dorr's request to settle Rigid Power where it was open, 2026-10-09.*

### Fails Rigid Rigidity.

Both arguments for the failure of Rigid Power (at type $e\to t$ when the individuals are the natural numbers, at type $(t\to t)\to t$ when there is one individual) take $F:=\top$. Their power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le\top$ is $\lambda X\, .\,\operatorname{Rigid}(X)$, since $X\le\top$ is a theorem of C, and they show that it is not weakly inextensible. So Rigid Rigidity fails at the same type.

*Address: `symmetric-collapse-pair-individuals-singleton-sigma-true-atom#rigid-rigidity`. By Claude Opus 5.5 (Anthropic), on Cian Dorr's request to settle Rigid Rigidity where it was open, 2026-10-10.*

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{n,m\}$ with $n,m\ge2$: a surjection that collapses $0$ with $1$ and $n$ with $m$, and nothing else, is an arrow. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: The arrows are permutations and surjections. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: Every object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Holds Actuality.

The symmetry group is the smallest symmetric set of arrows containing the identity, and by the condition it is pinned down by a finite set, so it is a proposition in the domain, and an atom entailing every truth.

*Source: Boolean Completeness does not imply Rigid Comprehension, Proposition 24, p. 13; §7.1, p. 21; §8, pp. 23–26. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#actuality`. It requires that The symmetry group, the smallest symmetric set of arrows containing the identity, is pinned down by a finite set. Here: Membership in the symmetry group is detected by the fixed pair: an arrow is in it iff it does not collapse the pair. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once; what pins the group down is each member's reason for meeting symmetry-group-pinned.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0$ the fixed pair (the draft's argument for this model): splicing fails at that pair, but the pair is exactly what certifies invertibility, and the separated arrows are handled by symmetry instead; a symmetry may move points freely outside the pair. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Fails Analytic Necessitism.

Write $G$ for the symmetry group, which acts on the propositions by transport, $g\cdot p=\{j:j\circ g\in p\}$. For a finite set $N$ of points let $E_N$ be the set of arrows constant on $N$: a proposition in the domain, symmetric and pinned down by $N$, with $g\cdot E_N=E_{g(N)}$. Take for each $n\ge2$ a set $N_n$ of $n$ points and an arrow $j_n$ constant on $N_n$, injective off $N_n$ and taking other values there (the condition), so that the fibres of $j_n$ are $N_n$ and singletons. The orbits $O_n$ of the $E_{N_n}$ under $G$ are pairwise distinct: $E_{N_n}=E_N$ with $N=g(N_m)$ puts $j_n$ in $E_N$, so $N\subseteq N_n$, and puts $j_m\circ g^{-1}$, an arrow whose fibres are $N$ and singletons, in $E_{N_n}$, so $N_n\subseteq N$. For $A\subseteq\mathbb N$ the union $S_A$ of the $O_n$ with $n\in A$ is a $G$-invariant set of propositions, and $A\mapsto S_A$ is injective: there are continuum many $G$-invariant sets of propositions, in explicit bijection with the reals. Each $S_A$ is the value of a constant intension $Y_A$ of type $tt$, symmetric because $S_A$ is $G$-invariant, pinned down by the empty set, so in the domain, and fixed by transport along every arrow. The constant intensions whose values are the set of the $Y_A$, the order, sum and product of the reals carried over to it, and its natural numbers, with the $Y_A$ standing for $0$ and $1$, are symmetric, their values being made of fixed entities, and in the domain; they form a real number structure of type $tt$ at the evaluation point, complete since every bounded set of its elements has a least upper bound among them. So the antecedent of Analytic Necessitism holds at type $tt$. Its consequent fails there. Let $k$ be an arrow with $ka=kb$ for distinct points $a$ and $b$ (the condition at $n=2$) and $q$ the set of arrows $j$ with $ja\ne jb$: symmetric, pinned down by $\{a,b\}$, containing the identity and no arrow $j\circ k$. For $x$ of type $tt$ in the domain let $y$ agree with $x$ except at the arrows in $q$, where the top proposition is added to its value or removed from it: $y$ is symmetric and pinned down by a finite set, so in the domain, differs from $x$, and has $k\cdot y=k\cdot x$. If $\mathfrak R$ were a rigid real number structure of type $tt$, necessarily a real number structure, with carrier $X$ (Background, Analysis), an instance $x$ and this $y$ would give $k\cdot y=k\cdot x\in X_k$ by persistence, $Xy$ by inextensibility and $k\cdot y\ne k\cdot x$ by necessary distinctness: $X$ has no instance. So Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-exact-collapses-symmetric`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object (Dorr, draft, §3.1: closed pure terms denote entities fixed by every arrow). It requires that A group $G$ acts on the individuals at the evaluation object, and every element of a relational domain there is symmetric, meaning that $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ whenever $g\in G$ and $g\circ h$ is an arrow, and is pinned down by a finite set of individuals, its extension at an arrow depending only on the arrow's values there. Here: The relational domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18). It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set (finite-pinning), and every entity in them is one. It requires that For every $n\ge2$ there are a set $N$ of $n$ points of the set the arrows act on and an arrow out of the evaluation object that is constant on $N$ and injective off $N$, with its values off $N$ different from its value on $N$. Here: Take the fixed pair and $n-2$ further points: the surjection sending them all to one point and the remaining points bijectively onto the others collapses the pair. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set (finite-pinning), and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition is the symmetry group, the set of arrows that are permutations, pinned down by the fixed pair; no composite with a non-bijective arrow is a permutation. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object (Dorr, draft, §3.1: closed pure terms denote entities fixed by every arrow). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails B for sentences of Σ.

B for sentences of Σ fails: the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, which is true, and under an arrow from which no world in $a$ is accessible $\Diamond a$ is false, so $\Box\Diamond a$ fails.

*General argument `arguments/sigma-true-atom-b`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The actual-world proposition, the symmetry group, is in the domain; at every world a collapsing arrow leads outside it, and a collapsing arrow carries it to the empty set. It requires that Some world sees no world at which the actual-world proposition is true. Here: A collapsing arrow: no composite with it is a permutation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The B clause of the records' Σ-as-true-atom argument, stated once for the topic.

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The actual-world proposition, the symmetry group, is in the domain; at every world a collapsing arrow leads outside it, and a collapsing arrow carries it to the empty set. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.


## Notes

This model is not a second witness to the draft's main result but a counterweight to it. Rigid Comprehension holds, so the failure of Actuality in the all-surjections model is no accident. Because Atomicity fails here, the model settles a question left open in Classicism: Rigid Comprehension does not imply Atomicity. The boxed forms of Actuality and Rigid Comprehension use the draft's one-object observation, which it states for Boolean Completeness and applies in the same way in its final section. The source is a work in progress. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the Distinctness-preserving collapse; see the notes. Now satisfies: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now violates: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Corrected the reason given for the failures of Independence (signature Σ) and Distinctness (signature Σ): the true atom is denoted by no closed pure term, since such terms denote entities fixed by every arrow; the failures come from the other relational constants, which denote top. No verdict changes.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Relational Choice, at types (e→t) and e: a functional subrelation of the serial relation pairing each property with its members would be symmetric and finitely pinned, and a symmetry fixing its pinning set would carry its choice for the property of lying outside that set to a second choice. Cian Dorr’s observation that a choice cannot be finitely pinned; argument in the notes. Now violates: Relational Choice.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §3.1, p. 9 (base); Lemma 21, p. 10; Proposition 22, p. 11; Proposition 24, p. 13; Corollary 37 and Remark 38, p. 19.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-collapse-pair.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §3.1, p. 9; Lemma 21, p. 10; Proposition 22, p. 11; Proposition 24, p. 13; Corollary 37 and Remark 38, p. 19
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–26; Appendix D, pp. 73–79. The open question whether Rigid Comprehension implies Atomicity, and the ideally-full models of which this is the symmetric variant.
