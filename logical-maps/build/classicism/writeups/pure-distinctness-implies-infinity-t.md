# Distinctness (pure) ⇒ Infinity Schema (type t)

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 19 September 2026; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Distinctness (pure).** Every closed pure identity not provable in C is false. The non-theorem condition is metalinguistic.

## Conclusion

- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.

## Proof

For $k\ge1$ let $E_k$ be the closed pure sentence saying that there are exactly $k$ individuals, $\exists x_1^e\cdots x_k^e\, .\,(\bigwedge_{i<j}x_i\ne x_j)\land\forall y^e\, .\,\bigvee_i y=x_i$. Fix $n$ and take $E_1,\ldots,E_n$. For $i\ne j$ the identity $E_i=E_j$ is closed and pure, and C does not prove it. A full Henkin model whose individual domain has exactly $i$ members is a model of C in which $E_i$ is true and $E_j$ is false, and at type $t$ that model's propositions are its two truth values, so the two sentences denote different things there. Distinctness therefore gives $E_i\ne E_j$. So $E_1,\ldots,E_n$ are $n$ pairwise distinct propositions, which is the $n$-th instance of Infinity at type $t$.

## Notes

Recorded from Distinctness because the proof uses its non-theoremhood side condition directly. The equivalent Possibility form gives the same result through the recorded equivalence. The witnesses need not be possible propositions, and at most one of them is true. What Distinctness supplies is that C proves no identity among them. Only the type-$t$ instance follows, since the witnesses are propositions about how many individuals there are, not individuals.

The argument does not lift to the Axiom of Infinity at type $t$, and it is worth recording how far it does reach. For each fixed $k$ it refutes the claim that there are exactly $k$ propositions. If there were, then among the $k+1$ sentences $E_1,\ldots,E_{k+1}$ two would have to coincide, so C proves the finite disjunction of those identities, and Distinctness refutes every disjunct. That is the schema over again, one sentence at a time. The axiom asks for the same of every cardinality falling under $\operatorname{FiniteCardinality}$, including ones that no closed term names, and Distinctness bears only on identities between closed pure terms, so it says nothing about the domain over which $\operatorname{FiniteCardinality}$ quantifies. Any one derivation uses finitely many of its instances, and those are satisfiable while the universal property still carries a cardinality that the induction clause admits. The route through Atomlessness is closed too, since the map carries a model of the signature Distinctness schema that satisfies Actuality, and Actuality excludes Atomlessness.

Added 20 September 2026: a different argument does reach the axiom. Applying the consistency side condition once, to the single sentence that every finite cardinality has a possibly instantiated successor, gives that sentence outright by persistence, and from it the Axiom of Infinity at type $t$ follows in C; see pure-possibility-implies-axiom-of-infinity-t. The limits described above concern the numeral-by-numeral argument recorded here.

## Revisions

- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Noted that the schema-only limitation is a limitation of this argument, not of Maximalist Classicism: the new record pure-possibility-implies-axiom-of-infinity-t reaches the Axiom of Infinity at type t.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.4, pp. 35–37 (Distinctness); §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48 (full Henkin models); §2.3, n. 47, p. 32 (Infinity).

<p class='cert'>Record: <code>topics/classicism/results/pure-distinctness-implies-infinity-t.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.4, pp. 35–37; §3.2, pp. 47–48; §2.3, n. 47, p. 32. Formulations of Distinctness and Infinity, and the full Henkin models that supply the non-theoremhood side condition. The draft does not draw the connection between them.
