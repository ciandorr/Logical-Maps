# BF (type t) ⇒ Atoms are strong worlds (type t)

<p class='cert'>Result — Source: Misc.; produced by Andrew Bacon (Exercise 8.12); isolated as a bridge result by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **Atoms are strong worlds (type t).** Every atom is a strong world proposition.

## Proof

Let $w$ be an atom. For each $q$, $w\le q\lor w\le\neg q$ is true and, being a disjunction of two necessities, necessary by 4; so $\forall q\, .\,\Box(w\le q\lor w\le\neg q)$. BF (type t), for the property $\lambda q\, .\,w\le q\lor w\le\neg q$, gives $\Box\forall q\, .\,w\le q\lor w\le\neg q$. With $w\ne\bot$, $w$ is a strong world. This is the argument of Bacon’s Exercise 8.12 (the recorded derivation of the Strong Leibniz Biconditionals from Atomicity and BF) with its use of Atomicity removed.

## Notes

Refactors [[atomicity-t-and-bf-t-imply-strong-leibniz-t]], which the engine now derives from this and [[atomicity-t-and-atoms-are-strong-worlds-t-imply-strong-leibniz-t]].

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of the Strong Leibniz results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/barcan-t-implies-atoms-are-strong-worlds-t.yaml</code></p>
