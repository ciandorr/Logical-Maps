# Witnessed Possibility ∧ ND ⇒ False (⊥)

<p class='cert'>Result — Source: Logical Combinatorialism; produced by Andrew Bacon; adapted to Witnessed Possibility and the map's signature by Claude Fable 5.1 (Anthropic), 19 September 2026, at the suggestion of Cian Dorr; recorded by Claude Fable 5.1 (Anthropic), 19 September 2026.</p>

## Premises

- **Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **ND.** Distinct things of any type are necessarily distinct.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let $c$ be a nonlogical constant of $\Sigma$ of some relational type $\tau$; the signature assumption in Background supplies one. The pure formulas $x=\top_\tau$ and $x\ne\top_\tau$, with only $x^\tau$ free, have C-provable existential closures, witnessed by $\top_\tau$ and $\bot_\tau$ respectively. Witnessed Possibility therefore gives $\Diamond(c=\top_\tau)$ and $\Diamond(c\ne\top_\tau)$. If $c=\top_\tau$, then by Leibniz's law $(c\ne\top_\tau)=(\top_\tau\ne\top_\tau)=\bot$, contradicting $\Diamond(c\ne\top_\tau)$. If $c\ne\top_\tau$, then ND at type $\tau$ gives $\Box(c\ne\top_\tau)$, i.e. $(c\ne\top_\tau)=\top$, so $(c=\top_\tau)=\bot$, contradicting $\Diamond(c=\top_\tau)$.

## Notes

The argument follows Bacon's, with two changes. Witnessed Possibility replaces the biconditional Logical Necessity, since only the possibility direction is used. The top element $\top_\tau$ replaces Bacon's second fundamental constant, because the map's signature assumes only one constant of some type $\tau\ne e$ and does not assume that distinct constants denote distinct entities (compare Bacon's n. 29, which uses $\lambda x\, .\,\top$ and $\lambda x\, .\,\bot$). ND is used only at the type $\tau$ of the chosen constant.

## Sources

- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), pp. 554–555, nn. 29–30.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.5, n. 57, p. 38; §2.6, p. 41.

<p class='cert'>Record: <code>topics/classicism/results/witnessed-possibility-incompatible-with-nd.yaml</code></p>

## Paper references

- **Proof: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — pp. 554–555, nn. 29–30. Bacon derives from Logical Necessity that distinct fundamental entities are possibly identical (his (4)), so that distinctness is contingent and the Brouwerian axiom, and with it ND (Prior), fail.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, n. 57, p. 38; §2.6, p. 41. Note 57 identifies Witnessed Possibility with one direction of Logical Necessity and observes that it follows from Maximalist Classicism, which p. 41 shows to be inconsistent with ND.
