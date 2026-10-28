# BF (type t) ∧ □Actuality ⇒ Self-Atomicity (type t)

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, 28 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October 2026.</p>

## Premises

- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.
- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.

## Conclusion

- **Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.

## Proof

Write $A(w):=w\land\forall q\, .\,q\to w\le q$, so that □Actuality is $\Box\exists w\, .\,A(w)$. Let $\Diamond p$. With □Actuality this gives $\Diamond(p\land\exists w\, .\,A(w))$, that is, $\Diamond\exists w\, .\,p\land A(w)$, and BF at type $t$, in its dual form, gives some $w$ with $\Diamond(p\land A(w))$. Put $s:=p\land A(w)$. Then $\Diamond s$ and $s\le p$. It remains to show $\Box(s\to\operatorname{Atom}_t(s))$, by an argument in C, which may therefore be necessitated. Suppose $s$. Then $A(w)$, so $w$ is true and entails every truth; in particular $w\le s$, while $s\le w$ since $A(w)$ entails $w$; so $s=w$. And $w$ is an atom: if $z\le w$, then either $z$ is true, so $w\le z$ and $z=w$, or $\neg z$ is true, so $z\le w\le\neg z$ and $z=\bot$. So $s$ is an atom, and $s$ is a self-atom below $p$.

## Notes

Under BF at every type, [[self-atomicity-t-and-bf-imply-self-atomicity-r]] lifts the conclusion to [[self-atomicity-r]], so BF and □Actuality give Self-Atomicity. The self-atom is the conjunction of $p$ with "$w$ is a true atom"; conjoining $p$ puts it below $p$ without appeal to B or ND, since $w\le p$ itself is only known to hold possibly.

## Sources

- **Dorr 28 Oct** — Cian Dorr, argument of 28 October 2026 that BF and □Actuality give Self-Atomicity (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/barcan-t-and-necessary-actuality-imply-self-atomicity-t.yaml</code></p>
