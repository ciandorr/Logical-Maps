# Stitched forcing model: ground-model root with a CH-reversing extension at its one other world [over L]

<p class='cert'>Model — Source: Continuum Contingency (draft); produced by Neil Barton and Zachary Goodsell (the construction and the contingency of the continuum hypothesis, Theorem 20); Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026 (the choice of forcing by cases, adding a Cohen real to the collapse so that both cases add a real); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Atomicity (type t).** Necessarily, every non-bottom proposition has an atom below it.
- **□BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.
- **□Truth implies ND-necessity.** Necessarily, every truth is ND-necessary. In C this is the identity $\Box_{\ne}=\lambda p\, .\,p$.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **¬ Rigid Rigidity.** Being rigid is a rigid property of relations, including propositions.
- **¬ BF (relational types).** The Barcan Formula at every relational type, that is, at every type other than e.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Non-contingency of the Continuum Hypothesis.** Either necessarily every real number structure satisfies the continuum hypothesis, or necessarily every real number structure falsifies it: that every subproperty of the continuum either injects into the natural numbers or is in bijection with the continuum. One sentence for each type $\sigma$.
- **¬ Necessity of Analysis.** Every first-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each first-order analytical sentence.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The stitching construction of Barton and Goodsell (Continuum Contingency, §8). Work in a generic extension $V[G]$ of a ground model $V$ of ZFC by a weakly homogeneous, hence $V$-decisive, forcing $P$ (§7.1): a set of ordinals definable in $V[G]$ from parameters in $V$ lies in $V$.

The forcing $P$ is chosen by cases on the continuum hypothesis in $V$. If $V\models\mathrm{CH}$, $P:=\operatorname{Add}(\omega,\omega_2)$, which adds $\aleph_2$ Cohen reals, so that $V[G]\models\neg\mathrm{CH}$. Otherwise $P:=\operatorname{Col}(\omega_1,2^{\aleph_0})\times \operatorname{Add}(\omega,1)$: the collapse, with countable conditions, adds no reals and makes the continuum of $V$ have size $\aleph_1$, and the Cohen real then adds a real and preserves CH, so that $V[G]\models\mathrm{CH}$. Both forcings are weakly homogeneous (a product of weakly homogeneous forcings is weakly homogeneous), hence $V$-decisive.

Ground model, fixed for this record: $V$ is Gödel's constructible universe, so that $V[G]=L[G]$; that is, the construction is carried out over $L$, which ZFC proves to be a model of ZFC + $V=L$, so this adds nothing to what the construction presupposes. In particular $V\models\mathrm{CH}$.

Let $C_0$ be the canonical extensional model of $V[G]$ (§7.2.5): one object with its identity arrow, the natural numbers as individuals, two propositions, and at each relational type every function of $V[G]$ between the lower domains, so that its relations of a type are, up to extension, all the subsets in $V[G]$ of the tuples of that type. Call an element of $C_0$ definable when it is definable in $V[G]$ from parameters in $V$. The root $\hat M$ is built in $V$ (§8.3, Definition 1, with the group $W$ trivial): its individuals are the natural numbers; its propositions are the pairs $\langle a,b\rangle$ of a truth value $a$ at the root and a truth value $b$ at $C_0$; and an element of a relational type at the root is a pair of a function in $V$ on the root domains, which gives its extension at the root, and a definable element of $C_0$ of the same type, which gives its extension at $C_0$, the two compatible in that the $C_0$-coordinate of the function's value at an argument is the definable element applied to the argument's $C_0$-component. Every such pair is in the domain, so a root relation may be any set in $V$ of root tuples together with any definable relation of $C_0$. The action model $M$ (§8.4) has the two objects $\hat M$ and $C_0$, their identities, and one arrow $h\colon\hat M\to C_0$, the identity on the individuals, which sends every other element to its $C_0$-component. Truth at the root is the first coordinate, so at the root $\Box p$ holds iff $p$ is true at both objects, and $C_0$ sees only itself. The source works in the full simple type hierarchy; the restriction of its model to the map's relational types is an action model of the same kind. Evaluation point: $\hat M$, at its identity arrow.

