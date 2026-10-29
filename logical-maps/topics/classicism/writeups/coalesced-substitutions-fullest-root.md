# Coalesced sum: interpretation and substitution arrows, fullest root

Cian Dorr suggested this model on 29 October 2026: coalesced-pinned-substitutions-root
without the finite pinning. He also identified ND-possibility and 5-possibility at the
root with truth at an injective and at a bijective substitution. Claude Opus 5.5
(Anthropic) wrote the verification. No second reader has checked it, and no Lean
verification is claimed.

## It is a model of C

The root's entities are all intensions over the arrows out of $W_0$ whose transports
along the arrows $\langle V,I\rangle$ land in the component domains.

- **Transport along a map.** For a map $f$, $(f\cdot F)(m)=F(m\circ f)$. Its transport
  along $\langle V,I\rangle$ is the transport of $F$ along
  $\langle V,I\rangle\circ f=\langle V,I\circ f\rangle$, so it lands.
- **Comprehension.** The denotation at $W_0$ of a term with parameters $\bar P$ has as
  its transport along $\langle V,I\rangle$ the denotation at $V$ of the same term with
  parameters $\langle V,I\rangle\cdot\bar P$, because transport commutes with the
  operations. That denotation is in $V$'s domain, the component being a model.
- **The entities $\hat c$.** $f\cdot\hat c=\widehat{f(c)}$: both have transport
  $I(f(c))$ along $\langle V,I\rangle$ and are empty at every map.

This is the argument for coalesced-maximalist-root, whose root domains are likewise as
full as landing allows, with the substitutions added.

## Necessity at the root

Write $a:=\{1_{W_0}\}$. It is in the domain, since its transport along a map $f$ is
$\{m:m\circ f=1_{W_0}\}$ and along every $\langle V,I\rangle$ it is empty. It is true and
entails every truth, so Actuality holds, with $a$ the actual world.

**ND-necessity.** Since $a$ is the strongest truth,
$\Box_{\ne}p\leftrightarrow\Box(\Diamond a\to p)$.

- At $\langle V,I\rangle$, $\Diamond a$ fails, since no arrow leads back to $W_0$.
- At a map $k$, $\Diamond a$ holds iff $m\circ k=1_{W_0}$ for some map $m$, that is,
  iff $k$ is injective (every type has constants, so injective maps have left inverses).

So $\Box_{\ne}p$ holds iff $p$ contains every injective map.

**Two-hat necessity.** By Proposition D18 of *The Bounds of Possibility*, at a world
where $a$ is the actual world, $\hat{\hat\Box}p\to\Box(\Diamond_{\ne}a\to p)$; the
converse holds with the witness $q:=a$. At a map $k$, $\Diamond_{\ne}a$ is
$\Diamond_{\ne}$ of $k\cdot a=\{m:m\circ k=1_{W_0}\}$, which holds iff that set contains
an injective $m$. Such an $m$ is onto, as $m\circ k=1_{W_0}$, so it is a bijection
with inverse $k$. At $\langle V,I\rangle$, $k\cdot a$ is empty. So $\hat{\hat\Box}p$
holds iff $p$ contains every bijection.

**5-necessity.** $\hat{\hat\Box}\le\Box_5$ is a theorem of C (Proposition D21), and
Actuality gives the converse (actuality-implies-five-implies-two-hat). So $\Box_5$ and
$\hat{\hat\Box}$ coincide here.

**The separation.** Let $j$ shift the individual constants
($c_n\mapsto c_{n+1}$) and fix the other constants. It is injective and not onto. The
proposition $\{j\}$ is in the domain, with transports $\{m:m\circ f=j\}$ along maps and
$\varnothing$ along the $\langle V,I\rangle$. Its negation contains every bijection but
not $j$. So it is 5-necessary and two-hat necessary, and not ND-necessary.

## Maximalism and Possibility+

The arguments of coalesced-pinned-substitutions-root use only the arrows
$\langle V,I\rangle$, so they carry over unchanged.
