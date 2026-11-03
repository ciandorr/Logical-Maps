# Tame Rigidity ∧ BF (type t) ⇒ □BF (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.tame_rigidity_and_bf_t_imply_necessary_bf_t`; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 3 October 2026; recorded by Claude Opus 5.5 (Anthropic), 16 October 2026, at Cian Dorr's direction.</p>

## Premises

- **Tame Rigidity.** Every weakly rigid relation, including a proposition, is rigid.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **□BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.

## Proof

The proof of tame-rigidity-and-barcan-imply-necessary-barcan at type $t$. Apply Tame Rigidity at type $t\to t$ to $Y:=\lambda p\, .\,\top$. $\operatorname{Persistent}(Y)$ is a theorem, and $\operatorname{WeaklyInextensible}(Y)$ unfolds to $\forall X^{tt}\, .\,(\forall p\, .\,\Box Xp)\to \Box\forall p\, .\,Xp$, which is BF (type t), while $\operatorname{Inextensible}(Y)$ is its necessitation. So BF (type t) makes $Y$ weakly rigid, Tame Rigidity makes it rigid, and its inextensibility is $\Box$BF (type t).

## Notes

The type-$t$ counterpart of tame-rigidity-and-barcan-imply-necessary-barcan and of tame-rigidity-and-bf-relational-imply-necessary-bf-relational, which the engine cannot instantiate on its own.

## Sources

- **Fable 3 Oct** — Claude Fable 5.1 (Anthropic), Classicism session of 3 October 2026, answering Cian Dorr's question about Tame Rigidity in the coalesced roots.

<p class='cert'>Record: <code>topics/classicism/results/tame-rigidity-and-bf-t-imply-necessary-bf-t.yaml</code></p>

## Paper references

- **Background: Possible Worlds Without Atomicity.** Sun, Christopher. Possible Worlds Without Atomicity. Unpublished draft, September 2026.. Tame Rigidity.
