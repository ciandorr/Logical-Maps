# Symmetric ideally-full model: permutations and collapsers of a fixed pair (Base 2)

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Package

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Actuality.** There is a true proposition that entails every true proposition.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **¬ Atomicity (type t).** Atomicity (type t) in the displayed closed propositional formulation.
- **¬ ND.** Distinct things of any type are necessarily distinct.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility (signature Σ) stands to Possibility (pure).
- **¬ B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.

## Construction

A symmetric ideally-full intensional action model over one object, the set of natural numbers. Its symmetry group is the permutations that preserve a fixed pair of individuals setwise, and its arrows are those permutations together with all the surjections that collapse the two members of that pair. Every arrow is therefore invertible or a collapser, and which it is can be read off from its behaviour on that pair. The evaluation point is the identity arrow.

Actuality holds because the symmetry group is the smallest symmetric set of arrows containing the identity, and here membership in it is detected by the fixed pair, so the group is a finitely pinned proposition and is an atom entailing every truth. Boolean Completeness holds by the draft's main theorem with the fixed pair as the distinguished set; splicing fails at that pair, but the pair is exactly what certifies invertibility, and the separated arrows are handled by symmetry instead. BF holds at every type by the surjectivity of the arrows. One object again gives No Pure Contingency and promotes each of these to its boxed form.

Rigid Comprehension holds at every relational type. Given a relation with extension S pinned down by a finite set, take the least upper bound of the union of the haecceities of the members of S, computed with the fixed pair adjoined to the pinning set. Persistence is immediate, and the extension is exactly S because an arrow agreeing with the identity on a set containing the fixed pair is invertible. The rigidity criterion is then checked separately at invertible worlds, where leastness delivers it, and at collapsing worlds, where surjectivity supplies the preimages that persistence demands. Atomicity nonetheless fails, with the proposition that the two members of the fixed pair are identical as a nonzero proposition having no atom below it.

## Notes

This model is not a second witness to the draft's main result but a counterweight to it. Rigid Comprehension holds, so the failure of Actuality in the all-surjections model is no accident. Because Atomicity fails here, the model settles a question left open in Classicism: Rigid Comprehension does not imply Atomicity. The boxed forms of Actuality and Rigid Comprehension use the draft's one-object observation, which it states for Boolean Completeness and applies in the same way in its final section. ND fails at type e because the proposition that the two members of the fixed pair are identical is true at exactly the non-invertible arrows and so is nonzero; the draft displays that proposition without drawing the consequence for ND. The source is a work in progress. Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition described above; every other relational constant denotes the top element of its type and every individual constant one fixed individual. Under it: No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; B for sentences of Σ fails, since under any arrow that no arrow composes back into $a$, $\Diamond a$ is false, so $\Box\Diamond a$ fails; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no arrow; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness (signature Σ) fail through the other relational constants, Σ being assumed to contain at least one: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas $a$ is fixed by no arrow but the identity, so no closed pure term denotes $\lambda\bar x\, .\,a$. Everything that implies these fails with them. Distinctness-preserving collapse holds: let $a$ be the set of arrows that are permutations, a symmetric proposition true at the identity and, as the record’s Actuality witness, entailed by no other truth. For a true $p$, $a\le p$. Take $q:=a$: under a permutation $i$, $p$ holds since $i\in a\subseteq p$; under a non-permutation $i$, $\Diamond a$ would need $k\circ i$ to be a permutation, which no composite with a non-bijective arrow is. So every truth is $\Box_{\ne}$-necessary.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Recorded the Distinctness-preserving collapse; see the notes. Now satisfies: Distinctness-preserving collapse.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now violates: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Corrected the reason given for the failures of Independence (signature Σ) and Distinctness (signature Σ): the true atom is denoted by no closed pure term, since such terms denote entities fixed by every arrow; the failures come from the other relational constants, which denote top. No verdict changes.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §3.1, p. 9 (base); Lemma 21, p. 10; Proposition 22, p. 11; Proposition 24, p. 13; Corollary 37 and Remark 38, p. 19.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-collapse-pair.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §3.1, p. 9; Lemma 21, p. 10; Proposition 22, p. 11; Proposition 24, p. 13; Corollary 37 and Remark 38, p. 19
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–26; Appendix D, pp. 73–79. The open question whether Rigid Comprehension implies Atomicity, and the ideally-full models of which this is the symmetric variant.
