## Framework

[WARNING: UNDER CONSTRUCTION, HEAVY AI PROSE]

The fixed base theory is **Intuitionisticism (II)**, following Zachary Goodsell,
*Possibility in Intuitionistic Higher-Order Logic*, manuscript dated
21 August 2026, §§2.1–2.2, pp. 4–6.

Its language is the simply typed lambda calculus, with propositional type
$t$ and function types $\langle\sigma\tau\rangle$. It has intuitionistic
propositional connectives, identity at every type, and universal and existential
quantification at every type. The underlying logic **IH** includes beta-eta
conversion, the usual intuitionistic propositional and quantifier rules,
reflexivity of identity, and Leibniz's Law.

**Intuitionisticism (II) = IH + Intensionality**. Its standing rules include
both intensionality families:

$$
\frac{\vdash P\leftrightarrow Q}{\vdash P=Q}
\qquad
\frac{\vdash a=b}{\vdash (\lambda x.a)=(\lambda x.b)}.
$$

**Both rules require an empty assumption context.** In the function rule,
$a,b$ have the same type and $x$ may have any type. Clearing optional background
assumptions leaves II, including both intensionality rules, in force. The base includes
neither propositional nor function extensionality as an axiom, and includes
neither choice nor description axioms.

## Notation

- $p,q,r$ range over propositions, of type $t$.
- $\Box p$ abbreviates $p=\top$, following §3.1, p. 8.
- $\neg A$ abbreviates $A\to\bot$; implication associates to the right.
- Necessitated principles use a $\Box$ prefix: **LEM**, **$\Box$LEM**,
  **PSd ($\Diamond_\vee$)**, **$\Box$PSd ($\Diamond_\vee$)**. The box encloses
  the whole sentence, including its quantifiers. For a type-ambiguous schema
  it encloses each type instance. The manuscript's necessary Descriptions
  schema is labelled **$\Box$Descriptions**, with **Descriptions** reserved for
  its unboxed counterpart. The spelling `[]LEM` is also searchable.

Possibility notation always identifies the operator. The map uses these
distinct definitions, with $P$ ranging over type $\langle tt\rangle$:

| Operator | Definition | Source |
| --- | --- | --- |
| $\Diamond_\vee$ | $\lambda p.\exists P\,(\mathrm{Possibility}_\vee(P)\land Pp)$ | §4.2, Eqs. (32)–(33), pp. 18–19 |
| $\Diamond_2$ | $\lambda p.\exists P\,(\mathrm{Possibility}_2(P)\land Pp)$ | §4.5, Eqs. (48)–(56), p. 25 |
| $\Diamond_\infty$ | $\lambda p.\exists P\,(\mathrm{Possibility}_\infty(P)\land Pp)$ | §4.4, Eqs. (42)–(45), p. 23 |
| $\ne\!\bot$ | $\lambda p.\neg(p=\bot)$ | §3.1, p. 8 |

The defining candidate predicates retain the manuscript's conditions:

- $\mathrm{Possibility}_\vee(P)$ is
  $\top=(\mathrm{PSa}(P)\land\mathrm{PSb}(P)\land\mathrm{PSc}(P))$.
  Here PSa–PSc are the properties of propositional functions defined in
  §4.1, Eqs. (22)–(24), p. 16, using $\Box=(=\top)$.
- $\mathrm{Possibility}_\infty(P)$ replaces PSc with
  $\mathrm{PSc}_\infty$ in that definition. The inextensibility restriction
  and the choice $\mathrm{PSc}_\infty=\mathrm{PSc}_\infty^t$ are as defined
  in §4.4, Eqs. (42)–(44). An equivalence between instances at different types
  requires a separately justified result under its stated background.
- $\mathrm{Possibility}_2(P)$ is defined by the marriage conditions in
  §4.5, Eq. (52): PSb and PSc for $P$ are jointly identical to $\top$, and
  $P$ has a married necessity operator satisfying the source's normality
  conditions necessarily. The exact conditions and scopes are those of
  Eqs. (46)–(52).

