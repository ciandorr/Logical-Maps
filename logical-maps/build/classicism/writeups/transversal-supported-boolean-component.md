# Transversal in the supported model over the ultrafilters of a complete homogeneous algebra

The model $K$ is supported-boolean-complete-component, the component of
[the supported Boolean-complete model](supported-boolean-complete-predecessor.md)
without its root. Transversal holds in $K$ at every type and at every world,
with a single witness $\Phi$ invariant under every automorphism. So
□Transversal holds too.

The argument is due to Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, on
29 October 2026. Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, checked it
and adapted this text on 30 October 2026. No independent checker or Lean
verification is recorded.

In $K$, Intensional Choice holds by compactness and Relational Choice fails.
So Transversal Choice, which is Transversal together with Relational Choice,
fails here although Transversal holds. The model does not separate Intensional
Choice from Transversal; the last section says why.

Throughout, the cells of a finite subalgebra $A$ are its atoms, and $H_A$ is
the group of automorphisms of $B$ fixing $A$ pointwise. Lemmas 1 and 2 are
those of the model's write-up: the elements fixed by $H_P$ are the joins of
cells, and joins of $H_P$-invariant families are finitely attained.

## Setting, and coextension as sharing a germ

$B=\mathrm{RO}(2^\omega)$: complete, atomless, homogeneous (every $[0,b]$, $b\neq0$, is isomorphic to $B$). $G=\operatorname{Aut}(B)$. For a finite subalgebra $A$ (I always pass from a finite set $P$ to the subalgebra $\langle P\rangle$ it generates, since $H_P=H_{\langle P\rangle}$), $H_A$ is the pointwise stabiliser; if $A$ has cells (atoms) $c_1,\dots,c_m$ then $H_A=\prod_i\operatorname{Aut}([0,c_i])$, and each $\operatorname{Aut}([0,c_i])$ is transitive on the proper elements $0<a<c_i$ (homogeneity: $[0,a]\cong[0,c_i-a]\cong B$).

Worlds: ultrafilters $U$ of $B$; all are nonprincipal since $B$ is atomless, so every $b\in U$ has some $b'\in U$ with $b'<b$. The component is S5 with one individual, so an entity of type $\sigma t$ is a function $x:D_\sigma\to B$ (its fibre map: $Xz$ is true at $U$ iff $x(z)\in U$), where $D_\sigma$ is the domain of type $\sigma$, a $G$-set. $G$ acts by $(g\cdot x)(z)=g\,x(g^{-1}z)$. Admissible: $x$ is $H_A$-equivariant for some finite $A$ ("$A$-supported"), i.e. $x(gz)=g\,x(z)$ for $g\in H_A$. Fibres are automatically in $B$ in this presentation. I write $x\wedge b$ for the function $z\mapsto x(z)\wedge b$ (the *restriction of $x$ to $b$*); note $g\cdot(x\wedge b)=(g\cdot x)\wedge gb$, and $x\wedge b$ is $\langle A,b\rangle$-supported when $x$ is $A$-supported.

**Lemma 0 (coextension = germ equality).** Let $X,Y$ be of type $\sigma t$ with fibre maps $x,y$. Then $X\equiv Y$ (i.e. $\forall z^\sigma(Xz\leftrightarrow Yz)$) is true at $U$ iff there is $b\in U$ with $x\wedge b=y\wedge b$.

*Proof.* The fibre of $Xz\leftrightarrow Yz$ is $e_z:=\neg(x(z)\triangle y(z))$. If $A$ supports both $x$ and $y$, the family $\{e_z\}_z$ is $H_A$-invariant, so by Lemma 2 $m:=\bigwedge_z e_z$ is a finite meet and the fibre of $\forall z(Xz\leftrightarrow Yz)$ is $\hat m$. Now $m\in U$ gives $b:=m$ ($x(z)\wedge m=y(z)\wedge m$ for all $z$), and conversely $x\wedge b=y\wedge b$ gives $b\le e_z$ for all $z$, so $b\le m\in U$. $\square$

