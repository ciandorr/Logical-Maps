# Strong Atomicity (type t) ⇒ □Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_t_implies_necessary_strong_actuality`; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

The argument of [[strong-atomicity-t-implies-necessary-actuality]], with Strong Actuality in place of Actuality. Write $D(w)$ for $\Box\forall q\, .\,w\le q\lor w\le\neg q$ and $A$ for Strong Actuality, $\exists w\, .\,w\land D(w)$. Every strong atom $w$ entails $A$: by 4, $D(w)\to\Box D(w)$, and $\Box D(w)$ gives $\Box(w\to w\land D(w))$, hence $\Box(w\to A)$, which is $w\le A$. Now suppose $\Diamond\neg A$. Strong Atomicity (type $t$) supplies a strong atom $w\le\neg A$. With $w\le A$ this gives $w=\bot$, contradicting $\Diamond w$. Hence $\Box A$.

## Notes

Stronger than [[strong-atomicity-t-implies-necessary-actuality]] and [[strong-atomicity-t-implies-strong-actuality]], which now follow, Strong Actuality implying Actuality. Astra's note states it as the type-$t$ case of a schema: Strong Atomicity at a relational type gives that necessarily every tuple falls under a strong atom of that type.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Strong worlds and domain control, research note of 26 October 2026, §6 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-implies-necessary-strong-actuality.yaml</code></p>
