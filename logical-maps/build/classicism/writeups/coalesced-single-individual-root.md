# Coalesced sum: singleton individual root

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **Possibility+ (pure).** The strengthened Possibility Maximalism schema for pure C-consistent formulas whose only free variables are the displayed individual variables; include the empty tuple.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ □Two-hat necessity implies ND-necessity.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ □5-necessity implies two-hat necessity.** Necessarily, whatever is 5-necessary is two-hat necessary. In C this is the identity $\Box_5=\hat{\hat\Box}$.
- **¬ □Truth implies 5-necessity.** Necessarily, every truth is 5-necessary: necessary under every S5 operator. In C this is the identity $\Box_5=\lambda p\, .\,p$.
- **¬ Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **¬ Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **¬ Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **¬ BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ □Vicinity.** Necessarily, there is a true proposition that entails the possibility of each true proposition.
- **¬ □Weakly Inextensible Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a weakly inextensible one.
- **¬ □Transversal.** Necessarily, there is a property of properties that picks out exactly one property from each coextension class, that is, exactly one property coextensive with any given property.
- **¬ Necessity of Analysis.** Every first-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each first-order analytical sentence.
- **¬ Self-atoms are atoms (type t).** Every self-atom is an atom.
- **¬ Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.

## Definition

Take the alternative coalesced-sum root of Appendix E, p. 83: a set of source action models complete for C, coalesced at a new root whose individual domain is a singleton, the unique root individual being carried by each distinguished arrow to a chosen individual of that component. Evaluation point: the root.

The root has one distinguished arrow to the root of each component, and every arrow from the root into a component factors through it.

Root domains are as full as compatibility allows: a root proposition is a choice, for each component, of a proposition of that component’s root domain, together with a truth value at the root’s identity arrow, and a root entity of a relational type is likewise a family of component entities with a root component that is an arbitrary function of the root arguments.

*A member of the group Coalesced sums at a new root, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Possibility+ (pure).

Choosing the components so that every C-consistent formula with one free individual variable is true of the chosen individual in some component gives the n = 1 instances of Possibility+; the instances with two or more variables have false antecedents at the root, and the empty-tuple instances are Possibility Maximalism.

*Source: Classicism, §2.6, pp. 41–42 and n. 61; Appendix E, p. 83. By Andrew Bacon and Cian Dorr, 2026-09-17.*

### Fails Infinity Schema (type e).

At the root, where there is one individual, although infinitely many are possible.

*By Andrew Bacon and Cian Dorr, 2026-09-17.*

### Fails □Two-hat necessity implies ND-necessity, □5-necessity implies two-hat necessity, □Truth implies 5-necessity.

The components form a set of action models complete for C in the signature, so for each of the three unboxed collapse principles, which fail in some model of C (the paired-individuals two-object model for 5-necessity implies two-hat necessity, the two-object retract full model for two-hat necessity implies ND-necessity, the involution group for Truth implies 5-necessity), some component falsifies it at its own evaluation point; the component is carried into the coalesced sum unchanged and its evaluation point is a world accessible from the root by the distinguished arrow. So none of the boxed collapse principles holds at the root, although every truth at the root is ND-necessary.

*Address: `coalesced-single-individual-root#no-boxed-collapse`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Tame Rigidity.

Tame Rigidity fails at a relational argument type in models of C (ultralimit-fork, symmetric-qualitative-links), so some component $M$ refutes it at its root $M_0$: some $F_M$ of type $\sigma\to t$, $\sigma$ relational, is weakly rigid there but not rigid. A root entity $F$ of that type is a root extension $F_o$ together with a component $F_N$ in each component $N$, and a formula about $F$ at a world of $N$ is the same formula about $F_N$ in $N$. Since the components of root entities are arbitrary, $F$ is weakly inextensible at the root exactly when, for every $N$, every $X_N$ that necessarily holds of the $N$-components of the members of $F_o$ has $F_N\le X_N$. For each other component $N$ fix $z_N$, and for each $y$ in the extension of $F_M$ at $M_0$ let $x_y$ be the root entity with $M$-component $y$ and $N$-components $z_N$, free at the root by the condition. Put $F_o:=\{x_y\}$, $F_N:=\lambda y\, .\,y=z_N$, a haecceity, rigid in every model of C, and keep $F_M$. Then $F$ is persistent and weakly inextensible at the root, each component's condition being the weak inextensibility of its own component, but not inextensible, since $F_M$ is not inextensible in $M$ and every arrow from the root into $M$ factors through the distinguished one. So Tame Rigidity fails at the root.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#tame-rigidity-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that A root entity of a relational type has a root component that is an arbitrary function of the root arguments. Here: The root domains are as full as compatibility allows. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Claude Fable 5.1 (Anthropic), answering Cian Dorr's conjecture, 2026-10-03.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* One direction of Fable's transfer theorem: at a coalesced root, Tame Rigidity at a relational type holds iff it holds at the root of every component. The other direction is not recorded, the engine deriving the positive verdict in the one model where it applies.

