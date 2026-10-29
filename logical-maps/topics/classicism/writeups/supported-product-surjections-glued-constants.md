# Supported-product action model with surjections of the individuals

Construction by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026 (§11 of
the note behind the base model). Checked, extended and written up for the map by Claude
Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.

This is a variant of the base model, the supported-product action model with free-monoid
coordinates and glued constants, whose write-up should be read first. The base model has
one individual. Here each arrow also carries a surjection of a large set of individuals.
That adds the Axioms of Infinity and keeps every verdict of the base model except two:

- Truths are ND-necessary fails (§5);
- Analytic Necessitism, in both forms, fails at type $e$ (§6), though it holds at every
  other type.

## The model

Fix an infinite cardinal $\kappa\ge\max(|\Sigma|,2^{\aleph_0})$. Let $I$ and $U$ be sets of
size $\kappa^+$, and $L$ the free monoid of finite words on an alphabet of size $\kappa$, with
empty word $\varepsilon$. The arrows are the pairs

$$
(m,s),\qquad m\in L^I,\quad s:U\to U\text{ onto},\qquad (m,s)(m',s'):=(mm',\,s\circ s'),
$$

forming a one-object category with identity $1:=(\varepsilon,\mathrm{id})$, the evaluation
point. For $S\subseteq I$, write $(m,s)\equiv_S(m',s')$ when $m|_S=m'|_S$ and $s=s'$.

