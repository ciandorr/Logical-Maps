# □Self-Atomicity (type t) ∧ □Intensional Choice ⇒ □Self-Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_self_atomicity_t_and_necessary_intensional_choice_imply_necessary_self_atomicity_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, from the unboxed result; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **□Self-Atomicity (type t).** Necessarily, every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **□Self-Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.

## Proof

The proof of [[self-atomicity-t-and-intensional-choice-imply-self-atomicity-r]] uses its premises only at finitely many closed instances and nothing beyond C. So for each closed instance of the conclusion, C proves the conditional from the corresponding premise instances to it. Necessitate that theorem and apply K with the boxed premise instances. Generalization over the admitted types is metalinguistic; no type quantifier is placed inside the box.

## Notes

Boxed counterpart of [[self-atomicity-t-and-intensional-choice-imply-self-atomicity-r]].

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/necessary-self-atomicity-t-and-necessary-intensional-choice-imply-necessary-self-atomicity-r.yaml</code></p>
