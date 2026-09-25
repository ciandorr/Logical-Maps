# Finite-support action model: monotone surjections of N

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

### A strictly decreasing sequence of agreement classes

Take $h_0(m)=m$, the identity. For $n\ge1$, the map equal to $m$
on $m\le n$ and to $m-1$ on $m>n$ is a monotone surjection. It agrees
with $h_0$ through $n$ and disagrees at $n+1$.

Put $C_n=\{h:h|_{\{0,\ldots,n\}}=h_0|_{\{0,\ldots,n\}}\}$
and $A_n=C_n\setminus C_{n+1}$, for $n\ge1$. These are finitely
pinned propositions. The displayed arrows show that every $A_n$ is
nonempty. The sets $A_n$ are pairwise disjoint.

### A family with no least upper bound

Let $R=\{A_{2r}:r\ge1\}$. Suppose $u\in D_t$ is an upper bound for
this family, and enlarge a finite support for $u$ to $\{0,\ldots,N\}$
with $N\ge1$. Choose an even $m>N$ and an arrow $h\in A_m$.
Since $h\in u$ and $h$ agrees with $h_0$ through $N$, finite pinning
implies $h_0\in u$ and indeed $C_N\subseteq u$.

Now choose an odd $l>N$. The nonempty proposition $A_l$ lies in
$C_N\subseteq u$ and is disjoint from every member of $R$.
Consequently $u\setminus A_l$ is a strictly smaller upper bound in
$D_t$; its support is contained in $\{0,\ldots,\max(N,l+1)\}$.
Thus $R$ has no least upper bound. Extensional fullness supplies the
property with the complementary family as its extension, proving the
failure of the recorded greatest-lower-bound formulation of BC-t.

The original descending-family proposal is not a valid proof: its
intersection is $\{h_0\}$, but if this singleton is not admitted, the
bottom proposition is a greatest lower bound of that descending family.
The alternating differences above are the replacement witness.

## Attribution and review

The model construction is Bacon and Dorr's. Their footnote 92 (p. 74)
conjectures the additional type-$t$ Boolean Completeness failures. DeepSeek
(`deepseek-flash`) proposed this model verdict in the trawl of 25 September
2026. OpenAI Codex (GPT-6) checked the source definitions and supplied the
corrected proof above on the same date. The immutable drafts and exact API
edit provenance are identified in the model record's `certificate.trawl`.
This is an informal mathematical review; no Lean verification is claimed.

## Additional arguments from Cian's branch, 25 September 2026

Inextensible Comprehension fails, at type $e\to t$, for the property of being even, which is in the domain as the constant intension $\{\langle b,h\rangle : b\text{ even}\}$, pinned down by $\emptyset$. Unpacking $\operatorname{Inextensible}$ as in the left-to-right half of Dorr’s rigidity criterion (draft, Lemma 14, p. 7, with Lemma 13): even the unboxed matrix, evaluated at the identity, says that $Y$ is contained in every persistent (transport-closed) $B$ in the domain whose extension includes $Y$’s. For a finite $N^{\prime}$, the smallest such $B$ pinned down by $N^{\prime}$ is $B_{N^{\prime}}:=\{\langle b^{\prime\prime},i^{\prime}\rangle : i^{\prime\prime}(b)=b^{\prime\prime}\text{ for some even }b\text{ and some arrow }i^{\prime\prime}\text{ agreeing with }i^{\prime}\text{ on }N^{\prime}\}$, which is transport-closed and pinned down by $N^{\prime}$. Now let $Y$ be coextensive with evenness and pinned down by a finite $N_0\subseteq[0,M_0]$; then $\langle b,i\rangle\in Y$ for every even $b$ and every arrow $i$ fixing $N_0$ pointwise. Take $i$ the monotone surjection that is the identity on $[0,M_0+1]$, sends $M_0+2$ to $M_0+1$ and $x$ to $x-1$ for $x\ge M_0+2$; an even $b\ge M_0+2$, whose only preimage under $i$ is the odd $b+1$; and $N^{\prime}:=[0,b+2]$: a monotone map agreeing with $i$ there has the same preimages of $b$ within $[0,b+2]$ and takes values at least $i(b+2)=b+1$ beyond it. So $\langle b,i\rangle\in Y\setminus B_{N^{\prime}}$, and $Y$ is not even weakly inextensible, so Weakly Inextensible Comprehension fails too. Observation of 23 September 2026, answering Cian Dorr’s question whether the failure of Actuality can be sharpened to a failure of Inextensible Comprehension. Boolean Completeness fails at type $t$ as well, which the source (n. 92) conjectures but does not show. Any set $F$ of propositions is the extension at the identity of an element of the domain at type $t\to t$, namely the profile $\langle h,p\rangle\mapsto\{i : i\cdot p\in F\}$: it is natural, independent of $h$ and so pinned down by the empty set, and each of its values is pinned down by the pinning set of $p$, since $i\cdot p$ depends only on the values of $i$ there. A least upper bound of $F$ under entailment is a least finitely pinned superset of $\bigcup F$, and it exists only if the least $S$-pinned superset of $\bigcup F$ stops shrinking as the finite set $S$ grows. Here let $A_m$ ($m\ge1$) be the proposition, pinned down by $\{2m-1,2m\}$, that the arrow sends $2m-1$ to $0$ and $2m$ to $1$, so that its first step is at the even position $2m$. The least superset of $\bigcup_mA_m$ pinned down by $\{0,\ldots,N\}$ consists of the arrows whose first step is at an even position or beyond $N$, and it strictly shrinks as $N$ grows. So $F$ has no least upper bound, and, taking pointwise negations, the family of complements has no greatest lower bound. Observation of Claude Fable 5.1 (Anthropic), 25 September 2026; not in the source.
