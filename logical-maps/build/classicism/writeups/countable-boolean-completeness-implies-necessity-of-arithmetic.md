# Countable Boolean Completeness ⇒ Necessity of Arithmetic

This is Theorem 9 of Goodsell, *Arithmetic is Necessary* (draft of 5 June
2024), transcribed with its lemma structure. The source proves it in HKC,
the logic H plus K plus Countable Boolean Completeness, which C extends, so
every step is available here; T, 4 and Logical Equivalence are never used.
See Background for the instantiation of the source's $\nu$, $0$ and
successor as $(et)t$, $\mathbf{0}_e$ and $\operatorname{Suc}_e$, under which
$\mathbb N$ is $\operatorname{FiniteCardinality}_e$, and for
$\operatorname{Ctbl}$, $I$, $I^*$, $\operatorname{Sum}$, $\operatorname{Prod}$
and arithmetical sentences. Write $n^+$ for $\operatorname{Suc}_e n$.

**Lemma 2 (induction).** Any property that $\mathbf{0}_e$ has and that is
closed under successor is had by every number. Immediate from the
definition of $\mathbb N$.

**Lemma 3 (numbers are necessarily numbers).**
$\forall n\in\mathbb N\, .\,\Box\mathbb N n$. By Lemma 2 with the property
$\lambda n\, .\,\Box\mathbb N n$: $\Box\mathbb N\mathbf{0}_e$ by
necessitation, and necessitating
$\forall n\, .\,\mathbb N n\to\mathbb N n^+$ then applying the converse
Barcan formula and K gives $\forall n\, .\,\Box\mathbb N n\to\Box\mathbb N n^+$.
This is Lemma 1 of the write-up for Possibility (pure) ⇒ Axiom of Infinity
(type t).

**Lemma 4.** $\forall m\,n\in\mathbb N\, .\,m\ne n\to\Box(I^*\to m\ne n)$.
By double induction. For $m=n=\mathbf{0}_e$ there is nothing to show. For
$m=\mathbf{0}_e$ and $n=i^+$, the conclusion follows from Lemma 3 and the
first conjunct of $I^*$. Assuming the result for $m=k$ and all $n$, take
$m=k^+$ and induct on $n$: the case $n=\mathbf{0}_e$ is symmetric to the
previous one, and for $n=j^+$ with $i^+\ne j^+$ we have $i\ne j$, so the
hypothesis gives $\Box(I^*\to i\ne j)$, and the second conjunct of $I^*$
gives $\Box(I^*\to i\ne j\to i^+\ne j^+)$, whence
$\Box(I^*\to i^+\ne j^+)$.

**Lemma 5.** $I\to I^*$. Since $I$ is $\Diamond I^*$, this is
$\neg I^*\to\Box\neg I^*$. If $m^+=\mathbf{0}_e$ for some number $m$, Lemma
3 and NI make that necessary. If $m^+=n^+$ with $m\ne n$ for numbers $m,n$,
NI and Lemma 4 give $\Box(I^*\to m^+=n^+\land m\ne n)$, and with Lemma 3,
$\Box(I^*\to\exists m\,n\in\mathbb N\, .\,m^+=n^+\land m\ne n)$, which is
$\Box\neg I^*$.

**Lemma 6.** $\forall m\,n\in\mathbb N\, .\,m\ne n\to\Box(I\to m\ne n)$.
Necessitate Lemma 5 and combine with Lemma 4.

**Lemma 7.** For numbers $m,n,o$, either $I$ necessitates
$\operatorname{Sum}(m,n,o)$ or $I$ necessitates its negation, and likewise
for $\operatorname{Prod}$. It suffices that $\operatorname{Sum}$ and
$\operatorname{Prod}$ are persistent on numbers, by a straightforward
induction unpacking their definitions, and that their negations are
necessitated by $I$, which follows from the source's Lemma 1 (Peano
arithmetic follows from $I$), Lemma 5 and Lemma 6: given $I^*$ the relations
are functional, so a non-instance is excluded by the instance that
$I^*$ forces.

