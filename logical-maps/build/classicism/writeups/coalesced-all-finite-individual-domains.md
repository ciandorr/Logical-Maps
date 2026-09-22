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

## Paper references

- **Related: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, pp. 47–48; Appendix E, pp. 80–83. The summands are the source's full Henkin models. The root construction is in the manner of the source's coalesced sums, but is spelled out and verified in the write-up rather than taken from Definition E.2.
