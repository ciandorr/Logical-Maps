# □Strong Atomicity (type t) ∧ □BF ⇒ □Strong Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity`; produced by Cian Dorr, question of 23 September 2026; proof written out by Claude Fable 5.1 (Anthropic); recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 23 September 2026.</p>

## Premises

- **□Strong Atomicity (type t).** Necessarily, every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **□Strong Atomicity.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation.

## Proof

First the unboxed statement, for a relational type $\tau=\bar\sigma t$. Let $X^\tau\ne\bot$. Intensionality’s contrapositive gives $\Diamond\exists\bar y\, .\,X\bar y$, and BF at the argument types gives $\bar x$ with $\Diamond X\bar x$. The type-t Strong Atomicity gives a strong atom $w\le X\bar x$: $w\ne\bot$ and $\Box\forall q\, .\,(w\le q\lor w\le\neg q)$. Put $W:=\lambda\bar y\, .\,w\land\bar y=\bar x$. Then $W\ne\bot$, since $W\bar x=w$, and $W\le X$, since $\Box(w\to X\bar x)$ and Leibniz’s law give $\Box\forall\bar y\, .\,W\bar y\to X\bar y$ by K. $W$ is a strong atom at $\tau$: under the box, for any $Y^\tau$, instantiate the strong-world clause of $w$ at $q:=Y\bar x$; if $w\le Y\bar x$ then $\Box\forall\bar y\, .\,W\bar y\to Y\bar y$, that is $W\le Y$, by the same K step, and if $w\le\neg Y\bar x$ then $W\le\neg Y$ likewise; so $\Box\forall Y\, .\,(W\le Y\lor W\le\neg Y)$, the passage under the outer box being by necessitation and K since each step is a theorem of C. For each $\tau$ this derives the closed instance $\mathrm{SAt}_\tau$ from $\mathrm{SAt}_t$ and finitely many BF instances in C; necessitating that conditional and applying K gives $\Box\mathrm{SAt}_\tau$ from $\Box\mathrm{SAt}_t$ and $\Box$BF.

## Notes

The unboxed form, Strong Atomicity (type t) + BF ⇒ Strong Atomicity, is already derivable on the map through Atomicity: Strong Atomicity (type t) gives Atomicity (t), Atomicity (t) + BF gives Atomicity, and Atomicity + BF gives Strong Atomicity. The direct construction above proves it in one step and is what is necessitated here; the boxed form was not derivable, since no record boxes the type-t instance of Atomicity. Only BF at the argument types of the target type is used, as in atomicity-t-and-bf-imply-atomicity.

## Sources

- **Dorr 23 Sep** — Cian Dorr, question of 23 September 2026, whether Strong Atomicity follows from their type-t instance given BF; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity.yaml</code></p>

## Paper references

- **Background: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — Chapter 8, pp. 155–182. Strong atoms and Strong Atomicity.
