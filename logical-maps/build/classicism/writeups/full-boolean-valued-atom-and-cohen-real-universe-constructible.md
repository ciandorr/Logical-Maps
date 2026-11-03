# Full Boolean-valued model: one atom and the Cohen algebra, with infinitely many individuals [built in L]

<p class='cert'>Model — Source: Misc.; produced by Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Transversal Choice.** Necessarily, every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Non-contingency of the Continuum Hypothesis.** Either necessarily every real number structure satisfies the continuum hypothesis, or necessarily every real number structure falsifies it: that every subproperty of the continuum either injects into the natural numbers or is in bijection with the continuum. One sentence for each type $\sigma$.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **□Axiom of Infinity (type e).** Necessarily, there are not finitely many individuals.
- **¬ Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **¬ □Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **¬ □Countable Boolean Completeness.** Necessarily, every countable property of entities of a relational type has a least upper bound in that type, with countability relative to a type $\sigma$ as in Countable Boolean Completeness; one instance for each $\sigma$.
- **¬ Analytic Necessitism.** If there could be a real number structure, there is a rigid one that is necessarily a real number structure: a rigid property with necessarily distinct instances, with rigid order, addition, multiplication and natural numbers, which necessarily form a complete ordered field. One sentence for each type $\sigma$.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ Necessity of Analysis.** Every first-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each first-order analytical sentence.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Bacon's full Boolean-valued construction of §B.2 with $A:=\operatorname{RO}(\operatorname{Add}(\omega,1))$, the algebra adding one Cohen real. Set $B=\mathbf 2\times A$, $D_e=\omega$, $D_t=B$, and $D_{\sigma\to\tau}=D_\tau^{D_\sigma}$ for every admitted function type. Use ordinary application and abstraction, Boolean connectives, quantifiers given by meets and joins, and crisp equality. Evaluation point: the atom $a=(1,0_A)$; a proposition is true iff its first coordinate is $1$.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

Universe, fixed for this record: the construction is carried out inside Gödel's constructible universe $L$, which ZFC proves to be a model of ZFC + $V=L$. Read in the ambient universe, the result is still a Boolean-valued model of the same kind, with the same values: every element of the algebra lies in $L$, and every clause of the semantics takes the meet or join of a family that lies in $L$ (by induction on formulas), whose meet or join in $L$ is its meet or join outright, since every candidate bound is itself an element of the algebra, hence in $L$. Its domains are full in the sense of $L$, and every argument for the member, being a proof in ZFC about the model's values, holds of it. In particular $L\models\mathrm{CH}$, so an algebra chosen by cases on CH is the one for CH.

*A member of the group Full Boolean-valued models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds BF.

As in full-boolean-valued-atom-and-atomless: $\Box p$ is $p=\top$, identity is crisp, and the full function domains with complete meets and joins validate C, □BF and □ND.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Holds Functional Choice.

At the atom, metatheoretic choice selects an output in each nonempty fibre of a serial relation's first-coordinate extension, and the full function domains contain the resulting function.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Fails Atomicity (type t).

$(0,1_A)$ is nonzero with no atom below it, $A$ being atomless.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Holds □Intensional Choice, □Transversal Choice.

As in full-boolean-valued-atom-and-atomless, whose arguments use only fullness, crisp identity and a well-ordering of each domain: disjointify a necessarily instantiated property along a well-order, and take least elements of classes.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Holds Axiom of Infinity (type e), Axiom of Infinity (type t), Arithmetic Necessitism.

$D_e=\omega$ and $D_t=B$ are infinite with crisp identity. The crisp characteristic function of the standard numerals at a type is inductive, so the numerals are crisply the standard ones, rigid with necessarily distinct instances, and the $n$th holds of a universal property with the value of "the domain has exactly $n$ elements", $0_B$.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Fails □Boolean Completeness (type t), □Countable Boolean Completeness, Analytic Necessitism.

The arguments of full-boolean-valued-atom-and-atomless for these verdicts use only that forcing with $A$ adds a Cohen real and that $B$ has at least continuum many elements, both true here.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Fails Forcing Possibilism.

