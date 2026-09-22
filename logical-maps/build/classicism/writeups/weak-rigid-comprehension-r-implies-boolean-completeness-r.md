# Weak Rigid Comprehension ⇒ Boolean Completeness

<p class='cert'>Result — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a weakly rigid one, that is, with one that is persistent and weakly inextensible.

## Conclusion

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.

## Proof

Take the propositional case first. Given $F^{tt}$, let $C^{tt}$ be weakly rigid and coextensive with $F$, and put $q:=\exists p\, .\,Cp\land p$. Every $F$ proposition $p$ is $C$, hence necessarily $C$ by persistence, so $p$ entails $Cp\land p$ and thereby $q$; so $q$ is an upper bound of the $F$ propositions. Now suppose every $F$ proposition entails $r$. The $C$ propositions are the $F$ propositions, so every $C$ proposition entails $r$; entailments are necessary if true, so $\forall p\, .\,Cp\to\Box(p\le r)$. Weak inextensibility with $X:=\lambda p\, .\,(p\le r)$ gives $C\le X$, so at every world $Cp$ implies $p\le r$; hence $Cp\land p$ entails $r$ whatever $p$ may be, and $q\le r$. So $q$ is a least upper bound of the $F$ propositions. The same reasoning with extra parameters gives the least-upper-bound form at every relational type, and that form is equivalent in C to the greatest-lower-bound form in which the principle is stated.

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, footnote on p. 12.

<p class='cert'>Record: <code>topics/classicism/results/weak-rigid-comprehension-r-implies-boolean-completeness-r.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — footnote on p. 12
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–24. Boolean Completeness and the equivalence of its two forms.
