# Full Boolean-valued model: one atom and an atomless component [built in L]

<p class='cert'>Model — Source: Could the truths of mathematics have been different? (draft); produced by Andrew Bacon (underlying Boolean-valued construction); OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026 (singleton-base specialization and verification of the recorded choice and atomicity claims); recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ □Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **¬ □Countable Boolean Completeness.** Necessarily, every countable property of entities of a relational type has a least upper bound in that type, with countability relative to a type $\sigma$ as in Countable Boolean Completeness; one instance for each $\sigma$.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Non-contingency of the Continuum Hypothesis.** Either necessarily every real number structure satisfies the continuum hypothesis, or necessarily every real number structure falsifies it: that every subproperty of the continuum either injects into the natural numbers or is in bijection with the continuum. One sentence for each type $\sigma$.
- **¬ Necessity of Analysis.** Every first-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each first-order analytical sentence.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A singleton-base specialization of Bacon’s full Boolean-valued construction in §B.2. Work in ZFC, let $A$ be a nontrivial complete atomless Boolean algebra, and set $B=\mathbf{2}\times A$, $D_e=\{*\}$, $D_t=B$, and $D_{\sigma\to\tau}=D_\tau^{D_\sigma}$ for every admitted function type. Use ordinary application and abstraction, Boolean connectives, quantifiers given by meets and joins, and crisp equality. Evaluation point: the atom $a=(1,0_A)$; a proposition is true iff its first coordinate is $1$.

$A$ is fixed by cases on the continuum hypothesis in the ambient set theory. If CH holds, $A$ is $\operatorname{RO}(\operatorname{Add}(\omega,\omega_2))$, the algebra adding $\aleph_2$ Cohen reals, as in Bacon's §B.2; if CH fails, $A$ is $\operatorname{RO}(\operatorname{Col}(\omega_1,2^{\aleph_0})\times\operatorname{Add}(\omega,1))$, which collapses the continuum to $\aleph_1$ and adds one Cohen real. Either way forcing with $A$ adds a Cohen real, $A$ has at least continuum many elements, and CH takes the opposite value in $V^A$ to its value in $V$.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

Universe, fixed for this record: the construction is carried out inside Gödel's constructible universe $L$, which ZFC proves to be a model of ZFC + $V=L$. Read in the ambient universe, the result is still a Boolean-valued model of the same kind, with the same values: every element of the algebra lies in $L$, and every clause of the semantics takes the meet or join of a family that lies in $L$ (by induction on formulas), whose meet or join in $L$ is its meet or join outright, since every candidate bound is itself an element of the algebra, hence in $L$. Its domains are full in the sense of $L$, and every argument for the member, being a proof in ZFC about the model's values, holds of it. In particular $L\models\mathrm{CH}$, so an algebra chosen by cases on CH is the one for CH.

*A member of the group Full Boolean-valued models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds BF.

The full function domains and complete truth projection validate C, boxed BF, and boxed ND.

*By Andrew Bacon (underlying Boolean-valued construction); OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026 (singleton-base specialization and verification of the recorded choice and atomicity claims).*

### Holds Functional Choice.

Extensional fullness and metatheoretic choice give Relational Choice; full function domains give Plenitude, hence Functional Choice.

*By Andrew Bacon (underlying Boolean-valued construction); OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026 (singleton-base specialization and verification of the recorded choice and atomicity claims).*

### Fails Atomicity (type t).

The sole atom $a$ witnesses Actuality and refutes Atomlessness, while $(0,1_A)$ is nonzero with no atom below it, refuting Atomicity at type $t$ and the full schema.

*By Andrew Bacon (underlying Boolean-valued construction); OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026 (singleton-base specialization and verification of the recorded choice and atomicity claims).*

### Holds □Intensional Choice.

Here $\Box p$ is $p=\top$, so $\Box\exists x\, .\,Fx$ says $\bigvee_{x\in D_\sigma}F(x)=1_B$. Well-order $D_\sigma$ and put $G(x):=F(x)\land\neg\bigvee_{y<x}F(y)$. Then $G\le F$ pointwise, the $G(x)$ are pairwise disjoint, and $\bigvee_xG(x)=\bigvee_xF(x)=1_B$. With crisp equality $\exists x\, .\,(Gx\land\forall y\, .\,(Gy\to y=x))$ has value $\bigvee_x(G(x)\land\bigwedge_{y\ne x}\neg G(y))=\bigvee_xG(x)=1_B$, and so does its box. The function domains are full, so $G$ is in the domain. Every closed instance has value $1_B$, so Intensional Choice holds necessarily.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, at Cian Dorr's suggestion, 2026-10-03.*

### Holds □Transversal Choice.

