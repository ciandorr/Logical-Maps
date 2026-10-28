# Symmetric ideally-full model: qualitative link structure (Base 3) [Σ true atom]

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), prompted by Cian Dorr, 19 September 2026.</p>

## Package

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Self-Atomicity (type t).** Necessarily, every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over one object whose individuals carry qualitative structure. The domain is the disjoint union of points, of two companions for each point, and of infinitely many links for each ordered pair of distinct points. A ternary relation holds of two points and a third individual when that individual is a link over the two if they differ, and a companion of them if they coincide, so the relation's fibres are infinite over distinct points and of size two over a repeated point. The arrows are required to preserve that relation. The symmetry group is the relation-preserving permutations that fix a distinguished pair of points setwise, and the remaining arrows are the surjective relation-preserving maps that collapse that pair. The evaluation point is the identity arrow.

Individuals, fixed for this record: the individuals at each object are the base the construction describes, and the arrows act on them as on the base.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition, the symmetry group; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Self-Atomicity.

Self-Atomicity at every relational type, necessarily, there being one object. Let $I\ne\bot$ be an entity of type $\bar\sigma t$, pinned down by $N$, and take a pair $\langle k,\bar x\rangle$ in it, $k$ an arrow and $\bar x$ a tuple of individuals and of symmetric entities at $k$’s world. A symmetry $g$ acts on such a pair by relabelling, fixing every symmetric entity and permuting the individuals. Choose a finite $N^{\prime}\supseteq N$ with $k(N^{\prime})$ containing the collapsed pair and every individual in $\bar x$, which surjectivity allows (if $k$ is a symmetry, $N^{\prime}\supseteq k^{-1}$ of those individuals suffices), and let $J$ be the set of pairs $\langle g\circ k_1,g\cdot\bar x\rangle$ with $g$ a symmetry and $k_1$ agreeing with $k$ on $N^{\prime}$. $J$ lies below $I$, since $I$ is pinned down by $N$ and symmetric; it is symmetric and pinned down by $N^{\prime}$. Its transport along a member $\langle g\circ k_1,g\cdot\bar x\rangle$ consists of the pairs $\langle m,\bar y\rangle$ with $m\circ g\circ k_1=g^{\prime}\circ k_2$ and $\bar y=g^{\prime}\cdot\bar x$; then $h:=g^{\prime-1}\circ m\circ g$ fixes $k(N^{\prime})$ pointwise, so is a symmetry fixing the individuals of $\bar x$, and $\bar y=m\cdot g\cdot\bar x$. So the transport is the orbit of the single pair $\langle1,g\cdot\bar x\rangle$, an atom, and $J$ is a self-atom below $I$.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Self-Atomicity (type t). Fails Self-atoms are atoms (type t), Self-atoms are strong atoms (type t).

The symmetry group $G$ is the atom containing the identity, pinned down by the distinguished pair $0,1$. Let $k$ be a collapsing arrow and $N$ a finite set with $k(N)\supseteq\{0,1\}$, which exists since $k$ is surjective, and let $q$ be the set of arrows agreeing with $k$ on $N$ up to symmetry: symmetric, pinned down by $N$, and below the proposition $C$ of the collapsing arrows. For $h\in q$, an arrow $m$ has $m\circ h\in q$ only if some $g\circ m$ fixes $h(N)\supseteq\{0,1\}$ pointwise, which no collapsing arrow does, so $g\circ m$ and $m$ are symmetries; conversely $G\circ h\subseteq q$. So the transport of $q$ along each of its members is $G$, and $q$ is a self-atom. By the recorded argument that Atomicity (type t) fails, every nonzero pinned part of $C$ splits, so $q$ is not an atom: Self-atoms are atoms (type t) fails, and with it Self-atoms are strong atoms (type t). Self-Atomicity (type t) holds, and necessarily, there being one object: a possible proposition pinned down by $N$ contains a symmetry, and then $G$, or a collapsing arrow $k$, and then the self-atom built from $k$ and a finite $N^{\prime}\supseteq N$ with $k(N^{\prime})\supseteq\{0,1\}$. The relational form is the argument that follows.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Boolean Completeness.

