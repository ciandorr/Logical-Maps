# Strong Atomicity (type t) ∧ Intensional Choice ⇒ Strong Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_t_and_intensional_choice_imply_strong_atomicity`; produced by Cian Dorr, 30 October 2026 (by parallel reasoning to the atom case); written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Proof

Let $X^{\bar\sigma t}\ne\bot$, so that $\Diamond\exists\bar x\, .\,X\bar x$ by Intensionality. Strong Atomicity (type t) gives a strong atom $w\le\exists\bar x\, .\,X\bar x$. Intensional Choice (polyadic form), applied to $\lambda\bar x\, .\,w\to X\bar x$, which is necessarily instantiated, gives a necessarily uniquely instantiated $G$ with $A_w:=\lambda\bar x\, .\,w\land G\bar x\le X$. By [[unique-instance-copies]], $A_w$ is a strong atom because $w$ is one.

## Notes

The Intensional Choice counterpart of the boxed [[necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity]], whose unboxed form the engine derives. The engine also derives it, from [[atomicity-t-and-intensional-choice-imply-atomicity]], [[atoms-are-strong-atoms-t-and-intensional-choice-imply-atoms-are-strong-atoms-r]] and [[atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r]]; recorded directly at Cian Dorr's request.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-and-intensional-choice-imply-strong-atomicity.yaml</code></p>
