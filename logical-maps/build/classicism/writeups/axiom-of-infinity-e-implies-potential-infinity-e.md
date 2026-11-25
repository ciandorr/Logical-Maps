# Axiom of Infinity (type e) ⇒ Potential Infinity (type e)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.axiom_of_infinity_e_implies_potential_infinity_e`; produced by Zachary Goodsell (the principle and the claim), 24 November 2026; proof by Claude Fable 5.2 (Anthropic); recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Premises

- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.

## Conclusion

- **Potential Infinity (type e).** For every natural number, there could be at least that many individuals: each number counted at type $e$ possibly holds of some property of individuals.

## Proof

Background, [[potential-infinity-forms]], part 3, at $\sigma=e$. By the induction that $\operatorname{FiniteCardinality}_e$ provides, every number $n$ counted at type $e$ holds of some property. The empty property has cardinality $\mathbf 0_e$. If a number $k$ holds of $X$, then $X$ is not coextensive with $\lambda u^e\, .\,\top$, of which no number holds, by the Axiom and since a finite cardinality respects coextension; so $\neg Xy$ for some $y$, and $\operatorname{Suc}_ek$ holds of $X$ with $y$ added, $y$ witnessing it. What holds of some property possibly does, by T.

## Notes

The proof gives more than is asked: under the Axiom every number holds of some property outright. The converse fails. Potential Infinity (type $e$) asks only that the individuals could be ever more numerous, and it holds at a world with finitely many individuals that sees one with infinitely many, since Possible Infinity already implies it ([[possible-infinity-e-implies-potential-infinity-e]]).

## Sources

- **Goodsell 24 Nov** — Zachary Goodsell, suggestion of 24 November 2026 (Potential Infinity as a named principle, entailed by the Axiom of Infinity); proof by Claude Fable 5.2 (Anthropic), 24 November 2026.

<p class='cert'>Record: <code>topics/classicism/results/axiom-of-infinity-e-implies-potential-infinity-e.yaml</code></p>
