# Strong Atomicity ⇒ Atoms are strong atoms

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Conclusion

- **Atoms are strong atoms.** At each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Proof

Let $X$ be an atom. It is not bottom, so Strong Atomicity gives a strong atom $W\le X$. $W$ is not bottom and is a part of the atom $X$, so $W=X$, and $X$ is a strong atom.

## Notes

With [[atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r]] and the recorded derivation of Atomicity, Strong Atomicity is equivalent to Atomicity together with Atoms are strong atoms.

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-r-implies-atoms-are-strong-atoms-r.yaml</code></p>
