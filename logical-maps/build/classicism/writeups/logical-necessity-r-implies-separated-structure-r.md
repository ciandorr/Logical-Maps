# Logical Necessity ⇒ Separated Structure

<p class='cert'>Result — Source: Logical Combinatorialism; produced by Andrew Bacon; the schematic derivation was written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Logical Necessity.** The Logical Necessity schema: necessity at distinct matching constants is equivalent to universal truth of the pure-formula. Preserve the side conditions of Witnessed Possibility.

## Conclusion

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.

## Proof

Let $c$ be a constant of type $\sigma$ and $F,G$ closed terms of type $\sigma\tau$ not containing $c$, with $Fc=Gc$. Enumerate the constants occurring in $F$ or $G$ as $\bar d$, all distinct from $c$, and abstract them: $F=F^\circ\bar d$, $G=G^\circ\bar d$ with $F^\circ,G^\circ$ closed and pure, by $\beta$. Let $P:=F^\circ\bar y\,x=G^\circ\bar y\,x$, pure with free variables $\bar y,x$. NI gives $\Box P[\bar d,c/\bar y,x]$, so Logical Necessity, left to right, gives $\forall\bar y x\, .\,P$. This closed pure truth is necessary by the empty-tuple instance of Logical Necessity, so $\Box\forall\bar y x\, .\,F^\circ\bar y x=G^\circ\bar y x$. CBF gives $\forall\bar y\, .\,\Box\forall x\, .\,F^\circ\bar yx=G^\circ\bar yx$ and Modalized Functionality, a theorem of C, gives $\forall\bar y\, .\,F^\circ\bar y=G^\circ\bar y$. Instantiating $\bar y:=\bar d$ yields $F=G$.

## Notes

Bacon derives the quantified form from Quantified Logical Necessity and Modalized Functionality and says the schematic form follows in the same way. Both directions of Logical Necessity are used: the witnessed direction to pass from the necessary identity at the constants to the universal claim, and No Pure Contingency to necessitate that claim before applying Modalized Functionality.

## Sources

- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §4, pp. 561–562.

<p class='cert'>Record: <code>topics/classicism/results/logical-necessity-r-implies-separated-structure-r.yaml</code></p>

## Paper references

- **Proof: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, pp. 561–562