Call the equivalence class of $x$ under "$\exists b\in U:\ x\wedge b=y\wedge b$" the **germ** of $x$ at $U$, $[x]_U$. Transversal at $\sigma$, evaluated at $U_0$, asks for an admissible $\Phi:D_{\sigma t}\to B$ such that every germ at $U_0$ contains exactly one $y$ with $\Phi(y)\in U_0$. (Identity is genuine identity of functions.)

## Lemma A: supports intersect

**Lemma A.** For finite subalgebras $A_1,A_2$ of $B$: $\langle H_{A_1},H_{A_2}\rangle=H_{A_1\cap A_2}$. Consequently an entity (of any type) supported by $A_1$ and by $A_2$ is supported by $A_1\cap A_2$, and every supported entity has a **least support**, the intersection of all its supports (a descending chain of finite subalgebras is finite).

The inclusion $\subseteq$ is trivial. For $\supseteq$, write $K:=\langle H_{A_1},H_{A_2}\rangle$. Two general remarks: (R1) $K$ is closed under conjugation by its own elements, so if $a'=k\,a$ with $k\in K$ and $H_a\subseteq K$ then $H_{a'}=kH_ak^{-1}\subseteq K$. (R2) If $K$ acts transitively on the proper elements of $B$ and contains $H_a$ for one proper $a$, then $K=G$: for $g\in G$ pick $k\in K$ with $k(ga)=a$; then $kg\in H_a\subseteq K$.

*Step 1: two elements.* Let $a,b$ be proper with $\langle a\rangle\cap\langle b\rangle=\{0,1\}$, i.e. $b\notin\{0,a,\neg a,1\}$. Then $\langle H_a,H_b\rangle=G$.

- *Independent case* (all four of $a\wedge b,\ a-b,\ b-a,\ \neg a\wedge\neg b$ nonzero). $H_a=\operatorname{Aut}([0,a])\times\operatorname{Aut}([0,\neg a])$, so $H_a\cdot b$ is the set of all elements independent of $a$. Given any proper $c$, choose $b'$ meeting every nonzero cell of $\langle a,c\rangle$ properly; $b'$ is independent of $a$ and of $c$. Then $b'\in H_a\cdot b$, so $H_{b'}\subseteq K$ by (R1), and $H_{b'}\cdot a\ni c$ since $a,c$ are both independent of $b'$. So $K$ is transitive on proper elements and $K=G$ by (R2).
- *Nested case* $a<b$. $H_b\cdot a=\{a':0<a'<b\}$; choose such an $a'$ incomparable with $a$ (a piece of $a$ joined with a piece of $b-a$). Then $H_{a'}\subseteq K$ and $H_{a'}\cdot b=\{b':a'<b'<1\}$ contains $b':=a'\vee(\text{proper piece of }\neg b)$, which is independent of $a$ ($b'\wedge a=a'\wedge a$, $b'\wedge\neg a\ge a'\wedge(b-a)$, $a-b'=a-a'$, $\neg a\wedge\neg b'\ge\neg b-\text{piece}$, all nonzero). So $K\supseteq\langle H_a,H_{b'}\rangle=G$.
- *Disjoint case* $a\wedge b=0$ (then $a\vee b<1$). $H_b\cdot a=\{a':0<a'<\neg b\}$ contains an $a'$ independent of $a$ (a piece of $a$ joined with a piece of $\neg(a\vee b)$), and $K\supseteq\langle H_a,H_{a'}\rangle=G$.
- The remaining patterns ($b<a$; $a\vee b=1$) reduce to these by swapping $a,b$ or replacing $b$ by $\neg b$ ($H_b=H_{\neg b}$).

*Step 2: one element against a subalgebra.* If $a\notin A_2$ then $\langle H_a,H_{A_2}\rangle=G$. Some cell $d$ of $A_2$ has $a\wedge d$ proper in $d$. Choose $e$ proper in $d$ and independent of $a\wedge d$ inside $[0,d]$, and put $a':=(a-d)\vee e$; then $a'\in H_{A_2}\cdot a$ and $a'\notin\{0,a,\neg a,1\}$, so Step 1 gives $K\supseteq\langle H_a,H_{a'}\rangle=G$.

