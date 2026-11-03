# Symmetric ideally-full model: atomless Boolean prefix with recurrent colour subalgebras [one individual]

<p class='cert'>Model — Source: Misc.; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Package

- **□BF.** Necessarily, the Barcan Formula holds at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **□Self-atoms are strong atoms.** Necessarily, at each relational type, every self-atom is a strong atom: it necessarily entails every entity of the type or its negation.
- **□Self-atoms are atoms.** Necessarily, at each relational type, every self-atom is an atom.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.
- **□Axiom of Infinity (type t).** Necessarily, there are not finitely many propositions.
- **¬ B for pure sentences.** The B instance for every closed sentence in the pure language.
- **¬ □Vicinity.** Necessarily, there is a true proposition that entails the possibility of each true proposition.
- **¬ Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.
- **¬ □Two-hat necessities are ND-necessary.** Necessarily, whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat. In C this is the identity $\hat{\hat\Box}=\Box_{\ne}$.
- **¬ Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

A symmetric ideally-full model with a prefix object $A$, whose base is the countable atomless Boolean algebra $B$, and tail objects $V_m$ ($m\ge0$) and $V_\infty$, whose bases are countable atomless Boolean algebras with colour subalgebras: at $V_m$, free on $c_0,\dots,c_{m-1},d_0,d_1,\dots$, the colours are $C_m:=\langle c_0,\dots,c_{m-1}\rangle$; at $V_\infty$, free on $c_0,c_1,\dots,d_0,d_1,\dots$, they are $C_\infty:=\langle c_0,c_1,\dots\rangle$. The arrows $A\to A$ are the automorphisms of $B$; the arrows from $A$ to a tail object are the surjective homomorphisms with dense kernel (every nonzero element has a nonzero element of the kernel below it); the arrows between tail objects are the surjective homomorphisms $f$ with $f[C_V]\subseteq C_W$; no arrows go from the tail to $A$. The symmetry group is $\operatorname{Aut}(B)$ at $A$ and the automorphisms with $f[C_V]=C_V$ at a tail object. Every object carries the ideal of finite sets. Evaluation point: $1_A$.

Individuals, fixed for this record: there is a single individual at every object. The arrows still act on the base as the construction says, and the base still supplies the pinning sets and the symmetry groups.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

*A member of the group Symmetric ideally-full models, which supplies this definition with the record's settings, and the arguments marked as shared.*

## Arguments

### Holds □BF.

At every type and every object. Every arrow is surjective and every object carries the ideal of finite sets, so the argument barcan-surjective of the group applies at each object.

*Write-up: [symmetric-boolean-prefix-recurrent-colours](symmetric-boolean-prefix-recurrent-colours.html). Address: `symmetric-boolean-prefix-recurrent-colours-individuals-singleton#necessary-barcan`. By GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026, 2026-10-29.*

### Holds □Self-atoms are strong atoms, □Self-atoms are atoms. Fails B for pure sentences, □Vicinity.

No tail object $V$ has an atom of type $t$. Let $p$ be a nonzero proposition there, pinned down by a finite subalgebra $S$, and $h:V\to W$ in $p$. Choose a $d$-generator $y$ outside the finitely many generators $S$ depends on, and let $j_0,j_1$ agree with $h$ on the other generators except an infinite set of further $d$-generators, which they send onto the base of $W$, with $j_0(y)=0$ and $j_1(y)=1$. Both are tail arrows agreeing with $h$ on $S$, so both lie in $p$, and the proposition $\{j : j(y)=0\}$, symmetric and pinned down by $\{y\}$, splits $p$. By existential projection (as in the argument no-actuality-no-self-atoms) no tail object has an atom of any relational type either. Nothing returns from the tail to $A$, so every world seen from a tail world is a tail world.

So Actuality, a closed pure sentence true at $1_A$, is impossible at an entrance $A\to V_0$, and B for pure sentences fails. Vicinity fails at each tail object $V$: given a truth $p$ pinned down by $T$, the endomorphism fixing every generator except $d_n,d_{n+1},\dots$ for a $d_n$ outside $T$'s generators, sending $d_n$ to $0$ and $d_{k+1}$ to $d_k$, is an arrow in $p$ at which the truth that $d_n\ne0$ is impossible. So □Vicinity fails.

