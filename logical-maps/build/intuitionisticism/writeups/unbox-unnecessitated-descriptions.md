# □Descriptions ⇒ Descriptions

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□Descriptions.** For every $\sigma ,\tau : \Box (\forall R:\sigma \tau t. ((\forall x:\sigma . \exists !y:\tau . R x y) \to \exists f:\sigma \tau . \forall x:\sigma . R x (f x)))$

## Conclusion

- **Descriptions.** For every $\sigma ,\tau : \forall R:\sigma \tau t. ((\forall x:\sigma . \exists !y:\tau . R x y) \to \exists f:\sigma \tau . \forall x:\sigma . R x (f x))$

## Proof

For every type instance, apply the standing theorem $\Box A\to A$ to that entire instance. Since the types are arbitrary this gives all instances of the unboxed schema.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof unbox-unnecessitated-descriptions, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/unbox-unnecessitated-descriptions.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Theorem 1, p. 9