Every modal condition names its operator. There is no unindexed possibility
symbol or unspecified possibility parameter. The original
PSa and PSd records use $\Box=(=\top)$, including the records for
$\Diamond_2$. The separately defined $\Box_2$ of §4.5, Eq. (55), must be
named explicitly when used; it is not silently substituted for $\Box$.

## Conventions

Arrows record derivability over II, with any additional selected background principles.
For rules and schemata, including type-ambiguous schemata, the direction of the
arrow determines the burden of proof:

- **An arrow to a rule or schema means every instance can be derived.** For a
  rule, derive the conclusion from that instance's premises with all its side
  conditions. For a type-ambiguous schema, cover every permitted type instance.
- **An arrow from a rule or schema may use particular instances.** The proof
  must specify the instances it uses. It need not use every instance.

For a principle containing several rule families, an incoming arrow covers
every family at every permitted type; an outgoing proof can use particular
applications. Selecting an additional rule makes its inferential steps
available subject to their side conditions; it does not assert an
object-language conditional. The standing intensionality rules retain their
empty-context requirement: they cannot be applied to an equivalence
established only under an undischarged formula assumption.

Object-language quantification, schematic generality, and identity with
$\top$ remain distinct. The original PSa–PSd records follow the explicitly
quantified formulas of §4.1, Eqs. (22)–(25), instantiated with the named
operators; the paired records follow §4.5 and explicitly name $\Box_2$.
Each T and 4 record explicitly states its propositional
quantification. A proof of one instance does not establish an arrow to an
entire rule or schema.

In particular, the records for excluded middle $\forall p\,(p\lor\neg p)$
and its identity with $\top$ are separate. Keep the scope of quantification and
necessity explicit when adding further principles.

Countermodels must interpret II and the named operators by their definitions,
and identify the world or evaluation used for formula assertions. A claimed
failure of a rule or schema must identify a failing instance; satisfaction must
cover all its instances with their side conditions. Distinguish global
validity from truth at an evaluation. The viewer's negative selections express
failure of a recorded property in the map's metatheory; failure to satisfy $A$
does not by itself establish satisfaction of its intuitionistic negation
$\neg A$.

Implications and countermodels require their own proof or construction and
source records. An open pair means that the current database has no recorded
resolution; it does not identify an open problem in the literature.

## Elementary connections

These connecting proofs supplement the manuscript extraction. Original
deductions have separate source certificates; selected assumptions retain
their original necessity scopes.

| Connection over II | Proof |
| --- | --- |
| $\Diamond_2p\to\Diamond_\vee p$ | [Inclusion of the candidate classes](writeups/ii-implies-paired-candidates-are-vee-candidates.html) |
| $\Diamond_\vee=\Diamond_2$ iff $\mathrm{Spouse}(\Diamond_\vee)$ | [Spouse implies identity](writeups/vee-spouse-implies-equality-two.html); the converse uses $\Box_2$ as spouse |
| $\Box\mathrm{PSd}(\Diamond_\vee)$ iff $\Box=\Box_2$ | [PSd recovery](writeups/boxed-ps-d-vee-implies-necessities-equal.html) |
| $\Box\mathrm{PSc}(\ne\!\bot)$ iff $\Diamond_\vee=(\ne\!\bot)$ | [Distributivity characterization](writeups/boxed-ps-c-distinct-implies-vee-equals-distinct.html) |
| Propositional extensionality iff universal self-necessitation | [Forward](writeups/propositional-extensionality-implies-self-necessitation.html) and [reverse](writeups/self-necessitation-implies-propositional-extensionality.html) |
| $\Box_2$-intensionalism iff $\forall p.(\Box_2p\to\Box p)$ | [Necessity comparison](writeups/two-intensionalism-implies-reverse-necessity.html) |

The audit also covers identity transitivity, the bound $p\ne\bot$ for each
defined possibility, collapse to Truth, and boxed versions of proved formula
implications. For example, $\Diamond_\vee=\Diamond_2$ is equivalent to
$\Box\forall p.(\Diamond_\vee p\to\Diamond_2p)$. The unboxed pointwise
condition remains a separate principle. Operator identities and the spouse
conditions imply their own $\Box$ versions, with proofs recorded separately.