Self-atoms. At a tail object a self-atom would be possible, so instantiated at some arrow, and an atom at its target; so there are none, and the bridge principles hold there vacuously. At $A$, a self-atom $X$ of any relational type is instantiated at no entrance, since it would be an atom at a tail object; being nonzero it is instantiated at an automorphism, hence by symmetry at $1_A$ and at every automorphism, so it is an atom there. Its transport along an entrance $h$ is $\bot$, every arrow after $h$ being an entrance. So $X$ is necessarily an atom or $\bot$, a strong atom. At type $t$ the only self-atom is the actual-world proposition. Hence self-atoms are necessarily atoms and strong atoms, at every type.

*Address: `symmetric-boolean-prefix-recurrent-colours-individuals-singleton#tail-atomless`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails Forcing Possibilism.

The actual-world proposition $a$ is the only atom of type $t$ at $A$. A nonzero proposition $p$ containing no entrance lies in $a=\operatorname{Aut}(B)$, and by symmetry is $a$. If $p$, pinned down by a finite subalgebra $S$, contains an entrance $h$, take an atom $s$ of $S$ with $h(s)\ne0$ and a nonzero $z<s$ in $\ker h$, and an automorphism $u$ fixing $S$ pointwise that exchanges $z$ and $s\setminus z$ inside $[0,s]$, by fact (a). Then $hu$ is an entrance agreeing with $h$ on $S$, so it lies in $p$, with $hu(z)=h(s)\ne0=h(z)$; so the proposition $\{k : k(z)=0\}$ splits $p$.

Now the four propositions $\bot,a,\neg a,\top$ are distinct, $a$ being true and not necessary, and the property of being one of them, with entailment among them, is a complete Boolean algebra in the domain, defined from $a$, and Dedekind finite. Forcing Possibilism would give $p\ne\top$ whose entailment algebra is isomorphic to it, so with exactly two atoms below it. There is only one atom.

*Address: `symmetric-boolean-prefix-recurrent-colours-individuals-singleton#forcing-possibilism`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Fails □Two-hat necessities are ND-necessary.

At $V_0$, which an entrance reaches, let $p$ be the arrows into $V_0$: true, symmetric and pinned down by $\varnothing$. It is not ND-necessary there. For a truth $q$ pinned down by $S$, generated by $d_0,\dots,d_n$, the arrow $h:V_0\to V_1$ fixing $d_0,\dots,d_n$, sending $d_{n+1}$ to $c_0$ and $d_{k+1}$ to $d_k$ for $k>n$, and the arrow $k:V_1\to V_0$ sending $c_0$ to $0$ and fixing every $d_i$, give $k\circ h\in q$, as it agrees with $1_{V_0}$ on $S$; so $h\in\Diamond q\setminus p$. But $p$ is two-hat necessary with witness $p$: at an arrow into a $V_m$ with $m\ge1$, or into $V_\infty$, the arrows not sending $c_0$ into $\{0,1\}$ form a truth that is impossible at every arrow into $V_0$, colours being preserved and $C_0=\{0,1\}$, so $\neg p$ is ND-necessary there and $\Diamond_{\ne}p$ fails outside $p$. So at $V_0$ two-hat necessity, and hence 5-necessity and truth, do not imply ND-necessity, and the boxed forms fail at $A$.

*Address: `symmetric-boolean-prefix-recurrent-colours-individuals-singleton#two-hat-not-nd-from-v0`. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, in a trawl for cheaply settled verdicts; checked by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-29.*

### Holds Axiom of Infinity (type t).

The propositions $C_{n,m}:=\{h : hn=hm\}$, that an arrow collapses $n$ and $m$, are symmetric, since relabelling the individuals of a world by a member of the symmetry group keeps identities among them, and each is pinned down by $\{n,m\}$; by the condition infinitely many of them are pairwise distinct, so there are infinitely many propositions. The set of numerals at type $t$ is fixed by every arrow, hence symmetric and pinned down by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property.

*From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#axiom-of-infinity-t`. It requires that There are infinitely many pairs of individuals such that, for any two of these pairs, some arrow collapses the one and not the other. Here: Present $B$ as free on $a_0,a_1,\dots$ and take the pairs $\{0,a_n\}$. For $i\ne j$, the homomorphism onto $V_0$ sending $a_i$ and infinitely many other generators to $0$, $a_j$ to a generator, and the rest onto the remaining generators is a surjection with dense kernel that collapses the one pair and not the other. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Replaces the members' argument of 20 September (Claude Fable 5.1), which used the propositions $\{h : hn=n\}$ that an arrow fixes a given individual. Those are not symmetric when the symmetry group moves $n$: symmetry asks that $h\in p$ imply $g\circ h\in p$, and $(g\circ h)n=gn$.

