# Full action model: free monoid on countably many generators, glued constants, thread individuals

This write-up establishes that Bacon's Logical Necessity schema holds at the root of a full action model of C, and records which other principles hold or fail there. The construction is Bacon's (*Logical Combinatorialism*, Appendix A.3), with its unproved gluing theorem (Theorem A.8 there) obtained from the coalesced sums of Bacon, *A Philosophical Introduction to Higher-Order Logics*, §18.6, and its deferred type-$e$ case handled by a self-similar choice of individual domain. The companion write-up for the singleton-individual variant reuses everything here except §2.

Throughout, $\Sigma$ is the map's fixed countable signature of nonlogical constants; for an uncountable signature, replace $\mathbb N$ by a set of the signature's cardinality wherever it indexes branches. The type system is the map's relational one; the models below are standard models of the full simple type hierarchy in Bacon's sense, and their restriction to the relational types is a model of C (book, Theorems 18.1 and 18.4, together with the remark on p. 160 that Classicism in the full hierarchy includes Modalized Functionality at all types).

## 1. The frame

Let $M=\mathbb N^{<\omega}$ be the free monoid of finite sequences of natural numbers under concatenation, written $i\circ j$, with unit the empty sequence $\langle\rangle$. Its induced Kripke frame $T$ (Bacon 2020, Definition A.7) has the sequences as worlds, $i\le j$ iff $j=k\circ i$ for some $k$, and root $\langle\rangle$: the infinitely branching tree, with accessibility the initial-segment relation. $M$ is cancellative: $k\circ i=k'\circ i$ implies $k=k'$, and $k\circ i=i$ implies $k=\langle\rangle$.

Two facts about $T$ are used repeatedly.

**Self-similarity.** For every world $i$, the subtree $T{\uparrow}i$ of worlds above $i$ is isomorphic to $T$ by $k\circ i\mapsto k$. And $T$ is the coalesced sum (book, Definition 18.14) of countably many copies of itself: the copies sit above the children $\langle n\rangle$ of the root, and the root is the new designated world.

**No pure contingency.** A closed pure sentence is true at every world or at none. This holds in every one-object action model (Classicism, §3.5, p. 59), and in the modal-model presentation below it is the fact that pure sentences are interpreted by the frame, whose subtrees are all isomorphic.

## 2. The individuals

A *modalized set* over $T$ (book, §17.1) assigns to each world $w$ a set $D_w$ and to each $w\le v$ a counterpart map $i_{wv}:D_w\to D_v$, functorially. Let $B(w)$ be the set of infinite branches through $w$: the infinite sequences of worlds $w<w_1<w_2<\cdots$ in which each world is a child of the one before. Put

$$
D^e_w:=\mathbb N^{B(w)},\qquad i_{wv}(a):=a{\restriction}B(v)\quad(w\le v),
$$

noting that $B(v)\subseteq B(w)$ when $w\le v$, a branch through $v$ being a branch through $w$ from $w$ on. Each $i_{wv}$ is a restriction, hence surjective, and the maps compose. In the $M$-set presentation this is the set $\mathbb N^{\mathbb N^\omega}$ of functions from infinite sequences of numbers to numbers, an arrow $i$ acting by $(i\cdot a)(s):=a(i{}^\frown s)$. Call it the *thread domain*. Two properties matter:

- **(E1)** For every world $w$, $D^e{\restriction}T{\uparrow}w\cong D^e$ along the tree isomorphism $T{\uparrow}w\cong T$, since that isomorphism carries $B(k\circ w)$ onto $B(k)$.
- **(E2)** At every world $w$ with children $(w_n)_n$, the branches through $w$ are partitioned by the child they pass through, $B(w)=\bigsqcup_nB(w_n)$, so $a\mapsto(i_{ww_n}a)_n$ is a bijection $D^e_w\cong\prod_nD^e_{w_n}$ whose components are the counterpart maps.

Every $D^e_w$ is uncountable, so it has at least two elements. The singleton domain, $D^e_w:=\{\ast\}$ with identity counterparts, also satisfies (E1) and (E2); the companion write-up uses it.

## 3. The frame as a coalesced sum of itself

A *standard model* over a pointed Kripke frame (book, Definition 18.6) is a modal model whose propositional domain at each world $w$ is the full powerset of the worlds above $w$, with truncation as counterpart, and whose domain at a function type $\sigma\to\tau$ at $w$ is the set of all homomorphisms from $D^\sigma{\restriction}T{\uparrow}w$ to $D^\tau{\restriction}T{\uparrow}w$, with restriction as counterpart. A standard model is determined by its Kripke frame and its type-$e$ modalized set (book, p. 396). Write $\mathcal F$ for the standard higher-order frame over $T$ with the thread domain. By (E1), $\mathcal F{\restriction}T{\uparrow}w\cong\mathcal F$ for every world $w$.

