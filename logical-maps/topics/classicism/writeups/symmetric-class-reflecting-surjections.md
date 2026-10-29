# Symmetric ideally-full model: class-reflecting surjections of infinitely many infinite classes

Cian Dorr proposed this model on 16 October 2026. He wanted a model of C in
which each individual is contingently distinct from some other, but no
functional relation takes each individual to one contingently distinct from
it. Claude Opus 5.5 (Anthropic) fixed the arrows and wrote this
verification the same day. No Lean verification is claimed.

## The model

It is a symmetric ideally-full intensional action model in the sense of
Dorr's draft *Boolean Completeness does not imply Rigid Comprehension*
(Definitions 15–18, p. 8). By its Proposition 20 it is a model of C; for one
object, that needs only a monoid of maps on the base and a group of
permutations inside it.

- **Base.** One object, $\mathbb N$, with an equivalence relation $E$ that has
  infinitely many classes, each infinite. Write $[x]$ for the class of $x$.
- **Arrows.** The surjections $h$ that *reflect* $E$: $hx\mathrel E hy$ only if
  $x\mathrel E y$. So an arrow identifies two points only if they lie in one
  class.
  - These are closed under composition: if $kh\,x\mathrel E kh\,y$ then
    $hx\mathrel E hy$, so $x\mathrel E y$.
  - Merely "collapsing only within a class" would not be closed under
    composition. One map could send two classes into one class, and a second
    could then collapse across them.
- **Symmetries.** $\operatorname{Aut}(E)$, the permutations mapping classes
  onto classes. They are arrows, and they form a group.
- **Domains.** Each relational domain holds the intensions that are symmetric
  and pinned down by a finite set. The individuals are the base, acted on
  identically.
- **Evaluation point.** The identity arrow.

Two facts are used throughout:

- **Extension.** A finite partial isomorphism of $(\mathbb N,E)$ extends to a
  member of $\operatorname{Aut}(E)$, because there are infinitely many classes
  and each is infinite.
- **Contingent distinctness.** $x$ and $y$ are contingently distinct iff they
  are distinct and $x\mathrel E y$.
  - If $x\mathrel E y$ and $x\ne y$, a surjection of $[x]$ onto itself that
    identifies them, extended by the identity on the other classes, is an
    arrow.
  - Arrows identify only points in one class, so points in different classes
    stay distinct at every world.

## Every truth is ND-necessary

For finite $N$, let $\delta_N$ be the set of arrows that are injective on $N$
and preserve the pattern of $E$ on $N$:
$n\mathrel E n'\leftrightarrow hn\mathrel E hn'$ for $n,n'\in N$. Reflection
holds for every arrow, so only preservation is a restriction.

- **$\delta_N$ is a true proposition.** It is symmetric, pinned down by $N$,
  and contains the identity.
- **$\Diamond\delta_N=\delta_N$.** Suppose $kh\in\delta_N$. Then $h$ is
  injective on $N$. If $n\mathrel E n'$, then $kh\,n\mathrel E kh\,n'$, so
  $hn\mathrel E hn'$, because $k$ reflects $E$. So $h\in\delta_N$, and the
  other inclusion takes $k=1$.
- **Every truth pinned down by $N$ contains $\delta_N$.** Let $p$ be such a
  truth and $h\in\delta_N$. Then $h|_N$ is a finite partial isomorphism of
  $E$, so it extends to some $\sigma\in\operatorname{Aut}(E)$. By symmetry
  $\sigma=\sigma\circ 1\in p$, and $h$ agrees with $\sigma$ on $N$, so $h\in p$.

So $\Box(\Diamond\delta_N\to p)$ holds, with $\delta_N$ true, and $p$ is
ND-necessary: Truths are ND-necessary holds.

In symmetric-infinite-classes the arrows are all surjections, and this fails.
There, a surjection injective on $\{0,1\}$ can separate the classes of the
images of $0\mathrel E 1$, and nothing undoes that.

## Modalized Relational Choice fails

Let

$$U:=\lambda xy\, .\,(x\ne y\land\Diamond x=y)\lor\forall z\, .\,(z\ne x\to\Box z\ne x).$$

$U$ is necessarily serial by a theorem of C. If some $y$ is contingently
distinct from $x$, then $Uxy$. Otherwise $Uxx$ holds through the second
disjunct.

In this model the second disjunct is false of every individual, at every
arrow, because every class is infinite. Now suppose $S\le U$ were necessarily
functional. At the identity $S$ is then a function $f$ with $f(x)\ne x$ and
$f(x)\mathrel E x$.

1. Let $N$ be a finite set pinning $S$ down, and let $g\in\operatorname{Aut}(E)$
   fix $N$ pointwise. From $\langle x,f(x),1\rangle\in S$, symmetry gives
   $\langle gx,g f(x),g\rangle\in S$. Since $g$ agrees with $1$ on $N$,
   pinning gives $\langle gx,gf(x),1\rangle\in S$. So $f(gx)=g(f(x))$.