**Domains.** $D_e:=U$, with $(m,s)\cdot a:=s(a)$. At a relational type
$\sigma_1\cdots\sigma_nt$, $D_\tau$ is the set of profiles
$F:\text{arrows}\to\mathcal P(D_{\sigma_1}\times\cdots\times D_{\sigma_n})$ with a
*support*: a set $S\subseteq I$ of size at most $\kappa$ such that $F_h=F_{h'}$ whenever
$h\equiv_Sh'$. So a profile depends on at most $\kappa$ coordinates of $m$, and arbitrarily on
$s$. Transport is $(h\cdot F)_k:=F_{kh}$, and the semantics is the base model's.

The base model's Lemma 1 holds as before: if $F$ has support $S$ and $h\equiv_Sh'$ then
$h\cdot F=h'\cdot F$, since $kh\equiv_Skh'$. An individual parameter $a$ contributes nothing to
the support, as $h\cdot a$ depends only on the surjection coordinate. So the domains are
closed under the denotations of terms, and this is a model of C. A closed pure sentence has
the same truth value at every arrow.

**Which arguments carry over unchanged.** The base model's propositions
$q_i=\{(m,s):m_i=\varepsilon\}$, its profiles $e_{z,j}$ and $p_x$, and every arrow its
arguments use can be taken with surjection coordinate $\mathrm{id}$, and the profiles do
not depend on the surjection. So the following arguments go through word for word:

- Atomlessness;
- the failures of Actuality and Vicinity;
- the failure of Weakly Inextensible Comprehension at $tt$;
- the failure of Boolean Completeness at $t$;
- □Countable Boolean Completeness;
- □Relational Choice, Transversal Choice and Modal Well-Ordering, by constant profiles,
  which every arrow fixes.

The rest of this write-up covers what needs adapting.

## 1. Transport is onto; □BF

Surjections are right cancellable: if $t\circ s=t'\circ s$ with $s$ onto, then $t=t'$.

**Lemma 2'.** For every arrow $h=(h_L,s_h)$ and $F\in D_\tau$ there is $G\in D_\tau$ with
$h\cdot G=F$.

*Proof.* Let $S$ support $F$. Put $G_{(n,r)}:=\varnothing$ unless $n_i$ ends with $(h_L)_i$
for every $i\in S$ and $r=t\circ s_h$ for some $t$, which is then unique. In that case put
$G_{(n,r)}:=F_{(n^\flat,t)}$, where $n^\flat$ strips the suffix $(h_L)_i$ from $n_i$ for
$i\in S$ and is $\varepsilon$ elsewhere. $G$ has support $S$, and

$$
(h\cdot G)_{(k,t)}=G_{(kh_L,\,t\circ s_h)}=F_{((kh_L)^\flat,\,t)}=F_{(k,t)} ,
$$

since $(kh_L)^\flat\equiv_Sk$. $\square$

At type $e$ transport is onto because the surjections are. So BF holds as in the base
model, at every type, and necessarily.

## 2. The Axioms of Infinity

As in the base model's §6, the actual instances of $\operatorname{FiniteCardinality}_\sigma$
are exactly the numerals $\operatorname{Suc}^n_\sigma(\mathbf 0_\sigma)$, and the $n$th holds
of exactly the properties with $n$ actual instances, by finite induction. The universal
property of individuals has $\kappa^+$ instances, so it has no finite cardinality, and the
Axiom of Infinity holds at $e$. By Atomlessness it also holds at $t$. Both are closed and
pure, so they hold necessarily.

## 3. Logical Necessity

**Gluing.** The base model's gluing lemma holds with arrows $h_\alpha:=(b_\alpha,\mathrm{id})$,
where $b_\alpha$ has the one-letter word $\alpha$ at the fresh coordinate $j$ and $\varepsilon$
elsewhere. This works because $kh_\alpha\equiv_{I\setminus\{j\}}kh$ in the $L$-coordinate and
leaves the surjection unchanged.

**The interpretation of Σ.** The individual constants $c$ denote distinct individuals
$a_c$, chosen so that $\kappa^+$ individuals are left over. For each $\mathcal L(\Sigma)$-
sentence $\varphi_\alpha$ that is true at $1$ under some interpretation of Σ, choose such an
interpretation $J_\alpha$. Then:

1. Extend $a_c\mapsto J_\alpha(c)$, for the individual constants $c$, to a surjection
   $s_\alpha$, sending the leftover individuals onto $U$.
2. For each relational constant $c$, use Lemma 2' to choose $B_{\alpha,c}$ with
   $(\varepsilon,s_\alpha)\cdot B_{\alpha,c}=J_\alpha(c)$. The lift does not enlarge supports.
3. Choose $j$ outside all these supports, and let $G_c$ glue the $B_{\alpha,c}$ at $j$.

The coordinates commute: $(b_\alpha,s_\alpha)=(\varepsilon,s_\alpha)(b_\alpha,\mathrm{id})$.
So at the arrow $(b_\alpha,s_\alpha)$ every constant takes its $J_\alpha$-value at once:

- $s_\alpha(a_c)=J_\alpha(c)$ for the individual constants;
- $(\varepsilon,s_\alpha)\cdot B_{\alpha,c}=J_\alpha(c)$ for the relational ones.

The rest is the base model's §7: $\Diamond\varphi$ holds at $1$ iff $\varphi$ is true under
some interpretation of Σ, and this gives Logical Necessity.

## 4. Exact images, Tame Rigidity, Rigid Power, Rigid Rigidity

For a set $E$ of argument tuples, let $H_E$ be the profile $h\mapsto h\cdot E$.

**Lemma 3'.** A supported $Y$ with $E=Y_1$ is weakly rigid iff $Y=H_E$, and then it is rigid.

*Proof.* The direction from $Y=H_E$, and rigidity, are as in the base model. Conversely, let
$Y$ be weakly rigid with support $S$. For $T\subseteq I$ with $|T|\le\kappa$ put

$$
B_T(E)_{(k,t)}:=\bigcup\{(n,t)\cdot E:\ n|_T=k|_T\},
$$

with the surjection held fixed. It has support $T$, and each member of $E$ is necessarily in
it, so $Y\le B_T(E)$. Let $\bar b\in Y_{(m,s)}$, and let $T$ contain $S$ and the supports of
the relational entries of $\bar b$. Then $\bar b=(n,s)\cdot\bar a$ for some $\bar a\in E$ and
$n|_T=m|_T$. Take the base model's $r,u\in L^I$, with $mr=un$, and put
$\hat r:=(r,\mathrm{id})$ and $\hat u:=(u,\mathrm{id})$. Then

$$
(m,s)\hat r=(mr,s)=(un,s)=\hat u(n,s).
$$

$\hat r\equiv_S1$, so $Y_{\hat r}=E$, and weak persistence gives $\hat r\cdot\bar a\in E$.
$\hat u$ fixes $\bar b$: it fixes the individuals, its surjection being $\mathrm{id}$, and the
relational entries, being $\varepsilon$ on their supports. So

$$
\bar b=\hat u(n,s)\cdot\bar a=(m,s)\cdot(\hat r\cdot\bar a)\in(m,s)\cdot E .\qquad\square
$$

**□Tame Rigidity** follows as before.

**Rigid Power fails at $(tt)t$.** The base model's argument goes through. The profiles
$e_{z,j}$ and $y_j$ ignore the surjection, so $h\cdot E$ depends only on $|m_o|$, and the
arrows $a$ and $b_j$ can be taken with surjection $\mathrm{id}$. In the final step,
$b_j\equiv_S1$ gives $Y_{b_j}=Y_1$ as before.

**□Rigid Rigidity.** We need the lifting lemma again: for every rigid $Y$ and arrow
$k=(k_L,k_s)$, there is a rigid $X$ with $k\cdot X=Y$. By Lemma 3', $Y=H_D$; let $S$
support it. Fix a section $\iota$ of $k_s$, so that $k_s(\iota(a))=a$; this uses choice.
Lift each entry of a tuple of $D$:

- an individual $a$ to $\iota(a)$;
- a relational entry $q$ to $\Lambda(q)$, where
  $\Lambda(q)_{(n,r)}:=q_{(n^\flat,t)}$ when $n_i$ ends with $(k_L)_i$ on $S$ and
  $r=t\circ k_s$, and $\varnothing$ otherwise.

Let $k''$ be $k_L$ off $S$ and $\varepsilon$ on $S$. As in Lemma 2',
$k\cdot\Lambda(q)=(k'',\mathrm{id})\cdot q$. Also $k\cdot\iota(a)=a=(k'',\mathrm{id})\cdot a$. So
the set $C$ of lifted tuples has $k\cdot C=(k'',\mathrm{id})\cdot D$. That is $D$, because
$(k'',\mathrm{id})\equiv_S1$.

$\Lambda$ commutes with arrows of the form $(m_{\bar S},\mathrm{id})$ with $m_{\bar S}$
$\varepsilon$ on $S$, and such arrows fix $D$ and the individuals. So $(m,s)\cdot C$ depends
only on $m|_S$ and $s$. Hence $H_C$ is supported by $S$, and it is rigid by Lemma 3', with
$k\cdot H_C=Y$. The rest of the base model's argument is unchanged.

## 5. Truths are ND-necessary fails

Let $p:=\{(m,s):s=\mathrm{id}\}$, a true proposition with empty support. Let $q$ be any truth,
and let $\pi\ne\mathrm{id}$ be a permutation of $U$. Then $\Diamond q$ holds at
$(\varepsilon,\pi)$, because $(\varepsilon,\pi^{-1})(\varepsilon,\pi)=1\in q$. But $p$ is
false there. So $\Box(\Diamond q\to p)$ fails for every true $q$, and $p$ is not
ND-necessary.

In the base model $q_S$ witnessed the ND-necessity of $p$, since $\Diamond q_S=q_S$. That relied on the
free monoid having no invertible elements other than $1$. The permutations here are
invertible.

**The varieties of necessity coincide.** For $S\subseteq I$ of size at most $\kappa$, put

$$
V_S:=\{(m,s):\ m_i=\varepsilon\text{ for all }i\in S,\ s\text{ a bijection}\}.
$$

Let $q$ be a truth with support $S$. Then $V_S\le\Diamond q$: for $(m,s)\in V_S$, the arrow
$(\varepsilon,s^{-1})(m,s)=(m,\mathrm{id})$ agrees with $1$ on $S$, so lies in $q$. For the
truth $\{(m,s):m|_S=\varepsilon,\ s=\mathrm{id}\}$ there is equality. A left factor cannot
empty a nonempty word, and $t\circ s=\mathrm{id}$ forces $s$ to be injective. So

$$
\Box_{\ne}p\iff V_S\le p\text{ for some }S .
$$

So $\Diamond_{\ne}r$ holds iff $r$ meets every $V_S$. Now evaluate $\Diamond_{\ne}q$ at an
arrow $h=(h_L,s_h)$, with $q$ a truth of support $T$. That means asking whether $h\cdot q$ meets
every $V_S$. It is enough to look at $S\supseteq T$. There, a member $(m,\pi)$ of $V_S$ lies in
$h\cdot q$ iff $(mh_L,\pi\circ s_h)\in q$, iff $(h_L,\pi\circ s_h)\in q$. So $\Diamond_{\ne}q$
holds at $h$ iff $(h_L,\pi\circ s_h)\in q$ for some permutation $\pi$: it is $q$ closed under
permutations of the surjection coordinate. The closure of a truth with support $T$ includes
$V_T$, with equality for the truth above. So

$$
\hat{\hat\Box}p\iff\text{some truth }q\text{ has }\Box(\Diamond_{\ne}q\to p)\iff V_S\le p\text{ for some }S\iff\Box_{\ne}p .
$$

So $\Box_{\ne}$ is identical to its hat, hence to $\Box_5$ (Background, *Hats, two-hat
necessity and 5-necessity*). The principles saying that two of these operators agree
therefore hold, necessarily, while those saying that every truth is necessary in one of these
senses fail, with $p$ as above.

## 6. Arithmetic and Analytic Necessitism

**Arithmetic Necessitism** holds as before: $\mathbb N_\sigma$ and the numerals are closed
pure terms, so every arrow fixes them.

**Analytic Necessitism fails at $e$.** A real number structure at $e$ exists at $1$:
$|U|\ge2^{\aleph_0}$, and every set of tuples of individuals is the extension of a constant
profile. So the antecedent $\Diamond\exists\mathfrak R\,.\,\operatorname{Real}_e(\mathfrak R)$
holds.

But no structure at $e$ is rigid. Its carrier has two distinct actual instances $a$ and $b$.
Take a surjection $s$ with $s(a)=s(b)$. At $(\varepsilon,s)$ we have $a=b$, since identity
there is identity of the transports. So the instances of the carrier are not necessarily
distinct. Both Analytic Necessitism and its second-order form therefore fail.

If $|U|<2^{\aleph_0}$, no real number structure on individuals would be possible at any
arrow, and both principles would hold at $e$ trivially. The choice $\kappa\ge2^{\aleph_0}$
is made so that the verdict does not depend on $\Sigma$.

**Analytic Necessitism holds at every other type.**

- *Every relational type other than $t$.* There are at least $2^{\kappa^+}$ constant
  profiles, all fixed by every arrow and pairwise distinct. With $n\ge1$ arguments, constant
  profiles of distinct sets of $n$-tuples of individuals are already enough. Put a real
  structure on continuum many of them with constant relations. Take as represented powers
  the constant profiles of all constant relations among them. Every parameter is then fixed
  by every arrow, so whatever holds of them at $1$ holds at every arrow, and the base model's
  argument applies.
- *At $t$*, the base model's argument applies unchanged. It uses the propositions
  $p_x=\{(m,s):\#_a(m_o)-\#_b(m_o)\in x\}$, $x\subseteq\mathbb Z$, which every arrow shifts
  injectively, and their exact images, which are supported by $\{o\}$ and rigid by Lemma 3'.

## Remarks

1. **Choice.** As in the base model, Logical Necessity, the choice principles and the
   failure of Boolean Completeness at $t$ use choice in the metatheory, and so does Rigid
   Rigidity, through the section $\iota$.
2. **Size of $\kappa$.** Astra's note takes $\kappa\ge|\Sigma|$. Only the verdict on Analytic
   Necessitism at $e$ uses $\kappa\ge2^{\aleph_0}$. For countable $\Sigma$, the construction
   should also work with $\kappa=\aleph_0$, $I$ of size $\aleph_1$ and $U$ countable, leaving
   infinitely many individuals besides the $a_c$. In that version both forms of Analytic
   Necessitism hold.
