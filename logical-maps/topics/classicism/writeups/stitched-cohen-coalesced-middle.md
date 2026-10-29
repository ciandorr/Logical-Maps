# Stitched Cohen model with a coalesced middle world

The construction and verification are by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in a research note of
22 October 2026 that is listed in Daniel Kodsi's pull request #18. OpenAI Codex (GPT-6) integrated it,
also prompted by Daniel Kodsi, in his pull request #21 of 28 October 2026. Claude Fable 5.1 (Anthropic),
prompted by Cian Dorr, audited it on 29 October 2026; the forcing lemma and its proofs below follow
that audit. Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, wrote this version for the map.

At its evaluation point $r$, the model satisfies:

- Rigid Comprehension at every relational type, with any argument types;
- □Strong Atomicity (type $t$), and so □Actuality;
- □BF (type $t$), and BF at type $e$;
- □Relational Choice;
- □Boolean Completeness (type $t$).

It fails:

- □Rigid Comprehension, □Weak Rigid Comprehension and □Boolean Completeness, each at type $et$;
- BF at type $et$, and so BF at relational types;
- Atomicity at type $(et)t$;
- ND at type $t$.

The model's purpose is to bound
[[strong-atomicity-t-rigid-comprehension-and-barcan-relational-imply-necessary-rigid-comprehension]].
That result's premise, BF at relational types, cannot be weakened to □BF (type $t$), even with the
additions listed above.

## The construction

**Metatheory.** Let $V$ be a model of ZFC, let $\mathbb P$ be Cohen forcing, and let $G$ be
$\mathbb P$-generic over $V$, with Cohen real $c\subseteq\mathbb N$. The model is a structure in
$V[G]$, as in the stitched forcing models.

**The category.** There are four objects: $r$, $s$, $A$ and $B$. Besides the identities, the arrows are
$h\colon r\to s$, $a\colon s\to A$, $b\colon s\to B$, and the composites $ah$ and $bh$. Every set of
arrows out of an object is a proposition, so there are sixteen propositions at $r$, eight at $s$, and
two at each of $A$ and $B$.

**The terminals.**

- $A$ is the full extensional one-world hierarchy over $\mathbb N$ built in $V$.
- $B$ is the same hierarchy built in $V[G]$.

**The middle world $s$.** It is the coalesced sum of $A$ and $B$, with the fullest domains.

- Its individuals are $\mathbb N\times\mathbb N$, and $a$ and $b$ act on them as the two projections.
- At a relational type $\tau=\bar\sigma t$,
  $D_{s,\tau}=\mathcal P^{V[G]}(D_{s,\bar\sigma})\times D_{A,\tau}\times D_{B,\tau}$.
- An entity $(F_s,F_A,F_B)$ applied to an argument $\bar x$ gives the proposition
  $(\bar x\in F_s,\ a\bar x\in F_A,\ b\bar x\in F_B)$.

**The root $r$.** It has the same individuals as $s$, and $h$ is the identity on them. Call a
$\mathbb P$-name $u$ *invariant* if $1$ forces $u$ to be an element of $D_{s,\tau}$ fixed by every
finite bit-flip of the Cohen real. Let $Q_\tau$ be the set in $V$ of invariant names, taken up to equality
forced by $1$. Then $D_{r,\tau}=\mathcal P^V(D_{r,\bar\sigma})\times Q_\tau$, and every pair is
admitted. An entity $(E,[u])$ has extension $E$ at $r$ and transport $u^G$ along $h$.

This is Barton and Goodsell's stitching (Continuum Contingency, §8, Definition 1, with trivial group) of
a ground-model root onto the coalesced sum, with one change: elements definable in $V[G]$ from ground
parameters are replaced by invariantly named ones. The second class is strictly larger. For example,
the set of finite modifications of $c$ has an invariant name but is not ground-definable. Every argument
below works for either class.

## The forcing lemma

Cohen forcing is weakly homogeneous under finite bit-flips: for any two conditions, some bit-flip makes
the first compatible with the second. An *invariant sentence* is a formula whose parameters are check-names and invariant names.

1. **Invariant sentences are decided.** If $p\Vdash\varphi$ and $q\Vdash\neg\varphi$, flip $p$ to be
   compatible with $q$; the flipped condition still forces $\varphi$, which is a contradiction. So
   every invariant sentence is decided by $1$.
2. **Ground values.** An invariant name forced into a ground set $X$ is forced equal to a unique
   element of $X$. An invariant name forced to be a subset of $X$ names a set in $V$.
3. **Injectivity.** For invariant names $u$ and $u'$, $u^G=u'^G$ if and only if $1\Vdash u=u'$.
4. **Closure.** A name forced equal to a term in ground parameters and invariant names is invariant.