### Fails Rigid Power.

The transfer of tame-rigidity-component, applied to a rigid relation whose power property is not rigid. The pure sentence $\exists A^{tt}\, .\,\operatorname{Rigid}(A)\land\neg\operatorname{Rigid} (\lambda X\, .\,\operatorname{Rigid}(X)\land X\le A)$ is consistent with C (it holds in the one-individual variants of finite-support-pair-injections-or-collapses and symmetric-collapse-pair, with $A:=\top$), so some component $m$ satisfies it at its root, with witness $A$. Its extension $D$ there is nonempty: otherwise weak inextensibility tested on $\bot$ makes $A=\bot$, whose power property is the haecceity of $\bot$, which is rigid.
For $p\in D$ let $\widehat p$ be the root proposition false at the root, with $m$-component $p$ and $\bot$ in every other component; let $F$ have root extension $\{\widehat p:p\in D\}$, $m$-component $A$, and in each other component $i$ the haecceity of $\bot$. Both are in the domain, the root domains being fullest. $F$ is weakly persistent at the root, $A$ and the haecceities being persistent. It is weakly inextensible there: if $H$ necessarily holds of every $\widehat p$, its root extension contains them, $A\le H_m$ by the weak inextensibility of $A$, and the haecceity of $\bot$ entails $H_i$; entailment in the sum is componentwise. Every other accessible world lies in a component, where $F$'s components are rigid; so $F$ is rigid. The $m$-component of its power property is that of $A$, transport respecting abstraction, rigidity and entailment, and every arrow into $m$ factors through the distinguished one; so it is not rigid. Rigid Power fails at the root, at type $t\to t$.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#rigid-power-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that A root entity of a relational type has a root component that is an arbitrary function of the root arguments. Here: The root domains are as full as compatibility allows. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Fails Intensional Choice.

The type-$e$ instance of Intensional Choice fails in a model of C (symmetric-all-surjections), so its negation is consistent with C and some component $M$ refutes it at its root $M_0$: some $F$ in $M_0$'s domain is necessarily instantiated and no $G\le F$ there is necessarily uniquely instantiated. As in barcan-t-component, the thread $F^{\prime}$ that is universal at the root and in every other component and is carried onto $F$ by the distinguished arrow to $M_0$ is in the root domain, and it is necessarily instantiated. A root $G\le F^{\prime}$ that is necessarily uniquely instantiated would be carried onto such a $G$ for $F$ at $M_0$, every arrow from the root into $M$ factoring through the distinguished one. So the unboxed principle fails at the root.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#intensional-choice-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds Relational Choice.

The functionality of a subrelation is evaluated at the root’s identity arrow only, while the subrelation condition is boxed; so for a serial root relation take the subrelation whose root component is a functional choice from the root component, by choice in the metatheory, and whose component parts are empty. Where some component refutes Relational Choice at its root, as when the components are complete for C, its necessitation fails.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#relational-choice-free-root`. It requires that A root entity of a relational type has a root component that is an arbitrary function of the root arguments. Here: The root domains are as full as compatibility allows. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three complete members' copies stated once; "Its necessitation fails, since some component refutes Relational Choice at its root" became conditional on that, since in the all-finite-domains member every component satisfies Relational Choice.

### Holds Actuality.

The singleton root proposition witnesses Actuality.

*Source: Classicism, Appendix E, p. 83. From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#actuality-singleton-root`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once.

### Fails BF (type t).

