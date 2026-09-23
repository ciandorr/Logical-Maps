# Full action model: permutations of an infinite set

This note verifies the record `full-permutation-group-infinite-set`. The construction is the source's full $M$-set model (Classicism, §3.5, pp. 58–59; Bacon 2020, Appendix A.2), specialised to a group.

## 1. The model

Let $X$ be a countably infinite set and $G=\operatorname{Sym}(X)$ the group of all permutations of $X$, regarded as a one-object category whose arrows are the elements of $G$, composed as functions; write $ji$ for $j\circ i$ and $1$ for the identity. The domains are:

- $W^e=X$, with $i\cdot a=i(a)$;
- $W^t=\mathcal P(G)$, with the division action $i\cdot p=\{j : ji\in p\}$;
- $W^{\sigma\to\tau}=W^\sigma\Rightarrow W^\tau$, the function-space $M$-set: the functions $f:W^\sigma\to W^\tau$ such that $i\cdot a=i\cdot a'$ implies $i\cdot fa=i\cdot fa'$, with $(i\cdot f)(i\cdot a)=i\cdot(fa)$.

Application is function application, and the logical constants have their standard denotations: the Boolean operations act pointwise on sets of arrows, $\forall_\sigma(f)=\bigcap_{a\in W^\sigma}f(a)$, $[a=_\sigma b]=\{i : i\cdot a=i\cdot b\}$, and $[\Box p]=\{i : ji\in p\text{ for all }j\}$. A sentence is true at the arrow $i$ when $i$ belongs to the proposition it denotes; the evaluation point is $1$. By Classicism, Theorem 3.23 (soundness), every theorem of C is true at every arrow.

Constants of Σ, for the record: each relational constant denotes $\top_\tau=\lambda\bar x\, .\,G$, and each individual constant denotes one fixed $d\in X$.

**Lemma 1 (group facts).** For every arrow $i$ and type $\sigma$:

1. $i^\sigma:W^\sigma\to W^\sigma$, $x\mapsto i\cdot x$, is a bijection with inverse $(i^{-1})^\sigma$.
2. $W^\sigma\Rightarrow W^\tau$ is the set of all functions $W^\sigma\to W^\tau$, and $i\cdot f=i^\tau\circ f\circ(i^{-1})^\sigma$.
3. $[\Box p]=G$ if $p=G$ and $\emptyset$ otherwise; $[\Diamond p]=G$ if $p\ne\emptyset$ and $\emptyset$ otherwise.
4. $[a=b]=G$ if $a=b$ and $\emptyset$ otherwise.
5. $X\le_\tau Y$, that is $\Box\forall\bar x\, .\,X\bar x\to Y\bar x$, denotes $G$ if $X(\bar a)\subseteq Y(\bar a)$ for all $\bar a$ and $\emptyset$ otherwise; and a relational entity is $\bot_\tau$ exactly when it takes the value $\emptyset$ everywhere.

*Proof.* (1) $i\cdot(i^{-1}\cdot x)=(ii^{-1})\cdot x=x$. (2) The defining condition of the function-space $M$-set is vacuous, since $i\cdot a=i\cdot a'$ forces $a=a'$ by (1); the formula for $i\cdot f$ restates its definition. (3) As $j$ ranges over $G$ so does $ji$, so $ji\in p$ for all $j$ iff $p=G$; dually for $\Diamond$. (4) By injectivity of $i^\sigma$. (5) From (3) and the pointwise Boolean operations, since $\forall$ is intersection. $\square$

So the propositional modal logic is S5 with the arrows as worlds, and necessity, possibility, identity and entailment are all uniform: their truth values do not depend on the arrow.

**Lemma 2 (No Pure Contingency).** Every closed pure sentence true at $1$ is true at every arrow; more generally the denotation of a closed pure term is fixed by every arrow, and for a pure term $A$ with free variables and an assignment $g$, $i\cdot[A]^g=[A]^{i\cdot g}$.

