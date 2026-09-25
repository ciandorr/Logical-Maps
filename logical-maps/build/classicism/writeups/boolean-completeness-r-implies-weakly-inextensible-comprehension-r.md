# Boolean Completeness implies Weakly Inextensible Comprehension

Assume Boolean Completeness, with the map's fixed type range. The conclusion
is Weakly Inextensible Comprehension: every relation is coextensive with a
weakly inextensible one. This is an original connecting proof by Claude
Fable 5.1 (Anthropic), 25 September 2026, at Cian Dorr's direction. It has no
independent checker or Lean verification recorded. The witness is the least
upper bound of haecceities that Proposition 1 of Dorr, *Boolean Completeness
does not imply Rigid Comprehension* (30 July 2026 draft, p. 2) uses; there
Actuality is also assumed and yields a weakly rigid coextension, while here
Actuality is dropped and the join is cut down to the given relation.

## The shape of weak inextensibility

For a relation $Y$ of type $\tau=\bar\sigma t$, write
$\operatorname{Haec}_{\bar y}:=\lambda\bar z\, .\,\bigwedge_i z_i=y_i$ for
the haecceity of a tuple, and let $\operatorname{Haecs}(Y)$ be the property
of being the haecceity of some $Y$-instance,
$\lambda W^\tau\, .\,\exists\bar y\, .\,Y[\bar y]\land W=\operatorname{Haec}_{\bar y}$.
Since $\forall\bar z\, .\,\bigwedge_i z_i=y_i\to Z[\bar z]$ is H-equivalent
to $Z[\bar y]$, Logical Equivalence gives, for every $Z^\tau$,

$$
\operatorname{Haec}_{\bar y}\le Z\quad\text{iff}\quad\Box Z[\bar y].
$$

So the antecedent of weak inextensibility,
$\forall\bar x\, .\,Y[\bar x]\to\Box Z[\bar x]$, says exactly that $Z$ is an
upper bound of $\operatorname{Haecs}(Y)$, and

$$
\operatorname{WeaklyInextensible}(Y)\quad\text{iff}\quad
Y\le Z\text{ for every upper bound }Z\text{ of }\operatorname{Haecs}(Y).
$$

A weakly inextensible relation lies below every upper bound of the
haecceities of its instances: it may lose instances at other worlds, but it
cannot gain any beyond those that its actual instances necessitate. Weak
persistence, $\forall\bar x\, .\,Y[\bar x]\to\Box Y[\bar x]$, says by the
same equivalence that $Y$ is itself an upper bound of
$\operatorname{Haecs}(Y)$. Hence

$$
\operatorname{VeryWeaklyRigid}(Y)\quad\text{iff}\quad
Y\text{ is a least upper bound of }\operatorname{Haecs}(Y),
$$

and Very Weak Rigid Comprehension, equivalently Weak Rigid Comprehension,
says that for every $X$ the haecceities of the $X$-instances have a least
upper bound and that it is coextensive with $X$. Weak inextensibility keeps
only the "least" half of this. Two further sanity checks: at type $t$ the
principle is trivial, since a true proposition is weakly inextensible and
$\bot$ is a weakly inextensible coextension of any false one; and for
$X=\top$ the condition $\operatorname{WeaklyInextensible}(\top)$ unfolds to
$\forall Z\, .\,(\forall\bar x\, .\,\Box Z[\bar x])\to\Box\forall\bar x\, .\,Z[\bar x]$,
the Barcan Formula at the argument types, so the instance of the principle
at $\top$ is a relativised Barcan Formula.

## Proof

Fix $X^\tau$. Boolean Completeness in its least-upper-bound form, which is
equivalent to the recorded greatest-lower-bound form in C, gives $S^\tau$
with $\operatorname{LUB}_\tau(S,\operatorname{Haecs}(X))$. Put

$$
Y:=\lambda\bar z\, .\,S[\bar z]\land X[\bar z].
$$

*Coextension.* If $X[\bar y]$ then $\operatorname{Haec}_{\bar y}$ falls
under $\operatorname{Haecs}(X)$, so $\operatorname{Haec}_{\bar y}\le S$,
that is $\Box S[\bar y]$, and $S[\bar y]$ by T. Thus $X[\bar y]\to Y[\bar y]$,
and the converse is immediate.

*Weak inextensibility.* Suppose $\forall\bar z\, .\,Y[\bar z]\to\Box Z[\bar z]$.
If $X[\bar y]$ then $Y[\bar y]$, so $\Box Z[\bar y]$, so
$\operatorname{Haec}_{\bar y}\le Z$ by the displayed equivalence. Hence $Z$
is an upper bound of $\operatorname{Haecs}(X)$, and leastness gives
$S\le Z$. Since $Y\le S$ is a necessitated theorem, $Y\le Z$. $\square$

Only the least upper bound of the haecceities of the $X$-instances is used,
so a "haecceity completeness" principle restricted to such properties would
already suffice.

## What this places on the map

With the recorded implication from Actuality, Weakly Inextensible
Comprehension sits below two principles that the recorded models separate in
both directions:

- Boolean Completeness without Actuality: the symmetric all-surjections model
  and the symmetric range-gap model without Actuality.
- Actuality without Boolean Completeness: the finite-support
  identity-or-collapse, dyadic-rounding and truncated-shift models, and the
  coalesced sums.

So Weakly Inextensible Comprehension is strictly weaker than each of
Actuality and Boolean Completeness, and in particular it does not imply
Actuality. The guess that it might be equivalent to Actuality fails on the
Boolean Completeness side, where the join of the haecceities does the work
that the actual atom does on the other side. Under Actuality the two witnesses
differ: $\lambda\bar z\, .\,w\land X[\bar z]$ is weakly inextensible but not
persistent, while $\lambda\bar z\, .\,w\le X[\bar z]$ is persistent but need
not be weakly inextensible without B; only with Boolean Completeness, as in
Dorr's Proposition 1, does one witness do both.

## Paper references

- **Related: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Proposition 1, p. 2. The same least upper bound of haecceities is the witness there; with Actuality added it is also persistent and coextensive with X by itself. Here Actuality is not assumed and the join is cut down to X.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–25. Boolean Completeness; its least-upper-bound form is equivalent to the stated greatest-lower-bound form in C.
