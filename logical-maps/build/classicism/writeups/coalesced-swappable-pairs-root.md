# Coalesced sum: free root over a Henkin model with independently swappable pairs

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **□Tame Rigidity.** Necessarily, every weakly rigid relation, including a proposition, is rigid.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Truths are ND-necessary.** Necessarily, every truth is ND-necessary. In C this is the identity $\Box_{\ne}=\lambda p\, .\,p$.
- **□Persistent Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a persistent one.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ Modalized Relational Choice.** Every necessarily serial relation is entailed by a necessarily functional relation.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

The component is a one-world Henkin model $H$, as an action model with one object and only its identity arrow. Its individuals are labels $L_i$ and options $A_i^0,A_i^1$ ($i\in\mathbb N$). The group $\{0,1\}^{\mathbb N}$ acts on them, $g$ fixing each $L_i$ and sending $A_i^\epsilon$ to $A_i^{\epsilon+g(i)}$ (mod 2), and on functions by conjugation; its domain of each relational type $\sigma\tau$ holds the functions from $D_\sigma$ to $D_\tau$ fixed by every group element that is $0$ on some finite set, and $D_t=\{0,1\}$. These domains are closed under the logical constants and lambda abstraction, terms denoting equivariantly, so $H$ is an extensional Henkin model of C. Coalesce $H$ at a new root as in Definition E.2. The root's individuals are those of $H$, carried to themselves by the arrow into $H$. Evaluation point: the root. Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

The root has one distinguished arrow to the root of each component, and every arrow from the root into a component factors through it.

Root domains are as full as compatibility allows: a root proposition is a choice, for each component, of a proposition of that component’s root domain, together with a truth value at the root’s identity arrow, and a root entity of a relational type is likewise a family of component entities with a root component that is an arbitrary function of the root arguments.

*A member of the group Coalesced sums at a new root, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Fails Modalized Relational Choice.

At the types $e$ and $e$. In $H$, let $U$ relate each $L_i$ to $A_i^0$ and $A_i^1$, and each option to $L_0$: it is fixed by the whole group, so in the domain, and serial. No functional subrelation $S$ of $U$ is in the domain of $H$: $S$ is fixed by the group elements that are $0$ on some finite set $N$; for $i\notin N$, the element swapping the two options of pair $i$ alone fixes $S$ and $L_i$, so it carries the $S$-output of $L_i$, one of those options, to a second $S$-output. Now let $R$ be the root relation with the universal relation as its root component and $U$ as its component in $H$: it is necessarily serial. A necessarily functional $S\le R$ would have as its component in $H$ a functional subrelation of $U$ in the domain of $H$. So Modalized Relational Choice fails, and with it □Relational Choice.

*Address: `coalesced-swappable-pairs-root#modalized-relational-choice`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Intensional Choice.

In $H$, a property with an instance $b$ entails the haecceity of $b$, which is in the domain, being fixed by whatever fixes $b$. At the root, let $F$ be necessarily instantiated: its root component has an instance $a$ and its component in $H$ an instance $b$. The root property with root component $\{a\}$ and the haecceity of $b$ as its component entails $F$ and is necessarily uniquely instantiated; it does not matter that $b$ need not be the image of $a$. So Intensional Choice holds at both objects.

*Address: `coalesced-swappable-pairs-root#intensional-choice`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □BF, □Boolean Completeness (type t).

The arrow into $H$ carries the root domains onto those of $H$ at every type: an entity of $H$ is the component of the root entity with that component and an empty root component, and individuals go to themselves. So if $Fx$ is necessary for every root $x$, $F$'s component holds of every entity of $H$, and $\forall x\,.\,Fx$ is necessary: BF holds at the root, and trivially in the one-world $H$. There are four root propositions and two in $H$, so Boolean Completeness (type $t$) holds at both objects.

*Address: `coalesced-swappable-pairs-root#barcan-and-completeness`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Self-atoms are strong atoms.