Write $\pi$ and $\rho$ for the two coordinate projections of $B=\mathbf 2\times A$, both complete homomorphisms; $\Box p$ is $p=\top$, so a closed sentence is necessary when it is true and its $\rho$-coordinate is $1_A$. Under $\rho$ a sentence without $\Box$ takes its value in the Boolean-valued universe $V^A$, each $D_\sigma$ read as a ground set with crisp identity and the $\rho$-parts of relations on it ranging over all names for subsets of it. So a theorem of ZFC about relations on well-orderable sets has $\rho$-value $1_A$. Transversal Choice is of this kind: the least element of each class, $F(y):=\bigwedge_{y^{\prime}<y}\neg R(y^{\prime},y)$, is a transversal. Its truth is already derived, so it is necessary.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's request, 2026-10-03.*

### Holds □Countable Boolean Completeness.

*Withdrawn 2026-10-16 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction: Countable Boolean Completeness now measures countability at every type. The argument covers only the instances counting at $e$; at type $t$, where $B$ is infinite and the numerals are the standard ones, it says nothing.*

An effect of the single individual. The type-$e$ numerals are crisply three entities, $\mathbf 0_e$, $\mathbf 1_e$, and the empty cardinality, which is its own successor, so $\operatorname{Ctbl}(X)$ makes $X$ have at most three members internally; a finite subset of a ground set is a ground set, and finite families have joins in the complete pointwise order. So every closed instance has value $1_B$.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's request, 2026-10-03.*

### Holds Axiom of Infinity (type t).

$B$ is infinite and identity is crisp. The crisp characteristic function of the standard numerals is inductive, so finite cardinality has value $0_B$ off the standard numerals, and the $n$th numeral holds of the universal property of propositions with the value of "$B$ has exactly $n$ elements", $0_B$.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's request, 2026-10-03.*

### Fails □Boolean Completeness (type t).

For the algebra fixed in the definition. Take a countable maximal antichain $(a_n)$ in $A$, put $w_n:=(0,\neg a_n)$, choose $c_n\in A$, and let $X$ of type $t\to t$ have $\rho X(w_n)=c_n$ and $0$ elsewhere. With $s$ the fuzzy subset of $\omega$ given by the $c_n$, a direct computation gives $\rho[\![\exists y\, .\,\operatorname{GLB}_t(y,X)]\!]=\bigvee_{U\subseteq\omega}[\![s=\check U]\!]$, the value of "$s$ is a ground set". Forcing with $A$ adds a Cohen real; taking the $c_n$ to be its coordinates, $[\![s=\check U]\!]=0_A$ for every $U$, so the closed instance of Boolean Completeness (type $t$) has value exactly $a$: true, and not necessary. Whether it is necessary for an algebra adding no reals is open.

*By Claude Fable 5.1 (Anthropic), at Cian Dorr's request, 2026-10-03.*

*Revised 2026-10-24 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* The argument used only that forcing with $A$ adds a Cohen real, which the algebras now fixed by cases on CH both do; the text names that property instead of the regular open algebra of the real line.

### Fails □Countable Boolean Completeness.

At $\sigma=\tau=t$, for the property $X$ of type $t\to t$ in the argument for the failure of $\Box$Boolean Completeness (type $t$). The crisp relation pairing $w_n$ with the $n$-th numeral, and nothing else, is in the full domain; the numerals at $t$ are crisply the standard ones (the argument for the Axiom of Infinity (type $t$)), so $\operatorname{Ctbl}_{t,t}(X)$ has value $1_B$. The instance of Countable Boolean Completeness at $X$ in its greatest-lower-bound form then has the value of $\exists y\, .\,\operatorname{GLB}_t(y,X)$, whose $A$-coordinate is $0_A$, so the closed instance is not necessary.

*By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-16.*

### Fails Forcing Possibilism.

The four-element Boolean algebra is finite, hence small, and present internally on any four propositions with the right order, the model being full. Forcing Possibilism would give a proposition $p\ne\top$ with exactly four propositions entailing it. In $B=\mathbf 2\times A$ the propositions below $(0,a)$ are the $(0,b)$ with $b\le a$, one of them if $a=0_A$ and infinitely many otherwise, $A$ being atomless; and those below $(1,a)$ are the $(\varepsilon,b)$ with $b\le a$, two of them if $a=0_A$ and infinitely many otherwise. No proposition has exactly four, so Forcing Possibilism fails.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Analytic Necessitism.

