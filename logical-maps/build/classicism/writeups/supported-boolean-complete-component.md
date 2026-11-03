# Supported model over the ultrafilters of a complete homogeneous algebra

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 25 October 2026 (as a Boolean-valued model, the component of a model with a root); reformulated as an action model by Cian Dorr, 29 October 2026; the component recorded on its own by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **□Boolean Completeness (type t).** Necessarily, every property of propositions has a greatest lower bound.
- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.
- **□Transversal.** Necessarily, there is a property of properties that picks out exactly one property from each coextension class, that is, exactly one property coextensive with any given property.
- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Atoms are self-atoms.** Necessarily, at each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.
- **□Atoms are strong atoms.** Necessarily, at each relational type, every atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **¬ Actuality.** There is a true proposition that entails every true proposition.
- **¬ Relational Choice.** Every serial binary relation has a functional subrelation.
- **¬ Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Fix a set $W$ of worlds, a set $D$ of individuals, a group $G$ acting on $W$ and on $D$, and a set $X$ of support points on which $G$ acts. Here $B$ is the regular open algebra of Cantor space, complete, atomless and homogeneous (every nonzero interval is isomorphic to $B$). The worlds $W$ are the ultrafilters of $B$, $D$ is a single individual, $G=\operatorname{Aut}(B)$ acting on the ultrafilters, and the support points are the elements of $B$. A relation is admitted only if, for each tuple $\bar x$, the set of worlds at which it holds of $\bar x$ is $\hat b:=\{U:b\in U\}$ for some $b\in B$; so the propositions are the sets $\hat b$, a copy of $B$. The component is the action model on the category with object set $W$ and exactly one arrow between any two objects, every arrow acting on $D$ as the identity. Transport between its objects is then trivial, so an entity of relational type $\bar\sigma t$ there is a relation $F\subseteq D_{\bar\sigma}\times W$, giving its extension at each world, and the same entities are available at every world. $G$ acts on these relations by $g\cdot F:=\{(g\bar x,gw):(\bar x,w)\in F\}$, its action on the argument entities being defined in the same way by recursion on their types. $F$ is supported by a finite $P\subseteq X$ if $g\cdot F=F$ for every $g$ fixing $P$ pointwise. The component's domains hold the supported relations satisfying the member's further restriction, if any. Identity is genuine identity, transports being bijective. The evaluation point is a world of the component. Every constant of Σ is relational and denotes the top element of its type.

*A member of the group Supported models over an S5 component, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □Boolean Completeness (type t).

For finite $P\subseteq B$, the elements of $B$ fixed by the automorphisms fixing $P$ pointwise are the joins of the cells of $\langle P\rangle$, and the join of a set invariant under those automorphisms is attained by at most two members per cell, by homogeneity (write-up, Lemmas 1–2). So at any world a family of propositions in the domain, being supported, has as union a finite union, which is a proposition and its least upper bound.

*Write-up: [supported-boolean-complete-predecessor](supported-boolean-complete-predecessor.html). Address: `supported-boolean-complete-component#boolean-completeness-t`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Actuality.

At a world $U$, an actual-world proposition would be some $\hat b$ with $b\in U$ and $\hat b\subseteq\hat c$ for every $c\in U$, so $b$ would be an atom of $B$. $B$ is atomless.

*Write-up: [supported-boolean-complete-predecessor](supported-boolean-complete-predecessor.html). Address: `supported-boolean-complete-component#no-actuality`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Atomlessness.

A possible proposition is $\hat b$ with $b\ne0$. Since $B$ is atomless there is $0<d<b$, and $\hat d$ is possible, entails $\hat b$ and differs from it. Every world sees every world, so this holds at every world.

