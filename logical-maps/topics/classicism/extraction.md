# Classicism: import coverage

Source: Andrew Bacon and Cian Dorr, *Classicism*, in Fritz and Jones (eds),
*Higher-Order Metaphysics*, Oxford University Press, 2024, pp. 109–190. The
import was made from the draft dated 16 May 2023, 87 pages, which does not
differ materially from the published version; locators refer to that draft,
including its footnotes.

The import includes the positive extension principles in §§1.4–2.6,
distinguished type instances used by the paper, boxed variants used in its
connections, the Gallin comparison, the choice decomposition, and the
pure/signature variants of the maximalist schemata. The named background
consequences in §1.5 have separate nodes. The defining rules of H and C,
Boolean identities, and the machinery of action-model semantics remain
part of the framework rather than separate extension nodes.

| Source | Connections recorded |
| --- | --- |
| §1.4, pp. 15–16 | Fregean Axiom, Extensionality, Functionality |
| §1.5, pp. 16–19 | K, T, 4, NI, CBF, Broad Necessitism, Intensionality, Modalized Functionality |
| Proposition 2.1, pp. 20–21 | Functionality, Tractarianism and BF equivalence |
| Proposition 2.2, p. 22 | ND, ND at t, 5 and B equivalence |
| Propositions 2.3–2.4, pp. 22–23 | Boxed ND implies BF; ND and BF imply boxed ND |
| Propositions 2.5–2.7, pp. 25–26 | C5, completeness, atomicity and Actuality connections |
| §2.2, p. 27 | Reported No Pure Contingency theorem; proof pending |
| Propositions 2.8–2.10, pp. 29–30 | Rigid Comprehension, completeness and Actuality |
| Propositions 2.11–2.12, p. 30 | Rigid Comprehension from boxed Atomicity, completeness and BF; boxed BF |
| §2.3, pp. 31–32 | Functional Choice = Plenitude + Relational Choice |
| Propositions 2.13–2.16, pp. 32–33 | Plenitude, ND, Actuality, completeness and Rigid Comprehension |
| §2.3, p. 33 | Boxed equivalences and C5 + Atomicity package |
| §§2.4–2.5, pp. 35–40 | Distinctness, Possibility, Separated Structure, Witnessed Possibility, Logical Necessity |
| §2.6, pp. 41–42 | Maximalist incompatibilities, Possibility+, Strong Possibility |
| §3.5, pp. 59–61 | Full action-model examples and pure-sentence B |
| Appendix D, Proposition D.5, pp. 74–79 | Eight finite-support packages and two multiple-object examples |
| Theorem 3.26; Appendix E, pp. 80–83 | Coalesced-sum models and distinctness-preserving collapse |

Model descriptions give the source construction and the point at which
the properties hold. The map uses the paper's relational type system, so
the source constructions apply directly. One explicitly described full
Henkin model over a singleton individual domain is credited as an original
specialization of the standard construction. The singleton-root coalesced
model retains a separate pending obligation to interpret the map's fixed
nonlogical signature; its pure-language source construction is proved.

Two reported results lack proofs in this draft: the Goodsell–Yli-Vakkuri
No Pure Contingency result (p. 27) and Goodsell's incompatibility of
Maximalist Classicism with Rigid Comprehension (p. 41). Their records retain
the attribution and claim with pending verification status. No claim is
made that the source authors regarded them as conjectures.

The formalized statement of Proposition 2.15 uses the intended second
disjunct with the output variable equal to top; its record identifies the
printed variable typo. In Proposition 2.11's proof, Actuality is obtained
from Proposition 2.7; note 42's reference to Proposition 2.6 would require
an extra C5 premise. The question in note 93 about BF + Atomicity without
Actuality is not imported as open: Proposition 2.7 already rules it out.

Fundamental Possibility (§2.5, pp. 39–40) and the principle that every
individual is fundamental (§2.6, n. 60, p. 41) are not imported. Both use
the fundamentality predicate $\operatorname{Fun}$, a nonlogical constant,
so they lie outside the map's logical vocabulary; the connection recorded
from n. 60 went with them.

Type-system comparison variants and their specialization arrows are omitted.
All schemata use the fixed relational type system; restrictions on
particular type parameters remain explicit.
The inference engine treats each schema as a proposition; it does not
perform type substitution automatically. The useful recorded instances
and their connecting results make those steps explicit.

## Arithmetic is Necessary (Goodsell, 2024 draft)