At type $t$, for the algebra fixed in the definition. Here $\Box p$ is $p=\top$, so a property $X$ of type $t\to t$ satisfies $\Box\forall x\,.\,(Xx\to\Box Xx)\land(\neg Xx\to\Box\neg Xx)$ with first coordinate $1$ only if $X$ is crisp, taking the values $\top$ and $\bot$ alone, and likewise for relations; so a rigid real number structure $\mathfrak R$ is crisp, the check of a structure $(S,\le,+,\times,0,1,N)$ of the ground model, and $\Box\operatorname{Real}_t(\mathfrak R)$ asks that $\operatorname{Real}_t(\mathfrak R)$ have value $\top$, in particular $\rho$-coordinate $1_A$. That fails: forcing with $A$ adds a real $r$; the $A$-valued subproperty of $S$ naming the lower Dedekind cut of $r$ in $S$ is in the full domain and is bounded, but has no least upper bound in $S$ with positive value, since $[\![r=\check s]\!]=0$ for every ground real $s$. So the consequent of Analytic Necessitism is false at the evaluation point. Its antecedent is true: $B$ has at least continuum many elements, the crisp characteristic functions of a set $S\subseteq B$ in bijection with the reals and of its order, sum, product and natural numbers are in the full domains, and $\operatorname{Real}_t$ of this structure has $\pi$-coordinate $1$, every bounded crisp subset of $S$ having a least upper bound in it; so $\exists\mathfrak R\,.\,\operatorname{Real}_t(\mathfrak R)$ is not $\bot$ and its possibility is $\top$.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

*Revised 2026-10-24 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* The argument used only that forcing with $A$ adds a real and that $B$ has at least continuum many elements, true of the algebras now fixed by cases on CH; the text says so instead of naming the regular open algebra of the real line.

### Fails Non-contingency of the Continuum Hypothesis.

At type $t$. Write $\pi,\rho$ for the coordinate projections of $B=\mathbf 2\times A$. By extensional fullness the $\pi$-coordinate of a box-free sentence is its truth in the full standard model over the same domains, and the $\rho$-coordinate its value in $V^A$, relations on a ground set ranging over all names for subsets of it. Both $V$ and $V^A$ have a real number structure on a subset of $D_t=B$: $|B|\ge2^{\aleph_0}$, and $|B|\ge(2^{\aleph_0})^{V^A}$, which is $\aleph_2$ in the first case (where $|B|=\aleph_2^{\aleph_0}=\aleph_2$, by CH) and $\aleph_1$ in the second. Real number structures are unique up to isomorphism, so $\exists\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\land\operatorname{CH}(\mathfrak R)$ has $\pi$-coordinate $1$ iff CH holds in $V$ and $\rho$-coordinate $1_A$ iff CH holds in $V^A$, and likewise for $\neg\operatorname{CH}$, the value otherwise being $0$. CH takes opposite values in $V$ and $V^A$, so each of $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\operatorname{CH}(\mathfrak R)$ and $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\neg\operatorname{CH}(\mathfrak R)$ is $(1,0_A)$ or $(0,1_A)$, not $\top$. As $\Box p$ is $p=\top$, both disjuncts of Non-contingency of CH are $\bot$.