For the map's purposes, $\mathcal F$ is the full action model of Classicism §3.4 over the monoid $M$ with the thread $M$-set at type $e$. The correspondence between the two presentations is the unravelling of Classicism §3.5, p. 61: propositions are the same sets of arrows, and an element of Bacon's function-space $M$-set $A\Rightarrow B$, a map $f$ with $ia=ia'\Rightarrow i(fa)=i(fa')$, is the root component of a unique homomorphism family, the other components being $b\mapsto i(fa)$ for any $a$ with $ia=b$, which exists because the counterpart maps are surjective. In particular, every world's truncation of a model over $\mathcal F$ is again a model over a frame isomorphic to $\mathcal F$ (book, §18.6, truncation; Classicism, Appendix E, truncation by an arrow).

**Lemma 1.** Let $(\mathcal A_n)_{n\in\mathbb N}$ be $\Sigma$-models over $\mathcal F$. Their coalesced sum $\bigoplus_n\mathcal A_n$ (book, Definition 18.15) is a $\Sigma$-model over a higher-order frame isomorphic to $\mathcal F$, and under the isomorphism the interpretation of each constant $c$ satisfies $i_{\langle\rangle\langle n\rangle}\llbracket c\rrbracket=\llbracket c\rrbracket_{\mathcal A_n}$ for every $n$.

*Proof.* The sum is a modal model by the book's Proposition 18.7. Its Kripke frame is the coalesced sum of countably many copies of $T$, which is $T$ by self-similarity. It is propositionally full, because its propositional domain at the new root is by definition the set of subsets of the world set whose truncations lie in the components' domains, and those are full; and functionally full, because its function domains at the root are all homomorphisms whose truncations lie in the components' domains, which again are full; at the other worlds the domains are the components' (book, Exercise 18.23). Its type-$e$ modalized set has, at the root, the product of the components' root domains with the projections as counterparts, which is the thread domain by (E2), and at every other world a thread domain by (E1). A standard model is determined by its Kripke frame and type-$e$ set, so the sum is a standard model over a frame isomorphic to $\mathcal F$. The clause for constants in Definition 18.15 interprets $c$ at the worlds of the $n$-th component as $\mathcal A_n$ does, which is the displayed truncation property. $\square$

This is Bacon's Theorem A.8 for the frame $\mathcal F$.

## 4. The glued model

Say a $\Sigma$-sentence is *satisfiable over $\mathcal F$* when it is true at the root of some $\Sigma$-model over $\mathcal F$. Since $\Sigma$ is countable, enumerate the satisfiable sentences as $\varphi_0,\varphi_1,\ldots$ and choose a model $\mathcal A_n$ over $\mathcal F$ with $\varphi_n$ true at its root. Let $\mathcal A:=\bigoplus_n\mathcal A_n$, transported to $\mathcal F$ by Lemma 1. This is the model of the record; its evaluation point is the root.

**Lemma 2.** For every $\Sigma$-sentence $\varphi$: $\Diamond\varphi$ is true at the root of $\mathcal A$ iff $\varphi$ is satisfiable over $\mathcal F$.

*Proof.* If $\varphi=\varphi_n$ is satisfiable, then by the truncation property the truncation of $\mathcal A$ at $\langle n\rangle$ is $\mathcal A_n$, so $\varphi$ is true at $\langle n\rangle$ and $\Diamond\varphi$ at the root (book, Theorem 18.5, proof). Conversely, if $\Diamond\varphi$ is true at the root then $\varphi$ is true at some world $i$, hence at the root of the truncation of $\mathcal A$ at $i$, which by §3 is a $\Sigma$-model over a frame isomorphic to $\mathcal F$; transporting gives a model over $\mathcal F$ with $\varphi$ true at the root. $\square$

**Lemma 3.** For a pure formula $P$ with free variables among $\bar x$ and constants $\bar c$ of matching types: $\exists\bar x\, .\,P$ is true in $\mathcal F$ iff $P[\bar c/\bar x]$ is satisfiable over $\mathcal F$.

*Proof.* A pure formula's satisfaction by an assignment at the root depends only on the frame. If $\bar a$ in the root domains satisfies $P$, interpreting $c_k$ as $a_k$ gives a $\Sigma$-model over $\mathcal F$ in which $P[\bar c/\bar x]$ is true; distinct constants may receive the same value, which Definition 18.1 permits. Conversely, in a model where $P[\bar c/\bar x]$ is true the denotations of $\bar c$ satisfy $P$. $\square$