*Write-up: [supported-boolean-complete-predecessor](supported-boolean-complete-predecessor.html). Address: `supported-boolean-complete-component#atomlessness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Relational Choice.

At input and output type $t$. Let $R:=\lambda p\,q\,.\,p\to(q\land q\le p\land q\ne p)$, serial at the world of evaluation $U_0$ since $B$ is atomless. Suppose $S\le R$ is functional at $U_0$, with fibres $s(p,q)$ and support $P$, and let $k$ be the cell of $\langle P\rangle$ in $U_0$; the automorphisms $H_P$ fixing $P$ pointwise fix $S$ and $k$. Let $q$ be the unique proposition with $Skq$ at $U_0$. Then $0<q<k$, and $c:=s(k,q)\wedge k$ is in $U_0$ and below $q$, since $S\le R$. The fibre of the claim that $Sk$ is functional is fixed by $H_P$, so it is a join of cells, and it contains $U_0$, so it contains $\hat k$. Shrinking $c$ if $c=q$, we may take $0<c<q$. Homogeneity gives an automorphism of $[0,k-c]$ moving $q-c$; with the identity below $c$ and below $\neg k$ it is an $h\in H_P$ with $hq\ne q$. Then $s(k,hq)=h\,s(k,q)\ge h c=c$. So at the worlds in $\hat c$, inside $\hat k$, both $q$ and $hq$ bear $Sk$, and $Sk$ is not functional there: a contradiction.

*Write-up: [supported-boolean-complete-predecessor](supported-boolean-complete-predecessor.html). Address: `supported-boolean-complete-component#no-relational-choice`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Transversal.

At every type and every world. Coextension at a world $U$ is sharing a germ at $U$: agreeing below some $b\in U$. Two facts about $G=\operatorname{Aut}(B)$ give each germ a canonical representative. First, supports intersect: the automorphisms fixing finite subalgebras $A_1$ and $A_2$ generate those fixing $A_1\cap A_2$. So every entity, and with a further step every germ, has a least support. Second, propagation: two entities supported by $A$ that agree below a nonzero $b$ under an $A$-cell $c$ agree under all of $c$. Some automorphism fixing $A$ swaps $b$ and $c-b$. The canonical representative of a germ at $U$ is any representative with the germ's least support, cut down to the cell of that support containing $U$ and made $0$ elsewhere. The witness $\Phi$ holds of $Y$ at $U$ just when $Y$ is the canonical representative of its own germ there. $\Phi$ is invariant under $G$, and its fibre at $Y$ is a join of cells of the least support of $Y$, so it is admitted (write-up).

*Write-up: [transversal-supported-boolean-component](transversal-supported-boolean-component.html). Address: `supported-boolean-complete-component#transversal`. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 29 October 2026; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-30.*

### Holds □BF.

At every type. In the component the same entities are available at every world, transport being trivial. With a free root $r$, every component entity is the transport of a root entity, the one with empty current extension; so what holds necessarily of every root entity holds at every world of every entity there.

*From the group *Supported models over an S5 component*, shared argument `supported-s5-components#barcan`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, for supported-boolean-complete-predecessor; checked and recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, and stated for the group, 2026-10-29.*

### Holds □ND.

At every type. Every arrow acts as the identity and an entity is the same relation at every world, so distinct entities are distinct at every world.

*From the group *Supported models over an S5 component*, shared argument `supported-s5-components#component-distinctness`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Intensional Choice.

At every type. In the component, let $F$ be instantiated at every world, with fibre $\hat c_x$ at $x$. The clopen sets $\hat c_x$ cover the Stone space of $B$, so by compactness finitely many do, those of $x_1,\dots,x_k$, distinct. Let $G$ hold of $x_i$ exactly on $\hat e_i$, where $e_i:=c_{x_i}\wedge\neg\bigvee_{j<i}c_{x_j}$, and of nothing else. Its fibres are in $B$, and it is supported by the supports of the $x_i$ together with the $e_i$, which are support points; so $G$ is admitted, $G\le F$, and at each world exactly one $x_i$ has $G$. With a free root $r$, a root $F=(R,a)$ with $\Box\exists x\,Fx$ has a nonempty current extension and a component part $a$ as above; pair a singleton $\{x_0\}\subseteq R$ with the $G$ built for $a$. Only finitely many choices are made. So Intensional Choice holds at every world the evaluation point sees, and at $r$.