### Holds BF.

At every type. Let $B$ be an entity at the target of an arrow $i$, pinned down by the finite set $M$, and choose a finite set $P$ with a map $s:M\to P$ such that $i\circ s$ is the identity on $M$, possible because $i$ is surjective. Put $A:=\{\langle\bar x,j\rangle : \langle\bar x,k\rangle\in B$ for some arrow $k$ with $k|_M=j\circ s\}$. This is well defined because $B$ is pinned down by $M$. It is pinned down by $P$ and symmetric, since $B$ is. And $i\cdot A=B$: $\langle\bar x,k\rangle\in i\cdot A$ iff $\langle\bar x,k\circ i\rangle\in A$ iff $\langle\bar x,k'\rangle\in B$ for some $k'$ with $k'|_M=k|_M$, iff $\langle\bar x,k\rangle\in B$. So every entity at every world is the transport of an entity at the evaluation point, and a relation that is necessarily true of every entity is necessarily true of all of them.

*Source: Boolean Completeness does not imply Rigid Comprehension, §3.1, p. 9; Proposition 22, p. 11. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#barcan-surjective`. It requires that Every arrow is surjective. Here: Every arrow is a surjection of the bases. It requires that At every object, the domains hold the symmetric intensions pinned down by a finite set: every object carries the ideal of finite sets. Here: Every object carries the ideal of finite sets. By Claude Opus 5.5 (Anthropic), at Cian Dorr's request, 2026-09-27.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The qualitative links model's argument, which proves the draft's claim for the all-surjections model ("at every type because every arrow is surjective and a finitely pinned symmetric intension can be pulled back along an arrow"), stated once for every member whose arrows are surjective.

*Revised 2026-10-06 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Requires finite-pinning as well, which the argument uses (a finite preimage of the pinning set): stated when the group's Lean parameter admitted a per-object ideal, for the two-object model whose second object is unpinned. Every member meeting surjective-arrows meets it.

### Holds Actuality.

The symmetry group is the smallest symmetric set of arrows containing the identity, and by the condition it is pinned down by a finite set, so it is a proposition in the domain, and an atom entailing every truth.

*Source: Boolean Completeness does not imply Rigid Comprehension, Proposition 24, p. 13; §7.1, p. 21; §8, pp. 23–26. From the group *Symmetric ideally-full models*, shared argument `symmetric-ideally-full#actuality`. It requires that The symmetry group, the smallest symmetric set of arrows containing the identity, is pinned down by a finite set. Here: The arrows into $A$ are exactly the automorphisms of $B$, the symmetry group, and the proposition true at the arrows into $A$ is pinned down by $\varnothing$. By Cian Dorr, 2026-09-19.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The three members' versions stated once; what pins the group down is each member's reason for meeting symmetry-group-pinned.

### Holds Arithmetic Necessitism.

As the argument arithmetic-necessitism-extensionally-full, with the property of being a numeral supplied by pinning. The intension $Z$ whose value at each arrow $k$ out of the evaluation object is the set of numerals $\mathbf 0_\sigma,\operatorname{Suc}_\sigma\mathbf 0_\sigma,\ldots$ at the target of $k$ is pinned down by the empty set, its value depending on the arrow only through its target, and is symmetric, transport along a permutation of the points carrying numerals to numerals, as transport along any arrow does, numerals being closed terms; so it is in the domain, and so is its transport $k\cdot Z$ to any reachable object, whose extension there is exactly the numerals. Hence at every reachable object the numbers at $\sigma$, the instances of the least inductive property, are exactly the numerals, which transport to numerals; persistence and, given $\Box I^*_\sigma$, necessary distinctness are theorems of C, and inextensibility follows as in that argument. So Arithmetic Necessitism holds at every type. No choice is used.

*General argument `arguments/arithmetic-necessitism-finitely-pinned`. It requires that Write an entity of relational type at the evaluation object as its intension $k\mapsto Y_k$ over the arrows $k$ out of it, so that $Y\bar a$ holds at $k$ iff $k\cdot\bar a\in Y_k$; $Y$ is pinned down by a finite set $N$ of the points the arrows act on when $Y_k=Y_{k^{\prime}}$ for any arrows $k,k^{\prime}$ agreeing on $N$. Every entity in a domain is pinned down by a finite set, in the sense that $k\cdot x=k^{\prime}\cdot x$ for arrows agreeing on it, and the domain of each relational type at the evaluation object holds every intension pinned down by a finite set (in a symmetric model, every symmetric one). Here: The domains hold every symmetric intension pinned down by a finite set, and every entity in them is one. By Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell, 2026-10-23.*

