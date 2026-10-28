# Finite-support action model: N and singleton, all maps

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers, where the numbers are the finite cardinalities of properties of a type $\sigma$. One sentence for each type $\sigma$ and each arithmetical sentence at $\sigma$.
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.
- **Two-hat necessity implies ND-necessity.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.
- **□5-necessity implies two-hat necessity.** Necessarily, whatever is 5-necessary is two-hat necessary. In C this is the identity $\Box_5=\hat{\hat\Box}$.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ □Atoms are self-atoms (type t).** Necessarily, every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ □Atoms are strong atoms (type t).** Necessarily, every atom is a strong atom.
- **¬ □BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **¬ Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ □BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a inextensible one.
- **¬ Vicinity.** There is a true proposition that entails the possibility of each true proposition.
- **¬ Weakly Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a weakly inextensible one.
- **¬ □Two-hat necessity implies ND-necessity.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

An ideally full action model in the sense of Classicism, Appendix D, over a category with two objects, each carrying the ideal of finite sets: a model of C by Proposition D.4. The member's construction and evaluation point follow.

Appendix D, p. 79, the paragraph beginning “One particularly interesting result”: two objects, $W_0=\mathbb N$ and $W_1=\{0\}$, with all functions between them as arrows, $W_i^\ddagger$ the finite subsets of $W_i$, and the model ideally full as in Proposition D.5. Evaluation point: $W_0$, at its identity arrow.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finitely pinned action models on two objects, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails □Atoms are self-atoms (type t), □Atoms are strong atoms (type t).

Write $!$ for the only arrow $W_0\to W_1$ and $c_n$ for the arrow $W_1\to W_0$ with value $n$. At $W_1$ every proposition is pinned down by $\{0\}$, so the domain is full and the atoms are the singletons. $\{c_n\}$ is not a self-atom: its transport along $c_n$ is the set of maps $m$ of $\mathbb N$ with $m(n)=n$, pinned down by $\{n\}$ but not an atom. So Atoms are self-atoms (type t), and with it Atoms are strong atoms (type t), fail at $W_1$, which $!$ reaches, and their boxed forms fail at $W_0$. No self-atom contains an arrow into $W_0$ at either object, since its transport along that arrow would be an atom containing $1_{W_0}$ and Actuality fails at $W_0$; so the self-atoms are $\{1_{W_1}\}$ at $W_1$ and $\{!\}$ at $W_0$, the latter pinned down by $\varnothing$ and an atom. Both are strong atoms: $\{!\}$ becomes $\{1_{W_1}\}$ under $!$ and $\{!\}$ under any map of $\mathbb N$, and $\{1_{W_1}\}$ becomes $\{!\}$ under $c_n$. A self-atom of a relational type has a self-atom as its existential projection, so sits over one of these, with one tuple, by the transport condition; so it is an atom and a strong atom. Hence Self-atoms are atoms and Self-atoms are strong atoms hold at both objects, at every type.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds BF. Fails □BF.

BF holds at $W_0$, since every map agrees on any finite set with a surjection, and fails at $W_1$, where $\forall y\,\Box\,x=y$ holds of the one individual but $\Box\forall y\,x=y$ does not; so BF holds without $\Box$BF.

*Source: Classicism, p. 79. By Andrew Bacon and Cian Dorr, 2026-09-17.*

### Fails Atomlessness.

The closed sentence that there is exactly one individual denotes the singleton of the unique map to $W_1$, a nonempty proposition with no nonempty proper subproposition.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-19.*

### Holds Axiom of Infinity (type e), Axiom of Infinity (type t).

The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

### Fails Truth implies ND-necessity.

The transposition of $5$ and $6$ is an arrow with an inverse, so for any true $q$ the composite of a member of $q$ with the inverse carries the transposition into $q$, making $\Diamond q$ true there, while the true proposition that $5$ is fixed is false there.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

### Holds □Relational Choice.

The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. Given a relation $U$ serial at $V$, choose for each $x$ a $y$ with $(Ux)y$, by choice in the metatheory; the graph is such an $R$, and its element $S$ is functional and a subrelation of $U$ at $1_V$, both conditions being unboxed. The closed Relational Choice instance is true at an arrow $h\colon W_0\to V$ iff it is true at $1_V$ in the truncation by $h$, whose domains at $V$ are those of the model, so it holds at every arrow and $\Box$Relational Choice follows.

*By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), 2026-09-23.*

### Fails Boolean Completeness (type t), Countable Boolean Completeness.

