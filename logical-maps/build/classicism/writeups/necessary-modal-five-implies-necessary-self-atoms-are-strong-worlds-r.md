# □5 ⇒ □Self-atoms are strong worlds

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **□5.** Necessarily, every possible proposition is necessarily possible.

## Conclusion

- **□Self-atoms are strong worlds.** Necessarily, at each relational type, every self-atom is a strong world: it necessarily entails every entity of the type or its negation.

## Proof

Let $X$ be a self-atom at a world $u$; we show $\Box\forall Y\, .\,X\le Y\lor X\le\neg Y$ at $u$. At any world $v$ after $u$, suppose some $Y$ has $X\land Y\ne\bot$ and $X\land\neg Y\ne\bot$, and put $Z:=X\land Y$. Then $Z\le X$, $Z\ne\bot$, and $X\land\neg Z=X\land\neg Y\ne\bot$ gives $\Diamond\exists\bar x\, .\,X\bar x\land\neg Z\bar x$ at $v$. By 5 at $v$, $\Box\Diamond\exists\bar x\, .\,Z\bar x$ holds at $v$, so at a world after $v$ where $X\bar x\land\neg Z\bar x$, the entity $X$ is instantiated, hence an atom, with the non-bottom strict part $Z$: impossible. So every self-atom at $u$ is a strong world. The argument uses 5 at the worlds after $u$, which □5 supplies at every $u$.

## Notes

So under C5 Self-Atomicity and the Strong Leibniz Biconditionals coincide, by [[self-atomicity-r-and-self-atoms-are-strong-worlds-r-imply-strong-leibniz-r]]. 5 at the evaluation point alone gives only [[modal-five-implies-self-atoms-are-atoms-r]].

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of the Strong Leibniz results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/necessary-modal-five-implies-necessary-self-atoms-are-strong-worlds-r.yaml</code></p>
