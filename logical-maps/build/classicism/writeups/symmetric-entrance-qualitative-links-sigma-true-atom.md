# Symmetric ideally-full model: a one-point entrance to the qualitative-links tail [Σ true atom]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 24 October 2026.</p>

## Package

- **Self-atoms are atoms.** At each relational type, every self-atom is an atom.
- **Self-atoms are strong atoms.** At each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Weakly Rigid Power.** If a relation is weakly rigid, so is the property of being a weakly rigid relation that entails it.
- **□Strong Actuality.** Necessarily, there is a true strong atom: a true proposition that necessarily entails every proposition or its negation.
- **Actuality.** There is a true proposition that entails every true proposition.
- **¬ Atoms are self-atoms (type t).** Every atom is a self-atom: necessarily, if it is true, it is an atom.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ □Self-atoms are atoms (type t).** Necessarily, every self-atom is an atom.
- **¬ □Self-atoms are strong atoms (type t).** Necessarily, every self-atom is a strong atom.
- **¬ □Tame Rigidity.** Necessarily, every weakly rigid relation, including a proposition, is rigid.
- **¬ BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **¬ ND (type t).** Distinct propositions are necessarily distinct.
- **¬ Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model on two objects. The tail $B$ has the pinning base, arrows and symmetry group of symmetric-qualitative-links, together with one further point $d$, fixed by every arrow and every symmetry and in the image of no other point. The entrance $A$ has pinning base $\{*\}$, trivial symmetry group and the ideal of finite sets, and one arrow $i:A\to B$, sending $*$ to $d$, so that $m\circ i=i$ for every arrow $m$ out of $B$; there are no arrows from $B$ to $A$. Evaluation point: $1_A$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition, the symmetry group; every other constant of Σ, of which there is at least one, is relational and denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds Self-atoms are atoms, Self-atoms are strong atoms. Fails Atoms are self-atoms (type t), Self-Atomicity (type t), □Self-atoms are atoms (type t), □Self-atoms are strong atoms (type t).

At $A$ the propositions are the four subsets of $\{1_A,i\}$. The atom $\{i\}$ is not a self-atom: its transport along $i$ is the set of all arrows out of $B$, since $m\circ i=i$ for every $m$, which is not an atom at $B$. So Atoms are self-atoms (type t) fails, and Self-Atomicity (type t) fails, $\{i\}$ being possible with no self-atom below it. No self-atom at $A$ has a pair at $i$, for the same reason: its transport along $i$ would be the constant intension of a set of tuples at $B$ over all arrows out of $B$, which has a proper nonzero part over any nonzero proper proposition of $B$. So the self-atoms at $A$ sit over $1_A$ with one tuple, are atoms, and are strong atoms, their transport along $i$ being empty: Self-atoms are atoms and Self-atoms are strong atoms hold at $A$, at every type. At $B$, the tail of symmetric-qualitative-links with the fixed point $d$, the self-atom of that model built from a collapsing arrow $k$ and a finite $N$ with $k(N)\supseteq\{0,1\}$ is again a self-atom that is not an atom, $d$ being fixed by every arrow and every symmetry; so Self-atoms are atoms (type t) and Self-atoms are strong atoms (type t) fail at $B$, which $i$ reaches, and their boxed forms fail at $A$.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds Rigid Comprehension.

The entities at $A$ are the pairs $(E,S)$ of an extension $E$ at $1_A$ and a $G$-invariant extension $S$ at $i$, and transport along $i$ gives the constant intension $S$, fixed by every arrow. So $(E,i\cdot E)$ is persistent and weakly inextensible at $A$ and at $B$: a rigid coextension of any relation with extension $E$.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Holds Atomicity.

The entities at $A$ of each relational type form the complete atomic algebra of pairs of a set of tuples at $A$ and a union of $G$-orbits of tuples at $B$.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Holds Relational Choice.

A graph chosen in the metatheory, paired with the empty set, is an entity at $A$.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Holds Weakly Rigid Power.