As in full-boolean-valued-atom-and-atomless: no proposition has exactly four propositions entailing it, $A$ being atomless.

*By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Holds Non-contingency of the Continuum Hypothesis.

At every type. Write $\pi,\rho$ for the projections of $B$ onto its coordinates. As in the argument ch-contingent of full-boolean-valued-atom-and-atomless, the $\pi$-coordinate of a box-free sentence about real number structures is its truth in $V$ and its $\rho$-coordinate its value in $V^A$, real number structures being unique up to isomorphism in each. Adding one Cohen real preserves cardinals and the value of $2^{\aleph_0}$, there being $(2^{\aleph_0})^{\aleph_0}=2^{\aleph_0}$ nice names for reals; so CH has the same truth value in $V$ and $V^A$. Hence whichever of $\forall\mathfrak R\, .\,\operatorname{Real}_\sigma(\mathfrak R)\to\operatorname{CH}(\mathfrak R)$ and its counterpart with $\neg\operatorname{CH}$ is true in $V$ has value $\top$, and its box is true.

*Write-up: [full-boolean-valued-atom-and-cohen-real](full-boolean-valued-atom-and-cohen-real.html). Address: `full-boolean-valued-atom-and-cohen-real-universe-constructible#ch-non-contingent`. By Andrew Bacon (underlying Boolean-valued construction and analytical contingency); GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (the Cohen algebra over L, with the additional premises), 2026-10-28.*

### Holds □Axiom of Infinity (type t).

As $\Box p$ is $p=\top$, it suffices that the Axiom of Infinity at type $t$ has value $\top$. Let $\Phi\in D_{(tt)t}$ send $X\in B^{B}$ to $\bigvee_F\bigwedge_{b\notin F}\neg X(b)$, the join over the finite sets $F\subseteq B$: the value of the claim that $X$ holds of only finitely many propositions. It is in the domain, which holds every function, and so is $W:=\lambda Y\, .\,\forall X\, .\,YX\to\Phi X$, whose value at $Y$ is $\bigwedge_X(Y(X)\to\Phi(X))$. $W\mathbf 0_t$ has value $\top$, since $\mathbf 0_t(X)=\bigwedge_b\neg X(b)\le\Phi(X)$, taking $F=\varnothing$. And $WY\le W(\operatorname{Suc}_tY)$: $\operatorname{Suc}_tY(X)=\bigvee_y X(y)\land Y(X_y)$, where $X_y$, the value of $\lambda u\, .\,Xu\land u\ne y$, agrees with $X$ except that $X_y(y)=0$, equality being crisp; so $\Phi(X_y)\le\Phi(X)$, each $F$ for $X_y$ giving $F\cup\{y\}$ for $X$. Hence the value of $\operatorname{FiniteCardinality}_t(Z)$ is at most that of $WZ$, and that of $\operatorname{FiniteCardinality}_t(Z)\land Z(\lambda u\, .\,\top)$ is at most $\Phi(\lambda u\, .\,\top)=\bigvee_F\bigwedge_{b\notin F}\bot=\bot$, $B$ being infinite, as $A$ is in every member. So the existential has value $\bot$ and the Axiom value $\top$.

*From the group *Full Boolean-valued models*, shared argument `full-boolean-valued#necessary-axiom-of-infinity-t`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Holds □Axiom of Infinity (type e).

As for necessary-axiom-of-infinity-t, at type $e$: with $\Phi(X):=\bigvee_F\bigwedge_{n\notin F}\neg X(n)$ for $X\in B^{D_e}$, the Axiom of Infinity at $e$ has value $\top$, since $\Phi(\lambda u\, .\,\top)=\bot$ when $D_e$ is infinite.

*From the group *Full Boolean-valued models*, shared argument `full-boolean-valued#necessary-axiom-of-infinity-e`. It requires that There are infinitely many individuals at the evaluation world. Here: $D_e=\omega$. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Necessity of Analysis.