*Proof.* This is the source's one-object observation (Classicism, §3.5, p. 58): the logical constants are fixed by every arrow (Bacon 2020, Proposition A.5, and the same computation for identity and the box), and the action commutes with application and abstraction, so the claim follows by induction on terms. $\square$

Consequently every boxed principle below follows from its unboxed form: the closed instances are pure sentences, true at $1$, hence true at every arrow, and $\Box P$ is true at $1$ iff $P$ is true at every arrow.

## 2. Principles that hold

**ND and $\Box$ND.** By Lemma 1(1) every $h^\sigma$ is injective, so ND$_\sigma$ holds by Classicism, Proposition 3.24(i); the necessitation follows by Lemma 2.

**BF and $\Box$BF.** Every $h^\sigma$ is surjective, so BF$_\sigma$ holds by Proposition 3.24(ii); $\Box$BF by Lemma 2 or by n. 84.

**5, B and their necessitations.** By Lemma 1(3), $[\Diamond p]\in\{\emptyset,G\}$, so $\Diamond p\to\Box\Diamond p$ denotes $G$; B follows from 5 and T.

**Atomicity and Actuality, necessitated.** Classicism, p. 61: the model is propositionally full. Explicitly, for $\tau=\bar\sigma\to t$ and $Y\ne\bot_\tau$ pick $\bar a$ and $h$ with $h\in Y(\bar a)$; the function taking $\bar a$ to $\{h\}$ and every other tuple to $\emptyset$ lies in $W^\tau$ by Lemma 1(2), is an atom under the pointwise order of Lemma 1(5), and lies below $Y$. At the arrow $i$ the proposition $\{i\}$ is true and entails every truth.

**Boolean Completeness, necessitated.** For $Z:\tau\to t$ the set $\{Y : i\in Z(Y)\}$ has a pointwise intersection, which lies in $W^\tau$ and is its greatest lower bound under $\le_\tau$ by Lemma 1(5), at every arrow $i$.

**Rigid Comprehension and Gallin Extensional Comprehension, necessitated.** Classicism, p. 61: the model is intensionally full. Explicitly, given $Y$ of type $\bar\sigma\to t$ let $Y'(\bar a)=G$ if $1\in Y(\bar a)$ and $\emptyset$ otherwise. Then $Y'$ is coextensive with $Y$ at $1$, and both $Y'$ and $\neg Y'$ take only the values $\emptyset$ and $G$, so both are persistent and $Y'$ is rigid. The same at every arrow.

**Functionality, necessitated; Tractarianism.** If $Xz=Yz$ is true at $i$ for every $z$ then $X(a)=Y(a)$ for all $a$ by Lemma 1(4), so $X=Y$ and $[X=Y]=G$. Tractarianism follows by the recorded result, or directly: if $p\subseteq X(a)$ for all $a$ then $p\subseteq\bigcap_aX(a)$.

**Plenitude, Functional Choice and Relational Choice, necessitated.** Let $U$ of type $\sigma\to\tau\to t$ be serial at the arrow $i$: for every $y$ some $z$ has $i\in U(y)(z)$. Choose such a $z$ for each $y$ (choice in the metatheory; when $U$ is functional the choice is forced); the resulting function $F$ lies in $W^{\sigma\to\tau}$ by Lemma 1(2) and $\forall y\, .\,(Uy)(Fy)$ is true at $i$. For Relational Choice take $S(y)(z)=[z=Fy]$, which is $G$ or $\emptyset$ by Lemma 1(4), so $S$ is functional at every arrow and $(Sy)z\to(Uy)z$ is true at $i$.

**Infinity.** Identity at $1$ is literal by Lemma 1(4), and since the model is full the set of numerals at each type is the extension of an element of the domain and is inductive, so $\operatorname{FiniteCardinality}_\sigma$ holds exactly of the numerals, and the $k$-th numeral holds of a property exactly when its extension has $k$ members. The extension of $\lambda u\, .\,\top$ is $X$ at type $e$ and $\mathcal P(G)$ at type $t$, both infinite, so the Axiom of Infinity holds at both types, and with it the Infinity Schema at type $e$: the individuals are pairwise distinct at $1$.

