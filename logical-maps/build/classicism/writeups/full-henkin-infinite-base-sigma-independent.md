# Full Henkin model: countably infinite individual domain [Σ independent]

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026.</p>

## Package

- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.

## Definition

The individual domain $D_e$ is countably infinite, $D_t=\{0,1\}$, and every relational type holds all functions between its domains. There is one world, so $\Box p$ is $p=\top$, and identity is genuine identity: a full Henkin interpretation (Classicism, Definition 3.6), a model of C by Proposition 3.7.

Metatheory, fixed for this record: ZFC.

Interpretation of Σ, fixed for this record: Σ is any signature every constant of which has a type in which $e$ occurs, with individuals enough to give each individual constant one and each relational constant two of its own: any finite Σ, and any countable Σ when the individuals are $\mathbb N$. An individual constant denotes its individual. A relational constant $c$ of type $\tau$, with individuals $a_c,b_c$, denotes $x_\tau$, where $x_e:=a_c$ and, for $\tau=\bar\sigma t$ with $e$ occurring in $\sigma_i$, $x_\tau:=\{\bar y : y_i=x_{\sigma_i}\}$; for one predicate of type $et$, the singleton $\{a_c\}$.

*A member of the group Henkin models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Extensionality.

Every relation is a function between the lower domains, and identity is identity of functions, so coextensive relations are identical. With one world, the boxed principles reduce to their unboxed forms, and the comprehension, completeness and atomicity principles hold as in every two-valued full model: each relational type is the complete atomic Boolean algebra of the subsets of a domain.

*From the group *Henkin models*, shared argument `henkin#extensionality`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Functional Choice.

Every function between the domains is present, so choice in the metatheory gives every serial relation a functional subrelation, and, when the output type is relational, a selecting operation.

*From the group *Henkin models*, shared argument `henkin#functional-choice`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Independence (signature Σ).

Permutations of the individuals act on every type, by conjugation, preserving application, identity, the Boolean operations and the quantifiers, so every closed pure term $A$ is equivariant: $\pi(A\,\bar d)=A\,(\pi\bar d)$. For distinct constants $c,d_1,\dots,d_n$ with $c$ relational, the transposition of $a_c$ and $b_c$ fixes the individuals of the $d_i$, hence each $d_i$, and so $A\,\bar d$; but it moves $c$, by induction on its type. So $c\ne A\,\bar d$. For an individual constant $c$ the instance is vacuous, no term $A\,\bar d$ being of type $e$. The restriction on Σ cannot be dropped: Extensionality and Independence (Σ) are inconsistent when Σ has a constant whose type does not contain $e$, since such a constant is provably one of finitely many closed pure terms (write-up).

*Write-up: [extensional-independent-constants](extensional-independent-constants.html). From the group *Henkin models*, shared argument `henkin#independence`. By OpenAI Codex (GPT-6), prompted by Daniel Kodsi, 22 October 2026, for one predicate of type $et$; Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, for every such Σ, 2026-10-29.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. It requires that There are infinitely many individuals at the evaluation world. Here: The individual domain is countably infinite. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Axiom of Infinity (type e).

In an action model a closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target, closed terms denoting entities that every arrow carries to the corresponding denotations at its target (in a one-world or Kripke-style model, the reachable objects are the worlds the evaluation point sees); so it suffices that the Axiom of Infinity at type $e$ holds at the identity arrow of every reachable object $v$. Fix such a $v$, and let $\Phi$ be the entity of type $(et)t$ in the domain at $v$ that holds there of exactly the properties with finite extension. The domain is closed under the operations defined by closed terms, so it contains $W:=\lambda Y^{(et)t}\, .\,\forall X^{et}\, .\,YX\to\Phi X$, which holds at $1_v$ of exactly the cardinalities holding there only of properties with finite extension. $W$ holds of $\mathbf 0_e$, which holds only of properties with empty extension. It passes from $Y$ to $\operatorname{Suc}_e Y$: if $\operatorname{Suc}_e Y$ holds of $X$, then $Xy$ and $Y(\lambda u\, .\,Xu\land u\ne y)$ for some $y$, and since identity at $e$ is literal at $1_v$ the extension of $\lambda u\, .\,Xu\land u\ne y$ is that of $X$ less $y$, which is finite as $W$ holds of $Y$; so $X$ has finite extension. Hence every $Z$ that is a finite cardinality at $1_v$ falls under $W$, and does not hold of $\lambda u\, .\,\top$, whose extension, all the individuals at $v$, is infinite. The step from the domain's entity $\Phi$ is what rules out a nonstandard finite cardinality: without it the impredicative ancestral ranges only over the domain's properties of cardinalities, which need not include one that excludes the universal property. No choice is used: "finite" means in bijection with a natural number, and an infinite set need not be Dedekind infinite.

*General argument `arguments/necessary-axiom-of-infinity-individuals`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: There is one world, and every relational type holds every function between its domains, among them the haecceities, so identity is literal, and the function true of exactly the entities with finite extension. It requires that There are infinitely many individuals at every object reachable from the evaluation point. Here: There is one world. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Every relational type holds every function between its domains, and there is one world. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

Explicit specialization of the source's standard Henkin construction to an infinite individual domain, recorded to separate the type-$e$ infinity principles from the type-$t$ ones: it satisfies the Axiom of Infinity at type $e$, hence Possible Infinity at type $e$, while violating the Axiom of Infinity at type $t$. It also shows that the sentence used in pure-possibility-implies-axiom-of-infinity-t, that there could be any positive number of individuals, does not follow from the Axiom of Infinity at type $e$: here there is not possibly exactly one individual. It also witnesses the consistency of C with Goodsell's $I$, assumed in n. 14 of Arithmetic is Necessary: with infinitely many individuals the numerals are pairwise distinct, so $\operatorname{Suc}_e$ is injective on finite cardinalities and $I^*$, hence $I$, is true. With Boolean Completeness listed, the model also shows Countable Boolean Completeness consistent with C. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Strong Atomicity and its necessitation. Box is truth in this model, so a strong atom is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Atomicity, □Strong Atomicity.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-infinite-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48
