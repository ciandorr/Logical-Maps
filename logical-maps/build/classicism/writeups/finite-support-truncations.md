# Finite-support action model: truncations of N

## Strong worlds and Barcan

The finite-support truncation model, the finite-support dyadic-rounding model,
and the full two-arrow idempotent model all fail the type-t Strong Leibniz
Biconditionals. The truncation model also fails BF at type t. These statements
concern the existing constructions; no modification of their domains is needed.

The Strong Leibniz failures were proposed in the DeepSeek `deepseek-flash`
trawl of 25 September 2026. OpenAI Codex (GPT-6) checked them against the source
semantics and supplied the unified proof below on the same date. The direct
BF witness below was supplied during that review to repair the trawl's
unsupported use of a converse to Proposition 3.24(ii). These are informal
mathematical checks, without Lean verification. The model constructions remain
attributed to Bacon and Dorr.

## Quantification at a successor

We use Bacon and Dorr, *Classicism*, draft of 16 May 2023, Definition 3.19,
pp.55–56, and the satisfaction clauses on p.57. At an arrow from an object W
to an object V, assigned entities are transported to V, while newly bound
variables range over V's entire domain. They do not range merely over the
image of W's domain under that arrow.

For a one-object model let A be its monoid and P its type-t domain. Its
proposition action is

\[
h^t p=\{u\in A:u\circ h\in p\}.
\]

At the basepoint, possibility means nonemptiness and entailment means set
inclusion. Consequently an admitted proposition w is a strong world exactly
when it is nonempty and, for every arrow h and every **target-domain**
proposition Y in P,

\[
h^t w\subseteq Y\quad\text{or}\quad h^t w\subseteq A\setminus Y.
\]

The quantifier over Y here is inside the box in the definition of a strong
world. Restricting it to propositions of the form h^t p changes the definition
and gives the wrong answer in the examples below.

## A nonidentity idempotent refutes Strong Leibniz

Suppose h is a nonidentity idempotent arrow and the singleton p={h} is an
admitted proposition. Then p is possible, and the only possible proposition
w entailing p is p itself. But

\[
1,h\in h^t\{h\},
\]

because both 1∘h and h∘h equal h. At the successor h, take the independently
quantified proposition Y={h}. The shift h^t{h} meets Y at h and meets its
complement at 1. It therefore entails neither Y nor its negation. Thus p is
not a strong world, and the possible p has no strong world below it.

This proves failure of Strong Leibniz at type t in each of the following
existing models:

- **Full idempotent monoid:** A={1,k}, with k²=k and k≠1. Every subset of A
  is a proposition, so take h=k. The construction is *Classicism*, §3.5,
  p.59. In this model the only strong world at the basepoint is {1}; the
  possible proposition {k} has none below it.
- **Finite-support truncations:** arrows are the identity and g_n(m)=min(m,n).
  Take h=g_0. Its singleton is pinned down by the finite individual set
  {0,1}: g_0 is the unique arrow sending 1 to 0. Also g_0²=g_0≠1. See
  Proposition D.5(6), construction on p.78.
- **Finite-support dyadic roundings:** f_n rounds down to a multiple of n,
  for n a power of two. Take h=f_2. The singleton {f_2} is pinned by
  {0,1,2}, since f_2(1)=0 and f_2(2)=2 distinguish it from the identity
  and all coarser dyadic roundings. Also f_2²=f_2≠1. See Proposition
  D.5(7), construction on p.78.

In all three cases, the necessary type-t Strong Leibniz Biconditionals fail
as well: by T, their truth would imply the unboxed sentence. This corrects
the earlier positive flag for the full idempotent model. Its source
construction and other independently established properties are unchanged.

For comparison, in a group h^t{g}={g∘h^{-1}} is a singleton, and in the
truncated-shift monoid k_n∘k_m=k_{n+m}, each such precomposition fibre is
empty or a singleton. Their singleton worlds therefore do decide every
target proposition. Those positive Strong Leibniz verdicts already follow
from the map's Atomicity and Barcan rules.

## A finitely pinned BF(t) witness in the truncation model

Let A and P now be the truncation monoid and its proposition domain. Define
an intension for a property X of propositions by assigning the following
extensions to arrows:

\[
I_h=
\begin{cases}
\{\varnothing,A\},&h=g_0,\\
P,&h\ne g_0.
\end{cases}
\]

This is an admissible type-tt entity. Indeed h=g_0 exactly when h(1)=0,
so the intension is pinned down by the finite individual set {1}.
Definition D.3's equivalent intension characterization on p.74 places every
such finitely pinned intension in this ideally full model's domain.

For every proposition p assigned at the base and every arrow h, h^t p
belongs to I_h. For h≠g_0 this is immediate. For h=g_0, the identity
u∘g_0=g_0 for every arrow u gives

\[
g_0^t p=
\begin{cases}
A,&g_0\in p,\\
\varnothing,&g_0\notin p,
\end{cases}
\]

