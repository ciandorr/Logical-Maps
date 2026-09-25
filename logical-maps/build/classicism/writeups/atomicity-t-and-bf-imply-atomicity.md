# Atomicity (type t) and BF imply Atomicity

Assume Atomicity at type $t$ and BF at every type. The conclusion is
Atomicity at every relational type $\tau=\sigma_1\cdots\sigma_n t$: every
$X^\tau$ with $X\ne\bot_\tau$ has an atom below it. The argument is Cian
Dorr's (23 September 2026); the verification of atomhood is written out
here. Notation and the lattice facts are as in Background: $Y\le_\tau X$ is
$\Box\forall\bar y\, .\,Y\bar y\to X\bar y$, $\bot_\tau=\lambda\bar y\, .\,\bot$,
$Y\le\neg Y$ iff $Y=\bot$, and $\operatorname{Atom}_\tau(Y)$ says that the
entities strictly below $Y$ are exactly $\bot$. We use Intensionality,
$\Box\forall\bar y\, .\,(Y\bar y\leftrightarrow X\bar y)\to Y=X$, a theorem of C,
and the fact that $\Box$ carries H-provable implications (necessitation
and K).

**Step 1: a possible instance.** Let $X\ne\bot_\tau$. By the contrapositive
of Intensionality, $\neg\Box\forall\bar y\, .\,(X\bar y\leftrightarrow\bot)$,
that is $\Diamond\exists\bar y\, .\,X\bar y$. BF at $\sigma_1,\ldots,\sigma_n$ in
its dual form $\Diamond\exists y\, .\,P\to\exists y\, .\,\Diamond P$, applied $n$
times, gives $\bar x$ with $\Diamond X\bar x$, that is $X\bar x\ne\bot$.

**Step 2: an atom below the instance.** Atomicity at type $t$ gives an atom
$w$ with $w\le X\bar x$. Put

$$
A:=\lambda\bar y\, .\,w\land\bar y=\bar x,
$$

where $\bar y=\bar x$ abbreviates $y_1=x_1\land\cdots\land y_n=x_n$.

**Step 3: $A\le X$.** We need $\Box\forall\bar y\, .\,(w\land\bar y=\bar x)\to X\bar y$.
From $w\le X\bar x$, that is $\Box(w\to X\bar x)$, this follows by K, since
$(w\to X\bar x)\to\forall\bar y\, .\,(w\land\bar y=\bar x\to X\bar y)$ is a
theorem of H by Leibniz's law.

**Step 4: $A$ is an atom.** First $A\ne\bot_\tau$: $A\bar x=w\land\bar x=\bar x=w\ne\bot$,
while $\bot_\tau\bar x=\bot$. Now let $Z\le A$; we show $Z=\bot_\tau$ or $Z=A$,
which is atomhood. From $Z\le A$ we get $Z\bar x\le A\bar x=w$, so by
atomhood of $w$ either $Z\bar x=\bot$ or $Z\bar x=w$.

*If $Z\bar x=w$, then $Z=A$.* By Intensionality it suffices to show
$\Box\forall\bar y\, .\,(Z\bar y\leftrightarrow A\bar y)$. One direction is $Z\le A$.
For the other, $Z\bar x=w$ gives $\Box(w\to Z\bar x)$, and
$(w\to Z\bar x)\to\forall\bar y\, .\,(w\land\bar y=\bar x\to Z\bar y)$ is a
theorem of H by Leibniz's law, so K gives $\Box\forall\bar y\, .\,(A\bar y\to Z\bar y)$.

*If $Z\bar x=\bot$, then $Z=\bot_\tau$.* Again by Intensionality it suffices
to show $\Box\forall\bar y\, .\,\neg Z\bar y$. We have $\Box\forall\bar y\, .\,(Z\bar y\to w\land\bar y=\bar x)$
from $Z\le A$ and $\Box\neg Z\bar x$ from $Z\bar x=\bot$. Under the box,
$Z\bar y$ gives $\bar y=\bar x$, hence $Z\bar x$ by Leibniz's law, against
$\neg Z\bar x$; so $\neg Z\bar y$. This is an H-provable consequence of the
two boxed premises, so K gives the boxed conclusion. $\square$

Only BF is used beyond C and the type-$t$ instance, and only at the argument
types of $\tau$, in Step 1. Conversely, no instance of BF is needed when
$n=0$, where the conclusion is the premise.

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–24. Definitions of Atom and the order; the source records Atomicity as a single principle across types and does not separate the type-t instance.