**Theorem 1 (Logical Necessity).** For every pure $P$ with free variables among $\bar x$ and distinct constants $\bar c$ of matching types, $\Box P[\bar c/\bar x]\leftrightarrow\forall\bar x\, .\,P$ is true at the root of $\mathcal A$.

*Proof.* $\neg\Box P[\bar c/\bar x]$ is $\Diamond\neg P[\bar c/\bar x]$, true at the root iff $\neg P[\bar c/\bar x]$ is satisfiable over $\mathcal F$ (Lemma 2) iff $\exists\bar x\, .\,\neg P$ is true in $\mathcal F$ (Lemma 3) iff $\exists\bar x\, .\,\neg P$ is true at the root of $\mathcal A$, because $\mathcal A$ is a model over $\mathcal F$ and the sentence is pure. That is $\neg\forall\bar x\, .\,P$. $\square$

Distinctness of the constants is not used in the proof; it is the side condition of the schema.

**Corollary 1.** Distinct constants of the same type denote distinct entities at the root, and $\Diamond(c=c')$ holds for any two constants of one type. For $c\ne c'$ is satisfiable over $\mathcal F$, every domain having at least two elements, so some child interprets them differently, so their denotations at the root differ; and $c=c'$ is satisfiable too, giving $\Diamond(c=c')$ by Lemma 2.

## 5. The pure part

The following hold at every world, hence with their necessitations, because $\mathcal F$ is a full one-object action model (Classicism, §3.5, p. 61) whose arrows act surjectively in every type.

- **No Pure Contingency:** §1.
- **Atomicity and Actuality:** for a world $i$ and a proposition $p\ni i$, the singleton $\{i\}$ is a proposition; $\Box(\{i\}\to q)$ holds at $i$ iff for all $k$, $k\circ i\in\{i\}$ implies $k\circ i\in q$, and by cancellativity $k\circ i=i$ forces $k=\langle\rangle$, so this is $i\in q$. Hence $\{i\}$ is an atom below every proposition true at $i$, giving Actuality at $i$, and for $p\ne\bot$ any $i\in p$ gives an atom below $p$. Higher types follow as in Classicism, p. 61.
- **Strong Leibniz Biconditionals:** for $p\ne\bot$ pick $i\in p$; then $\{i\}$ is a strong world: at any world $j$, $j\cdot\{i\}=\{k:k\circ j=i\}$ has at most one element by cancellativity, so it entails every proposition or its negation, necessarily. At higher relational types take singletons in the same way, using the equivariant characteristic functions.
- **Rigid Comprehension:** the frame is intensionally full (Classicism, p. 61).
- **Relational Choice:** with choice in the metatheory, every serial relation has a functional subrelation, which is an intension of a full model (Classicism, p. 61).
- **BF:** the action of every arrow is surjective on the powerset, since $i\cdot(\{k\circ i:k\in q\})=q$ by cancellativity, and on the thread domain, since counterparts are restrictions; by Bacon 2020, Proposition A.3, it is surjective at every type, and Classicism, p. 61, gives $\mathrm{BF}_\sigma$ at every world.
- **Axiom of Infinity at types $e$ and $t$:** the root domains are uncountable, identity is genuine, and the numerals are intensions of a full model, so no finite cardinality holds of the universal property; see the surjection-monoid model's record for the same argument.

And the following fail at the root.

- **ND and B:** $\{\langle\rangle\}\ne\emptyset$, but $\langle0\rangle\cdot\{\langle\rangle\}=\emptyset$, so the two are possibly identical; B fails since it implies ND (Prior).
- **Possibility Maximalism (pure):** Actuality holds at every world, so $\Diamond\neg\text{Actuality}$ fails, although $\neg\text{Actuality}$ is consistent with C, being true in the map's finite-support models with Atomlessness.

Everything else recorded for the model follows from these by the map's results: Separated Structure, General Separated Structure, Possibly Witnessed Possibility, Witnessed Possibility, Independence (signature Σ) and Modal Freedom (signature Σ) from Logical Necessity. Bacon's interpretation of his predicates $\operatorname{Pure}$ and $\operatorname{Fun}$ in this model (Appendix A.3) is not recorded on the map.

## Paper references

- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — Appendix A.2–A.3, pp. 580–587; n. 15, p. 547; n. 48, p. 566. The construction and its claimed validation of Logical Necessity; its Theorem A.8 is stated without proof and its type-e case deferred.
- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §18.6, Definitions 18.14–18.15, Proposition 18.7, Exercise 18.23, pp. 405–410. Coalesced sums of modal models, from which the gluing theorem follows once the frame is shown to be a coalesced sum of copies of itself.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 59–61; Appendix E, pp. 80–83. Facts about full one-object action models used for the pure part, and truncations.