C is complete for the component set, so some component $M$ refutes BF at its root $M_0$, at type $t$ say: some $F$ in $M_0$’s domain has $\forall y\, .\,\Box Fy$ true and $\Diamond\exists y\, .\,\neg Fy$ true at $M_0$. Because the root’s domains are as full as possible, the thread $F^{\prime}$ that is universal at the root and in every other component and is carried onto $F$ by the distinguished arrow to $M_0$ is in the root domain. Every arrow from the root into $M$ factors through that distinguished arrow, so $\forall y\, .\,\Box F^{\prime}y$ at the root reduces to $\forall y\, .\,\Box Fy$ at $M_0$ together with trivial checks elsewhere, and $\Diamond\exists y\, .\,\neg F^{\prime}y$ at the root follows from $\Diamond\exists y\, .\,\neg Fy$ at $M_0$ through the same factorization.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#barcan-t-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' verbatim copies stated once.

### Fails Atomicity (type t).

C is complete for the components, so some component $M$ refutes Atomicity at its root, by a proposition $p_M$ with no atom below it in $M$’s domain; the root proposition that is $p_M$ on $M$, empty on every other component and false at the root has as its root lower bounds exactly the root propositions that are lower bounds of $p_M$ on $M$ and empty elsewhere, so it has no atom below it either.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#atomicity-t-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' verbatim copies stated once.

### Fails Boolean Completeness (type t).

The truncation model of Appendix D, part 6, refutes it at type $t$, as its record now shows, and the components are complete for C, so one of them does; the root propositions false at every arrow except those into that component form a copy of its propositional domain under the root’s entailment order, and a root property of propositions holding exactly of the copies of the members of that component’s counterexample family has no least upper bound at the root.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#boolean-completeness-t-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' verbatim copies stated once.

### Fails □Vicinity, □Weakly Inextensible Comprehension.

The components are complete for C and a closed pure sentence at the distinguished arrow into a component has its truth value at that component root, so every pure sentence consistent with C is possible at the root; the negation of Vicinity is consistent (the truncation model) and so is the negation of a closed instance of Weakly Inextensible Comprehension at type $t\to t$ (the permutation model). Since □Actuality fails here while Vicinity and Weakly Inextensible Comprehension hold, the boxed results show that at least one of the boxed principles had to fail.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#pure-sentences-possible`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' verbatim copies stated once.

### Fails □Transversal.

Every pure sentence consistent with C is possible at the root (pure-sentences-possible): the negation of the type-$e$ instance of Transversal is a pure sentence consistent with C, since it holds in symmetric-infinite-classes, so it is possible at the root.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#transversal-boxed`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-09-28.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' verbatim copies stated once; "By the same argument" became a reference to pure-sentences-possible.

### Holds Arithmetic Necessitism.

Vacuously, at every type $\sigma$. The negation of $I^*_\sigma$, that zero is a successor or successor is not injective on the numbers at $\sigma$, is a pure sentence consistent with C: it holds in the full model with one world, one individual and two propositions, where every type is finite and the finite cardinalities beyond the size of the type coincide. So it is possible at the root (pure-sentences-possible), the antecedent $\Box I^*_\sigma$ fails there, and the instance of Arithmetic Necessitism at $\sigma$ is true.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#arithmetic-necessitism-complete-components`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Necessity of Analysis.

The negation of an instance of the Necessity of Analysis is a closed pure sentence consistent with C: at the root of coalesced-two-extensional-arithmetics-root, with $\sigma$ and $A$ as in that model's argument, both $\Diamond\exists\mathfrak R\,.\,(\operatorname{Real}_\sigma(\mathfrak R)\land A(\mathfrak R))$ and $\Diamond\exists\mathfrak R\,.\,(\operatorname{Real}_\sigma(\mathfrak R)\land\neg A(\mathfrak R))$ hold. So it is possible at the root (pure-sentences-possible), and since arrows compose, what is possibly possible is possible: both conjuncts hold at the root, and the instance fails.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#necessity-of-analysis-complete-components`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Self-atoms are atoms (type t), Self-atoms are strong atoms (type t).

