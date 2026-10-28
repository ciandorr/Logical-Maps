# Self-atoms are atoms (type t) ∧ BF ⇒ Self-atoms are atoms

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Self-atoms are atoms (type t).** Every self-atom is an atom.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **Self-atoms are atoms.** At each relational type, every self-atom is an atom.

## Proof

Let $X^{\bar\sigma t}\ne\bot$. As in the recorded [[atomicity-t-and-bf-imply-atomicity]], $\Diamond\exists\bar y\, .\,X\bar y$ and BF at the argument types give $\bar x$ with $\Diamond X\bar x$; for a proposition $w\le X\bar x$ write $A_w:=\lambda\bar y\, .\,w\land\bar y=\bar x$, which lies below $X$. Two facts about $A_w$ are theorems of C and so hold necessarily: $A_w$ is instantiated iff $w$ is true, and $A_w$ is an atom iff $w$ is one (the atom step of that record, which uses only Leibniz’s law and Intensionality). Now let $X$ be a self-atom, and $w:=X\bar x$. The projection $p:=\exists\bar y\, .\,X\bar y$ is a self-atom (at a world where it is true $X$ is instantiated, so an atom, and the projection of an atom is an atom), and $w\le p$ is possible, so a self-atom too, self-atoms being closed under non-bottom parts; by Self-atoms are atoms (type t) both are atoms, so $w=p$. Let $Z:=X\land\neg A_w$ pointwise. Its projection lies below $p=w$. At any world where $w$ holds, $A_w$ and $X$ are instantiated, so $X$ is an atom there with the non-bottom part $A_w$, whence $Z=\bot$ there; so $w\le\Box\neg\exists\bar y\, .\,Z\bar y$, and with $\exists\bar y\, .\,Z\bar y\le w$ the projection of $Z$ is bottom, so $Z=\bot$ and $X=A_w$, an atom.

## Notes

The lift of Self-atoms are atoms from type $t$ to every relational type under BF, on the pattern of [[atomicity-t-and-bf-imply-atomicity]]; BF is used at the argument types, to pass from a possible relation to a possible instance. Atoms are strong atoms needs no such lift, since BF at relational types gives it outright ([[barcan-relational-implies-atoms-are-strong-atoms-r]]).

## Sources

- **Dorr 25 Oct** — Cian Dorr, suggestion of 25 October 2026 that under BF the type-t forms of the new principles lift to their full forms, as Atomicity does; proofs by Claude Fable 5.1 (Anthropic) the same day (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atoms-are-atoms-t-and-bf-imply-self-atoms-are-atoms-r.yaml</code></p>
