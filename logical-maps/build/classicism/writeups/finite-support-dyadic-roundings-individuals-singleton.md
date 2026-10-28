# Finite-support action model: dyadic roundings of N [one individual]

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Relational Choice.** Necessarily, every serial binary relation has a functional subrelation.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Boolean Completeness (type t).** Every property of propositions has a greatest lower bound.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Proposition D.5, part 7 (p. 78): the arrows are the maps $f_n$, for $n$ a power of $2$, sending $m$ to the greatest multiple of $n$ not exceeding $m$; $f_1$ is the identity. In every part, $W_0^\ddagger$ is the set of finite subsets of $\mathbb N$ and the model is ideally full: a proposition is a set of arrows whose membership depends only on the arrows’ values on some finite set of numbers (it is pinned down by that set), and an entity of a higher type is an applicative behaviour profile pinned down by a finite set in the same sense. There is a single individual, which every arrow fixes; the arrows still act on $\mathbb N$, which supplies the pinning sets. Propositions and properties are thus about finitely many numbers and indifferent to how the arrows treat the rest. Evaluation point: the sole object, at the identity arrow.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Finite-support action models on one object, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t), Atoms are self-atoms (type t).

The arrows are idempotent, $f_n\circ f_n=f_n$, and determined by finitely many values, so every singleton is in the domain; $\{1\}$ is the only atom containing the identity. The atom $\{f_2\}$ is not a self-atom: its transport along $f_2$ is $\{f_1,f_2\}$, not an atom. So Atoms are self-atoms (type t) fails, and Self-Atomicity (type t) fails, $\{f_2\}$ being possible with no self-atom below it. No self-atom contains an $f_n$ with $n\ge2$, since its transport along $f_n$ would contain $f_n$ and $1$; so the only self-atom is $\{1\}$, an atom, and a strong atom, its transport along every $f_n$ with $n\ge2$ being empty, no arrow having a retraction. A self-atom of a relational type sits over $1$ with one tuple, so is an atom and a strong atom. One object, so this holds at every world.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Rigid Power.

Write $X_0(E)$ for the intension $m\mapsto f_m\cdot E$. Every arrow is finitely determined, so, as in the group's argument for Tame Rigidity, a weakly inextensible relation is $X_0$ of its extension at the identity, and the rigid relations are the $X_0(E)$ that are in the domain, namely those with $f_m\cdot E$ constant for all $m$ beyond some $s$. For rigid $F=X_0(S)$ the power property $\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ has extension $\{X_0(T'):T'\subseteq f_m\cdot S,\ X_0(T')\text{ in the domain}\}$ at $f_m$, while its extension at the identity transported along $f_m$ is $\{X_0(f_m\cdot T):T\subseteq S,\ X_0(T)\text{ in the domain}\}$. Given such a $T'$, put $T:=\{q\in S: f_m\cdot q\in T'\}$, so that $f_m\cdot T=T'$. Since $f_n\circ f_m=f_n$ for $n\ge m$, transport gives $f_n\cdot T=f_n\cdot T'$ for $n\ge m$, constant for large $n$; so $X_0(T)$ is in the domain. Hence the power property is $X_0$ of its extension; and $f_n$ applied to that extension is, by the same correspondence, $\{X_0(T''):T''\subseteq f_n\cdot S,\ X_0(T'')\text{ in the domain}\}$, constant for $n>s$, so the power property is in the domain and rigid. The boxed form follows from No Pure Contingency.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-04.*

### Fails Strong Atomicity (type t).

A strong atom is an atom, and the atoms are the singletons $\{f_n\}$. Seen from $f_n$ with $n\ge2$, $\{f_n\}$ becomes $\{k : k\circ f_n=f_n\}=\{f_m : m\le n\}$, since $f_m\circ f_n=f_{\max\{m,n\}}$, and the proposition $\{f_1\}$ splits that set. So the only strong atom is $\{f_1\}$, whose transport along every other arrow is empty, and the possible proposition $\{f_2\}$ has no strong atom below it.

*By Claude Fable 5.1 (Anthropic), answering Cian Dorr’s questions whether the failure of BF sharpens to type $t$ and whether failures of Atomicity’s strengthening can be found where Atomicity holds, 2026-09-23.*

### Holds Tame Rigidity.