The [all-types proof of modalized functionality](writeups/ii-implies-modalized-functionality.html)
now establishes the passage from necessary pointwise agreement to function
identity. It applies intensionality only to assumption-free derivations, then
uses the boxed premise by substitution. The earlier pending record retains
its conjecture history and the paper's original attribution.

The spouse equivalence for $\Diamond_\vee$ is not automatically copied to
$\Diamond_\infty$. The recorded implication from a spouse for
$\Diamond_\infty$ to its being bounded by $\Diamond_2$ explicitly includes
$\Box\mathrm{PSc}(\Diamond_\infty)$; the printed infinitary-to-binary
reduction remains pending.

<!-- MANUSCRIPT COVERAGE -->

## Candidate definitions

In these definitions $P,Q,N:t\to t$ are **bound candidate variables**.
They do not name an additional, unindexed possibility modality.
Write $\mathrm{Truth}=\lambda p.p$ and $\Box p=(p=\top)$.
The conditions of §4.1 are

$$
\begin{aligned}
\mathrm{PSa}(P)&:=\forall p,q.\;\Box(p\to q)\to(Pp\to Pq),\\
\mathrm{PSb}(P)&:=\neg P\bot,\\
\mathrm{PSc}(P)&:=\forall p,q.\;P(p\lor q)\to(Pp\lor Pq),\\
\mathrm{PSd}(P)&:=\forall p,q.\;(Pp\to\Box q)\to\Box(p\to q).
\end{aligned}
$$

The manuscript’s definition of inextensibility and its distribution condition
retain their quantifier scopes (§4.4, Eqs. (42)–(43)):

$$
\mathrm{Inex}^{\sigma}(F):=
\Box\forall G^{\sigma t}.\;
\bigl(\forall x^\sigma.\;Fx\to\Box Gx\bigr)
\to\Box\bigl(\forall x^\sigma.\;Fx\to Gx\bigr),
$$

$$
\mathrm{PSc}^{\sigma}_{\infty}(P):=
\forall F^{\sigma t}.\;\mathrm{Inex}^{\sigma}(F)\to
\bigl(P(\exists x^\sigma.\;Fx)\to\exists x^\sigma.\;P(Fx)\bigr).
$$

The defined operator $\Diamond_\infty$ uses the $\sigma=t$ instance.
The claim that this implies every other type instance is a separate pending
schema, as is the reduction from the displayed infinitary condition to binary
PSc. The direct candidate and T proofs do not need those reductions.

For the paired modalities (§4.5), use

$$
\begin{aligned}
\mathrm{Normal}(N)&:=N\top\land\forall p,q.\;N(p\to q)\to(Np\to Nq),\\
\mathrm{PSa}_2(N,P)&:=\forall p,q.\;N(p\to q)\to(Pp\to Pq),\\
\mathrm{PSd}_2(N,P)&:=\forall p,q.\;(Pp\to Nq)\to N(p\to q),\\
\mathrm{Married}(N,P)&:=\Box\bigl(\mathrm{PSa}_2(N,P)\land\mathrm{PSd}_2(N,P)\bigr),\\
\mathrm{Necessity}_2(N)&:=\Box\mathrm{Normal}(N)\land
\exists P.\;\Box(\mathrm{PSb}(P)\land\mathrm{PSc}(P))\land\mathrm{Married}(N,P),\\
\mathrm{Possibility}_2(P)&:=\Box(\mathrm{PSb}(P)\land\mathrm{PSc}(P))\land
\exists N.\;\Box\mathrm{Normal}(N)\land\mathrm{Married}(N,P),\\
\Box_2p&:=\forall N.\;\mathrm{Necessity}_2(N)\to Np,\\
\Diamond_2p&:=\exists P.\;\mathrm{Possibility}_2(P)\land Pp.
\end{aligned}
$$

