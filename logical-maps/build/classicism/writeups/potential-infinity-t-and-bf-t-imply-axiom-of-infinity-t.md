# Potential Infinity (type t) ∧ BF (type t) ⇒ Axiom of Infinity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.potential_infinity_t_and_bf_t_imply_axiom_of_infinity_t`; produced by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026; recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Premises

- **Potential Infinity (type t).** For every natural number, there could be at least that many propositions: each number counted at type $t$ possibly holds of some property of propositions.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.

## Proof

Under BF at type $t$ a finite count is a necessary bound. Claim: if a finite cardinality $Z$ holds of $X$, and whatever is not $X$ is necessarily not $X$, then necessarily no $X^{\prime\prime}\subseteq X$ has cardinality $\operatorname{Suc}Z$. By induction on $Z$. For $\mathbf 0_t$: nothing is $X$, so everything is necessarily not $X$, so by BF necessarily nothing is $X$, and a property with a successor cardinality has an instance. For $\operatorname{Suc}Y$: let $Xy$ and $Y(X-y)$. What is not an instance of $X-y$ is necessarily not one: it is not $X$, or it is $y$, necessarily. So by the induction hypothesis necessarily no subproperty of $X-y$ has cardinality $\operatorname{Suc}Y$. Then necessarily no $X^{\prime\prime}\subseteq X$ has cardinality $\operatorname{Suc}\operatorname{Suc}Y$: if $X^{\prime\prime}y$, then $X^{\prime\prime}-y$ has cardinality $\operatorname{Suc}Y$, by removal (Background, [[finite-cardinality-arithmetic]], $Y$ being necessarily a number), and is included in $X-y$; if not, $X^{\prime\prime}$ less a suitable instance has cardinality $\operatorname{Suc}Y$ and is included in $X-y$. Now suppose the Axiom fails: a number $Z$ holds of $\lambda u^t\, .\,\top$, which everything instantiates. By the claim necessarily no property has cardinality $\operatorname{Suc}Z$, against Potential Infinity at the number $\operatorname{Suc}Z$.

## Notes

Strengthens [[possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t]], whose premise Possible Infinity implies Potential Infinity. That record's lemma shows only that a finite count stays finite under BF; here the count must not grow. C5 proves BF, so in C5 Potential Infinity, Possible Infinity and the Axiom of Infinity at type $t$ coincide.

## Sources

- **Claude Fable 5.2, 24 Nov** — Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026, in a survey of the connections of Potential Infinity.

<p class='cert'>Record: <code>topics/classicism/results/potential-infinity-t-and-bf-t-imply-axiom-of-infinity-t.yaml</code></p>