In $H$ the singletons of tuples are fixed by whatever fixes their entries, so $H$ is atomic, and in a one-world model atoms are strong atoms. At the root, the singletons of root tuples with empty $H$-component, and the entities with empty root extension and a singleton $H$-component, are atoms, every nonzero entity is above one, and both kinds are strong atoms. A self-atom instantiated at the root is an atom; one instantiated only at $a$ has empty root extension and an atom of $H$ as $H$-component, so it is an atom too.

*Address: `coalesced-swappable-pairs-root#self-atoms`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Axiom of Infinity (type e). Fails Infinity Schema (type t).

Root extensions are arbitrary, so the property of cardinalities that hold at the root only of properties with finite root extension is in the domain, and the argument infinitely-many-individuals runs at the root, which has infinitely many individuals. There are four propositions at the root and two in $H$.

*Address: `coalesced-swappable-pairs-root#infinity`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails Countable Boolean Completeness.

At $\sigma=e$. Let $P_i$ have empty root extension and $H$-component $\{A_i^0\}$. An upper bound has an $H$-component containing every $A_i^0$, fixed by the swaps vanishing on some finite $N$, so containing $A_i^1$ for $i\notin N$; removing one such $A_j^1$ gives a smaller upper bound. The numbers at $e$ at the root are the distinct numerals, root extensions being arbitrary, and the relation pairing $P_i$ with the $i$th numeral is in the domain, so the family is countable relative to $e$.

*Address: `coalesced-swappable-pairs-root#countable-boolean-completeness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Arithmetic Necessitism, Necessity of Arithmetic.

The numerals are fixed by the whole group, so the property of being a numeral is admitted in $H$ and at the root, and the numbers at every type are the numerals, crisply. A type is finite at both objects (those built from $t$ alone) or infinite at both; at a finite type $I_\sigma$ fails everywhere, and at an infinite one every relation among numerals is fixed by the group, so sum and product are standard at both objects. Persistence and inextensibility of the numbers are as in arithmetic-necessitism-extensionally-full.

*Address: `coalesced-swappable-pairs-root#arithmetic`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Tame Rigidity, □Rigid Power.

In the one-world $H$ every relation is rigid, so rigidity at the root is weak rigidity there, and Tame Rigidity holds. Rigid Power: a rigid root $F$ with root extension $S$ has as $H$-component the least finitely supported superset $T$ of $a\cdot S$. For a finitely supported $T'\subseteq T$, let $S'$ be the members of $S$ sent into $T'$: any finitely supported $T''\supseteq a\cdot S'$ gives the finitely supported superset $(T''\cap T')\cup(T\setminus T')$ of $a\cdot S$, so $T''\supseteq T'$, and $(S',T')$ is rigid and below $F$. So the rigid relations below $F$ in $H$ are the transports of rigid ones at the root, and the power property of $F$ is weakly rigid, hence rigid. In $H$ the principle is trivial.

*Address: `coalesced-swappable-pairs-root#tame-rigidity`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds □Truths are ND-necessary, □Persistent Comprehension.

Both hold at the root (recorded) and trivially in the one-world $H$.

*Address: `coalesced-swappable-pairs-root#one-world-component`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Fails B for pure sentences.

Distinctness-Necessity at $t$ fails at the root and holds in the one-world $H$; so its negation is true at the root and not possible at $a$.

*Address: `coalesced-swappable-pairs-root#pure-b`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Necessity of Second-Order Analysis.

At the root real number structures are standard, root extensions being arbitrary. In $H$, a real number structure has a carrier and relations fixed by the swaps vanishing on some finite $N$, each of which acts as an order-automorphism of a complete ordered field, hence trivially on the carrier; so every subset of the carrier and every relation on it is admitted, and the structure is standard with full second-order quantification. So an analytical sentence is true in every real number structure at every world, or false in every one.

*Address: `coalesced-swappable-pairs-root#second-order-analysis`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-28.*

### Holds Relational Choice.

The functionality of a subrelation is evaluated at the root’s identity arrow only, while the subrelation condition is boxed; so for a serial root relation take the subrelation whose root component is a functional choice from the root component, by choice in the metatheory, and whose component parts are empty. Where some component refutes Relational Choice at its root, as when the components are complete for C, its necessitation fails.

