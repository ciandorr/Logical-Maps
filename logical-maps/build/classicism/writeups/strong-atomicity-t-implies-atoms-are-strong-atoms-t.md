# Strong Atomicity (type t) ⇒ Atoms are strong atoms (type t)

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **Atoms are strong atoms (type t).** Every atom is a strong atom.

## Proof

Let $X$ be an atom. It is not bottom, so Strong Atomicity gives a strong atom $W\le X$. $W$ is not bottom and is a part of the atom $X$, so $W=X$, and $X$ is a strong atom.

## Notes

With [[atomicity-t-and-atoms-are-strong-atoms-t-imply-strong-atomicity-t]] and the recorded derivation of Atomicity, Strong Atomicity is equivalent to Atomicity together with Atoms are strong atoms.

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-implies-atoms-are-strong-atoms-t.yaml</code></p>
