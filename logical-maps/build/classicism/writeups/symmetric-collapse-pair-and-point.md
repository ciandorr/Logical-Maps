# Symmetric ideally-full model: collapsers of a fixed pair, and a point

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr (the construction), 29 October 2026; Claude Opus 5.5 (Anthropic), prompted by Cian Dorr (the verification); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **□Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ □BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ □Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ □Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model on two objects. $W_0$ has base $\mathbb N$ with a fixed pair $\{0,1\}$, and $W_1$ has base $\{0\}$. The arrows $W_0\to W_0$ are the permutations preserving $\{0,1\}$ setwise, the surjections $h$ with $h0=h1$ (the collapsers), and the constant maps $k_n$; there is one arrow $!:W_0\to W_1$, an arrow $c_n:W_1\to W_0$ with value $n$ for each $n$, and the identity of $W_1$. These are closed under composition: $c_n\circ!=k_n$, $!\circ c_n=1_{W_1}$, $h\circ c_n=c_{hn}$, and a composite with a collapser or a constant collapses $\{0,1\}$ and is a surjection or a constant. The symmetry group is the permutations preserving $\{0,1\}$ at $W_0$ and trivial at $W_1$. Both objects carry the ideal of finite sets. Evaluation point: $1_{W_0}$.

Individuals, fixed for this record: the individuals at each object are the base the construction describes, and the arrows act on them as on the base.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds BF.

At every type, at $W_0$. Every arrow out of $W_0$ agrees on any finite set $S$ with a surjective arrow: a symmetry, a collapser and $!$ are surjective, and $k_n$ agrees on $S$ with the collapser sending $S\cup\{0,1\}$ to $n$ and the remaining points onto $\mathbb N$. So the argument of symmetric-two-object-all-maps applies: if $\forall x\,\Box Fx$ with $F$ pinned down by $S$, and $y$ is an entity at the target of an arrow $h$, take a surjective $h^{\prime}$ agreeing with $h$ on $S$; by the section construction of the group's argument barcan-surjective, $y=h^{\prime}\cdot x$ for an entity $x$ at $W_0$, so $y$ is in $F_{h^{\prime}}$, which is $F_h$.

*Address: `symmetric-collapse-pair-and-point#barcan-at-root`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails □BF (type t).

At $W_1$ a proposition is a set $A$ of points closed under the symmetries of $W_0$ (a union of the orbits $\{0,1\}$ and $\mathbb N\setminus\{0,1\}$), given as the $c_n$ with $n\in A$, together with a bit for $1_{W_1}$: eight propositions $q$. Their transports along $c_n$ are $c_n\cdot q=\{h:W_0\to W_0 : hn\in A\}$, with $!$ added if the bit is set. The intension $F$ of type $t\to t$ with all eight at $1_{W_1}$ and the eight $c_n\cdot q$ at each $c_n$ is pinned down by $\{0\}$ and symmetric, since $g\cdot(c_n\cdot q)=c_{gn}\cdot q$; so every proposition at $W_1$ necessarily has it. But at $c_2$ the proposition $\{h:h2=h3\}$, symmetric and pinned down by $\{2,3\}$, does not: it contains every constant map, so it could only be a $c_2\cdot q$ with $A=\mathbb N$, which contains the identity. So BF at type $t$ fails at $W_1$, which $!$ reaches.

*Address: `symmetric-collapse-pair-and-point#barcan-fails-at-point`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Strong Actuality, □Boolean Completeness (type t).

At $W_0$ the symmetry group is a true strong atom: its transport along a symmetry is itself, an atom, and along a collapser, a constant or $!$ it is empty. At $W_1$, which has eight propositions, Boolean Completeness holds at type $t$, and $\{1_{W_1}\}$ is a true strong atom: its transport along $c_n$ is $\{!\}$, an atom at $W_0$. Every world is an arrow into $W_0$ or $W_1$, so Strong Actuality and, with the group's argument boolean-completeness at $W_0$, Boolean Completeness at type $t$ are necessary.

*Address: `symmetric-collapse-pair-and-point#point-actuality`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Atomicity (type t).

As in symmetric-collapse-pair: the proposition $\{h:W_0\to W_0 : h0=h1\}$ has no atom below it. A proposition $q$ below it containing $h$ and pinned down by $S\supseteq\{0,1\}$ contains every arrow agreeing with $h$ on $S$; for $x\notin S$ two collapsers agreeing with $h$ on $S$ send $x$ to $h0$ and outside $h[S]$ respectively, and they are separated by $\{h\in q : hx=h0\}$, symmetric and pinned down by $S\cup\{x\}$.

*Address: `symmetric-collapse-pair-and-point#atomicity`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Relational Choice.

