# Self-atoms are atoms (type t) ⇒ Self-atoms are atoms

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.self_atoms_are_atoms_t_implies_self_atoms_are_atoms_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, in a survey of the type-t principles after Cian Dorr's argument for Atomicity; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Self-atoms are atoms (type t).** Every self-atom is an atom.

## Conclusion

- **Self-atoms are atoms.** At each relational type, every self-atom is an atom.

## Proof

Let $X^{\bar\sigma t}$ be a self-atom and $w:=\exists\bar x\, .\,X\bar x$. By [[atom-instance-proposition]], $w$ is a self-atom, so by the type-$t$ principle an atom; and $X\ne\bot$. Let $Z\le X$. Then $\exists\bar x\, .\,Z\bar x\le w$, so it is $w$ or $\bot$. If $\bot$, $Z=\bot$ by Intensionality. Otherwise $\Box(w\to\exists\bar x\, .\,Z\bar x)$. Necessarily, if $X\bar a$, then $X$ is an atom (being a self-atom), $Z\le X$ (an identity, so necessary), and $Z$ is instantiated, hence non-bottom; so $Z=X$ and $Z\bar a$. Hence $X\le Z$, and $Z=X$.

## Notes

No choice is needed: a self-atom is an atom wherever it is instantiated, and that already forces its instances there to be unique, which is what Intensional Choice supplies for atoms in [[atoms-are-self-atoms-t-and-intensional-choice-imply-atoms-are-self-atoms-r]].

## Sources

- **Opus 30 Oct** — Claude Opus 5.5 (Anthropic), survey of 30 October 2026 requested by Cian Dorr (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atoms-are-atoms-t-implies-self-atoms-are-atoms-r.yaml</code></p>
