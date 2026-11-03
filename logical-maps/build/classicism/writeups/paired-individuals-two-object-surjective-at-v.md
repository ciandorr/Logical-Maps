# Paired-individuals two-object model: surjective block-respecting maps, evaluated at the second object

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 14 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026.</p>

## Package

- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **B for pure sentences.** The B instance for every closed sentence in the pure language.
- **□Tame Rigidity.** Necessarily, every weakly rigid relation, including a proposition, is rigid.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **Second-Order Analytic Necessitism.** If there could be a real number structure, there is a rigid one, necessarily a real number structure, together with represented powers of every arity up to $n$: rigid properties of rigid relations among the structure's elements that necessarily represent every relation on them. One sentence for each type $\sigma$ and each $n\ge1$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Two-hat necessities are ND-necessary.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.
- **¬ Truths are 5-necessary.** Every truth is 5-necessary: necessary under every S5 operator.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ □5-necessities are two-hat necessary.** Necessarily, whatever is 5-necessary is two-hat necessary. In C this is the identity $\Box_5=\hat{\hat\Box}$.
- **¬ Weakly Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a weakly inextensible one.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An ideally full action model in the sense of Classicism, Appendix D, over a category with two objects, each carrying the ideal of finite sets: a model of C by Proposition D.4. The member's construction and evaluation point follow.

A two-object ideally full action model. Fix a fixed-point-free involution $\pi$ on $\mathbb N$ (say $2k\leftrightarrow 2k+1$), which partitions $\mathbb N$ into two-element blocks. The objects are $W_0$, with individuals $\mathbb N$, and $V$, with individuals $\mathbb N\sqcup\{\star\}$ where $\star$ forms a block by itself. The arrows are all surjective block-respecting maps between these sets: $g(\pi c)\in\{g(c),\pi g(c)\}$ for every $c$, so a block maps into a block, either injectively or collapsed to a point, there are surjective arrows $W_0\to V$, obtained by collapsing one block onto $\star$ and mapping the remaining blocks onto all blocks; and the new individual $\star$ can be hit only by collapsing a block onto it. The pinning action is the identity on individuals, the ideal is the finite sets, and the individuals are the type-$e$ domains, so the model is ideally full in the sense of Classicism, Appendix D, and a model of C by its Proposition D.4. The evaluation point is the identity on $V$, the object with the new individual $\star$; every object is reachable from it, since there are surjective arrows $V\to W_0$ (send $\star$ anywhere).


Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finitely pinned action models on two objects, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □BF.

Every arrow is surjective on individuals, hence on finite sets of individuals, so Proposition D.6 of Classicism gives BF at every type with any object as the evaluation point.

*Address: `paired-individuals-two-object-surjective-at-v#necessary-barcan`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Two-hat necessities are ND-necessary.

At $V$ let $p:=\mathrm{fix}^{VV}_{\{\star\}}$, the true proposition that $\star$ is fixed. For any true $q$ at $V$, pinned by $N_q$, the surjection $u\colon V\to W_0$ that is the identity on $\mathbb N$ and sends $\star$ into a block $B$ disjoint from $N_q$ lies in $\Diamond q$ (a surjection fixing $N_q$ and collapsing $B$ onto $\star$ brings it back into $\mathrm{fix}^{VV}_{N_q}$) but not in $\hat\Diamond p$, since every $v$ with $vu\in p$ collapses $B$ onto $\star$ and so cannot return to $\mathrm{fix}^{00}_B$. So B fails for $\Box_{\ne}$ at $p$. By Proposition D11 of The Bounds of Possibility, $p\to\hat{\hat\Box}\hat\Diamond p$, so $\hat\Diamond p$ is two-hat necessary; it is not ND-necessary, which is what the failure of B says. Actuality fails: the true propositions $\mathrm{fix}^{VV}_N$ descend strictly.

*Address: `paired-individuals-two-object-surjective-at-v#nd-necessity-not-b`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Truths are 5-necessary.

