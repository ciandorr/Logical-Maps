# Symmetric ideally-full model: old and new individuals

This model was found by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr on 6 October 2026, in
a session with Cian Dorr, as a countermodel to a principle from another
context. It satisfies □Strong Actuality and refutes Inextensible
Comprehension. Claude Opus 5.5 (Anthropic) added the remaining verdicts the
same day, and corrected the argument for the failure of Inextensible
Comprehension. No Lean verification is claimed.

The verdicts that matter most for the map are these. Atomicity holds at every
type, and so does ND, while Inextensible Comprehension fails. So Atomicity +
Actuality, with ND and □Strong Actuality added, does not imply Inextensible
Comprehension.

## The model

It is a symmetric ideally-full intensional action model in the sense of
Dorr's draft *Boolean Completeness does not imply Rigid Comprehension*
(Definitions 15–18, p. 8). By that draft's Proposition 20 it is a model of C.

There are two objects:

- $E$, whose individuals are $\mathbb N$;
- $O$, whose individuals are $\mathbb N\sqcup\mathbb N'$, where $\mathbb N'$
  is a disjoint copy of $\mathbb N$.

At $O$, members of $\mathbb N$ are called *old* and members of $\mathbb N'$
are called *new*.

The arrows are functions, and the action on individuals is the identity
action.

| From | To | Arrows |
| --- | --- | --- |
| $E$ | $E$ | all injections $\mathbb N\to\mathbb N$ |
| $E$ | $O$ | the injections with range among the old individuals |
| $O$ | $E$ | all injections $\mathbb N\sqcup\mathbb N'\to\mathbb N$ |
| $O$ | $O$ | $G_O$, the permutations preserving old and new; and $K$, the injections with range among the old |

These arrows are closed under composition. A composite that passes through
$E$ and ends at $O$ lands among the old individuals, and so does any composite
with a member of $K$.

The symmetry groups are $G_E=\mathrm{Sym}(\mathbb N)$ and $G_O$. Both objects
carry the ideal of finite sets.

An intension $D$ at an object $W$ is a set of tuples $\langle\bar a,h\rangle$,
where $h$ is an arrow out of $W$ and $\bar a$ are entities at the target of
$h$. The domain at $W$ consists of the intensions that satisfy two conditions:

- **Symmetric.** If $\langle\bar a,h\rangle\in D$, then
  $\langle g\cdot\bar a,g\circ h\rangle\in D$ for every $g$ in the symmetry
  group of $h$'s target. Here $g$ acts on entities by transport.
- **Finitely pinned.** For some finite $N\subseteq W^e$, whenever two arrows
  $h,h'$ with a common target agree on $N$, we have
  $\langle\bar a,h\rangle\in D\iff\langle\bar a,h'\rangle\in D$. This is
  Definition D.2.

The evaluation point is $1_E$. Call an arrow out of $E$ with target $O$
"an arrow to $O$", and so on.

**Single classes.** Two facts drive most of what follows:

- Any finite partial injection of $\mathbb N$ extends to a member of $G_E$.
- Any finite partial injection of $\mathbb N\sqcup\mathbb N'$ that preserves
  old and new extends to a member of $G_O$.

Let $D$ be a symmetric proposition pinned down by $N$ that contains an arrow
$h$. Then $D$ contains every arrow $h'$ of the same kind. To see this, choose
a symmetry $g$ with $g(h(n))=h'(n)$ for $n\in N$. Then $g\circ h\in D$, and
$g\circ h$ agrees with $h'$ on $N$.

Here "kind" means one of the following:

- into $E$;
- from $E$ into $O$;
- in $G_O$;
- in $K$.

Arrows of different kinds differ in target. The one exception is $G_O$ versus
$K$, which are separated by the proposition "the arrow sends $0'$ to a new
individual", pinned down by $\{0'\}$.

So the propositions are as follows:

- **At $E$:** the four unions of $\mathrm{Hom}(E,E)$ and $\mathrm{Hom}(E,O)$.
- **At $O$:** the eight unions of $\mathrm{Hom}(O,E)$, $G_O$ and $K$.