### Holds Truths are ND-necessary.

For a true $p$, $a\le p$, since $a$ entails every truth. Take $q:=a$ in the definition of $\Box_{\ne}p$: at a world in $a$, $p$ holds; at a world outside $a$, $\Diamond a$ fails. So every truth is $\Box_{\ne}$-necessary.

*General argument `arguments/nd-necessity-isolated-actual-world`. It requires that The actual-world proposition $a$ is in the domain and entails every truth, and no world outside $a$ sees a world in $a$. Here: The proposition true at the arrows into $A$, the symmetry group, is in the domain and entails every truth (argument actuality of the group); no arrow goes from a tail object to $A$, so no world outside it sees a world in it. By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 2026-09-23.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* The finite-support, symmetric and full action models' copies (eight records) stated once for the topic; what varied, why no world outside the actual world sees back into it, is each record's reason for meeting actual-world-isolated.

### Holds □Axiom of Infinity (type t).

As for individuals (necessary-axiom-of-infinity-individuals), at type $t$. At the identity arrow of each reachable object $v$, with $\Phi$ of type $(tt)t$ holding there of exactly the properties of propositions with finite extension, $\lambda Y^{(tt)t}\, .\,\forall X^{tt}\, .\,YX\to\Phi X$ is in the domain, holds of $\mathbf 0_t$, and passes to successors, identity at $t$ being literal at $1_v$; so every finite cardinality holds only of properties with finite extension, and none holds of the universal property of propositions, whose extension is the infinite set of propositions at $v$. So the Axiom of Infinity at type $t$ holds at every reachable object, and its necessitation at the evaluation point.

*General argument `arguments/necessary-axiom-of-infinity-propositions`. It requires that At every object $v$ reachable from the evaluation point, and for $\sigma=e$ and $\sigma=t$: identity at type $\sigma$ is literal at the identity arrow of $v$, and some entity of type $(\sigma t)t$ in the domain at $v$ holds, at the identity arrow of $v$, of exactly those entities of type $\sigma t$ in the domain there whose extension at that arrow is finite. Extensional fullness at every object gives this, and so does codomain-intensions, the intension with value $S_U$ at every arrow into $U$ being in the domain for any sets $S_U$. Here: Every object's domains hold the symmetric intensions pinned down by a finite set. The intension holding at each arrow, into $U$, of exactly the entities of type $\sigma t$ at $U$ with finite extension at $1_U$ depends only on the codomain and is preserved by the symmetries, which preserve finiteness, so it is symmetric and pinned down by $\emptyset$; the haecceity of an entity is symmetric and pinned down by the set pinning the entity, so identity is literal. It requires that There are infinitely many propositions at every object reachable from the evaluation point. Here: Every tail object is reachable from every object: from $A$ or a tail object to $V_n$ there is a surjective homomorphism respecting colours, sending colours to colours and the free generators $d_j$ onto the remaining generators of the target. For each tail object $V$ the proposition $\{h:\operatorname{cod}h=V\}$ depends only on the codomain, so it is symmetric and pinned down by $\emptyset$, hence in the domain; these are infinitely many and pairwise distinct at every object. By Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2026-10-31.*

### Fails Axiom of Infinity (type e), Infinity Schema (type e), Possible Infinity (type e).

No two individuals are distinct, and the numeral $\operatorname{Suc}_e\mathbf{0}_e$ holds of the universal property at type $e$ at every world.

*General argument `arguments/one-individual`. It requires that There is exactly one individual, at every world. Here: There is a single individual at every object. By Claude Opus 5.5 (Anthropic), at Cian Dorr's direction, 2026-10-02.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic.

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Separates Rigid Comprehension, □BF and □Rigid Power from Weakly Rigid Power and □Tame Rigidity, strengthening symmetric-recurrent-colours, which has Tame Rigidity in place of Rigid Comprehension. So Rigid Comprehension is not necessary here. The prefix object's arrows into the tail have dense kernels, which is what lets rigid relations at $A$ lift. Recorded with the base as individuals; the arguments using individuals do not apply to the generated variant with one individual.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Symmetric ideally-full model: an atomless Boolean prefix with recurrent colour subalgebras, research note of 26 October 2026, §§2–11 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (boolean-prefix-rigidity.md in the integration register of branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definitions 15–18, p. 8.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-boolean-prefix-recurrent-colours.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8. Symmetric ideally-full models, of which this is one.
