# Extensionality ⇒ Boolean Completeness

<p class='cert'>Result — Source: Classicism (2023 draft); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Premises

- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.

## Conclusion

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.

## Proof

For a property X of relations, put $U=\lambda\bar z\, .\,\forall Z\, .\,XZ\to Z[\bar z]$. When XV holds, the Fregean Axiom makes XV necessary and the displayed universal sentence entails $V[\bar z]$; Extensionality gives $U\le V$. Conversely, any lower bound Y pointwise entails the displayed defining condition for U, so Extensionality gives $Y\le U$. Thus U is a GLB.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.2, p. 24 and n. 29.

<p class='cert'>Record: <code>topics/classicism/results/extensionality-r-implies-boolean-completeness-r.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — §2.2, p. 24 and n. 29
