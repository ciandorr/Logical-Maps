# □Rigid Comprehension ⇒ Arithmetic Necessitism

<p class='cert'>Result — Source: Continuum Contingency (draft), Lean `Classicism.Map.necessary_rigid_comprehension_implies_arithmetic_necessitism`; produced by Zachary Goodsell (Theorem 3 of Barton and Goodsell's Continuum Contingency, attributed there to Goodsell 2021); transposed to the map's numbers at every type by Claude Fable 5.1 (Anthropic), 23 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 23 October 2026.</p>

## Premises

- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.

## Conclusion

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.

## Proof

Assume $\Box$Rigid Comprehension and $\Box I^*_\sigma$. Persistence of $\mathbb N_\sigma$ is a theorem of C: numbers are necessarily numbers, by induction with the property $\lambda n\, .\,\Box\mathbb N_\sigma n$, which holds of $\mathbf 0_\sigma$ and passes to successors by K (the step arith_N_box of the Lean proof of c5-implies-necessity-of-arithmetic), necessitated. Necessary distinctness: distinct numbers $m\ne n$ are comparable, say $\operatorname{Sum}_\sigma(m,k,n)$ with $k\ne\mathbf 0_\sigma$, by the trichotomy of the order on numbers, which induction gives; sums of numbers are necessary when true (arith_Sum_box), $k$ is necessarily a nonzero number, and at every world $I^*_\sigma$ makes $\operatorname{Sum}_\sigma(m,k,n)$ with $k\ne\mathbf 0_\sigma$ imply $m\ne n$, by induction on $k$ from the injectivity of successor; so $\Box\,m\ne n$. Inextensibility, at any world: Rigid Comprehension there gives a rigid $Z$ coextensive with $\mathbb N_\sigma$; $Z$ holds of $\mathbf 0_\sigma$ and is closed under $\operatorname{Suc}_\sigma$, and, $Z$ being rigid and $\mathbf 0_\sigma$ and the successors of its instances the same entities at every world, it is necessarily so; hence necessarily $\mathbb N_\sigma\le Z$, the numbers being the instances of every inductive property, while $Z\le\mathbb N_\sigma$ necessarily by persistence of its instances, which are numbers. So $\mathbb N_\sigma$ is necessarily coextensive with a rigid property, and inherits its inextensibility: for any $X$ with $\forall n\in\mathbb N_\sigma\, .\,\Box Xn$, inextensibility of $Z$ gives $Z\le X$ and so $\mathbb N_\sigma\le X$. This is the argument of Theorem 3 of Barton and Goodsell, run at every type.

## Notes

Rigid Comprehension is used at every world, for the rigid coextension of $\mathbb N_\sigma$ there, so the premise is its necessitation; the antecedent $\Box I^*_\sigma$ of the principle is their axiom of Infinity. Without Rigid Comprehension the conclusion holds in C5 ([[c5-implies-arithmetic-necessitism]]).

## Revisions

- **2026-10-24** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — (minor) Notes updated: C5 gives Arithmetic Necessitism ([[c5-implies-arithmetic-necessitism]]).

## Sources

- **Continuum Contingency** — Neil Barton and Zachary Goodsell, Continuum Contingency, draft of 14 October 2026, §5.8, Theorem 3, in CR∞, C with □Rigid Comprehension and the axiom of Infinity (eq. (22)); the paper attributes the result to Goodsell 2021.
- **Arithmetic is Necessary** — Zachary Goodsell, Arithmetic is Necessary, draft of 5 June 2024, for the numbers as finite cardinalities and the properties of successor used.

<p class='cert'>Record: <code>topics/classicism/results/necessary-rigid-comprehension-implies-arithmetic-necessitism.yaml</code></p>

## Paper references

- **Proof: Continuum Contingency.** Barton, Neil, and Zachary Goodsell. Continuum Contingency. Draft dated 14 October 2026, 47 pages. Stitches a ground model of set theory to the canonical model of a forcing extension to show that Classicism with □Rigid Comprehension, □Relational Choice and an axiom of infinity is consistent with first- and second-order continuum contingency, together with □Atomicity at type t (Theorem 21) or with Recombination (Theorem 22, which refutes Atomicity at type t, Corollary 23); formalizes the coin-toss argument (Theorem 9). Read directly on 19 October 2026; locators refer to this draft. — §5.8, Theorem 3. Stated for the naturals as the Fregean numerical relations on properties of individuals, with Infinity as an axiom of the logic; the map's numbers at $\sigma=e$ are those cardinalities, and the axiom is the principle's antecedent $\Box I^*_\sigma$. The map's rigidity convention is theirs.
- **Background: Arithmetic is Necessary.** Goodsell, Zachary William Lee. Arithmetic is Necessary. Draft dated 5 June 2024, 28 pages. Derives the necessity of arithmetic in the logic HKC (H plus K plus Countable Boolean Completeness) and shows that Boolean Completeness is inconsistent with the maximalization of any recursively enumerable extension of HK consistent with I, answering the question of Classicism, §2.6. Locators refer to this draft.
