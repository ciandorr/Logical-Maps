# Self-Atomicity (type t) ∧ Intensional Choice ⇒ Self-Atomicity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.self_atomicity_t_and_intensional_choice_imply_self_atomicity_r`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026, on the pattern of Cian Dorr's argument for Atomicity; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026.</p>

## Premises

- **Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **Intensional Choice.** If a property is necessarily instantiated, then some property entailing it is necessarily uniquely instantiated.

## Conclusion

- **Self-Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.

## Proof

Let $X^{\bar\sigma t}\ne\bot$, so that $\Diamond\exists\bar x\, .\,X\bar x$ by Intensionality. Self-Atomicity (type t) gives a self-atom $w\le\exists\bar x\, .\,X\bar x$. Intensional Choice (polyadic form), applied to $\lambda\bar x\, .\,w\to X\bar x$, which is necessarily instantiated, gives a necessarily uniquely instantiated $G$ with $A_w:=\lambda\bar x\, .\,w\land G\bar x\le X$. By [[unique-instance-copies]], $A_w$ is a self-atom because $w$ is one.

## Notes

The Intensional Choice counterpart of [[self-atomicity-t-and-bf-imply-self-atomicity-r]].

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atomicity-t-and-intensional-choice-imply-self-atomicity-r.yaml</code></p>
