# Henkin ultraproduct: finite full S5 models, n worlds and n individuals

Construction by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026; checked
and written up for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr,
25 October 2026. The same write-up covers
[the countable variant](ultraproduct-countable-full-s5-finite-individuals.html).

The Infinity Schemata say that there are at least $k$ individuals, and at least $k$
propositions, for each standard $k$. The Axioms of Infinity say that no finite
cardinality, defined impredicatively, counts all the individuals, or all the
propositions. An ultraproduct of finite models satisfies the first without the second.
Its domains are larger than any standard finite number, but the cardinality that counts
each of them in the $n$-th factor survives as a nonstandard finite cardinality.

## 1. The factors

For $n\ge1$, $M_n$ is the full S5 model with $n$ worlds and $n$ individuals. It is the full
action model on the category with $n$ objects and exactly one arrow between any two, with
the same $n$ individuals at every object, each fixed by every arrow. Its domains are finite
at every type, and it is evaluated at one of its objects. Every constant of Σ denotes the
top element of its type.

In the countable variant, $M_n$ has the worlds $\mathbb N$ instead, still with $n$
individuals.

## 2. The ultraproduct and why it is a model of C

Regard each $M_n$ as a many-sorted first-order structure, with:

- a sort $D_\sigma$ for each type $\sigma$;
- the application maps $D_{\sigma\tau}\times D_\sigma\to D_\tau$;
- the logical constants and the constants of Σ;
- the typed combinators $K$ and $S$, which exist in the full domains;
- a predicate $T$ on $D_t$, for truth at the evaluation object.

Let $U$ be a nonprincipal ultrafilter on the positive integers, and $M:=\prod_nM_n/U$. By
Łoś's theorem, a first-order sentence in this signature holds in $M$ iff it holds in
$M_n$ for $U$-many $n$.

**Terms.** Every closed term of the object language translates into a combination of $K$,
$S$ and constants, so its denotation in $M$ is the class of its denotations in the factors:
$$
[\![\varphi]\!]^M=[\,([\![\varphi]\!]^{M_n})_n\,]_U .
$$
The combinator equations and extensionality,
$\forall f,g\,(\forall x\,fx=gx\to f=g)$, hold in every factor, hence in $M$. So $M$ is a
(Henkin) $\lambda$-model, and $\beta$ and $\eta$ hold in it.

**Truth.** A sentence $\varphi$ is true in $M$ iff $T([\![\varphi]\!]^M)$, that is, iff
$\varphi$ is true in $U$-many factors. Every theorem of C is true in every factor, so in $M$.

**The truth predicate respects the logical constants.** For instance,
$$
\forall f\in D_{\sigma t}\;\big(T(\forall_\sigma f)\leftrightarrow\forall a\in D_\sigma\;T(fa)\big)
$$
is a first-order sentence true in every factor, hence in $M$; likewise for negation and
conjunction. So truth in $M$ is closed under universal quantification over the domains of
$M$: if $T(fa)$ for every $a$, then $T(\forall_\sigma f)$. It is the truth set of a
standard Henkin model, not merely an ultrafilter of propositions. Necessity is the
constant of type $tt$ interpreted componentwise, $\lambda p\, .\,p=\top$ in each factor.

**Verdicts.** Two consequences settle every verdict below:

- each instance of a schema that is true in every factor is true in $M$;
- a single sentence that is false in every factor is false in $M$.

$M$ is not full: its domains are ultrapowers of finite sets.

## 3. What every factor satisfies

Each factor is a full S5 model, at every world:

- the full domains contain every function, which gives □Functional Choice, □Intensional
  Choice, □Rigid Comprehension and □Well-Ordering (with choice in the metatheory);
- the domains are constant, which gives □BF;
- identity is crisp, which gives C5;
- the algebra of propositions is atomic, and its atoms are the worlds, each entailing every
  truth, which gives □Atomicity, □Actuality and □Strong Atomicity;
- any two worlds are related by an automorphism, so a true pure sentence is true
  everywhere: No Pure Contingency.

So all these hold in $M$.

## 4. The Infinity Schemata hold

The instance "there are $k$ pairwise distinct individuals" holds in $M_n$ for $n\ge k$, and
"there are $k$ pairwise distinct propositions" for $2^n\ge k$. Both sets of $n$ are cofinite,
hence in $U$. So both Infinity Schemata hold in $M$. In the countable variant, only the one
at $e$ needs this; at $t$ the Axiom of Infinity itself holds in every factor.

## 5. Possible Infinity fails

In $M_n$ the domains are full and finite, so the finite cardinalities of type $(et)t$ are
the standard ones. At every world, the $n$-th of them holds of the universal property of
individuals. So
$$
\Box\exists Z^{(et)t}\, .\,\operatorname{FiniteCardinality}_e(Z)\land Z(\lambda u\, .\,\top)
$$
is true in every factor, hence in $M$, and Possible Infinity (type $e$) fails. The
witnessing $Z$ in $M$ is the class of the factors' $n$-th cardinalities: a finite
cardinality by $M$'s own lights, but nonstandard. With $2^n$ in place of $n$, at type $t$,
Possible Infinity (type $t$) fails in the finite variant.

## 6. Forcing Possibilism in the countable variant

In each factor of the countable variant the propositions are the $2^{\aleph_0}$ subsets of
$\mathbb N$, and every relation on every domain is present. So the factor's own notions of
complete Boolean algebra, injection and Dedekind-finiteness are the real ones.

An infinite complete Boolean algebra has a countably infinite antichain $(b_k)$:

- if it has infinitely many atoms, take countably many of them;
- otherwise the join of its finitely many atoms is not $\top$, its complement is atomless,
  and splitting repeatedly yields the antichain.

Then $S\mapsto\bigvee_{k\in S}b_k$ is injective on subsets of $\mathbb N$, so such an
algebra has at least $2^{\aleph_0}$ elements. So a complete Boolean algebra represented in
the factor that is Dedekind-finite, or strictly smaller than the propositions, is finite,
with $k$ atoms say. It is then isomorphic to the propositions below a proposition true at
exactly $k$ worlds, which is not $\top$, and the isomorphism is present by fullness. So
each instance of Forcing Possibilism holds in every factor, hence in $M$.
