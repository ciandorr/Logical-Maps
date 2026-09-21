import Classicism.Core

/-!
# Logical Equivalence: the rule and its Lean rendering

Classicism is the smallest H-theory closed under the rule (Classicism, §1.4)

    Equivalence:   if ⊢ P ↔ Q then ⊢ (λv̄.P) = (λv̄.Q)
    ζ-Equivalence: if ⊢ F v̄ ↔ G v̄ then ⊢ F = G, with v̄ not free in F or G.

A *rule* cannot be a Lean axiom. What Lean has instead are the axioms `propext`
(`(P ↔ Q) → P = Q`) and `funext` (derived from `Quot.sound`), which are the map's
Fregean Axiom and Functionality, both of which Classicism rejects. The rendering is:

> `propext h` and `funext h` may be used **only when `h` is closed**: its proof term
> may mention object variables (variables of a type in `R`) and global theorems, but no
> hypothesis, that is, no local variable whose type is a proposition.

Under that discipline `funext (fun v̄ => propext h)` is exactly an instance of
ζ-Equivalence, and `funext (fun v => h)` with `h` a closed identity is the rule ξ,
under which C is also closed (§1.4, n. 20). Applied to a hypothesis instead, `propext`
would be the Fregean Axiom and `funext` Functionality, which are exactly what separates
Extensionalism from Classicism. The discipline is a fact about the *shape* of the proof
term; nothing in the term marks it. Until the checker (`Classicism/Check.lean`, planned)
enforces it, every proof in this library is written to obey it and `#print axioms` is
the only mechanical audit.

## Necessitation

C is closed under Necessitation: if ⊢ P then ⊢ □P (§1.5). It is the case of
Equivalence for `P ↔ ⊤`, and it is emphatically *not* the theorem `p → □p`: with `p` a
propositional variable that is another form of the Fregean Axiom, interderivable with it
in Booleanism. (Nor is it the map's No Pure Contingency, which is the far weaker sentence
schema `P → □P` for closed pure `P`, and which cannot be stated here at all because it
quantifies over syntax.) So there is no `theorem nec`. The macro `nec% t` below expands to
`propext ⟨fun _ => trivial, fun _ => t⟩`, which is an admissible use exactly when `t` is
closed. Write `nec% (theorem_name args)`; never `nec% h` for a hypothesis `h`.

## Rewriting

`rw`, `calc`, `Eq.subst`, `▸`, `congrArg` and `congrFun` are Leibniz's Law and are
unrestricted. `rfl` proves only `βηδ`-conversions, which `H` proves, so it is
unrestricted too. Avoid `simp`, `by_cases`, `by_contra`, `decide` and `tauto`:
`simp` applies `propext` and `funext` to hypotheses through lemmas such as
`forall_congr`, and the others reach `Classical.choice`. Case on a proposition with
`em_cases`, which uses the axiom `em`.
-/

namespace Classicism

/-- Necessitation of a closed theorem `t : P`, giving `□P`. Admissible only when `t`
mentions no hypothesis; see the module docstring. -/
macro "nec% " t:term : term => `(propext ⟨fun _ => True.intro, fun _ => $t⟩)

/-- `em_cases h : p` splits the goal on `p` using the axiom `em`, binding `h : p` in
the first branch and `h : ¬p` in the second. The core `by_cases` would instead use
`Classical.propDecidable`. -/
macro "em_cases " h:ident " : " p:term : tactic =>
  `(tactic| rcases Classicism.em $p with $h:ident | $h:ident)

/-- The ζ-Equivalence shape for a unary abstraction, for readability: `equiv% fun v => h`
is `funext fun v => propext h`. `h` must be closed. -/
macro "equiv% " f:term : term => `(funext fun v => propext ($f v))

end Classicism