Any set $F$ of propositions is the extension of the profile $\langle h,p\rangle\mapsto\{i : i\cdot p\in F\}$, and for $F$ the family of propositions $A_m$ that a map $W_0\to W_0$ is constant on $\{0,\ldots,2m-1\}$ and first changes value at $2m$, the least superset of $\bigcup F$ pinned down by $\{0,\ldots,N\}$, the maps whose first change is at an even position or beyond $N$, strictly shrinks as $N$ grows, so $F$ has no least upper bound. The family is countable in the model's sense, the relation pairing $A_m$ with the numeral $m$ being in the domain by extensional fullness, so Countable Boolean Completeness fails too.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

*Revised 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Refutes the instance of Countable Boolean Completeness counting at $e$, which the principle, now schematic in that type, includes.

### Holds Necessity of Arithmetic.

At $W_0$ the finite cardinalities are the standard numerals and $I^*$ is true; at $W_1$ the numerals remain pairwise distinct, because they differ at the arrows back into $W_0$ and identity is necessary, $I^*$ is again true, the numerals are the finite cardinalities by extensional fullness, and $\operatorname{Sum}$ and $\operatorname{Prod}$ are standard, their graphs being in the domain; so every arithmetical sentence has its standard truth value at every world.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

*Revised 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Necessity of Arithmetic is now a schema in the type $\sigma$ whose finite cardinalities are the numbers, and the argument covers every $\sigma$ unchanged. At $W_0$ every type has infinitely many entities, so $I^*_\sigma$ is true there, and the numerals at $\sigma$ are standard by the argument for the Axioms of Infinity, whose set of numerals at each type is invariant under every arrow. At $W_1$ the numerals at $\sigma$ still differ at the arrows back into $W_0$, the set of them is in the domain and closed under zero and successor, and the graphs of $\operatorname{Sum}_\sigma$ and $\operatorname{Prod}_\sigma$ are in the domain, as at $e$.

### Fails □BF (type t).

At $W_1$ the arrow $c_n\colon W_1\to W_0$ picking $n$ sends a proposition $q$ to $\{j : c_{j(n)}\in q\}$ (with the arrow to $W_1$ added when $q$ contains $1_{W_1}$), a proposition pinned down by $\{n\}$, so the proposition that $0$ and $1$ are collapsed is in no such image; the profile holding at $\langle h,d\rangle$ iff $h=1_{W_1}$ or $d$ is in the image of $h$, pinned down by $\{0\}$, is necessary of every proposition at $W_1$ but not universal at the world $c_0$.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

### Fails Inextensible Comprehension.

At type $t\to t$, for the family $E$ of propositions $p_n$ that $n$ is fixed: for $Y$ inextensible with extension $E$ pinned down by the finite set $S$, pick $k\notin S$ and let $X$, pinned down by $S_X:=S\cup\{k\}$, hold at an arrow $h$ into $W_0$ exactly of the propositions $\{i : i(m)=n\}$ with $n\notin S_X$ and of the propositions $\{i : i(h(n))=n\}$ with $n\in S_X$; $X$ is necessary of every $p_n$, so $Y\le X$, yet at a map $h$ fixing $S$ pointwise and moving $k$, where $h\cdot Y=Y$, the extension of $X$ omits $p_k$.

*Address: `finite-support-two-object-all-maps#inextensible-comprehension`. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

### Holds B for sentences of Σ.

A closed $\Sigma$-sentence denotes what $P(d,\ldots,d)$ denotes for a pure $P$ and the individual $d$, and from any world some arrow into $W_0$ carries the current image of $d$ back to $d$, as all maps are arrows.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

### Fails Vicinity.

A true $w$ pinned down by a finite set $S$ contains every arrow agreeing with the identity on $S$, among them a map $W_0\to W_0$ that collapses two individuals $a\ne b$ outside $S$. The proposition that $a$ and $b$ are distinct is true, and it is possible at no arrow that collapses them, since a collapse persists under composition, so $w\not\le\Diamond(a\ne b)$.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

### Fails Weakly Inextensible Comprehension.

The argument above against Inextensible Comprehension at type $t\to t$ uses only the unboxed matrix of inextensibility at the identity arrow of $W_0$, as the corresponding argument in the permutation model does.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

### Holds □Rigid Power.