2. Take $x$ in a class $C$ disjoint from $N$, and $y'\in C\setminus\{x,f(x)\}$.
   Let $g$ be the transposition of $f(x)$ and $y'$. It fixes $N$ and $x$, so
   $f(x)=f(gx)=g(f(x))=y'$, a contradiction.

So the closed pure sentence

$$P:=\forall x\,\exists y\,(x\ne y\land\Diamond x=y)\land\neg\exists F\,\bigl(\operatorname{Functional}(F)\land\forall x\,y\,(Fxy\to x\ne y\land\Diamond x=y)\bigr)$$

is true at the evaluation point: the first conjunct by the classes being
infinite, the second by the argument above. This is the consistency premise
of maximalism-incompatible-with-modalized-relational-choice.

## Other verdicts

- **No Pure Contingency holds:** the model has one object (general argument).
- **BF holds at every type:** the arrows are surjective (the group's argument
  barcan-surjective).
- **Relational Choice and Transversal fail:** these arguments use only the
  symmetry group, which is that of symmetric-infinite-classes.
- **Intensional Choice fails at type $e$**, by a different witness from
  symmetric-infinite-classes, whose arrows can merge classes.
  - Take $F:=\lambda y\, .\,y\ne n_0\land y\mathrel E n_0$.
  - Use the arrow that collapses $N\cap[n_0]$ onto $n_0$ within its class.
  - A transposition inside $[n_0]$ that avoids the image of the pinning set
    then moves the supposed unique instance.
- **Atomlessness holds.** Split a possible proposition by whether two fresh
  points of one class are sent into one class.
- **The Axiom of Infinity at type $e$ holds**, by the group's argument.

## Weakly Inextensible Comprehension fails

Added later on 16 October, at Cian Dorr's request to see whether the
arguments for Boolean Completeness and Inextensible Comprehension in
symmetric-all-surjections (Base 1) carry over. They do not.

- **Boolean Completeness.** Base 1 gets it from Dorr's hull conditions, and
  (B1) fails here.
- **Inextensible Comprehension.** Base 1's argument needs a transversal lemma:
  an arrow $g$ fixing $S$ pointwise has, for the points of a finite $T$,
  preimages that a symmetry can move them to. When $g$ splits one class over
  two target classes, the preimages of points in both lie in one class, and no
  automorphism of $E$ does the job.

In fact both principles fail, through Weakly Inextensible Comprehension at
type $e\to t$.

Let $X:=\lambda x\, .\,\neg\, x\mathrel E n_0$. It is in the domain, since
$E$ is. Suppose $Y$ is weakly inextensible, coextensive with $X$, and pinned
down by a finite $N$.

1. **$Y\le Z^m$ for each $m\in[n_0]$.** Put
   $Z^m:=\lambda x\, .\,\neg\, x\mathrel E n_0\land\neg\, x\mathrel E m$. Its
   extension at an arrow $k$ is $\mathbb N\setminus([kn_0]\cup[km])$. If $y$ is
   an instance of $Y$, so $y\notin[n_0]$, then $ky\notin[kn_0]\cup[km]$ at
   every arrow $k$, because $k$ reflects $E$. So $Z^m$ holds necessarily of
   every instance of $Y$, and weak inextensibility gives $Y\le Z^m$.
2. **An arrow sending part of $[n_0]$ into a fresh class.** Take a class
   $D\ne[n_0]$ disjoint from $N$, and $m\in[n_0]\setminus N$. Let $k$ be:
   - on $[n_0]$, a map onto $[n_0]\cup D$ that fixes $N\cap[n_0]$ and sends
     $m$ into $D$;
   - the identity on the other classes that meet $N$;
   - on the remaining classes, which are infinitely many, a map onto the
     remaining classes other than $D$, class by class.

   Then $k$ is a surjection, the preimage of each class lies in a single
   class, and $k$ agrees with the identity on $N$.
3. **The contradiction.** By pinning and step 1,
   $Y_1=Y_k\subseteq Z^m_k=\mathbb N\setminus([n_0]\cup D)$. But
   $Y_1=\mathbb N\setminus[n_0]\supseteq D$.

So Weakly Inextensible Comprehension fails. So do Inextensible Comprehension,
which implies it, and Boolean Completeness, since Boolean Completeness implies
it too.

The recorded proof of that last implication takes the least upper bound of the
haecceities of the instances of $X$. That family is not countable in this
model, so the argument says nothing about Countable Boolean Completeness.

## Left open

- **Countable Boolean Completeness.** As in symmetric-old-new-individuals, a
  countable property's instances are invariant under the symmetries fixing a
  finite set. The step from invariance to uniform pinning has to deal with
  arrows that split classes.
- **The rigidity family:** Tame Rigidity, Rigid Power, Rigid Rigidity and
  their weak forms. Their recorded arguments assume all surjections or section
  arrows. Section arrows fail here: when an arrow splits one class across two
  target classes, a section of points in both would have to merge classes.
