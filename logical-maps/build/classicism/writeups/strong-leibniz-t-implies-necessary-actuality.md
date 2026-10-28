# Strong Leibniz Biconditionals (type t) ⇒ □Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_leibniz_t_implies_necessary_actuality`; produced by Cian Dorr, 26 September 2026; the omission was noticed by Branden Fitelson; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 26 September 2026.</p>

## Premises

- **Strong Leibniz Biconditionals (type t).** Every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.

## Proof

Write $A$ for Actuality, $\exists p\, .\,p\land\forall q\, .\,q\to p\le q$. Every strong world proposition entails $A$. For any $w$, $(\forall q\, .\,w\le q\lor w\le\neg q)\to(w\to A)$ is a theorem of H: given $w$ and a true $q$, $w\le\neg q$ would give $\neg q$ by T, so $w\le q$; thus $w$ is true and entails every truth, and is itself the witness for $A$. Necessitate the universal closure in $w$, distribute by CBF, and apply K to the second conjunct of $\operatorname{SWorld}_t(w)$, which is $\Box\forall q\, .\,w\le q\lor w\le\neg q$: this gives $\Box(w\to A)$, i.e. $w\le A$. Now suppose $\Diamond\neg A$. The Strong Leibniz Biconditionals at type $t$ supply a strong world $w$ with $w\le\neg A$. Together with $w\le A$ this gives $w\le A\land\neg A=\bot$, so $w=\bot$, contradicting $\Diamond w$. Hence $\neg\Diamond\neg A$, which is $\Box A$. Actuality has no type parameters, so $\Box A$ is its only closed instance.

## Notes

The map already had □Actuality from Atomicity and BF (Proposition 2.7) and from □Plenitude and □Rigid Comprehension. This record is stronger in one direction: only the type-$t$ instance of the Strong Leibniz Biconditionals is used, so with the recorded derivation of that instance from Atomicity (type $t$) and BF (type $t$), □Actuality now follows from those two type-$t$ principles without BF at other types. Every model in the map that satisfies the Strong Leibniz Biconditionals already satisfied □Actuality, so no recorded verdict changes.

Strengthened by [[self-atomicity-t-implies-necessary-actuality]]: Self-Atomicity (type t), which the Strong Leibniz Biconditionals (type t) imply, suffices.

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr, 26 Sep (Fitelson)** — Cian Dorr, argument given 26 September 2026, after Branden Fitelson pointed out at a conference that day that the map lacked this arrow.
- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, pp. 165–170 (strong worlds and the Strong Leibniz Biconditionals).

<p class='cert'>Record: <code>topics/classicism/results/strong-leibniz-t-implies-necessary-actuality.yaml</code></p>

## Paper references

- **Background: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, pp. 165–170. Strong worlds and the Strong Leibniz Biconditionals; the argument that a strong world entails Actuality is the observation that a strong world, wherever it holds, is the least truth there.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Proposition 2.7, p. 26. The recorded derivation of □Actuality from Atomicity and BF goes through the same step, that a world proposition entails Actuality, using Tractarianism to combine the case split; a strong world has the combined form built in.
