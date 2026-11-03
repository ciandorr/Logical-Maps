# Self-atoms are strong atoms (type t) ⇒ Self-atoms are strong atoms

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, in a survey of the type-t principles after Cian Dorr's argument for Atomicity; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Self-atoms are strong atoms (type t).** Every self-atom is a strong atom.

## Conclusion

- **Self-atoms are strong atoms.** At each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Proof

Let $X^{\bar\sigma t}$ be a self-atom and $w:=\exists\bar x\, .\,X\bar x$. By [[atom-instance-proposition]], $w$ is a self-atom, so by the type-$t$ principle a strong atom; and $X\ne\bot$. Reason inside the box, with $Y^{\bar\sigma t}$ arbitrary, and put $r:=\exists\bar x\, .\,X\bar x\land Y\bar x$. Then $w\le r$ or $w\le\neg r$. In the second case $X\le\neg Y$. In the first, necessarily, if $X\bar a$, then $X$ is an atom (its self-atom clause holds there by 4), and $Z:=\lambda\bar x\, .\,X\bar x\land Y\bar x\le X$ is instantiated, since $r$ holds, hence non-bottom; so $Z=X$ and $Y\bar a$. That is, $X\le Y$. So $X$ is a strong atom.

## Notes

No choice is needed: a self-atom is an atom wherever it is instantiated, and that already forces its instances there to be unique, which is what Intensional Choice supplies for atoms in [[atoms-are-strong-atoms-t-and-intensional-choice-imply-atoms-are-strong-atoms-r]].

## Sources

- **Opus 30 Oct** — Claude Opus 5.5 (Anthropic), survey of 30 October 2026 requested by Cian Dorr (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atoms-are-strong-atoms-t-implies-self-atoms-are-strong-atoms-r.yaml</code></p>