At the types $(e\to t)$ and $e$. Let $U:=\lambda Xy\, .\,Xy\lor\neg\exists z\, .\,Xz$, a closed term, hence in the domain, and serial. A functional subrelation $S$ of $U$ would lie in the domain at the evaluation object, so it is symmetric and pinned down by a finite set $N$. Two facts about such an $S$ (Dorr, draft, Lemma 19(iv)): every $g\in G$ fixing $N$ pointwise satisfies $g^{[\sigma]}S=S$, and symmetry gives $\langle gA,gy,g\rangle\in S$ whenever $\langle A,y,1\rangle\in S$; together, $\langle gA,gy,1\rangle\in S$. Now let $A$ be the property the condition gives for $N$. Its extension is nonempty, so $S$ relates $A$ at the identity to some $y$ in its extension. The condition gives a member $g$ of the symmetry group that fixes $N$ pointwise, fixes $A$ and moves $y$ to some $gy\ne y$, so $S$ relates $A$ to $gy$ as well, and $S$ is not functional at the identity arrow. The well-ordering of the individuals that Cian Dorr had in mind is refuted by the same two facts, but the direct route needs no derivation of a well-ordering from Relational Choice in C.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#relational-choice`. It requires that For each finite set $N$ of individuals at the evaluation object, some property $A$ in the domain has a nonempty extension there, and each individual $y$ in that extension is moved by a member of the symmetry group that fixes $N$ pointwise and fixes $A$. Here: For finite $N$, the property of not belonging to $N\cup\{0,1\}$ (at an arrow $h$, the points outside $h[N\cup\{0,1\}]$; empty at arrows into $W_1$) is symmetric and pinned down by $N\cup\{0,1\}$; the transposition of a member $y$ with another point outside $N\cup\{0,1\}$ fixes $N\cup\{0,1\}$ pointwise, so is in the symmetry group and fixes the property. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, after Cian Dorr’s observation that a choice over the individuals cannot be finitely pinned down, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The members' seven copies, which differed in the property $A$ and the transposition, stated once; each member's $A$ and transposition moved to the condition transposable. The qualitative-contrast model's second argument (OpenAI Codex, 24 September) was dropped.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The condition transposable no longer mentions the finite set $M$ or the pinning of $A$ by $N\cup M$: the argument uses only that $g$ fixes $N$, the set pinning down $S$, and that $A$ is in the domain. So $g$ is now said to fix $N$ pointwise. Proved in Lean.

### Holds Axiom of Infinity (type e).

There are infinitely many individuals, and identity at the identity arrow is literal, so no numeral counts them. The set of numerals at type $e$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-e`. It requires that There are infinitely many individuals at the evaluation world. Here: The base is infinite. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$e$ half of the members' argument, stated once; "the individuals are the natural numbers" became "there are infinitely many individuals", which also covers the qualitative links model. The type-$t$ half is axiom-of-infinity-t.

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{n,m\}$ with $n,m\ge2$: a surjection that collapses $0$ with $1$ and $n$ with $m$, and nothing else, is an arrow. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds Actuality.

The symmetry group is the smallest symmetric set of arrows containing the identity, and by the condition it is pinned down by a finite set, so it is a proposition in the domain, and an atom entailing every truth.

*Source: Boolean Completeness does not imply Rigid Comprehension, Proposition 24, p. 13; §7.1, p. 21; §8, pp. 23–26. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#actuality`. It requires that The symmetry group, the smallest symmetric set of arrows containing the identity, is pinned down by a finite set. Here: Pinned down by $\{0,1\}$: an arrow into $W_0$ that does not collapse $0$ and $1$ is in the symmetry group, and every composite with an arrow that does collapses them; there is one arrow into $W_1$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once; what pins the group down is each member's reason for meeting symmetry-group-pinned.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0=\{0,1\}$. (B1) For $M\supseteq\{0,1\}$, an arrow into $W_0$ agreeing with a symmetry on $M$ does not collapse the pair, so is a symmetry: the symmetries are separated, and an arrow $h$ that is not collapses the pair, as does any $h^{\prime}$ agreeing with it on $M$. For $P\cap Q\subseteq M$, prescribe $h^{\prime}$ on $P$, $h$ on $Q$ and $h0=h1$ on the pair (consistent, the pair lying in $M$), and extend to a surjection: it is a collapser. There is one arrow into $W_1$. (B2) As for symmetric-collapse-pair: a permutation fixing $N\supseteq\{0,1\}$ pointwise preserves the pair and moves the finitely many points of $P\setminus N$ off $Q$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails □Axiom of Infinity (type e).

