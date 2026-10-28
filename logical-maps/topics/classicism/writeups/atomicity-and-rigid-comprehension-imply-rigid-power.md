# Atomicity and Rigid Comprehension imply Rigid Power

Composed by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 19 October 2026, from Lemma C.6 of Andrew Bacon,
*Could the truths of mathematics have been different?* (draft of 9 October 2025, Appendix C.2,
pp. 15–16 of the separately paginated appendix), and the lemma, from Christopher Sun's *Possible
Worlds Without Atomicity*, that coextensive weakly rigid relations are identical (the proof of
rigid-comprehension-implies-tame-rigidity). Lean-verified the same day
(`lean/Classicism/Results/Arity.lean`, `atom_power_pullback`, `atom_rc_rigid_power_core` and
`atom_rc_rigid_power`; certificate `Classicism.Map.atomicity_and_rigid_comprehension_imply_rigid_power`,
with the necessitated form and the □BF consequence beside it).

Bacon's Leibniz Biconditionals say that every possible relation is entailed by a world relation, a
possible relation that entails every relation of its type or its negation; with the paper's unboxed
worlds this is the map's Atomicity (Background, strong and atoms). Lemma C.6 is stated there
with the relativized necessity $\Box_N$ and used for the Necessity of Analysis; here it is run with
$\Box$ itself, and its conclusion is turned into Rigid Power.

Fix a type tuple $\bar\sigma$, let $F^{\bar\sigma t}$ be rigid, and put
$P:=\lambda X^{\bar\sigma t}\,.\,\operatorname{Rigid}(X)\land X\le F$, of type $(\bar\sigma t)t$.
Recall that $W\le\mathcal Y$ is necessary pointwise implication, that an atom $W$ of a relational
type is non-bottom and lies below every $\mathcal Y$ of its type or below $\neg\mathcal Y$, and that
a weakly rigid relation is persistent (Background).

**Step 0 ($P$ is persistent).** Both conjuncts of $PX$ are necessitated conditions,
$\operatorname{Rigid}(X)$ by its definition and $X\le F$ as an identity, so $PX\to\Box PX$ holds at
every world, by 4 and NI.

**Step 1 (Lemma C.6).** Let $W$ be an atom of type $(\bar\sigma t)t$ with $W\le P$, that is,
$\Box\forall Y\,.\,WY\to\operatorname{Rigid}(Y)\land Y\le F$. Then there is a rigid $X\le F$ with
$\Box\forall Y\,.\,WY\to Y=X$.

*Proof.* By Rigid Comprehension at $\bar\sigma t$ let $X$ be rigid and coextensive with
$Q:=\lambda\bar x\,.\,F\bar x\land\Box\forall Y\,.\,WY\to Y\bar x$.

(a) $X\le F$. Every actual instance of $X$ is an instance of $F$, hence necessarily one, $F$ being
persistent; the weak inextensibility of $X$, applied to $F$, gives $X\le F$. So $PX$.

(b) $\Box\forall Y\,.\,WY\to\forall\bar x\,.\,X\bar x\to Y\bar x$. For an actual instance $\bar x$
of $X$, $Q\bar x$ gives $\Box\forall Y\,.\,WY\to Y\bar x$. The weak inextensibility of $X$, applied
to $\lambda\bar x\,.\,\forall Y\,.\,WY\to Y\bar x$, gives
$\Box\forall\bar x\,.\,X\bar x\to\forall Y\,.\,WY\to Y\bar x$, which is the claim.

(c) $\Box\forall Y\,.\,WY\to\forall\bar x\,.\,Y\bar x\to X\bar x$. Let $\bar x$ be an actual
instance of $F$. If $X\bar x$, then $\Box X\bar x$ by persistence. If not, then
$\neg\Box\forall Y\,.\,WY\to Y\bar x$, that is $W\not\le\lambda Y\,.\,Y\bar x$, so, $W$ being an
atom, $W\le\lambda Y\,.\,\neg Y\bar x$: $\Box\forall Y\,.\,WY\to\neg Y\bar x$. Either way
$\Box\forall Y\,.\,WY\to Y\bar x\to X\bar x$. The weak inextensibility of $F$, applied to
$\lambda\bar x\,.\,\forall Y\,.\,WY\to Y\bar x\to X\bar x$, gives
$\Box\forall\bar x\,.\,F\bar x\to\forall Y\,.\,WY\to Y\bar x\to X\bar x$. At any world, if $WY$ then
$Y\le F$, so by T every instance of $Y$ there is an instance of $F$, hence of $X$.

(d) At any world where $WY$: $Y$ is rigid, since $W\le P$; $X$ is rigid, rigidity being a
necessitated condition; and by (b) and (c) they are coextensive. Coextensive weakly rigid relations
are identical, a theorem of C, so $Y=X$ there. $\square$

**Step 2 ($P$ is weakly inextensible).** Let $\mathcal X^{((\bar\sigma t)t)t}$ satisfy
$\forall X\,.\,PX\to\Box\mathcal XX$, and suppose $P\not\le\mathcal X$: the property
$Q':=\lambda X\,.\,PX\land\neg\mathcal XX$ is possibly instantiated, so it is not bottom. Atomicity
at type $(\bar\sigma t)t$ gives an atom $W\le Q'$; then $W\le P$, and Step 1 gives a rigid $X\le F$
with $\Box\forall Y\,.\,WY\to Y=X$. Since $PX$, $\Box\mathcal XX$. But $W$ is possible: at some world
some $Y$ has $WY$, so $Y=X$ and, as $W\le Q'$, $\neg\mathcal XY$, that is $\neg\mathcal XX$,
contradicting $\Box\mathcal XX$.

**Step 3 ($P$ is rigid).** By Steps 0 and 2, $P$ is weakly rigid. Rigid Comprehension at
$(\bar\sigma t)t$ gives Tame Rigidity at that type (rigid-comprehension-implies-tame-rigidity): a
rigid relation coextensive with $P$ is identical to it. So $P$ is rigid, which is Rigid Power at
$\bar\sigma t$. $\blacksquare$

## Remarks

- Atomicity is used only at the type of the power property, and Rigid Comprehension at
  $\bar\sigma t$ (Step 1) and at $(\bar\sigma t)t$ (Step 3), all at the evaluation point; BF, B and
  5 do not appear. This answers the question left open in CANDIDATES.md, whether unboxed BF,
  Atomicity and Rigid Comprehension give Rigid Power: they do, and BF is not needed.
- Steps 0–2 use of $F$ only its persistence and weak inextensibility. So Atomicity at
  $(\bar\sigma t)t$ with Rigid Comprehension at $\bar\sigma t$ already gives the variant $(W,R,W)$ of
  CANDIDATES.md: the power property of every weakly rigid relation is weakly rigid.
- The argument is a derivation in C from instances of the two premises, so its necessitation gives
  □Atomicity and □Rigid Comprehension imply □Rigid Power
  (necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power), without the
  □BF of necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power.
- Atomicity at type $t$ does not suffice, even boxed and with □Rigid Comprehension: the stitched
  forcing model stitched-cohen-extension has □Atomicity (type $t$), □Rigid Comprehension and
  □Relational Choice, and Rigid Power fails in it.
