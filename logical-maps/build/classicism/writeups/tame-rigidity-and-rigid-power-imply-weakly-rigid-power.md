# Tame Rigidity ∧ Rigid Power ⇒ Weakly Rigid Power

<p class='cert'>Conjecture — Source: Misc.; produced by Cian Dorr, question of 10 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 10 October 2026.</p>

## Premises

- **Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.

## Conclusion

- **Weakly Rigid Power.** If a relation is weakly rigid, so is the property of being a weakly rigid relation that entails it.

## Notes

The converse of weakly-rigid-power-implies-tame-rigidity and weakly-rigid-power-implies-rigid-power. With □Tame Rigidity in place of Tame Rigidity it is proved (necessary-tame-rigidity-and-rigid-power-imply-weakly-rigid-power). The unboxed argument fails at weak inextensibility: for weakly rigid $F$, $P_F:=\lambda X\, .\,\operatorname{WeaklyRigid}(X)\land X\le F$ is weakly persistent, but $Z:=\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F$ satisfies $\forall X\, .\,P_FX\to\Box ZX$, so the weak inextensibility of $P_F$ requires $P_F\le Z$, which is Tame Rigidity below $F$ at every accessible world. Weakly Rigid Power implies □Tame Rigidity at type $t$ (and, with BF, at every type: barcan-and-weakly-rigid-power-imply-necessary-tame-rigidity), so the conjecture would follow from Tame Rigidity + Rigid Power ⇒ □Tame Rigidity, and a countermodel must satisfy Tame Rigidity and Rigid Power while failing □Tame Rigidity at type $t$. No recorded model yet separates Tame Rigidity from □Tame Rigidity.

Refuted (25 October 2026): [[symmetric-finite-compression-entrance]], GPT-6 Astra's construction (prompted by Daniel Kodsi, 23 October 2026), satisfies Tame Rigidity and Rigid Power at every type and fails Weakly Rigid Power at type $et$, through a weakly rigid but not rigid relation below the transport of a rigid bound, at a world where □Tame Rigidity fails at type $et$. Since then [[symmetric-entrance-qualitative-links]] and this model both separate Tame Rigidity from □Tame Rigidity.

## Revisions

- **2026-10-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — (minor) Notes: the countermodel that refutes the conjecture.

## Sources

- **Dorr 10 Oct** — Cian Dorr, question of 10 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/tame-rigidity-and-rigid-power-imply-weakly-rigid-power.yaml</code></p>