*From the group *Supported models over an S5 component*, shared argument `supported-s5-components#intensional-choice-compactness`. It requires that The worlds are the ultrafilters of a Boolean algebra $B$, each fibre of an admitted relation is $\hat b:=\{U:b\in U\}$ for some $b\in B$, and the elements of $B$ are among the support points. Here: The worlds are the ultrafilters of $B$, the fibres are its elements' clopen sets, and its elements are the support points. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

A self-atom of any relational type at an object $W$ is instantiated at some arrow $k$ out of $W$, and its transport along $k$ is an atom at $k$’s target instantiated at the identity there. The existential projection of an atom $I$ of a relational type, the proposition $\exists\bar x\, .\,I\bar x$, is an atom of type $t$: it is in the domain, it is not bottom, and for any proposition $p$ the entity $I\land\lambda\bar x\, .\,p$ lies below the atom $I$, so is $I$ or bottom, which puts $p$ above the projection or disjoint from it. So the projection is a true atom at $k$’s target, which the condition excludes. Hence no reachable object has a self-atom, and Self-atoms are atoms and Self-atoms are strong atoms hold vacuously at every type and every reachable object, while Self-Atomicity (type t) fails at the evaluation point, the top proposition having no self-atom below it.

*General argument `arguments/no-actuality-no-self-atoms`. It requires that Actuality fails at the identity of every object reachable from the evaluation point: no atom of the domain of propositions there contains that identity. In a one-object model this is the failure of Actuality at the evaluation point, Actuality being a closed sentence. Here: Every world sees every world, and at none of them does Actuality hold (argument no-actuality). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

### Holds □Atomlessness, □Atoms are self-atoms, □Atoms are strong atoms, □Self-atoms are atoms, □Self-atoms are strong atoms. Fails Self-Atomicity (type t).

An atom of a relational type at a reachable object would give, by existential projection, an atom of type $t$ there (as in the argument no-actuality-no-self-atoms), which the condition excludes; so no reachable object has an atom of any relational type, nor a self-atom, since a self-atom is an atom where it is instantiated. All four bridge principles therefore hold vacuously at every type and every reachable object, and Self-Atomicity (type t) fails at the evaluation point.

*General argument `arguments/no-atoms-no-self-atoms`. It requires that At every object reachable from the evaluation point, no proposition in the domain is an atom. Here: Every world sees every world, and no proposition is an atom (argument atomlessness). By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.*

*Revised 2026-10-29 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr:* Now also gives □Atomlessness, which the condition states: a reachable object with no atom of type $t$ satisfies Atomlessness. The bridge verdicts and the failure of Self-Atomicity are now also consequences of □Atomlessness by recorded results.

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

The component of supported-boolean-complete-predecessor, recorded on its own: a model of C5 with □Boolean Completeness (type $t$), □BF, □Atomlessness and □Intensional Choice, in which Actuality and Relational Choice fail. It separates Intensional Choice with Boolean Completeness (type $t$), even with BF or Vicinity, from Actuality. Transversal holds, so Transversal Choice fails with Relational Choice; the model does not separate Intensional Choice from Transversal; supported-diagonal-tail-permutations, with a smaller symmetry group, does.

## Sources

- **Astra via Kodsi 25 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Observer separation with propositional completeness and divergent possibilities, research note of 25 October 2026, §§1–3 (unpaginated), in Daniel Kodsi's pull request #18 (complete-boolean-root.md in the integration register).
- **Dorr 29 Oct** — Cian Dorr, reformulation as an action model, 29 October 2026, in conversation with Claude Opus 5.5 (Anthropic).

<p class='cert'>Record: <code>topics/classicism/models/supported-boolean-complete-component.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Action models.