*Step 3: reduction to trivial intersection.* Let $C:=A_1\cap A_2$ with cells $d_1,\dots,d_r$. $H_C=\prod_i\operatorname{Aut}([0,d_i])$ and $H_{A_j}=\prod_i H^{[0,d_i]}_{A_j|d_i}$ where $A_j|d_i:=\{a\wedge d_i:a\in A_j\}$. If $e\in A_1|d_i\cap A_2|d_i$ then $e\in A_1\cap A_2=C$ and $e\le d_i$, so $e\in\{0,d_i\}$: the restricted algebras intersect trivially inside the homogeneous algebra $[0,d_i]\cong B$. So it suffices to show: $A_1\cap A_2=\{0,1\}$ implies $K=G$.

*Step 4: induction on the number of cells of $A_1$* (with $A_1\cap A_2$ trivial). If $A_1$ is trivial there is nothing to do; if $A_1=\langle a\rangle$, Step 2 applies. Otherwise I claim two cells $c,c'$ of $A_1$ are **not separated** by $A_2$ (no $d\in A_2$ has $c\le d$, $d\wedge c'=0$): if every pair were separated, each cell $c$ would equal $\bigwedge_{c'\ne c}d_{c,c'}\in A_2$, so $A_1\subseteq A_2$, so $A_1=C$ is trivial. Work inside the homogeneous algebra $[0,c\vee c']$: $K$ contains $\operatorname{Aut}([0,c])\times\operatorname{Aut}([0,c'])$ (from $H_{A_1}$), which is the stabiliser of $c$ in $\operatorname{Aut}([0,c\vee c'])$, and contains $H_{A_2}\cap\operatorname{Aut}([0,c\vee c'])$, which is the pointwise stabiliser of $A_2|(c\vee c')$ there. Since $c,c'$ are not separated, $c\notin A_2|(c\vee c')$, and Step 2 inside $[0,c\vee c']$ gives $\operatorname{Aut}([0,c\vee c'])\subseteq K$. Together with $H_{A_1}$ this generates $H_{A_1'}$, where $A_1'$ is $A_1$ with $c,c'$ merged. $A_1'\cap A_2\subseteq A_1\cap A_2$ is trivial and $A_1'$ has fewer cells; induct. $\square$

The proof uses only that every nonzero interval of $B$ is homogeneous and atomless, so it applies verbatim to the countable atomless algebra with $G=\operatorname{Homeo}(2^\omega)$.


## Lemmas B and D: a Boolean computation, and propagation

**Lemma B.** Let $A_1,A_2$ be finite subalgebras, $C=A_1\cap A_2$, $c$ a cell of $\langle A_1\cup A_2\rangle$, and $0<b<c$. Then $\langle A_1,b\rangle\cap\langle A_2,b\rangle=\langle C,b\rangle$.

*Proof.* Let $c_j$ be the $A_j$-cell containing $c$. The cells of $\langle A_j,b\rangle$ are the $A_j$-cells other than $c_j$, together with $b$ and $c_j-b$. Take $e$ in the intersection and write $e=e_j\vee\varepsilon_j$ with $e_j$ a join of $A_j$-cells other than $c_j$ and $\varepsilon_j\in\{0,b,c_j-b,c_j\}$. Since $e\wedge(c-b)=\varepsilon_1\wedge(c-b)=\varepsilon_2\wedge(c-b)$ and $c-b\neq0$, either both $\varepsilon_j\in\{0,b\}$ or both $\varepsilon_j\in\{c_j-b,c_j\}$. In the first case $e-b=e_1=e_2\in A_1\cap A_2=C$ and $e\in\{e-b,(e-b)\vee b\}$; in the second $e\vee b=e_1\vee c_1=e_2\vee c_2\in C$ and $e\in\{e\vee b,(e\vee b)-b\}$. Either way $e\in\langle C,b\rangle$; the converse inclusion is clear. $\square$

**Lemma B′.** With $C\subseteq A_1$, $d$ a $C$-cell, $c_1\le d$ an $A_1$-cell, and $0<b'<b<c_1$: $\langle A_1,b'\rangle\cap\langle C,b,b'\rangle=\langle C,b'\rangle$.

*Proof.* Inside $d$ the cells of $\langle C,b,b'\rangle$ are $b',\ b-b',\ d-b$ and those of $\langle A_1,b'\rangle$ are $b',\ c_1-b'$ and the $A_1$-cells in $d$ other than $c_1$. An element $e$ of both satisfies $e\wedge(c_1-b')\in\{0,c_1-b'\}$, while $c_1-b'=(b-b')\vee(c_1-b)$ with both parts nonzero and $c_1-b\le d-b$; so $e\wedge d$ contains both of $b-b',\ d-b$ or neither, i.e. $e\wedge d\in\{0,b',d-b',d\}$. Outside $d$, $e$ is in $A_1\cap C=C$. $\square$

**Lemma D (propagation).** Let $x,y:D\to B$ be $A$-supported, $c$ an $A$-cell, and $0<b\le c$ with $x\wedge b=y\wedge b$. Then $x\wedge c=y\wedge c$.

*Proof.* If $b=c$ there is nothing to show. Otherwise, as in Lemma 1, pick $u\in\operatorname{Aut}([0,c])\subseteq H_A$ exchanging $[0,b]$ and $[0,c-b]$ (both $\cong B$), extended by the identity. Then $u\cdot x=x$, $u\cdot y=y$, and $x\wedge(c-b)=u\cdot(x\wedge b)=u\cdot(y\wedge b)=y\wedge(c-b)$. Join with $x\wedge b=y\wedge b$. $\square$

Lemma D is the rigidity that will make canonical representatives unique.

## Lemma C: germs have least supports

**Lemma C.** Fix a world $U$ and a type $\sigma t$. If a germ at $U$ has a representative $y_1$ supported by $A_1$ and a representative $y_2$ supported by $A_2$, then it has a representative $y_3$ supported by $C:=A_1\cap A_2$. Hence every germ $\gamma$ at $U$ has a least support $A_\gamma$, the intersection of the supports of all its representatives.

*Proof.* Let $c$ be the cell of $\langle A_1\cup A_2\rangle$ in $U$, and $c_1\supseteq c$ the $A_1$-cell, $d\supseteq c_1$ the $C$-cell in $U$. By Lemma 0, $y_1$ and $y_2$ agree on some member of $U$; shrinking it (nonprincipality) we get $0<b<c$, $b\in U$, with $s:=y_1\wedge b=y_2\wedge b$.

(a) $s$ is supported by $\langle A_1,b\rangle$ and by $\langle A_2,b\rangle$, hence (Lemmas A, B) by $\langle C,b\rangle$: $s$ is $K_b$-equivariant, where $K:=H_C$ and $K_b$ is the stabiliser of $b$ in $K$ (which is $H_{\langle C,b\rangle}$).

(b) For every $0<b'\le b$, $s\wedge b'$ is $K_{b'}$-equivariant. For $b'=b$ this is (a). For $b'<b$: $s\wedge b'=y_1\wedge b'$ is supported by $\langle A_1,b'\rangle$, and $s\wedge b'$ is supported by $\langle C,b,b'\rangle$ (since $s$ is $\langle C,b\rangle$-supported); by Lemmas A and B′ it is supported by $\langle C,b'\rangle$.

(c) Define $y_3:=\bigvee_{g\in K}g\cdot s$, i.e. $y_3(z)=\bigvee_{g\in K}g\,s(g^{-1}z)$ (joins in the complete algebra $B$). This is $K$-equivariant, so $C$-supported, and admissible. I claim $y_3\wedge b=s$. The $g=1$ term gives $y_3\wedge b\ge s$. For the other terms fix $g\in K$ and put $e:=gb\wedge b$; if $e=0$ the term contributes nothing to $y_3\wedge b$. Otherwise put $b':=g^{-1}e=b\wedge g^{-1}b$, so $0<b'\le b$ and $gb'=e$. Then
$$(g\cdot s)\wedge b=g\cdot(s\wedge g^{-1}b)=g\cdot(s\wedge b').$$
Both $b'$ and $e$ are nonzero proper elements of $[0,c_1]$ (they lie below $b<c_1$), so there is $h\in\operatorname{Aut}([0,c_1])\subseteq H_{A_1}\subseteq K$ with $hb'=e$. Then $h^{-1}g\in K_{b'}$, and by (b) $h^{-1}g\cdot(s\wedge b')=s\wedge b'$, so
$$g\cdot(s\wedge b')=h\cdot(s\wedge b')=h\cdot(y_1\wedge b')=(h\cdot y_1)\wedge hb'=y_1\wedge e=s\wedge e\le s,$$
using $h\in H_{A_1}$ and $e\le b$. So every term of $y_3\wedge b$ lies below $s$, and $y_3\wedge b=s$.

Thus $y_3$ is a $C$-supported representative of the germ. The least support exists because the supports of representatives are finite subalgebras closed under intersection. $\square$

So a germ cannot have two incomparable minimal supports. Note the two ingredients: Lemma A (group generation) to see that the *local* data $s\wedge b'$ is as symmetric as it could be, and the single transitivity fact "$\operatorname{Aut}([0,c_1])$ moves any proper $b'$ to any proper $e$" to compare $g$-translates with $H_{A_1}$-translates.

## The witness, and Transversal at every type

Fix a type $\sigma$ (any type: $e$, or a relational type; $D_\sigma$ is just some $G$-set and nothing about it is used). For a germ $\gamma$ at a world $U$:

- $A_\gamma$ is its least support (Lemma C), $c_\gamma$ the $A_\gamma$-cell containing $U$.
- By Lemma D, all $A_\gamma$-supported representatives of $\gamma$ have the same restriction to $c_\gamma$ (any two agree on some $b\in U$, which may be taken $\le c_\gamma$).
- The **canonical representative** $y_\gamma$ is that restriction on $c_\gamma$, and $0$ on the other $A_\gamma$-cells: $y_\gamma:=y\wedge c_\gamma$ for any $A_\gamma$-supported representative $y$. It is $A_\gamma$-supported ($c_\gamma\in A_\gamma$), and it is a representative of $\gamma$ (it agrees with $y$ on $c_\gamma\in U$).

**Definition of $\Phi$.** $\Phi$ has type $(\sigma t)t$ with fibre map $\varphi(y):=\{U:\ y=y_{[y]_U}\}$: "$Y$ is the canonical representative of its own germ at the current world".

**$\Phi$ is $G$-invariant.** For $g\in G$, $g$ carries germs at $U$ to germs at $gU$, supports to supports (so least supports to least supports), cells to cells, and $g\cdot(y\wedge c)=(g\cdot y)\wedge gc$; so $g\cdot y_\gamma=y_{g\gamma}$ and $\varphi(g\cdot y)=g\,\varphi(y)$. Thus $\Phi$ has empty support.

**$\Phi$'s fibres are in $B$.** Let $y$ have least support $A_y$ (Lemma A) with cells $c_1,\dots,c_m$, and let $U\in\hat c_k$, $\gamma=[y]_U$. Then $A_\gamma\subseteq A_y$ (Lemma C applied to the representatives $y$ and one of least support). For a subalgebra $A'\subseteq A_y$: $\gamma$ has an $A'$-supported representative iff some $A'$-supported $y'$ has $y'\wedge c_k=y\wedge c_k$. (If $y'$ represents $\gamma$ it agrees with $y$ on some nonzero $b\le c_k$; both are $A_y$-supported, so by Lemma D they agree on $c_k$. The converse is immediate as $c_k\in U$.) This condition does not mention $U$, only $k$; so $A_\gamma=:A_k$ depends only on $k$. Now
$$y=y_\gamma\iff A_\gamma=A_y\ \text{ and }\ y\wedge c_j=0\text{ for all }j\ne k,$$
since $y=y_\gamma$ forces $A_y\subseteq A_\gamma$ and vanishing off $c_\gamma=c_k$, while conversely if $A_\gamma=A_y$ then $y$ is an $A_\gamma$-supported representative and $y\wedge c_k=y_\gamma\wedge c_k$, both vanishing elsewhere. Both conditions depend on $k$ alone, so
$$\varphi(y)=\bigvee\{c_k:\ A_k=A_y\text{ and }y\wedge c_j=0\ (j\ne k)\}\in A_y\subseteq B.$$

**Correctness.** At any world $U$ and for any $X$ of type $\sigma t$ with fibre map $x$, let $\gamma=[x]_U$ and $Y:=y_\gamma$. Then $X\equiv Y$ at $U$ (Lemma 0, $Y$ represents $\gamma$), and $\Phi Y$ at $U$ since $[y_\gamma]_U=\gamma$. If $\Phi Y'$ and $X\equiv Y'$ at $U$ then $[Y']_U=\gamma$ and $Y'=y_\gamma=Y$. So
$$\forall X\,\exists Y\,(\Phi Y\wedge X\equiv Y\wedge\forall Y'(\Phi Y'\wedge X\equiv Y'\to Y'=Y))$$
is true at every world. **Transversal holds at $\sigma$, for every type $\sigma$, at every world of $K$, and so does □Transversal.** The polyadic variant follows by the recorded coding, or directly (the argument never used anything about $D_\sigma$, so it applies to tuples).

Remarks.

- Since RC fails, Transversal Choice ($=$ Transversal $+$ RC) fails in $K$; $K$ therefore separates Transversal from Transversal Choice and from RC (the map already has Transversal $\not\Rightarrow$ RC via Actuality-type models, but here with □BF, □BC$_t$, □IntCh).
- The witness is unique only up to the convention "$0$ off the cell"; any $G$-invariant rule for extending the determined restriction would do. What is forced is the germ's least support and its restriction to the cell.

## What makes it work

The proof isolates two properties of the action of $G$ on the finite subalgebras of $B$ (its "support points"):

1. **Canonical supports** (Lemma A): $\langle H_{A_1},H_{A_2}\rangle=H_{A_1\cap A_2}$. In model-theoretic language this is weak elimination of imaginaries for the relevant imaginaries: every invariant object has a least finite support, and the same holds for germs after the local step (c) of Lemma C.
2. **Propagation / rigidity within a cell** (Lemma D): an $A$-supported object is determined on an $A$-cell $c$ by its restriction to any nonzero $b\le c$, because $H_A\supseteq\operatorname{Aut}([0,c])$ contains an element swapping $b$ and $c-b$. This is also what drives Lemma 2 (finite attainment) and hence the closure of the domains and the compactness that gives Intensional Choice.

So in this model the very feature that gives IntCh (compact Stone space together with finite attainment, i.e. property 2) also yields the canonical representatives that give Transversal. For this group the imaginaries "germ of an entity at $U$" are eliminable.

A separating model (IntCh, ideally with C5, □BF, □BC$_t$, but not Transversal) would have to keep compactness-type reasoning for IntCh while breaking one of the two properties for germs. Concretely:

- break property 1: an action on the propositions in which two supports of the same germ can be incomparable with no common sub-support (e.g. a group whose finite-set stabilisers do not generate the stabiliser of the intersection: this fails for $\operatorname{Aut}$ of a homogeneous algebra, but holds in many permutation-group actions, such as actions with non-trivial "algebraic closure" like vector spaces with forms, or trees);
- or break property 2: supports whose stabilisers are *not* transitive within cells, so that agreement on a piece does not propagate (then a germ no longer determines a restriction to a cell, and canonical choices must be made among infinitely many restrictions). But the stabilisers must still give finite attainment for closure under quantifiers, which is in tension with this.

The three recorded refutations of Transversal (symmetric finitely pinned models) break property 1 (no canonical finite parameter for a coextension class) and also lack compactness, which is why they refute IntCh too.

The countable variant, with the clopens of Cantor space and its homeomorphisms,
goes the same way. Lemmas A, B, B′ and D use only homogeneity and atomlessness.
The completeness of $B$ is used only for the join $y_3$ in Lemma C, and in the
countable variant the supported sets of worlds are exactly the clopen ones.
Lemma A is proved here; the agent did not find it in the literature under that
name.
