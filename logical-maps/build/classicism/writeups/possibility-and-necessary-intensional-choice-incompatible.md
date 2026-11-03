# Maximalism (pure) ∧ □Intensional Choice ⇒ ⊥

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.possibility_and_necessary_intensional_choice_incompatible`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 3 October 2026.</p>

## Premises

- **Maximalism (pure).** Every closed pure identity not provable in C is false. The non-theorem condition is metalinguistic.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Proof

The type-$e$ instance of Intensional Choice fails in symmetric-all-surjections, a model of C. Let $a$ be an individual and $F:=\lambda x\, .\,x\ne a$, which is necessarily instantiated since every world has infinitely many individuals. Suppose $G\le F$ is necessarily uniquely instantiated, pinned down by a finite $N\ni a$. Let $h$ be a surjection sending all of $N$ to one individual $p$; at $h$, $G$ has a single instance $y\neq p$, since $G\le F$ and $h(a)=p$. A permutation $\sigma$ fixing $p$ and moving $y$ gives an arrow $\sigma\circ h$ agreeing with $h$ on $N$, so by pinning $G$ has the same extension at both arrows, while by symmetry its extension at $\sigma\circ h$ is $\{\sigma(y)\}$. Contradiction. So the negation of that closed pure instance is consistent with C, Possibility Maximalism (pure) makes it possible, and □Intensional Choice says the instance is necessary.

## Notes

Instance of the pattern recorded for possibility-and-necessary-relational-choice-incompatible. The same argument refutes Intensional Choice in several other symmetric models; see the deferred verdicts in extraction.md.

## Revisions

- **2026-10-08** (Claude Opus 5.5 (Anthropic), at Cian Dorr's direction) — Distinctness Maximalism and Possibility Maximalism unified as Maximalism, with Distinctness the official form and Possibility a variant form; this record's premise changed from the Possibility principle to Maximalism. The proof is unchanged, the two forms being equivalent in C.

## Sources

- **Claude Opus 5.5 3 Oct** — Original argument of 3 October 2026, using the model symmetric-all-surjections.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.4, Theorem 3.23, p. 58 (soundness of action models).

<p class='cert'>Record: <code>topics/classicism/results/possibility-and-necessary-intensional-choice-incompatible.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author.. The symmetric ideally full action models.
