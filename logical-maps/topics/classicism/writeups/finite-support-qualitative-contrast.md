# Finite-support action model: qualitative contrast

The Bacon–Dorr model at $W_0$ satisfies C5 and Plenitude but fails both
Relational Choice and Functional Choice. The choice failures below are a new
verification by OpenAI Codex (GPT-6), 24 September 2026, prompted by the
user's proposal to transfer Plenitude countermodels to Functional Choice.
The model itself is Bacon and Dorr's final construction in Appendix D of
*Classicism*, draft of 16 May 2023, p. 79.

## Construction and the relevant semantic facts

There are two objects $W_0,W_1$, each with individual domain $\mathbb N$.
The arrows between any pair of objects are all bijections between these
copies, composed as functions. The individual action is the natural one.
Propositions at $W_i$ are the finitely supported sets of arrows out of
$W_i$ subject to the additional condition

$$
h\in p,\quad h:W_i\longrightarrow W_0
\quad\Longrightarrow\quad
g\circ h\in p\quad\text{for every }g:W_0\longrightarrow W_0.
$$

Function types contain all finitely supported members of the corresponding
exponential action on these restricted domains. Here support has the sense
of Definitions D.1–D.3: if arrows with a common target agree on a finite
set $F$ of individuals, they have the same action on an entity supported
by $F$. In particular, any permutation fixing $F$ pointwise fixes that
entity. Application commutes with the actions, as in §3.4.

Two facts must be kept separate:

1. Every relation or operation has a finite support, although different
   entities may have different supports.
2. Every proposition $p\in W_0^t$ has constant truth value on the arrows
   $W_0\to W_0$: either it contains all those arrows or none. Thus, if a
   formula is true at $1_{W_0}$ with some parameters, it is true there
   again when all its parameters are transported by any such permutation.
   The parameters themselves need not be fixed by that permutation.

The second fact follows directly from the extra constraint, using inverses
for the converse. It is the reason this model differs from the ideally
full permutation model, where Relational Choice holds. An arbitrary
extension cannot be inserted at $W_0$ without respecting this constraint.

## A serial relation with no functional subrelation

For $P^{et}$, let $\operatorname{Two}(P)$ abbreviate

$$
\exists a^e b^e\, .\,a\ne b\land
\forall z^e\, .\,Pz\leftrightarrow(z=a\lor z=b).
$$

Fix an individual $d$. Ordinary comprehension gives the relation
$U^{(et)et}$ defined by

$$
(UP)x\quad\leftrightarrow\quad
\bigl(\operatorname{Two}(P)\land Px\bigr)
\lor\bigl(\neg\operatorname{Two}(P)\land x=d\bigr).
$$

It is serial at $W_0$: use a member of $P$ when it has exactly two members,
and $d$ otherwise. This is an admitted Relational Choice instance; a
relation may have individual outputs even though an operation may not.

Suppose $S^{(et)et}$ were a functional subrelation of $U$ at $W_0$.
Choose a finite support $F$ for $S$ and distinct $a,b$ outside
$F\cup\{d\}$. Put

$$
P_{a,b}:=\lambda z^e\, .\,z=a\lor z=b,
$$

and let $g$ transpose $a,b$, fixing every other individual. Then $gS=S$.
Also $gP_{a,b}=P_{a,b}$: transporting its parameters interchanges the two
disjuncts, which defines the same property by Logical Equivalence applied
to the H-theorem expressing commutativity of disjunction. This use of
Equivalence has no optional hypotheses.

Because $S$ is total and contained in $U$, its unique output at $P_{a,b}$
is one of $a,b$; call it $x$. Let $y$ be the other. The proposition
$(SP_{a,b})x$ is true at $1_{W_0}$. By the truth-invariance fact above,

$$
\bigl((gS)(gP_{a,b})\bigr)(gx)
=(SP_{a,b})y
$$

is true at $1_{W_0}$ as well. Both distinct individuals are therefore
$S$-outputs at the same input, contradicting functionality. Relational
Choice fails.

## Functional Choice with an admitted output type

The recorded theorem Functional Choice $\Rightarrow$ Relational Choice
already transfers this failure. Here is a direct relational-output
counterinstance, to make the type restriction explicit.

Write $H_x:=\lambda z^e\, .\,z=x$ for an individual's haecceity and define
$V^{(et)(et)t}$ by

$$
(VP)Q\quad\leftrightarrow\quad
\exists x^e\, .\,(UP)x\land Q=H_x.
$$

This relation is serial. If an operation $X^{(et)(et)}$ selected from it,
choose a finite support for $X$ and $a,b$ outside that support and
$\{d\}$. Again $gX=X$ and $gP_{a,b}=P_{a,b}$. Since the selected value is
either $H_a$ or $H_b$, equivariance of application would give

$$
XP_{a,b}=g(XP_{a,b})=H_y\ne H_x=XP_{a,b},
$$

where $x$ is the selected member and $y$ the other. The inequality is
literal inequality of domain elements: $H_a$ and $H_b$ differ on $a$ at
the identity arrow. This is a contradiction. The output type $et$ is
relational, so the counterinstance respects the map's type system.

Consequently the boxed forms of both choice principles fail too, by T.
No necessitation of an optional assumption is used.

## What transfers, and what remains open

Every arrow is invertible, giving C5 and the boxed Barcan schemata at all
types. The proposition consisting of all arrows $W_0\to W_0$ is the
least true proposition at $W_0$, giving Actuality. The source proves
that Actuality fails at $W_1$, so $\Box$Actuality and Atomicity fail at
$W_0$. The recorded implications from C5 plus Actuality give Boolean
Completeness and Rigid Comprehension, and hence Plenitude.

Thus even **C5 + Plenitude + Boolean Completeness + Rigid Comprehension**
does not imply Relational Choice or Functional Choice. The two Axioms of
Infinity already verified in the model can also be retained as premises.
These are countermodel claims, not incompatibility claims: other recorded
models satisfy those premises together with Functional Choice.

The general equivalence remains

$$
\text{Functional Choice}\quad\Longleftrightarrow\quad
\text{Relational Choice}\land\text{Plenitude}.
$$

It allows transfers when Relational Choice is verified. It does not allow
this model's failures of Atomicity and $\Box$Actuality to be transferred
to a model of Functional Choice. The corresponding implications with
Functional Choice as a premise remain unsettled by this verification.

## Check and attribution

`topics/classicism/checks/qualitative_contrast_choice.py` exhaustively
checks pair selectors on sets of two through five individuals. Every
selector requires a support containing all but at most one individual.
Finite sets still admit selectors; the contradiction in the countably
infinite construction is that every permitted support leaves two
individuals outside it. The finite check is a sanity check of the symmetry
obstruction, not a verification of the entire infinite higher-order model.

Construction and original positive and negative properties: Andrew Bacon
and Cian Dorr, *Classicism*, draft of 16 May 2023, §3.4 and Appendix D,
especially p. 79. The Relational Choice and Functional Choice failures
proved here are the new contribution; they have no independent checker
or Lean verification recorded.