At the identity arrow of a reachable object $v$ with $n$ individuals there are not $n+1$ individuals any two of which are distinct, distinctness implying literal distinctness, identity being reflexive. So the Infinity schema at type $e$ fails there, and with it the Axiom of Infinity at type $e$, which implies it in C (axiom-of-infinity-e-implies-infinity-e). A closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target (at the world seen, in a Kripke-style model), so the arrow into $v$ is a world at which the Axiom fails, and its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-individuals-somewhere`. It requires that Some object reachable from the evaluation point has finitely many individuals. Here: The object $W_1$, reached by $!$, has the single individual $0$ (with either choice of individuals). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails □Axiom of Infinity (type t).

As for individuals (finitely-many-individuals-somewhere), at type $t$: at the identity arrow of a reachable object with $n$ propositions the Infinity schema at type $t$ fails, and so does the Axiom of Infinity at type $t$, which implies it in C (axiom-of-infinity-t-implies-infinity-t); so its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-propositions-somewhere`. It requires that Some object reachable from the evaluation point has finitely many propositions. Here: At $W_1$, reached by $!$, every set of arrows is pinned down by the base $\{0\}$, and a symmetric one is a union of the orbits $\{1_{W_1}\}$, $\{c_0,c_1\}$ and $\{c_n:n\ge2\}$ under post-composition with the permutations preserving $\{0,1\}$: there are eight propositions. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Intensional Choice.

At type $e$. Let $F$ and $a$ be as the condition gives them, and suppose $G\le F$ is necessarily uniquely instantiated. $G$ is in the domain, so it is symmetric and pinned down by a finite set, which we may take to contain $a$; call it $N$. Let $h$ be the arrow the condition gives for $N$. Then $G_h=\{y\}$ for some $y$ in $F_h$. If $\sigma$ in the symmetry group fixes $p$, then $\sigma\circ h$ agrees with $h$ on $N$, so $G_{\sigma\circ h}=G_h$ by pinning, while symmetry gives $G_{\sigma\circ h}=\{\sigma y\}$. So no symmetry fixing $p$ moves $y$, and by the condition $y=p$. Each model's witness takes $F$ with $p$ outside its extension at $h$, a contradiction. $\Box$Intensional Choice fails with it, by T.

*General argument `arguments/intensional-choice-collapse`. It requires that A group $G$ acts on the individuals at the evaluation object, and every element of a relational domain there is symmetric, meaning that $\langle\bar x,h\rangle\in D$ implies $\langle g\cdot\bar x,g\circ h\rangle\in D$ whenever $g\in G$ and $g\circ h$ is an arrow, and is pinned down by a finite set of individuals, its extension at an arrow depending only on the arrow's values there. Here: The relational domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18). It requires that The individuals at the evaluation object are those the construction acts on, and the arrows act on them as the construction says. Here: The individuals are the base, acted on as the construction says. It requires that There are an individual $a$ and a necessarily instantiated property $F$ in the domain such that, for every finite set $N$ of individuals at the evaluation object, some arrow $h$ sends $N\cup\{a\}$ to a single individual $p$, and every individual $y\ne p$ in $F$'s extension at $h$ is moved by a member $\sigma$ of the symmetry group that fixes $p$, with $\sigma\circ h$ again an arrow. Here: As in symmetric-collapse-pair: $a:=0$ and $F:=\lambda x\, .\,x\ne 0$; for finite $N$, $h$ a surjection sending $N\cup\{0,1\}$ to one point $p\ge2$ and injective elsewhere. A member $y\ne p$ of $F_h=\mathbb N\setminus\{p\}$ is moved, fixing $p$, by swapping $0$ and $1$ (if $y\in\{0,1\}$) or by transposing $y$ with another point outside $\{0,1,p\}$; composites of $h$ with symmetries are collapsers. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-03.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Recorded from the collapse lemma deferred in extraction.md on 3 October until the model records' new format landed (not yet checked by a human). It needs the individuals the construction gives. Not covered: the qualitative-links model, whose arrows preserve a ternary relation and so cannot send everything to one point, and the qualitative-contrast model, whose arrows are bijections and where Intensional Choice holds.

*Revised 2026-10-04 by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction:* Moved from the group symmetric-ideally-full to the topic, so that the symmetry-constrained full models use it too: in those models every intension is pinned down by the finite set of all individuals, and the collapses are the constant maps. The group's `when: individuals: base` is now the condition construction-individuals, met by that parameter value.

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition is the symmetry group, pinned down by $\{0,1\}$; every world outside it is a collapser, a constant or $!$, and every composite with one of these collapses $\{0,1\}$ or lands in $W_1$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Cian Dorr's suggestion of 29 October 2026: the one-object model symmetric-collapse-pair as $W_0$, with a point $W_1$ added as in symmetric-two-object-all-maps. The constant maps forced by composition do not spoil BF at $W_0$, since each agrees on any finite set with a surjective collapser. BF, Boolean Completeness, and necessarily Strong Actuality and Boolean Completeness at type $t$, hold at $W_0$; BF at type $t$ fails at $W_1$.

## Sources

- **Dorr 29 Oct** — Cian Dorr, construction of 29 October 2026, in conversation with Claude Opus 5.5 (Anthropic).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §3.1, p. 9 (Base 2); Definitions 15–18, p. 8; Theorem 36, p. 18.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-collapse-pair-and-point.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §3.1, p. 9; Definitions 15–18, p. 8; Theorem 36, p. 18. Base 2, which is the object $W_0$ here, and the hull theorem.