At type $t$, for the analytical sentence $\Phi$ saying that every real is constructible: membership of a real in $L$ is $\Sigma^1_2$ (Shoenfield), so $\Phi$ is $\Pi^1_3$, a first-order analytical sentence in any real number structure, whose natural numbers code sets of naturals by its reals. Write $\pi,\rho$ for the projections of $B=\mathbf 2\times A$ onto the atom's coordinate and $A$. As in the argument for the contingency of CH, the $\pi$-coordinate of a box-free sentence of the kind used there, whose relation variables are only applied to carrier elements, with identity only between those, is its truth in the full model over $L$ and the $\rho$-coordinate its value in $L^A$, and both have real number structures on subsets of $D_t=B$. $L\models\Phi$, while forcing with $A$ adds a Cohen real over $L$, not constructible, and Shoenfield absoluteness makes the $\Sigma^1_2$ definition of constructibility mean the same in $L^A$; so $\Phi$ has value $0_A$ there. Real number structures being isomorphic within each coordinate, $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\Phi(\mathfrak R)$ has value $(1,0_A)$ and $\forall\mathfrak R\, .\,\operatorname{Real}_t(\mathfrak R)\to\neg\Phi(\mathfrak R)$ has value $(0,1_A)$. As $\Box p$ is $p=\top$, both disjuncts of the instance are $\bot$.

*From the group *Full Boolean-valued models*, shared argument `full-boolean-valued#necessity-of-analysis-constructible`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-25.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, from a correction by OpenAI Codex (GPT-6), prompted by Daniel Kodsi, in Daniel Kodsi's pull request:* The transfer is stated for the fragment the argument uses, as in the corrected argument ch-contingent of full-boolean-valued-atom-and-atomless; it does not hold for every box-free sentence. The verdict is unchanged.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Recorded for the variant built in $L$, generated by the group: there the group's argument necessity-of-analysis-constructible refutes Necessity of Analysis, since one Cohen real over $L$ is not constructible, while CH holds, and so is non-contingent, in both coordinates. So C5, Functional Choice, Intensional and Transversal Choice, both Axioms of Infinity and Non-contingency of CH do not give Necessity of Analysis. Unlike full-boolean-valued-atom-and-atomless, whose algebra is chosen by cases on CH so as to make CH contingent, the algebra here is fixed, and it leaves CH unchanged. Bacon already reports that C5 alone does not give Necessity of Analysis (pp. 22–23, note 55); the contribution of Astra's note is the stronger package, with CH non-contingent. In ZFC alone, whether Necessity of Analysis holds here depends on whether one Cohen real preserves the analytical truths of the ground.

## Sources

- **Mathematical Contingency** — Andrew Bacon, Could the truths of mathematics have been different?, draft of 9 October 2025, pp. 22–23 and note 55; online appendix §B.2, pp. 7–9 (PDF pp. 41–43).
- **Astra via Kodsi 25 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, C5 and Functional Choice do not entail Necessity of Analysis, research note of 25 October 2026, §§2–7 (unpaginated), item 03 of the next-update batch in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).

<p class='cert'>Record: <code>topics/classicism/models/full-boolean-valued-atom-and-cohen-real.yaml</code></p>

## Paper references

- **Proof: [Could the truths of mathematics have been different?](https://andrew-bacon.github.io/papers/Could%20mathematics%20have%20been%20different.pdf).** Bacon, Andrew (2025). Could the truths of mathematics have been different? Draft dated 9 October 2025, with online appendix; published in Philosophical Review 135(3), 2026, pp. 221–285, as cited by Barton and Goodsell. Locators refer to the draft. The full Boolean-valued construction is in appendix §B.2, pp. 7–9 of the separately paginated appendix (PDF pp. 41–43); Theorem 4.4 and its proof (Appendix C.1) and Lemma C.6 (Appendix C.2) were read directly on 19 October 2026. — pp. 22–23, note 55; online appendix §B.2, pp. 7–9 (PDF pp. 41–43). The full Boolean-valued construction, and the observation that a nonconstructible real makes an analytical truth contingent.
