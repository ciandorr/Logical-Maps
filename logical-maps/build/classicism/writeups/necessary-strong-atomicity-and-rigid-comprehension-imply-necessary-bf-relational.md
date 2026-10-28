# □Strong Atomicity and Rigid Comprehension imply □BF at the relational types (conjectured)

> **Status: conjectured (downgraded 11 October 2026).** This is Theorem 8.2 of Andrew Bacon,
> *A Philosophical Introduction to Higher-Order Logics* (Routledge, 2024), pp. 169–170. Its
> proof has a gap, marked **Gap** below. It was found while formalizing the proof in Lean, and
> Cian Dorr agreed with the diagnosis. The argument is the book's, kept so that the gap can be
> seen in place; it is not a proof.

Definitions follow the book (§8.2, pp. 165–166). $\Diamond_\sigma X$ is $X\ne\bot_\sigma$. A
strong atom of type $\sigma$ is a possible $W$ that necessarily entails every entity of the type
or its negation. $V$ is accessible to $W$ when $W$ entails $\Diamond V$, read pointwise for
properties: $W\le\lambda q\,.\,\Diamond Vq$. The book treats the case $\sigma=t$ and indicates the
general one; the case $\sigma=t$ is given here.

## The argument

Suppose $\Diamond\exists p\,.\,Xp$. Then $X$ is a possible property, so by Strong Atomicity at
$t\to t$ some strong atom property $W$ entails $X$. By Rigid Comprehension let $H$ be a rigid
property coextensive with the property of being a strong atom property accessible to $W$, and
put
$$r:=\exists V\,\exists p\,.\,HV\land Vp\land p.$$
The aim is $\Diamond Xr$, which gives $\exists p\,.\,\Diamond Xp$, the dual of BF at $t$.

(i) *If $Wp$, then $\Box(p\to r)$.* By □Strong Atomicity at $t$ it suffices that every strong
atom $v$ entails $\exists V\,.\,HV\land Vp$. Let $U:=\lambda q\,.\,v\land q=p$. $U$ is
a strong atom property, and it is accessible to $W$: $W$ decides $\lambda q\,.\,\Diamond Uq$, and
$p$ is $W$ and possibly $U$. **So $U$ is $H$**, and necessarily $H$ by the rigidity of $H$. Since
$v$ entails $Up$, $v$ entails $\exists V\,.\,HV\land Vp$.

(ii) *If $Wp$, then $\Box(r\to p)$.* By the weak inextensibility of $H$ it suffices that
$\Box\forall q\,.\,Vq\to p=q$ for each $V$ with $HV$. Since $Wp$ and $W$ entails
$\lambda q\,.\,\Diamond Vq$, $\Diamond Vp$; $V$, a strong atom property, cannot then entail
$\lambda q\,.\,q\ne p$, so it entails $\lambda q\,.\,q=p$.

So $\forall p\,.\,Wp\to p=r$. The book continues: "Putting this together we have proven
$\forall p(Wp\to p=r)$ from necessary assumptions, and thus we may conclude
$\Box\forall p(Wp\to p=r)$." With $W\le X$ and $\Diamond\exists p\,.\,Wp$, this gives
$\Diamond Xr$.

## Gap

The conclusion is needed under the box, because $W$ may have no actual instance: the only
$p$ with $Wp$ may exist only at other worlds. Running (i) at such a world $u$ requires the step
in bold, that the world property $U$ built at $u$ from $u$'s $v$ and $p$ is $H$. At the
evaluation point this holds because $H$ is coextensive there with the strong atom properties
accessible to $W$. At $u$ nothing gives it: Rigid Comprehension supplies a coextension only at
the evaluation point, and the rigidity of $H$ only stops $H$ from acquiring instances; it does
not make $H$ hold of new world properties at $u$. So "necessary assumptions" covers the rigidity
of $H$, □Strong Atomicity and the boxed facts about $W$, but not the coextension of $H$ that the
bold step uses. Step (ii) uses only rigidity and the boxed facts, and goes through at every world.

Boxing Rigid Comprehension does not obviously repair this. It gives each world its own rigid
coextension, while $r$ has to be defined from one $H$ existing at the evaluation point.

The other half of Theorem 8.2, that □Atomicity and □BF at the relational types give □Strong
Atomicity, is unaffected (atomicity-and-bf-relational-imply-strong-atomicity and its boxed form).

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Theorem 8.2, pp. 169–171