Let $N$ and $M$ be two components whose roots satisfy Actuality, with true atoms $a_N$ and $a_M$, and let $P$ be the root proposition false at the root, with component $a_N$ at $N$, $a_M$ at $M$ and bottom elsewhere. $P$ is possible, and it is a self-atom: under the distinguished arrow into $N$ it becomes $a_N$, and a true atom is a self-atom, as it entails every truth, including the truth that it entails every truth; likewise at $M$; and at the root it is false. It is not an atom, since the root proposition with component $a_N$ alone lies strictly below it. So Self-atoms are atoms (type t) fails at the root, and with it Self-atoms are strong atoms (type t).

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#self-atom-of-two-actual-components`. It requires that At least two components are action models whose roots satisfy Actuality, and the root domain contains every family of component propositions with a truth value at the root (the fullest root domains). Here: The components are complete for C, so two of them satisfy Actuality at their roots; the root domains are the fullest. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Fails Self-Atomicity (type t), Atoms are self-atoms (type t).

Atoms are self-atoms (type t) fails in a model of C, the full idempotent monoid, where the atom $\{k\}$ becomes $\{1,k\}$ under $k$; so some component $N$ refutes it at its root with an atom $q$. The root proposition with component $q$ at $N$ and bottom elsewhere, false at the root, is an atom at the root, is possible, and under the distinguished arrow into $N$ becomes $q$, which is true at a world of $N$ without being an atom there. So it is an atom that is not a self-atom, and as nothing possible lies below it but itself, Self-Atomicity (type t) fails at the root too.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#self-atomicity-component`. It requires that The components are a family of action models complete for C: every sentence consistent with C is true at the root of some component. Here: The source action models are a set complete for C. It requires that Every arrow from the root into a component factors through a single distinguished arrow to that component's root. Here: This is the construction. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.


## Notes

Promoted on 22 September 2026 for the pure package, which the source establishes; the earlier conjectured status concerned an expansion to the map’s signature Σ. That expansion exists exactly when Σ has at most one individual constant: with two, the unique root individual would have to be carried to two different interpretations in a component where they differ, which no arrow can do. So the signature principles are not listed; for a signature with individual constants see the constant-indexed root.

## History

The record's revision log before it was written as arguments.

- **2026-09-28** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — Recorded the failure of □Transversal: every pure sentence consistent with C is possible at the root, and symmetric-infinite-classes refutes Transversal at type e. Now violates: □Transversal.
- **2026-09-27** (Claude Opus 5.5 (Anthropic), at Cian Dorr's request) — Recorded the failure of □Vicinity and □Weakly Inextensible Comprehension; argument in the notes. Now violates: □Vicinity, □Weakly Inextensible Comprehension.
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell) — Added Transversal Choice at the root, by the argument recorded for Relational Choice: a root entity has an arbitrary root component, so take the property whose root component is a transversal, chosen in the metatheory, of the root component of an equivalence relation at the root, with empty component parts; the equivalence and transversal conditions are all evaluated at the root's identity arrow. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Corrected the Boolean Completeness claim from the type-t instance to the type schema, since no component is known to refute it at type t; added the failure of Countable Boolean Completeness by the same transfer. Now violates: Boolean Completeness, Countable Boolean Completeness.
- **2026-09-23** (Cian Dorr, recorded by Claude Fable 5.1 (Anthropic)) — Restored the failure of Boolean Completeness (type t), now that a component refuting it at type t is on the map; see the notes. Now violates: Boolean Completeness (type t).
- **2026-09-22** (Cian Dorr, recorded by Claude Fable 5.1 (Anthropic)) — Promoted to proved for the pure assertions, which Classicism n. 61 and Appendix E, p. 83 establish; the signature expansion is now understood to exist only for at most one individual constant, so no signature principle is listed. Added the failure of BF and BF (type t) at the root. Now violates: BF, BF (type t).
- **2026-09-22** (Cian Dorr, recorded by Claude Fable 5.1 (Anthropic)) — Settled Atomicity (type t) and Boolean Completeness (type t) as failing and Relational Choice as holding, as at the maximalist root. Now satisfies: Relational Choice. Now violates: Atomicity (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of □Relational Choice, already argued in the notes. Now violates: □Relational Choice.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.6, pp. 41–42 and n. 61; Appendix E, p. 83.

<p class='cert'>Record: <code>topics/classicism/models/coalesced-single-individual-root.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, pp. 41–42 and n. 61; Appendix E, p. 83