The model therefore meets the conditions finitely-many-propositions and
finitely-many-propositions-everywhere.

## □Strong Actuality (Fable)

Write $f^*p:=\{k: k\circ f\in p\}$ for the transport of a proposition $p$
along an arrow $f$.

**At $E$.** Let $w_E:=\mathrm{Hom}(E,E)$. It is true at $1_E$.

- Along an arrow $f$ to $E$, $f^*w_E=\mathrm{Hom}(E,E)$, since every arrow
  from $E$ to $E$ composed with $f$ is again an arrow from $E$ to $E$.
- Along an arrow $f$ to $O$, $f^*w_E=\mathrm{Hom}(O,E)$.

Both transports are atoms at their targets. So every proposition there
contains or excludes each transport, and $w_E$ is a true strong atom.

**At $O$.** The proposition $G_O$ is true at $1_O$.

- Along a member of $G_O$, its transport is $G_O$ again.
- Along a member of $K$, its transport is empty: a composite with a member of
  $K$ misses every new individual, so it is not in $G_O$.
- Along an arrow to $E$, its transport is empty, since a composite of an
  arrow to $E$ with an arrow back to $O$ lands in $K$.

So $G_O$ is a true strong atom.

Every world sees only $E$ and $O$. Strong Actuality is a closed sentence, so
its truth at an arrow depends only on the arrow's target. Hence □Strong
Actuality holds.

The actual world at $E$ is $\mathrm{Hom}(E,E)$, which properly contains
$\{1_E\}$, so the arrows from $E$ to $E$ that are not surjective are
actual-world arrows. The singleton of the identity is not pinned, and neither
is the symmetry group $G_E$ as a set of arrows. So the model does not meet
the group's condition symmetry-group-pinned. That condition's argument is
not needed here, since Actuality follows from Strong Actuality.

## ND at every type at $E$

Call an arrow $f:E\to V$ *finitely invertible* if it satisfies the following:
for every arrow $h:E\to U$ and every finite $N\subseteq\mathbb N$, there is an
arrow $k:V\to U$ with $k\circ f$ agreeing with $h$ on $N$.

Every arrow out of $E$ is finitely invertible. In each case we define $k$ on
$f(N)$ by $k(f(n)):=h(n)$ and extend it to an arrow of the right kind:

- If $f$ and $h$ both go to $E$, extend to an injection.
- If $f$ goes to $E$ and $h$ to $O$, extend to an injection into the old
  individuals; this works because $h(N)$ is old.
- If $f$ goes to $O$ and $h$ to $E$, extend to an injection
  $O^e\to\mathbb N$.
- If $f$ and $h$ both go to $O$, extend to a member of $K$. Both $f(N)$ and
  $h(N)$ are old.

Now let $X\ne Y$ be entities of a relational type at $E$, both pinned down by
$N$. They differ at some tuple $\langle\bar a,h\rangle$. Take $k$ as above.
The transport $f\cdot X$ contains $\langle\bar a,k\rangle$ iff $X$ contains
$\langle\bar a,k\circ f\rangle$. By pinning, that holds iff $X$ contains
$\langle\bar a,h\rangle$, and likewise for $Y$. So $f\cdot X\ne f\cdot Y$.

At type $e$, every arrow is injective. So transport along every arrow out of
$E$ is injective at every type, and ND holds at $E$. The map derives ND at
$t$, B, 5 and the pure B schema from this.

ND at $t$ fails at $O$, and so □ND at $t$ fails at $E$. A member $f$ of $K$
gives $f^*G_O=\emptyset=f^*\emptyset$.

## Atomicity at every type, at both objects

Fix an object $W$ (either $E$ or $O$), a relational type, and a finite
$M\subseteq W^e$. Let $D_M$ be the set of entities pinned down by $M$. It is
closed under arbitrary unions and under complement, so it is a complete
atomic Boolean algebra. Its atoms are the classes of an equivalence relation
on tuples, which is generated by two kinds of step:

- the symmetry steps
  $\langle\bar a,h\rangle\sim\langle g\cdot\bar a,g\circ h\rangle$;
- the pinning steps $\langle\bar a,h\rangle\sim\langle\bar a,h'\rangle$, for
  $h,h'$ agreeing on $M$.

A symmetry step after a pinning step can be traded for a pinning step after a
symmetry step. So the class of $\langle\bar a,h\rangle$ is

$$
c_M(\bar a,h)=\{\langle g\cdot\bar a,h'\rangle : g\in G_V,\ h'\text{ agrees with }g\circ h\text{ on }M\},
$$

where $V$ is the target of $h$.

A class $c_M$ is an atom of the whole domain if it is *stable*, meaning that
$c_{M'}(\bar a,h)=c_M(\bar a,h)$ for every finite $M'\supseteq M$. Indeed,
suppose a nonzero $Z\subseteq c_M$ in the domain is pinned down by $M''$.
Then $Z$ is a union of $(M\cup M'')$-classes, and the only one inside $c_M$
is $c_M$ itself.

Let $P\subseteq V^e$ be the union of finite pinning sets of the arguments
$\bar a$, where an individual argument pins itself. Let $\mathrm{Reach}(h)$
be the set of individuals that some arrow of $h$'s kind can take as a value:

- all of $V^e$ for arrows into $E$ and for $G_O$;
- the old individuals for arrows from $E$ into $O$ and for $K$.

**Claim.** The class $c_M(\bar a,h)$ is stable provided three conditions
hold:

1. $h(M)\supseteq P\cap\mathrm{Reach}(h)$;
2. when $W=O$, $M$ contains a new individual;
3. $h$ is injective, which it always is.

*Proof.* Let $M'\supseteq M$, and let $h'$ agree with $h$ on $M$. We need a
symmetry $s$ satisfying three conditions:

- $s\cdot\bar a=\bar a$;
- $s$ fixes $h(M)$ pointwise;
- $s(h(m'))=h'(m')$ for $m'\in M'\setminus M$.

By condition 2, $h$ and $h'$ are of the same kind. Indeed, if $W=O$, a new
individual in $M$ goes to a new one under members of $G_O$ and to an old one
under members of $K$.

Now take $m'\in M'\setminus M$. The values $h(m')$ and $h'(m')$ lie in
$\mathrm{Reach}(h)$ outside $h(M)$, by injectivity. By condition 1 they lie
outside $P$. They also have the same status. For members of $G_O$ this is the
status of $m'$; otherwise every value in $O$ is old, and $E$ has no statuses.

So the finite partial injection that fixes $P\cup h(M)$ and sends each
$h(m')$ to $h'(m')$ preserves status. It therefore extends to a symmetry $s$.
A symmetry fixing $P$ pointwise fixes each argument, since transport along
an arrow that agrees with the identity on a pinning set is the identity.
So $\langle\bar a,h'\rangle\in c_{M'}(\bar a,h)$.

In general, an element of $c_M$ has the form $\langle g\cdot\bar a,h''\rangle$
with $h''$ agreeing with $g\circ h$ on $M$. Applying $g^{-1}$ reduces this to
the case just treated. $\square$

**Every nonzero entity has a stable class below it.** Let $X\ne\emptyset$ be
pinned down by $N$, and let $\langle\bar a,h\rangle\in X$. Choose finitely
many fresh points of $W^e\setminus N$, including a new one when $W=O$. Choose
an arrow $h'$ of $h$'s kind that agrees with $h$ on $N$ and sends the fresh
points onto $P\cap\mathrm{Reach}(h)\setminus h(N)$, with each status going to
the same status. This is possible for each kind, since an injection, an
injection into the old individuals, or a status-preserving permutation can be
prescribed on finitely many points.

Then $\langle\bar a,h'\rangle\in X$ by pinning. Let $M$ be $N$ together with
the fresh points. The class $c_M(\bar a,h')$ is stable. It lies inside $X$,
because $X$ is symmetric and pinned down by $N\subseteq M$, so it is a union
of $M$-classes. Hence $c_M(\bar a,h')$ is an atom below $X$.

So Atomicity holds at every relational type at $E$ and at $O$. Atomicity is
closed, so □Atomicity holds as well. The argument does not depend on what the
individuals are, so it holds in the variant with one individual too.

## Inextensible Comprehension fails (corrected)

Fable's summary named the property of being old. That property does not by
itself refute Inextensible Comprehension: it is weakly inextensible at $E$.
The failure is the following.

Let $X$ be the universal property of individuals at $E$, and suppose $Y$ is
coextensive with $X$ and inextensible. Let $Y$ be pinned down by $N$.

1. **$Y(f)=\mathbb N$ for every arrow $f$ to $E$.** Take a permutation $g$
   agreeing with $f$ on $N$. Then $Y(g)=g\,Y(1_E)=\mathbb N$, and by pinning
   $Y(f)=Y(g)$.
2. **$Y(\iota)$ is old, for $\iota$ the inclusion of $\mathbb N$ into $O$.**
   Being old is pinned down by $\emptyset$, and every individual of $E$
   necessarily has it, since arrows into $O$ from worlds over $E$ land among
   the old. By weak inextensibility at $E$, $Y\le$ old there. So $0'\notin
   Y(\iota)$.
3. **$Y$ is not weakly inextensible at $\iota$.** Let $Z:=\lambda y\,.\,y\ne
   0'$, in the domain at $O$, since it is symmetric under $G_O$ and pinned
   down by $\{0'\}$. Every $Y$-thing at $\iota$ is distinct from $0'$, and
   necessarily so, since all arrows are injective. Now take any $m:O\to E$.
   At the world $m\circ\iota$, which is an arrow to $E$, $Y$ holds of
   $m(0')$, by step 1. But $Z$ fails of $m(0')$ there.

So no coextensive $Y$ is inextensible. This argument uses the individuals,
so it is recorded for the base individuals only.

## BF at $t$ and Strong Atomicity fails

**BF at $t$.** Every transport from $E$ to $O$ lies among $\emptyset$,
$\mathrm{Hom}(O,E)$, $\mathrm{Hom}(O,O)$ and $\top$, and never equals $G_O$.
Let $X$ be the property of propositions that holds of every proposition at an
arrow to $E$, and of every proposition other than $G_O$ at an arrow to $O$.
It is symmetric, because $G_O$ is invariant under $G_O$, and it is pinned down
by $\emptyset$. Then $\forall p\,.\,\Box Xp$ holds at $E$, while at $\iota$
the proposition $G_O$ lacks $X$.

**Strong Atomicity at $t$.** The proposition $\mathrm{Hom}(E,O)$ is possible,
and its only nonzero part is itself. Along $\iota$ it becomes $G_O\cup K$,
which $G_O$ neither contains nor excludes. So it is not a strong atom.

## Boolean Completeness holds at $E$ and fails at $O$

*Corrected 24 October 2026.* This section previously argued that Boolean
Completeness fails at $E$ at $e\to t$, using the haecceities of the even
numbers. That family is not a property in the model: a property pinned down by
a finite $N$ has an extension invariant under the symmetries fixing $N$, and
the set of even numbers is not. Boolean Completeness holds at $E$ at every
type, and fails at $O$. The corrected arguments are by GPT-6 Astra (OpenAI),
prompted by Daniel Kodsi, 22 October 2026, checked and written out by Claude
Opus 5.5 (Anthropic), prompted by Cian Dorr.

Write $\iota:E\to O$ for the inclusion into the old individuals, and for a
finite $S\subseteq\mathbb N$ let $\mathrm{Fix}_E(S)$ be the permutations of
$\mathbb N$ fixing $S$ pointwise, and $\mathrm{Fix}_O(\iota S)$ the members of
$G_O$ fixing $\iota S$ pointwise. Each permutation acts on the tuple domains by
transport.

**Entities at $E$ are pairs.** Fix a relational type $\tau$. An entity $F$ of
type $\tau$ at $E$, pinned down by $S$, is determined by

$$
A_F:=F_{1_E},\qquad B_F:=F_\iota ,
$$

with $A_F$ invariant under $\mathrm{Fix}_E(S)$ and $B_F$ under
$\mathrm{Fix}_O(\iota S)$. For an arrow $h:E\to E$, extend $h|_S$ to a
permutation $g$; then $F_h=F_g=gA_F$. For $h:E\to O$, whose range is old,
extend the partial injection $\iota s\mapsto h(s)$ to some $\gamma\in G_O$; then
$F_h=F_{\gamma\iota}=\gamma B_F$. Conversely, any pair $(A,B)$ invariant under
$\mathrm{Fix}_E(S)$ and $\mathrm{Fix}_O(\iota S)$ for some finite $S$ defines, by
these formulas, a symmetric intension pinned down by $S$, so an entity at $E$.
Using one extending symmetry for two entities at once,

$$
F\le G\iff A_F\subseteq A_G\ \text{and}\ B_F\subseteq B_G .
$$

**Joins at $E$.** Let $X$ be a property of type $\tau t$ at $E$, pinned down
by $N$, and put

$$
A^*:=\bigcup\{A_F:X_{1_E}(F)\},\qquad B^*:=\bigcup\{B_F:X_{1_E}(F)\}.
$$

A symmetry $g\in\mathrm{Fix}_E(N)$ sends $(A_F,B_F)$ to $(gA_F,\hat gB_F)$, where
$\hat g$ acts as $g$ on old individuals and trivially on new ones, and it
permutes the instances of $X$. So $A^*$ is invariant under $\mathrm{Fix}_E(N)$,
and $B^*$ under the old-coordinate symmetries fixing $\iota N$. Each $B_F$ is
pinned down by old points, so it is invariant under all permutations of the new
individuals, and so is $B^*$. These two kinds of permutation generate
$\mathrm{Fix}_O(\iota N)$. So $(A^*,B^*)$ is an entity $J$, and by the order
criterion $J$ is the least upper bound of the instances of $X$. So Boolean
Completeness holds at $E$, at every relational type.

**Failure at $O$.** Let $D$ be the property of individuals that holds of every
individual at arrows into $E$ and of the old individuals at arrows into $O$; it
is symmetric and pinned down by $\emptyset$. At $1_O$ the property

$$
X:=\lambda F^{et}\, .\,\exists x\, .\,Dx\land F=\lambda y\, .\,y=x
$$

has as instances the haecceities $\eta_a$ of the old individuals $a$. Suppose
$L$, pinned down by a finite $S$, were their least upper bound. Take an old
$n\notin S$, a new $m\notin S$, and an injection $h:O\to E$. Some injection
$h':O\to E$ agrees with $h$ on $S$ and has $h'(n)=h(m)$. As $\eta_n\le L$,
$L_{h'}$ contains $h'(n)=h(m)$, and by pinning so does $L_h$. But
$\lambda y\, .\,y\ne m$ is an upper bound of every $\eta_a$ with $a$ old, and its
extension at $h$ omits $h(m)$. This contradicts the leastness of $L$. So
Boolean Completeness fails at $O$ at $e\to t$, and as $O$ is reachable from $E$,
□Boolean Completeness fails.

With ND, this model shows that ND and Boolean Completeness together do not imply
Inextensible Comprehension, Rigid Comprehension or Tame Rigidity.

## Countable Boolean Completeness holds at $E$

Added by Claude Opus 5.5 (Anthropic) on 16 October 2026, at Cian Dorr's
direction. It holds there for countability relative to every type $\sigma$.
(This section was written when Boolean Completeness was believed to fail at
$E$; since it holds, the argument is now needed only at $O$, below.)

Write $k\cdot x$ for the transport of an entity $x$ along an arrow $k$, so
that $\langle\bar a,h\rangle\in k\cdot x$ iff $\langle\bar a,h\circ k\rangle\in
x$. For a finite $N\subseteq\mathbb N$, let $\mathrm{Fix}(N)$ be the set of
permutations in $G_E$ that fix $N$ pointwise.

**Step 1: the members of a countable property are invariant.** Let $X$ be a
property at $E$ that is countable relative to $\sigma$, witnessed by $R$, and
let a finite $N$ pin down both. Take $x$ with $X(x)$ at $1_E$. Then $R(x,\bar
n)$ at $1_E$ for some numeral $\bar n$ at $\sigma$. Let $g\in\mathrm{Fix}(N)$.

- Numerals denote closed pure terms, so $g\cdot\bar n=\bar n$.
- By symmetry, $\langle g\cdot x,\bar n,g\rangle\in R$ and $\langle g\cdot
  x,g\rangle\in X$.
- The arrows $g$ and $1_E$ agree on $N$ and have the same target, so by
  pinning, $R(g\cdot x,\bar n)$ and $X(g\cdot x)$ hold at $1_E$.

$R$ is injective on the instances of $X$ at $1_E$, so $g\cdot x=x$.

**Step 2: invariance shrinks pinning sets.** Suppose $x$ is pinned down by a
finite $M$ and $g\cdot x=x$ for every $g\in\mathrm{Fix}(N)$. We show that $x$
is pinned down by $M\cap N$.

Let $h,h'$ be arrows out of $E$ with a common target that agree on $M\cap N$.
Every arrow into $E$ is an injection into $\mathbb N$, and every arrow into $O$
an injection into the old individuals.

1. Choose $g\in\mathrm{Fix}(N)$ sending the points of $M\setminus N$ outside
   $N\cup M$ and outside $h^{-1}(h'(M))$.
2. Choose distinct fresh points $p_m$, one for each $m\in M\setminus N$,
   outside $N\cup M\cup g(M)$. Let $h''$ be an arrow with the target of $h$
   that agrees with $h\circ g$ on $M$ and sends each $p_m$ to $h'(m)$. The
   prescribed values are distinct: $h'$ is injective and agrees with $h$ on
   $M\cap N$, and step 1 kept $h(g(M\setminus N))$ away from $h'(M)$. So $h''$
   can be taken injective, with old range when the target is $O$.
3. Let $g'\in\mathrm{Fix}(N)$ swap each $m\in M\setminus N$ with $p_m$. Then
   $h''\circ g'$ agrees with $h'$ on $M$.

Pinning by $M$ and invariance give
$x(h)=x(h\circ g)=x(h'')=x(h''\circ g')=x(h')$.

**Step 3: the join.** By steps 1 and 2, every instance of $X$ at $1_E$ is
pinned down by $N$. Their union $J$, tuple by tuple at each arrow, is
symmetric, being a union of symmetric intensions, and is pinned down by $N$.
So $J$ is in the domain. At $1_E$, $Y\le Z$ is inclusion at every arrow out of
$E$, so $J$ is the least upper bound of $X$.

This is the Fraenkel–Mostowski phenomenon: in a permutation model, a set of
atoms is countable only if it is finite.

**At $O$, so □Countable Boolean Completeness holds.** The worlds reachable
from $1_E$ are the arrows into $E$ and into $O$, and a closed sentence holds at
an arrow iff it holds at the identity of its target. So it remains to run the
argument at $1_O$, with $G_O$, the permutations preserving old and new, as the
symmetry group. Step 1 is unchanged. Step 2 fails as stated: the proposition
$G_O$ is pinned down by $\{0'\}$ and invariant under all of $G_O$, but not
pinned down by $\emptyset$. Repair it by enlarging $N$ to contain a new
individual $0'$, which keeps $X$ and $R$ pinned down by $N$, and prove that
an $x$ pinned down by $M$ and invariant under $\mathrm{Fix}(N)$ is pinned down
by $(M\cap N)\cup\{0'\}$, a subset of $N$.

Let $h,h'$ be arrows out of $O$ with a common target that agree on
$(M\cap N)\cup\{0'\}$. If the target is $E$, both are injections into
$\mathbb N$ and the construction of step 2 applies, with each fresh point
$p_m$ of the same sort, old or new, as $m$, so that $g$ and $g'$ lie in $G_O$.
If the target is $O$, then $h$ and $h'$ agree on $0'$, so both send it to a
new individual or both to an old one: both lie in $G_O$, or both in $K$.

- Both in $K$: the prescribed values of $h''$ are all old, and any injection
  into the old individuals is in $K$.
- Both in $G_O$: the prescribed values preserve sort, since $h\circ g$ does and
  $h'(m)$ has the sort of $m$ and of $p_m$. A finite sort-preserving partial
  injection extends to a member of $G_O$.

In either case the chain $x(h)=x(h\circ g)=x(h'')=x(h''\circ g')=x(h')$ goes
through. Step 3 is unchanged. So Countable Boolean Completeness holds at $1_O$
as well, and every closed instance is necessary at $1_E$.

## With one individual: □BC and □Rigid Comprehension

In the variant with a single individual, the failures of Inextensible
Comprehension and of Boolean Completeness at $O$ above disappear. Both used
individuals: the parameter $0'$, and haecceities of infinitely many old individuals.

Call the following four classes of arrows the *kinds*:

- the arrows into $E$;
- the arrows from $E$ into $O$;
- $G_O$;
- $K$.

The kind of a composite is fixed by the kinds of its factors.

**Claim.** At each object, every entity of each type is a union of classes,
one class for each kind of arrow and each tuple of arguments. Every entity is
fixed by every symmetry, and each domain is finite.

*Proof, by induction on types.* The single individual is fixed by every
symmetry. Suppose the arguments at every object are fixed by every symmetry,
and there are finitely many of them.

1. **Classes are determined by kind.** The class of a tuple
   $\langle\bar a,h\rangle$ under pinning by $M$ is the orbit of
   $(\bar a,h\restriction M)$. Since $\bar a$ is fixed, the orbit is
   determined by the kind of $h$. At $O$ this needs $M$ to contain a new
   individual, which separates $G_O$ from $K$. Larger $M$ split nothing
   further.
2. **The domain is finite.** An entity is a union of such classes, and there
   are finitely many of them.
3. **Entities are fixed by symmetries.** Precomposing with a symmetry
   preserves kinds, so every entity is fixed by every symmetry. This carries
   the induction to the next type. $\square$

So every domain is a finite Boolean algebra, hence complete. BC holds at $E$
and at $O$, and so does □BC.

**Transport depends only on kind.** The transport of an entity along an arrow
depends only on the arrow's kind, since kinds of composites are determined by
the kinds of their factors.

**Rigid Comprehension.** Given $X$ at an object, let $Y$ be the intension
whose extension at $h$ is the transport along $h$ of $X$'s extension at the
identity. This is the witness used for full action models.

- $Y$ is a union of classes, so it is in the domain.
- $Y$ is coextensive with $X$.
- $Y$ is persistent, since its extension at $h\circ j$ is its extension at
  $h$ transported along $j$.
- $Y$ is inextensible. Suppose every $Y$-thing at a world is necessarily
  $Z$. Then at every later world, each $Y$-thing is the transport of one of
  them, so it is $Z$ there.

This works at both objects, so □Rigid Comprehension holds.

## Other verdicts

- The group's shared arguments give the failure of Relational Choice
  (transposable) and the Axiom of Infinity at $e$.
- The topic's general arguments for finitely many propositions give the
  failure of the Infinity schema, the Axiom of Infinity and Possible Infinity
  at $t$.
- The map derives the rest, including the failure of No Pure Contingency
  (ND holds at $t$ and □ND at $t$ fails) and of the Distinctness-preserving
  collapse (Actuality holds and Inextensible Comprehension fails).

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. The symmetric ideally-full models, of which this is one, on a new two-object category.
