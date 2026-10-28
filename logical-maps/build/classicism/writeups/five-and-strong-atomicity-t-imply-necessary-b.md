# 5 ∧ Strong Atomicity (type t) ⇒ □B

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.five_and_strong_atomicity_t_imply_necessary_b`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 8 October 2026, from Cian Dorr's sketch (the true strong atom entails each truth and is necessarily possible); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 8 October 2026.</p>

## Premises

- **5.** Every possible proposition is necessarily possible.
- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **□B.** Necessarily, every true proposition is necessarily possible.

## Proof

Strong atoms are necessarily strong: if $\operatorname{SAtom}(w)$, then 5 gives $\Box\Diamond w$ and 4 gives $\Box\Box\forall Y\,(w\le Y\lor w\le\neg Y)$, so $\Box\operatorname{SAtom}(w)$. Let $q:=\exists w\, .\,\Box\operatorname{SAtom}(w)\land w$. Then $\Box q$: if $\Diamond\neg q$, Strong Atomicity gives a strong atom $w\le\neg q$, and $\Box\Box\operatorname{SAtom}(w)$ by the above and 4, so at a world where $w$ holds, as one does since $\Diamond w$, $q$ holds too, contradicting $w\le\neg q$. Next, $q\to\forall p\, .\,p\to\Box\Diamond p$ is a theorem of C: given $\Box\operatorname{SAtom}(w_0)\land w_0$ and a true $p$, T twice gives $w_0\le p$ or $w_0\le\neg p$, and the second contradicts $w_0\land p$; and $\Box\operatorname{SAtom}(w_0)$ gives $\Box\Diamond w_0$, so $w_0\le p$ gives $\Box\Diamond p$. Necessitating this theorem and applying K to $\Box q$ gives $\Box\forall p\, .\,p\to\Box\Diamond p$, which yields each closed instance of $\Box$B.

## Notes

5 is equivalent to ND in C, by the recorded results, so this gives □ND from ND and Strong Atomicity (type t). 5 is used only to make the strong atoms necessarily possible. atoms do not suffice: ND with □Atomicity (type t) does not give □ND, by the recorded models.

Strengthened by [[five-and-self-atomicity-t-imply-necessary-b]]: self-atoms serve for strong atoms.

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr 8 Oct** — Cian Dorr, suggestion of 8 October 2026, that ND and Strong Atomicity (type t) gives □ND; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/five-and-strong-atomicity-t-imply-necessary-b.yaml</code></p>

## Paper references

- **Background: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, pp. 165–170. Strong atoms and Strong Atomicity.
