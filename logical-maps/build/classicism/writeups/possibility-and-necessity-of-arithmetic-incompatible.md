# Possibility Maximalism (pure) ∧ Necessity of Arithmetic ⇒ False (⊥)

<p class='cert'>Result — Source: Arithmetic is Necessary (2024 draft); produced by Zachary Goodsell; recorded by Claude Fable 5.1 (Anthropic), 20 September 2026.</p>

## Premises

- **Possibility Maximalism (pure).** Every closed pure sentence consistent with C is possible.
- **Necessity of Arithmetic.** Every arithmetical sentence is either necessarily true or necessarily false, given that possibly zero is not a successor and successor is injective on numbers. One sentence for each arithmetical sentence.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Theorem 11 of the source, applied to C. The theorems of C are recursively enumerable, and C is consistent with $I$, since $I^*$ and hence $I$ hold in the full Henkin model with a countably infinite individual domain. So the arithmetical sentences $A$ with $C\vdash I\to A$ form a consistent, recursively enumerable extension of Peano arithmetic (the source's Lemma 1 supplies the axioms). By Gödel's first incompleteness theorem there is an arithmetical sentence $A$ for which neither $I\to A$ nor $I\to\neg A$ is a theorem of C, so $I\land A$ and $I\land\neg A$ are both consistent with C. Both are closed pure sentences, so Possibility Maximalism (pure) gives $\Diamond(I\land A)$ and $\Diamond(I\land\neg A)$. But the instance of the Necessity of Arithmetic at $A$ says $\Box(I\to A)$ or $\Box(I\to\neg A)$, and by K each disjunct contradicts one of the two possibilities.

## Notes

The source's theorem is general: the maximalization of any recursively enumerable extension of HK consistent with $I$ refutes some instance of the necessity schema. The record uses Possibility Maximalism (pure) directly; the equivalent Distinctness Maximalism form gives the same through the recorded equivalence. The argument is metatheoretic in two places, the recursive enumerability of C and Gödel's theorem, like the consistency side condition of Possibility Maximalism itself.

## Sources

- **Arithmetic is Necessary** — Zachary Goodsell, Arithmetic is Necessary, draft of 5 June 2024, §6, Theorem 11 and n. 14, pp. 24–26.
- **Fable 20 Sep** — Claude Fable 5.1 (Anthropic), 20 September 2026, for the consistency of C with $I$ (full-henkin-infinite-base).

<p class='cert'>Record: <code>topics/classicism/results/possibility-and-necessity-of-arithmetic-incompatible.yaml</code></p>

## Paper references

- **Proof: Arithmetic is Necessary.** Goodsell, Zachary William Lee. Arithmetic is Necessary. Draft dated 5 June 2024, 28 pages. Derives the necessity of arithmetic in the logic HKC (H plus K plus Countable Boolean Completeness) and shows that Boolean Completeness is inconsistent with the maximalization of any recursively enumerable extension of HK consistent with I, answering the question of Classicism, §2.6. Locators refer to this draft. — §6, Theorem 11 and n. 14, pp. 24–26
