# Strong Atomicity (type t) ⇒ Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_t_implies_strong_actuality`; produced by Cian Dorr, 6 October 2026 (statement); proof written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 6 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

Strong Atomicity (type $t$) implies □Actuality (recorded), hence Actuality by T; let $a$ witness it. Since $a$ is true it is possible, so Strong Atomicity supplies a strong atom $w\le a$. Suppose $w$ false. Then $\neg w$ is true, so $a\le\neg w$, i.e. $w\le\neg a$; with $w\le a$ this gives $w\le\bot$, so $w=\bot$, contradicting $\Diamond w$. So $w$ is a true strong atom.

## Notes

Cian Dorr proposed Actuality and Strong Atomicity (type $t$) as premises; the first follows from the second by the recorded strong-atomicity-t-implies-necessary-actuality, so it is dropped.

## Sources

- **Dorr 6 Oct** — Cian Dorr, suggestion of 6 October 2026, introducing Strong Actuality.

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-implies-strong-actuality.yaml</code></p>
