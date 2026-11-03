# Symmetric surjection product: κ-pinned surjections and free words, glued constants [individuals $U$]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **Logical Necessity.** The Logical Necessity schema: necessity at distinct matching constants is equivalent to universal truth of the pure-formula. Preserve the side conditions of Witnessed Possibility.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **□Boolean Completeness.** Necessarily, every property of entities of a relational type has a greatest lower bound in that type.
- **□Tame Rigidity.** Necessarily, every weakly rigid relation, including a proposition, is rigid.
- **□Weakly Rigid Power.** Necessarily, if a relation is weakly rigid, so is the property of being a weakly rigid relation that entails it.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Truths are ND-necessary.** Necessarily, every truth is ND-necessary. In C this is the identity $\Box_{\ne}=\lambda p\, .\,p$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **□Inextensible Comprehension.** Necessarily, every relation, including a proposition, is coextensive with an inextensible one.
- **□Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ Vicinity.** There is a true proposition that entails the possibility of each true proposition.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.

## Definition

Fix an infinite cardinal $\kappa\ge|\Sigma|$, a set $U$ of size $\kappa^+$, the monoid $S$ of surjections $U\to U$, and a monoid $K$: $K$ is the free monoid $W$ of finite words on an alphabet of size $\kappa$, with empty word $\varepsilon$. The arrows of the one object are the pairs $(k,s)$ with $k\in K$ and $s\in S$, composed by $(k,s)(k',s'):=(kk',s\circ s')$; the evaluation point is $1:=(1_K,\mathrm{id})$, and the symmetry group is $\{1_K\}\times\operatorname{Sym}(U)$. The individuals are the members of $U$, with $(k,s)\cdot a:=s(a)$, and each individual $a$ is pinned down by $\{a\}$. A relational domain consists of the profiles $F$, assigning to each arrow a set of argument tuples, that are pinned down by a set $N\subseteq U$ of size at most $\kappa$ ($F_{(k,s)}$ depends only on $k$ and $s|_N$) and symmetric ($F_{(k,\pi s)}=\pi\cdot F_{(k,s)}$ for every permutation $\pi$ of $U$). Transport is $(h\cdot F)_j:=F_{jh}$. Σ is interpreted by gluing: individual constants denote distinct individuals (or the only one), and each relational constant glues, along fresh final letters of the word coordinate, chosen interpretations witnessing every satisfiable $\mathcal L(\Sigma)$-sentence (see the write-up).

*A member of the group Symmetric surjection products with free-word gluing, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Logical Necessity.

For each of the at most $\kappa$ $\mathcal L(\Sigma)$-sentences true at $1$ under some interpretation, choose one, $J_\alpha$, and a letter $f_\alpha$. Let $s_\alpha$ be a surjection sending each individual constant's denotation $a_c$ to $J_\alpha(c)$ (the identity with one individual), and $B_{\alpha,c}$ a preimage of $J_\alpha(c)$ under $(1_K,s_\alpha)$. Interpret a relational $c$ by $G_c$, equal at $(uf_\alpha,j,s)$ to $B_{\alpha,c}$ at $(u,j,s)$ and empty where the word is empty: pinned down by the union of at most $\kappa$ pinning sets, and symmetric. At $h_\alpha:=(f_\alpha,1,s_\alpha)$ every constant transports to its $J_\alpha$-value at once, so a Σ-sentence is possible iff it is true under some interpretation, which gives Logical Necessity.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#logical-necessity`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □BF.

Every arrow acts onto every domain. At $e$ the surjections are onto. At a relational type, given $F$ pinned down by $N$ and an arrow $(v,s)$: choose a permutation $\pi$ with $s\pi$ the identity on $N$, so that $(1_K,s)\cdot(\pi\cdot F)=F$; and lift along $(v,1)$ by the profile equal at $(uv,s)$ to $F$ at $(u,s)$ and empty elsewhere, well defined by right cancellation. So BF holds at every type, and, being closed and pure in a one-object model, necessarily.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#barcan`. It requires that The monoid factor of the arrows is right cancellative: $av=bv$ implies $a=b$. Here: The free monoid is right cancellative. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Atomlessness.

For distinct $a,b\in U$ let $q_{a,b}$ be the proposition that the arrow's surjection keeps $a$ and $b$ apart: symmetric, pinned down by $\{a,b\}$. Given $p\ne\bot$ pinned down by $N$, a member $(k,s)$ of $p$ and $a,b\notin N$, the restriction $s|_N$ extends to surjections that separate and that identify $a$ and $b$; so $p\land q_{a,b}$ and $p\land\neg q_{a,b}$ are both nonzero.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#atomlessness`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Vicinity.