**Lemma 8 (the only use of Countable Boolean Completeness).** Every property
that every number necessarily has is such that necessarily every number has
it:

$$
\forall X^{\nu t}\, .\,(\forall n\in\mathbb N\, .\,\Box Xn)\to\Box\forall n\in\mathbb N\, .\,Xn.
$$

*Proof.* Let $\mathbb N^{\{\cdot\}}:=\lambda X^{\nu t}\, .\,\exists n\in\mathbb N\, .\,X=\{n\}$,
where $\{n\}:=\lambda m\, .\,n=m$. It is countable, through the relation
holding between $\{n\}$ and $n$, so it has a least upper bound $B$. As $B$
is an upper bound, $\forall n\in\mathbb N\, .\,\Box\forall m\, .\,\{n\}m\to Bm$,
hence $\forall n\in\mathbb N\, .\,\Box Bn$ by NI, hence
$\forall n\in\mathbb N\, .\,\Box Bn^+$, so $\lambda n\, .\,Bn^+$ is also an
upper bound of $\mathbb N^{\{\cdot\}}$. Since $B$ is least, it necessitates
that property: $\Box\forall n\, .\,Bn\to Bn^+$. Also $\Box B\mathbf{0}_e$,
since $\{\mathbf{0}_e\}$ is an instance of $\mathbb N^{\{\cdot\}}$. By Lemma 2
inside the box, $\Box\forall n\, .\,\mathbb N n\to Bn$. Now let $X$ satisfy
$\forall n\in\mathbb N\, .\,\Box Xn$. Then $X$ is an upper bound of
$\mathbb N^{\{\cdot\}}$, so $\Box\forall n\, .\,Bn\to Xn$, and therefore
$\Box\forall n\in\mathbb N\, .\,Xn$. $\square$

Together with Lemma 3, Lemma 8 says that natural numberhood is a rigid
property in the source's sense: quantification restricted to it obeys both
the Barcan and the converse Barcan formula.

**Theorem 9.** For an arithmetical formula $A$ and variables $\vec n$ of type
$\nu$ including its free variables,
$\forall\vec n\in\mathbb N\, .\,\Box(I\to A)\lor\Box(I\to\neg A)$.

*Proof.* By induction on $A$. Atomic $\mathbb N\mathbf n$: Lemma 3.
$\operatorname{Sum}$ and $\operatorname{Prod}$: Lemma 7. Identities: NI for
the positive case and Lemma 6 for the negative. Negation, disjunction and
conjunction: K. For $\forall m\in\mathbb N\, .\,A$, the hypothesis gives
$\forall\vec n\in\mathbb N\, .\,\forall m\in\mathbb N\, .\,\Box(I\to A)\lor\Box(I\to\neg A)$,
so either every $m$ takes the first disjunct or some $m$ takes the second.
In the first case Lemma 8 gives $\Box(I\to\forall m\in\mathbb N\, .\,A)$;
in the second, Lemma 3 gives $\Box(I\to\neg\forall m\in\mathbb N\, .\,A)$.
$\blacksquare$

The Necessity of Arithmetic is the case of closed $A$.

## Notes

The source remarks (p. 13) that if $I$ fails it fails necessarily, so the
schema is then trivially true; the interest is in the case where the
axioms of arithmetic are possibly satisfied, which on the map's
instantiation means that $\operatorname{Suc}_e$ is possibly injective on
finite cardinalities. Maximalist Classicism grants that, since $I^*$ is
consistent with C, and it is exactly there that the schema bites: see
possibility-and-necessity-of-arithmetic-incompatible.

## Paper references

- **Proof: Arithmetic is Necessary.** Goodsell, Zachary William Lee. Arithmetic is Necessary. Draft dated 5 June 2024, 28 pages. Derives the necessity of arithmetic in the logic HKC (H plus K plus Countable Boolean Completeness) and shows that Boolean Completeness is inconsistent with the maximalization of any recursively enumerable extension of HK consistent with I, answering the question of Classicism, §2.6. Locators refer to this draft. — §5, Lemmas 2–8 and Theorem 9, pp. 14–21
