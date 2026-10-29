# Eventually stationary entrance to the full successor action

Construction and proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in the research
note *Strong worlds do not control modal domains* of 26 October 2026, §§2–3. Checked and
rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.

At the entrance $r$, □Strong Atomicity holds at every relational type, and so □Strong
Actuality holds too. The Barcan Formula fails at $t$ and at every relational type. It holds at
$e$, where there is one individual.

## The model

**The target $s$.** Its arrows $s\to s$ are the natural numbers under addition, with the
successor $S:=1$. It carries the full action-model domains over a single individual:

- an entity of relational type is an arbitrary profile $m\mapsto F_m$ of sets of argument
  tuples;
- transport is $(m\cdot F)_u=F_{um}$.

**The entrance $r$.** It has only its identity, and arrows $h_n:r\to s$ for $n\in\mathbb N$,
with $m\circ h_n=h_{m+n}$. An entity of relational type at $r$ is a pair $(A,b)$:

- $A$ is an arbitrary set of current argument tuples;
- $b$ is a target entity that is *eventually stationary*: $S^{N+1}b=S^Nb$ for some $N$;
- its transport along $h_n$ is $S^nb$.

The pair is indeed the whole intension. Its row at $1_r$ is $A$, and its row at $h_n$ is the
identity row of $S^nb$; compatibility with composition is $m\cdot(h_n\cdot F)=h_{m+n}\cdot F$.
Equality at $r$ is equality of the pairs. Evaluation point: $1_r$. The constants of Σ denote top
elements, which are fixed by the successor.

## A model of C

The target is a full action model. At the entrance, the current extension of every term's
denotation is admitted, since current extensions are unrestricted. So it is enough that the
target part of each term's denotation is eventually stationary. By naturality of the target
semantics, that target part is the target denotation of the term with its parameters
transported. Choose $N$ beyond the stages of the term's finitely many parameters. From $N$ on,
the transported parameters are fixed by $S$, and hence so is the term's denotation.

So the domains are closed under the terms of C, and the H-provable equivalences identify
abstractions as in the target. The variables bound in the term range over the whole target
domain; only its free parameters need a common stage.

## □Strong Atomicity

At $r$, at every relational type, two kinds of singleton are admitted:

- **one current tuple**, with target part $0$;
- **one target coordinate** $(n,\bar a)$, with empty current extension and target part
  $\delta_{n,\bar a}$. The successor carries this to $\delta_{n-1,\bar a}$, and after $n+1$
  steps to $0$, so it is eventually stationary.

**Every nonzero entity at $r$ contains one of them**, since its current extension or some row
of its target part is nonempty. Each is an atom, because the order is inclusion of complete
profiles.

**They are strong atoms.** Their transports are $0$ or target singletons, and a target
singleton is an atom of the full target domain, so it decides every target relation. The full
target is strongly atomic in the same way. Hence Strong Atomicity holds at both objects, at
every relational type, and □Strong Atomicity holds at $r$.

## The Barcan Formula fails

**At $t$.** The target part of a proposition at $r$ is a set of numbers that is eventually
stationary under the shift, that is, finite or cofinite. Take the pure property

$$
P(p):=\Diamond\Box p\lor\Diamond\Box\neg p .
$$

- **Every proposition at $r$ necessarily has $P$.** A finite set is eventually empty and a
  cofinite set eventually everything, and the same holds of their shifts. So $P$ holds of every
  proposition at $r$, and at every $h_n$ of its transport.
- **Not every proposition has it at $s$.** The set of even numbers is neither eventually
  everything nor eventually empty, so $P$ fails of it there.

So $\forall p\,.\,\Box Pp$ holds at $r$ but $\Box\forall p\,.\,Pp$ does not.

**At a relational type $\tau$.** The target has an operation $L_\tau$, of type $\tau\tau$, that
sends $b$ to $Sb$. Its profile reads $b$ at the next coordinate and does not depend on the
arrow, so $S$ fixes it. Let $E_\tau$ at $r$ have target part $L_\tau$. Then:

- **Every entity at $r$ necessarily has $\Diamond(E_\tau Y=Y)$**, since its transports are
  eventually fixed by the shift.
- **A target entity alternating between even and odd coordinates never does.**

So the Barcan Formula fails at $\tau$.

**At $e$** it holds necessarily, there being one individual.
