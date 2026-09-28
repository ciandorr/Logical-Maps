# Symmetric ideally-full model: automorphisms of infinitely many infinite classes

Construction idea: Cian Dorr, 27 September 2026. He proposed a symmetric
finitely pinned model whose symmetry group preserves a rich qualitative
structure, so that each newly pinned point makes new infinite-coinfinite
extensions available. Claude Opus 5.5 (Anthropic) chose the structure and
wrote the verification below; the Inextensible Comprehension argument was
added on 28 September 2026. Not yet independently checked.

The framework and the lemmas cited are from Dorr, *Boolean Completeness does
not imply Rigid Comprehension*, draft of 30 July 2026, §3 and the section on
the Boolean Completeness theorem.

**Summary.**

- Transversal fails, at type $e$. The model is the first on the map to
  refute it, so Transversal is not a theorem of C.
- Inextensible Comprehension holds, at every relational type. So
  Inextensible Comprehension does not imply Transversal.
- Boolean Completeness, BF and No Pure Contingency hold, with their boxed
  forms.
- Actuality, Relational Choice, Atomicity at type $t$ and ND fail.

## The model

- **Individuals.** One object, $\mathbb N$, carrying an equivalence relation
  $\sim$ with infinitely many classes, each infinite.
- **Arrows (worlds).** All the surjections $\mathbb N\to\mathbb N$, as in
  the draft's Base 1. The worlds are the arrows. World $h$ sees $k\circ h$
  for every arrow $k$. The evaluation point is the identity arrow $1$.
- **Symmetry group.** $G:=\mathrm{Aut}(\mathbb N,\sim)$, the permutations
  that map classes onto classes.
  - Its members are arrows, so this is a base in the draft's sense.
  - $(\mathbb N,\sim)$ is homogeneous: a finite partial map that is
    injective and preserves both $\sim$ and $\not\sim$ extends to a member
    of $G$.
- **Domains.** The symmetric ideally-full model: each relational domain
  holds the intensions that are symmetric and pinned down by some finite set.
  The draft proves that such a premodel is a model of C, for every base.

## Notation and basic facts

An intension $A$ of relational type is a set of pairs $\langle\bar x,w\rangle$,
where $w$ is an arrow and $\bar x$ is a tuple of entities.

- **Extension at a world.** Write $A_w:=\{\bar x : \langle\bar x,w\rangle\in A\}$.
  The extension at the evaluation point is $A_1$.
- **Transport.** For an arrow $h$, $h\cdot A:=\{\langle\bar x,k\rangle :
  \langle\bar x,k\circ h\rangle\in A\}$, so $(h\cdot A)_k=A_{k\circ h}$.
  - On individuals, $h\cdot x=h(x)$.
  - Transport is functorial: $(k\circ h)\cdot A=k\cdot(h\cdot A)$.
- **Pinning.** $A$ is pinned down by $N$ iff $h\cdot A=h'\cdot A$ whenever
  $h$ and $h'$ agree on $N$. In particular $A_h=A_{h'}$ for such arrows.
- **Symmetry.** $A$ is symmetric iff $\langle\bar x,w\rangle\in A$ implies
  $\langle g\cdot\bar x,g\circ w\rangle\in A$ for all $g\in G$. Equivalently,
  $A_{g\circ w}=g\cdot A_w$.

Three consequences are used below.

- **(F1) The extension at a symmetry.** For $g\in G$, $A_g=g\cdot A_1$, by
  symmetry with $w=1$.
- **(F2) Extensions are invariant.** If $A$ is pinned down by $S$ and $g\in G$
  fixes $S$ pointwise, then $g$ agrees with $1$ on $S$. So
  $A_1=A_g=g\cdot A_1$.
- **(F3) Least pinning sets.** With all surjections as arrows, two finite
  sets that pin $A$ down have an intersection that pins it down. This is the
  aside on least pinning sets in the draft's section on hulls; it uses only
  the arrows, not $G$. So each $A$ has a least finite pinning set $T_A$.
  - Since $g\cdot A$ is pinned down by $g[T_A]$ (Lemma 21), $T_{g\cdot A}=g[T_A]$.

The **orbit lemma** of the draft (just before Theorem 36) is (F2) for
classifiers:

- If $F$ is pinned down by $M_F$ and $g\in G$ fixes $M_F$ pointwise, then
  $F_1$ is closed under $g$: whenever $F$ holds of $Y$ at $1$, it holds of
  $g\cdot Y$ at $1$.

