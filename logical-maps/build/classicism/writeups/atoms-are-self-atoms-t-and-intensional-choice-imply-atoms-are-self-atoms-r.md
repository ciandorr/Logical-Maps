# Atoms are self-atoms (type t) ∧ Intensional Choice ⇒ Atoms are self-atoms

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.atoms_are_self_atoms_t_and_intensional_choice_imply_atoms_are_self_atoms_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, on the pattern of Cian Dorr's argument for Atomicity; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **Atoms are self-atoms.** At each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.

## Proof

Let $X^{\bar\sigma t}$ be an atom. By [[unique-instance-copies]], Intensional Choice makes $X$ the copy $A_w$ of its instance proposition $w:=\exists\bar x\, .\,X\bar x$ along a necessarily uniquely instantiated $G$, and $w$ is an atom. By the type-$t$ principle $w$ is a self-atom, so $X=A_w$ is a self-atom by the same lemma.

## Notes

Intensional Choice is what makes an atom a copy of a proposition: without it an atom may have several instances at a world where none of them exists at the evaluation point.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/atoms-are-self-atoms-t-and-intensional-choice-imply-atoms-are-self-atoms-r.yaml</code></p>
