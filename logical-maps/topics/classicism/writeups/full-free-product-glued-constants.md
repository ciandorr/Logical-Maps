# Full action model: free product of a free monoid with an idempotent, the bicyclic monoid and an involution, glued constants

This write-up builds a model of C in which Bacon's Logical Necessity schema holds while BF fails, ND-necessity differs from two-hat necessity, and some truth is not 5-necessary. It follows the gluing construction of Bacon's *Logical Combinatorialism* (Appendix A.3; book, Definition 18.15), which the map's glued free-monoid records carry out over the free monoid; here the free monoid is replaced by a free product in which each extra factor has one job. The point of the design is that the failures can be disaggregated later by dropping factors (§4).

Throughout, $\Sigma$ is the map's fixed countable signature of relational nonlogical constants, and the model is a full one-object action model (Classicism, §3.5): the arrows are the elements of a monoid $M$, composition is multiplication, $u\circ h=uh$, the propositions are all subsets of $M$, and every intension of every relational type is present. Write $\mathrm{fix}$-free notation: $\{1\}$ is the actual-world proposition. Pure sentences have the same truth value at every arrow (Classicism, §3.5, p. 59): one-object models satisfy No Pure Contingency.

## 1. The monoid

Let $M:=F_\infty * E * B * \mathbb Z_2$, the free product of monoids, with

- $F_\infty$ the free monoid on the generators $f_1,f_2,\ldots$;
- $E=\{1,e\}$, $e^2=e$;
- $B=\langle b,c\mid cb=1\rangle$ the bicyclic monoid, whose elements are the words $b^ic^j$ ($i,j\ge0$), with $b^ic^j\cdot b^kc^l=b^{i+k-j}c^l$ if $j\le k$ and $b^ic^{j-k+l}$ otherwise;
- $\mathbb Z_2=\{1,s\}$, $s^2=1$.

Every element of $M$ has a unique reduced word: a finite sequence of non-identity elements of the factors (*syllables*) in which adjacent syllables lie in different factors. The product of two reduced words is computed by concatenating and, while the junction consists of two syllables from the same factor, multiplying them and deleting the result if it is $1$.

**Lemma 1 (right cancellation).** If a syllable $x$ of a factor $A$ is right-cancellable in $A$, then it is right-cancellable in $M$: $ux=vx$ implies $u=v$. Hence every product of such syllables is right-cancellable, in particular every element of $F_\infty$ and $s$.

