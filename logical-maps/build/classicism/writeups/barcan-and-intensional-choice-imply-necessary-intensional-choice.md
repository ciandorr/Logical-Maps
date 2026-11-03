# BF ∧ Intensional Choice ⇒ □Intensional Choice

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.barcan_and_intensional_choice_imply_necessary_intensional_choice`; produced by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 26 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Premises

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **□Intensional Choice.** Necessarily, if a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Proof

Write $I(F)$ for $\exists x\, .\,Fx$ and $U(G)$ for $\exists x\, .\,Gx\land\forall y\, .\,Gy\to y=x$. First, Intensional Choice at $\sigma$ is equivalent in C to its entailing form $\forall F\,\exists G\, .\,G\le F\land\Box(I(F)\to U(G))$. From the entailing form: if $\Box I(F)$, a $G$ as there has $\Box U(G)$ by K. To it: given $F$, $F':=\lambda x\, .\,Fx\lor\neg I(F)$ is necessarily instantiated, since it is a theorem that it is instantiated; take $H\le F'$ with $\Box U(H)$, and put $G:=\lambda x\, .\,Hx\land Fx$. Then $G\le F$, and necessarily, if $I(F)$ then $F'$ and $F$ are coextensive, so $G$ is coextensive with $H$ and $U(G)$. Necessitating, the equivalence holds at every world. Now the matrix $G\le F\land\Box(I(F)\to U(G))$ of the entailing form is of the form $\Box A(F,G)$, $G\le F$ being itself a necessitated universal. And $\exists G\,\Box A(F,G)\to\Box\exists G\,\Box A(F,G)$ is a theorem of C: from $\Box A(F,G)$, 4 gives $\Box\Box A(F,G)$, and necessitated existential generalization gives $\Box\exists G\,\Box A(F,G)$. So the entailing form gives $\forall F\,\Box\exists G\,\Box A(F,G)$, and BF at type $\sigma t$ moves the box out: $\Box\forall F\,\exists G\,\Box A(F,G)$, which is the necessitation of the entailing form, hence □Intensional Choice at $\sigma$.

## Notes

Only BF at type $\sigma t$ is used for the instance at $\sigma$. The argument does not show that failures of Intensional Choice are necessary. Astra's note also derives □Intensional Choice from Intensional Choice with ND (type $t$) and BF, which this subsumes.

## Sources

- **Astra via Kodsi 26 Oct** — GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, Barcan persistence of modal choice, research note of 26 October 2026, §§1–3 (unpaginated), in Daniel Kodsi's pull request #18 of 26 October 2026 (branch classicism-integration-2026-10-26 of github.com/dkodsi/Logical-Maps).

<p class='cert'>Record: <code>topics/classicism/results/barcan-and-intensional-choice-imply-necessary-intensional-choice.yaml</code></p>
