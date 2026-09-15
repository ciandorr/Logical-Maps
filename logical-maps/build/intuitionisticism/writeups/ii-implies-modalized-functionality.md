# ⊤ ⇒ Modalized functionality

<p class='cert'>Result — Source: Classicism; produced by Andrew Bacon and Cian Dorr (modalized-functionality result, as credited by Goodsell); Codex (GPT-6), alternative syntactic proof; recorded by Codex (GPT-6).</p>

## Premises

- $\top$

## Conclusion

- **Modalized functionality.** For every $\sigma ,\tau : \forall f,g:\sigma \tau . \Box (\forall x:\sigma . f x = g x) \to (f = g)$

## Proof

Fix arbitrary types $\sigma$ and $\tau$. Since every type is built from t by arrows, write $\tau =\tau _{1}\to \cdots \to \tau _{n}\to t$, allowing $n=0$. Fix $f,g:\sigma \to \tau$, and put $A:=\forall x:\sigma . fx=gx$. Choose $x,y_{1},\ldots ,y_{n}$ fresh for A.

With no assumptions, intuitionistic logic and substitution of equals prove
$(A \land f x y_{1}\cdots y_{n}) \leftrightarrow (A \land g x y_{1}\cdots y_{n})$.
Apply propositional intensionality to this assumption-free equivalence. Then apply function intensionality successively to $y_{n},\ldots ,y_{1},x$. This yields the assumption-free identity
$(\lambda x y_{1}\cdots y_{n}. A\land f x y_{1}\cdots y_{n}) = (\lambda x y_{1}\cdots y_{n}. A\land g x y_{1}\cdots y_{n})$.

Now assume $\Box A$, that is $A=\top$. Leibniz substitution replaces A by $\top$ in that previously derived identity. The assumption-free identities $\top \land r=r$, abstracted using function intensionality, and $\eta$-conversion simplify its two sides to f and g. Hence $f=g$. Discharge $\Box A$ and generalize f,g. Since $\sigma ,\tau$ were arbitrary, this proves every instance of modalized functionality. Neither intensionality rule was applied under the $\Box A$ assumption.

The same construction, starting with $A:=\forall x.(fx\leftrightarrow gx)$ when $f,g:\sigma \to t$, proves the predicate form $\Box \forall x.(fx\leftrightarrow gx)\to f=g$. The zero-argument case proves $\Box (p\leftrightarrow q)\to p=q$. These forms will be used in the connecting proofs.

## Notes

Previously recorded with proof pending. The all-types syntactic proof now supplied uses the standing empty-context intensionality rules and $\eta$-conversion, with no function-extensionality assumption. Original attribution is retained; the alternative proof is separately credited. No independent checker or Lean verification.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr (2024), Classicism, pp. 109–190; equivalence with function intensionality credited in Goodsell, §5.2, p. 32.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §5.2, Eq. (70), p. 32.
- **Codex alternative proof, 13 Sep 2026** — Codex (GPT-6), alternative syntactic proof of every type instance, 2026-09-13.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-modalized-functionality.yaml</code></p>

## Paper references

- **Origin: Classicism.** Andrew Bacon and Cian Dorr (2024). Classicism. In Higher-Order Metaphysics, edited by Peter Fritz and Nicholas K. Jones, pp. 109–190.. Attribution follows Goodsell; the proof recorded here is a separately credited reconstruction, not a transcription of the external proof.
- **Formulation: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §5.2, Eq. (70), p. 32
