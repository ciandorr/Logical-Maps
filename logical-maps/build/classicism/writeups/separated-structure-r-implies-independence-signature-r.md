# Separated Structure ⇒ Independence (signature Σ)

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.

## Conclusion

- **Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.

## Proof

Let $c$ be a constant of relational type $\tau$, $\bar d$ distinct constants other than $c$, and $A$ closed and pure, and suppose $c=A\bar d$. By $\beta$, $(\lambda\bar y x\, .\,x)\bar d c=(\lambda\bar y x\, .\,A\bar y)\bar d c$. The two abstracts are closed and pure, so they contain neither $c$ nor $\bar d$. Peeling off $c$ and then each $d_i$ with Separated Structure, as in the proof of General Separated Structure, gives $\lambda\bar yx\, .\,x=\lambda\bar yx\, .\,A\bar y$. Applying both sides to $\bar d$ and then to $\top_\tau$ and to $\bot_\tau$ gives $\top_\tau=A\bar d=\bot_\tau$, contradicting $\top_\tau\ne\bot_\tau$ in C.

## Notes

The n = 0 case, that no constant denotes a pure entity, is the first step of the recorded incompatibility of Separated Structure with ND.

## Sources

- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §4, p. 568 and n. 53.

<p class='cert'>Record: <code>topics/classicism/results/separated-structure-r-implies-independence-signature-r.yaml</code></p>

## Paper references

- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, p. 568 and n. 53. Fundamental Independence and its derivation from Logical Necessity; this record derives the constant-indexed form from Separated Structure instead.
