# □Rigid Comprehension ∧ Intensional Choice ∧ Forcing Possibilism ∧ Non-contingency of the Continuum Hypothesis ⇒ ⊥

<p class='cert'>Conjecture — Source: Could the truths of mathematics have been different? (draft); produced by Andrew Bacon (Theorem 6.1, stated with its proof to be presented elsewhere); recorded by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 23 October 2026.</p>

## Premises

- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **Non-contingency of the Continuum Hypothesis.** Either necessarily every real number structure satisfies the continuum hypothesis, or necessarily every real number structure falsifies it: that every subproperty of the continuum either injects into the natural numbers or is in bijection with the continuum. One sentence for each type $\sigma$.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Notes

Stated by Bacon as a theorem, with the proof deferred to another venue; his handout of 19 October 2026 on the lottery-algebra model and the draft Modalized Domains on Possibility Frames do not reproduce it (the lottery record notes a transfer argument not given there). The expected proof: Forcing Possibilism supplies a proposition whose entailment algebra is a complete Boolean algebra forcing CH, and one forcing its negation; under □Rigid Comprehension and Intensional Choice the real number structures at the worlds below each are those of the corresponding generic extensions. Recorded as conjectured until a proof is supplied; a written proof, or a model of the three premises deciding CH one way necessarily, would settle it.

As encoded, with the map's strict reading of smallness (finite, or with strictly fewer elements than there are propositions), the conjecture is refuted: [[full-free-monoid-glued-constants]], [[full-free-monoid-glued-constants-singleton]], [[full-free-product-glued-constants]], [[full-double-retraction-glued-constants]] and [[ultraproduct-countable-full-s5-finite-individuals]] satisfy □Rigid Comprehension, Intensional Choice, Forcing Possibilism and Non-contingency of CH. Each has exactly $2^{\aleph_0}$ propositions, and an infinite complete Boolean algebra has at least $2^{\aleph_0}$ elements, so only finite algebras are small there, and Forcing Possibilism never asks for an algebra that changes CH. (For the ultraproduct, this holds in every factor.) The expected proof needs a CH-changing algebra to be small: an algebra forcing $\neg$CH has at least $\aleph_2$ elements, and one forcing CH over a model of $\neg$CH may have $2^{2^{\aleph_0}}$, so a premise saying that there are more than $2^{2^{\aleph_0}}$ propositions would suffice for that step, while one saying only that there are more than $2^{\aleph_0}$ might not. In the lottery cloud of Modalized Domains (Bacon and Claude Opus 5.5, Remark 6.12), which the source cites, every complete Boolean algebra of size below a strong limit $\mu$ is small and realized; Bacon's Theorem 6.1 is cited there as showing that CH is contingent in it.

Suggested repair (Cian Dorr, 25 October 2026): add the premise that there are more than $2^{2^{\aleph_0}}$ propositions, i.e. that no injective relation runs from the properties of the reals of some real number structure into the propositions. All five models above falsify it. It is not recorded as a principle until the repaired implication is proved, since by itself it would only call for large variants of many models.

## Revisions

- **2026-10-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — Notes: refuted as encoded, by five recorded models with exactly continuum many propositions; what a repaired premise would need.

## Sources

- **Could mathematics have been different?** — Andrew Bacon, Could the truths of mathematics have been different?, draft of 9 October 2025, §6, Theorem 6.1, p. 27.

<p class='cert'>Record: <code>topics/classicism/results/necessary-rigid-comprehension-intensional-choice-and-forcing-possibilism-incompatible-with-non-contingency-of-ch.yaml</code></p>

## Paper references

- **Origin: [Could the truths of mathematics have been different?](https://andrew-bacon.github.io/papers/Could%20mathematics%20have%20been%20different.pdf).** Bacon, Andrew (2025). Could the truths of mathematics have been different? Draft dated 9 October 2025, with online appendix; published in Philosophical Review 135(3), 2026, pp. 221–285, as cited by Barton and Goodsell. Locators refer to the draft. The full Boolean-valued construction is in appendix §B.2, pp. 7–9 of the separately paginated appendix (PDF pp. 41–43); Theorem 4.4 and its proof (Appendix C.1) and Lemma C.6 (Appendix C.2) were read directly on 19 October 2026. — §6, Theorem 6.1, p. 27. □Rigid Comprehension, Intensional Choice and Mathematical Possibilism (the map's Forcing Possibilism) entail structural contingency about the continuum hypothesis, $\Diamond\exists X(\operatorname{Real}X\land\operatorname{CH}(X))\land\Diamond\exists X(\operatorname{Real}X\land\neg\operatorname{CH}(X))$, which contradicts both disjuncts of the Non-contingency of the Continuum Hypothesis at that type.
