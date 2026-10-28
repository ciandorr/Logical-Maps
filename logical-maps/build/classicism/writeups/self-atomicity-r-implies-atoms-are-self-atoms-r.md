# Self-Atomicity ⇒ Atoms are self-atoms

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Self-Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.

## Conclusion

- **Atoms are self-atoms.** At each relational type, every atom is a self-atom: necessarily, if it is instantiated, it is an atom.

## Proof

Let $X$ be an atom of a relational type. It is not bottom, so Self-Atomicity gives a self-atom $Q\le X$; as $Q\ne\bot$ and $X$ is an atom, $Q=X$, so $X$ is a self-atom.

## Notes

So Self-Atomicity lies between Atomicity with Atoms are self-atoms, which imply it, and Atoms are self-atoms alone; the converse fails, since Atoms are self-atoms holds vacuously wherever there are no atoms (symmetric-all-surjections) while Self-Atomicity fails there.

## Sources

- **Dorr 25 Oct** — Cian Dorr, observation of 25 October 2026 (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atomicity-r-implies-atoms-are-self-atoms-r.yaml</code></p>
