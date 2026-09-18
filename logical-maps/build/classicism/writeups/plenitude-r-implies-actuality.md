# Plenitude ⇒ Actuality

<p class='cert'>Result — Source: Classicism (2023 draft); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Premises

- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.

## Conclusion

- **Actuality.** There is a true proposition that entails every true proposition.

## Proof

Use the functional relation taking each true proposition to itself and each false proposition to $\top$: $(p\land p=q)\lor(\neg p\land q=\top)$. Plenitude supplies Z with those values. The proposition $\forall p\, .\,Zp$ is true and entails Zp for every p, hence entails every true p. It witnesses Actuality.

## Notes

The displayed relation in the PDF’s prose on p. 33 has p=top in its second disjunct. The surrounding definition and subsequent proof require q=top. This transcription explicitly follows that intended truth-to-itself/falsehood-to-top construction.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Proposition 2.15, pp. 32–33.

<p class='cert'>Record: <code>topics/classicism/results/plenitude-r-implies-actuality.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — Proposition 2.15, pp. 32–33
