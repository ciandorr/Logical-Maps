# Symmetric ideally-full model: old and new individuals [one individual]

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 6 October 2026, in a session with Cian Dorr; further verdicts by Claude Opus 5.5 (Anthropic), the same day; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 6 October 2026.</p>

## Package

- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **ND.** Distinct things of any type are necessarily distinct.
- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **□Boolean Completeness.** Necessarily, every property of entities of a relational type has a greatest lower bound in that type.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Truth implies 5-necessity.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **□Countable Boolean Completeness.** Necessarily, every countable property of entities of a relational type has a least upper bound in that type, with countability relative to a type $\sigma$ as in Countable Boolean Completeness; one instance for each $\sigma$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Two-hat necessity implies ND-necessity.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full intensional action model over two objects, $E$ and $O$, with individuals $\mathbb N$ at $E$ and $\mathbb N\sqcup\mathbb N'$ at $O$, $\mathbb N'$ a disjoint copy of $\mathbb N$; members of $\mathbb N$ at $O$ are old, members of $\mathbb N'$ new. The arrows are injections: from $E$ to $E$ all injections of $\mathbb N$; from $E$ to $O$ the injections with range among the old individuals; from $O$ to $E$ all injections into $\mathbb N$; from $O$ to $O$ the permutations preserving old and new ($G_O$) and the injections with range among the old ($K$). The symmetry groups are all permutations of $\mathbb N$ at $E$ and $G_O$ at $O$, and both objects carry the ideal of finite sets. The evaluation point is the identity arrow on $E$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms.

At $E$ the only symmetric propositions over the arrows $E\to E$ are empty or everything, any two injections of $\mathbb N$ agreeing on a finite set up to a permutation; so the set of all arrows $E\to E$ is the atom containing $1_E$. At $O$ the symmetry group $G_O$ is pinned down by any new individual, since an injection into the old individuals cannot agree with a permutation preserving old and new at it, and is the atom containing $1_O$. No self-atom at $E$ contains an arrow $f$ into $O$: its transport along $f$ would be $G_O$, but an injection $m$ into the old individuals fixing $f(N)$ pointwise, for $N$ pinning the self-atom, is not in $G_O$ and carries $f$ to an arrow agreeing with it on $N$. So the self-atoms at $E$ sit over the atom of all arrows $E\to E$, and are atoms; at $O$, likewise, no self-atom contains an injection into the old individuals, and the symmetric pinned propositions over the arrows $O\to E$ are empty or everything, so the self-atoms there are $G_O$ and the set of all arrows $O\to E$, both atoms. Each is a strong atom: the atom at $E$ is the recorded true strong atom; $G_O$ becomes empty under an injection into the old individuals and under an arrow to $E$; the set of all arrows $O\to E$ becomes itself under an arrow $O\to O$ and the set of all arrows $E\to E$ under an arrow to $E$, atoms. At relational types a self-atom sits over one of these as the orbit of a single pair, an atom and a strong atom. So both principles hold at both objects, at every type.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Strong Actuality.

At $E$ the arrows to $E$ form a true strong atom: along an arrow to $E$ it becomes itself, along an arrow to $O$ the set of arrows from $O$ to $E$, an atom. At $O$, $G_O$ is one: along a member of $G_O$ it becomes itself, along a member of $K$ or an arrow to $E$ the empty set. Both objects are reachable from $E$.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-10-06.*

### Holds ND.

Every arrow $f$ out of $E$ is finitely invertible: for any arrow $h$ out of $E$ and finite $N$, some arrow $k$ after $f$ has $k\circ f$ agreeing with $h$ on $N$. So entities that differ at a tuple $\langle\bar a,h\rangle$ differ, after $f$, at $\langle\bar a,k\rangle$, by pinning; and arrows are injective on individuals.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Atomicity.

At both objects every relational type is atomic. The entities pinned down by a finite $M$ form the complete atomic algebra whose atoms are the orbits of the tuples $\langle\bar a,h\rangle$ with $h$ restricted to $M$; such an orbit stays an atom for every larger $M$ once $h(M)$ contains every individual in the arguments' pinning sets that an arrow of $h$'s kind can reach. Any nonzero entity contains such a tuple, after moving $h$ on fresh points. See the write-up.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Strong Atomicity (type t).

