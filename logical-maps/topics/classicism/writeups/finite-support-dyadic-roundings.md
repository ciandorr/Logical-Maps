# Finite-support action model: dyadic roundings of N

## Failure of Boolean Completeness at type $t$

At the identity arrow of this one-object action model, propositions are
sets of arrows pinned down by a finite set of individuals. Algebraic
entailment is set inclusion, and Boolean operations are the set operations.

The higher-type domain obligation is essential. By *Classicism*, Definition
D.3 and the following paragraph (16 May 2023 draft, pp. 73–74), an ideally
full model is extensionally full. Consequently every set $R\subseteq D_t$
is the extension, at the identity, of a property of propositions. Concretely,
the intension $I_R=\{(h,p):p\in R\}$ is independent of its arrow argument
and is pinned down by the empty set. Its applicative behaviour is
$X_R\langle h,p\rangle=\{j:j^t p\in R\}$, not a constant truth-value
function. This distinction supplies domain membership without the false
rigidification argument in some trawl notes.

Thus a family of domain propositions with no least upper bound refutes
Boolean Completeness at type $t$: the family of their complements is also
the extension of a domain property, and a greatest lower bound for those
complements would, by complementation, give the missing least upper bound.
The bounds are taken **inside** $D_t$. A set-theoretic intersection absent
from $D_t$ need not by itself establish a missing greatest lower bound.

### The domain and missing bound

Index the arrows by $j\ge0$, writing
$f_{2^j}(m)=2^j\lfloor m/2^j\rfloor$. Composition takes the maximum of
the indices. For any finite support $F$, every sufficiently large $2^j$
exceeds all members of $F$, so all the corresponding arrows vanish on $F$.
Conversely, for a finite collection of indices, an initial segment including
the relevant powers of two distinguishes their arrows and the remaining
tail. Hence $D_t$ is precisely the finite/cofinite algebra on these indices.

Every singleton with an even index belongs to $D_t$. Let $R$ be the family
of those singletons. An upper bound in $D_t$ must contain all even indices,
so it is cofinite. It therefore contains an odd index $j$. Removing that
singleton yields a strictly smaller cofinite upper bound. There is no least
upper bound, so the preceding domain argument refutes Boolean Completeness
at type $t$.

## Attribution and review

The model construction is Bacon and Dorr's. Their footnote 92 (p. 74)
conjectures the additional type-$t$ Boolean Completeness failures. DeepSeek
(`deepseek-flash`) proposed this model verdict in the trawl of 25 September
2026. OpenAI Codex (GPT-6) checked the source definitions and supplied the
corrected proof above on the same date. The immutable drafts and exact API
edit provenance are identified in the model record's `certificate.trawl`.
This is an informal mathematical review; no Lean verification is claimed.

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

The type-$t$ Strong Leibniz Biconditionals fail although Atomicity holds, so the two come apart here. A strong world is an atom, and the atoms are the singletons $\{f_n\}$. Seen from $f_n$ with $n\ge2$, $\{f_n\}$ becomes $\{k : k\circ f_n=f_n\}=\{f_m : m\le n\}$, since $f_m\circ f_n=f_{\max\{m,n\}}$, and the proposition $\{f_1\}$ splits that set. So the only strong world is $\{f_1\}$, whose transport along every other arrow is empty, and the possible proposition $\{f_2\}$ has no strong world below it. BF fails at type $t$ as a consequence, by the recorded result that Atomicity (type $t$) and BF (type $t$) imply the type-$t$ Strong Leibniz Biconditionals. Directly: transports along $f_n$ depend only on an arrow’s values on the multiples of $n$, where $f_1$ and $f_2$ agree, so for $n\ge2$ the actual world $\{f_1\}$ is the transport along $f_n$ of no proposition; so for the relation $X$ holding of every proposition except $\{f_1\}$ at the arrows sending $1$ to $0$, pinned down by $\{1\}$, $\forall p\, .\,\Box Xp$ holds at the identity but $\Box\forall p\, .\,Xp$ fails at $f_2$. Observations of 23 September 2026, answering Cian Dorr’s questions whether the failure of BF sharpens to type $t$ and whether failures of Atomicity’s strengthening can be found where Atomicity holds; the derivation of BF’s failure from them, 25 September 2026. Boolean Completeness fails at type $t$ as well, which the source (n. 92) conjectures but does not show. Any set $F$ of propositions is the extension at the identity of an element of the domain at type $t\to t$, namely the profile $\langle h,p\rangle\mapsto\{i : i\cdot p\in F\}$: it is natural, independent of $h$ and so pinned down by the empty set, and each of its values is pinned down by the pinning set of $p$, since $i\cdot p$ depends only on the values of $i$ there. A least upper bound of $F$ under entailment is a least finitely pinned superset of $\bigcup F$, and it exists only if the least $S$-pinned superset of $\bigcup F$ stops shrinking as the finite set $S$ grows. Here an arrow $f_n$ is determined by its value at any $m\ge n$ and all $f_n$ with $n>N$ agree on $\{0,\ldots,N\}$, so the finitely pinned propositions are exactly the finite and cofinite sets of arrows. Let $F$ be the family of singletons $\{f_n\}$ for $n$ an even power of $2$: an upper bound is a cofinite set containing them, and removing an odd-power member of it gives a strictly smaller upper bound. So $F$ has no least upper bound, and, taking pointwise negations, the family of complements has no greatest lower bound. Observation of Claude Fable 5.1 (Anthropic), 25 September 2026; not in the source.