Source: Zachary Goodsell, *Arithmetic is Necessary*, draft dated 5 June 2024,
28 pages. Its logic HKC is H plus K plus Countable Boolean Completeness,
which C extends, so its theorems transfer to the map with the type $\nu$
instantiated as $(et)t$ (see Background).

| Source | Connections recorded |
| --- | --- |
| §3, Definitions 1 and 6, pp. 7–8, 13 | Countable Boolean Completeness; Boolean Completeness restricts to it |
| §4, Definitions 3–5 and 8, pp. 11–13, 19 | The arithmetical vocabulary, $I$, arithmetical sentences |
| §5, Lemmas 2–8 and Theorem 9, pp. 14–21 | Countable Boolean Completeness implies the Necessity of Arithmetic |
| §6, Theorem 11, pp. 24–26 | Possibility (pure) is incompatible with the Necessity of Arithmetic, hence with Countable and full Boolean Completeness and with Rigid Comprehension |

Theorems 10 (arithmetical signatures) and the truth-predicate extension of
§5.3 are not imported. The consistency of C with $I$, assumed in the
source's n. 14, is witnessed on the map by the full Henkin model with a
countably infinite individual domain.

## Logical Combinatorialism (Bacon, 2020)

Source: Andrew Bacon, *Logical Combinatorialism*, *Philosophical Review*
129(4), 2020, pp. 537–589, read directly on 22 September 2026. Its
background system HFE is contained in C, and its schemata are taken in the
map's relational type system (see Background).

| Source | Connections recorded |
| --- | --- |
| §2, pp. 544–547 | Logical Necessity (already recorded), with direct locators |
| §3, pp. 550–557 | Modal Freedom (signature Σ) from Logical Necessity; No Brute Necessities as an alias of Witnessed Possibility; nn. 29–30 on the failure of ND and B |
| §4, pp. 560–565 | Logical Necessity ⇒ Separated Structure; General Separated Structure and its equivalence with Separated Structure; Possibly Witnessed Possibility as a further equivalent |
| §4, p. 568 and n. 53 | Independence (signature Σ) from Separated Structure |
| Appendix A.2–A.3, pp. 580–587 | The glued full action model over the free monoid, in a thread-individual and a singleton-individual variant, proved on 22 September 2026 with a write-up that supplies the unproved Theorem A.8 from the 2024 book's coalesced sums |

Not imported, following Zachary Goodsell's decision of 21 September 2026
that the map's vocabulary is the logical constants together with the
constants of $\Sigma$: everything stated with Bacon's predicates
$\operatorname{Fun}_\sigma$ and $\operatorname{Pure}_\sigma$, namely
Quantified Logical Necessity and its necessitation, Quantified Separated
Structure, Fundamental Independence and Completeness, Purity, Pure
Application, the purity of purity and of fundamentality, the
fundamentality-quantified forms of Logical Necessity, Witnessed Possibility
and Modal Freedom, the §3 consequences for fundamental entities, and the
propositional liar of n. 60; likewise Classicism's Fundamental Possibility
and its n. 58 consequence about converses. Also not imported: the
fine-grained converse-uniqueness principle (nn. 45–46), Russell and
Hawthorne's set-theoretic Pattern and the inaccessible-order-type example
(§3, pp. 551–553), Structure, which is inconsistent (§4, p. 558), and
Melianism (§4, p. 571). The glued models' interpretation of
$\operatorname{Pure}$ and $\operatorname{Fun}$ (Appendix A.3) is not
recorded either; the models are recorded for the pure and signature
principles only.

## A Philosophical Introduction to Higher-Order Logics (Bacon, 2024)

Source: Andrew Bacon, *A Philosophical Introduction to Higher-Order Logics*,
Routledge, 2024, chapters 8 and 18, read directly on 22 September 2026.
Locators are the book's page numbers.

| Source | Connections recorded |
| --- | --- |
| §8.2, pp. 164–171 | Strong Leibniz Biconditionals and their necessitation; Weak Leibniz Biconditionals as an alias of Atomicity; SL ⇒ Atomicity, Atomicity + BF ⇒ SL, their boxed forms, and □SL + Rigid Comprehension ⇒ □BF (type t) (Theorem 8.2) |
| §18.1, §18.3, §18.6 | Modal models, standard models and coalesced sums, used to prove the glued free-monoid models of Logical Necessity |

The rest of chapter 8 restates material already imported from Classicism.
Chapter 18's coherence results (Corollary 18.2, Proposition 18.8,
Corollaries 18.3–18.4, Propositions 18.9–18.11) concern maximalizations of
extensions of C other than C itself; whether to record them as relativized
Possibility principles awaits a decision.
