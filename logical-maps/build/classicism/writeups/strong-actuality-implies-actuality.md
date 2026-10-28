# Strong Actuality ⇒ Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_actuality_implies_actuality`; produced by Cian Dorr, 6 October 2026 (statement); proof written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 6 October 2026.</p>

## Premises

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Conclusion

- **Actuality.** There is a true proposition that entails every true proposition.

## Proof

Let $w$ be true with $\Box\forall q\, .\,w\le q\lor w\le\neg q$. By T, $w\le q\lor w\le\neg q$ for every $q$. If $q$ is true, $w\le\neg q$ would give $\neg q$ by T, since $w$ is true; so $w\le q$. Thus $w$ is a true proposition entailing every truth, a witness for Actuality.

## Sources

- **Dorr 6 Oct** — Cian Dorr, suggestion of 6 October 2026, introducing Strong Actuality.

<p class='cert'>Record: <code>topics/classicism/results/strong-actuality-implies-actuality.yaml</code></p>
