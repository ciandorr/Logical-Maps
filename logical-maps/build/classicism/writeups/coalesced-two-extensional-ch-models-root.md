# Coalesced sum of two extensional models disagreeing about CH

The construction is Cian Dorr's two-component coalesced sum
([the arithmetic version](coalesced-two-extensional-arithmetics-root.html)), with
components chosen by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 23 October 2026,
to disagree about the continuum hypothesis. Written for the map by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 24 October 2026.

At its root this model satisfies □Atomicity, □BF, □Strong Atomicity, □Tame Rigidity,
□Rigid Rigidity, □Weakly Rigid Weak Rigidity, Modal Well-Ordering and □Intensional
Choice, and fails Non-contingency of CH at type $e$.

## Metatheory

ZFC together with $\operatorname{Con}(\mathrm{ZFC})$. Then $\mathrm{ZFC}+\mathrm{CH}$ and
$\mathrm{ZFC}+\neg\mathrm{CH}$ are consistent (Gödel, Cohen), and by the completeness
theorem they have models

$$
N_+\models\mathrm{ZFC}+\mathrm{CH},\qquad N_-\models\mathrm{ZFC}+\neg\mathrm{CH} .
$$

These need be neither transitive nor $\omega$-standard. So, like the forcing
construction of the [stitched Cohen extension](stitched-cohen-extension.html), what the
model establishes is consistency relative to ZFC.

## The components

From a model $N$ of ZFC form a one-world extensional Henkin model $M_N$ of C. Inside
$N$, let $T_e:=\mathbb R$ and, for a relational type $\sigma_1\cdots\sigma_nt$,
$T_{\sigma_1\cdots\sigma_nt}:=\mathcal P(T_{\sigma_1}\times\cdots\times T_{\sigma_n})$,
with $T_t=\mathcal P(\{\varnothing\})$. The domains of $M_N$ are the externalizations of
these sets: $D_\sigma:=\{x:N\models x\in T_\sigma\}$, with application read from
$N$'s membership. A λ-term with parameters denotes the set that Separation in $N$ gives
for the corresponding formula, so the domains are closed under definability; $M_N$ is
a model of C, and of Extensionality. It satisfies Well-Ordering at every type, since $N$
well-orders each $T_\sigma$. The individuals are $N$'s reals, which are infinite in $N$.

The map's real number structures and $\operatorname{CH}(\mathfrak R)$ are formulas of
higher-order logic, and their quantifiers over relations range over the domains of
$M_N$, that is, over $N$'s sets. So, by induction on formulas, they mean in $M_N$ what
they mean in $N$:

$$
M_{N_+}\models\exists\mathfrak R\, .\,\operatorname{Real}_e(\mathfrak R)\land\operatorname{CH}(\mathfrak R),
\qquad
M_{N_-}\models\exists\mathfrak R\, .\,\operatorname{Real}_e(\mathfrak R)\land\neg\operatorname{CH}(\mathfrak R),
$$

witnessed by $N_\pm$'s field of reals with its order, operations and natural numbers.
By Huntington's theorem (all real structures are isomorphic, provably in the non-modal
fragment) every real number structure at type $e$ in $M_{N_+}$ satisfies CH, and every one
in $M_{N_-}$ falsifies it.

## The coalesced sum

Coalesce $M_{N_+}$ and $M_{N_-}$ at a new root as in *Classicism*, Definition E.2, with a
distinguished arrow to each and the fullest root domains: root individuals are pairs of
component individuals, and a root entity of a relational type is a triple
$(Y_o,Y_+,Y_-)$ of an arbitrary root extension and an entity of each component. The root
sees itself and the two component worlds, each of which sees only itself. Evaluation
point: the root. Every relational constant of Σ denotes the top element of its type.

## Non-contingency of CH fails

At type $e$, Non-contingency of CH is

$$
\Box\forall\mathfrak R\, .\,\bigl(\operatorname{Real}_e(\mathfrak R)\to\operatorname{CH}(\mathfrak R)\bigr)
\ \lor\
\Box\forall\mathfrak R\, .\,\bigl(\operatorname{Real}_e(\mathfrak R)\to\neg\operatorname{CH}(\mathfrak R)\bigr).
$$

At the root, the first disjunct requires the formula under the box at the world of
$M_{N_-}$, where it is false; the second requires its formula at the world of $M_{N_+}$,
where it is false. So both disjuncts fail, and so does the Necessity of Second-Order
Analysis.

## The other verdicts

They are the arithmetic model's arguments, which use only that the components are
one-world extensional Henkin models with infinitely many individuals satisfying
Well-Ordering at every type:

- `strong-atomicity`: the root entities true of one tuple at one world are strong atoms,
  giving □Strong Atomicity and so □Atomicity; and transport onto each component is
  surjective, giving □BF;
- `one-world-components`: □Tame Rigidity, □Intensional Choice and □Distinctness-Preserving
  Collapse;
- `rigid-rigidity`: □Rigid Rigidity and □Weakly Rigid Weak Rigidity;
- `well-ordering`: Modal Well-Ordering and □Well-Ordering;
- `boolean-completeness-t`, `pure-b` and `infinity`: Boolean Completeness at $t$ necessarily,
  the failure of B for pure sentences, and the Infinity schema at $e$ with the failures at $t$.

What depended on the arithmetic components, the failures of the Necessity of
Arithmetic, Arithmetic Necessitism, the Necessity of Analysis and Rigid Power, is not
claimed here: $N_+$ and $N_-$ may or may not agree about arithmetic.

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix E, Definition E.2, pp. 80–83. The coalesced sum, here of two components.