## Transversal fails at type $e$

**The classes are extensions of properties.**

- Let $R:=\{\langle y,z,w\rangle : y\sim z\}$.
  - It is pinned down by $\varnothing$, since the condition does not mention
    the arrow.
  - It is symmetric, since every $g\in G$ preserves $\sim$.
  - So it is in the domain: $\sim$ is a qualitative relation of the model.
- For an individual $a$, put $X_a:=\lambda y\,.\,R\,y\,a$, that is
  $\{\langle y,w\rangle : y\sim w(a)\}$.
  - It is pinned down by $\{a\}$.
  - Its extension at $1$ is the class of $a$.

**No classifier picks a representative for every class.**

- Suppose $F$ of type $(e\to t)\to t$ is pinned down by the finite set $M_F$.
- Choose a class $C$ disjoint from $M_F$, which is possible since there are
  infinitely many classes, and some $a\in C$.
- Suppose $Y$ is the unique property in $F_1$ coextensive with $X_a$, so
  $Y_1=C$.
- Let $H:=\{g\in G : g\text{ fixes }M_F\text{ pointwise and }g[C]=C\}$.

1. **$Y$ is fixed by $H$.** Take $g\in H$.
   - By the orbit lemma, $g\cdot Y\in F_1$.
   - By (F1) and symmetry, $(g\cdot Y)_1=Y_g=g[Y_1]=g[C]=C$.
   - So $g\cdot Y$ is also an $F$-property coextensive with $X_a$, and
     uniqueness gives $g\cdot Y=Y$.
2. **So its least pinning set is $H$-invariant.** By (F3),
   $T_Y=T_{g\cdot Y}=g[T_Y]$ for every $g\in H$.
3. **Every finite $H$-invariant set lies inside $M_F$.** Every point outside
   $M_F$ has an infinite $H$-orbit.
   - $H$ contains every permutation of $C$, extended by the identity.
   - For each other class $D$, $H$ contains every permutation of the
     infinite set $D\setminus M_F$.
   - Hence $T_Y\subseteq M_F$.
4. **Contradiction.** By (F2), $Y_1=C$ is invariant under every $g\in G$
   fixing $T_Y$, and so under every $g$ fixing $M_F$. But one such $g$ swaps
   $C$ with another class disjoint from $M_F$ by a bijection, and is the
   identity elsewhere. That $g$ moves $C$.

So no $F$ in the domain witnesses the type-$e$ instance of Transversal.

**Remarks.**

- Only the uniqueness half is refuted, in step 1. Every property is
  coextensive with some $F$-property for many $F$.
- The classes must be infinite. If $C$ were finite, the property of being
  identical to one of its members would be pinned down by $C$ itself, and it
  would serve as a canonical representative.
- The mechanism is a failure of weak elimination of imaginaries. The class,
  as a definable set, has no canonical finite set of parameters: any member
  of it will do, and none is preferred.
  - Structures that have weak elimination of imaginaries, such as a dense
    linear order or the random graph, give no such failure.
  - In the binary tree with a parent function, the levels form infinitely
    many infinite classes. But automorphisms act on the levels as
    translations of $\mathbb Z$, so fixing one node fixes every level.

## Inextensible Comprehension holds at every relational type

Let $X$ be in the domain, pinned down by the finite set $S$, with extension
$E:=X_1$.

**Why the witness used in `symmetric-all-surjections` does not transfer.**

- There the witness was $\delta_S\land X$, where $\delta_S$ says that no two
  members of $S$ are collapsed. It relied on two facts:
  - every world that does not collapse $S$ can be relabelled by a symmetry
    so as to fix $S$ pointwise;
  - once $\delta_S$ is false it stays false.
- Here a world can be injective on $S$ but break its $\sim$-pattern. At such
  a world no symmetry relabels it to fix $S$, and $X$'s extension there is
  unrelated to $E$.
- Conjoining the pattern condition does not help, because the condition is
  not stable: a later arrow can merge or split classes and restore it. In
  fact no proposition true at $1$ that implies the pattern condition stays
  false once false.
  - Suppose $\varphi$ is pinned down by a finite $V$ and has these properties.
  - For any world $k$, take an arrow $h$ injective on $V$ that breaks the
    pattern of $S$, and an arrow $m$ with $m\circ h$ agreeing with $k$ on $V$.
  - Then $\varphi(h)$ is false, so $\varphi(m\circ h)=\varphi(k)$ is false.
    So $\varphi$ is false everywhere, including at $1$.