The structure at $s$, and the whole model, have invariant names, since they are forced equal to terms in
ground parameters. So the truth at $r$ of any formula with root parameters is decided by $1$. In
particular, the root extension of a term is a set in $V$, and its transport has an invariant name. A
ground set of representatives for each $Q_\tau$ exists by the usual mixing argument.

**Image lemma.** Let $E$ be a ground set of root tuples, and let $hE$ be the set of their images at $s$.

- $hE$ has an invariant name.
- Each component of a tuple of $E$ has, as its $A$-projection, an invariant name forced into a ground
  set. By (2) that projection is a value computed in $V$, so $a(hE)$ is a ground set.
- $b(hE)$ is in $B$, which is full in $V[G]$.

So $R_E:=(hE,a(hE),b(hE))$ is in $D_{s,\bar\sigma t}$ with an invariant name, and
$Y_E:=(E,[R_E])$ is a root entity.

**The obstruction.** By (2), the image of $D_{r,et}$ at $s$ is exactly
$\mathcal P^V(\mathbb N\times\mathbb N)\times\mathcal P^V(\mathbb N)\times\mathcal P^V(\mathbb N)$.
So $X:=(c\times\{0\},\varnothing,\varnothing)$, which lies in $D_{s,et}$, is not the image of any root
entity.

## It is a model of C

- **At $A$.** The model sits in $V[G]$, but $A$ is a one-world structure built in $V$. The
  interpretation of a term in $A$ is computed by recursion within $A$, so it is absolute and stays in
  $A$'s domains.
- **At $s$.** The domains are the fullest ones, so an abstraction's $s$-extension is just some subset in
  $V[G]$. Its terminal components are the interpretations in $A$ and $B$, and application commutes with
  $a$ and $b$.
- **At $r$.** An abstraction with root parameters has a ground root extension and an invariant
  transport, by the forcing lemma. Equality of root entities is equality of profiles, by (3).

## Verdicts at $r$

- **Rigid Comprehension.** Given $(E,[u])$, the entity $Y_E$ of the image lemma is coextensive with it.
  - It is weakly persistent at $r$, since every member of $E$ has its image in $hE$, $a(hE)$ and $b(hE)$.
  - It is weakly inextensible at $r$, since every member of $hE$, $a(hE)$ and $b(hE)$ is the image of a member of $E$.
  - $R_E$ is weakly rigid at $s$ by the same exact-image argument, and everything is rigid at $A$ and $B$.

  So $Y_E$ is rigid. This holds with any argument types, including $e$.
- **Strong Atomicity (type $t$), necessarily.**
  - At every object, every proposition is a set of arrows. Each singleton is possible, and it decides every proposition there.
  - Its transports are $\bot$ or singletons, along $h$, or $\bot$ or $\top$, at $A$ and $B$.
  - So the singletons are strong atoms, and every nonzero proposition contains one.
- **BF (type $t$) necessarily, and BF at type $e$.** Every transport map is onto, both on propositions
  and, by the projections, on individuals.
- **Relational Choice, necessarily.** At $r$, a serial root relation has a serial ground extension, and
  choice in $V$ gives a functional ground subrelation, with $\bot$ as its transport. At $s$, choice in
  $V[G]$ does the same. $A$ and $B$ are full, in $V$ and in $V[G]$ respectively.
- **Boolean Completeness (type $t$), necessarily.** Every propositional algebra is a finite power set.
- **No Rigid Comprehension or Weak Rigid Comprehension at $s$, at type $et$.**
  - Suppose $Y=(c\times\{0\},C,C')$ is weakly rigid at $s$.
  - Weak persistence gives $c\subseteq C$.
  - For $n\notin c$, every $(k,0)$ with $k\in c$ necessarily falls under $Z_n:=(\mathbb N\times\mathbb N,\mathbb N\setminus\{n\},\mathbb N)$. So weak inextensibility gives $C\subseteq\mathbb N\setminus\{n\}$.
  - So $C=c\notin V$, which is impossible, since $C$ must be a ground set.
- **No Boolean Completeness at $s$, at type $(et)t$.**
  - The family of the haecceities $(\{(k,0)\},\{k\},\{0\})$ of $(k,0)$, for $k\in c$, would have a least upper bound $J$.
  - Then $c\subseteq J_A$, and $J\le Z_n$ for each $n\notin c$, so $J_A=c$, which is not a ground set.
- **No BF at type $et$.** The root entity $Y_{D_{r,et}}$ holds necessarily of every root entity of type
  $et$. But at $s$ it misses $X$.
- **No Atomicity at type $(et)t$.**
  - The property $F$ of being one of the $s$-entities that are not images of root entities, with empty terminal components, is a nonzero root entity.
  - A nonzero $W\le F$ with a single instance at $s$ would have that instance invariantly named, and so it would be an image. That is a contradiction.
  - So $W$ has two instances, and a ground coordinate test at $s$ splits it.
- **No ND at type $t$.** $\{1_r\}$ and $\bot$ are distinct at $r$, but both become $\bot$ at $s$.
