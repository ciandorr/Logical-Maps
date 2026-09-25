# Finite-support action model: truncated shifts of N

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

Write $k_n(m)=\max(m-n,0)$, for $n\ge0$. The arrows compose by
$k_j\circ k_n=k_{j+n}$, and $k_0$ is the identity. If $j<n$, these
arrows agree on a finite set $F$ exactly when every member of $F$ is at
most $j$. In particular, all indices beyond $\max F$ look the same on $F$.
Conversely, a sufficiently long finite initial segment distinguishes any
specified finite set of arrow indices from one another and from the tail.
So $D_t$ is precisely the finite/cofinite algebra on the indices $\mathbb N$.

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
