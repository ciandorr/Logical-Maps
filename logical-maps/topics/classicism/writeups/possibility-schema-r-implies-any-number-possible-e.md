# Possibility (pure) ⇒ Any Number Possible (type e)

Assume Possibility (pure): every closed pure sentence consistent with C is
possible. The conclusion is Any Number Possible (type $e$),

$$
\Pi\;:=\;\forall Z^{(et)t}\, .\,\operatorname{FiniteCardinality}_e(Z)\to
\Diamond(\operatorname{Suc}_e Z)(\lambda x^e\, .\,\top),
$$

that there could be any positive number of individuals. The argument is
Cian Dorr's (20 September 2026); the successor shift and the consistency
model are supplied here. Since Possibility (pure) and Distinctness (pure)
are equivalent, Pure Maximalist Classicism implies $\Pi$.

**Why the successor.** The version with $\Diamond Z(\lambda x\, .\,\top)$
is refutable in C. Its instance at $\mathbf{0}_e$ is
$\Diamond\forall u^e\, .\,\neg\top$, and since C proves
$\exists u^e\, .\,u=u$ (Existence), the formula $\forall u\, .\,\neg\top$ is
H-equivalent to $\bot$, so Logical Equivalence makes
$\mathbf{0}_e(\lambda x\, .\,\top)=\bot$ and the instance says
$\bot\ne\bot$. Shifting by one successor keeps every finite cardinality in
play while asking only for positive numbers of individuals.

**Consistency.** $\Pi$ is closed and pure. It is true at the root of the
model *Coalesced sum: root over all finite individual domains*, which
satisfies C at every world; see that model's write-up. So $\Pi$ is
consistent with C, and Possibility (pure) gives $\Diamond\Pi$.

**Persistence.** Being a finite cardinality is persistent:
$\operatorname{FiniteCardinality}_e(Z)\to\Box\operatorname{FiniteCardinality}_e(Z)$
is a theorem of C. Let
$W:=\lambda Z\, .\,\Box\operatorname{FiniteCardinality}_e(Z)$.
$\operatorname{FiniteCardinality}_e(\mathbf{0}_e)$ is a theorem of H, so
Logical Equivalence makes it identical to $\top$, which is its box.
$\operatorname{FiniteCardinality}_e(Y)\to\operatorname{FiniteCardinality}_e(\operatorname{Suc}_eY)$
is likewise a theorem of H, since a property holding of $\mathbf{0}_e$ and
closed under $\operatorname{Suc}_e$ that holds of $Y$ holds of
$\operatorname{Suc}_eY$; its box and K give
$WY\to W(\operatorname{Suc}_eY)$. So $W$ holds of $\mathbf{0}_e$ and is
closed under $\operatorname{Suc}_e$, and
$\operatorname{FiniteCardinality}_e(Z)$ gives $WZ$.

**Discharging the diamond.** Let $Z$ be finite, so
$\Box\operatorname{FiniteCardinality}_e(Z)$. The instance
$\Pi\to(\operatorname{FiniteCardinality}_e(Z)\to\Diamond(\operatorname{Suc}_eZ)(\lambda x\, .\,\top))$
is a theorem of H, so its box holds and K turns $\Diamond\Pi$ into
$\Diamond(\operatorname{FiniteCardinality}_e(Z)\to\Diamond(\operatorname{Suc}_eZ)(\lambda x\, .\,\top))$.
With the boxed antecedent, K gives
$\Diamond\Diamond(\operatorname{Suc}_eZ)(\lambda x\, .\,\top)$, and axiom
4 for the defined necessity, recorded as a theorem of C, gives
$\Diamond(\operatorname{Suc}_eZ)(\lambda x\, .\,\top)$. So $\Pi$ holds.
$\blacksquare$

## Notes

The earlier record for the Infinity schema applied Distinctness to one
identity between numerals at a time, and its note explains why that reaches
only the schema. Here the consistency side condition is applied once, to a
single sentence quantifying over every finite cardinality; that is what
reaches the domain over which $\operatorname{FiniteCardinality}$ quantifies,
including cardinalities that no closed term names. The rest of the route to
the Axiom of Infinity at type $t$ is a theorem of C about $\Pi$, recorded
separately.