As in the record evaluated at $W_0$, the three-hat operator $\hat{(3)}\Box$ is necessarily B in this model, so it is an S5 operator and $\Box_5\le\hat{(3)}\Box$; at $V$ its cluster on $\mathrm{fix}^{VV}_N$ is the set of surjective block-bijections of $V$ fixing $\star$ and block-injective on $N$, which contains arrows moving any given point of $\mathbb N$, so the truth $\mathrm{fix}^{VV}_N$ is not 5-necessary.

*Address: `paired-individuals-two-object-surjective-at-v#not-all-truths-five-necessary`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Countable Boolean Completeness, Boolean Completeness (type t).

*Like `paired-individuals-two-object#countable-boolean-completeness-t`: The arrows are the surjective block-respecting maps, and the evaluation object is $V$; the family consists of arrows $V\to V$, the block $\{\star\}$ is sent to $\star$ in the witnesses, and every arrow used can be made surjective by mapping the infinitely many blocks after those named onto every block. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Holds Atomlessness.

At either object let $p\ne\bot$ be pinned down by a finite $N$ and contain $h$. Take a block $B$ disjoint from $N$ and its $\pi$-image and $b\in B$: some arrow agreeing with $h$ on $N$ sends $b$ to $h(b)$ and some sends it elsewhere, both in $p$ (in the surjective model the infinitely many other blocks keep it surjective), so the arrows in $p$ sending $b$ to $h(b)$ lie strictly between $\bot$ and $p$.

*Address: `paired-individuals-two-object-surjective-at-v#atomlessness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Necessity of Arithmetic.

Both objects are extensionally full with infinitely many individuals, so at each the numbers at every type are the distinct numerals with standard sum and product, and an arithmetical sentence holds at every world iff it is true.

*Address: `paired-individuals-two-object-surjective-at-v#necessity-of-arithmetic`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds B for sentences of Σ, B for pure sentences.

There are arrows each way between the objects, so from every world both identities are reachable, and a closed sentence holds at an arrow iff at its codomain's identity; so $\varphi\to\Box\Diamond\varphi$. With Σ top a closed Σ-sentence denotes what a pure one does.

*Address: `paired-individuals-two-object-surjective-at-v#signature-b`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails No Pure Contingency, □5-necessities are two-hat necessary.

No Pure Contingency fails at $W_0$ (paired-individuals-two-object-surjective), so some closed pure sentence true at $W_0$ is false at $V$, whose negation is then true at $V$ and false along an arrow to $W_0$. And 5-necessities are two-hat necessary fails at $W_0$, which $V$ reaches.

*Address: `paired-individuals-two-object-surjective-at-v#at-v`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Tame Rigidity.

*Write-up: [paired-individuals-two-object](paired-individuals-two-object.html). Like `paired-individuals-two-object#tame-rigidity`: The arrows are the surjective block-respecting maps and the evaluation object is $V$. The write-up proves the argument at both objects in both categories: every arrow it constructs completes a finite block prescription, and can be made surjective by mapping the infinitely many unused pairs onto the uncovered pairs and collapsing one more onto $\star$ if needed; at $V$ the finite sets used contain $\star$. Address: `paired-individuals-two-object-surjective-at-v#tame-rigidity`. By GPT-6 Astra (OpenAI), prompted by Cian Dorr; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Weakly Inextensible Comprehension.

*Write-up: [paired-individuals-two-object](paired-individuals-two-object.html). Like `paired-individuals-two-object#weakly-inextensible-comprehension`: The arrows are the surjective block-respecting maps and the evaluation object is $V$. The write-up proves the argument at both objects in both categories: every arrow it constructs completes a finite block prescription, and can be made surjective by mapping the infinitely many unused pairs onto the uncovered pairs and collapsing one more onto $\star$ if needed; at $V$ the finite sets used contain $\star$. Address: `paired-individuals-two-object-surjective-at-v#weakly-inextensible-comprehension`. By GPT-6 Astra (OpenAI), prompted by Cian Dorr; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Rigid Power.

*Write-up: [paired-individuals-two-object](paired-individuals-two-object.html). Like `paired-individuals-two-object#rigid-power`: The arrows are the surjective block-respecting maps and the evaluation object is $V$. The write-up proves the argument at both objects in both categories: every arrow it constructs completes a finite block prescription, and can be made surjective by mapping the infinitely many unused pairs onto the uncovered pairs and collapsing one more onto $\star$ if needed; at $V$ the finite sets used contain $\star$. Address: `paired-individuals-two-object-surjective-at-v#rigid-power`. By GPT-6 Astra (OpenAI), prompted by Cian Dorr; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Analytic Necessitism, Second-Order Analytic Necessitism.

