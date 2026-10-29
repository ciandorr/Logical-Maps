# Absorbing entrance to an integer action, with finitely supported swappable pairs

Construction and proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, research note of
26 October 2026. Checked and rewritten for the map by Claude Opus 5.5 (Anthropic), prompted
by Cian Dorr, 28 October 2026.

At the entrance $r$ this model satisfies Intensional Choice at every type, together with
□Boolean Completeness, □Atomicity and □Actuality, while □Intensional Choice fails (at type
$e$). The Barcan Formula and Distinctness-Necessity fail at $t$.

The idea is that Intensional Choice at an object is choice over the arrows out of it. Only two
arrows leave $r$, so two picks suffice. The object $s$ reached from $r$ has infinitely many
arrows out of it, and the finite-support restriction leaves it without a selector.

## The model

**The category.** Two objects $r$ and $s$, with:

- one arrow $a:r\to s$;
- the integers as the arrows $s\to s$, composed by addition;
- no arrows $s\to r$, and only the identity $r\to r$;
- $k\circ a=a$ for every integer $k$.

So exactly two arrows leave $r$, namely $1_r$ and $a$. Associativity is immediate.

**Individuals and swaps.** The individuals at both objects are $A_n^0$ and $A_n^1$ for
$n\in\mathbb N$, and every arrow acts on them as the identity. Separately, the group
$\Gamma=\{0,1\}^{\mathbb N}$ acts on the individuals by $\gamma\cdot A_n^i:=A_n^{i+\gamma(n)}$
(mod 2), and on everything else through them. It is an external symmetry, not part of the
category. For finite $N\subseteq\mathbb N$, let $\Gamma_N$ be the set of $\gamma$ that vanish on
$N$. An entity has *support* $N$ if $\Gamma_N$ fixes it.

**Domains.** At a relational type $\tau=\sigma_1\cdots\sigma_mt$ and an object $v$, start from
the full action-model intensions: sets of tuples tagged by the arrows $h$ out of $v$, the tuple
at $h$ coming from the domains at the codomain of $h$. The domain $D_\tau(v)$ holds those that
have finite support.

- At $t$ the swaps act trivially, so every set of arrows out of $v$ is a proposition.
- Transport is precomposition: $(k_*Y)(h;\bar x)=Y(h\circ k;\bar x)$. It commutes with
  $\Gamma$ and preserves supports.
- The truth clauses are those of full action models, with quantifiers at $h$ ranging over the
  whole domain at the codomain of $h$.

**This is a model of C.** Every logical operation is $\Gamma$-equivariant, since $\Gamma$
permutes each domain. So the intension of a $\lambda$-abstract is supported by the union of its
parameters' supports, and the domains are closed under the terms of C. An H-provable
equivalence holds at every arrow under every assignment, so the two abstractions are the same
intension. Evaluation point: $1_r$. The constants of Σ denote top elements, which every swap
fixes.

## Intensional Choice holds at $r$

Let $F$, of type $\sigma t$, be necessarily instantiated at $r$. Then its rows at $1_r$ and at
$a$ are nonempty. Pick $x$ in the first and $y$ in the second, and let $G$ hold of $x$ at $1_r$
and of $y$ at $a$.

- $G$ is supported by the union of the supports of $x$ and $y$, so it is admitted.
- $G\le F$.
- $G$ has exactly one instance at each of the two arrows out of $r$.

So $\Box\exists!z\,.\,Gz$ holds at $r$, and Intensional Choice holds there at every type,
including $e$. This uses two picks, not choice.

## Intensional Choice fails at $s$, at type $e$

Fix a bijection $\nu:\mathbb N\to\mathbb Z$, and let $F$, of type $et$ at $s$, hold at the arrow
$\nu(n)$ of $A_n^0$ and $A_n^1$. Each pair is invariant under the swaps, so $F$ has empty
support and is admitted. Every row is nonempty, so $\Box\exists x\,.\,Fx$ holds at $s$.

Suppose $G\le F$ is admitted and necessarily uniquely instantiated, with support $N$. Take
$n\notin N$. The row of $G$ at $\nu(n)$ is a singleton inside the $n$th pair. The swap of
exactly the $n$th pair lies in $\Gamma_N$, so it fixes $G$. It also fixes the arrow $\nu(n)$.
So it fixes that singleton row, but it exchanges the pair's two members, which is impossible.

Hence Intensional Choice at $e$ fails at $s$. Since $a$ leads from $r$ to $s$, □Intensional
Choice fails at $r$.

## The other verdicts

**□Boolean Completeness.** At every object and relational type, the order is inclusion of
tagged sets. The actual instances of a property with support $N$ form a family invariant under
$\Gamma_N$, so their union is supported by $N$. It is admitted, and it is their least upper
bound.

**□Atomicity.** A singleton tagged tuple is supported by the union of its entries' supports. So
it is admitted, and it is an atom below any relation that contains it.

**□Actuality.** At each object the singleton of its identity arrow is a proposition. It is a
true atom that entails every truth.

**The Barcan Formula fails at $t$.** Since $k\circ a=a$, a proposition at $r$ transports along
$a$ to $\varnothing$ or $\mathbb Z$. Let $Q$, of type $tt$ at $r$, hold at $1_r$ of every
proposition, and at $a$ of $\varnothing$ and $\mathbb Z$. It has empty support. Every
proposition at $r$ necessarily has $Q$, but at $a$ the proposition $\{0\}$ of $s$ lacks it. In
the same way, with constant-extension properties in place of the two propositions, the Barcan
Formula fails at $et$.

**Distinctness-Necessity fails at $t$.** $\{1_r\}$ and $\bot$ are distinct at $r$, but both
transport to $\bot$ along $a$.

**Also.** The Barcan Formula and Distinctness-Necessity hold necessarily at $e$, since every
arrow is the identity on the same individuals. Neither is a principle of the map at $e$ alone.

## Remark

Astra's earlier note gives a full action model on the same category, in ZF with a sequence of
nonempty sets of reals that has no choice function. It satisfies Intensional Choice at $r$ but
not □Intensional Choice at $t$, with one individual. The model above gets the same separation
in ZFC, the missing selector coming from the finite-support restriction rather than from the
metatheory. The choiceless model is not recorded.
