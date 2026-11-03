# Atoms are strong atoms (type t) ∧ Intensional Choice ⇒ Atoms are strong atoms

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.atoms_are_strong_atoms_t_and_intensional_choice_imply_atoms_are_strong_atoms_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, on the pattern of Cian Dorr's argument for Atomicity; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Atoms are strong atoms (type t).** Every atom is a strong atom.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **Atoms are strong atoms.** At each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Proof

Let $X^{\bar\sigma t}$ be an atom. By [[unique-instance-copies]], Intensional Choice makes $X$ the copy $A_w$ of its instance proposition $w:=\exists\bar x\, .\,X\bar x$ along a necessarily uniquely instantiated $G$, and $w$ is an atom. By the type-$t$ principle $w$ is a strong atom, so $X=A_w$ is a strong atom by the same lemma.

## Notes

Intensional Choice is what makes an atom a copy of a proposition: without it an atom may have several instances at a world where none of them exists at the evaluation point. Compare [[barcan-relational-implies-atoms-are-strong-atoms-r]], where BF gives the relational form outright.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/atoms-are-strong-atoms-t-and-intensional-choice-imply-atoms-are-strong-atoms-r.yaml</code></p>
