# Coalesced sum: root over all finite individual domains

A model of C at whose distinguished world both Axioms of Infinity are true,
together with the sentence $\Pi$ of pure-possibility-implies-axiom-of-infinity-t,
that there could be any positive number of individuals. It is a coalesced sum, in the manner
of *Classicism* Appendix E, of the full Henkin models with $1,2,3,\ldots$
individuals; the construction is spelled out so that the verification
stands on its own.

## Construction

For $n\ge1$ let $M_n$ be the full Henkin model of *Classicism* Definition
3.6 with individual domain $\{1,\ldots,n\}$ and two truth values. By
Proposition 3.7 it is a model of C, and since its higher domains consist of
all functions, two of its elements with the same application behaviour are
identical. Worlds are $0$ (the root) and the $n\ge1$.

*Domains.* $D_e:=\prod_{n\ge1}D^n_e$, the threads of individuals.
$D_t:=2\times\prod_{n\ge1}2$, identified with the sets of worlds; $\top$ is
the set of all worlds. For $\sigma\tau$, first define the *root part*
$D^0_\tau$ of a type by $D^0_t:=2$ and $D^0_{\rho\pi}:=$ all functions from
$D_\rho$ to $D^0_\pi$; then $D_{\sigma\tau}$ consists of the pairs
$(G_0,(G_n)_{n\ge1})$ with $G_0\in D^0_{\sigma\tau}$, that is, any function
from $D_\sigma$ to $D^0_\tau$, and $G_n\in D^n_{\sigma\tau}$. Application is
componentwise: $G(x):=(G_0(x),(G_n(x_n))_n)$. So the $n$-th component of a
function sees only the $n$-th component of its argument, while the root
component sees the whole argument.

*Logical constants.* The connectives act componentwise, classically at each
world. $\forall x^\sigma\, .\,\varphi$ is true at a world when $\varphi$ is
true there for every element of $D_\sigma$. Identity at type $\sigma$ is the
element whose $n$-th component is the identity of $M_n$ and whose root
component is identity of elements: $x=y$ is true at $n$ iff $x_n=y_n$, and
at the root iff $x$ and $y$ are the same element.

## Verification that C holds at every world

By induction on terms, the $n$-th component of a term's value is its value
in $M_n$ under the $n$-th components of the parameters; the quantifier
clause uses that every projection $D_\sigma\to D^n_\sigma$ is onto. The root
component of $\lambda x\, .\,T$ is the function
$a\mapsto(\text{root component of }T\text{ at }a)$, which lies in $D^0$, so
the structure is closed under abstraction. The axioms of H hold at every
world: at $n$ because $M_n$ is a model, at the root because it is a
classical two-valued evaluation over the domains with identity of elements,
functional extensionality included, since an element is determined by its
application behaviour. Modus ponens and generalisation preserve truth at
each world, so every theorem of H holds at every world. For Logical
Equivalence, let $A\leftrightarrow B$ be a theorem of H. Then $A$ and $B$
have the same value at every world for every assignment, so
$\lambda\bar x\, .\,A$ and $\lambda\bar x\, .\,B$ have the same root
component, and the same $n$-th components because $M_n$ identifies elements
with the same application behaviour; they are the same element, and the
identity is true at every world. Hence every theorem of C holds at every
world, in particular at the root, and any sentence true at the root is
consistent with C.

## Evaluation at the root

$\Box p$, which is $p=\top$, is true at $n$ iff $p$ is true at $n$, and at
the root iff $p$ is $\top$; so $\Diamond p$ is true at the root iff $p$ is
true at some world.