**The witness: send the bad worlds to a hull, not to $\varnothing$.**

- The **pattern condition** is $\pi_S:=\{w : w\text{ agrees on }S\text{ with some member of }G\}$.
  By homogeneity, $w\in\pi_S$ iff $w$ is injective on $S$ and preserves
  $\sim$ and $\not\sim$ there. It is symmetric, pinned down by $S$, and true
  at $1$.
- The **hull** of $E$ is
  $$H_E:=\{\langle\bar r,m\rangle : \bar r=m'\cdot\bar c\text{ for some }\bar c\in E\text{ and some arrow }m'\text{ agreeing with }m\text{ on }S\}.$$
  It is the draft's $S$-hull of the union of the haecceities of the members
  of $E$. It is pinned down by $S$ and symmetric.
- The witness is
  $$Y:=\lambda\bar r\,.\,(\pi_S\land X\bar r)\lor(\neg\pi_S\land H_E\bar r).$$
  So $Y_w=X_w$ if $w\in\pi_S$, and $Y_w=(H_E)_w$ otherwise.
  - $Y$ is pinned down by $S$ and symmetric, so it is in the domain.
  - It is coextensive with $X$, since $1\in\pi_S$.

**A sufficient condition for inextensibility.**

- By transport, $Y$ is weakly inextensible at the world $h$ iff $h\cdot Y$ is
  weakly inextensible at $1$. Also $(h\cdot Y)_k=Y_{k\circ h}$ and
  $(h\cdot Y)_1=Y_h$.
- Weak inextensibility at $1$ of $Y'$ asks: if $Z$ holds necessarily of every
  member of $Y'_1$, then $Y'_k\subseteq Z_k$ for every $k$. The antecedent
  means $k\cdot\bar q\in Z_k$ for every $\bar q\in Y'_1$ and every arrow $k$.
- Let $Z$ be pinned down by $U$. To show $\bar r\in Z_k$ it suffices to find
  $\bar q\in Y'_1$ and an arrow $k''$ agreeing with $k$ on $U$ with
  $k''\cdot\bar q=\bar r$. Then $\bar r\in Z_{k''}=Z_k$.
- So $Y$ is inextensible if the following holds:

  > For all arrows $h,k$, every $\bar r\in Y_{k\circ h}$ and every finite
  > $U$, there are $\bar q\in Y_h$ and an arrow $k''$ agreeing with $k$ on
  > $U\cup h[S]$ with $k''\cdot\bar q=\bar r$.

  This is a finitary form of the old-image criterion in the write-up of
  `finite-support-sections-and-projection`. Every world's new extension must
  be covered by transports of the old one.

**Verification.**

1. **Every extension of $Y$ lies in the hull: $Y_w\subseteq(H_E)_w$ for
   every world $w$.**
   - If $w\notin\pi_S$, this holds by definition.
   - If $w\in\pi_S$, take $g\in G$ agreeing with $w$ on $S$. Then
     $X_w=X_g=g\cdot E$, by pinning and (F1). Each $g\cdot\bar c$ with
     $\bar c\in E$ is in $(H_E)_w$, with $m':=g$.
2. **The covering condition.** Take $\bar r\in Y_{k\circ h}$ and a finite
   $U$. By step 1, $\bar r=m'\cdot\bar c$ with $\bar c\in E$ and $m'$
   agreeing with $k\circ h$ on $S$. Let $\bar c$ be pinned down by the
   finite $T$.
   - **Case $h\in\pi_S$.** Take $g\in G$ agreeing with $h$ on $S$, so
     $Y_h=X_h=g\cdot E$.
     - By B2 (below), pick $\tau\in G$ fixing $S$ pointwise with
       $\tau[T\setminus S]$ disjoint from $g^{-1}[U]$. Then
       $\tau\cdot\bar c\in E$ by (F2).
     - Put $\bar q:=g\cdot\tau\cdot\bar c$. It is in $g\cdot E=Y_h$.
     - Let $k''$ equal $k$ on $U\cup h[S]$, and send $g\tau(t)$ to $m'(t)$
       for $t\in T\setminus S$.
     - This is consistent: $g\tau[T\setminus S]$ is disjoint from $U$ by the
       choice of $\tau$, and from $h[S]=g[S]$ because $\tau$ fixes $S$.
     - $k''$ is prescribed on a finite set, so it extends to a surjection.
   - **Case $h\notin\pi_S$.** Here $Y_h=(H_E)_h$.
     - Let $n$ agree with $h$ on $S$, and send $T\setminus S$ injectively to
       fresh points outside $U\cup h[S]$. Put $\bar q:=n\cdot\bar c$. It is
       in $(H_E)_h$.
     - Let $k''$ equal $k$ on $U\cup h[S]$, and send $n(t)$ to $m'(t)$ for
       $t\in T\setminus S$.
   - **Both cases.** The composite that carries $\bar c$ to $k''\cdot\bar q$
     agrees with $m'$ on $T$:
     - on $s\in S$ it gives $k(h(s))=m'(s)$;
     - on $T\setminus S$ it gives $m'$ by construction.
     
     Since $\bar c$ is pinned down by $T$, $k''\cdot\bar q=m'\cdot\bar c=\bar r$.

