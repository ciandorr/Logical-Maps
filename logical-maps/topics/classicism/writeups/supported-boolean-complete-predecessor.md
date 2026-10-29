# Supported model over the ultrafilters of a complete homogeneous algebra, with a free root

The construction is due to GPT-6 Astra (OpenAI), prompted by Daniel Kodsi. It appears as a Boolean-valued
model in Astra's note *Observer separation with propositional completeness and divergent possibilities*
(25 October 2026, §§1–3), listed in Kodsi's pull request #18. OpenAI Codex (GPT-6), prompted by Daniel
Kodsi, integrated it as `supported-boolean-complete-predecessor` in his pull request #21 (28 October
2026). Cian Dorr reformulated it as an action model on 29 October 2026, and Claude Opus 5.5 (Anthropic),
prompted by Cian Dorr, wrote this version.

At the root $r$ the model satisfies:

- □Boolean Completeness (type $t$);
- □BF;
- Relational Choice;
- Actuality.

It does not satisfy □Actuality, or Atomicity (type $t$). In the component, Actuality is necessarily
false.

## The algebra

Let $B$ be the regular open algebra of Cantor space. It is complete and atomless, and *homogeneous*:
every nonzero interval $[0,b]$ is isomorphic to $B$. Let $G=\operatorname{Aut}(B)$.

For a finite $P\subseteq B$, let $H_P$ be the automorphisms fixing $P$ pointwise. The finite subalgebra
$\langle P\rangle$ has finitely many atoms, the *cells* $c_1,\dots,c_m$, which partition $1$.

**Lemma 1.** The elements of $B$ fixed by $H_P$ are exactly the joins of cells.

*Proof.* Every member of $H_P$ fixes each cell, so it fixes their joins. Conversely, suppose
$0<b\wedge c<c$ for a cell $c$. Then $[0,b\wedge c]$ and $[0,c-b]$ are both isomorphic to $B$. An
isomorphism exchanging them, extended by the identity off $c$, lies in $H_P$ and moves $b$. $\square$

**Lemma 2 (finite attainment).** If $S\subseteq B$ is $H_P$-invariant, then $\bigvee S$ is the join of
at most two members of $S$ per cell, and $\bigwedge S$ dually.

*Proof.* Take a cell $c$ that some $b\in S$ meets.

- If $b\ge c$, then $b$ covers $c$.
- Otherwise, the automorphism $u$ of Lemma 1 gives $u(b)\in S$ with $u(b)\wedge c=c-b$, so $b$ and $u(b)$ together cover $c$.

So finitely many members of $S$ join to the union of the cells that $S$ meets. Every member of $S$ lies
below that union, so it is $\bigvee S$. $\square$

## The model

**The worlds and the component.** The worlds are the ultrafilters of $B$. Each $b\in B$ determines the
set of worlds $\hat b:=\{U:b\in U\}$, and $b\mapsto\hat b$ is an isomorphism of $B$ onto the clopen
algebra of its Stone space.

- The component has exactly one arrow between any two worlds, and a single individual. So an entity of
  relational type is a relation $F$ between tuples and worlds, the same at every world.
- $G$ acts on worlds and, by conjugation, on entities.
- An entity is admitted if it satisfies two conditions:
  - **it is supported:** $g\cdot F=F$ for every $g\in H_P$, for some finite $P\subseteq B$;
  - **its fibres are in $B$:** for each tuple $\bar x$, the set of worlds at which $F$ holds of $\bar x$ is $\hat b$ for some $b\in B$.
- So the propositions of the component are the sets $\hat b$, a copy of $B$.

**The root.** A root $r$ is added, with one arrow to each world and none back. A root entity is a pair
$(R,a)$ of an arbitrary current extension $R$ and a component entity $a$. So the propositions at $r$
are the pairs $(\varepsilon,\hat b)$, a copy of $2\times B$, and $r$ sees itself and every world.

**Closure.** The domains contain the denotations of all terms, so the structure is a model of C.

- The logical constants are invariant under $G$.
- Application, abstraction and the Boolean operations preserve support and keep fibres in $B$.
- Quantifiers in an action model are evaluated world by world. So the fibre of $\forall x\,Fx$ is the
  intersection of the fibres $\hat b_x$ of the instances, and that of $\exists x\,Fx$ is their union.
- If $F$ is supported by $P$, the set of the $b_x$ is $H_P$-invariant. By Lemma 2 the intersection is a
  finite intersection, so it is again $\hat b$ for $b=\bigwedge_xb_x$, and likewise for the union.

Without finite support, the intersection of infinitely many clopen sets needn't be clopen, and the
domains wouldn't be closed. At the root, current extensions are arbitrary and the component parts are
component entities, so the same holds there, as for the coalesced roots.

## Verdicts

- **Boolean Completeness (type $t$), necessarily.**
  - *At a world of the component.* A family of propositions in the domain is supported, so by Lemma 2 its union is the finite union $\hat b$ with $b=\bigvee_ib_i$. That is its least upper bound.
  - *At $r$.* A family of root propositions $(\varepsilon_i,\hat b_i)$ is arbitrary, and its least upper bound is $(\bigvee\varepsilon_i,\widehat{\bigvee b_i})$, with the join taken in the complete algebra $B$. This is where completeness of $B$ is needed: a union of clopen sets needn't be clopen, but the least clopen set containing it exists.
- **BF, necessarily.**
  - In the component, the same entities are available at every world, so BF holds trivially.
  - At $r$, every component entity is the transport of a root entity, the one with empty current extension.
- **Relational Choice.** For a serial $U$ at $r$, choose, in the metatheory, a functional subrelation of its current extension, and pair it with the empty component entity.
- **Actuality.** At $r$, the proposition true at $r$ alone is true and below every truth.
- **No Actuality in the component.** At a world $U$, an actual-world proposition would be some $\hat b$ with $b\in U$ and $\hat b\subseteq\hat c$ for every $c\in U$. Then $b$ would be an atom of $B$, and $B$ is atomless. So Actuality is false at every world of the component, and □Actuality fails at $r$.
- **No Atomicity (type $t$) at $r$.** Below a nonzero $(0,\hat b)$, every $(0,\hat c)$ with $c<b$ is again nonzero.

## Remarks

**The two presentations.** Astra's presentation is Boolean-valued: propositions are elements of $B$,
relations are finitely supported functions into $B$, identity is crisp, and quantifiers are infima and
suprema. There, Lemma 2 is what makes each ultrafilter a world respecting the quantifiers. In the action
model the worlds come first, and Lemma 2 is what keeps the domains closed under the quantifiers. The two
are the same model.

**The fibre condition is needed.** Without it, every supported relation would be admitted. The
component's propositions would then be all the $H_P$-invariant sets of ultrafilters, a larger algebra,
since $G$ isn't transitive on the ultrafilters in a cell. That component is still a model of C, and it
satisfies C5, BF, Boolean Completeness at $t$ and Atomlessness. But its algebra isn't externally complete,
and the free root would then fail Boolean Completeness.

**Cantor space.** With the countable atomless algebra in place of $B$, Cantor space for the worlds and its
homeomorphisms for $G$, the supported sets of worlds are exactly the clopen ones. So the fibre condition
comes free. The component is then a clean model of C5 + Boolean Completeness at $t$ + ¬Actuality, but the
free root fails Boolean Completeness at $t$.