Boxed Rigid Power, by lifting at each object; criterion (1) is part (1) of tame-rigidity-factorizable, which holds with several objects. Write $c$ for the map to the singleton and $i_n$ for the map from it with value $n$.
(a) Stable hulls. Let $F$ be rigid at $\mathbb N$ with extension $E$, $P$ a nonempty finite set containing a pin of $F$, and $A\subseteq E$ closed under the self-maps fixing $P$. Then $Y:=B_P(A)$ has extension $A$, lies below $F$, and is rigid. Weak rigidity at $\mathbb N$ is as in rigid-power-surjections, part (a), with self-maps (into the singleton, $r:=c$). For a self-map $h$, a member $k^{\prime}a$ of $Y_{kh}$ ($k^{\prime}$ agreeing with $kh$ on $P$) is $j(ra)$ with $ra\in Y_h$, $r$ agreeing with $h$ on $P$ and sending the rest of a pin of $a$ to fresh points, and $j$ agreeing with $k$ on any given finite $N\supseteq hP$; and $Y_c=cA=cY_h$ since $cr=c$; so $h\cdot Y$ is weakly rigid. At the singleton a weakly rigid relation is the exact image of its extension; $c\cdot F$ is rigid, so $F_{i_nc}=i_ncE$, and a member $x=ga$ of $Y_{i_nc}$ ($g$ agreeing with $i_nc$ on $P$) lies in $i_ncE$, so $x=i_ncx=i_ncga=i_nca$, $cg$ being $c$. So $c\cdot Y=T(cA)$, which is rigid.
(b) Lifting at $\mathbb N$. A weakly rigid $H$ with extension $E$ has $H_j=jE$ for every surjective self-map $j$, as in rigid-power-surjections, part (b). Given a rigid $F$, an arrow $k$, a finite $N$ containing a pin of $F$, and a rigid $X\le k\cdot F$ with extension $D$ pinned down by $T$: if $k$ is a self-map, extend $k|_N$ to a surjection $j$ with finitely many non-singleton fibres, all finite, take $P$ containing $N$, those fibres and preimages of $T$, and $A:=\{a\in E:ja\in D\}$; for $u$ fixing $P$, $ju=vj$ with $v$ fixing $T$, so $uA\subseteq A$, and $j\cdot B_P(A)=X$ by (a) and the exact-image fact. If $k=c$, take $A:=\{a\in E:ca\in D\}$, stable since $cu=c$, and $c\cdot B_P(A)=X$.
(c) At the singleton every rigid $F$ is $T(E)$ and every $T(A)$, $A\subseteq E$, is admitted; a rigid $X\le i_n\cdot F$ with extension $D$ is $i_n\cdot T(cD)$, since $ci_n=1$. So the power property of every rigid relation, at either object, is weakly rigid, and Rigid Power holds at every world. Weakly Rigid Power still fails, with Tame Rigidity.

*Address: `finite-support-two-object-all-maps#rigid-power`. By GPT-6 Astra (OpenAI), at Cian Dorr's request; checked and recorded by Claude Opus 5.5 (Anthropic), 2026-10-11.*

### Holds Two-hat necessity implies ND-necessity, □5-necessity implies two-hat necessity. Fails □Two-hat necessity implies ND-necessity.

Write $\mathrm{fix}_N$ for the arrows agreeing with the identity on the finite set $N$, the least true proposition pinned by $N$, and $\delta_N$ for the arrows injective on $N$. At $W_0$ the arrows are all maps $\mathbb N\to\mathbb N$ and the one map $c$ to $W_1=\{0\}$. $\Diamond\,\mathrm{fix}^{00}_N$ is the set of maps injective on $N$, together with $c$ when $|N|\le1$; the same set is $\hat\Diamond\,\mathrm{fix}^{00}_N$, since an injective-on-$N$ map is undone by a bijection and $c$ by the map picking the point of $N$, which returns to every truth at $W_1$ ($W_1$ is a point, so its domains are full and $c\circ v=1_{W_1}$). So $\Box_{\ne}$ and $\hat{\hat\Box}$ coincide at the evaluation point. BF at type $t$ holds for $\hat{\hat\Box}$ there: for $Y$ pinned by $X_Y$ and $N\supseteq X_Y$ with two elements, every $k\in\hat\Diamond\,\mathrm{fix}^{00}_N$ is a map injective on $N$, which agrees on $X_Y$ with a bijection $b$, and $Y_k=Y_b$ contains every transport along $b$, i.e. everything; so by Proposition D8 of The Bounds of Possibility $\Box_5$ implies two-hat necessity at $W_0$, and at $W_1$ too, which is full. The truth $\mathrm{fix}^{00}_{\{0\}}$ is not 5-necessary, since $\Box_5\le\hat{\hat\Box}$ fails on it (a bijection moving $0$ is in every $\hat\Diamond\,\mathrm{fix}^{00}_N$). At $W_1$, the maps $W_1\to W_0$ are retracted by $c$ but not invertible, so, $W_1$ being full, $\{1_{W_1}\}$ is two-hat necessary and not ND-necessary there: the identity $\Box_{\ne}=\hat{\hat\Box}$ fails. (The verdicts this argument also establishes but does not record are derived by the engine.)

*Address: `finite-support-two-object-all-maps#collapse-at-root`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Fails Analytic Necessitism.

