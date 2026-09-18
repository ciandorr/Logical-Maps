# Boxed Atomicity, Boolean Completeness and BF imply Rigid Comprehension

Assume boxed Atomicity, Boolean Completeness
and BF, with the map's fixed type range. The conclusion is Rigid Comprehension. This is
Proposition 2.11 of Bacon and Dorr, *Classicism* (16 May 2023 draft), p. 30,
with the proof in note 42.

Here is the unary case from that proof. Let $X$ be a property. Let $F$
be the property of being the haecceity of an $X$-instance, and let $X^*$
be the least upper bound of $F$. Boolean Completeness supplies this
upper bound by Boolean duality. We verify that $X^*$ is a rigid
coextension of $X$.

If $Xz$, the haecceity of $z$ belongs to $F$ and entails $X^*$, so $X^*z$.
For the converse, boxed Atomicity gives Atomicity by T; together with BF,
Proposition 2.7 gives Actuality. Let $w$ witness Actuality. The property
$\lambda y\, .\,w\to Xy$ is an upper bound of $F$: for an $X$-instance
$z$, $w$ entails $Xz$, and identity elimination gives the required
necessary conditional for its haecceity. Minimality of $X^*$ now gives
$X^*\le\lambda y\, .\,w\to Xy$. Since $w$ is true, $X^*z$ entails $Xz$
materially. This proves coextension.

For persistence, every haecceity in $F$ entails $X^*$. NI therefore makes
it entail $\lambda y\, .\,\Box X^*y$ as well. This last property is
another upper bound of $F$. Minimality gives
$X^*\le\lambda y\, .\,\Box X^*y$.

For inextensibility, fix $Y,z$. Suppose, towards contradiction,

$$
\Diamond\bigl((\forall x\, .\,X^*x\to\Box Yx)
  \land\Diamond(X^*z\land\neg Yz)\bigr).
$$

Use Atomicity to choose an atom $w$ below the displayed possible
proposition. Boxed Atomicity supplies an atom beneath the further
possible $X^*z\land\neg Yz$. BF brings a witness $w'$ into the present
domain so that $w$ entails

$$
(\forall x\, .\,X^*x\to\Box Yx)\land
\operatorname{Atom}_t(w')\land w'\le(X^*z\land\neg Yz).
$$

Use Boolean Completeness to normalize this witness as in note 42:
replace it by the greatest lower bound of the propositions $p$ such that
$w\le(p=w')$. The replacement remains identified with the old witness
under $w$ and is itself the greatest lower bound of its corresponding
identity class. Denote this normalized witness again by $w'$.

Set $H=\lambda x\, .\,w'\to Yx$. For any $u$ satisfying $Xu$,
coextension and persistence give $\Box X^*u$. Thus $w$ entails $X^*u$,
then $\Box Yu$, and hence $w'\le Yu$. The normalization makes the last
entailment hold outright: $w$ identifies $w'$ with $w'\land Yu$, so
$w'\land Yu$ lies in the class whose greatest lower bound is $w'$.
It follows that $w'\le w'\land Yu$, and consequently $w'\le Yu$.
Thus $\Box Hu$.

NI now shows that every haecceity in $F$ entails $H$. Hence $H$ is an
upper bound of $F$ and $X^*\le H$. But $w'$ is possible (it is possibly
an atom) and entails $X^*z\land\neg Yz$. Together with $X^*\le H$,
this would make it entail $Yz$ as well, a contradiction.

We have proved the necessary conditional for arbitrary $Y,z$. BF closes
these object variables under the box to give the Inextensible condition.
Together with persistence this makes $X^*$ rigid. For a relation with
several arguments, use tuple-haecceities, replace the displayed variable
by that finite tuple, and apply the corresponding BF instances; the
same upper-bound argument applies. Empty tuples give the propositional
case.

The source's note 42 cites Proposition 2.6 when obtaining Actuality.
The derivation above uses Proposition 2.7, which has the required
assumptions without adding C5. The normalization step is the one supplied
in note 42, not an assumption of choice or of necessary completeness.

Mathematical source: Andrew Bacon and Cian Dorr. Recorded by OpenAI Codex
(GPT-6), 17 September 2026. No independent checker or Lean verification
is claimed.

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — Proposition 2.11, p. 30 and n. 42