*Source: Could the truths of mathematics have been different?, Online appendix §B.2, Lemmas B.1–B.4, pp. 7–9. [Paper](https://andrew-bacon.github.io/papers/Could%20mathematics%20have%20been%20different.pdf) Write-up: [full-boolean-valued-atom-and-atomless](full-boolean-valued-atom-and-atomless.html). Address: `full-boolean-valued-atom-and-atomless-universe-constructible#ch-contingent`. By Cian Dorr (the choice of algebra by cases on CH, after Bacon's §B.2), with Claude Opus 5.5 (Anthropic), 2026-10-24.*

### Holds Arithmetic Necessitism.

At every type. The numerals are crisp entities, and the crisp characteristic function of the set of numerals at $\sigma$ is in the full domain and inductive with value $\top$, so $\mathbb N_\sigma$ is crisp, with the numerals as its instances. Here $\Box p$ is $p=\top$, so persistence, $\Box\forall n\,.\,\mathbb N_\sigma n\to\Box\mathbb N_\sigma n$, has value $\top$; inextensibility, $\Box\forall X\,.\,(\forall n\,.\,\mathbb N_\sigma n\to\Box Xn)\to\mathbb N_\sigma\le X$, has value $\top$, since for each $X$ both sides of the implication are $\bigwedge_n[\![Xn=\top]\!]$ over the numerals $n$; and distinct numerals are necessarily distinct, identity being crisp. So $\mathbb N_\sigma$ is rigid with necessarily distinct instances, whether or not $\Box I^*_\sigma$ holds.

*By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Fails Necessity of Analysis.

At type $t$, for the analytical sentence $\Phi$ saying that every real is constructible: membership of a real in $L$ is $\Sigma^1_2$ (Shoenfield), so $\Phi$ is $\Pi^1_3$, a first-order analytical sentence in any real number structure, whose natural numbers code sets of naturals by its reals. Write $\pi,\rho$ for the projections of $B=\mathbf 2\times A$ onto the atom's coordinate and $A$. As in the argument for the contingency of CH, the $\pi$-coordinate of a box-free sentence is its truth in the full model over $L$ and the $\rho$-coordinate its value in $L^A$, and both have real number structures on subsets of $D_t=B$. $L\models\Phi$, while forcing with $A$ adds a Cohen real over $L$, not constructible, and Shoenfield absoluteness makes the $\Sigma^1_2$ definition of constructibility mean the same in $L^A$; so $\Phi$ has value $0_A$ there. Real number structures being isomorphic within each coordinate, $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\Phi(\mathfrak R)$ has value $(1,0_A)$ and $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\neg\Phi(\mathfrak R)$ has value $(0,1_A)$. As $\Box p$ is $p=\top$, both disjuncts of the instance are $\bot$.

*From the group *Full Boolean-valued models*, shared argument `full-boolean-valued#necessity-of-analysis-constructible`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: $D_e=\{*\}$. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Full verification is in the write-up.

The source uses an infinite individual domain, ZFC + CH, and the algebra adding $\aleph_2$ Cohen reals, to make CH contingent. The record keeps that algebra when CH holds and uses its dual when CH fails, so it requires only ZFC; the singleton individual domain does no harm, the real number structures living at type $t$. For an extensionally full model in ZFC, Relational Choice follows by representing a set-theoretic functional subrelation, and Plenitude then gives Functional Choice. The qualitative-contrast model of Classicism does not meet this fullness condition: its finite-support and symmetry restrictions exclude the needed selector. In the present model, $R(p,q):=(p\land q=\top)\lor(\neg p\land q=\bot)$ has Seriality and Functionality of value $1_B$, but $\exists f\,\forall p\,R(p,f(p))$ has value exactly $a$. The write-up includes the atomless-component calculation and the comparison with the older model. The finite check tests the Boolean calculation, not the infinite construction.

## History

The record's revision log before it was written as arguments.

- **2026-09-27** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Identified Bacon’s earlier Boolean-valued construction at the user’s request, corrected the source attribution, and shortened the description to match the source-based model records. Distinguished the singleton-base specialization and the explicit choice calculation; added the extensional-fullness proof of Relational Choice and comparison with the qualitative-contrast model. Now satisfies: Relational Choice.

## Sources

- **Mathematical Contingency** — Andrew Bacon, Could the truths of mathematics have been different?, draft of 9 October 2025, online appendix §B.2, pp. 7–9 (PDF pp. 41–43), especially the construction on p. 7 and the extensional-fullness observation following Lemma B.3 on p. 9.
- **GPT-6 verification 27 Sep** — OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 27 September 2026. Specialization to a singleton individual domain and an arbitrary complete atomless component; verification of Functional Choice, the failure of Atomicity, and the exact Boolean values of the choice counterinstance. Full proof in the write-up.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §§1.1–1.3 and §§2.1–2.3 (background logic, choice decomposition, and definitions); Appendix D, p. 79 (the related qualitative-contrast model).

<p class='cert'>Record: <code>topics/classicism/models/full-boolean-valued-atom-and-atomless.yaml</code></p>

## Paper references

- **Proof: [Could the truths of mathematics have been different?](https://andrew-bacon.github.io/papers/Could%20mathematics%20have%20been%20different.pdf).** Bacon, Andrew (2025). Could the truths of mathematics have been different? Draft dated 9 October 2025, with online appendix; published in Philosophical Review 135(3), 2026, pp. 221–285, as cited by Barton and Goodsell. Locators refer to the draft. The full Boolean-valued construction is in appendix §B.2, pp. 7–9 of the separately paginated appendix (PDF pp. 41–43); Theorem 4.4 and its proof (Appendix C.1) and Lemma C.6 (Appendix C.2) were read directly on 19 October 2026. — Online appendix §B.2, pp. 7–9 (PDF pp. 41–43). Source of the full Boolean-valued construction with a designated atom and an atomless component. This record uses a singleton individual domain, and Bacon's algebra when CH holds and its evident dual when CH fails, so that CH is contingent without assuming CH. The explicit Functional Choice and boxed-choice calculations are supplied in the write-up.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §§1.1–1.3 and §§2.1–2.3. Definitions of C and the principles, including Functional Choice as Plenitude plus Relational Choice.
- **Related: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, final construction (two copies of N). The recorded qualitative-contrast model satisfies C5 and Plenitude but fails Atomicity. Its additional symmetry condition prevents extensional fullness at the evaluation object and forces both choice principles to fail.