The arrows from $E$ to $O$ form a possible proposition whose only nonzero part is itself, and along the inclusion $\iota$ it becomes $G_O\cup K$, which $G_O$ splits; so no strong atom lies below it. (The map derives the failures of BF and of □ND at $t$; the write-up also gives them directly.)

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Boolean Completeness (type t). Fails Infinity Schema (type t).

The propositions at $E$ are four and those at $O$ eight, finite Boolean algebras, so complete; and there are not five pairwise distinct propositions at $E$.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Boolean Completeness.

At $E$, every relational type. An entity $F$ pinned down by a finite $S$ is determined by the pair $(F_{1_E},F_\iota)$, $\iota$ the inclusion into the old individuals, invariant under the symmetries fixing $S$ and $\iota S$; every such pair is an entity, and the order is componentwise inclusion. For a property pinned down by $N$, the componentwise unions of its instances are invariant under the symmetries fixing $N$, and the second under all permutations of the new individuals, so they form an entity, the least upper bound.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). Address: `symmetric-old-new-individuals-individuals-singleton#boolean-completeness-root`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-24.*

### Holds □Boolean Completeness, □Rigid Comprehension.

With one individual every entity is fixed by every symmetry, and is a union of finitely many classes, one for each kind of arrow (to $E$, from $E$ to $O$, in $G_O$, in $K$) and tuple of arguments; by induction on types, so every domain is finite and complete. Transport along an arrow then depends only on its kind, and the kind of a composite on the kinds of its factors, so the intension whose extension at $h$ is $X$'s extension at the identity transported along $h$ is a union of classes, in the domain; it is persistent and inextensible, at both objects.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-07.*

### Holds □Rigid Power.

Boxed Rigid Power, for either choice of individuals. Arrows are injective; at $E$ the symmetry group is all permutations, at $O$ those preserving old and new; the arrows out of $O$ other than symmetries (exiting arrows) go to $E$ or have old range.
(a) At $E$, a rigid $F$ pinned down by $S$ has every tuple of its extension pinned down by $S$. Each tuple has a least finite support under the permutations. Suppose $z\in F_1$ has a point $n\notin S$ in it. Let $i:E\to O$ be the inclusion into the old individuals, $b$ a new point, and $r:O\to E$ an injection with $rb=n$ and $ri$ fixing $S$; so $z\in F_{ri}$. Every tuple of $F_i$ is pinned down by old points (it is $lz^{\prime}$ for an arrow $l:E\to O$, of old range). By the weak inextensibility of $i\cdot F$ at $O$, tested on $B_Q(F_i)$ with $Q\ni b$ containing $iS$ (part (1) of tame-rigidity-factorizable, which holds with several objects), $z=r^{\prime}z^{\prime\prime}$ for an $r^{\prime}$ agreeing with $r$ on $Q$ and $z^{\prime\prime}\in F_i$ pinned down by old points $M$; then $z$ is pinned down by $r^{\prime}M$, which omits $n=r^{\prime}b$ by injectivity, contradicting the least support. Support by $S$ then gives pinning by $S$, through injections agreeing on $S$ factored through permutations fixing $S$.
(b) So $X_0(A)$ ($k\mapsto kA$) is in the domain and rigid for every $A\subseteq F_1$, and $F=X_0(F_1)$. For an arrow $h$ and rigid $X\le h\cdot F$ with extension $D$, the tuples of $D\subseteq hF_1$ are pinned down by $hS$, so $X=X_0(D)$, and $X=h\cdot X_0(A)$ for $A:=\{z\in F_1:hz\in D\}$. So the power property is $X_0$ of its extension, and rigid.
(c) At $O$: let $F$ be rigid, pinned down by $S$ containing a new point. Composing with a bijection $O\to E$ and (a), each exiting arrow $h$ acts on the tuples of $F_1$ through $h|_S$, and $F_1$ is invariant under the symmetries fixing $S$; a symmetry and an exiting arrow cannot agree on $S$. So $F=X_0(F_1)$, and (b) goes through for exiting arrows, symmetries being lifted by their inverses. Rigid Power holds at both objects, hence at every world.

*Address: `symmetric-old-new-individuals-individuals-singleton#rigid-power`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Holds □Truth implies 5-necessity. Fails Two-hat necessity implies ND-necessity.