The universal closure in Normal makes explicit the intended use of K in
Eqs. (47), (51) and (52); Eq. (47) as printed leaves $p,q$ free.
The predicates also admit the equivalent mutually quantified forms of
Eqs. (53)–(54): replace the spouse’s explicit normality or PSb/PSc clause with
its qualified candidate predicate. The original PSa/PSd nodes retain $\Box$;
the added **paired** nodes explicitly use $\Box_2$. In a necessary paired node,
the *outer* $\Box$ still means identity with $\top$.

The prime predicate used for the representation questions in §4.3 is read as

$$
\mathrm{Prime}(w):=(w\ne\bot)\land
\Box\forall p,q.\;\Box(w\to(p\lor q))\to
\bigl(\Box(w\to p)\lor\Box(w\to q)\bigr).
$$

The scope-sensitive prime-possibility and representation proofs remain pending.

## Reduced logical signature

The primitives may be reduced to $\to$ and $\forall^\sigma$, as in §2.4,
Eqs. (5)–(11). These are definitions in the standing framework:

$$
\begin{aligned}
\top&:=\forall p.\;p\to p,& \bot&:=\forall p.\;p,\\
\neg&:=\lambda p.\;p\to\bot,\\
\lor&:=\lambda p,q.\;\forall r.\;(p\to r)\to(q\to r)\to r,\\
\land&:=\lambda p,q.\;\forall r.\;(p\to q\to r)\to r,\\
{=}_{\sigma}&:=\lambda x^\sigma,y^\sigma.\;\forall F^{\sigma t}.\;Fx\to Fy,\\
\exists^\sigma&:=\lambda F^{\sigma t}.\;\forall p.\;
(\forall x^\sigma.\;Fx\to p)\to p.
\end{aligned}
$$

## Model semantics

An ordinary birelation frame has an informational preorder $\le_i$ and a
separate relation $R$. FC1 says that $aRb$ and $a\le_i c$ admit $d$ with
$b\le_i d$ and $cRd$. FC2 says that $aRb$ and $b\le_i d$ admit $c$ with
$a\le_i c$ and $cRd$. These are conditions on semantic representations.

In the bimodalized domain semantics of II, a distinguished root and two
preorders satisfy $\le_i\subseteq\le_m$. Propositions have informationally
upward-closed truth sets. Each type has a nonempty domain and each world a
partial equivalence relation on it; the local domain consists of its
self-congruent elements. Congruence persists along $\le_m$ and respects
application. Propositional congruence at $w$ is agreement of truth sets on
$\uparrow_m w$.

Richness supplies the logical operations and combinators. Universal
quantification examines every local input at every informational successor;
equality is the local congruence relation. Quasifunctionality says that
agreement on all local arguments at every metaphysical successor suffices for
function congruence. Definitions 7 and 11 give the semantic and term
interpretations respectively. In a full model, every informational upset is a
proposition, all set functions are available in the ambient function domains,
and the recursively defined congruence relations determine local availability.

The explicit model write-ups specify the root and interpret the named
modalities by their higher-order definitions:

- [Three-world fork](writeups/full-three-world-fork.html): failure of stability
  and of a PSb–PSd candidate at the root.
- [Extensional branching](writeups/full-branching-extensional-frame.html):
  failure of disjunction distribution for distinctness from bottom.
- [Infinite comb](writeups/full-infinite-comb.html): the stronger negative
  sentence in Theorem 5(i), and the cofinal semantics in Theorem 30.
- [Binary tree with canopy](writeups/full-binary-tree-canopy.html): Theorem 5(ii),
  failure of $\Box_2$-intensionalism, and the tree part of Theorem 31.
- [Classical root over a chain](writeups/full-classical-root-chain.html):
  excluded middle without its necessity, and Eq. (85).

The finite checks exhaust propositional inputs on the finite frames. They do
not enumerate all higher types or certify an infinite construction by a finite
truncation; those parts use the supplied model arguments.

The ideal discussion of §5.4 is retained as a semantic research direction.
Necessary PSa, PSb and PSc correspond to complements of shrinking families of
ideals on local proposition lattices; Eq. (73) describes possibility by exclusion
from the least such family. The proposed infinitary description uses principal
ideals and the union of subrelations of $\le_m$ satisfying FC1 (Eq. (75)). Its
identification with the operator defined by the printed Eq. (43) remains
pending. The suggested empty-ideal characterization is not adopted: the
earlier definition requires each ideal to contain the empty proposition.