Interpretation of Σ, fixed for these records: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Stitched forcing models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Atoms are self-atoms, □Atoms are strong atoms, □Self-atoms are atoms, □Self-atoms are strong atoms.

The root sees itself and $C_0$ through one arrow each, and $C_0$ sees only itself. An entity at the root of a relational type is a pair $(E,D)$ of a root extension $E$ and a definable element $D$ of $C_0$, with transport $D$ along the arrow to $C_0$. It is an atom iff $E$ is a singleton and $D=\bot$, or $E=\varnothing$ and $D$ is a definable singleton of $C_0$; a self-atom likewise, since its transport along the identity is itself and along the arrow to $C_0$ is $D$, each of which must be an atom where the entity is instantiated. Each such entity is a strong atom, its two transports being an atom or bottom. At $C_0$, a one-world model with full extensional domains, the atoms are the singletons, which are self-atoms and strong atoms. So all four bridge principles hold at both worlds, at every type.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#self-atoms-and-strong-atoms`. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Rigid Comprehension.

Lemma 16 of the source, in the map's terms. Write a root relation as the pair of its root extension $E$, a set in $V$ of root tuples, and its $C_0$-extension $g$, a definable relation of $C_0$; transport along $h$ sends it to $g$, and $h[E]$, the set of $C_0$-components of the members of $E$, is definable from the set in $V$ of their names. The relation is persistent iff $h[E]\subseteq g$. It is weakly inextensible iff $g\subseteq h[E]$: the root relation with root extension $E$ and $C_0$-extension $h[E]$ necessarily holds of every member of $E$, so weak inextensibility gives $g\subseteq h[E]$; conversely, a root relation that necessarily holds of each member of $E$ has root extension including $E$ and $C_0$-extension including $h[E]$. So a root relation is weakly rigid iff $g=h[E]$, and then rigid, since at $C_0$, which sees only itself, every relation is rigid. Hence $(E,g)$ is coextensive with the rigid $(E,h[E])$, and Rigid Comprehension holds at the root; at $C_0$ it holds trivially.

*Source: Continuum Contingency, Lemma 16. From the group *Stitched forcing models*, shared argument `stitched-forcing#rigid-comprehension`. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Holds □Relational Choice.

Lemma 17 of the source. A serial root relation $U$ has, by choice in $V$, a functional subrelation $E_S$ of its root extension; the root relation with root extension $E_S$ and the $C_0$-extension of $U$ is in the domain, lies within $U$ at the root and is functional there, which is all the unboxed principle asks. At $C_0$, $V[G]$ supplies a functional subrelation of any serial relation, and the full domain contains it.

*Source: Continuum Contingency, Lemma 17. From the group *Stitched forcing models*, shared argument `stitched-forcing#relational-choice`. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Holds Axiom of Infinity (type e).

The individuals are the natural numbers at both objects (Lemma 15 of the source). At the root the finite cardinalities of type $(et)t$ are the numerals $\operatorname{Suc}^k\mathbf 0$: the root property of cardinalities whose root extension is the set of numerals, with the corresponding definable property at $C_0$, holds of $\mathbf 0$ and is closed under successor, so every finite cardinality is a numeral; and the $k$-th numeral holds of a root property of individuals iff its root extension has exactly $k$ members, which the universal property has not.

*Source: Continuum Contingency, Lemma 15. From the group *Stitched forcing models*, shared argument `stitched-forcing#axiom-of-infinity-e`. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Holds □Atomicity (type t).

Theorem 21 of the source, with the trivial group. The root has four propositions, the pairs of a truth value at the root and one at $C_0$, ordered coordinatewise, and $C_0$ has two; both algebras are finite, hence atomic.

*Source: Continuum Contingency, Theorem 21. From the group *Stitched forcing models*, shared argument `stitched-forcing#atomicity-t`. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Holds □BF (type t).