For weakly rigid $F=(E,i\cdot E)$, a weakly rigid relation below its transport at $B$ is the constant intension of a set $D$ of transported tuples, which is the transport of $(E_D,i\cdot E_D)$ for $E_D:=\{\bar x\in E:i\cdot\bar x\in D\}$. So the weak power property of $F$ is the pair of its extension and that extension's transport, and is rigid.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Holds □Strong Actuality.

The proposition true at $A$ only is a strong true atom there, its transport being $\bot$; at $B$ the tail's strong true atom serves.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Fails □Tame Rigidity.

With one individual, $d$ is a pinning point only, so the domains at $B$ are those of symmetric-qualitative-links-individuals-singleton, which fails Tame Rigidity at $(t\to t)\to t$ (the argument tame-rigidity of symmetric-qualitative-links), and $B$ is reachable from $A$.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Fails BF (type t), ND (type t), Strong Atomicity (type t).

With $r$ the proposition true at $A$ only: every proposition $p$ at $A$ necessarily satisfies $r\lor p=\top\lor p=\bot$, its transport being $\top$ or $\bot$, but a contingent proposition of the tail does not, so BF at $t$ fails; $r\ne\bot$ while their transports agree; and $\neg r$ is an atom whose transport $\top$ is split at $B$, so no strong atom lies below it.

*Write-up: [symmetric-entrance-qualitative-links](symmetric-entrance-qualitative-links.html). By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026, 2026-10-24.*

### Holds Actuality.

The symmetry group is the smallest symmetric set of arrows containing the identity, and by the condition it is pinned down by a finite set, so it is a proposition in the domain, and an atom entailing every truth.

*Source: Boolean Completeness does not imply Rigid Comprehension, Proposition 24, p. 13; §7.1, p. 21; §8, pp. 23–26. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#actuality`. It requires that The symmetry group, the smallest symmetric set of arrows containing the identity, is pinned down by a finite set. Here: The symmetry group at $A$ is its identity alone, pinned down by $\varnothing$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once; what pins the group down is each member's reason for meeting symmetry-group-pinned.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails No Contingency (signature Σ), Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no world; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas some arrow does not fix $a$, so no closed pure term denotes $\lambda\bar x\, .\,a$.

*General argument `arguments/sigma-true-atom`. It requires that Σ has a designated relational constant $c$ of type $\tau=\bar\sigma t$ denoting $\lambda\bar x\, .\,a$, where $a$ is the actual-world proposition, the unique true atom; every other constant, of which there is at least one, is relational and denotes the top element of its type. Here: This is the interpretation. It requires that The actual-world proposition $a$, the strongest truth, is in the domain; it is necessary at no world, and some arrow does not fix it. Here: The proposition true at $A$ only is the strongest truth; its transport along $i$ is $\bot$, so it is necessary at no world and $i$ does not fix it. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The verbatim copies in ten records (finite-support, symmetric and full action models) stated once for the topic. Its B clause is now sigma-true-atom-b, which needs an arrow from which the actual world is out of reach. "$a$ is fixed by no arrow but the identity" became "some arrow does not fix $a$": in a symmetric model the actual-world proposition is the symmetry group, which its members fix, and the conclusion needs only the weaker claim.


## Notes

Rigid Comprehension, Weakly Rigid Power, Atomicity, Relational Choice and □Strong Actuality do not make Tame Rigidity necessary. Recorded with one individual, as built; the base at $A$ being the single point $*$, the group's variant with the base as individuals is not generated. The construction works for any one-object symmetric ideally-full tail with one individual: the entrance has these principles and fails the necessitation of whatever fails in the tail. Lean certificates of Relational Choice and of the failures of BF at $t$ and at the relational types are Astra's (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative), ported from the submission; the rigidity verdicts are not formalized there.

## Sources

- **Astra (Kodsi) 22 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, A fixed-point entrance model, Tame Rigidity without □Tame Rigidity, research note of 22 October 2026, §§1–6 (unpaginated), in Daniel Kodsi's submission of 24 October 2026 (branch classicism-results-2026-10-24 of github.com/dkodsi/Logical-Maps).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8; Proposition 20.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-entrance-qualitative-links.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. Symmetric ideally-full models, of which this is one.
