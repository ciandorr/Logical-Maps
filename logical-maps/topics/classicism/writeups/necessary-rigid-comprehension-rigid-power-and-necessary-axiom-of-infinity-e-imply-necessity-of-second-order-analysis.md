# □Rigid Comprehension, Rigid Power and □Axiom of Infinity imply the Necessity of Second-Order Analysis

The idea is Cian Dorr's (30 October 2026). If the numbers are rigid, Rigid Power makes the rigid
properties of numbers, the reals, a rigid property, and then makes the rigid properties of reals a rigid
property. Under □Rigid Comprehension every real, and every class of reals, at any world is one of these,
so there can be no new reals and no new sets of reals.

The argument is Barton and Goodsell's (*Continuum Contingency*, §§5.6–5.9, Theorems 2–7). In their CR∞,
□Rigid Comprehension with their axiom of Infinity, the one missing ingredient is the inextensibility of
the reals and of the classes of reals; Rigid Power supplies it. Written out by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr. Not Lean-verified.

Fix the type $\sigma$ of the infinity premise ($e$ here, $t$ in the companion record), and write
$\mathbb N:=\mathbb N_\sigma$ for the finite cardinalities at $\sigma$, of type $\nu_\sigma$. Assume
□Rigid Comprehension, Rigid Power, and $\Box\operatorname{AxInf}_\sigma$. "At every world" means at
every world accessible from the actual one. Rigid Power is used only at the actual world, and only at
two instances.

## 1. The numbers

$\Box\operatorname{AxInf}_\sigma$ gives $\Box I^*_\sigma$ ([[necessary-infinity-injective-successor]]).
So □Rigid Comprehension gives Arithmetic Necessitism at $\sigma$
([[necessary-rigid-comprehension-implies-arithmetic-necessitism]], Barton and Goodsell's Theorem 3):
$\mathbb N$ is rigid and its members are necessarily distinct. Arithmetical sentences are then
non-contingent, and all the second-order Peano axioms hold at every world, by their Theorem 2.

## 2. The reals

Let $R:=\lambda X^{\nu_\sigma t}\, .\,\operatorname{Rigid}(X)\land X\le\mathbb N$, the rigid properties of
numbers. Rigid Power at the rigid $\mathbb N$ says that $R$ is rigid.

Distinct reals are necessarily distinct (Barton and Goodsell's Theorem 4). Two coextensive rigid
properties are identical (Background), so distinct reals $X,Y$ differ on some number $n$, say $Xn$ and
$\neg Yn$. Then $\Box Xn$, by persistence. And $\Box\neg Yn$: every instance of $Y$ is a number other
than $n$, hence necessarily other than $n$, so weak inextensibility puts $Y$ below
$\lambda x\, .\,x\ne n$.

**No new reals.** At any world $u$, take a property $G$ of numbers. By Rigid Comprehension at $u$, $G$
is coextensive there with a rigid $X$. The instances of $X$ are numbers, and numbers are necessarily
numbers, so weak inextensibility at $u$ gives $X\le\mathbb N$, and $RX$ holds at $u$. Since $R$ is
rigid, $X$ is one of the actual reals. So at every world, every property of numbers is coextensive with
an actual real.

## 3. Classes of reals, and relations among them

Let $\mathcal P R:=\lambda Y\, .\,\operatorname{Rigid}(Y)\land Y\le R$. Rigid Power at the rigid $R$
says that $\mathcal P R$ is rigid. Its members are necessarily distinct, by the argument of §2 using the
necessary distinctness of reals (their Theorem 6). The argument of §2, one type up, shows that at every
world every property of reals agrees on the reals with an actual member of $\mathcal P R$.

Relations reduce to classes, as in Barton and Goodsell's §5.7:
- Pairs of reals are coded by reals: $X\oplus Y$ holds of $2n$ iff $Xn$ and of $2n+1$ iff $Yn$. At each
  world this is a property of numbers, so it is coextensive with a real, by §2.
- Numbers are coded by reals, as singletons.

So at every world, every relation of finite arity among reals and numbers agrees on them with a relation
coded by an actual member of $\mathcal P R$.

## 4. The canonical real number structure

Fix an arithmetical coding of the ordered field. For example, code the rationals in $\mathbb N$, let the
canonical reals $X_{\mathbb R}$ be the members of $R$ that are Dedekind cuts, and define $\le$, $+$,
$\times$, $0$, $1$ and the natural numbers of the field by formulas that quantify only over $\mathbb N$
and $R$.

**It is necessarily a real number structure.**
- At any world it is an ordered field, by second-order arithmetic (Theorem 2, using Rigid Comprehension
  there).
- It is complete there. A nonempty bounded subproperty $S$ of $X_{\mathbb R}$ has as its union
  $\lambda q\, .\,\exists x\, .\,Sx\land xq$, a property of numbers. By §2 that union is coextensive with
  an actual real, which is a cut and is the least upper bound of $S$.

**Its components are rigid.** They are defined from rigid properties by formulas whose atomic parts are
non-contingent, and they are restricted to rigid domains.

## 5. Non-contingency

Take a second-order analytical sentence $A$.
- By §3, at every world, $A$ read in the canonical structure is equivalent to a sentence $A^*$ of
  Barton and Goodsell's second order. Its first-order variables range over $\mathbb N$ and $R$, its
  second-order variables over $\mathcal P R$, and its atomic formulas are memberships and identities.
- By their Theorem 7, $\Box A^*\lor\Box\neg A^*$:
  - the atomic formulas are non-contingent, by rigidity and necessary distinctness;
  - Boolean combinations of non-contingent formulas are non-contingent;
  - a quantifier restricted to a rigid property with a non-contingent matrix gives a non-contingent
    formula.
- So $A$ is non-contingent in the canonical structure.

Finally, compare with an arbitrary real number structure. At any world, any real number structure, at
any type, is isomorphic to the canonical one there (Huntington's theorem, in the non-modal fragment).
Isomorphic structures agree on second-order analytical sentences, because relations transfer along the
isomorphism by composition, which Ordinary Comprehension supplies. Hence
$\Box\forall\mathfrak R\, .\,\operatorname{Real}(\mathfrak R)\to A(\mathfrak R)$ or the same with
$\neg A$. $\square$

## Remarks

- **Only one infinite type is needed.** Every comparison of structures is made within a world, so one
  type with necessarily infinitely many members suffices. That is why the record holds with
  □Axiom of Infinity at $e$ and, by the same proof, at $t$. The two premises are independent.
- **The box on Rigid Comprehension is needed.** With Rigid Comprehension only at the actual world, a
  world can have a property of numbers coextensive with no rigid property there: a new real that Rigid
  Power does not constrain. [[full-boolean-valued-atom-and-atomless]] has Rigid Comprehension, Rigid
  Power, □Rigid Power and Arithmetic Necessitism, and refutes the Non-contingency of CH.
- **Rigid Power is needed.** Barton and Goodsell's stitched models satisfy □Rigid Comprehension, their
  Infinity and Arithmetic Necessitism, and refute it, as they must.
- **The infinity premise may not be.** Whether it can be dropped is open. Bacon's Theorem 5.2 gets the
  same conclusion from Atomicity and □Rigid Comprehension with no infinity premise, by relativizing to
  worlds with a natural number structure, and its use of Atomicity is essentially to get Rigid Power.
