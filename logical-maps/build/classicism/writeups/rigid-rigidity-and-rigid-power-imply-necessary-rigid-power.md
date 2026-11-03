# Rigid Rigidity ∧ Rigid Power ⇒ □Rigid Power

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.rigid_rigidity_and_rigid_power_imply_necessary_rigid_power`; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Premises

- **Rigid Rigidity.** Being rigid is a rigid property of relations, including propositions.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.

## Conclusion

- **□Rigid Power.** Necessarily, if a relation is rigid, so is the property of being a rigid relation that entails it.

## Proof

Let $R:=\lambda X\, .\,\operatorname{Rigid}(X)$ and $Z:=\lambda F\, .\,\operatorname{Rigid}(\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F)$. By Rigid Power, every $F$ with $RF$ has $ZF$, and so $\Box ZF$, since rigidity, if true, is necessary ([[rigid-necessary]]). Rigid Rigidity makes $R$ rigid, so in particular inextensible; at the actual world, by T, this says that if every $F$ with $RF$ has $\Box ZF$ then $R\le Z$. So $R\le Z$, that is, $\Box\forall F\, .\,\operatorname{Rigid}(F)\to \operatorname{Rigid}(\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F)$, which is □Rigid Power.

## Notes

The instance of Rigid Rigidity used is the one at the type of $F$, together with Rigid Power at the same type. Since □BF and Rigid Power imply Rigid Rigidity ([[necessary-barcan-and-rigid-power-imply-rigid-rigidity]]), □BF and Rigid Power imply □Rigid Power.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, A recurrent-colour countermodel, research note of 26 October 2026, §11 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).

<p class='cert'>Record: <code>topics/classicism/results/rigid-rigidity-and-rigid-power-imply-necessary-rigid-power.yaml</code></p>