Let $p$ be true, pinned down by $N$, and $a,b\notin N$. A surjection $s$ fixing $N$ and identifying $a$ and $b$ gives an arrow $(1_K,s)$ at which $p$ holds, while the true $q_{a,b}$ is impossible there, as composition on the left keeps the collapse. So no truth entails the possibility of every truth.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#vicinity`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Relational Choice.

At input type $tt$ and output type $t$. Let $U$ relate a property of propositions with exactly two actual instances to each of them, and any other to every proposition: a closed term, serial. A functional subrelation $R$, pinned down by $N$, has an actual extension invariant under every permutation fixing $N$. For distinct $a,b,c\notin N$, the property $A$ whose instances are the transports of $q_{c,a}$ and $q_{c,b}$ is in the domain, and the transposition of $a$ and $b$ fixes $N$ and $A$ and exchanges $q_{c,a}$ and $q_{c,b}$; so $R$ relates $A$ to both.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#relational-choice`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Boolean Completeness.

At every relational type, by the hull argument of Dorr's Theorem 36 with pinning sets of size at most $\kappa$. For $A$ pinned down by $N$ with actual instances $E$, let $J$ hold at $(k,s)$ of everything some $a\in E$ holds of at some $(k,t)$ with $t|_N=s|_N$: pinned down by $N$, symmetric, an upper bound. If $Z$, pinned down by $T$, bounds $E$ and $\bar b\in a_{(k,t)}$, take a permutation $\pi$ fixing $N$ and moving $a$'s pinning set off $T$ outside $N$, so that $\pi\cdot a\in E$, and a surjection $r$ agreeing with $s$ on $T$ with $r\pi=t$ on $a$'s pinning set; then $\bar b\in(\pi\cdot a)_{(k,r)}\subseteq Z_{(k,r)}=Z_{(k,s)}$. So $J$ is the least upper bound. The schema is closed and pure.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#boolean-completeness`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Tame Rigidity.

A weakly rigid $Y$ pinned down by $N$, with actual extension $E$, is the profile $h\mapsto h\cdot E$, by the argument of tame-rigidity-factorizable with pinning sets of size at most $\kappa$: given $\bar b=(k,t)\cdot\bar a$ with $\bar a\in E$ and $t|_N=s|_N$, a surjection $u$ fixing $N$ with $su=t$ on the pinning set of $\bar a$ gives $u\cdot\bar a\in E$ and $\bar b=(k,s)\cdot(u\cdot\bar a)$. Such profiles, and their transports, are rigid.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#tame-rigidity`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Weakly Rigid Power.

As rigid-power-surjections, with pinning sets of size at most $\kappa$ and the monoid coordinate held fixed. If $X\le h\cdot F$ is rigid at $h=(k,s)$, let $j_0$ agree with $s$ on a set $N$ pinning down $F$ and the test $Z$, and map the rest of $U$ bijectively onto the rest; then $j:=(k,j_0)$ has $j\cdot F=h\cdot F$, and the instances of $F$ that $j$ sends into $X$ form a set closed under the surjections fixing a set of size at most $\kappa$, whose exact image $Y$ is rigid, below $F$, with $j\cdot Y=X$. So the power property of $F$ is weakly inextensible, and rigid by Tame Rigidity.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#rigid-power`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Axiom of Infinity (type e).

The numerals are closed pure terms, fixed by every arrow, so the constant profile with the numerals as instances is symmetric and pinned down by $\varnothing$; hence the finite cardinalities are the standard ones, each holding of exactly the properties with that many actual instances. The universal property of individuals has $\kappa^+$ instances.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#axiom-of-infinity-e`. It requires that The individuals are the members of the set $U$ on which the surjections act, and every arrow acts on them by its surjection. Here: The individuals are the members of $U$, moved by the surjections. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Axiom of Infinity (type t).

As axiom-of-infinity-e, the propositions $q_{a,b}$ being infinitely many.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#axiom-of-infinity-t`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Truths are ND-necessary.

Let $p$ be true, pinned down by $N$, and $q$ the set of arrows $(1_K,s)$ with $s$ injective on $N$: true, pinned down by $N$, symmetric. In both monoid factors $jk=1_K$ only if $k=1_K$, so $\Diamond q=q$. A member $(1_K,s)$ of $q$ agrees on $N$ with a permutation $\pi$, and $(1_K,\pi)\in p$ by symmetry, so $(1_K,s)\in p$. Hence $\Box(\Diamond q\to p)$, and $p$ is ND-necessary. The principle is closed and pure.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#truths-are-nd-necessary`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Intensional Choice.

