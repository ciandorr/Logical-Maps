# Gallin Extensional Comprehension ⇒ Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.gallin_comprehension_implies_strong_actuality`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 9 October 2026, on Cian Dorr's hunch that the recorded verdicts of full-two-object-double-retraction settle Gallin Extensional Comprehension through a missing result; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 9 October 2026.</p>

## Premises

- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.

## Conclusion

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

Gallin Extensional Comprehension at type $t\to t$ gives $Y$ coextensive with $\lambda q\, .\,q$ such that $Y$ and $\neg Y$ are both persistent. Put $p:=\forall q\, .\,Yq\leftrightarrow q$, which is true. Necessarily, every $q$ is settled by $p$: if $Yq$, persistence of $Y$ gives $\Box Yq$, so $\Box(p\to q)$, that is $p\le q$; if $\neg Yq$, persistence of $\neg Y$ gives $\Box\neg Yq$, so $p\le\neg q$. Both persistence conditions are boxed, so this holds at every world, giving $\Box\forall q\, .\,p\le q\lor p\le\neg q$. So $p$ is a true strong atom.

## Notes

Only the type-$t\to t$ instance is used. With separated-retractions-strong-actuality this refutes Gallin Extensional Comprehension in every model with separated retractions, such as full-two-object-double-retraction, which has ND and □Rigid Comprehension; so neither ND with Weak Rigid Comprehension nor ND with □Rigid Comprehension gives it.

## Sources

- **Dorr 9 Oct** — Cian Dorr, question of 9 October 2026; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/gallin-comprehension-implies-strong-actuality.yaml</code></p>
