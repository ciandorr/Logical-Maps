# Full action model: two-object chain

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Strong Leibniz Biconditionals (type t).** Every closed instance of Strong Leibniz Biconditionals (type t) is necessary.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **Strong Leibniz Biconditionals.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.
- **□Strong Leibniz Biconditionals.** Every closed instance of the Strong Leibniz Biconditionals is necessary. Box the entire object-variable closure; retain the type range.
- **BF (type t).** BF (type t) in the displayed closed propositional formulation.
- **□BF (type t).** Every closed instance of BF (type t) is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness Maximalism (signature Σ).** The Distinctness Maximalism schema for the fixed nonlogical signature Sigma.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.

## Construction

Use two objects with one nonidentity arrow from W0 to W1, evaluated at W0. The source makes the Fregean Axiom false at W0 and true at W1.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. The type-t Strong Leibniz Biconditionals hold necessarily: at $W_0$ the singleton $\{k\}$ becomes $\{\mathrm{id}_{W_1}\}$ under $k$ and $\{\mathrm{id}_{W_0}\}$ becomes empty, so both singletons are strong worlds; at $W_1$ there is one arrow and one non-bottom proposition. □Relational Choice holds: the truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61). Distinctness-preserving collapse holds: let $a$ be the proposition true at the actual world alone (the identity arrow). For any true $p$, take $q:=a$ in the definition of $\Box_{\ne}p$: under a arrow $k$ to $W_1$, $\Diamond a$ would need an arrow back to $W_0$, and none exists, since no arrow leads back to the actual world; under the identity, $p$ holds. So every truth is $\Box_{\ne}$-necessary, although ND fails. The Strong Leibniz Biconditionals hold at every relational type, necessarily. An atom of type $\bar\sigma t$ at $W_0$ is a single pair $\{\langle\bar a,h\rangle\}$, and its transport along $k$ is $\{\langle\bar a,j\rangle : j\circ k=h\}$ with $j$ ranging over the arrows out of $W_1$, of which there is one; so the transport is empty or a single pair, and decides every relation of $W_1$’s full domain. Every possible relation contains a pair, so every possible relation has a strong world below it, at $W_0$ and trivially at the one-world $W_1$. BF holds at type $t$, and necessarily. The arrow $k$ sends a proposition $p\subseteq\{1_{W_0},k\}$ to $\{1_{W_1}\}$ if $k\in p$ and to $\emptyset$ otherwise, so it acts surjectively on the two propositions of $W_1$, which gives the type-$t$ instance at $W_0$; $W_1$ is a one-world model, where BF is trivial. Whether BF holds at type $e$ depends on the individual domains, which the record does not fix, so the schema is left open. Possible Infinity (type $t$) fails: $W_0$ has four propositions and $W_1$ two, the models being full, so the Axiom of Infinity at type $t$ is false at both worlds. B for pure sentences fails, and B for sentences of $\Sigma$ with it: the pure sentence that there are three pairwise distinct propositions is true at $W_0$ and false at $W_1$, from which no arrow returns. Observations of Claude Fable 5.1 (Anthropic), 25 September 2026.

## Revisions

- **2026-09-25** (Claude Fable 5.1 (Anthropic)) — Added Transversal Choice, by the argument recorded for Relational Choice: a full model contains every intension, in particular one whose extension at the evaluation point is a transversal, chosen in the metatheory, of the extension there of an equivalence relation; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-25** (Claude Fable 5.1 (Anthropic)) — Added BF (type t) and □BF (type t), and the failure of Possible Infinity (type t) and of B for pure sentences; see the notes. Now satisfies: BF (type t), □BF (type t). Now violates: Possible Infinity (type t), B for pure sentences.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Recorded the Distinctness-preserving collapse; see the notes. Now satisfies: Distinctness-preserving collapse.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Extended the Strong Leibniz Biconditionals from type t to every relational type, with the necessitation: transports of atoms along the unique arrow out of W1 are atoms or empty. Now satisfies: Strong Leibniz Biconditionals, □Strong Leibniz Biconditionals.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added □Strong Leibniz Biconditionals (type t); see the notes. Now satisfies: □Strong Leibniz Biconditionals (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. The propositions at the evaluation object are the subsets of the two arrows out of it, four in all, and every intension of a full model is present, so the numerals are the finite cardinalities and the fourth holds of the universal property of propositions: the Axiom of Infinity at type t fails, as does the fifth instance of the schema. Now satisfies: Relational Choice. Now violates: Axiom of Infinity (type t), Infinity Schema (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality. Now violates: Fregean Axiom, No Pure Contingency.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, fourth paragraph; p. 61.

<p class='cert'>Record: <code>topics/classicism/models/full-two-object-chain.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, fourth paragraph; p. 61
