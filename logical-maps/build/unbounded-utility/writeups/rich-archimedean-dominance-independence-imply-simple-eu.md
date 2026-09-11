# Simple EU from the more basic DU axioms

**Proved implication:** Rich Outcomes + Archimedean Outcomes + Stochastic
Dominance + Mixture Independence imply Simple Expected Utility.

Totality over arbitrary gambles is not assumed. Nor is Restricted Totality
or Simple EU assumed: comparison of all simple gambles is a conclusion.
Rich Outcomes and Archimedean Outcomes **alone** do not give this result.

**Source and contribution.** Goodsell's *Decision theory unbound*, §3.2,
pp. 678–681, supplies the utility calibration and finite-lottery representation;
§3.3, pp. 681–682, distinguishes DU from DTU. This is a small proof adaptation
and premise audit by GPT-6 (Codex), 9 September 2026, writing out why global
Totality is unnecessary in the mixture formulation. The original
source-attributed representation record is retained. No literature priority,
independent certification or Lean verification is claimed.

## Binary comparisons and law invariance

Stochastic Dominance includes its weak clause. Applying it in both directions
to equally distributed gambles gives Stochastic Equivalence. We may therefore
use identities in law for the fixed randomized-selection operation $M_p$.

For sure outcomes $a<b$, write

\[
B_{a,b}(p)=M_p(b,a),\qquad 0\le p\le1.
\]

The endpoint cases have the same laws as sure $a$ and sure $b$. If $p>q$,
every upper tail of $B_{a,b}(p)$ is at least that of $B_{a,b}(q)$, with a
strict difference at the outcome threshold $a$. Stochastic Dominance gives

\[
B_{a,b}(p)\succ B_{a,b}(q).
\tag{1}
\]

In particular, these binary gambles are comparable and have distinct values
for distinct probabilities. This follows from dominance, not a Totality axiom.

## A total, uniquely calibrated chart

Archimedean Outcomes applies separately in the three possible ranges of a
sure outcome $o$:

- For $0<o<1$, it gives $o\sim M_r(1,0)$ for some $0<r<1$.
- For $o>1$, it gives $1\sim M_p(o,0)$ for some $0<p<1$; set $r=1/p>1$.
- For $o<0$, it gives $0\sim M_p(1,o)$ for some $0<p<1$; set
  $r=-p/(1-p)<0$.

Use $u(0)=0$ and $u(1)=1$ at the references. These are precisely the three
clauses defining the normalized chart, so every outcome has a finite chart
value $u(o)$. Equation (1) makes the probability in each calibration unique.
It also places a nontrivial binary mixture strictly between its endpoints,
so a calibration cannot put an outcome in the wrong one of these three ranges.

## Finite lotteries reduce to common binary endpoints

Fix two simple gambles $X,Y$. Choose $a$ and $b$ as the minimum and maximum
of their finite ranges together with the reference outcomes $0,1$. Then
$a<b$. For every outcome $o$ in this interval, Archimedean Outcomes and (1)
give a unique $q(o)\in[0,1]$ such that

\[
o\sim B_{a,b}(q(o)).
\tag{2}
\]

Here $q(a)=0$ and $q(b)=1$ use the endpoint identities; only interior
outcomes require Archimedean Outcomes. Since sure outcomes have their
standing linear order, (1) and (2) imply that $q$ strictly preserves that
order. In particular, $q(1)>q(0)$.

Mixture Independence preserves indifference in a mixture branch.
Stochastic Equivalence permits interchange of the two branches and
reassociation of compound mixtures, so it also permits substitution in
the other branch. Inductively replace each outcome of a finite lottery
using (2), then flatten its finite compound mixture in law. If $X$ assigns
probabilities $\alpha_i$ to outcomes $o_i$, this yields

\[
X\sim B_{a,b}\!\left(\sum_i\alpha_iq(o_i)\right).
\tag{3}
\]

Discard zero-probability atoms by Stochastic Equivalence. A remaining
one-atom law is already sure; otherwise the inductive substitutions use
only mixture weights strictly between zero and one. No independence
assertion at weights zero or one is needed.

The same substitution and flattening applied to the chart calibrations
gives a common affine expression for all $o$ in the interval. Write
$r=u(o)$:

- If $0\le r\le1$, then
  $q(o)=r q(1)+(1-r)q(0)$.
- If $r>1$, then
  $q(1)=r^{-1}q(o)+(1-r^{-1})q(0)$.
- If $r<0$, put $p=-r/(1-r)$. Then
  $q(0)=p q(1)+(1-p)q(o)$.

In each case, uniqueness in (1) justifies equating the flattened
probabilities. Rearranging gives

\[
q(o)=q(0)+(q(1)-q(0))u(o).
\tag{4}
\]

Equations (1), (3) and (4), and $q(1)-q(0)>0$, now give

\[
X\succeq Y
\quad\Longleftrightarrow\quad
\mathbb E[u(X)]\ge\mathbb E[u(Y)].
\tag{5}
\]

All sums in this step are finite. This proves Restricted Totality as part
of the conclusion, without comparing arbitrary nonsimple gambles.

## Measurability and the role of Rich Outcomes

Apply the common-endpoint argument to any pair of sure outcomes and $0,1$.
Equation (4) shows that the global chart $u$ strictly preserves the outcome
order. Rich Outcomes supplies, for every $r\in\mathbb R$, an outcome
$o_r$ with $u(o_r)=r$. Therefore

\[
\{o:u(o)>r\}=\{o:o>o_r\}.
\]

These upper rays are measurable by the standing outcome-space convention.
The real upper rays generate the Borel sigma-algebra, so $u$ is measurable.
Together with chart totality and (5), this proves the complete recorded
Simple EU principle, including its measurability requirement.

## What changes in the map

DU now assumes Rich Outcomes, Archimedean Outcomes, Stochastic Equivalence,
Stochastic Dominance and Mixture Independence. This theorem derives Simple
EU. DTU adds Totality to the same preset. The former Simple-EU-based
formulation is equivalent, using the existing Simple EU ⇒ Archimedean
Outcomes result for the reverse implication.

The additional premises must not be dropped from the theorem record merely
because the DU background usually supplies them. The
[Two-sample minimum: zero extension](finite-two-sample-minimum.md) demonstrates why the
unqualified Rich + Archimedean Outcomes ⇒ Simple EU arrow would be false.

## Paper references

- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §3.2 pp. 678–681 and §3.3 pp. 681–682: utility calibration, finite expected utility and the DU/DTU distinction
