# Cofinite entrance to the full idempotent action

Construction and proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in the research
note *Strong worlds do not control modal domains* of 26 October 2026, §§2 and 4–5. Checked and
rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.

At the entrance $r$ these hold:

- Strong Atomicity at every relational type;
- the Barcan Formula at every type;
- □Atomicity.

These fail:

- □Strong Atomicity at $t$;
- □BF at $t$.

So the Barcan Formula, even at every type, does not make Strong Atomicity necessary.

## The model

**The target $s$.** Its arrows $s\to s$ are $1$ and an idempotent $k\ne1$. It carries the full
action-model domains over one individual. An entity of relational type is a pair of extensions
$(U,V)$, at $1$ and at $k$, and $k\cdot(U,V)=(V,V)$.

**The entrance $r$.** It has only its identity, and arrows $h_n:r\to s$ ($n\in\mathbb N$) and
$b:r\to s$, with $k\circ h_n=b$ and $k\circ b=b$. An entity of relational type at $r$ is:

- an arbitrary current extension, together with
- target entities $d_n$ (its transports along the $h_n$) and $d_\infty$ (along $b$),

subject to

$$
k\cdot d_n=d_\infty,\qquad k\cdot d_\infty=d_\infty,\qquad d_n=d_\infty\text{ for all but finitely many }n .
$$

Write $d_\infty=(V,V)$ and $d_n=(U_n,V)$. Then $U_n=V$ for all but finitely many $n$.

Evaluation point: $1_r$. The constants of Σ denote top elements.

## A model of C

Current extensions are unrestricted, and logical constants have constant target parts. So,
as in the stationary entrance, it is enough to check the target parts of a term with
parameters.

- **Cofiniteness.** Let $X$ be the union of the parameters' finitely many exceptional indices.
  Outside $X$, the transported parameters at $h_n$ and at $b$ coincide, so the term's
  denotations there coincide.
- **Fixed by $k$.** At $b$ the parameters are fixed by $k$, so by naturality the term's
  denotation there is fixed by $k$.

So the domains are closed under the terms of C.

## Strong Atomicity at $r$, and □Atomicity

At $r$, at every relational type, two kinds of singleton are admitted:

- **one current tuple**, with all target parts $0$;
- **one tuple $\bar a$ at one arrow $h_n$**, with $d_n:=(\{\bar a\},\varnothing)$ and every other
  target part $0$. This is allowed, since $k\cdot(\{\bar a\},\varnothing)=0$.

**Every nonzero entity at $r$ contains one of them.** Consider where it is nonempty:

- in its current extension, or at an exceptional $h_n$: immediate;
- in $V$, its extension at $b$: then pick $\bar a\in V$ and an $n$ outside its exceptions, so
  that $\bar a\in U_n$.

There is no atom at $b$ itself.

**They are strong atoms.** A current singleton transports to $0$ everywhere. The singleton at
$(h_n,\bar a)$ transports to $(\{\bar a\},\varnothing)$ along $h_n$ and to $0$ elsewhere. And
$(\{\bar a\},\varnothing)$ is an atom of the full target that $k$ sends to $0$, so it necessarily
decides everything.

Hence Strong Atomicity holds at $r$. The full target is atomic at every type, so □Atomicity
holds.

## □Strong Atomicity fails at $t$

At $s$, the proposition $\{k\}$ is an atom, but $k\cdot\{k\}=\{1,k\}$, which the proposition
$\{1\}$ splits at $k$. So $\{k\}$ is not a strong atom. Being an atom, it has no other possible
proposition below it. So Strong Atomicity fails at $t$ at $s$, and □Strong Atomicity at $t$
fails at $r$.

## The Barcan Formula at $r$, and its failure at $s$

**Transport along each $h_n$ is onto.** At $e$ this is trivial. At a relational type, given a
target entity $d$, the entity with $d_n:=d$, every other $d_m:=k\cdot d$ and $d_\infty:=k\cdot d$
is admitted, by idempotence, and transports to $d$ along $h_n$.

**BF holds at $r$, at every type.** Let $F$ at $r$ be such that every entity necessarily has
$F$.

- At each $h_n$, every target entity is the transport of some entity at $r$, so the extension
  of $F$ there is the whole domain.
- At $b$, the extension of $F$ is its extension at any $h_n$ outside $F$'s finitely many
  exceptions, so it is everything too.
- At $r$ itself, $F$ holds of everything by T.

So necessarily everything has $F$. The arrow $b$ is not onto, but no admitted predicate at $r$
can detect this.

**BF fails at $t$ at $s$.** Let $X$ hold at $1$ of all four propositions, and at $k$ of $\bot$ and
$\top$. Since $k$ transports every proposition to $\bot$ or $\top$, every proposition
necessarily has $X$. But at $k$ the proposition $\{1\}$ lacks it. So □BF at $t$ fails at $r$.

A target predicate can be lifted along any one $h_n$. But its lift need not satisfy the Barcan
antecedent along the other arrows, so this failure does not contradict BF at $r$.
