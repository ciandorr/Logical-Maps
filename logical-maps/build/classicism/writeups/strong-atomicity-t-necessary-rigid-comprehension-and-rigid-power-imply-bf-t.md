# Strong Atomicity (type t) ∧ □Rigid Comprehension ∧ Rigid Power ⇒ BF (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_t_necessary_rigid_comprehension_and_rigid_power_imply_bf_t`; produced by Cian Dorr, 11 October 2026; steps (i) and (ii) made precise by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 11 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.

## Conclusion

- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Proof

Let $A$ be rigid and coextensive with being an atom, by Rigid Comprehension at $t\to t$. (a) $\Box\exists w\,.\,Aw\land w$: each atom $a$ has $\Box Aa$, so entails $\exists w\,.\,Aw\land w$, and Strong Atomicity (type t) gives Atomicity (type t), whose dual makes a proposition entailed by every atom necessary. (b) $\Box\forall w\,.\,Aw\to\forall q\,.\,w\le q\lor w\le\neg q$: Strong Atomicity puts a strong atom below each atom, which by atomicity is the atom itself, so each actual instance of $A$ necessarily decides every proposition, and weak inextensibility of $A$ boxes the claim.
(ii) At every world $v$, each proposition $p$ is $\exists w\,.\,R_pw\land w$ for a rigid $R_p\le A$: by Rigid Comprehension at $v$ (the premise is boxed) let $R_p$ be rigid and coextensive with $\lambda a\,.\,Aa\land a\le p$; $R_p\le A$ by its weak inextensibility. Necessarily, from $v$, $R_pw\land w$ gives $p$, by weak inextensibility of $R_p$ applied to $\lambda w\,.\,w\le p$. Conversely apply weak inextensibility of $A$ at $v$ to $Z:=\lambda w\,.\,w\to w\le p\to R_pw$: for a $v$-instance $a$ of $A$, either $a\le p$, so $R_pa$ and $\Box R_pa$, or $a\le\neg p$ by (b), and then necessarily $a$ and $a\le p$ are not both true; so $\Box Za$. At a later world where $p$ is true, (a) gives a true $A$-instance $w$, which by (b) entails $p$, so $R_pw$ by $Z$. So $p$ and $\exists w\,.\,R_pw\land w$ are necessarily equivalent from $v$, hence identical.
(iii) Rigid Power makes the power property $P_A:=\lambda R\,.\,\operatorname{Rigid}(R)\land R\le A$ rigid. Suppose $\forall p\,.\,\Box Xp$. Then $\Box X(\exists w\,.\,Rw\land w)$ for every $R$ with $P_AR$, so weak inextensibility of $P_A$ gives $\Box\forall R\,.\,P_AR\to X(\exists w\,.\,Rw\land w)$; with (ii) under the box, $\Box\forall p\,.\,Xp$. This is BF (type t).

## Notes

Cian Dorr's salvage of Bacon's Theorem 8.2 (now conjectured). Strong Atomicity is used only at type $t$ and at the evaluation point, Rigid Comprehension at $t\to t$ at every world, and Rigid Power at $t\to t$. With the Tame Rigidity that Rigid Comprehension gives and the recorded TR + BF (relational types) ⇒ □BF (relational types), the map derives □BF (type t). So a model of □Strong Atomicity and Rigid Comprehension refuting BF (type t) must fail □Rigid Comprehension or Rigid Power at $t\to t$. The relational form is strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026, after the gap in Bacon's Theorem 8.2.

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-necessary-rigid-comprehension-and-rigid-power-imply-bf-t.yaml</code></p>

## Paper references

- **Related: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Theorem 8.2, pp. 169–170. A salvage of the theorem's idea, with □Rigid Comprehension and Rigid Power.