At type $t$, as intensional-choice-collapse. Fix $c\in U$, write $q_{x,y}$ for the set of arrows whose surjection keeps $x$ and $y$ apart, and let $F$ hold at $(k,s)$ of the $q_{s(c),y}$ with $y\ne s(c)$: pinned down by $\{c\}$, symmetric, and necessarily instantiated. Let $G\le F$ be necessarily uniquely instantiated, pinned down by $N\ni c$, and $h=(1_K,s)$ with $s$ sending $N$ to a single point $p$. Then $G_h=\{q_{p,y}\}$ with $y\ne p$. A permutation $\pi$ fixing $p$ has $\pi h$ agreeing with $h$ on $N$, so $G_{\pi h}=G_h$ by pinning, while symmetry gives $G_{\pi h}=\{q_{p,\pi y}\}$; but some such $\pi$ moves $y$.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#intensional-choice`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Arithmetic Necessitism.

As arithmetic-necessitism-finitely-pinned: the profile whose value at every arrow is the set of numerals at $\sigma$ is pinned down by $\varnothing$ and symmetric, numerals being closed terms fixed by every arrow; so the numbers are the numerals, rigid and, given the Infinity axiom, necessarily distinct.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#arithmetic-necessitism`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Analytic Necessitism.

*Withdrawn 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, after a trawl subagent's report: The step from the equality of transports to membership in the carrier by inextensibility does not follow: inextensibility bounds a rigid carrier from above, by the transports of its actual instances, and puts nothing new into its actual extension.*

As analytic-necessitism-exact-collapses-symmetric, at type $tt$, with the arrows $(1_K,s)$. For finite $N\subseteq U$ the arrows whose surjection is constant on $N$ form a symmetric proposition pinned down by $N$, and the orbits of these under the permutations, one for each size of $N$, give continuum many invariant sets of propositions, the values of constant intensions fixed by every arrow, which carry a real number structure. None is rigid: for $(1_K,s)$ with $s(a)=s(b)$, toggling $\top$ in an entity $x$ of type $tt$ at the arrows that keep $a$ and $b$ apart gives a distinct entity $y$ with the same transport along $(1_K,s)$, so persistence, inextensibility and necessary distinctness of a carrier conflict.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#analytic-necessitism`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism.

At type $tt$. For finite $N\subseteq U$ the arrows whose surjection is constant on $N$ form a symmetric proposition, and its orbit under the permutations depends only on $|N|$; for $A\subseteq\mathbb N$ the union $S_A$ of the orbits for sizes in $A$ is invariant under the permutations, so the constant intension $Y_A$ with value $S_A$ is symmetric, pinned down by $\varnothing$, in the domain, and fixed by every arrow, and distinct sets $A$ give distinct $Y_A$. Every set of tuples of the $Y_A$, and every set of such constant relations, is likewise invariant, so the value of a constant intension in the domain. With one object and all parameters fixed, a real number structure on the $Y_A$ by constant relations is one at every world, rigid with necessarily distinct instances, and the constant intensions of the sets of its constant relations are represented powers. So Analytic Necessitism and its second-order form hold.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#analytic-necessitism-fixed-orbits`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Inextensible Comprehension.

Given $X$ pinned down by $N$, let $Y_{(k,s)}:=X_{(k,s)}$ if $k=1_K$ and $s$ is injective on $N$, and $Y_{(k,s)}:=\varnothing$ otherwise: symmetric, pinned down by $N$, and coextensive with $X$ at $1$. In both monoid factors $jk=1_K$ only if $k=1_K$, and $ts$ is injective on $N$ only if $s$ is, so along an arrow without both properties $Y$ transports to $\bot$, and along one with them it transports to the same construction for the transport of $X$, pinned down by $s[N]$. It remains that $Y$ is weakly inextensible at $1$. Every surjection $g$ fixing $N$ maps $E:=X_1$ onto itself: for $\bar a\in E$ pinned down by $T$, a permutation $\tau$ fixing $N$ and sending each point of $T\setminus N$ to a $g$-preimage of it has $g\tau$ the identity on $T$, so $\tau\cdot\bar a\in E$ and $g\cdot(\tau\cdot\bar a)=\bar a$. If $(1_K,s)$ is injective on $N$, extend $s|_N$ to a permutation $\pi$ and put $g:=\pi^{-1}s$, fixing $N$; then $Y_{(1_K,s)}=\pi\cdot E$, and a member $\pi\cdot\bar a$ is the transport along $(1_K,s)$ of a $g$-preimage $\bar a'\in E$ of $\bar a$. So anything that necessarily holds of every member of $E$ contains $Y$ at every arrow. Inextensible Comprehension holds at $1$, and as a closed pure sentence in a one-object model, necessarily. Choice picks the preimages and the extending permutations.

