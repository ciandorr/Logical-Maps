# ⊤ ⇒ Nonfalsity candidate characterization

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **Nonfalsity candidate characterization.** $\mathrm{Possibility}_\vee$$(\neg \circ \neg ) = \Box (\forall p:t. \neg p \lor \neg \neg p)$

## Proof

For $P=\neg \circ \neg , \operatorname{PSa}$ follows from $\Box (p\to q)\to (p\to q)$ and intuitionistic monotonicity of double negation; PSb is also an intuitionistic theorem. Universally close and necessitate both. Thus $\mathrm{Possibility}_\vee$$(\neg \circ \neg )$ is equivalent to necessary nonfalsity distribution. Theorem 8’s case argument gives the assumption-free equivalence of that sentence with necessary weak excluded middle (the two implications are recorded separately). Apply standing propositional intensionality to this assumption-free equivalence to obtain the displayed identity.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 8, Eq. (34), p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-nonfalsity-candidate-characterization.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.2, Theorem 8, Eq. (34), p. 19