*Finite cardinalities at the root.* Let $R_\sigma$ be the set of elements
$\mathbf{0}_\sigma,\operatorname{Suc}_\sigma\mathbf{0}_\sigma,
\operatorname{Suc}_\sigma\operatorname{Suc}_\sigma\mathbf{0}_\sigma,\ldots$
of $D_{(\sigma t)t}$, the values of the numerals. The element of
$D_{((\sigma t)t)t}$ whose root component is the characteristic function of
$R_\sigma$, with any $n$-th components, holds of $\mathbf{0}_\sigma$ and is
closed under $\operatorname{Suc}_\sigma$ at the root. So
$\operatorname{FiniteCardinality}_\sigma(Z)$ is true at the root only for
$Z\in R_\sigma$, and conversely for every such $Z$ by induction.

*Any positive number of individuals.* For $Z$ the value of the $k$-th numeral
at type $e$, $(\operatorname{Suc}_eZ)(\lambda x\, .\,\top)$ is the
proposition that there are exactly $k+1$ individuals, true at world $k+1$
since $M_{k+1}$ has exactly $k+1$ individuals. So its diamond holds at the
root for every root-finite $Z$.

*Axiom of Infinity (type $e$).* The root's individuals are the threads, of
which there are uncountably many, so no numeral holds of
$\lambda x\, .\,\top$ at the root.

*Axiom of Infinity (type $t$).* Identity of propositions at the root is
identity of sets of worlds, of which there are uncountably many, so no
numeral of type $(tt)t$ holds of $\lambda p\, .\,\top$ at the root.

*ND fails.* Take threads $a\ne b$ with $a_1=b_1$. Then $a\ne b$ at the root
while $a=b$ is true at world $1$, so $\Diamond(a=b)$ holds at the root.

## Atomicity, Boolean Completeness, Strong Leibniz and rigidity at every relational type

The additional flags below were proposed by DeepSeek `deepseek-flash` in the
Classicism trawl of 25 September 2026, principally in workspaces
`workspace-ec38d3636a6b4ebb836465131dc22d43` and
`workspace-63a7fbc03dda47429345b1e88c727923`. The following verification was
checked and rewritten by OpenAI Codex (GPT-6), 25 September 2026. The direct
projected-extension proof of Rigid Comprehension below replaces the trawl's
appeal to the general implication. This is an informal mathematical check,
without Lean verification; it does not change the attribution of the original
construction or its earlier observations.

Fix any relational type
$\tau=\sigma_1\to\cdots\to\sigma_k\to t$, allowing $k=0$.
Write $A=\prod_{i=1}^k D_{\sigma_i}$ and
$A_n=\prod_{i=1}^k D^n_{\sigma_i}$; an empty product is a singleton.
Uncurrying the construction gives

$$
D_\tau\cong\mathcal P(A)\times\prod_{n\ge1}\mathcal P(A_n).
$$

Thus an entity $X$ is represented by $(X_0,(X_n)_{n\ge1})$, with
$X_0\subseteq A$ and $X_n\subseteq A_n$. Every such family is admitted.
Each tuple projection $\pi_n:A\to A_n$ is onto, by the surjectivity of the
type-domain projections in the construction. At the root, $X\le_\tau Y$
means $X_0\subseteq Y_0$ and $X_n\subseteq Y_n$ for every $n$; at component
$n$ it means just $X_n\subseteq Y_n$. These follow from the definition
$X\le_\tau Y\iff Y=X\lor_\tau Y$. Identity at the root compares whole
entities, whereas identity at $n$ compares their $n$-components.

**Atomicity.** If $X$ is non-bottom at the root, some coordinate of $X$ is
nonempty. Choose a tuple in that coordinate and let $W$ be its singleton
there and empty in every other coordinate. This is an admitted entity,
$W\le X$, and every entity below $W$ is either bottom or $W$. Thus $W$ is
an atom at the root. At component $n$, a non-bottom $X$ has
$X_n\ne\varnothing$; choose a singleton in $X_n$ and lift it to an entity
with the other coordinates empty. Surjectivity of projection ensures that
the quantified atomicity condition there is precisely that of the full
power-set algebra $\mathcal P(A_n)$. Atomicity holds at every world and
every relational type, establishing `necessary-atomicity-r`.