*Proof.* Let $ux=vx$. If neither $u$ nor $v$ ends in an $A$-syllable, both products are the reduced words $u,x$ and $v,x$, so $u=v$. If $u=u'y$ with $y\in A$ and $v$ does not end in an $A$-syllable, then $ux$ is $u'$ followed by $yx$ (or $u'$ itself if $yx=1$), while $vx$ ends in the syllable $x$ preceded by a syllable outside $A$ or by nothing; equality of reduced words forces $u'=v$ and $yx=x$, so $y=1$ by cancellation in $A$, a contradiction, or $yx=1$ and $v,x$ equal to $u'$, impossible since $u'$ does not end in $A$. If both end in $A$-syllables $y,y'$, equality gives $u'=v'$ and $yx=y'x$, so $y=y'$. $\square$

**Lemma 2 (two non-epic arrows).** $e$ and $b$ are not right-cancellable: $1\cdot e=e\cdot e$ and $1\cdot b=(bc)\cdot b$, with $e\ne1$ and $bc\ne1$.

**Lemma 3 (units and split monomorphisms).** If $uv=1$ in $M$ with reduced words $u=x_1\cdots x_n$ and $v=y_1\cdots y_m$, then $n=m$ and $x_{n+1-i}y_i=1$ in a common factor for each $i$. Hence $u$ has a right inverse iff each of its syllables has one in its factor, a left inverse iff each syllable has one, and $u$ is a unit iff each syllable is a unit of its factor. The units of $M$ are therefore $1$ and $s$. The elements with a left inverse (the split monomorphisms, the arrows with a retraction) are the reduced words all of whose syllables are powers $b^i$ or $s$; in particular $b$, with retraction $c$, has a left inverse and is not a unit. Left inverses are unique: $xu=1$ determines the syllables of $x$ one by one as the left inverses, in their own factors, of the syllables of $u$ in reverse order, and in each factor a left inverse is unique ($c^k$ for $b^k$, $s$ for $s$).

*Proof.* In a reduction of the concatenation $x_1\cdots x_ny_1\cdots y_m$ to the empty word, syllables can only disappear at the junction, two at a time, so $x_ny_1=1$, then $x_{n-1}y_2=1$, and so on. In the factors: $F_\infty$ has no non-identity element with a one-sided inverse; $e$ has none; in $B$, $b^ic^j$ has a left inverse iff $j=0$ (then $c^ib^i=1$) and a right inverse iff $i=0$, and no non-identity element has both; $s$ is its own inverse. $\square$

**Lemma 4 (free sites).** For each $k$, the map $u\mapsto uf_k$ is injective (Lemma 1), and the sets $Mf_k$ are pairwise disjoint: the reduced word of $uf_k$ ends in an $F_\infty$-syllable whose last letter is $f_k$.

## 2. The glued constants and Logical Necessity

Take the full one-object action model over $M$ with a single individual. Enumerate as $P_1,P_2,\ldots$ the pure formulas $P(\bar x)$ whose free variables match (in number and type) a tuple $\bar c$ of distinct constants of $\Sigma$, and such that $\exists\bar x\,P$ is true at the identity; this is a countable list, and the truth of $\exists\bar x\,P$ does not depend on the interpretation of $\Sigma$. For each $k$ choose a witness tuple $\bar a_k$ of elements of the root domains with $P_k[\bar a_k]$ true at the identity. For a constant $c$ of type $\bar\sigma t$, let its intension $I_c$ assign to the arrow $uf_k$ the extension $I_{a}(u)$, where $a$ is the component of $\bar a_k$ matching $c$ (or the empty extension if $c$ is not among the constants matched by $P_k$), and to every arrow not of the form $uf_k$ the empty extension. By Lemma 4 this is well defined; the model being full, it is in the domain. Its transport along $f_k$ is $u\mapsto I_c(uf_k)=I_a(u)$, i.e. $f_k\cdot c=a$: at the world $f_k$ the constants matched by $P_k$ denote the witnesses $\bar a_k$.

**Theorem.** Logical Necessity, $\Box P[\bar c/\bar x]\leftrightarrow\forall\bar x\,P$ for pure $P$ and distinct matching constants $\bar c$, holds at the identity.

*Proof.* Right to left: if $\forall\bar x\,P$ is true at the identity, it is true at every arrow (No Pure Contingency), and at every arrow the constants denote some tuple, so $P[\bar c]$ holds there: $\Box P[\bar c]$. Left to right: if $\forall\bar x\,P$ fails, $\exists\bar x\,\neg P$ is true, so $\neg P$ is some $P_k$ of the enumeration, and at the arrow $f_k$ the constants denote a witness tuple for it: $\neg P[\bar c]$ holds at $f_k$, so $\Box P[\bar c]$ fails. $\square$

The same enumeration gives Witnessed Possibility and Modal Freedom (a conjunction $P\wedge Q$ in disjoint variables is itself enumerated), and Independence and Separated Structure follow by necessity of identity, as in the glued free-monoid write-up; the map derives these from Logical Necessity where results record the implications.

## 3. Verdicts

- **Full-model package.** Being full, the model satisfies Rigid Comprehension, Actuality, Atomicity, Boolean Completeness, Relational Choice and their necessitations (Classicism, p. 61, and the topic's general arguments for full models). With necessary Actuality, $\Box_5=\hat{\hat\Box}$, the box over the invertible arrows (The Bounds of Possibility, Proposition D21), and $\Box_{\ne}=\hat\Box$ is the box over the arrows with a retraction.
- **BF fails** at type $t$: by Lemma 2, $e^t$ is not surjective ($\{1\}$ is not $\{x : xe\in p\}$ for any $p$, since $xe\ne1$), so Classicism, Proposition 3.24(iii), applies. ND fails too, as in every non-group monoid model here ($e^t$ is not injective).
- **Two-hat necessities are ND-necessary fails**: $b$ has a retraction and is not invertible (Lemma 3), so the true proposition $\{1\}\cup\{s\}$ is two-hat necessary and not ND-necessity; in the map this is the general argument from a retracted non-invertible arrow in a full model.
- **Truths are 5-necessary fails**: $s$ is a non-identity unit, so $\{1\}$ is true but not $\Box_5$-necessary; general argument from a non-identity isomorphism in a full model.
- **5-necessities are two-hat necessary holds**, boxed, as in every full model.
- **Strong Actuality holds**, boxed: the true proposition $\{1\}$ becomes, under an arrow $u$, the set of left inverses of $u$, which has at most one member (Lemma 3), so it is an atom or empty at every world; in the map this is the general argument from unique retractions in a model with the identity singletons.
- **Rigid Power holds**, boxed: the model is full, so a relation is weakly inextensible at a world iff it lies below $k\mapsto k\cdot E$ over its extension $E$ there, and the rigid relations are exactly the intensions $k\mapsto k\cdot E$; the power property of such a relation is then $k\mapsto k\cdot E'$ for its own extension $E'$, hence rigid (the topic's general argument for full models). Tame Rigidity holds boxed in every full model, so **Weakly Rigid Power holds**, boxed, by the recorded results $\Box\mathrm{TR}+\mathrm{RP}\Rightarrow\mathrm{WRP}$ and $\Box\mathrm{WRP}\Leftrightarrow\Box\mathrm{TR}\wedge\Box\mathrm{RP}$.
- **Infinity**: with one individual the type-$e$ Axiom of Infinity fails; with infinitely many propositions the type-$t$ one holds.

## 4. The job of each factor, and how to disaggregate

| factor | arrow | job |
|---|---|---|
| $F_\infty$ | the generators $f_k$ | free gluing sites (Lemma 4): Logical Necessity |
| $E$ | the idempotent $e$ | a non-epic arrow with no retraction: BF fails; also the irreversible arrow and Strong Atomicity failure of Classicism's two-arrow idempotent model |
| $B$ | $b$, retracted by $c$ | a split monomorphism that is not a unit: $\Box_{\ne}\ne\hat{\hat\Box}$, collapse at the second hat |
| $\mathbb Z_2$ | the involution $s$ | a non-identity unit: a truth that is not 5-necessary |

The gluing uses only Lemma 4, so any free product $F_\infty * N$ supports it. Dropping factors separates the failures: over $F_\infty * E$ the collapse principles all hold and BF fails; over $F_\infty * B$ BF fails and only the first collapse fails ($b$ is also non-epic, so $E$ is not needed for BF); over $F_\infty * \mathbb Z_2$, a cancellative monoid, BF holds and only Truths are 5-necessary fails. None of these can separate Logical Necessity from the full-model package of §3; that would need a non-full construction closed under gluing, for which symmetry-constrained full domains over a tree-like monoid are the natural candidate, since post-composition by a symmetry keeps an arrow in its site.
