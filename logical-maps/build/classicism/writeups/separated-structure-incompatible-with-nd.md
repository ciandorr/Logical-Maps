# Separated Structure ∧ ND ⇒ False (⊥)

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 19 September 2026, at the suggestion of Cian Dorr; recorded by Claude Fable 5.1 (Anthropic), 19 September 2026.</p>

## Premises

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **ND.** Distinct things of any type are necessarily distinct.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let $c$ be a nonlogical constant of $\Sigma$ of some relational type $\tau$; the signature assumption in Background supplies one. Write $\top_\tau$ and $\bot_\tau$ for the top and bottom elements of type $\tau$. The pure closed terms $F:=\lambda x^\tau\, .\,x$ and $G:=\lambda x^\tau\, .\,\top_\tau$ of type $\tau\tau$ do not contain $c$, and $F\ne G$ in C (apply both to $\bot_\tau$), so Separated Structure gives $Fc\ne Gc$, i.e. $c\ne\top_\tau$. ND at type $\tau$ then gives $\Box(c\ne\top_\tau)$, which by the definition of $\Box$ is the identity $(c\ne\top_\tau)=\top$. Now take $F':=\lambda x^\tau\, .\,(x\ne\top_\tau)$ and $G':=\lambda x^\tau\, .\,\top$ of type $\tau t$, again pure, closed and free of $c$. By $\beta$, $F'c=(c\ne\top_\tau)=\top=G'c$, so Separated Structure gives $F'=G'$. Applying both sides to $\top_\tau$ yields $(\top_\tau\ne\top_\tau)=\top$; since $(\top_\tau\ne\top_\tau)=\bot$ in C, this is $\bot=\top$, a contradiction. The types $\tau\tau$ and $\tau t$ are admitted because $\tau\ne e$.

## Notes

The argument uses one nonlogical constant of some type $\tau\ne e$, pure terms of types $\tau\tau$ and $\tau t$, and ND only at type $\tau$. It needs exactly the signature assumption recorded in Background; a signature containing only individual constants would supply no closed pure term of type $e$ to play the role of $\top_\tau$.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.5, pp. 38–39; §2.6, p. 41.
- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §4, pp. 560–563.

<p class='cert'>Record: <code>topics/classicism/results/separated-structure-incompatible-with-nd.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, pp. 38–39; §2.6, p. 41. The draft shows that Maximalist Classicism in a signature is equivalent to Pure Maximalist Classicism plus Separated Structure (p. 39) and that Maximalist Classicism is inconsistent with ND (p. 41). This record localises that inconsistency to Separated Structure alone, by a different argument.
- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. — §4, pp. 560–563. Origin of Separated Structure, where it is derived from Logical Necessity; pp. 554–555 with nn. 29–30 note that Logical Necessity makes distinctness contingent.