Both propositions of $C_0$ are transports of root propositions, so a property of propositions at the root that necessarily holds of every root proposition holds at $C_0$ of both propositions there; at $C_0$, which sees only itself, BF is trivial.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#barcan-t`. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Holds □Truth implies ND-necessity.

At the root let $q$ be the proposition true at the root alone. $\Diamond q$ is true at the root and false at $C_0$, so for any truth $p$, $\Box(\Diamond q\to p)$ holds, and $q$ witnesses $\Box_{\ne}p$. At $C_0$, where necessity is truth, $\top$ witnesses $\Box_{\ne}p$ for every truth $p$.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#distinctness-preserving-collapse`. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Fails Infinity Schema (type t).

The root has four propositions, so the instance of the schema asking for five pairwise distinct ones fails.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#infinity-t`. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

### Fails Rigid Power, Rigid Rigidity.

Lemma 19 of the source, with the universal property of individuals in place of the natural numbers. Let $F:=\lambda x^e\, .\,\top$; it is rigid, its root extension being $\mathbb N$ and its $C_0$-extension $h[\mathbb N]=\mathbb N$. Its power property $P:=\lambda X^{et}\, .\,\operatorname{Rigid}(X)\land X\le F$ is $\lambda X\, .\,\operatorname{Rigid}(X)$, as $X\le F$ is a theorem. By the criterion in the argument for Rigid Comprehension, the rigid root properties of individuals are the pairs $(E,E)$ with $E\subseteq\mathbb N$ in $V$, whose $C_0$-components are the reals of $V$, while at $C_0$ every property is rigid, so the $C_0$-extension of $P$ is the whole power set of $\mathbb N$ in $V[G]$. The root property of properties with the root extension of $P$ and $C_0$-extension $\mathcal P(\mathbb N)^V$, definable from that parameter, necessarily holds of every root instance of $P$, but not, at $C_0$, of a real of $V[G]$ not in $V$, which is rigid there. So $P$ is not weakly inextensible: Rigid Power fails at type $(et)t$ and, $P$ being rigidity itself, Rigid Rigidity fails at type $et$.

*Source: Continuum Contingency, Lemma 19. From the group *Stitched forcing models*, shared argument `stitched-forcing#rigid-power-new-real`. It requires that The forcing $P$ adds a real: some subset of $\mathbb N$ in $V[G]$ is not in $V$. Here: In either case $P$ adds a Cohen real. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

*Revised 2026-10-25 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Moved from stitched-cohen-extension into the group, for every member whose forcing adds a real; the Cohen real of the original text is now any real of $V[G]$ not in $V$, and the appeal to the weak homogeneity of Cohen forcing is to the $V$-decisiveness of $P$.

### Fails BF (relational types).

By the $V$-decisiveness of $P$, a real of $V[G]$ definable there from parameters in $V$ lies in $V$; so the $C_0$-components of the root properties of individuals are exactly the reals of $V$, and a real $c$ of $V[G]$ not in $V$ is the component of none. The root property of properties of individuals whose root extension is everything and whose $C_0$-extension is $\mathcal P(\mathbb N)^V$ necessarily holds of every root property of individuals, but $c$ does not fall under it at $C_0$: BF fails at type $et$.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#barcan-new-real`. It requires that The forcing $P$ adds a real: some subset of $\mathbb N$ in $V[G]$ is not in $V$. Here: In either case $P$ adds a Cohen real. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

*Revised 2026-10-25 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Moved from stitched-cohen-extension into the group, for every member whose forcing adds a real; the Cohen real of the original text is now any real of $V[G]$ not in $V$, and the appeal to the weak homogeneity of Cohen forcing is to the $V$-decisiveness of $P$.

### Fails Intensional Choice.

At type $(et)t$. Let $F$ be the root property of properties of individuals whose root extension is a single root property and whose $C_0$-extension is the reals of $V[G]$ not in $V$. It is necessarily instantiated. A property $G\le F$ that is necessarily uniquely instantiated would have a one-element $C_0$-extension $\{c\}$, definable from parameters in $V$, with $c$ a new real, which the $V$-decisiveness of $P$ forbids.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#intensional-choice-new-real`. It requires that The forcing $P$ adds a real: some subset of $\mathbb N$ in $V[G]$ is not in $V$. Here: In either case $P$ adds a Cohen real. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-19.*

