# Symmetric ideally-full model: infinitely many infinite classes

Construction idea: Cian Dorr, 27 September 2026, with Claude Opus 5.5
(Anthropic), who chose the structure and wrote the verification below. The
framework and the lemmas cited are from Dorr, *Boolean Completeness does not
imply Rigid Comprehension*, draft of 30 July 2026, §3 and the section on the
Boolean Completeness theorem. Not independently checked.

## The base

There is one object, $\mathbb N$, carrying an equivalence relation $\sim$
with infinitely many classes, each of them infinite. The arrows are all the
surjections $\mathbb N\to\mathbb N$, as in the draft's Base 1. The symmetry
group is $G:=\mathrm{Aut}(\mathbb N,\sim)$, the permutations that map
$\sim$-classes onto $\sim$-classes. Its members are arrows, so this is a
base in the draft's sense. The model is the associated symmetric ideally-full
model, whose domains hold the symmetric intensions pinned down by some finite
set. Such a premodel is a model of C for every base. The evaluation point is
the identity arrow.

Two facts from the draft are used throughout.

- **Least pinning sets.** When every function from a finite subset of
  $\mathbb N$ to $\mathbb N$ extends to an arrow, two finite sets that pin
  $A$ down have an intersection that pins it down. This is the aside on
  least pinning sets in the draft's section on hulls. It uses only the
  arrows, not $G$, so each element $A$ has a least finite pinning set $T_A$.
  Because $gA$ is pinned down by $g[T_A]$ for $g\in G$, as in Lemma 21, we
  get $T_{gA}=g[T_A]$.
- **Orbits and extensions.** If $F$ is pinned down by $M_F$ and $g\in G$
  fixes $M_F$ pointwise, then the extension of $F$ at the identity is closed
  under $g$. This is the orbit lemma before Theorem 36. For $Y$ of type
  $e\to t$, symmetry gives $\mathrm{ext}(gY)=g[\mathrm{ext}(Y)]$. If $Y$ is
  pinned down by $T$, every $g\in G$ fixing $T$ pointwise agrees with the
  identity on $T$, so $gY=Y$ and $\mathrm{ext}(Y)$ is closed under $g$.

## Transversal fails at type $e$

**Classes are extensions.** Let $R:=\{\langle y,z,i\rangle : y\sim z\}$.
It is pinned down by $\varnothing$, since its membership condition does not
mention the arrow. It is symmetric, since every $g\in G$ preserves $\sim$.
For an individual $a$, the property
$X_a:=\{\langle y,i\rangle : y\sim i(a)\}$, which is $\lambda y\,.\,R\,y\,a$,
is in the domain and pinned down by $\{a\}$. Its extension at the identity
is the class of $a$.

**No classifier.** Let $F\in W^{(e\to t)\to t}$ be pinned down by the finite
set $M_F$. Choose a class $C$ disjoint from $M_F$ and some $a\in C$.
Suppose that $Y$ is the unique member of the extension of $F$ that is
coextensive with $X_a$. Let
$H:=\{g\in G : g \text{ fixes } M_F \text{ pointwise and } g[C]=C\}$.

1. For $g\in H$, $gY$ is in the extension of $F$ by the orbit lemma. Its
   extension is $g[C]=C$. By uniqueness, $gY=Y$.
2. Hence $T_Y=T_{gY}=g[T_Y]$, so $T_Y$ is a finite $H$-invariant set.
3. Every point outside $M_F$ has an infinite $H$-orbit. $H$ contains every
   permutation of $C$ extended by the identity. For each other class $D$,
   it contains every permutation of $D\setminus M_F$, which is infinite.
   Hence $T_Y\subseteq M_F$.
4. By the second fact, $C=\mathrm{ext}(Y)$ is closed under every $g\in G$
   fixing $M_F$ pointwise. But the $g$ that exchanges $C$ with another class
   disjoint from $M_F$, by some bijection, and is the identity elsewhere,
   fixes $M_F$ and moves $C$. This is a contradiction.

So no $F$ in the domain witnesses Transversal at type $e$. Uniqueness is
essential in step 1. The argument does not refute the existence half.

## The other verdicts

- **BF, at every type.** The arrows are surjective, and the draft's argument
  that surjective arrows give BF works for any symmetry group. The
  witnessing intension is symmetric by composing with $g$.
- **No Pure Contingency.** There is one object, and the denotation of a
  closed pure sentence is pinned down by $\varnothing$. So $h\cdot p=p$ for
  every arrow $h$, and $p$ is true iff it contains every arrow. The boxed
  forms of BF and Boolean Completeness follow.
- **Boolean Completeness, at every type.** Apply Theorem 36 with the
  constant closure $M_0=\varnothing$. Two conditions are needed:
  - *Amalgamability.* As in Base 1, no finite set separates any arrow, since
    some non-injective surjection agrees with any arrow on a finite set.
    Every finite set is amalgamable, because the required arrow is
    prescribed only on a finite set, consistently. This uses only the arrows.
  - *Moving points.* Given finite $N,P,Q$, some $g\in G$ fixes $N$
    pointwise and has $g[P\setminus N]\cap Q=\varnothing$. Move each point
    of $P\setminus N$ within its own class, which is infinite, to distinct
    fresh points outside $N\cup Q$. A permutation that fixes every class
    setwise is an automorphism.
- **Actuality fails.** By Proposition 22, Actuality holds iff $G$, as a set
  of arrows, is finitely pinned. No finite set pins it down, since on any
  finite set some non-injective surjection agrees with the identity.
- **Atomlessness, and so Atomicity at type $t$ fails.** This is the Base 1
  argument, which uses only the arrows. Let $p$ be nonzero and pinned down
  by a nonempty finite $X$, with $m\in X$ and $x\notin X$. Then
  $q:=p\cap\{h : hx=hm\}$ is symmetric and pinned down by $X\cup\{x\}$.
  Members of $p$ can be modified at $x$ alone, so $\bot<q<p$.
- **ND fails at type $e$.** For distinct $m,n$, the proposition
  $\{h : hm=hn\}$ is nonzero.
- **Relational Choice fails**, at types $(e\to t,e)$, by the Base 1
  argument.
  - Let $S$ be a functional subrelation of
    $U:=\lambda Xy\,.\,Xy\lor\neg\exists z\,.\,Xz$, pinned down by $N$.
  - The property $A$ of not belonging to $N$ is in the domain, and $S$
    relates it to some $y\notin N$.
  - Some $y'\ne y$ in the class of $y$ lies outside $N$. The transposition
    of $y$ with $y'$ is in $G$, fixes $N$ pointwise and fixes $A$.
  - So $S$ relates $A$ to $y'$ too, and $S$ is not functional.

## Derived verdicts

The engine adds Weakly Inextensible Comprehension and its boxed form, which
hold, and Vicinity, which fails. Vicinity with Weakly Inextensible
Comprehension would give Actuality.

## Left open

- **Inextensible Comprehension.** The Base 1 argument relabels by
  arbitrary permutations fixing a finite set, and those are no longer all
  symmetries here.
- **The Axiom of Infinity at type $e$.**
- **Signature schemata.** No interpretation of Σ has been fixed.