## Contingency and incontingency

Eqs. (87)–(88) suggest properties of propositions, not axioms asserting that
every proposition has them. At each of the explicitly named operators
$\Diamond_\vee$, $\Diamond_2$, $\Diamond_\infty$, and $\ne\!\bot$, the
first contingency property says that both $p$ and $\neg p$ satisfy that
operator. The two necessity-only alternatives are

$$\neg(\Box p\lor\Box\neg p),\qquad\neg\Box p\land\neg\Box\neg p.$$

Those two are intuitionistically equivalent by De Morgan’s law. No equivalence
with the candidate-specific positive possibility condition is assumed.
The incontingency alternatives are $\Box p\lor\Box\neg p$, the implication
from the named candidate’s possibility of $p$ to $\Box p$, and
$(p\to\Box p)\land(\neg p\to\Box\neg p)$. The manuscript leaves their
comparative significance for future work.

## Manuscript coverage

All 31 numbered results and 11 numbered definitions are accounted for. “Pending” includes stated manuscript theorems whose proof has not been completed in the map; it does not reclassify them as the author’s conjectures. Semantic entries are retained here as metatheory. The downloadable map includes the detailed `extraction.md` and machine-readable `coverage.yaml` register.

| Result | Content | Coverage |
| --- | --- | --- |
| Theorem 1 | [K, T, 4 and necessitation for □](writeups/ii-implies-k-necessity.html) | proof recorded |
| Theorem 2 | Monotonic existential modal semantics iff Frame Condition 1 | semantic proof |
| Theorem 3 | IK and IS4 completeness for Plotkin–Stirling frames | literature statement |
| Theorem 4 | WK completeness with Wijesekera semantics | literature statement |
| Theorem 5 | [Two relative-consistency obstructions to possibility](writeups/full-infinite-comb.html) | proof recorded |
| Theorem 6 | [$\Diamond_\vee$ is a $\mathrm{Possibility}_\vee$](writeups/ii-implies-necessary-ps-a-possibility-vee.html) | proof recorded |
| Theorem 7 | [Truth is a $\mathrm{Possibility}_\vee$; T for $\Diamond_\vee$](writeups/ii-implies-t-possibility-vee.html) | proof recorded |
| Theorem 8 | [Nonfalsity qualifies exactly under necessary weak excluded middle](writeups/ii-implies-nonfalsity-candidate-characterization.html) | proof recorded |
| Theorem 9 | [Composition and disjunction closure; 4 for $\Diamond_\vee$](writeups/ii-implies-vee-composition-closure.html) | proof recorded |
| Theorem 10 | Exact IS4− logic for $\Box$ and $\Diamond_\vee$ | partial |
| Theorem 11 | [Prime propositions are $\Diamond_\vee$-possible](writeups/ii-implies-prime-possibility.html) | pending |
| Theorem 12 | [$\Diamond_\infty$ qualifies and obeys T and 4](writeups/ii-implies-necessary-ps-a-possibility-infinity.html) | partial |
| Theorem 13 | Exact IS4− logic for $\Box$ and $\Diamond_\infty$ | pending |
| Theorem 14 | [□₂ and ◇₂ are married](writeups/ii-implies-necessary-ps-a-paired-two.html) | proof recorded |
| Theorem 15 | [□₂ and ◇₂ belong to their paired candidate classes](writeups/ii-implies-k-necessity-two.html) | proof recorded |
| Theorem 16 | [Truth is a necessity and possibility, married to itself](writeups/ii-implies-t-necessity-two.html) | proof recorded |
| Theorem 17 | [At least IS4 for □₂ and ◇₂](writeups/ii-implies-four-necessity-two.html) | partial |
| Theorem 18 | [Distinct □₂-equivalent propositions are consistent](writeups/full-binary-tree-canopy.html) | proof recorded |
| Lemma 19 | Term interpretations stay in the local domain | semantic proof |
| Lemma 20 | Rerooting along metaphysical accessibility preserves models | semantic proof |
| Theorem 21 | Soundness and completeness of bimodalized domain semantics | semantic proof sketch |
| Theorem 22 | Full structures are rich and quasifunctional | semantic proof sketch |
| Theorem 23 | FC1 forces nonfalsity to give a distinct disjunct | semantic proof |
| Lemma 24 | Prime-theory extension avoiding an underivable sentence | semantic proof sketch |
| Lemma 25 | Propositional local classes embed in truth sets on the modal cone | semantic proof sketch |
| Lemma 26 | The term structure is rich | semantic proof sketch |
| Lemma 27 | The term structure is quasifunctional | semantic proof sketch |
| Theorem 28 | Term models exist and their root theory is exactly $w_{0} |$ semantic proof sketch |
| Theorem 29 | Strong completeness for II | semantic proof |
| Theorem 30 | [Comb semantics and failure of relational representation for $\Diamond_\vee$](writeups/full-infinite-comb.html) | partial |
| Theorem 31 | [Marriage in the comb and collapse to Truth in the tree](writeups/full-binary-tree-canopy.html) | partial |