By the draft's main theorem in its closure-operation form: the constant closure operations do not work here, and the operation used instead adds to a finite set the point coordinates of its members and then both companions of each of its points.

*By Cian Dorr, 2026-09-19.*

### Fails Rigid Comprehension.

At type e. The property of being related to the distinguished pair is persistent and finitely pinned, and it is shown to be the only candidate coextensive with itself. But at a world collapsing the pair, its extension shrinks to a two-element fibre, and the union of the two haecceities of that fibre is persistent with the same extension there while being strictly stronger, because some arrow merges the two companions. So the rigidity criterion fails at that world.

*By Cian Dorr, 2026-09-19.*

### Fails Atomicity (type t).

Confirming the draft's unwritten claim, by the splitting argument it indicates. The proposition $C:=\{h : h0=h1\}$ of the collapsing arrows is nonzero, symmetric and pinned down by $\{0,1\}$. Suppose $q\le C$ is nonzero and pinned down by a finite $N$, and take $h\in q$. Enlarge $N$ to its closure in the draft's sense, which includes $0$ and $1$, and choose a point $m$ outside it. The draft's extension step (proof of its Proposition 50) extends any $R$-coherent prescription on a closed finite set that merges $0$ with $1$ to a collapsing arrow. So there are arrows $k_1,k_2$ agreeing with $h$ on $N$ with $k_1m=k_1 0$ and $k_2m\ne k_2 0$: prescribe $h$ on the closure of $N$, send $m$ to $h0$ or to a fresh point, and send its companions to companions of its image. Both lie in $q$. The proposition $\{k : km=k0\}$ is symmetric and pinned down by $\{0,m\}$, and it contains $k_1$ but not $k_2$, so $q$ is not an atom. So nothing below $C$ is an atom. With No Pure Contingency, □Atomicity fails too, as the recorded implication from □Atomicity, Boolean Completeness and BF to Rigid Comprehension requires, BF being now established.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

### Fails Intensional Choice.

