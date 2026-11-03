# □Atomlessness ⇒ □Self-atoms are strong atoms

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026, from Claude Fable 5.1's argument no-atoms-no-self-atoms of 25 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Premises

- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.

## Conclusion

- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Proof

By 4, $\Box$Atomlessness gives $\Box\Box$Atomlessness, so at every world, and every world it sees, there is no atom of type $t$. Nor is there one of a relational type: an atom $X$ of type $\bar\sigma t$ would give the atom $\exists\bar x\, .\,X\bar x$ of type $t$, since for $q$ below it, $\lambda\bar x\, .\,X\bar x\land q$ is below $X$, so it is $X$ or $\bot$, and $q$ is then $\exists\bar x\, .\,X\bar x$ or $\bot$. So, necessarily, nothing is a self-atom: a self-atom is possible, so instantiated at some world it sees, where it is an atom. Necessarily, then, every self-atom is a strong atom (and so an atom), vacuously.

## Notes

With [[necessary-atomlessness-implies-necessary-atoms-are-strong-atoms-r]], every boxed bridge principle follows: these are the verdicts of the argument no-atoms-no-self-atoms, stated as consequences of □Atomlessness.

## Sources

- **Fable 25 Oct** — Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, argument no-atoms-no-self-atoms, 25 October 2026, turned into a result at Cian Dorr's suggestion of 29 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/necessary-atomlessness-implies-necessary-self-atoms-are-strong-atoms-r.yaml</code></p>
