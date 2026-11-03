# Maximalism (pure) ⇒ Arithmetic Necessitism

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.maximalism_implies_arithmetic_necessitism`; produced by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 23 October 2026; stated as a result by OpenAI Codex (GPT-6), prompted by Daniel Kodsi, 28 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Premises

- **Maximalism (pure).** Every closed pure identity not provable in C is false. The non-theorem condition is metalinguistic.

## Conclusion

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.

## Proof

Vacuously, at every type $\sigma$. In the full model with one world and one individual every type is finite. If the type $\sigma$ has $m$ entities there, the number $\operatorname{Suc}_\sigma^{m+1}\mathbf 0_\sigma$ holds of no property, so it is the empty property of type $\nu_\sigma$, and so is its successor. Thus $\operatorname{Suc}_\sigma(\operatorname{Suc}^m_\sigma\mathbf 0_\sigma)=\operatorname{Suc}_\sigma (\operatorname{Suc}^{m+1}_\sigma\mathbf 0_\sigma)$, while $\operatorname{Suc}^m_\sigma\mathbf 0_\sigma$, which holds of the universal property, differs from $\operatorname{Suc}^{m+1}_\sigma\mathbf 0_\sigma$. Both are numbers, so $I^*_\sigma$ fails there. So $I^*_\sigma=\top$ is a closed pure identity not provable in C, and Maximalism (pure) makes it false. Hence $\Box I^*_\sigma$ is false, and the instance of Arithmetic Necessitism at $\sigma$ holds.

## Notes

This is the coalesced-sums argument arithmetic-necessitism-complete-components, stated with its actual premise. The principle holds only vacuously here. Maximalism refutes the sentence-level [[necessity-of-arithmetic]] guard as well, and nothing about a necessitated form follows.

## Sources

- **Fable 23 Oct** — Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, argument arithmetic-necessitism-complete-components of the coalesced-sums group, 23 October 2026.
- **Codex via Kodsi 28 Oct** — OpenAI Codex (GPT-6), prompted by Daniel Kodsi, Maximalism implies Arithmetic Necessitism, 28 October 2026, §1 (unpaginated), in Daniel Kodsi's pull request #21.

<p class='cert'>Record: <code>topics/classicism/results/maximalism-implies-arithmetic-necessitism.yaml</code></p>
