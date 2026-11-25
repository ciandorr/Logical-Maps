# Symmetric ideally-full model: recurrent finite colour approximations [one individual]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Boolean Completeness.** Necessarily, every property of entities of a relational type has a greatest lower bound in that type.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **B for pure sentences.** The B instance for every closed sentence in the pure language.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Possible failure of Cardinal CH.** Cardinal CH possibly fails.
- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **¬ Two-hat necessities are ND-necessary.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.
- **¬ Possible Cardinal CH.** Cardinal CH possibly holds.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Potential Infinity (type e).** For every natural number, there could be at least that many individuals: each number counted at type $e$ possibly holds of some property of individuals.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model with an object $W_m$ for each positive integer $m$ and an object $W_\infty$, each with base a copy of $\mathbb N$ in which a set $E_V$ of coloured points is fixed: $m$ of them at $W_m$, an infinite coinfinite set at $W_\infty$. The arrows $V\to W$, for every pair of objects, are the surjections $f$ of the bases with $f[E_V]\subseteq E_W$. The symmetry group at $V$ consists of the permutations preserving $E_V$ setwise. Every object carries the ideal of finite sets. Evaluation point: $1_{W_1}$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □BF.

At every type and every object. Every arrow is surjective and every object carries the ideal of finite sets, so the argument barcan-surjective of the group applies at each object: an entity at the target of an arrow $h$, pinned down by $M$, is the transport along $h$ of the entity at the source built from a finite section of $h$ over $M$.

*Write-up: [symmetric-recurrent-colours](symmetric-recurrent-colours.html). Address: `symmetric-recurrent-colours-individuals-singleton#necessary-barcan`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026, 2026-10-28.*

### Holds □Boolean Completeness.

Dorr's hull theorem applies at every object, with $M_0$ the colour set at a $W_m$ and $\varnothing$ at $W_\infty$: prescriptions respecting colour extend to arrows, the uncoloured complement being infinite, and at $W_\infty$ both the coloured and the uncoloured points form infinite orbits, so points can be moved off any finite set by a symmetry fixing another.

*Write-up: [symmetric-recurrent-colours](symmetric-recurrent-colours.html). Address: `symmetric-recurrent-colours-individuals-singleton#necessary-boolean-completeness`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026, 2026-10-28.*

### Holds Atomlessness.

A nonzero proposition $p$ pinned down by $S$ is true at some arrow $h$; for distinct uncoloured $a,b$ outside $S$, arrows agreeing with $h$ on $S$ that collapse and that separate $a$ and $b$ both lie in $p$, so the proposition that $a$ and $b$ are collapsed splits $p$.

*Write-up: [symmetric-recurrent-colours](symmetric-recurrent-colours.html). Address: `symmetric-recurrent-colours-individuals-singleton#atomlessness`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026, 2026-10-28.*

### Holds B for sentences of Σ, B for pure sentences.

There are arrows between every pair of objects, so a closed sentence true anywhere is possible everywhere; with Σ top the same holds of Σ-sentences.

*Address: `symmetric-recurrent-colours-individuals-singleton#signature-b`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Two-hat necessities are ND-necessary.

Let $p$ be the arrows into $W_1$, true, symmetric and pinned down by $\varnothing$. It is not ND- necessary: for a truth $q$ pinned down by $M$, an arrow $h:W_1\to W_\infty$ injective on $M$, sending the coloured point $a$ to a coloured point and $M\setminus\{a\}$ to uncoloured ones, and an arrow $k$ back sending every coloured point to $a$ and each $h(m)$ to $m$, give $k\circ h\in q$, so $h\in\Diamond q\setminus p$. But it is two-hat necessary with witness $p$: at an arrow into an object with two coloured points $c_1\ne c_2$, the arrows not collapsing them form a truth that is impossible at every arrow into $W_1$, so $\neg p$ is ND-necessary there and $\Diamond_{\ne}p$ fails outside $p$.

