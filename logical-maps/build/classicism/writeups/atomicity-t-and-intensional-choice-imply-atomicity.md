# Atomicity (type t) ∧ Intensional Choice ⇒ Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.atomicity_t_and_intensional_choice_imply_atomicity`; produced by Cian Dorr, 30 October 2026; written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.

## Proof

Let $X^{\bar\sigma t}\ne\bot$, so that $\Diamond\exists\bar x\, .\,X\bar x$ by Intensionality. Atomicity (type t) gives an atom $w\le\exists\bar x\, .\,X\bar x$. Intensional Choice (polyadic form), applied to $\lambda\bar x\, .\,w\to X\bar x$, which is necessarily instantiated, gives a necessarily uniquely instantiated $G$ with $A_w:=\lambda\bar x\, .\,w\land G\bar x\le X$. By [[unique-instance-copies]], $A_w$ is an atom because $w$ is one.

## Notes

The Intensional Choice counterpart of [[atomicity-t-and-bf-imply-atomicity]]: there BF supplies an instance $\bar x$ of $X$ and the atom is $\lambda\bar y\, .\,w\land\bar y=\bar x$; here Intensional Choice supplies an instance that may vary from world to world.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/atomicity-t-and-intensional-choice-imply-atomicity.yaml</code></p>
