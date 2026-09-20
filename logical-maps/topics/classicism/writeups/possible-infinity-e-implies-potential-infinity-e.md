# Possible Infinity (type e) ⇒ Potential Infinity (type e)

The proof is schematic in a type $\sigma$; it is applied here with
$\sigma=e$, and the type-$t$ record reads it with $\sigma=t$. Cardinalities
have type $(\sigma t)t$ and their arguments type $\sigma t$. Write
$X\equiv X'$ for $\forall u\, .\,Xu\leftrightarrow X'u$, and $X-y$ for
$\lambda u\, .\,Xu\land u\ne y$. "Finite" means "falls under
$\operatorname{FiniteCardinality}_\sigma$". The persistence of being a
finite cardinality, Lemma 1 of the write-up for Any Number Possible
(type $e$) ⇒ Axiom of Infinity (type $t$), is used at the end.

**Lemma A (finite cardinalities respect coextension).** If $Z$ is finite,
$ZX$ and $X\equiv X'$, then $ZX'$.

*Proof.* By induction on $Z$ with
$W:=\lambda Z\, .\,\forall X\,X'\, .\,ZX\land X\equiv X'\to ZX'$. For
$\mathbf{0}$: $\mathbf{0}X$ says that $X$ has no instance, and then neither
has $X'$. Step: assume $WZ$ and $(\operatorname{Suc}Z)X$ with witness $y$,
so $Xy$ and $Z(X-y)$, and $X\equiv X'$. Then $X'y$ and $X-y\equiv X'-y$, so
$WZ$ gives $Z(X'-y)$, and $(\operatorname{Suc}Z)X'$ with witness $y$.
$\square$

**Lemma B.** If no finite cardinality holds of $\lambda u\, .\,\top$, then
every finite cardinality holds of some property.

*Proof.* By induction with
$W:=\lambda Z\, .\,\operatorname{FiniteCardinality}(Z)\land\exists X\, .\,ZX$.
For $\mathbf{0}$ take $\lambda u\, .\,\bot$. Step: assume $WZ$ with witness
$X$, so $ZX$. Since $Z$ is finite it does not hold of
$\lambda u\, .\,\top$, so by Lemma A, $X\not\equiv\lambda u\, .\,\top$:
there is $y$ with $\neg Xy$. Let $X^+:=\lambda u\, .\,Xu\lor u=y$. Then
$X^+y$, and $X^+-y\equiv X$ because $\neg Xy$, so Lemma A gives
$Z(X^+-y)$, whence $(\operatorname{Suc}Z)X^+$ with witness $y$. And
$\operatorname{Suc}Z$ is finite. $\square$

**The theorem.** Assume Possible Infinity at $\sigma$: possibly no finite
cardinality holds of $\lambda u\, .\,\top$. Let $Z$ be finite. By
persistence, $\Box\operatorname{FiniteCardinality}(Z)$. Lemma B is a
theorem of C, so its instance at $Z$,

$$
\neg\exists Z'\, .\,\operatorname{FiniteCardinality}(Z')\land Z'(\lambda u\, .\,\top)
\;\to\;\operatorname{FiniteCardinality}(Z)\to\exists X\, .\,ZX,
$$

is necessary, and K turns the premise into
$\Diamond(\operatorname{FiniteCardinality}(Z)\to\exists X\, .\,ZX)$; with
the boxed antecedent, K gives $\Diamond\exists X\, .\,ZX$. So every finite
cardinality possibly holds of some property. Applied to
$\operatorname{Suc}Z$, which is finite, this is the consequent of Potential
Infinity at $\sigma$, whose antecedent is not needed. $\blacksquare$

## Notes

The result proved is the unconditional
$\forall Z\, .\,\operatorname{FiniteCardinality}(Z)\to\Diamond\exists X\, .\,ZX$,
which is stronger than Potential Infinity. Axiom 4 is not used. Lemma A is
where Classicism's lack of Extensionality would bite if the induction were
run on coextensive properties directly; it is instead proved as a property
of finite cardinalities, using only that $\mathbf{0}$ and
$\operatorname{Suc}$ are defined by quantification over instances.