and both values belong to I_{g_0}. Thus forall p Box Xp holds at the base.

At the successor g_0 the quantifier ranges over all of P. In particular,
the admitted proposition {g_0} is neither A nor empty and does not belong
to I_{g_0}. Hence forall p Xp is false there, and Box forall p Xp is false
at the base. This X refutes

\[
\forall X^{tt}\bigl((\forall p\,\Box Xp)\to\Box\forall p\,Xp\bigr).
\]

The boxed BF(t) sentence fails by T. Appendix D, footnote 92 on p.74 also
explicitly covers BF failure at every type in this example. The direct
witness above makes clear why no converse to Proposition 3.24(ii) is being
assumed for an arbitrary non-full model.

## Sources and verification

- Bacon, Andrew, and Cian Dorr, *Classicism*, draft of 16 May 2023,
  [public reference](https://philpapers.org/archive/BACC-8.pdf): pp.55–58
  for action semantics and Proposition 3.24; p.59 for the idempotent model;
  Definitions D.1–D.3, pp.73–74, for ideals, pinning and ideally full domains;
  Proposition D.5(6–7), p.78, for truncations and dyadic roundings.
- The exact finite calculation in `checks/action_strong_worlds.py`
  enumerates all four propositions of the two-arrow monoid and the
  successor-domain quantifier in the strong-world condition. It also checks
  the analogous BF witness and demonstrates the erroneous answer obtained
  by restricting successor quantifiers to transported propositions. This
  finite calculation supplements the proofs; it does not replace the
  infinite-model argument above.

## Additional arguments from Cian's branch, 25 September 2026

Inextensible Comprehension fails, at type $e\to t$, for the property of being even, which is in the domain as the constant intension $\{\langle b,h\rangle : b\text{ even}\}$, pinned down by $\emptyset$. Unpacking $\operatorname{Inextensible}$ as in the left-to-right half of Dorr’s rigidity criterion (draft, Lemma 14, p. 7, with Lemma 13): even the unboxed matrix, evaluated at the identity, says that $Y$ is contained in every persistent (transport-closed) $B$ in the domain whose extension includes $Y$’s. For a finite $N^{\prime}$, the smallest such $B$ pinned down by $N^{\prime}$ is $B_{N^{\prime}}:=\{\langle b^{\prime\prime},i^{\prime}\rangle : i^{\prime\prime}(b)=b^{\prime\prime}\text{ for some even }b\text{ and some arrow }i^{\prime\prime}\text{ agreeing with }i^{\prime}\text{ on }N^{\prime}\}$, which is transport-closed and pinned down by $N^{\prime}$. Now let $Y$ be coextensive with evenness and pinned down by a finite $N_0\subseteq[0,M_0]$; then $\langle b,i\rangle\in Y$ for every even $b$ and every arrow $i$ fixing $N_0$ pointwise. Take $i:=g_n$ with $n\ge M_0$, an even $b>n$, and $N^{\prime}:=[0,n+1]$: the only arrow agreeing with $g_n$ on $[0,n+1]$ is $g_n$ itself, whose range $[0,n]$ omits $b$. Here even the universal property has no inextensible coextension, since $\operatorname{Inextensible}(\top_{et})$ unfolds to $\Box$BF at type $e$. So $\langle b,i\rangle\in Y\setminus B_{N^{\prime}}$, and $Y$ is not even weakly inextensible, so Weakly Inextensible Comprehension fails too. Observation of 23 September 2026, answering Cian Dorr’s question whether the failure of Actuality can be sharpened to a failure of Inextensible Comprehension. The type-$t$ Strong Leibniz Biconditionals fail although Atomicity holds, so the two come apart here. A strong world is an atom, and the atoms are the singletons $\{g_n\}$, since $\{1_{\mathbb N}\}$ is not pinned down by a finite set. Transported along $g_n$, $\{g_n\}$ becomes $\{k : k\circ g_n=g_n\}=\{1_{\mathbb N}\}\cup\{g_m : m\ge n\}$, which $\{g_n\}$ itself splits; so there is no strong world at all. BF fails at type $t$ as a consequence, by the recorded result that Atomicity (type $t$) and BF (type $t$) imply the type-$t$ Strong Leibniz Biconditionals. Directly: with $1$ and $0$ as individuals, $X:=\lambda p\, .\,(1\ne0\lor\Box p\lor\Box\neg p)$ is necessarily true of every proposition, since $g_0$ is the only arrow sending $1$ to $0$ and it transports every proposition to $\top$ or $\bot$; but at $g_0$ it fails of the contingent proposition $\{g_1\}$, which the domain there still contains. Observations of 23 September 2026, answering Cian Dorr’s questions whether the failure of BF sharpens to type $t$ and whether failures of Atomicity’s strengthening can be found where Atomicity holds; the derivation of BF’s failure from them and the direct counterexample, 25 September 2026.

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Proposition D.5(6), pp. 74–75; construction p. 78, Part 6; p. 79 (No Pure Contingency)
