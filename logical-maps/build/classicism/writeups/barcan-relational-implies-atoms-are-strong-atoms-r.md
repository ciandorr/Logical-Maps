# BF (relational types) ⇒ Atoms are strong atoms

<p class='cert'>Result — Source: Misc.; produced by Andrew Bacon (Exercise 8.12); isolated as a bridge result by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **BF (relational types).** The Barcan Formula at every relational type, that is, at every type other than e.

## Conclusion

- **Atoms are strong atoms.** At each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.

## Proof

Let $W$ be an atom of a relational type $\sigma$. For each $Y^\sigma$, $W\le Y\lor W\le\neg Y$ is true and, being a disjunction of two necessities, necessary by 4; so $\forall Y\, .\,\Box(W\le Y\lor W\le\neg Y)$. BF at $\sigma$, for the property $\lambda Y\, .\,W\le Y\lor W\le\neg Y$, gives $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$. With $W\ne\bot$, $W$ is a strong atom. This is the argument of Bacon’s Exercise 8.12 (the recorded derivation of Strong Atomicity from Atomicity and BF) with its use of Atomicity removed.

## Notes

Refactors [[atomicity-and-bf-relational-imply-strong-atomicity]], which the engine now derives from this and [[atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r]].

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/barcan-relational-implies-atoms-are-strong-atoms-r.yaml</code></p>
