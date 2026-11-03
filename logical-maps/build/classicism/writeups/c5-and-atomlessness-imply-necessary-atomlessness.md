# □ND ∧ Atomlessness ⇒ □Atomlessness

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.c5_and_atomlessness_imply_necessary_atomlessness`; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026.</p>

## Premises

- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.

## Conclusion

- **□Atomlessness.** Necessarily, every possible proposition has a possible proposition strictly below it.

## Proof

In C, $\Diamond p$ is equivalent to $p\ne\bot$ and $q\le p$ is the identity $q\land p=q$, so Atomlessness is equivalent to a closed formula built from identities by connectives and quantifiers. Under C5, BF holds ([[necessary-nd-implies-bf]]), and every such formula denotes $\top$ or $\bot$: identities do by ND and NI, connectives preserve this, and if every instance of $\forall x\,\varphi$ is $\top$ then BF makes $\forall x\,\varphi$ necessary, so $\top$. So if Atomlessness is true it is $\top$, and hence necessary.

## Notes

C5 does not give No Pure Contingency without Atomicity ([[c5-and-atomicity-imply-no-pure-contingency]]), which Atomlessness excludes, so this does not follow from [[no-pure-contingency-and-atomlessness-imply-necessary-atomlessness]].

## Sources

- **Opus 29 Oct** — Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 29 October 2026, while adding □Atomlessness at Cian Dorr's request.

<p class='cert'>Record: <code>topics/classicism/results/c5-and-atomlessness-imply-necessary-atomlessness.yaml</code></p>