**Strong Leibniz.** Each root atom $W$ just constructed is also a strong
world at the root. For any $Y$, its unique supported tuple belongs either
to the corresponding coordinate of $Y$ or to its complement, so
$W\le Y$ or $W\le\neg Y$ holds at the root. At any component, the image
of $W$ is either a singleton or empty. In the first case the same
alternative holds there; in the second both disjuncts hold. Consequently
$\Box\forall Y\,(W\le Y\lor W\le\neg Y)$ holds at the root, and $W$ is
non-bottom there. The settling condition is necessary; non-bottomness is
not required at the other worlds. At each one-world component, the
modality is the identity and singletons are strong worlds. The Strong
Leibniz Biconditionals therefore hold at every relational type and world,
establishing `necessary-strong-leibniz-r` as well as `strong-leibniz-r`.

**Boolean Completeness.** Given a property $F$ of $\tau$-entities, let
$S=\{x\in D_\tau:F_0(x)=1\}$ be its extension at the root. Set

$$
y_0=\bigcap_{x\in S}x_0,\qquad
y_n=\bigcap_{x\in S}x_n\quad(n\ge1).
$$

For an empty family these are the full tuple spaces. The resulting $y$
belongs to $D_\tau$, and $z\le y$ at the root iff $z\le x$ there for
every $x\in S$. This is exactly
$\operatorname{GLB}_\tau(y,F)$. At component $n$, use the intersection of
the members of the local family $\{b\in D^n_\tau:F_n(b)=1\}$ and lift
that intersection to an element of $D_\tau$. The same equivalence holds
locally. Hence `necessary-boolean-completeness-r` holds.

**Rigid Comprehension.** Let $X$ be a relation of type $\tau$, and put
$S=X_0\subseteq A$. Define the admitted entity $Y$ by

$$
Y_0=S,\qquad Y_n=\pi_n[S]\quad(n\ge1).
$$

It is coextensive with $X$ at the root. If $Y$ holds of a root tuple
$a\in S$, then it holds of $a$ at the root and of $\pi_n(a)$ at every
component. Thus $Y(a)\to\Box Y(a)$ holds at the root. At each component
this implication holds because box is the identity. This proves the
whole boxed condition $\operatorname{Persistent}(Y)$.

For inextensibility, fix a relation $Z$ and suppose, at the root,
$\forall a\,(Y(a)\to\Box Z(a))$. For every $a\in S$, the consequent
gives $a\in Z_0$ and $\pi_n(a)\in Z_n$ for every $n$. Hence
$Y_0\subseteq Z_0$ and $Y_n=\pi_n[S]\subseteq Z_n$ for every $n$, which
is $Y\le Z$ at the root. At a component, the same implication reduces
to the tautology that $Y_n\subseteq Z_n$ implies $Y_n\subseteq Z_n$.
The outer box in the definition of $\operatorname{Inextensible}$ is
therefore satisfied too. Thus $Y$ is rigid and coextensive with $X$ at
the root. At a component every relation is already rigid, so it serves
as its own coextensive witness. This establishes
`necessary-rigid-comprehension-r`.

Each boxed assertion follows from checking the fully closed instance at
every world. No argument necessitates an optional premise, and no
metalinguistic type quantifier is moved inside a box. The product proof
uses the particular full Henkin components of this construction. It does
not extend to arbitrary coalesced sums: Definition E.2 of Bacon and
Dorr's *Classicism*, Appendix E, restricts each root entity's component
to the corresponding component domain.

For the record, it suffices to add `necessary-atomicity-r`,
`necessary-boolean-completeness-r` and `necessary-rigid-comprehension-r`.
The existing implication rules, with the already recorded BF and □BF,
derive Atomicity, Boolean Completeness, Rigid Comprehension and both
Strong Leibniz schemata from these flags.

## Paper references

- **Related: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, pp. 47–48; Appendix E, pp. 80–83. The summands are the source's full Henkin models. The root construction is in the manner of the source's coalesced sums, but is spelled out and verified in the write-up rather than taken from Definition E.2.