So $Y$ is inextensible and coextensive with $X$.

**Assumptions used, and a comparison.**

- The arrows are all the surjections, so any consistent finite prescription
  extends to an arrow.
- $(\mathbb N,\sim)$ is homogeneous, so the pattern-preserving worlds are
  relabellings of worlds fixing $S$.
- B2 holds: a symmetry fixing $S$ pointwise can move any finite set off any
  finite set.
- In `symmetric-all-surjections`, $\pi_S$ is just $\delta_S$. So this
  witness differs from the recorded one only at the worlds collapsing $S$,
  where it takes the hull instead of $\varnothing$.

## The other verdicts

- **BF, at every type.** The arrows are surjective. The draft's argument
  that surjective arrows give BF works for any symmetry group; the witnessing
  intension is symmetric by composing with $g$.
- **No Pure Contingency.** There is one object, and the denotation $p$ of a
  closed pure sentence is pinned down by $\varnothing$. So $h\cdot p=p$ for
  every arrow $h$, and $p$ is true iff it contains every arrow. The boxed
  forms of BF and Boolean Completeness follow.
- **Boolean Completeness, at every type.** Apply Theorem 36 with the
  constant closure $M_0=\varnothing$. It has two hypotheses.
  - *Amalgamability.* As in Base 1, no finite set separates any arrow, since
    some non-injective surjection agrees with any arrow on a finite set.
    Every finite set is amalgamable, because the required arrow is
    prescribed only on a finite set, consistently. This uses only the arrows.
  - *B2, moving points.* Given finite $N,P,Q$, some $g\in G$ fixes $N$
    pointwise and has $g[P\setminus N]\cap Q=\varnothing$. Move each point of
    $P\setminus N$, within its own infinite class, to distinct fresh points
    outside $N\cup Q$. A permutation that fixes every class setwise is an
    automorphism.
- **Actuality fails.** By Proposition 22, Actuality holds iff $G$, as a set
  of arrows, is finitely pinned. No finite set pins it down, since on any
  finite set some non-injective surjection agrees with the identity.
- **Atomlessness holds, so Atomicity fails at type $t$.** This is the Base 1
  argument, which uses only the arrows.
  - Let $p$ be nonzero and pinned down by a nonempty finite $V$, with
    $m\in V$ and $x\notin V$.
  - Then $q:=p\cap\{h : hx=hm\}$ is symmetric and pinned down by
    $V\cup\{x\}$.
  - Members of $p$ can be modified at $x$ alone, so $\bot<q<p$.
- **ND fails at type $e$.** For distinct $m,n$, the proposition
  $\{h : hm=hn\}$ is nonzero.
- **Relational Choice fails**, at types $(e\to t,e)$, by the Base 1 argument.
  - Let $S$ be a functional subrelation of
    $U:=\lambda Xy\,.\,Xy\lor\neg\exists z\,.\,Xz$, pinned down by $N$.
  - The property $A$ of not belonging to $N$ is in the domain, and $S$
    relates it to some $y\notin N$.
  - Some $y'\ne y$ in the class of $y$ lies outside $N$. The transposition of
    $y$ with $y'$ is in $G$, fixes $N$ pointwise and fixes $A$.
  - So $S$ relates $A$ to $y'$ too, and $S$ is not functional.

## Derived verdicts

- The engine adds Weakly Inextensible Comprehension and its boxed form,
  which hold.
- Vicinity fails: with Weakly Inextensible Comprehension it would give
  Actuality.
- □Transversal, Transversal Choice and its boxed form fail.

## Left open

- The Axiom of Infinity at type $e$.
- The signature schemata: no interpretation of Σ has been fixed.
