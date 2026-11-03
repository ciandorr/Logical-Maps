# Rigid Comprehension ∧ BF (type t) ⇒ □BF (type t)

<p class='cert'>Result — Source: Classicism (2024), Lean `Classicism.Map.rigid_comprehension_and_bf_t_imply_necessary_bf_t`; produced by Andrew Bacon and Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), 16 October 2026, at Cian Dorr's direction.</p>

## Premises

- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **□BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.

## Proof

The proof of rigid-comprehension-and-bf-imply-necessary-bf at type $t$. By Rigid Comprehension at type $t\to t$, choose a rigid property $F$ of propositions coextensive with $\lambda p\, .\,p=p$. Persistence gives $\forall p\, .\,\Box Fp$, and BF (type t) gives $\Box\forall p\, .\,Fp$. The inextensibility of $F$ supplies boxed BF (type t) with its quantifiers restricted to $F$, and inside the box everything is $F$, so the restrictions can be removed. This is the boxed closed instance of BF (type t).

## Notes

The type-$t$ counterpart of rigid-comprehension-and-bf-imply-necessary-bf, which the engine cannot instantiate on its own.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Proposition 2.12, p. 30 and n. 43.

<p class='cert'>Record: <code>topics/classicism/results/rigid-comprehension-and-bf-t-imply-necessary-bf-t.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Proposition 2.12, p. 30 and n. 43. The source's argument at one type; at type $t$ it uses BF only at $t$ and Rigid Comprehension only at $t\to t$.