At type $\tau:=tt$. For each object $V$ reachable from the evaluation point fix an injection $A\mapsto E^A_V$ from the sets of natural numbers into the sets of propositions at $V$, possible as these are infinitely many, and let $Y_A$ be the intension whose value at an arrow into $V$ is $E^A_V$: it depends only on the codomain, so it is in the domain, and its transport along an arrow into $V$ is the $Y_A$ of $V$, distinct for distinct $A$. Carry the real numbers onto the $Y_A$ and take as relations the codomain-only intensions whose value at $V$ is the corresponding set of tuples of the $Y_A$ of $V$. Along every arrow the structure is carried to the like structure at the target, an isomorphic copy, which is a real number structure there: bounded sets of its elements have least upper bounds among them and every inductive subproperty contains its natural numbers. Such a structure is rigid, its instances are necessarily distinct, and it is necessarily a real number structure; and the codomain-only intension of type $((\tau)^kt)t$ whose value at each object is the set of codomain-only $k$-ary relations among the carrier there is a represented power of arity $k$, since at every world each $k$-ary relation agrees on the carrier with one of them. So the consequents of Analytic Necessitism and of its second-order form hold, and both principles hold. (The argument of the withdrawn analytic-necessitism-unretracted-arrow would refute this structure; its step from inextensibility is the gap.)

*General argument `arguments/analytic-necessitism-codomain-everywhere`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full with the ideal of finite sets and no symmetry group, so every intension pinned down by the empty set, i.e. whose value at an arrow depends only on the codomain, is in the domain at every object (Classicism, Definition D.3). It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: At both objects the propositions that an arrow sends $0$ to $n$, one for each $n$, are pinned down by $\{0\}$ and pairwise distinct. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, auditing the withdrawn arguments for the failure of Analytic Necessitism, 2026-10-29.*

### Fails Analytic Necessitism.

*Withdrawn 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, after a trawl subagent's report: The step from $k\cdot y=k\cdot x\in X_k$ to $Xy$ (or $y\in X_h$) by inextensibility does not follow: inextensibility bounds a rigid carrier from above, by the transports of its actual instances, and puts nothing new into its actual extension. The conclusion is false in many of the models the argument was applied to: entities fixed by every arrow, or transported injectively, can carry a rigid real number structure that is necessarily one (see analytic-necessitism-codomain-fixed and analytic-necessitism-full-continuum).*

Let $k$ be an arrow out of the evaluation object $w$ with $ka=kb$ for two distinct points $a$ and $b$ of the set the arrows act on, and let $q$ be the set of arrows $j$ out of $w$ with $ja\ne jb$. It contains the identity, is pinned down by $\{a,b\}$, is symmetric (an arrow separates $a$ from $b$ iff its composite with a permutation of the points does), and contains no arrow $j\circ k$. Let $\tau$ be $tt$, or $tttt$ in the case noted below. No entity $x$ of type $\tau$ at $w$ is determined by its transport along $k$: let $y$ agree with $x$ except at the arrows in $q$, where the top entity of the argument type of $\tau$ is added to its value or removed from it. Then $y$ is pinned down by a finite set along with $x$, is symmetric if $x$ is, so is in the domain; it differs from $x$ and has $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. If $\mathfrak R$ were a rigid real number structure at $w$ of type $\tau$, necessarily a real number structure, with carrier $X$ (Background, Analysis), an instance $x$ of $X$ and $y$ as above would give $k\cdot y=k\cdot x\in X_k$ by persistence, $Xy$ by inextensibility, and $k\cdot y\ne k\cdot x$ by the necessary distinctness of the instances: so $X$ has no instance. The antecedent of Analytic Necessitism holds, however, at type $\tau$. The propositions are infinitely many and, in the recorded instances, include a copy of the natural numbers, so by extensional fullness the entities of type $tt$, which include one with any set of propositions as extension at the identity, include a copy of the sets of natural numbers and so of the reals, whose order, sum, product and natural numbers are the extensions at the identity of relations in the domain; the structure is complete, every subset of its carrier being the extension of a subproperty, so $\exists\mathfrak R\,.\,\operatorname{Real}_{tt}(\mathfrak R)$ holds at $w$. (Should the propositions be infinite without including a copy of the natural numbers, the same holds at type $tttt$, the sets of sets of propositions being Dedekind-infinite in ZF.) So Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-collapsing-arrow-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Ideally full with the ideal of finite sets: every intension pinned down by a finite set is in the domain, and every entity in a domain is one. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $V$ include, for each $n$, the set of arrows sending $0$ to $2n$. It requires that Some arrow out of the evaluation object sends two distinct points of the set the arrows act on to one point. Here: The surjective block-respecting map of $V$ collapsing the block $\{0,1\}$ onto $\star$ and mapping the remaining blocks onto all the blocks of $\mathbb N$ is an arrow out of $V$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Ideally full with the ideal of finite sets: every intension pinned down by a finite set is in the domain, and every entity in a domain is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Axiom of Infinity (type e), Infinity Schema (type e).

