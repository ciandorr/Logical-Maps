# □Strong Atomicity (type t) ∧ □Intensional Choice ⇒ □Strong Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_strong_atomicity_t_and_necessary_intensional_choice_imply_necessary_strong_atomicity`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, from the unboxed result; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **□Strong Atomicity (type t).** Necessarily, every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **□Strong Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation.

## Proof

The proof of [[strong-atomicity-t-and-intensional-choice-imply-strong-atomicity]] uses its premises only at finitely many closed instances and nothing beyond C. So for each closed instance of the conclusion, C proves the conditional from the corresponding premise instances to it. Necessitate that theorem and apply K with the boxed premise instances. Generalization over the admitted types is metalinguistic; no type quantifier is placed inside the box.

## Notes

Boxed counterpart of [[strong-atomicity-t-and-intensional-choice-imply-strong-atomicity]]. The engine also derives it, from the Atomicity and Atoms are strong atoms lifts and [[necessary-atomicity-r-and-necessary-atoms-are-strong-atoms-r-imply-necessary-strong-atomicity-r]]; recorded directly at Cian Dorr's request.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-atomicity-t-and-necessary-intensional-choice-imply-necessary-strong-atomicity.yaml</code></p>