Write a relation $Y$ as its intension $k\mapsto Y_k$. Then $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$, $(h\cdot Y)_k=Y_{k\circ h}$, and $\le$ is inclusion of intensions. Put $X_0(S)_k:=k\cdot S$. (1) In any one-object model, if $Y_k=k\cdot Y_1$ for every $k$ then $Y$ is rigid: persistence is immediate, and for the boxed weak inextensibility, $(h\cdot Y)_k=k\cdot(h\cdot Y_1)=X_0(Y_h)_k$, which lies inside every $X$ that contains $X_0(Y_h)$. (2) Let $Y$ be weakly rigid with extension $S$. For each finite $N^{\prime}$ the intension $B_{N^{\prime}}(S)_k:=\bigcup_{k^{\prime}\equiv_{N^{\prime}}k}k^{\prime}\cdot S$ is pinned down by $N^{\prime}$, so it is in the domain. It contains $X_0(S)$, so weak inextensibility gives $Y\subseteq B_{N^{\prime}}(S)$, and persistence gives $Y\supseteq X_0(S)$; hence $k\cdot S\subseteq Y_k\subseteq\bigcap_{N^{\prime}}\bigcup_{k^{\prime}\equiv_{N^{\prime}}k}k^{\prime}\cdot S$. By the condition, for $k$ other than the identity some finite $N^{\prime}$ has $k$ as the only arrow agreeing with it there, and the bounds meet: $Y_k=k\cdot S$. So every weakly rigid relation at every type is rigid by (1), and Tame Rigidity holds. With No Pure Contingency, which holds in a one-object model, the map's results give $\Box$Tame Rigidity.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#tame-rigidity`. It requires that Every arrow other than the identity is finitely determined: its singleton is a proposition pinned down by a finite set. Here: Each $\{f_n\}$ is pinned down by a finite set: $f_n$ is the only arrow sending $n$ to $n$ and $n-1$ to $0$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Recorded from the argument deferred in extraction.md on 2 October until the model records' new format landed (not yet checked by a human). Lemma 2's remark that $B_{N^{\prime}}(S)$ is symmetric whenever the model is, which these models do not need, is left out.

### Holds Axiom of Infinity (type t).

The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct and each has that number as finite support, so there are infinitely many propositions. The set of numerals at type $t$ is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#axiom-of-infinity-t`. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-09-20.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The type-$t$ half of the old argument, "individual" becoming "number", so that it covers the one-individual variants.

### Holds Actuality.

The actual-world proposition, whose only member is the identity, is then in the domain. It is true, and it entails every truth, since every true proposition contains the identity.

*Source: Classicism, Proposition D.5, parts 4, 5, 7 and 8, pp. 78–79. From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#actual-world`. It requires that The singleton of the identity arrow is pinned down by a finite set. Here: $\{f_1\}$, $f_1$ being the identity, is pinned down by $\{0,1\}$. By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Stated once for the group; each member's pinning set moved to the condition actual-world-pinned.

### Holds Atomicity.

That singleton is an atom below the proposition.

*Source: Classicism, Proposition D.5, parts 6–8, pp. 78–79. From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#atomicity`. It requires that Every nonempty proposition contains an arrow whose singleton is pinned down by a finite set. Here: Each $\{f_n\}$ is pinned down by a finite set ($\{n-2,n-1,n\}$ for $n>1$, $\{0,1\}$ for the identity). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Stated once for the group; each member's pinning sets moved to the condition pinned-atoms.

### Fails Boolean Completeness (type t).

The source (n. 92) conjectures this but does not show it. Any set $F$ of propositions is the extension at the identity of an element of the domain at type $t\to t$, namely the profile $\langle h,p\rangle\mapsto\{i : i\cdot p\in F\}$: it is natural, independent of $h$ and so pinned down by the empty set, and each of its values is pinned down by the pinning set of $p$, since $i\cdot p$ depends only on the values of $i$ there. A least upper bound of $F$ under entailment is a least finitely pinned superset of $\bigcup F$, and it exists only if the least $S$-pinned superset of $\bigcup F$ stops shrinking as the finite set $S$ grows. So the family $F$ of the condition has no least upper bound, and, taking pointwise negations, the family of complements has no greatest lower bound.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#boolean-completeness-t`. It requires that Some family $F$ of propositions has no least finitely pinned superset of its union $\bigcup F$. Here: An arrow $f_n$ is determined by its value at any $m\ge n$ and all $f_n$ with $n>N$ agree on $\{0,\ldots,N\}$, so the finitely pinned propositions are exactly the finite and cofinite sets of arrows. Let $F$ be the family of singletons $\{f_n\}$ for $n$ an even power of $2$: a finitely pinned superset of $\bigcup F$ is a cofinite set, and removing from it an odd-power member gives a strictly smaller one. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The seven members' copies stated once, each member's family moved to the condition no-least-pinned-cover; the truncations' separate argument of 23 September, by Claude Fable 5.1 prompted by Cian Dorr, is now its witness, its own proof that the family is in the domain giving way to the profile above. The trawl's second arguments for the same verdict (25 September, DeepSeek, reviewed by OpenAI Codex) were dropped.

