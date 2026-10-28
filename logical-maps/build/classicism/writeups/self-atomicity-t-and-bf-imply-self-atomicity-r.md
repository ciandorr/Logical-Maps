# Self-Atomicity (type t) ∧ BF ⇒ Self-Atomicity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **Self-Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.

## Proof

Let $X^{\bar\sigma t}\ne\bot$. As in the recorded [[atomicity-t-and-bf-imply-atomicity]], $\Diamond\exists\bar y\, .\,X\bar y$ and BF at the argument types give $\bar x$ with $\Diamond X\bar x$; for a proposition $w\le X\bar x$ write $A_w:=\lambda\bar y\, .\,w\land\bar y=\bar x$, which lies below $X$. Two facts about $A_w$ are theorems of C and so hold necessarily: $A_w$ is instantiated iff $w$ is true, and $A_w$ is an atom iff $w$ is one (the atom step of that record, which uses only Leibniz’s law and Intensionality). Self-Atomicity (type t) gives a self-atom $w\le X\bar x$. Then $A_w\ne\bot$, and necessarily, if $A_w$ is instantiated then $w$ is true, so $w$ is an atom, so $A_w$ is an atom: $A_w$ is a self-atom below $X$.

## Notes

The lift of Self-Atomicity from type $t$ to every relational type under BF, on the pattern of [[atomicity-t-and-bf-imply-atomicity]]; BF is used at the argument types, to pass from a possible relation to a possible instance. Atoms are strong atoms needs no such lift, since BF at relational types gives it outright ([[barcan-relational-implies-atoms-are-strong-atoms-r]]).

## Sources

- **Dorr 25 Oct** — Cian Dorr, suggestion of 25 October 2026 that under BF the type-t forms of the new principles lift to their full forms, as Atomicity does; proofs by Claude Fable 5.1 (Anthropic) the same day (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atomicity-t-and-bf-imply-self-atomicity-r.yaml</code></p>
