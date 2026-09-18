# Extensionality ⇒ Plenitude

<p class='cert'>Result — Source: Classicism (2023 draft); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Premises

- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.

## Conclusion

- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.

## Proof

For a functional relation U with output type $\tau=\bar\sigma t$, take $X=\lambda x\bar y\, .\,\exists Z^\tau\, .\,(Ux)Z\land Z[\bar y]$. At each x, uniqueness of the U-output makes Xx coextensive with that output, and Extensionality identifies them. The formula therefore represents U.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.3, p. 31 and n. 45.

<p class='cert'>Record: <code>topics/classicism/results/extensionality-r-implies-plenitude-r.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — §2.3, p. 31 and n. 45