Let $k$ be an arrow out of the evaluation object $w$ with $ka=kb$ for two distinct points $a$ and $b$ of the set the arrows act on, and let $q$ be the set of arrows $j$ out of $w$ with $ja\ne jb$. It contains the identity, is pinned down by $\{a,b\}$, is symmetric (an arrow separates $a$ from $b$ iff its composite with a permutation of the points does), and contains no arrow $j\circ k$. Let $\tau$ be $tt$, or $tttt$ in the case noted below. No entity $x$ of type $\tau$ at $w$ is determined by its transport along $k$: let $y$ agree with $x$ except at the arrows in $q$, where the top entity of the argument type of $\tau$ is added to its value or removed from it. Then $y$ is pinned down by a finite set along with $x$, is symmetric if $x$ is, so is in the domain; it differs from $x$ and has $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. If $\mathfrak R$ were a rigid real number structure at $w$ of type $\tau$, necessarily a real number structure, with carrier $X$ (Background, Analysis), an instance $x$ of $X$ and $y$ as above would give $k\cdot y=k\cdot x\in X_k$ by persistence, $Xy$ by inextensibility, and $k\cdot y\ne k\cdot x$ by the necessary distinctness of the instances: so $X$ has no instance. The antecedent of Analytic Necessitism holds, however, at type $\tau$. The propositions are infinitely many and, in the recorded instances, include a copy of the natural numbers, so by extensional fullness the entities of type $tt$, which include one with any set of propositions as extension at the identity, include a copy of the sets of natural numbers and so of the reals, whose order, sum, product and natural numbers are the extensions at the identity of relations in the domain; the structure is complete, every subset of its carrier being the extension of a subproperty, so $\exists\mathfrak R\,.\,\operatorname{Real}_{tt}(\mathfrak R)$ holds at $w$. (Should the propositions be infinite without including a copy of the natural numbers, the same holds at type $tttt$, the sets of sets of propositions being Dedekind-infinite in ZF.) So Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-collapsing-arrow-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Ideally full with the ideal of finite sets: every intension pinned down by a finite set is in the domain, and every entity in a domain is one. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3). It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $W_0$ include, for each $n$, the set of arrows sending $0$ to $n$. It requires that Some arrow out of the evaluation object sends two distinct points of the set the arrows act on to one point. Here: Any non-injective map of $\mathbb N$, say the constant map with value $0$, is an arrow out of $W_0$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: Ideally full with the ideal of finite sets: every intension pinned down by a finite set is in the domain, and every entity in a domain is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3). It requires that There are infinitely many propositions at the evaluation world. Here: The propositions at $W_0$ include, for each $n$, the set of arrows sending $0$ to $n$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full at both objects, and an intension whose value at an arrow depends only on the arrow's codomain is pinned down by $\emptyset$ (Appendix D, the remark after Definition D.3). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: The model is ideally full at both objects, and an intension whose value at an arrow depends only on the arrow's codomain is pinned down by $\emptyset$ (Appendix D, the remark after Definition D.3). By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3). By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.


## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-27** (Claude Opus 5.5 (Anthropic), at Cian Dorr's request) — Recorded the failure of Vicinity and of Weakly Inextensible Comprehension; arguments in the notes. Now violates: Vicinity, Weakly Inextensible Comprehension.
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell) — Added Transversal Choice, by the argument recorded for Relational Choice: the model is extensionally full at every object, so for an equivalence relation at the evaluation point a transversal of its extension there, chosen in the metatheory, is the extension of an element pinned down by the empty set; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Settled Actuality, Atomicity (type t), Boolean Completeness (type t), Countable Boolean Completeness, □BF (type t) and Inextensible Comprehension as failing, and Necessity of Arithmetic, B for pure sentences and B for sentences of Σ as holding, with the arguments in the notes. Now satisfies: B for pure sentences, B for sentences of Σ, Necessity of Arithmetic. Now violates: Actuality, Atomicity (type t), Boolean Completeness (type t), Countable Boolean Completeness, □BF (type t), Inextensible Comprehension.
- **2026-09-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — Merged the two sets of arguments recorded on 23 and 25 September into one, keeping the 23 September argument for Atomicity (type t).
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Expanded the description from Appendix D; settled the Distinctness-preserving collapse. Now violates: Truth implies ND-necessity.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Relational Choice and its necessitation at Cian Dorr’s direction: ideally full models are extensionally full at every object, and choice in the metatheory supplies the functional subrelation; see the notes. Now satisfies: Relational Choice, □Relational Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of Atomicity (type t), and with it of Strong Atomicity; see the notes. Now violates: Atomicity (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-19** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added the failure of Atomlessness at N, witnessed by the proposition that there is exactly one individual, which is the singleton of the arrow to {0}. Original observation; not in the source.
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: BF. Now violates: □BF.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, paragraph beginning “One particularly interesting result”.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-two-object-all-maps.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, paragraph beginning “One particularly interesting result”
