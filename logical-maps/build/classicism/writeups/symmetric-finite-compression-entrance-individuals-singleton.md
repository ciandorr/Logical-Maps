# Symmetric ideally-full model: finite-compression labels at an entrance [one individual]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **¬ BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ □Truths are ND-necessary.** Necessarily, every truth is ND-necessary. In C this is the identity $\Box_{\ne}=\lambda p\, .\,p$.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model on two objects. Partition a countably infinite set $N$ into infinitely many infinite blocks $B_i$, and let $Q$ be a set of labels: $q_i$ for each block, $q_D$ for each finite $D\subseteq N$, and $q_\top$, with fibres $R(q_i)=B_i$, $R(q_D)=D$, $R(q_\top)=N$. The root $A$ has base $N$, the tail $B$ has base $N\sqcup Q$. The arrows $A\to A$ are the surjections of $N$; the arrows $A\to B$ are the surjections of $N$ onto the $N$ summand; there are none from $B$ to $A$; and an arrow $B\to B$ is a pair $(f,g)$ of a surjection $f$ of $N$ and a map $g:Q\to Q$ fixing $q_\top$ with $f[R(q)]\subseteq R(g(q))$ for every label $q$. The symmetry group at $A$ is all permutations of $N$; at $B$ it is the permutations of $N$ permuting the blocks, acting on the labels accordingly. Both objects carry the ideal of finite sets. Evaluation point: $1_A$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Atomlessness.

At both objects. A nonzero proposition $p$ there, pinned down by a finite $S$, contains an arrow $h$. Choose distinct $a,b\in N$ outside $S$, in a block whose label is not in $S$, and in no fibre $R(q_D)$ with $q_D\in S$. Change $h$ only off $S$: keep its values on $S$, on the blocks whose labels are in $S$ and on the fibres $R(q_D)$ with $q_D\in S$; send every label outside $S$ to $q_\top$; send $a$ and $b$ to one point, or to two distinct points; and make the map onto $N$ by way of a further block whose label is not in $S$. Into $A$, or out of $A$ into $B$, any surjection of $N$ is an arrow; out of $B$, condition (1) holds for the labels in $S$, whose fibres keep their values, and for the others, whose image is $q_\top$. Both arrows agree with $h$ on $S$ and so lie in $p$. The proposition $C_{a,b}=\{k : ka=kb\}$ is symmetric, the symmetries being injective on $N$, and pinned down by $\{a,b\}$, so it splits $p$. No proposition is an atom at either object.

*Address: `symmetric-finite-compression-entrance-individuals-singleton#atomlessness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails BF (type t).

Let $Z$ be the property of propositions whose extension at an arrow into $A$ is every proposition there, and at an arrow into $B$ the set of transports $j\cdot p$ of propositions $p$ at $A$ along arrows $j:A\to B$. Its value depends on an arrow only through its target, and the symmetries there preserve it, since $s\cdot(j\cdot p)=(s\circ j)\cdot p$; so $Z$ is symmetric, pinned down by $\varnothing$, and in the domain. Every proposition $p$ at $A$ necessarily satisfies $Z$, since $h\cdot p\in Z_h$ for every arrow $h$. But at the entrance $i$ the proposition $r:=\{(f,g) : g(q_1)\text{ is a block label}\}$, symmetric and pinned down by $\{q_1\}$, is not a transport. If $j=i\circ f_j$, then $(f,g)\in j\cdot p$ iff $i\circ f\circ f_j\in p$, which depends only on $f$; but $(\mathrm{id}_N,\mathrm{id}_Q)\in r$ while $(\mathrm{id}_N,g^{\prime})\notin r$, where $g^{\prime}$ sends $q_1$ to $q_\top$ and fixes every other label, an arrow since $R(q_\top)=N$. So BF fails at type $t$.

*Address: `symmetric-finite-compression-entrance-individuals-singleton#barcan-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Truths are ND-necessary.

Let $p$ be true, pinned down by a finite $S\subseteq N$, and let $q$ be the proposition that the arrow goes into $A$ and is injective on $S$: symmetric, pinned down by $S$, and true. If $\Diamond q$ holds at an arrow $h$, then $k\circ h\in q$ for some $k$; there are no arrows from $B$ to $A$, so $h$ goes into $A$ and is injective on $S$, and it agrees on $S$ with a permutation $\sigma$ of $N$. As $p$ is symmetric and true, $\sigma\in p$, and as $p$ is pinned down by $S$, $h\in p$. So $\Box(\Diamond q\to p)$ with $q$ true: every truth is ND-necessary.

*Address: `symmetric-finite-compression-entrance-individuals-singleton#truths-are-nd-necessary`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails □Truths are ND-necessary.

At the entrance $i$, where a closed sentence has its value at $1_B$. Let $p:=\{(f,g) : g(q_1)\text{ is a block label}\}$, true at $1_B$, symmetric and pinned down by $\{q_1\}$. Let $q$ be a truth at $1_B$, pinned down by a finite $P\ni q_1$, and take the compression $c$ and the return $r$ of the write-up's descent lemma for this $P$. Then $r\circ c$ agrees with $1_B$ on $P$, so $r\circ c\in q$ and $\Diamond q$ holds at $c$; but $c$ sends $q_1$ to the finite label $q_{D_1}$, so $c\notin p$. So $p$ is a truth at $1_B$ that is not ND-necessary there.

*Write-up: [symmetric-finite-compression-entrance](symmetric-finite-compression-entrance.html). Address: `symmetric-finite-compression-entrance-individuals-singleton#necessary-truths-are-nd-necessary`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails B for pure sentences.

