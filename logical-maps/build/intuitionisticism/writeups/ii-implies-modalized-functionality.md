# ⊤ ⇒ Modalized functionality

<p class='cert'>Result — Source: Classicism; produced by Andrew Bacon and Cian Dorr (modalized-functionality result, as credited by Goodsell); Codex (GPT-6), alternative syntactic proof; recorded by Codex (GPT-6).</p>

## Premises

- ⊤

## Conclusion

- **Modalized functionality.** For every σ,τ: ∀f,g:στ. □(∀x:σ. f x = g x) → (f = g)

## Proof

Fix arbitrary types σ and τ. Since every type is built from t by arrows, write τ=τ₁→⋯→τₙ→t, allowing n=0. Fix f,g:σ→τ, and put A:=∀x:σ. fx=gx. Choose x,y₁,…,yₙ fresh for A.

With no assumptions, intuitionistic logic and substitution of equals prove
(A ∧ f x y₁⋯yₙ) ↔ (A ∧ g x y₁⋯yₙ).
Apply propositional intensionality to this assumption-free equivalence. Then apply function intensionality successively to yₙ,…,y₁,x. This yields the assumption-free identity
(λx y₁⋯yₙ. A∧f x y₁⋯yₙ) = (λx y₁⋯yₙ. A∧g x y₁⋯yₙ).

Now assume □A, that is A=⊤. Leibniz substitution replaces A by ⊤ in that previously derived identity. The assumption-free identities ⊤∧r=r, abstracted using function intensionality, and η-conversion simplify its two sides to f and g. Hence f=g. Discharge □A and generalize f,g. Since σ,τ were arbitrary, this proves every instance of modalized functionality. Neither intensionality rule was applied under the □A assumption.

The same construction, starting with A:=∀x.(fx↔gx) when f,g:σ→t, proves the predicate form □∀x.(fx↔gx)→f=g. The zero-argument case proves □(p↔q)→p=q. These forms will be used in the connecting proofs.

## Notes

Previously recorded with proof pending. The all-types syntactic proof now supplied uses the standing empty-context intensionality rules and η-conversion, with no function-extensionality assumption. Original attribution is retained; the alternative proof is separately credited. No independent checker or Lean verification.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr (2024), Classicism, pp. 109–190; equivalence with function intensionality credited in Goodsell, §5.2, p. 32.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §5.2, Eq. (70), p. 32.
- **Codex alternative proof, 13 Sep 2026** — Codex (GPT-6), alternative syntactic proof of every type instance, 2026-09-13.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-modalized-functionality.yaml</code></p>

## Paper references

- **Origin: Classicism.** Andrew Bacon and Cian Dorr (2024). Classicism. In Higher-Order Metaphysics, edited by Peter Fritz and Nicholas K. Jones, pp. 109–190.. Attribution follows Goodsell; the proof recorded here is a separately credited reconstruction, not a transcription of the external proof.
- **Formulation: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §5.2, Eq. (70), p. 32
