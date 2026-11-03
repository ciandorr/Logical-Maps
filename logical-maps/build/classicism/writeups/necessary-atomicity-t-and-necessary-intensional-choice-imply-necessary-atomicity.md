# □Atomicity (type t) ∧ □Intensional Choice ⇒ □Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_atomicity_t_and_necessary_intensional_choice_imply_necessary_atomicity`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, from the unboxed result; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **□Atomicity (type t).** Necessarily, every non-bottom proposition has an atom below it.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.

## Proof

The proof of [[atomicity-t-and-intensional-choice-imply-atomicity]] uses its premises only at finitely many closed instances and nothing beyond C. So for each closed instance of the conclusion, C proves the conditional from the corresponding premise instances to it. Necessitate that theorem and apply K with the boxed premise instances. Generalization over the admitted types is metalinguistic; no type quantifier is placed inside the box.

## Notes

Boxed counterpart of [[atomicity-t-and-intensional-choice-imply-atomicity]].

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/necessary-atomicity-t-and-necessary-intensional-choice-imply-necessary-atomicity.yaml</code></p>
