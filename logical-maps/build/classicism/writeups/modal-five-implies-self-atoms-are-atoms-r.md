# 5 ⇒ Self-atoms are atoms

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **5.** Every possible proposition is necessarily possible.

## Conclusion

- **Self-atoms are atoms.** At each relational type, every self-atom is an atom.

## Proof

Let $X$ be a self-atom of type $\sigma$ and suppose $Z\le X$, $Z\ne X$ and $Z\ne\bot$. Since $Z\le X$ but not $X\le Z$, $\Diamond\exists\bar x\, .\,X\bar x\land\neg Z\bar x$; and $Z\ne\bot$ is $\Diamond\exists\bar x\, .\,Z\bar x$, which 5 makes necessary. At a world where $X\bar x\land\neg Z\bar x$, $X$ is instantiated and so an atom; $Z\le X$ still holds; $Z\ne X$ there, since $X\bar x\land\neg Z\bar x$; and $Z\ne\bot$ there by the boxed possibility. So $Z$ is a non-bottom strict part of an atom, which is impossible. Hence $X$ is an atom. 5 is applied to the proposition $\exists\bar x\, .\,Z\bar x$, so its type-$t$ form serves at every $\sigma$.

## Notes

Since 5 is equivalent to ND (type t) in C, Self-Atomicity with ND (type t) gives Atomicity. Without 5 the implication fails: see [[finite-support-cantor-fan]] and [[full-monoid-ac-equals-bc]].

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/modal-five-implies-self-atoms-are-atoms-r.yaml</code></p>