The Infinity schema holds, there being $n$ distinct individuals for every $n$. For the Axiom: by extensional fullness the domain has a property of cardinalities true of $Z$ exactly when every property $Z$ holds of has a finite extension. It holds of $\mathbf{0}_e$, which holds only of empty properties, and passes from $Y$ to $\operatorname{Suc}_e Y$, which holds of $F$ only if $Y$ holds of $F$ less one of its instances. So every finite cardinality has it, and none holds of the universal property, whose extension is infinite.

*General argument `arguments/infinitely-many-individuals`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). It requires that There are infinitely many individuals at the evaluation world. Here: The individuals are infinite at both objects. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $V$ include, for each $n$, the set of arrows sending $0$ to $2n$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full with the ideal of finite sets and no symmetry group, so every intension pinned down by the empty set, i.e. whose value at an arrow depends only on the codomain, is in the domain at every object (Classicism, Definition D.3). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Axiom of Infinity (type e).

In an action model a closed sentence holds at an arrow out of the evaluation object exactly when it holds at the identity arrow of the arrow's target, closed terms denoting entities that every arrow carries to the corresponding denotations at its target (in a one-world or Kripke-style model, the reachable objects are the worlds the evaluation point sees); so it suffices that the Axiom of Infinity at type $e$ holds at the identity arrow of every reachable object $v$. Fix such a $v$, and let $\Phi$ be the entity of type $(et)t$ in the domain at $v$ that holds there of exactly the properties with finite extension. The domain is closed under the operations defined by closed terms, so it contains $W:=\lambda Y^{(et)t}\, .\,\forall X^{et}\, .\,YX\to\Phi X$, which holds at $1_v$ of exactly the cardinalities holding there only of properties with finite extension. $W$ holds of $\mathbf 0_e$, which holds only of properties with empty extension. It passes from $Y$ to $\operatorname{Suc}_e Y$: if $\operatorname{Suc}_e Y$ holds of $X$, then $Xy$ and $Y(\lambda u\, .\,Xu\land u\ne y)$ for some $y$, and since identity at $e$ is literal at $1_v$ the extension of $\lambda u\, .\,Xu\land u\ne y$ is that of $X$ less $y$, which is finite as $W$ holds of $Y$; so $X$ has finite extension. Hence every $Z$ that is a finite cardinality at $1_v$ falls under $W$, and does not hold of $\lambda u\, .\,\top$, whose extension, all the individuals at $v$, is infinite. The step from the domain's entity $\Phi$ is what rules out a nonstandard finite cardinality: without it the impredicative ancestral ranges only over the domain's properties of cardinalities, which need not include one that excludes the universal property. No choice is used: "finite" means in bijection with a natural number, and an infinite set need not be Dedekind infinite.