*From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#relational-choice-free-root`. It requires that A root entity of a relational type has a root component that is an arbitrary function of the root arguments. Here: The root domains are as full as compatibility allows. By Cian Dorr, recorded by Claude Fable 5.1 (Anthropic), 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three complete members' copies stated once; "Its necessitation fails, since some component refutes Relational Choice at its root" became conditional on that, since in the all-finite-domains member every component satisfies Relational Choice.

### Holds Actuality.

The singleton root proposition witnesses Actuality.

*Source: Classicism, Appendix E, p. 83. From the group *Coalesced sums at a new root*, shared argument `coalesced-sums#actuality-singleton-root`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once.

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The singleton root proposition, true at the root's identity arrow and nowhere in a component, is in the domain and entails every truth; the components have no arrows back to the root (Classicism, Appendix E, p. 83, on the distinctness-preserving collapse). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds □Axiom of Infinity (type e).

In an action model a closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target, closed terms denoting entities that every arrow carries to the corresponding denotations at its target (in a one-world or Kripke-style model, the reachable objects are the worlds the evaluation point sees); so it suffices that the Axiom of Infinity at type $e$ holds at the identity arrow of every reachable object $v$. Fix such a $v$, and let $\Phi$ be the entity of type $(et)t$ in the domain at $v$ that holds there of exactly the properties with finite extension. The domain is closed under the operations defined by closed terms, so it contains $W:=\lambda Y^{(et)t}\, .\,\forall X^{et}\, .\,YX\to\Phi X$, which holds at $1_v$ of exactly the cardinalities holding there only of properties with finite extension. $W$ holds of $\mathbf 0_e$, which holds only of properties with empty extension. It passes from $Y$ to $\operatorname{Suc}_e Y$: if $\operatorname{Suc}_e Y$ holds of $X$, then $Xy$ and $Y(\lambda u\, .\,Xu\land u\ne y)$ for some $y$, and since identity at $e$ is literal at $1_v$ the extension of $\lambda u\, .\,Xu\land u\ne y$ is that of $X$ less $y$, which is finite as $W$ holds of $Y$; so $X$ has finite extension. Hence every $Z$ that is a finite cardinality at $1_v$ falls under $W$, and does not hold of $\lambda u\, .\,\top$, whose extension, all the individuals at $v$, is infinite. The step from the domain's entity $\Phi$ is what rules out a nonstandard finite cardinality: without it the impredicative ancestral ranges only over the domain's properties of cardinalities, which need not include one that excludes the universal property. No choice is used: "finite" means in bijection with a natural number, and an infinite set need not be Dedekind infinite.

*General argument `arguments/necessary-axiom-of-infinity-individuals`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: In $H$, the function from $D_{\sigma t}$ to $\{0,1\}$ true of exactly the entities with finite extension is fixed by every group element, which preserves finiteness, so it is in the domain; the haecceity of $A_i^\epsilon$ is fixed by every group element vanishing at $i$, and $L_i$'s by every element, so identity at $e$ is literal, and at $t$ it is trivially so. At the root, an entity has an arbitrary root component and components in the domain of $H$: give it that function as its $H$-component and any root extension, singletons included. It requires that There are infinitely many individuals at every object reachable from the evaluation point. Here: The individuals of $H$, the $L_i$ and $A_i^\epsilon$, are infinitely many, and they are the root's individuals too. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the construction fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Recorded for the separation of Relational Choice with Intensional Choice from Modalized Relational Choice: Relational Choice holds at the root by choice in the metatheory (the group's argument relational-choice-free-root), while the choice-free component $H$ has no selector for its pair relation. Astra's note also shows that the root satisfies its "logical observer" separation principles, which the map does not record. An earlier version of the note took as its component a Henkin model of ZF without choice, as in henkin-without-relational-choice; $H$ removes the need for that model's set-theoretic hypothesis.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Free root over a choiceless Henkin leaf, and Classical Henkin leaf with independently swappable pairs, research notes of 26 October 2026, §§1–7 and §§1–4 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix E, Definition E.2, pp. 80–83.

<p class='cert'>Record: <code>topics/classicism/models/coalesced-swappable-pairs-root.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix E, Definition E.2, pp. 80–83. The coalesced sum, here of a single one-world component.
