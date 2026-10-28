# □Strong Atomicity ∧ □Rigid Comprehension ⇒ □BF (relational types)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational`; produced by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026, from Cian Dorr's argument of 11 October 2026 and Bacon's Lemma C.6; recorded by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026.</p>

## Premises

- **□Strong Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.

## Conclusion

- **□BF (relational types).** Necessarily, BF holds at every relational type.

## Proof

□Strong Atomicity gives □Atomicity (necessary-strong-atomicity-implies-necessary-atomicity), and with □Rigid Comprehension, □Rigid Power (necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power). Cian Dorr's argument in strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational derives BF at a relational type $\sigma$ in C from Strong Atomicity at $\sigma$, Rigid Comprehension at $\sigma\to t$ at every world, and Rigid Power at $\sigma\to t$. It is a derivation in C from instances of its three premises, so its necessitation is a theorem of C, and □Strong Atomicity, □Rigid Comprehension (whose own necessitation it is by 4) and □Rigid Power give □BF at $\sigma$.

## Notes

The boxed form of [[necessary-strong-atomicity-and-rigid-comprehension-imply-necessary-bf-relational]].

Theorem 8.2 of Bacon's book, with □Rigid Comprehension in place of Rigid Comprehension. Rigid Comprehension at other worlds enters twice: in Lemma C.6's pull-back, run at every world for □Rigid Power, and in step (ii) of Dorr's argument. The conjecture with unboxed Rigid Comprehension is untouched: a countermodel to it would have □Strong Atomicity and Rigid Comprehension without □Rigid Comprehension.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026, after the gap in Bacon's Theorem 8.2 (strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational).
- **Could mathematics have been different?** — Andrew Bacon, Could the truths of mathematics have been different?, draft of 9 October 2025, Appendix C.2, Lemma C.6 (atomicity-and-rigid-comprehension-imply-rigid-power).
- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Theorem 8.2, pp. 169–170, the theorem this record proves with □Rigid Comprehension in place of Rigid Comprehension.

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-atomicity-and-necessary-rigid-comprehension-imply-necessary-bf-relational.yaml</code></p>

## Paper references

- **Related: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Theorem 8.2, pp. 169–170. The theorem as stated there, with unboxed Rigid Comprehension, remains the recorded conjecture necessary-strong-atomicity-and-rigid-comprehension-imply-necessary-bf-relational.
- **Proof: [Could the truths of mathematics have been different?](https://andrew-bacon.github.io/papers/Could%20mathematics%20have%20been%20different.pdf).** Bacon, Andrew (2025). Could the truths of mathematics have been different? Draft dated 9 October 2025, with online appendix; published in Philosophical Review 135(3), 2026, pp. 221–285, as cited by Barton and Goodsell. Locators refer to the draft. The full Boolean-valued construction is in appendix §B.2, pp. 7–9 of the separately paginated appendix (PDF pp. 41–43); Theorem 4.4 and its proof (Appendix C.1) and Lemma C.6 (Appendix C.2) were read directly on 19 October 2026. — Appendix C.2, Lemma C.6