*Revised 2026-10-25 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Moved from stitched-cohen-extension into the group, for every member whose forcing adds a real; the Cohen real of the original text is now any real of $V[G]$ not in $V$, and the appeal to the weak homogeneity of Cohen forcing is to the $V$-decisiveness of $P$.

### Fails Analytic Necessitism.

At type $et$, at the root. A real number structure exists there: the rigid properties of individuals are the pairs $(E,E)$ with $E\subseteq\mathbb N$ in $V$, the reals of $V$ as sets of naturals, and the field relations on them, defined from membership by arithmetical formulas, are root relations (a function in $V$ with the corresponding definable $C_0$-relation); completeness at the root holds because every root property of these is a set in $V$. Now let $\mathfrak R$ be any rigid real number structure at $et$ with necessarily distinct elements. At the root it is a complete ordered field, so by categoricity its domain $X$ is in bijection with the reals of $V$ and its rationals are a countable dense subfield. Its root extension is a set $E$ in $V$ and, $X$ being rigid, its $C_0$-extension is $h[E]=E$, the same reals. At $C_0$ every property is available, in particular the cut in the rationals of $X$ of a real of $V[G]$ not in $V$, a bounded subproperty of $X$ with no least upper bound in $E$, a least upper bound being a real of $V$ equal to that new real. So $X$ is not complete at $C_0$, $\Box\operatorname{Real}_{et}(\mathfrak R)$ fails, and the instance fails: a real number structure is possible, indeed actual, and no rigid one is necessarily a real number structure.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#analytic-necessitism-new-real`. It requires that The forcing $P$ adds a real: some subset of $\mathbb N$ in $V[G]$ is not in $V$. Here: In either case $P$ adds a Cohen real. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

*Revised 2026-10-25 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Moved from stitched-cohen-extension into the group, for every member whose forcing adds a real; the Cohen real of the original text is now any real of $V[G]$ not in $V$, and the appeal to the weak homogeneity of Cohen forcing is to the $V$-decisiveness of $P$.

### Fails Non-contingency of the Continuum Hypothesis.

Theorem 20 of the source. At each object, every real number structure satisfies the continuum hypothesis iff the universe that object is built in does: at the root $V$, at $C_0$ $V[G]$. At $C_0$ this is because $C_0$ is the full extensional model of $V[G]$ over the natural numbers: a real number structure there is a complete ordered field of $V[G]$, with every subproperty and every relation of $V[G]$ available, so it has $V[G]$'s continuum, and its satisfying CH is CH in $V[G]$. At the root it is because every set in $V$ of root tuples is the root extension of a root relation, whatever its $C_0$-extension: so the root, read at the root, is the full hierarchy of $V$ over its domains, and the same reasoning applies in $V$. Real number structures exist at both objects, at type $et$ (see the argument for the failure of Analytic Necessitism, or take any complete ordered field on $\mathcal P(\mathbb N)$ at $C_0$). When $P$ changes CH, at type $et$ some real number structure satisfies CH at one object and some falsifies it at the other, and the root sees both, so neither disjunct holds at the root.

*Source: Continuum Contingency, Theorem 20. From the group *Stitched forcing models*, shared argument `stitched-forcing#continuum-hypothesis-changed`. It requires that The continuum hypothesis has different truth values in $V[G]$ and in $V$. Here: CH holds in $V[G]$ iff it fails in $V$, by the choice of $P$. By Neil Barton and Zachary Goodsell; in the map's terms by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails Necessity of Analysis.

