# Symmetric ideally-full model: finite-compression labels at an entrance [one individual]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Package

- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model on two objects. Partition a countably infinite set $N$ into infinitely many infinite blocks $B_i$, and let $Q$ be a set of labels: $q_i$ for each block, $q_D$ for each finite $D\subseteq N$, and $q_\top$, with fibres $R(q_i)=B_i$, $R(q_D)=D$, $R(q_\top)=N$. The root $A$ has base $N$, the tail $B$ has base $N\sqcup Q$. The arrows $A\to A$ are the surjections of $N$; the arrows $A\to B$ are the surjections of $N$ onto the $N$ summand; there are none from $B$ to $A$; and an arrow $B\to B$ is a pair $(f,g)$ of a surjection $f$ of $N$ and a map $g:Q\to Q$ fixing $q_\top$ with $f[R(q)]\subseteq R(g(q))$ for every label $q$. The symmetry group at $A$ is all permutations of $N$; at $B$ it is the permutations of $N$ permuting the blocks, acting on the labels accordingly. Both objects carry the ideal of finite sets. Evaluation point: $1_A$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: The pairs $\{2k,2k+1\}$ of $N$; for any two of them a surjection of $N$ collapses the one and is injective elsewhere. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Tame Rigidity and Rigid Power do not imply Weakly Rigid Power, answering the question of 10 October 2026 ([[tame-rigidity-and-rigid-power-imply-weakly-rigid-power]]) negatively. The source also characterizes Weakly Rigid Power as Tame Rigidity plus Rigid Power plus a bounded future-tameness condition, every future weakly rigid subrelation of an actual rigid bound being rigid; that characterization is not recorded. The Lean certificates of Tame Rigidity, Rigid Power and the failure of Weakly Rigid Power are Astra's (Classicism.Meta.Intensional.FiniteCompression), ported from the submission. The group's variant with one individual is generated; no argument above applies to it.

## Sources

- **Astra (Kodsi) 23 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Tame Rigidity and Rigid Power without Weakly Rigid Power, research note of 23 October 2026, §§2–9 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps, proofs/finite-compression.md).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Proposition 20.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-finite-compression-entrance.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. Symmetric ideally-full models, of which this is one.