*Address: `symmetric-recurrent-colours-individuals-singleton#two-hat-not-nd`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: Pairs of uncoloured points; for any two disjoint such pairs some surjection fixing the colour set collapses the one and not the other. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: Every arrow is a surjection of the bases. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: Every object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0=E_{W_1}$: (B1) prescriptions agreeing with $h^{\prime}$ on $P$ and with $h$ on $Q$ agree on $P\cap Q\subseteq M$ and send coloured points to coloured ones, so they extend to an arrow, the uncoloured complement being infinite; (B2) a permutation fixing $N\supseteq E_{W_1}$ pointwise can move the finitely many uncoloured points of $P$ outside $N$ off $Q$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Possible failure of Cardinal CH. Fails Possible Cardinal CH.

Cardinal CH fails at every world, so it is not possible, and its failure, being actual, is possible. With one individual at every world, $N=\operatorname{LowerNat}_e$ has exactly three instances at every world. At-least zero, $z=\lambda A\, .\,\top$, and its successor, which holds of the properties with an instance, differ at the empty property. The successor of that holds of the properties with two distinct instances, so of none at any world; it is $\lambda A\, .\,\bot$ by Intensionality, so is its own successor, and differs from the other two, which hold of the universal property. Being one of the three is a property of cardinalities that $z$ has and that passes to successors, so $N$ has no other instance. The rest is the argument cardinal-ch-boundedly-many-individuals with $m=3$: the rigid subproperties of $N$ are the eight disjunctions of haecceities of its instances, and a property holding of four of them neither injects into the three instances of $N$ nor is in bijection with the eight. No choice is used.

*General argument `arguments/cardinal-ch-one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 2026-11-25.*

### Holds □Atomlessness, □Atoms are self-atoms, □Atoms are strong atoms, □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

An atom of a relational type at a reachable object would give, by existential projection, an atom of type $t$ there (as in the argument no-actuality-no-self-atoms), which the condition excludes; so no reachable object has an atom of any relational type, nor a self-atom, since a self-atom is an atom where it is instantiated. All four bridge principles therefore hold vacuously at every type and every reachable object, and Self-Atomicity (type t) fails at the evaluation point.

*General argument `arguments/no-atoms-no-self-atoms`. It requires that At every object reachable from the evaluation point, no proposition in the domain is an atom. Here: At every object a nonzero proposition pinned down by $S$ and containing $h$ contains arrows agreeing with $h$ on $S$ that collapse and that separate two uncoloured points outside $S$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Now also gives □Atomlessness, which the condition states: a reachable object with no atom of type $t$ satisfies Atomlessness. The bridge verdicts and the failure of Self-Atomicity are now also consequences of □Atomlessness by recorded results.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e), Potential Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world. And the numeral $\operatorname{Suc}_e\operatorname{Suc}_e\mathbf{0}_e$, a finite cardinality, holds of no property at any world, a property it holds of having two distinct instances; so Potential Infinity (type $e$) fails.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

*Revised 2026-11-24 by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell:* The failure of Potential Infinity (type e) added, with its sentence of the text. It is the strongest of the four verdicts: the Axiom of Infinity and Possible Infinity each imply Potential Infinity.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Separates □BF, □Rigid Power, □Boolean Completeness and Tame Rigidity from Weakly Rigid Power and □Tame Rigidity, strengthening symmetric-finite-compression-entrance: there a one-way collapse of labels ends the failures, here every object can return to a finite-colour one. Tame Rigidity holds at every finite-colour object and fails at $W_\infty$, so No Pure Contingency fails. Recorded with the base as individuals; the arguments using individuals do not apply to the generated variant with one individual.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Symmetric ideally-full model: recurrent finite colour approximations, research note of 26 October 2026, §§2–12 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Theorem 36, p. 18.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-recurrent-colours.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Theorem 36 and Corollary 37, pp. 18–19. Symmetric ideally-full models, of which this is one, and the hull theorem for Boolean Completeness.