At type $et$, for the analytical sentence $\Phi$ saying that every real is constructible: membership of a real in $L$ is $\Sigma^1_2$ (Shoenfield), so $\Phi$ is $\Pi^1_3$, a first-order analytical sentence in any real number structure, whose natural numbers code sets of naturals by its reals. Real number structures exist at type $et$ at both objects (see the argument for the failure of Analytic Necessitism). At $C_0$, the full extensional model of $L[G]$, every real number structure has the reals of $L[G]$, among them a real not in $L$, and Shoenfield absoluteness makes the $\Sigma^1_2$ definition of constructibility mean the same in $L[G]$; so $\Phi$ fails in every real number structure there. At the root every set in $L$ of root tuples is the root extension of a root relation, whatever its $C_0$-extension, so the root read at the root is the full hierarchy of $L$ over its domains, and $\Phi$ holds in every real number structure there, as it does in $L$. The root sees both objects, so neither disjunct of the instance holds there.

*From the group *Stitched forcing models*, shared argument `stitched-forcing#necessity-of-analysis-constructible`. It requires that The forcing $P$ adds a real: some subset of $\mathbb N$ in $V[G]$ is not in $V$. Here: In either case $P$ adds a Cohen real. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails B for pure sentences.

The pure sentence $\exists p_1\ldots p_n\bigwedge_{i<j}p_i\ne p_j$ is true at the evaluation object and false at the world $V$ after it and at every world after $V$; so $\Diamond$ of it is false at $V$, and $\Box\Diamond$ of it false at the evaluation object. (The chain's own argument of 25 September, stated once.)

*General argument `arguments/fewer-propositions-after`. It requires that For some $n$, the evaluation object has $n$ distinct propositions, while some world after it, and every world after that one, has fewer. Here: The root has four propositions; $C_0$, after which there is only itself, has two. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Possible Infinity (type t).

At a world with $n$ propositions, the numeral $\operatorname{Suc}^n_t\mathbf{0}_t$, a finite cardinality, holds of the universal property of propositions, so the Axiom of Infinity at type $t$ fails there. It fails at every world, so Possible Infinity at type $t$ fails.

*General argument `arguments/finitely-many-propositions-everywhere`. It requires that There are finitely many propositions at every object reachable from the evaluation point. Here: The root has four propositions and $C_0$ two. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

The instance of Barton and Goodsell's Theorem 20 that makes the continuum hypothesis contingent, true but possibly false if $V\models\mathrm{CH}$ and false but possibly true otherwise; which, the map does not need to know. Every verdict of stitched-cohen-extension is shared except Non-contingency of CH, which holds there and fails here, so the two separate it from □Rigid Comprehension, □Relational Choice, □Atomicity at $t$ and the rest of that model's package. Like the Cohen instance, it establishes consistency relative to ZFC. Analytic Necessitism fails here only because the forcing adds a real; with the bare collapse of Theorem 20 the reals would not change.

## Sources

- **Continuum Contingency** — Neil Barton and Zachary Goodsell, Continuum Contingency, draft of October 2026, §7.1 (V-decisive forcing), §8 (the stitching construction, Definition 1 and Lemmas 11–19) and Theorem 20.

<p class='cert'>Record: <code>topics/classicism/models/stitched-ch-reversing.yaml</code></p>

## Paper references

- **Proof: Continuum Contingency.** Barton, Neil, and Zachary Goodsell. Continuum Contingency. Draft dated 14 October 2026, 47 pages. Stitches a ground model of set theory to the canonical model of a forcing extension to show that Classicism with □Rigid Comprehension, □Relational Choice and an axiom of infinity is consistent with first- and second-order continuum contingency, together with □Atomicity at type t (Theorem 21) or with Recombination (Theorem 22, which refutes Atomicity at type t, Corollary 23); formalizes the coin-toss argument (Theorem 9). Read directly on 19 October 2026; locators refer to this draft. — §8, Definition 1, Lemmas 11–19, Theorem 20; §7.1. Theorem 20 takes $\operatorname{Add}(\omega,\omega_2)$ or $\operatorname{Col}(\omega_1,\mathfrak c)$; here the collapse is multiplied by Cohen forcing, so that the forcing adds a real in either case.
