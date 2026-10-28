# Atomicity ∧ Atoms are strong atoms ⇒ Strong Atomicity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **Atoms are strong atoms.** At each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Conclusion

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Proof

A possible entity is not bottom, so Atomicity gives an atom below it, which is a strong atom by the second premise.

## Notes

The factor of Bacon’s Exercise 8.12 that does not use BF: the recorded derivation of Strong Atomicity from Atomicity and BF is now this together with [[barcan-relational-implies-atoms-are-strong-atoms-r]].

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r.yaml</code></p>
