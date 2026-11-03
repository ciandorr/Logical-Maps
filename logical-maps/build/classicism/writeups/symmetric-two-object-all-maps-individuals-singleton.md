# Symmetric ideally-full model: N and a point, all maps [one individual]

<p class='cert'>Model — Source: Misc.; produced by Cian Dorr, 29 October 2026 (the construction); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026 (the verification); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **¬ □BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Actuality.** There is a true proposition that entails every true proposition.
- **¬ □Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ □Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model on two objects, $W_0$ with base $\mathbb N$ and $W_1$ with base $\{0\}$, the arrows being all maps between the bases; write $!$ for the arrow $W_0\to W_1$ and $c_n$ for the arrow $W_1\to W_0$ with value $n$. The symmetry group is $\operatorname{Sym}(\mathbb N)$ at $W_0$ and trivial at $W_1$. Both objects carry the ideal of finite sets. Evaluation point: $1_{W_0}$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds BF.

At every type, at $W_0$. If $\forall x\,\Box Fx$ with $F$ pinned down by $S$, and $y$ is an entity at the target of an arrow $h$, choose an arrow $h^{\prime}$ agreeing with $h$ on $S$ that is surjective, a map being changeable off a finite set; by the section construction of the group's argument barcan-surjective, $y=h^{\prime}\cdot x$ for some entity $x$ at $W_0$, so $y$ is in $F_{h^{\prime}}$, which is $F_h$.

*Write-up: [symmetric-two-object-all-maps](symmetric-two-object-all-maps.html). Address: `symmetric-two-object-all-maps-individuals-singleton#barcan-at-root`. By Cian Dorr, 29 October 2026 (the construction); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026 (the verification).*

### Fails □BF (type t).

At $W_1$ symmetry forces a proposition to contain all the $c_n$ or none, so there are four propositions, and their transports along any $c_n$ are $\varnothing$, $\{!\}$, the arrows $W_0\to W_0$, and these with $!$. The property with all four at $1_{W_1}$ and those four transports at each $c_n$ is symmetric and pinned down by $\varnothing$, so every proposition at $W_1$ necessarily has it; but at $c_0$ the proposition $\{f:f(0)=f(1)\}$ does not. So BF at type $t$ fails at $W_1$, which $!$ reaches.

*Write-up: [symmetric-two-object-all-maps](symmetric-two-object-all-maps.html). Address: `symmetric-two-object-all-maps-individuals-singleton#barcan-fails-at-point`. By Cian Dorr, 29 October 2026 (the construction); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026 (the verification).*

### Holds □Boolean Completeness (type t). Fails Atomicity (type t), Actuality.

A proposition at $W_0$ pinned down by $S$ is, by symmetry, a set of patterns of identification on $S$ together with a bit for $!$: the part over $W_0$ is atomless, a pattern on $S$ splitting into its extensions to $S\cup\{a\}$, and the atom $\{!\}$ is false; so Atomicity (type $t$) and Actuality fail. Boolean Completeness holds at $W_0$ (the group's argument, with the hull conditions), and at $W_1$, which has four propositions, at type $t$; so it holds at type $t$ at every world.

*Write-up: [symmetric-two-object-all-maps](symmetric-two-object-all-maps.html). Address: `symmetric-two-object-all-maps-individuals-singleton#propositions`. By Cian Dorr, 29 October 2026 (the construction); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026 (the verification).*

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{2k,2k+1\}$; for any two of them some map of $\mathbb N$ collapses the one and is injective elsewhere. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0=\varnothing$: (B1) every map of $\mathbb N$ is an arrow, so prescriptions agreeing with $h^{\prime}$ on $P$ and with $h$ on $Q$, which agree on $P\cap Q\subseteq M$, extend to an arrow, and there is only one arrow into $W_1$; (B2) a permutation fixing $N$ pointwise moves the finitely many points of $P$ outside $N$ off $Q$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails □Axiom of Infinity (type e).

At the identity arrow of a reachable object $v$ with $n$ individuals there are not $n+1$ individuals any two of which are distinct, distinctness implying literal distinctness, identity being reflexive. So the Infinity schema at type $e$ fails there, and with it the Axiom of Infinity at type $e$, which implies it in C (axiom-of-infinity-e-implies-infinity-e). A closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target (at the world seen, in a Kripke-style model), so the arrow into $v$ is a world at which the Axiom fails, and its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-individuals-somewhere`. It requires that Some object reachable from the evaluation point has finitely many individuals. Here: The object $W_1$, reached by $!$, has the single individual $0$ (with either choice of individuals). By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails □Axiom of Infinity (type t).

As for individuals (finitely-many-individuals-somewhere), at type $t$: at the identity arrow of a reachable object with $n$ propositions the Infinity schema at type $t$ fails, and so does the Axiom of Infinity at type $t$, which implies it in C (axiom-of-infinity-t-implies-infinity-t); so its necessitation fails at the evaluation point.

*General argument `arguments/finitely-many-propositions-somewhere`. It requires that Some object reachable from the evaluation point has finitely many propositions. Here: At $W_1$, reached by $!$, every set of arrows is pinned down by the base $\{0\}$, and a symmetric one is a union of the orbits $\{1_{W_1}\}$ and $\{c_n:n\in\mathbb N\}$ under post-composition with $\operatorname{Sym}(\mathbb N)$: there are four propositions. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Without the symmetry this is finite-support-two-object-all-maps. Separates Boolean Completeness (every type), □BC (type $t$) and BF from □BF (type $t$), the separation that GPT-6 Astra's Ω-valued cofinite-interior model gave (Daniel Kodsi's pull request #18, item 20).

## Sources

- **Dorr 29 Oct** — Cian Dorr, construction of 29 October 2026, in conversation with Claude Opus 5.5 (Anthropic).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79 (the unsymmetric model).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Theorem 36, p. 18.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-two-object-all-maps.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Theorem 36, p. 18. Symmetric ideally-full models and the hull theorem.