*General argument `arguments/necessary-axiom-of-infinity-individuals`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: At each object the domain holds every intension pinned down by a finite set, among them those that depend only on the arrow's codomain, pinned down by $\emptyset$, which give any extension at the identity arrow; the haecceity of an entity is pinned down by the set pinning the entity, so identity is literal. It requires that There are infinitely many individuals at every object reachable from the evaluation point. Here: The individuals are $\mathbb N$ at $W_0$ and $\mathbb N\sqcup\{\star\}$ at $V$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Axiom of Infinity (type t).

As for individuals (necessary-axiom-of-infinity-individuals), at type $t$. At the identity arrow of each reachable object $v$, with $\Phi$ of type $(tt)t$ holding there of exactly the properties of propositions with finite extension, $\lambda Y^{(tt)t}\, .\,\forall X^{tt}\, .\,YX\to\Phi X$ is in the domain, holds of $\mathbf 0_t$, and passes to successors, identity at $t$ being literal at $1_v$; so every finite cardinality holds only of properties with finite extension, and none holds of the universal property of propositions, whose extension is the infinite set of propositions at $v$. So the Axiom of Infinity at type $t$ holds at every reachable object, and its necessitation at the evaluation point.

*General argument `arguments/necessary-axiom-of-infinity-propositions`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: At each object the domain holds every intension pinned down by a finite set, among them those that depend only on the arrow's codomain, pinned down by $\emptyset$, which give any extension at the identity arrow; the haecceity of an entity is pinned down by the set pinning the entity, so identity is literal. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: At both objects the propositions that an arrow sends $0$ to $n$, one for each $n$, are pinned down by $\{0\}$ and pairwise distinct. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full with the ideal of finite sets and no symmetry group, so every intension pinned down by the empty set, i.e. whose value at an arrow depends only on the codomain, is in the domain at every object (Classicism, Definition D.3). By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds □Atomlessness, □Atoms are self-atoms, □Atoms are strong atoms, □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

An atom of a relational type at a reachable object would give, by existential projection, an atom of type $t$ there (as in the argument no-actuality-no-self-atoms), which the condition excludes; so no reachable object has an atom of any relational type, nor a self-atom, since a self-atom is an atom where it is instantiated. All four bridge principles therefore hold vacuously at every type and every reachable object, and Self-Atomicity (type t) fails at the evaluation point.

*General argument `arguments/no-atoms-no-self-atoms`. It requires that At every object reachable from the evaluation point, no proposition in the domain is an atom. Here: At either object let $p\ne\bot$ be pinned down by a finite $N$ and contain $h$. Take a block $B$ disjoint from $N$ and its $\pi$-image and $b\in B$: some arrow agreeing with $h$ on $N$ sends $b$ to $h(b)$ and some sends it elsewhere, both in $p$ (in the surjective model the infinitely many other blocks keep it surjective), so the arrows in $p$ sending $b$ to $h(b)$ lie strictly between $\bot$ and $p$. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Now also gives □Atomlessness, which the condition states: a reachable object with no atom of type $t$ satisfies Atomlessness. The bridge verdicts and the failure of Self-Atomicity are now also consequences of □Atomlessness by recorded results.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: Ideally full action models are extensionally full (Classicism, p. 74). By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

The surjective paired-individuals model with its other object as the evaluation point. Necessary BF holds at every type, yet Two-hat necessities are ND-necessary fails here, so BF at no type, boxed or not, yields that collapse. Built in the conversation of 14 October 2026.

## Sources

- **Dorr–Claude 14 Oct** — Cian Dorr and Claude Fable 5.1 (Anthropic), conversation of 14 October 2026 (transcript in the private notes).
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Definitions D.1–D.3 and Proposition D.4, pp. 73–74 (ideally full action models).

<p class='cert'>Record: <code>topics/classicism/models/paired-individuals-two-object-surjective-at-v.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, pp. 73–74
- **Background: The Bounds of Possibility.** Dorr, Cian, John Hawthorne, and Juhani Yli-Vakkuri (2021). The Bounds of Possibility. Oxford University Press. Appendix D, Narrower Modalities in Higher-Order S4, pp. 400–409; locators follow the OUP corrected proof dated 9 May 2024. Its background logic HS4 (a primitive S4 operator over higher-order logic) is read into C by interpreting the primitive box as $\lambda p\, .\,p=\top$, under which every theorem of HS4 is a theorem of C. — Appendix D