### Semantic results outside the graph

**Theorem 2** (§3.4, pp. 14–15). For necessity of FC1, a missing completion of aRb and $a\le _{i}c$ is witnessed by the upward closure of b: the relational existential operator holds at a but not c. Conversely, transport an existential witness b across $a\le _{i}c$ using FC1 to obtain $d\ge _{i}b$ with cRd; upward closure preserves truth. This is a theorem about arbitrary birelation frames, not a new II axiom.

**Theorem 3** (§3.4, p. 15). Attributed to Plotkin and Stirling (1986); proof referred to Simpson (1994), Chapter 3. IK uses FC1 and FC2; IS4 additionally requires R reflexive and transitive. The cited external proof has not been independently transcribed. R is not identified with $\le _{m}$ in this theorem.

**Theorem 4** (§3.4, p. 15). Attributed to Wijesekera (1990). The existential condition is $\forall w$′$\ge _{i}w \exists v.(w$′Rv $\land v\in p$). WK retains K for its necessity, necessitation, PSa and PSb, but drops PSc and PSd. This is a separate relational interpretation, not a new designated possibility in II.

**Lemma 19** (§5.2, p. 31). Convert a term to applicative combinator form. Its free variables are in the local domain by hypothesis; the required constants and combinators are locally available. Closure of application under the logical relations inductively keeps every subterm, hence the whole interpretation, in the domain.

**Lemma 20** (§5.2, p. 31). If $w\ge _{m} w_{0}$, the local domains contain the original root’s distinguished elements by monotonicity of the logical relations. Changing only the distinguished root to w preserves richness and all interpretation clauses. This licenses testing assumption-free theorems at metaphysically accessible worlds.

**Theorem 21** (§5.2, pp. 31–32). The interpretation clauses validate IH. Quasifunctionality gives Eq. (70): truth of $\Box \forall x.fx=gx$ means equality on every metaphysically accessible local domain, so $f\sim g$ at the root. For intensionality, apply validity of an assumption-free premise at each rerooted model, then use propositional congruence or quasifunctionality. Completeness is Theorem 29. This is a retained metatheoretic proof outline, not an additional assumption in the graph.

**Theorem 22** (§5.3, p. 33). Take all informational upsets at type t and all set functions at function types, with recursively defined local congruence. Quasifunctionality follows from that definition. For Univ, $f\sim g$ at w entails agreement on every local input at each informational successor of every metaphysical successor; hence their universal truth sets agree on the metaphysical cone. The manuscript treats the logical functions and combinators similarly. The explicit countermodels invoke this construction at every type, not only their finite propositional projection.

**Theorem 23** (§5.5, Eq. (77), pp. 37–38). If $\neg \neg (p\lor q)$ holds at w, choose an informational successor u in one disjunct, say p. Since $\le _{i}\subseteq \le _{m} , w\le _{m} u$. For every $v\ge _{i}w$, FC1 gives $d\ge _{i}u$ with $v\le _{m} d$; persistence makes p true at d. Thus $p=\bot$ fails at every $v\ge _{i}w$, so $p\ne \bot$ holds at w. The q case is symmetric. The graph contains the object-language conclusion as an optional principle; FC1 remains a condition on representations, not an II axiom. The prose proof’s occurrence of $\top$ where $\bot$ is needed is not used.