Truths are ND-necessary is a closed pure sentence. It is true at the evaluation point (argument truths-are-nd-necessary) and false at every arrow into $B$, where it has its value at $1_B$ (argument necessary-truths-are-nd-necessary). There are no arrows from $B$ to $A$, so at the evaluation point it is true but not necessarily possible.

*Address: `symmetric-finite-compression-entrance-individuals-singleton#pure-b`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{2k,2k+1\}$ of $N$; for any two of them a surjection of $N$ collapses the one and is injective elsewhere. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds Boolean Completeness.

At every relational type: a property $F$ of type-$\tau$ entities has a least upper bound, the union of the hulls of its instances. Let $F$ be pinned down by $N\supseteq M_0$. For each instance $u$ of $F$ at the identity, its hull is the closure of $u$ under the arrows that $N$ does not separate from the identity, transported along the arrows agreeing with the identity on $N$; it is symmetric, pinned down by $N$ (by (B1), which splices an arrow agreeing with $h'$ on the instance's pinning set with $h$ on $N$), and an upper bound of $u$. Every upper bound $z$ of all the instances, pinned down by $N'$, contains every hull: given a member of a hull, (B2) supplies a symmetry fixing $N$ and moving the instance's pinning set off $N'$, whose image is again an instance (by the orbit lemma, Lemma 35), lying under $z$; and $z$, pinned down by $N'$, cannot tell the moved instance's tuple from the original. The union of the hulls is pinned down by $N$ and symmetric, so it is in the domain, and it is the least upper bound.

*Source: Boolean Completeness does not imply Rigid Comprehension, Theorem 36, p. 18; Corollary 37, p. 19. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#boolean-completeness`. It requires that There is a finite set $M_0$ of individuals at the evaluation object such that: (B1) for every finite $M\supseteq M_0$ and every arrow $h$ from the evaluation object to itself that $M$ does not separate (some arrow $k\notin G$ agrees with $h$ on $M$, or $h\in G$), every arrow $h'$ agreeing with $h$ on $M$, and finite $P,Q$ with $P\cap Q\subseteq M$, some arrow agrees with $h'$ on $P$ and with $h$ on $Q$; and (B2) for finite $N\supseteq M_0$ and finite $P,Q$, some member of the symmetry group fixes $N$ pointwise and moves every member of $P$ outside $N$ off $Q$. The arrows in (B1) go from the evaluation object to any one object, and $M$ separates $h$ when every arrow agreeing with $h$ on $M$ is a member of the symmetry group of the evaluation object. These are the hypotheses of Dorr's main theorem (draft, Definitions 28–30, Theorem 36). Here: With $M_0=\varnothing$. (B1) The arrows out of $A$ into either object are the surjections of $N$ (onto the summand $N$ of $B$'s base, for those into $B$), so values prescribed by $h^{\prime}$ on $P$ and by $h$ on $Q$, which agree on $P\cap Q\subseteq M$, extend to an arrow into the same object, the infinitely many remaining points covering $N$. (B2) The symmetry group at $A$ is all permutations of $N$, so one fixing $N$ pointwise moves the finitely many points of $P$ outside $N$ off $Q$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The draft's main theorem, which the all-surjections and collapse-pair models each applied in an argument of their own, stated once; what each member does to meet its hypotheses is its reason for meeting hull-conditions. Proved in Lean (SymBase.lub_of_hull).

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* No longer requires one-object-action-model: as the draft notes (proof of Proposition 40), nothing in the theorem uses a single object, pinning, separation, amalgamability and hulls all quantifying over arrows with a fixed target; the condition hull-conditions now says so.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Both objects carry the ideal of finite sets: the domains hold exactly the symmetric intensions pinned down by a finite set (Dorr, draft, Definitions 15–18), arrows with different targets never agreeing on a set. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds □Atomlessness, □Atoms are self-atoms, □Atoms are strong atoms, □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

An atom of a relational type at a reachable object would give, by existential projection, an atom of type $t$ there (as in the argument no-actuality-no-self-atoms), which the condition excludes; so no reachable object has an atom of any relational type, nor a self-atom, since a self-atom is an atom where it is instantiated. All four bridge principles therefore hold vacuously at every type and every reachable object, and Self-Atomicity (type t) fails at the evaluation point.

*General argument `arguments/no-atoms-no-self-atoms`. It requires that At every object reachable from the evaluation point, no proposition in the domain is an atom. Here: At both objects every nonzero proposition is split by a proposition that two points are collapsed (argument atomlessness). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Now also gives □Atomlessness, which the condition states: a reachable object with no atom of type $t$ satisfies Atomlessness. The bridge verdicts and the failure of Self-Atomicity are now also consequences of □Atomlessness by recorded results.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Tame Rigidity and Rigid Power do not imply Weakly Rigid Power, answering the question of 10 October 2026 ([[tame-rigidity-and-rigid-power-imply-weakly-rigid-power]]) negatively. The source also characterizes Weakly Rigid Power as Tame Rigidity plus Rigid Power plus a bounded future-tameness condition, every future weakly rigid subrelation of an actual rigid bound being rigid; that characterization is not recorded. The Lean certificates of Tame Rigidity, Rigid Power and the failure of Weakly Rigid Power are Astra's (Classicism.Meta.Intensional.FiniteCompression), ported from the submission. The group's variant with one individual is generated; no argument above applies to it.

## Sources

- **Astra (Kodsi) 23 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Tame Rigidity and Rigid Power without Weakly Rigid Power, research note of 23 October 2026, §§2–9 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps, proofs/finite-compression.md).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Proposition 20.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-finite-compression-entrance.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. Symmetric ideally-full models, of which this is one.
