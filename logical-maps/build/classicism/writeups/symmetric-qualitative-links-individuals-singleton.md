# Symmetric ideally-full model: qualitative link structure (Base 3) [one individual]

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), prompted by Cian Dorr, 19 September 2026.</p>

## Package

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.
- **□Self-Atomicity (type t).** Necessarily, every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **¬ Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over one object whose individuals carry qualitative structure. The domain is the disjoint union of points, of two companions for each point, and of infinitely many links for each ordered pair of distinct points. A ternary relation holds of two points and a third individual when that individual is a link over the two if they differ, and a companion of them if they coincide, so the relation's fibres are infinite over distinct points and of size two over a repeated point. The arrows are required to preserve that relation. The symmetry group is the relation-preserving permutations that fix a distinguished pair of points setwise, and the remaining arrows are the surjective relation-preserving maps that collapse that pair. The evaluation point is the identity arrow.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

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

### Fails Atomicity (type t).

Confirming the draft's unwritten claim, by the splitting argument it indicates. The proposition $C:=\{h : h0=h1\}$ of the collapsing arrows is nonzero, symmetric and pinned down by $\{0,1\}$. Suppose $q\le C$ is nonzero and pinned down by a finite $N$, and take $h\in q$. Enlarge $N$ to its closure in the draft's sense, which includes $0$ and $1$, and choose a point $m$ outside it. The draft's extension step (proof of its Proposition 50) extends any $R$-coherent prescription on a closed finite set that merges $0$ with $1$ to a collapsing arrow. So there are arrows $k_1,k_2$ agreeing with $h$ on $N$ with $k_1m=k_1 0$ and $k_2m\ne k_2 0$: prescribe $h$ on the closure of $N$, send $m$ to $h0$ or to a fresh point, and send its companions to companions of its image. Both lie in $q$. The proposition $\{k : km=k0\}$ is symmetric and pinned down by $\{0,m\}$, and it contains $k_1$ but not $k_2$, so $q$ is not an atom. So nothing below $C$ is an atom. With No Pure Contingency, □Atomicity fails too, as the recorded implication from □Atomicity, Boolean Completeness and BF to Rigid Comprehension requires, BF being now established.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

### Fails Rigid Power.

At type $t\to t$, with propositions as arguments, so for either choice of individuals; the argument for symmetric-range-gap with the link structure. Let $L$ be the points, $a,b$ the distinguished pair, $c\in L\setminus\{a,b\}$, and $q_{uv}:=\{h:hu=hv\}$, $Q(A):=\{q_{uv}:u,v\in A\}$. Every arrow fixes $\{a,b\}$ setwise or collapses it, so $q_{ax}=q_{bx}$; codes of pairs of points outside $\{a,b\}$ determine their pairs, by the draft's extension step (proof of its Proposition 50), which extends an $R$-coherent prescription on a closed finite set to a collapsing arrow.
Let $F_k:=Q(L)$ at every arrow: every arrow is surjective on points, so $F=X_0(Q(L))$, which is rigid. Let $Y_k:=Q(L\setminus\{kc\})$ at a symmetry $k$ and $Q(L)$ at a collapse. It is symmetric, pinned down by $\{a,b,c\}$, and equal to its $B_N$ for every finite $N$ (at a collapse, two point coordinates outside the closure of $N$ under point coordinates and companions can be sent to any two points, by the extension step), so weakly rigid. It is rigid without appeal to Tame Rigidity (which fails here): its transport along a symmetry has the same form, and along a collapse it is $F$, every later composite being a collapse.
No rigid $Z\le F$ has $Z_h=Y_1$ at a collapse $h$. Close a finite pinning set $T$ of $Z$ under point coordinates and companions, with $a,b,c\in T$, and take distinct points $x,y$ outside $hT\cup\{a,b,c\}$. Part (1) of tame-rigidity-factorizable gives $q_{uv}\in Z_1$ and a collapse $g$ agreeing with $h$ on $T$ with $g\cdot q_{uv}=q_{xy}$; so $\{gu,gv\}=\{x,y\}$ and $u,v\notin T$. No member of $T$ is a link at $u$ or $v$, $T$ being closed, so the prescription agreeing with $h$ on $T$ and sending $u$ to $c$ and $v$ to $y$, with their companions, extends to a collapse $g^{\prime}$; then $q_{cy}=g^{\prime}\cdot q_{uv}\in Z_{g^{\prime}}=Z_h$, which is not in $Q(L\setminus\{c\})$.
So the test $B_{\{a,b\}}$ of the extension of $F$'s power property (constant, since $h\cdot F=F$) necessarily holds of its instances but omits $Y$ at a collapse, every arrow agreeing with a collapse on $\{a,b\}$ being one. The power property is not weakly inextensible: Rigid Power fails.

*Address: `symmetric-qualitative-links-individuals-singleton#rigid-power`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Fails Tame Rigidity.

At type $(t\to t)\to t$, with propositions indexed by nonpoints, so with one individual. Let $V$ be the companions and links, which every arrow maps onto $V$, and $q_{uv}:=\{h:hu=hv\}$. Codes of distinct unordered pairs of nonpoints differ: by the draft's extension step (proof of its Proposition 50), any binary assignment on finitely many nonpoints is realized by a collapse sending them to the two companions of one point. Let $C_z:=T(\{q_{zw}:w\in V\})$; it is symmetric, pinned down by $\{z\}$, rigid, and $h\cdot C_z=C_{hz}$, and $z\mapsto C_z$ is injective. Let $U_h:=\{C_z:z\in R(ha,hb)\}$, where $a,b$ is the distinguished pair and $R(p,q)$ is the link fibre over $p\ne q$ or the two companions of $p=q$. $U$ is symmetric, pinned down by $\{a,b\}$, and weakly rigid by part (1) of tame-rigidity-factorizable: at a symmetry each $B_N$ is $U_h$, and at a collapse a fresh link can be sent to either companion. At a collapse $h$ with $p:=ha=hb$, $U_h=\{C_{d_0},C_{d_1}\}$ for $p$'s companions; the rigid $T(\{C_{d_0},C_{d_1}\})$ necessarily holds of both, but after a collapse $k$ merging $d_0$ and $d_1$ it holds of $C_{kd_0}$ alone, while $U_{kh}$ has both companions' codes. So $h\cdot U$ is not weakly inextensible: $U$ is weakly rigid and not rigid.

*Address: `symmetric-qualitative-links-individuals-singleton#tame-rigidity`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

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
