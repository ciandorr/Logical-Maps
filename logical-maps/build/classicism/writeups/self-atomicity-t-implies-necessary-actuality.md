# Self-Atomicity (type t) ⇒ □Actuality

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.

## Conclusion

- **□Actuality.** Necessarily, there is a true proposition that entails every true proposition.

## Proof

Let $P:=\exists q\, .\,\operatorname{SelfAtom}_t(q)\land q$. Every self-atom $q$ entails $P$: $\Box(q\to\Diamond q)$ is a theorem, and 4 turns $\Box(q\to\operatorname{Atom}(q))$ into $\Box\Box(q\to\operatorname{Atom}(q))$, so $\Box(q\to\operatorname{SelfAtom}_t(q))$ and $q\le P$. If $\Diamond\neg P$, Self-Atomicity (type t) gives a self-atom $q\le\neg P$; with $q\le P$ this makes $q=\bot$, contradicting $\Diamond q$. So $\Box P$. A true self-atom is a true atom by T, and a true atom entails every truth, so $P\to$ Actuality is a theorem of C; necessitate it and apply K.

## Notes

Strengthens [[strong-atomicity-t-implies-necessary-actuality]], since Strong Atomicity (type t) implies Self-Atomicity (type t). Conversely every true atom is a self-atom, as it entails every truth, including the truth that it entails every truth; so Actuality is equivalent to the existence of a true self-atom.

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/self-atomicity-t-implies-necessary-actuality.yaml</code></p>