### Fails Countable Boolean Completeness.

At $\sigma=\tau=t$: the family $F$ of the condition no-least-pinned-cover, which has no least upper bound by the shared argument boolean-completeness-t, is in every member a sequence of propositions $A_m$, and it is countable relative to $t$. The numerals at type $t$ are the finite cardinalities and are pairwise distinct (the shared argument axiom-of-infinity-t), and extensional fullness puts in the domain the relation pairing each $A_m$ with the $m$-th numeral, which injects $F$ into them. This needs no infinity of individuals, so it covers the members with a single individual.

*From the group *Finite-support action models on one object*, shared argument `finite-support-one-object#countable-boolean-completeness-t`. It requires that Some family $F$ of propositions has no least finitely pinned superset of its union $\bigcup F$. Here: An arrow $f_n$ is determined by its value at any $m\ge n$ and all $f_n$ with $n>N$ agree on $\{0,\ldots,N\}$, so the finitely pinned propositions are exactly the finite and cofinite sets of arrows. Let $F$ be the family of singletons $\{f_n\}$ for $n$ an even power of $2$: a finitely pinned superset of $\bigcup F$ is a cofinite set, and removing from it an odd-power member gives a strictly smaller one. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Fails Analytic Necessitism.

Let $k$ be an arrow out of the evaluation object $w$ with $ka=kb$ for two distinct points $a$ and $b$ of the set the arrows act on, and let $q$ be the set of arrows $j$ out of $w$ with $ja\ne jb$. It contains the identity, is pinned down by $\{a,b\}$, is symmetric (an arrow separates $a$ from $b$ iff its composite with a permutation of the points does), and contains no arrow $j\circ k$. Let $\tau$ be $tt$, or $tttt$ in the case noted below. No entity $x$ of type $\tau$ at $w$ is determined by its transport along $k$: let $y$ agree with $x$ except at the arrows in $q$, where the top entity of the argument type of $\tau$ is added to its value or removed from it. Then $y$ is pinned down by a finite set along with $x$, is symmetric if $x$ is, so is in the domain; it differs from $x$ and has $k\cdot y=k\cdot x$, transport along $k$ reading only the values at the arrows after $k$. If $\mathfrak R$ were a rigid real number structure at $w$ of type $\tau$, necessarily a real number structure, with carrier $X$ (Background, Analysis), an instance $x$ of $X$ and $y$ as above would give $k\cdot y=k\cdot x\in X_k$ by persistence, $Xy$ by inextensibility, and $k\cdot y\ne k\cdot x$ by the necessary distinctness of the instances: so $X$ has no instance. The antecedent of Analytic Necessitism holds, however, at type $\tau$. The propositions are infinitely many and, in the recorded instances, include a copy of the natural numbers, so by extensional fullness the entities of type $tt$, which include one with any set of propositions as extension at the identity, include a copy of the sets of natural numbers and so of the reals, whose order, sum, product and natural numbers are the extensions at the identity of relations in the domain; the structure is complete, every subset of its carrier being the extension of a subproperty, so $\exists\mathfrak R\,.\,\operatorname{Real}_{tt}(\mathfrak R)$ holds at $w$. (Should the propositions be infinite without including a copy of the natural numbers, the same holds at type $tttt$, the sets of sets of propositions being Dedekind-infinite in ZF.) So Analytic Necessitism fails. No choice is used.

