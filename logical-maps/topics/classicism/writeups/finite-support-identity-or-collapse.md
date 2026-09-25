# Finite-support action model: identity-or-collapse monotone maps

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

Take $h_0(m)=0$. For $n\ge1$, the map equal to zero through $n$
and to one thereafter is monotone and collapses $0$ and $1$. It is an
arrow agreeing with $h_0$ through $n$ and disagreeing at $n+1$.

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

## Failure of Atomicity at type $t$

This localization is already asserted in *Classicism*, footnote 92,
p. 74, applied to Proposition D.5(4)/(5). Here is a direct check.
The nonempty proposition $p=\{h:h(0)=h(1)=0\}$ is pinned by
$\{0,1\}$ and excludes the identity. Let a nonempty domain proposition
$y\subseteq p$ be pinned through $N\ge1$, and choose $h\in y$.
There is another arrow $h'\ne h$ with the same prefix through $N$:
in the unrestricted monotone model choose a constant tail $v\ge h(N)$
with $v\ne h(N+1)$; in the surjective model insert one extra plateau
after $N$. The latter differs somewhere because a monotone surjection
is unbounded. Both arrows remain in $y$ and collapse $0$ and $1$.
At a coordinate where they differ, restricting $y$ to the value of $h$
gives a nonempty proper finitely pinned subproposition. Hence no
nonempty subproposition of $p$ is an atom, and Atomicity-t fails.
The trawl's particular unrestricted-tail choice need not differ from
$h$; the explicit choice of $v\ne h(N+1)$ repairs that step.

## Attribution and review

The model construction is Bacon and Dorr's. Their footnote 92 (p. 74)
conjectures the additional type-$t$ Boolean Completeness failures. DeepSeek
(`deepseek-flash`) proposed this model verdict in the trawl of 25 September
2026. OpenAI Codex (GPT-6) checked the source definitions and supplied the
corrected proof above on the same date. The immutable drafts and exact API
edit provenance are identified in the model record's `certificate.trawl`.
This is an informal mathematical review; no Lean verification is claimed.