At $E$ the four propositions are determined by the target, and the strong atom $a$ is the set of arrows $E\to E$. $\Diamond a$ is every arrow out of $E$, since an injection $E\to O$ with old range is followed by an injection $O\to E$, so $\Box_{\ne}=\Box$ at $E$. But $\hat\Diamond a$ contains no arrow $u:E\to O$: its retractions $v:O\to E$ cannot return to the truth $G_O$ at $O$, because any $x:E\to O$ has old range and $x\circ v\in K$. So $\hat{\hat\Box}$ at $E$ is the box over $a$; $a$ is two-hat necessary and not ND-necessary, and every truth ($\top$ and $a$) is two-hat necessary. At $O$, with strong atom $G_O$, $\hat\Diamond G_O=G_O$ (a member of $K$ or an arrow to $E$ cannot be brought back into $G_O$), so every truth at $O$, each containing $G_O$, is two-hat necessary. With necessary Strong Actuality, $\Box_5=\hat{\hat\Box}$ everywhere, so every truth is 5-necessary at both objects.

*Address: `symmetric-old-new-individuals-individuals-singleton#collapse-split`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds Countable Boolean Completeness.

At $E$, for every $\sigma$. If $R$ injects $X$ into the numerals at $\sigma$, with $N$ a finite set pinning both, then each instance of $X$ is fixed by every symmetry fixing $N$ pointwise: the symmetry carries the pair of the instance and its numeral to another such pair, and the numeral is fixed. An entity pinned down by $M$ and fixed by those symmetries is pinned down by $M\cap N$. So the instances of $X$ are all pinned down by $N$, and their union is in the domain and is the least upper bound. The haecceities of the even numbers, which have none, are not countable in the model. See the write-up.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

*Revised 2026-10-24 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* The remark about the haecceities of the even numbers is moot. They are not a property in the model at all, and Boolean Completeness holds at $E$ (boolean-completeness-root).

### Holds □Countable Boolean Completeness.

The argument for Countable Boolean Completeness at $E$ also works at $O$, the other object reachable from $E$, once a new individual $0'$ is put into the finite set $N$: arrows into $O$ that agree on $0'$ are both in $G_O$ or both in $K$, and within each kind the construction of the intermediate arrow goes through, with the fresh points chosen of the same sort. So every closed instance holds at both objects, hence necessarily. See the write-up.

*Write-up: [symmetric-old-new-individuals](symmetric-old-new-individuals.html). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Both objects carry the ideal of finite sets: the domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Possible Infinity (type t).

At a world with $n$ propositions, the numeral $\operatorname{Suc}^n_t\mathbf{0}_t$, a finite cardinality, holds of the universal property of propositions, so the Axiom of Infinity at type $t$ fails there. It fails at every world, so Possible Infinity at type $t$ fails.

*General argument `arguments/finitely-many-propositions-everywhere`. It requires that There are finitely many propositions at every object reachable from the evaluation point. Here: $E$ has four propositions and $O$ eight, generated by the arrows into $E$, $G_O$ and $K$, the last two separated by whether the arrow sends a given new individual to a new one. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Found by Claude Fable 5.1 as a countermodel to a principle from another context, and recorded at Cian Dorr's request on 6 October 2026. Like the sections-and-projection model it has □Actuality without Inextensible Comprehension; unlike it, it has Atomicity at every type, and so separates Atomicity and Actuality, even with ND and □Strong Actuality, from Inextensible Comprehension. Its actual world at $E$ is the set of all arrows from $E$ to $E$, which properly contains the identity, so it does not meet the group's condition symmetry-group-pinned. No Lean verification is claimed.

## Sources

- **Fable 5.1, 6 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 6 October 2026, in a session with Cian Dorr, as a countermodel to a principle (“Frex*”) from another context; it satisfies □Strong Actuality and refutes Inextensible Comprehension.
- **Opus 5.5, 6 Oct** — Claude Opus 5.5 (Anthropic), 6 October 2026, at Cian Dorr's direction; the corrected argument for the failure of Inextensible Comprehension, and the verdicts on ND, Atomicity, Boolean Completeness, BF and Strong Atomicity; see the write-up.
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Proposition 20 (symmetric ideally-full models are models of C).
- **Astra (Kodsi) 22 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Old/new model, Boolean Completeness and the rigidity separation, research note of 22 October 2026 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps); the correction of Boolean Completeness.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-old-new-individuals.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. The symmetric ideally-full models, of which this is one, on a new two-object category.