At type $e$. Let $F$ be the constant property whose extension at every world is the distinguished pair $\{0,1\}$: symmetric, since the symmetry group preserves the pair setwise, pinned down by $\varnothing$, and necessarily instantiated. Suppose $G\le F$ is pinned down by a finite $N$ with every extension a singleton, so $G(h)\in\{\{0\},\{1\}\}$. Choose a surjective relation-preserving arrow $h$ that sends $0$ and $1$ to a point $p\notin\{0,1\}$ and whose preimages of $0$, $1$, their companions and the links at $0$ or $1$ avoid $N$ (take as preimages of $0$ and $1$ two points outside $N$ that are endpoints of no link in $N$; the pair's links go to companions of $p$, and surjectivity is arranged on the infinite fibres). Let $\sigma$ be the relation automorphism swapping $0$ and $1$ with their companions and links and fixing every other point. It is in the symmetry group, fixes $h(N)$ pointwise, and $\sigma\circ h$ is again an arrow. Pinning gives $G(\sigma\circ h)=G(h)$, while symmetry gives $G(\sigma\circ h)=\sigma(G(h))\ne G(h)$. The collapse argument of the group cannot reach this model, its arrows preserving sorts; the pair property sidesteps that.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Fails Rigid Power.

At type $t\to t$, with propositions as arguments, so for either choice of individuals; the argument for symmetric-range-gap with the link structure. Let $L$ be the points, $a,b$ the distinguished pair, $c\in L\setminus\{a,b\}$, and $q_{uv}:=\{h:hu=hv\}$, $Q(A):=\{q_{uv}:u,v\in A\}$. Every arrow fixes $\{a,b\}$ setwise or collapses it, so $q_{ax}=q_{bx}$; codes of pairs of points outside $\{a,b\}$ determine their pairs, by the draft's extension step (proof of its Proposition 50), which extends an $R$-coherent prescription on a closed finite set to a collapsing arrow.
Let $F_k:=Q(L)$ at every arrow: every arrow is surjective on points, so $F=X_0(Q(L))$, which is rigid. Let $Y_k:=Q(L\setminus\{kc\})$ at a symmetry $k$ and $Q(L)$ at a collapse. It is symmetric, pinned down by $\{a,b,c\}$, and equal to its $B_N$ for every finite $N$ (at a collapse, two point coordinates outside the closure of $N$ under point coordinates and companions can be sent to any two points, by the extension step), so weakly rigid. It is rigid without appeal to Tame Rigidity (which fails here): its transport along a symmetry has the same form, and along a collapse it is $F$, every later composite being a collapse.
No rigid $Z\le F$ has $Z_h=Y_1$ at a collapse $h$. Close a finite pinning set $T$ of $Z$ under point coordinates and companions, with $a,b,c\in T$, and take distinct points $x,y$ outside $hT\cup\{a,b,c\}$. Part (1) of tame-rigidity-factorizable gives $q_{uv}\in Z_1$ and a collapse $g$ agreeing with $h$ on $T$ with $g\cdot q_{uv}=q_{xy}$; so $\{gu,gv\}=\{x,y\}$ and $u,v\notin T$. No member of $T$ is a link at $u$ or $v$, $T$ being closed, so the prescription agreeing with $h$ on $T$ and sending $u$ to $c$ and $v$ to $y$, with their companions, extends to a collapse $g^{\prime}$; then $q_{cy}=g^{\prime}\cdot q_{uv}\in Z_{g^{\prime}}=Z_h$, which is not in $Q(L\setminus\{c\})$.
So the test $B_{\{a,b\}}$ of the extension of $F$'s power property (constant, since $h\cdot F=F$) necessarily holds of its instances but omits $Y$ at a collapse, every arrow agreeing with a collapse on $\{a,b\}$ being one. The power property is not weakly inextensible: Rigid Power fails.

*Address: `symmetric-qualitative-links-sigma-true-atom#rigid-power`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Fails Relational Choice.

At the types $(e\to t)$ and $e$. Let $U:=\lambda Xy\, .\,Xy\lor\neg\exists z\, .\,Xz$, a closed term, hence in the domain, and serial. A functional subrelation $S$ of $U$ would lie in the domain at the evaluation object, so it is symmetric and pinned down by a finite set $N$. Two facts about such an $S$ (Dorr, draft, Lemma 19(iv)): every $g\in G$ fixing $N$ pointwise satisfies $g^{[\sigma]}S=S$, and symmetry gives $\langle gA,gy,g\rangle\in S$ whenever $\langle A,y,1\rangle\in S$; together, $\langle gA,gy,1\rangle\in S$. Now let $A$ be the property the condition gives for $N$. Its extension is nonempty, so $S$ relates $A$ at the identity to some $y$ in its extension. The condition gives a member $g$ of the symmetry group that fixes $N$ pointwise, fixes $A$ and moves $y$ to some $gy\ne y$, so $S$ relates $A$ to $gy$ as well, and $S$ is not functional at the identity arrow. The well-ordering of the individuals that Cian Dorr had in mind is refuted by the same two facts, but the direct route needs no derivation of a well-ordering from Relational Choice in C.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#relational-choice`. It requires that For each finite set $N$ of individuals at the evaluation object, some property $A$ in the domain has a nonempty extension there, and each individual $y$ in that extension is moved by a member of the symmetry group that fixes $N$ pointwise and fixes $A$. Here: $M=\emptyset$, and for $N$ the property of being a link not in $N$ (links are carried to links by every member of the symmetry group, whose inverse is again $R$-preserving): a chosen $y$ is a link $\langle m,n,k\rangle$, and its transposition with a link $\langle m,n,k'\rangle\notin N$, which exists since the fibre is infinite, preserves $R$ and fixes every point, so lies in the symmetry group. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, after Cian Dorr’s observation that a choice over the individuals cannot be finitely pinned down, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The members' seven copies, which differed in the property $A$ and the transposition, stated once; each member's $A$ and transposition moved to the condition transposable. The qualitative-contrast model's second argument (OpenAI Codex, 24 September) was dropped.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The condition transposable no longer mentions the finite set $M$ or the pinning of $A$ by $N\cup M$: the argument uses only that $g$ fixes $N$, the set pinning down $S$, and that $A$ is in the domain. So $g$ is now said to fix $N$ pointwise. Proved in Lean.

### Holds Axiom of Infinity (type e).

There are infinitely many individuals, and identity at the identity arrow is literal, so no numeral counts them. The set of numerals at type $e$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-e`. It requires that There are infinitely many individuals at the evaluation world. Here: The base is infinite. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$e$ half of the members' argument, stated once; "the individuals are the natural numbers" became "there are infinitely many individuals", which also covers the qualitative links model. The type-$t$ half is axiom-of-infinity-t.

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{0,m\}$ for points $m$ other than the distinguished pair $0,1$: by the draft's extension step (proof of its Proposition 50), an $R$-coherent prescription on a closed finite set containing $0$, $1$, $m$ and $m'$ that merges $0$, $1$ and $m$ but not $m'$ extends to a collapsing arrow, as in the record's argument for the failure of Atomicity (type t). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: The arrows are relation-preserving permutations and surjective relation-preserving maps. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: Every object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Holds Actuality.

The symmetry group is the smallest symmetric set of arrows containing the identity, and by the condition it is pinned down by a finite set, so it is a proposition in the domain, and an atom entailing every truth.

*Source: Boolean Completeness does not imply Rigid Comprehension, Proposition 24, p. 13; §7.1, p. 21; §8, pp. 23–26. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#actuality`. It requires that The symmetry group, the smallest symmetric set of arrows containing the identity, is pinned down by a finite set. Here: Membership in the symmetry group is the condition that the distinguished pair is not collapsed, so the group is pinned down by that pair. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once; what pins the group down is each member's reason for meeting symmetry-group-pinned.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set (finite-pinning), and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition is the symmetry group, pinned down by the distinguished pair; under a collapsing arrow $i$, a composite $k\circ i$ would have to be a permutation, and no composite with a map that collapses the distinguished pair is injective. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: It has one object (Dorr, draft, §3.1: closed pure terms denote entities fixed by every arrow). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Holds Necessity of Second-Order Analysis.

Let $v$ be reachable from the evaluation point. If every type is finite at $v$ there is no real number structure there, an ordered field having the infinitely many distinct elements $0$, $1$, $1+1$, and so on. Otherwise let $D$ be as in the condition. Carry the real numbers onto $D$ by a bijection: the carrier, order, sum, product, $0$, $1$ and natural numbers are sets of tuples from $D$, so extensions at $v$ of entities there, which form a real number structure $\mathfrak R^*$ at $v$, its completeness and the leastness of its natural numbers being tested against subproperties whose extensions are all the subsets of $D$. Its second-order quantifiers, applied to tuples from $D$, range over all relations on $D$, so for each second-order analytical sentence $A$, $A(\mathfrak R^*)$ holds at $v$ iff $A$ is true of the real numbers under full second-order semantics. Any real number structure $\mathfrak R$ at $v$, of any type, is isomorphic to $\mathfrak R^*$ by a relation in the domain there (Huntington's theorem, a theorem of C: Background, Analysis), and $A(\mathfrak R)\leftrightarrow A(\mathfrak R^*)$ is a theorem of C given such an isomorphism, relations on one carrier being carried to the other by comprehension. So at every reachable object every real number structure satisfies exactly the second-order analytical sentences true of the reals, and each instance $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R) \to A(\mathfrak R)$ or $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ of the Necessity of Second-Order Analysis holds, with the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis. The choice of the bijection with the reals needs no choice principle, $D$ having the cardinality of the continuum.

*General argument `arguments/second-order-analysis-full-continuum`. It requires that At every object $v$ reachable from the evaluation point, either every type has finitely many entities at $v$, or there is a set $D$ of continuum many entities of one type at $v$ such that, for each $k\ge1$, every set of $k$-tuples from $D$ is the extension at $v$ of an entity in the domain there. Here: At a reachable object $v$, let $\tau$ be a type with infinitely many orbits there, and for a set $A$ of them let $Y_A$ be the intension of type $\tau t$ whose value at an arrow into $v$ is the union of the orbits in $A$ and at other arrows is empty: symmetric, the values being invariant, and pinned down by $\emptyset$, so in the domain; its transport along any arrow depends only on the arrow's codomain. The $Y_A$ are continuum many and pairwise distinct at $v$. For a set $T$ of $k$-tuples of them, the intension whose value at an arrow $h$ is the set of transports along $h$ of the tuples in $T$ depends only on $h$'s codomain, is symmetric, each such transport being fixed by the target's symmetries, and is pinned down by $\emptyset$; its extension at $v$ is $T$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails B for sentences of Σ.

B for sentences of Σ fails: the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, which is true, and under an arrow from which no world in $a$ is accessible $\Diamond a$ is false, so $\Box\Diamond a$ fails.

*General argument `arguments/sigma-true-atom-b`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The actual-world proposition, the symmetry group, is in the domain; at every world a collapsing arrow leads outside it, and a collapsing arrow carries it to the empty set. It requires that Some world sees no world at which the actual-world proposition is true. Here: A collapsing arrow: no composite with it is injective. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The B clause of the records' Σ-as-true-atom argument, stated once for the topic.

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The actual-world proposition, the symmetry group, is in the domain; at every world a collapsing arrow leads outside it, and a collapsing arrow carries it to the empty set. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.


## Notes

This is the draft's answer to the question its two-object model leaves open. Boxed Boolean Completeness, boxed Actuality and the boxed type-e instance of BF all hold, and Rigid Comprehension still fails, so the obstruction need not live at a world where BF fails; it can live inside a qualitative fibre that BF at type e cannot see.
The type-e instance of BF holds, and necessarily, since every arrow is surjective, so a property necessarily had by everything is the top property.
With these verdicts the model is the map's witness that Boolean Completeness, □BF and □Actuality, together with Weak Rigid Comprehension, do not imply Rigid Comprehension. That was the draft's aim for this section.
The source is a work in progress, and its own status note describes this section as exploratory though complete for the claims recorded here. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-27** (Claude Opus 5.5 (Anthropic), at Cian Dorr's request) — Recorded BF at every type, by pulling any finitely pinned symmetric entity back along a surjective arrow, and the failure of Atomicity at type t, by splitting any finitely pinned proposition below the collapsers on whether a fresh point is merged with 0. Replaces the note that left both unknown. Now satisfies: BF. Now violates: Atomicity (type t).
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the Distinctness-preserving collapse by the argument used for the other symmetric models. Let $a$ be the symmetry group, the model’s Actuality witness, so $a\le p$ for every true $p$. Take $q:=a$: under an arrow $i$ in the group, $p$ holds since $i\in a\subseteq p$; under a collapsing arrow $i$, $\Diamond a$ would need $k\circ i$ to be a permutation, and no composite with a map that collapses the distinguished pair is injective. So every truth is $\Box_{\ne}$-necessary. Now satisfies: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now violates: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Corrected the reason given for the failures of Independence (signature Σ) and Distinctness (signature Σ): the true atom is denoted by no closed pure term, since such terms denote entities fixed by every arrow; the failures come from the other relational constants, which denote top. No verdict changes.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Relational Choice, at types (e→t) and e: a functional subrelation of the serial relation pairing each property with its members would be symmetric and finitely pinned, and a symmetry fixing its pinning set would carry its choice for the property of lying outside that set to a second choice. Cian Dorr’s observation that a choice cannot be finitely pinned; argument in the notes. Now violates: Relational Choice.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §8, pp. 23–26; Definition 47 and Lemma 48, p. 24; Proposition 49, p. 25; Proposition 50, p. 26.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-qualitative-links.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §8, pp. 23–26; Definition 47 and Lemma 48, p. 24; Proposition 49, p. 25; Proposition 50, p. 26