*General argument `arguments/analytic-necessitism-collapsing-arrow-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The model is ideally full: every entity is pinned down by a finite set of numbers, and every intension pinned down by one is in the domain (Definitions D.1–D.3). It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct, each pinned down by that number (the shared argument axiom-of-infinity-t). It requires that Some arrow out of the evaluation object sends two distinct points of the set the arrows act on to one point. Here: The rounding $f_2$ sends $0$ and $1$ to $0$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

The numbers at a type $\sigma$ are the instances of $\mathbb N_\sigma$, the least property containing $\mathbf 0_\sigma$ and closed under $\operatorname{Suc}_\sigma$ (Background); the numerals $\mathbf 0_\sigma$, $\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ are closed terms, so each denotes at every object, and transport along an arrow carries its denotation at the source to its denotation at the target. At any object $v$ reachable from the evaluation point, extensional fullness gives a property whose extension at $v$ is exactly the numerals there; it contains $\mathbf 0_\sigma$ and is closed under successor, so the numbers at $v$ are exactly the numerals, every numeral being an instance of every inductive property. Persistence of $\mathbb N_\sigma$ and, given $\Box I^*_\sigma$, the necessary distinctness of the numbers are theorems of C (the proof of necessary-rigid-comprehension-implies-arithmetic-necessitism). Inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$: at a reachable $v$ and for an arrow $j$ from $v$ to $u$, the numbers at $u$ are the numerals there, which are the transports along $j$ of the numbers at $v$, so any $X$ that necessarily holds of the numbers at $v$ holds at $u$ of the numbers there. So $\mathbb N_\sigma$ is rigid, and Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The model is ideally full: every entity is pinned down by a finite set of numbers, and every intension pinned down by one is in the domain (Definitions D.1–D.3). By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truth implies ND-necessity.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/dpc-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The actual-world proposition, whose only member is the identity, is pinned down by a finite set, so it is in the domain and entails every truth; every other arrow is non-injective, so no composite with it is the identity. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds Axiom of Infinity (type t), Infinity Schema (type t).

As for individuals (the argument infinitely-many-individuals), at type $t$: the Infinity schema holds, and by extensional fullness the property of cardinalities that hold only of properties with finite extensions is in the domain, has every finite cardinality, and excludes those holding of the universal property of propositions, whose extension is infinite.

*General argument `arguments/infinitely-many-propositions`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. It requires that There are infinitely many propositions at the evaluation world. Here: The propositions that a given number is fixed by the arrow, one for each number, are pairwise distinct, each pinned down by that number (the shared argument axiom-of-infinity-t). By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-06.*

### Holds □Intensional Choice.

For each object $U$ and type $\sigma$ fix a well-ordering $<_U$ of the domain $D^\sigma_U$, and let $W$ be the intension of type $\sigma\to\sigma\to t$ with $W(h):={<_{\operatorname{cod}h}}$. Its value depends only on the arrow's codomain, so by the condition it is in the domain, and at every world its extension well-orders that world's type-$\sigma$ domain. Given $F$ with $\Box\exists x\, .\,Fx$, put $G:=\lambda x\, .\,Fx\land\forall y\, .\,(Fy\to\neg Wyx)$, the $W$-least $F$. It is definable from $F$ and $W$, so in the domain; $G\le F$, and its extension at every arrow is the singleton of the least element of $F$'s. So Intensional Choice holds, and the same at every reachable object gives $\Box$Intensional Choice. Cian Dorr's observation that such models are qualitatively full, made precise.

*General argument `arguments/intensional-choice-well-ordering`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Relational Choice, □Transversal Choice.

At any reachable object $W$, let $U$ be a serial relation in the domain there. Using the axiom of choice, pick for each $x$ a $y$ with $(x,y)$ in the extension of $U$ at the identity, and let $S$ be the intension whose value at every arrow $W\to W$ is the graph of this choice and whose value at arrows with any other codomain is empty; it depends only on the codomain, so the condition puts it in the domain, and at the identity it is a functional subrelation of $U$. Likewise a set of representatives of an equivalence relation at $W$, made into such an intension, is a transversal. Since $W$ was any reachable object, both principles hold at every world.

*General argument `arguments/necessary-relational-choice-codomain-intensions`. It requires that At every object reachable from the evaluation point, the domain contains every intension whose value at an arrow depends only on the arrow's codomain. Here: With one object such an intension is constant, so it is pinned down by $\emptyset$, and the domain holds every finitely pinned intension. By Claude Fable 5.1 (Anthropic), at Cian Dorr's direction, 2026-10-14.*

### Holds No Pure Contingency.

Closed pure terms denote entities fixed by every arrow (§3.5, p. 58). With a single object, a proposition fixed by every arrow contains every arrow if it contains the identity and no arrow otherwise, so a true closed pure sentence is necessary: the source's one-object No Pure Contingency observation (p. 79), applied to each closed instance.

*Source: Classicism, §3.5, p. 58; p. 79. General argument `arguments/no-pure-contingency-one-object`. It requires that The model is an action model (Classicism, Appendix D), or an intensional action model in the sense of Dorr's draft (Boolean Completeness does not imply Rigid Comprehension), with a single object. Here: Each part of Proposition D.5 is a one-object category acting on $\mathbb N$ (Appendix D, Definitions D.1–D.3). By Andrew Bacon and Cian Dorr, 2026-09-17.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic, for every one-object action model; the reason the source's observation holds is spelled out in place of "Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance."

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Necessity of Second-Order Analysis.

Let $v$ be any object reachable from the evaluation point and $\mathfrak R$ a real number structure at $v$ (Background, Analysis). Its completeness is tested against the subproperties of its carrier present at $v$, and by extensional fullness every subset of the carrier's extension there is the extension at the identity of one of them; so the carrier, with the extensions of $\le$, $+$ and $\times$, is a complete ordered field in the sense of the metatheory and, by Huntington's theorem, a theorem of ZF, is isomorphic to the real numbers. For the same reason the extension of $N$, the least subproperty containing $0$ and closed under adding $1$, is its set of natural numbers, that set being the extension of a subproperty. A second-order analytical sentence $A(\mathfrak R)$ quantifies over the relations among entities of the structure's type at $v$, applied to the structure's elements, and their extensions at the identity are all the relations on the carrier, again by extensional fullness. So $A(\mathfrak R)$ holds at $v$ exactly when $A$ holds in the real numbers under full second-order semantics, which depends neither on $v$ nor on $\mathfrak R$. Hence $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to A(\mathfrak R)$ holds when $A$ is true of the reals and $\Box\forall\mathfrak R\,.\,\operatorname{Real}_\sigma(\mathfrak R)\to\neg A(\mathfrak R)$ when it is false: every instance of the Necessity of Second-Order Analysis holds, and with it the Necessity of Analysis and the Non-contingency of the Continuum Hypothesis, as recorded. No choice is used.

*General argument `arguments/second-order-analysis-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.

