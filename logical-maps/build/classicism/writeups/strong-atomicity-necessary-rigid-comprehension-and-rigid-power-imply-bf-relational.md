# Strong Atomicity ∧ □Rigid Comprehension ∧ Rigid Power ⇒ BF (relational types)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational`; produced by Cian Dorr, 11 October 2026; steps (i) and (ii) made precise by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 11 October 2026.</p>

## Premises

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.

## Conclusion

- **BF (relational types).** The Barcan Formula at every relational type, that is, at every type other than e.

## Proof

Fix a relational type $\sigma=\bar\sigma\to t$, write $W\bar x$ for application to a tuple, and let $J(R):=\lambda\bar x\,.\,\exists W\,.\,RW\land W\bar x$, the join of the members of $R$. This is the argument of strong-atomicity-t-necessary-rigid-comprehension-and-rigid-power-imply-bf-t with atoms of type $\sigma$ for atoms, "$W\bar x$" for "$w$ is true", and $J(R)$ for $\exists w\,.\,Rw\land w$.
Let $A$ be rigid and coextensive with being an atom of type $\sigma$. (a) $\Box\forall\bar x\,\exists W\,.\,AW\land W\bar x$: $J(A)$ is entailed by every atom, so by the dual of Atomicity at $\sigma$ (which Strong Atomicity at $\sigma$ gives) it is necessarily universal. (b) Necessarily every $A$-instance decides every entity of type $\sigma$, since the actual atoms are strong atoms by Strong Atomicity.
(ii) At every world $v$, each $Y$ of type $\sigma$ is $J(R_Y)$ for a rigid $R_Y\le A$ coextensive at $v$ with $\lambda W\,.\,AW\land W\le Y$, by Rigid Comprehension at $v$: $J(R_Y)\le Y$ by weak inextensibility of $R_Y$, and $Y\le J(R_Y)$ by weak inextensibility of $A$ at $v$ applied to $\lambda W\,.\,(\exists\bar x\,.\,W\bar x)\to W\le Y\to R_YW$, with (a) and (b) at later worlds; antisymmetry gives identity.
(iii) Rigid Power makes $\lambda R\,.\,\operatorname{Rigid}(R)\land R\le A$ rigid; if $\forall Y\,.\,\Box XY$, its weak inextensibility gives $\Box\forall R\,.\,(\operatorname{Rigid}(R)\land R\le A)\to X(J(R))$, and with (ii) under the box, $\Box\forall Y\,.\,XY$. This is BF at $\sigma$.

## Notes

Cian Dorr's salvage of Bacon's Theorem 8.2, at every relational type. Strong Atomicity is used at $\sigma$ and at the evaluation point only, Rigid Comprehension at $\sigma\to t$ at every world, and Rigid Power at $\sigma\to t$. So a model of □Strong Atomicity and Rigid Comprehension refuting BF at a relational type $\sigma$ (a countermodel to Bacon's theorem) must fail □Rigid Comprehension or Rigid Power at $\sigma\to t$.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026, after the gap in Bacon's Theorem 8.2.

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational.yaml</code></p>

## Paper references

- **Related: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Theorem 8.2, pp. 169–170. A salvage of the theorem's idea, with □Rigid Comprehension and Rigid Power.