**No Pure Contingency** is Lemma 2; Necessity of Arithmetic follows by the recorded result.

**Converse Witnessed Possibility**, under any interpretation of Σ. Let $P$ be pure with free variables $\bar x$ and suppose $\Diamond P[\bar c]$ is true, so some arrow $i$ lies in $[P](\bar c)$. Then $1\in i\cdot[P](\bar c)=[P](i\cdot\bar c)$ by Lemma 2, so $P$ holds at $1$ of the entities $i\cdot\bar c$ and $\exists\bar x\, .\,P$ is true.

**No Contingency (signature Σ)**, under the record's interpretation.

**Lemma 3 (symmetries).** For a bijection $\beta$ of $X$ let $\Phi_e=\beta$, $\Phi_t=\mathrm{id}$, and $\Phi_{\sigma\to\tau}(f)=\Phi_\tau\circ f\circ\Phi_\sigma^{-1}$. Then $\Phi$ is a bijection of each domain, commutes with application, and fixes the denotation of every logical constant; hence $[A]^{\Phi\circ g}=\Phi[A]^g$ for every pure term $A$ and assignment $g$.

*Proof.* $\Phi_{\sigma\to\tau}$ is well defined and bijective by Lemma 1(2), and $\Phi(fa)=\Phi(f)(\Phi a)$ by construction. The Boolean operations and $\Box$ act on $W^t$, where $\Phi$ is the identity. $\Phi(\forall_\sigma)(f)=\forall_\sigma(\Phi^{-1}f)=\bigcap_a f(\Phi_\sigma a)=\bigcap_b f(b)=\forall_\sigma(f)$. $\Phi(=_\sigma)(a)(b)=[\Phi^{-1}a=\Phi^{-1}b]=[a=b]$ by Lemma 1(4). The last claim is by induction on terms. $\square$

Now let $S$ be a closed sentence of $\mathcal L(\Sigma)$. Replacing each relational constant by the closed pure term $\top_\tau$ that it denotes and each individual constant by a fresh variable gives a pure formula $P(x_1,\ldots,x_n)$ with $[S]=[P](d,\ldots,d)$. For any $a\in X$ choose a bijection $\beta$ with $\beta(d)=a$; by Lemma 3, $[P](a,\ldots,a)=\Phi[P](d,\ldots,d)=[P](d,\ldots,d)$. So $[S]=\bigcap_a[P](a,\ldots,a)=[\forall x\, .\,P(x,\ldots,x)]$, a pure sentence, and if $S$ is true it is necessary by Lemma 2. B for sentences of Σ and Modal Freedom (signature Σ) follow by the recorded results.

## 3. Principles that fail

**Fregean Axiom, Extensionality.** $\{1\}$ and $G$ are both true at $1$, so $\{1\}\leftrightarrow G$ is true, but $[\{1\}=G]=\emptyset$ by Lemma 1(4). Extensionality includes this nullary case.

**Possibility (pure)**, and with it Possibility+, Strong Possibility and Possibility (signature Σ). The sentence $\exists x\forall y\, .\,x=y$ is consistent with C, but $X$ has more than one element and identity is literal at every arrow, so it is false everywhere.

**Witnessed Possibility**, and with it Separated Structure, Distinctness (signature Σ) and Logical Necessity. Let $c$ be a relational constant of type $\tau$ and $P(x)$ the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$. Since $c$ denotes $\top_\tau$, $[P](c)=\emptyset$, so $\Diamond P[c]$ is false.

**Independence (signature Σ).** $c$ denotes what the closed pure term $\top_\tau$ denotes.

**Distinctness (pure).** $(\exists xy\, .\,x\ne y)=\top$ is true at $1$, since both sides denote $G$, and C does not prove it, having models with one individual.

**Distinctness-preserving collapse.** Let $p=\{1\}$, true at $1$. For any true $q$, $q\ne\emptyset$, so $[\Diamond q]=G$ by Lemma 1(3) and $[\Box(\Diamond q\to p)]=[\Box p]=\emptyset$. So no true $q$ witnesses $\Box_{\ne}p$.