### Holds Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type, not only by the finite cardinalities of individuals. The argument shows only the instance counting at $e$; at a type with infinitely many entities a countable property may have infinitely many instances, so the verdict no longer follows.*

The natural numbers are the finite cardinalities at type $e$ (Background, after Goodsell), and with a single individual there are three: $\mathbf{0}_e$, true of the empty property; $\operatorname{Suc}_e\mathbf{0}_e$, true of the universal one; and the empty cardinality, which is $\operatorname{Suc}_e$ of the second and of itself. By extensional fullness the property of being one of these three is in the domain, so it bounds natural numberhood. A countable property therefore has at most three members in its extension, and their join is its least upper bound.

*General argument `arguments/three-numbers`. It requires that There is exactly one individual, at every world. Here: The only individual is fixed by every arrow, at the sole object. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Claude Opus 5.5 (Anthropic), on Cian Dorr's question whether the failure of Boolean Completeness at type $t$ refutes its countable form here, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Holds Transversal Choice.

For an equivalence relation at the evaluation point, a transversal of its extension there, chosen in the metatheory, is by extensional fullness the extension of an element of the domain; the equivalence and transversal conditions are unboxed.

*General argument `arguments/transversal-choice-extensionally-full`. It requires that The model is extensionally full at every object: every set of tuples from the domains at an object is the extension, at the identity arrow, of an element of the domain of the matching relational type there. Here: The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. By Cian Dorr (observation); recorded by Claude Fable 5.1 (Anthropic), on a question of Zachary Goodsell, after an observation of Christopher Sun, 2026-09-25.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The Relational Choice and Transversal Choice arguments merged into one, stated for every extensionally full model.

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic. Its first sentence, deriving extensional fullness from ideal fullness, is now the group's reason for meeting extensionally-full.

### Holds No Contingency (signature Σ), B for sentences of Σ.