**Lemma 24** (§6.1, p. 39). The Henkin-style construction extends a small closed theory while avoiding p, successively choosing disjuncts and fresh existential witnesses; compactness preserves avoidance at unions. The manuscript cites Henkin (1950), p. 86 for the construction. The constant-reserve and enumeration details have not been independently completed here.

**Lemma 25** (§6.1, p. 40). If $p=q$ is absent from w, the manuscript uses the equations of w and prime extension to obtain a metaphysical successor distinguishing p and q. This separates the corresponding truth sets. The passage from equations to provable material equivalence is retained as part of the source proof outline, not separately formalized.

**Lemma 26** (§6.1, pp. 40–41). Use classes of the logical constants and combinators. For implication, a missing implication permits an extension containing its antecedent without its consequent. Existential truth follows from witness completeness. For the reverse universal clause use a fresh constant and prime extension. The source supplies these cases; the other applicative checks are schematic.

**Lemma 27** (§6.1, p. 41). Agreement on every local input at every metaphysical successor yields $\forall x.fx=gx$ there by the fresh-constant argument. Lemma 25 gives its identity with $\top$ at w, and modalized functionality gives $f=g$. This retains the dependencies on Lemma 25 and Eq. (70).

**Theorem 28** (§6.1, p. 41). Interpret each term by its relative equivalence class. Lemmas 25–27 provide the required model structure; truth at the root is membership in $w_{0}$ by construction. The source’s immediate proof is recorded with these dependencies.

**Theorem 29** (§6.1, pp. 41–42). If $\Gamma$ does not prove p, Lemma 24 gives a prime theory extending $\Gamma$ and omitting p. Root its term model there. By Theorem 28 all of $\Gamma$ is true and p is false in that model, contradicting semantic entailment. The argument is conditional on the prime extension and term-model lemmas, as in the manuscript.

### Definition register

| Definition | Content | Source |
| --- | --- | --- |
| 1 | Birelation frame | §3.4, pp. 13–14 |
| 2 | Metaphysical birelation frame | §5.2, p. 29 |
| 3 | Prop | §5.2, Eq. (63), p. 29 |
| 4 | Bimodalized domain structure | §5.2, pp. 29–30 |
| 5 | Rich structure | §5.2, Eqs. (66)–(69), p. 30 |
| 6 | Quasifunctional structure | §5.2, p. 30 |
| 7 | Bimodalized domain model | §5.2, p. 31 |
| 8 | Full structure | §5.3, pp. 32–33 |
| 9 | Full model | §5.3, p. 33 |
| 10 | Term structure | §6.1, p. 40 |
| 11 | Term model | §6.1, p. 41 |

### Open questions and deferred steps

**Question 1.** Exact propositional modal logic of $\Box$ and $\Diamond_\vee$. Conflicts with the asserted exactness of Theorem 10; retained as unresolved while §6.3 is incomplete.

**Question 2.** Exact propositional modal logic of $\Box _{2}$ and $\Diamond _{2}$. Theorem 17 states the IS4 lower bound and conjectures exactness. The two 4 proofs still need expansion in this map.

**Question 3.** Spouse uniqueness for $\Box$ and general monogamy. Both qualified uniqueness statements are principle nodes. §4.5 contains contrary draft remarks about polygamy, but no completed countermodel is supplied.

**Question 4.** Consequences of Descriptions over II. The type-ambiguous necessary description principle is recorded. No S5 conclusion is imported from the discussion of Classicism.

The remaining deferred steps concern the infinitary definition and type reduction, composition for the paired 4 laws, prime representation, and unfinished marriage/unwinding constructions. Proposed equality patterns and the unspecified comb spouse are not proved countermodels.

The graph’s source certificates distinguish Goodsell’s manuscript, Bacon’s original result, and additional connecting deductions. All new records have no independent checker and no Lean verification.