*Write-up: [symmetric-surjection-products](symmetric-surjection-products.html). From the group *Symmetric surjection products with free-word gluing*, shared argument `symmetric-surjection-products#inextensible-comprehension`. By GPT-6 Astra (OpenAI), prompted by Cian Dorr, 29 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr.*

### Holds □Axiom of Infinity (type e).

In an action model a closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target, closed terms denoting entities that every arrow carries to the corresponding denotations at its target (in a one-world or Kripke-style model, the reachable objects are the worlds the evaluation point sees); so it suffices that the Axiom of Infinity at type $e$ holds at the identity arrow of every reachable object $v$. Fix such a $v$, and let $\Phi$ be the entity of type $(et)t$ in the domain at $v$ that holds there of exactly the properties with finite extension. The domain is closed under the operations defined by closed terms, so it contains $W:=\lambda Y^{(et)t}\, .\,\forall X^{et}\, .\,YX\to\Phi X$, which holds at $1_v$ of exactly the cardinalities holding there only of properties with finite extension. $W$ holds of $\mathbf 0_e$, which holds only of properties with empty extension. It passes from $Y$ to $\operatorname{Suc}_e Y$: if $\operatorname{Suc}_e Y$ holds of $X$, then $Xy$ and $Y(\lambda u\, .\,Xu\land u\ne y)$ for some $y$, and since identity at $e$ is literal at $1_v$ the extension of $\lambda u\, .\,Xu\land u\ne y$ is that of $X$ less $y$, which is finite as $W$ holds of $Y$; so $X$ has finite extension. Hence every $Z$ that is a finite cardinality at $1_v$ falls under $W$, and does not hold of $\lambda u\, .\,\top$, whose extension, all the individuals at $v$, is infinite. The step from the domain's entity $\Phi$ is what rules out a nonstandard finite cardinality: without it the impredicative ancestral ranges only over the domain's properties of cardinalities, which need not include one that excludes the universal property. No choice is used: "finite" means in bijection with a natural number, and an infinite set need not be Dedekind infinite.

*General argument `arguments/necessary-axiom-of-infinity-individuals`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: The evaluation object is the only object. The profile with constant value the set of entities of type $\sigma t$ whose extension at $1$ is finite is pinned down by $\varnothing$ and symmetric, since a permutation $\pi$ of $U$ preserves finiteness of extensions; the haecceity $j\mapsto\{j\cdot x\}$ of an entity is pinned down by the set pinning $x$ and symmetric, so identity is literal. It requires that There are infinitely many individuals at every object reachable from the evaluation point. Here: The evaluation object is the only object. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

A self-atom of any relational type at an object $W$ is instantiated at some arrow $k$ out of $W$, and its transport along $k$ is an atom at $k$’s target instantiated at the identity there. The existential projection of an atom $I$ of a relational type, the proposition $\exists\bar x\, .\,I\bar x$, is an atom of type $t$: it is in the domain, it is not bottom, and for any proposition $p$ the entity $I\land\lambda\bar x\, .\,p$ lies below the atom $I$, so is $I$ or bottom, which puts $p$ above the projection or disjoint from it. So the projection is a true atom at $k$’s target, which the condition excludes. Hence no reachable object has a self-atom, and Self-atoms are atoms and Self-atoms are strong atoms hold vacuously at every type and every reachable object, while Self-Atomicity (type t) fails at the evaluation point, the top proposition having no self-atom below it.

*General argument `arguments/no-actuality-no-self-atoms`. It requires that Actuality fails at the identity of every object reachable from the evaluation point: no atom of the domain of propositions there contains that identity. In a one-object model this is the failure of Actuality at the evaluation point, Actuality being a closed sentence. Here: One object, so Actuality, a closed pure sentence, holds at every world iff at the identity, where it fails (recorded in this group's verdicts). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: One object, with the semantics of Dorr's intensional action models: a formula holds at an arrow iff it holds at $1$ with its parameters transported. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."


## Notes

The symmetric all-surjections model of Dorr's draft with pinning sets of size at most $\kappa$ in a base of size $\kappa^+$, a free-word factor on the arrows, and Σ glued along the words. It adds Logical Necessity to that model's package: Logical Necessity holds with □Boolean Completeness, □BF and □Weakly Rigid Power, while Actuality, Vicinity and Relational Choice fail. Finite pinning would not do, since the gluing absorbs the pinning sets of infinitely many witnesses, and nor would the surjections alone, since a later collapse merges any gluing sites among the points. The variant with an idempotent in the monoid factor keeps all of this but BF; the variant with the members of $U$ as individuals adds the Axioms of Infinity.

## Sources

- **Astra via Kodsi 22 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Symmetric surjection model with free-word gluing, research note of 22 October 2026, §§1–9 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps), listed in his pull request #18 of 26 October 2026.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-surjections-free-words-glued.yaml</code></p>