Each constant of Σ denotes what the closed pure term $\top_\tau$ of its type denotes, so a closed sentence of the language of Σ denotes what the pure sentence with $\top_\tau$ in place of each constant denotes; if true it is necessary by No Pure Contingency, which holds here. So No Contingency (signature Σ) holds, and B for sentences of Σ with it: a true Σ-sentence is necessary, hence necessarily possible.

*General argument `arguments/sigma-top-npc`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Cian Dorr (observation); recorded by Claude Opus 5.5 (Anthropic), 2026-10-02.*

*Revised 2026-10-03 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The argument sigma-single-top, for Σ a single constant of type $t$ denoting $\top$, stated for every interpretation of Σ by top elements, now that such interpretations have no individual constants. It replaces that argument and nc-sigma-homogeneous, which reached the same verdicts through an individual constant when the model's automorphisms carry every individual to every other. With an individual constant and no such automorphisms the verdicts were unknown in 19 models, and nowhere did the individual constants settle a verdict differently.


## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell) — Added Transversal Choice, by the argument recorded for Relational Choice: the model is extensionally full at every object, so for an equivalence relation at the evaluation point a transversal of its extension there, chosen in the metatheory, is the extension of an element pinned down by the empty set; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-25** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Accepted the trawl's type-t Boolean Completeness failure after checking the finite/cofinite domain and replacing the conditional higher-type argument by the source's extensional-fullness lemma. Informal review; no Lean verification. Now violates: Boolean Completeness (type t).
- **2026-09-25** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Confirmed the trawl's Strong Atomicity-t failure: an admitted nonidentity-idempotent singleton shifts to a set containing both the identity and the idempotent, which a target-domain proposition separates. Quantifiers inside the box range over the entire target domain. The boxed failure follows by T. Now violates: Strong Atomicity (type t).
- **2026-09-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added the failure of Strong Atomicity (type t), of BF (type t) and of Boolean Completeness (type t), with the arguments in the notes. Now violates: Strong Atomicity (type t), BF (type t), Boolean Completeness (type t).
- **2026-09-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — Merged the two sets of arguments recorded on 23 and 25 September into one: BF (type t) now follows from Atomicity and the failure of the type-t Strong Atomicity, with a one-line direct witness.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Expanded the description from Appendix D, naming Proposition D.5 and its part; added the failure of Countable Boolean Completeness at type e→t; settled the Distinctness-preserving collapse. Now satisfies: Truth implies ND-necessity. Now violates: Countable Boolean Completeness.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now violates: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Corrected the reason given for the failures of Independence (signature Σ) and Distinctness (signature Σ): the true atom is denoted by no closed pure term, since such terms denote entities fixed by every arrow; the failures come from the other relational constants, which denote top. No verdict changes.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Relational Choice and its necessitation at Cian Dorr’s direction: ideally full models are extensionally full at every object, and choice in the metatheory supplies the functional subrelation; see the notes. Now satisfies: Relational Choice, □Relational Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of BF at type t, sharpening the failure of BF; argument in the notes. Now violates: BF (type t).
- **2026-09-23** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Recorded the failure of the type-t Strong Atomicity, which come apart from Atomicity here; see the notes. Now violates: Strong Atomicity (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: Atomicity, Actuality, No Pure Contingency, □Atomicity, □Actuality. Now violates: ND, BF, Boolean Completeness, Rigid Comprehension.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Proposition D.5, part 7, pp. 74, 78; p. 79 (No Pure Contingency).
- **DeepSeek trawl; GPT-6 review 25 Sep** — DeepSeek (deepseek-flash), Classicism theorem trawl, 25 September 2026; mathematically reviewed and corrected by OpenAI Codex (GPT-6), 25 September 2026. Accepted additions only; original construction attribution is unchanged. writeups/finite-support-dyadic-roundings.md; Classicism, Definition D.3 and Proposition D.5, pp. 73–79.
- **DeepSeek trawl; GPT-6 review 25 Sep** — DeepSeek (deepseek-flash), Classicism theorem trawl, 25 September 2026; mathematically reviewed and corrected by OpenAI Codex (GPT-6), 25 September 2026. Accepted additions only; original construction attribution is unchanged. writeups/strong-atoms-one-object-action-models.md; Classicism, pp. 55–59, 74 and 78; checks/action_strong_atoms.py.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-dyadic-roundings.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Proposition D.5(7), pp. 74–75; construction p. 78, Part 7; p. 79 (No Pure Contingency)
