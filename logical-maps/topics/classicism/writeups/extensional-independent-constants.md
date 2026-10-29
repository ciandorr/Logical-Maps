# Extensional models with independent constants

The construction for one predicate is due to OpenAI Codex (GPT-6), prompted by Daniel Kodsi. It
appears in the *Central question audit* of 22 October 2026, and in the two models
extensional-single-predicate-two-individuals and extensional-single-predicate-natural-individuals of his
pull request #21. Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, extended it on 29 October 2026 to
every signature for which it can work, and showed that no other signature is possible.

**What the models show.** Independence (signature Σ) is consistent with Extensionality and □Functional
Choice whenever every constant of Σ has a type in which $e$ occurs. These are the variants with
independent constants of the members of the Henkin models group:

- full-henkin-finite-base: finitely many individuals and finite Σ; both Infinity schemata fail.
- full-henkin-infinite-base: individuals $\mathbb N$ and countable Σ; the Axiom of Infinity holds at $e$,
  while the Infinity schema fails at $t$. With a larger set of individuals, Σ can be of any size.
- henkin-without-relational-choice: in ZF, with a serial relation that has no functional subrelation;
  finite Σ, and Relational Choice fails.

**The restriction on Σ is necessary.** Extensionality and Independence (Σ) are inconsistent if Σ has a
constant whose type does not contain $e$. Under Extensionality there are just two propositions, by the
Fregean Axiom. So each type built from $t$ alone has finitely many entities, and C proves that each of
them is the denotation of one of finitely many closed pure terms $A_1,\dots,A_m$. A constant $c$ of such a
type then satisfies $c=A_1\lor\dots\lor c=A_m$, while Independence, with $n=0$, gives $c\ne A_i$ for each
$i$.

## The construction

**The hierarchy.** Fix a set $E$ of individuals. At type $t$ there are the two truth values, and at each
relational type the full set of functions. Interpret application, abstraction, quantifiers and identity
in the standard way. There is one world, so $\Box p$ is $p=\top$. This is a model of C, and Extensionality
holds.

**Interpreting Σ.** Let every constant of Σ have a type in which $e$ occurs.

- Give each individual constant its own individual.
- Give each relational constant $c$ two individuals of its own, $a_c$ and $b_c$. All these individuals
  are distinct.
- An element $x_\tau$ of each type $\tau$ containing $e$ is built from $a_c$ by recursion on $\tau$:
  - $x_e:=a_c$;
  - for $\tau=\bar\sigma t$, with $e$ occurring in some $\sigma_i$, $x_\tau:=\{\bar y : y_i=x_{\sigma_i}\}$.
- Interpret $c$ of type $\tau$ as $x_\tau$.

So $c$ is fixed by every permutation of $E$ that fixes $a_c$, and it is moved by the transposition of
$a_c$ and $b_c$. The second claim holds by induction: that transposition moves $x_{\sigma_i}$, and hence
moves $x_\tau$.

**Size of $E$.** $E$ needs at least twice as many points as Σ has relational constants, plus one for each
individual constant.

- When Σ is finite, $E$ can be finite.
- In general, $E$ can be any infinite set of at least the cardinality of Σ, for example $\mathbb N$ when
  Σ is countable.

## Independence (Σ) holds

A permutation $\pi$ of $E$ extends to every type: $\pi$ is the identity at type $t$, and
$\pi f:=\pi\circ f\circ\pi^{-1}$ at function types. This preserves application, identity, the Boolean
operations and the quantifiers. So, by induction on terms, every closed pure term $A$ is equivariant:
$\pi(A\,\bar d)=A\,(\pi\bar d)$.

Let $c,d_1,\dots,d_n$ be distinct constants with $n\ge0$.

- If $c$ is relational, the transposition of $a_c$ and $b_c$ fixes the individuals reserved for the
  other constants, and so fixes every $d_i$. So it fixes $A\,\bar d$, but it moves $c$. Hence $c\ne
  A\,\bar d$.
- If $c$ is an individual constant, no term $A\,\bar d$ has type $e$, since the relational types
  have no functions into $e$. So the instance is vacuous.

## The other verdicts

- **□Functional Choice.**
  - Every relation is a function, and a serial relation has a functional subrelation, by choice in the
    metatheory.
  - With finitely many individuals every type is finite, and finite choice suffices.
  - There is one world, so the principle is necessary.
- **Infinity.**
  - There are two propositions, so the Infinity schema fails at $t$.
  - With $E$ finite it also fails at $e$.
  - With $E$ infinite, the numbers at $e$ are the standard finite cardinalities, since the full
    hierarchy contains their family, which is closed under successor and contains zero. None of them
    holds of the universal property, so the Axiom of Infinity holds at $e$.

## Scope

- **One predicate.** Codex's models are the case Σ $=\{c\}$ with $c$ of type $et$, interpreted as
  $\{0\}$, over $\{0,1\}$ or over $\mathbb N$.
- **Exactly two individuals.** Two individuals are enough for just one relational constant. With two
  constants, the only nontrivial permutation, the swap, would have to fix one and move the other.
- **Finitely many individuals, infinite Σ.** I have not settled whether infinitely many constants are
  possible with finitely many individuals. I expect not.
  - With $E$ finite, every type is finite. In a finite full hierarchy, an element fixed by every
    permutation fixing $\bar d$ should be definable from $\bar d$.
  - For each constant $c$, let $K_c$ be the subgroup fixing all the other constants. It is the stabiliser
    of finitely many of them, since the group is finite.
  - Independence would need each $K_c$ to move $c$ while fixing every other constant, so the $K_c$ would
    be pairwise distinct. But a finite group has only finitely many subgroups.
