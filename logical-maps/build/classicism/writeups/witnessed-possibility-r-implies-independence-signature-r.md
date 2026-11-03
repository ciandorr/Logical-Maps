# Witnessed Possibility ⇒ Independence (signature Σ)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.witnessed_possibility_r_implies_independence_signature_r`; produced by Claude Fable 5.1 (Anthropic), 14 October 2026, at Cian Dorr's direction, after Bacon's derivation of Independence from Logical Necessity; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026.</p>

## Premises

- **Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.

## Conclusion

- **Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.

## Proof

Let $c$ be a constant of relational type $\tau$, $\bar d$ distinct constants other than $c$, and $A$ closed and pure. The pure formula $P(x,\bar y):=x\ne A\bar y$ has free variables matching the distinct constants $c,\bar d$, and its existential closure is a theorem of C: for any $\bar y$, $A\bar y$ is one entity of type $\tau$, and $\top_\tau\ne\bot_\tau$, so one of these differs from it. Witnessed Possibility therefore gives $\Diamond(c\ne A\bar d)$. If $c=A\bar d$, the necessity of identity, a theorem of C, gives $\Box(c=A\bar d)$, contradicting that possibility. So $c\ne A\bar d$.

## Notes

Bacon's n. 53 derives Independence from Logical Necessity, that is from Witnessed Possibility together with No Pure Contingency; the second conjunct is not needed, whereas Separated Structure does need it: the model full-double-retraction-glued-constants has Witnessed Possibility without Separated Structure. Recorded while surveying what Witnessed Possibility leaves open.

## Sources

- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §4, p. 568 and n. 53.

<p class='cert'>Record: <code>topics/classicism/results/witnessed-possibility-r-implies-independence-signature-r.yaml</code></p>

## Paper references

- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, p. 568 and n. 53. Independence of the fundamental and its derivation from Logical Necessity; this record shows that only the witnessed half of Logical Necessity is used.
