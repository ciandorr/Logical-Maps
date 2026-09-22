import Classicism.Axiomatization

/-!
# The strict layer: the Boolean algebra of propositions, from six axioms

This file is the target language of the Appendix A transformer, and it obeys the **strict
policy**: `propext` and `funext` are banned outright. Nothing here may use Logical
Equivalence in any form. The only inputs are

* the eleven closed identities of `Classicism.Axiomatization`, and
* Leibniz's Law, which in Lean is `congrArg`, `congrFun`, `rw` and `calc`.

Not even `em` is used: excluded middle is already encoded in the two Dissolution
identities, so every theorem below reports only the Boolean axioms it actually consumes.
`#classicism_strict` in `Classicism/Check.lean` enforces the policy.

## `⊤` and `⊥`

The paper defines them in Figure 1 as

    ⊤ := (∀p. p) ∨ ¬(∀p. p)        ⊥ := (∀p. p) ∧ ¬(∀p. p)

which is ungainly but deliberate: they are chosen so that they can be written, and shown
to be the bounds, in the Booleanism section, before any quantifier identity is available.
The shape is what matters. Because `⊤` is *some* `q ∨ ¬q` with `q` closed, Dissolution-∧∨
gives `p ∧ ⊤ = p` immediately, and dually for `⊥`.

This is also why the strict layer cannot reuse the rest of the library's `□p := (p = True)`.
No axiom mentions Lean's `True`, and an identity can only enter a proof from an axiom,
from `rfl`, from congruence on identities already held, or from `propext`. So
`(q ∨ ¬q) = True` is not derivable here, and the strict layer keeps its own `⊤`.

## The programme

The six Boolean Identities are Huntington's axioms for a Boolean algebra: two commutative
operations, each distributing over the other, with bounds and complements. Associativity
is **not** among them and has to be derived, which is the classic part of the argument and
runs through a cancellation lemma. The development below is the standard one, in the order
bounds, complements, idempotence, annihilation, absorption, cancellation, associativity,
uniqueness of complements, double negation, De Morgan.

Names follow the lattice, `meet` for `∧`, `join` for `∨`, `compl` for `¬`, both to say
what the file is about and to stay clear of the `_eq` lemmas in `Classicism/Booleanism.lean`,
which prove the same things the other way, by one gated use of Equivalence each.
-/

namespace Classicism.Strict

open Classicism.Axiomatic

/-- `∀p. p`, the proposition that everything holds. The paper's bounds are built from it.
Nothing is assumed about it; only its shape in `Top` and `Bot` is used. -/
abbrev everything : Prop := ∀ p : Prop, p

/-- The paper's `⊤`, Figure 1. -/
abbrev Top : Prop := everything ∨ ¬ everything

/-- The paper's `⊥`, Figure 1. -/
abbrev Bot : Prop := everything ∧ ¬ everything

/-! ### The defined connectives

`imp` and `iff` are the paper's Figure 1 abbreviations, defined in `Classicism/Core.lean`.
The strict layer must use them rather than Lean's `→` and `Iff`, because those are a
primitive arrow and an inductive and no axiom connects either to the Boolean structure.
This is the same point as `True` above. -/

/-- Necessity in the strict vocabulary: identity with the paper's `⊤` rather than with
Lean's `True`. This is what `Classicism.Box` translates to. -/
abbrev Box (p : Prop) : Prop := p = Top

/-- Possibility likewise, distinctness from the paper's `⊥`. -/
abbrev Dia (p : Prop) : Prop := ¬ (p = Bot)

/-! ### The six axioms, pointwise

Each is the corresponding closed identity applied to its arguments by `congrFun`, which
is Leibniz's Law. These six lines are the only place the axioms are named. -/

theorem meet_comm (p q : Prop) : (p ∧ q) = (q ∧ p) :=
  congrFun (congrFun commutativity_and p) q

theorem join_comm (p q : Prop) : (p ∨ q) = (q ∨ p) :=
  congrFun (congrFun commutativity_or p) q

theorem meet_join_distrib (p q r : Prop) : (p ∧ (q ∨ r)) = ((p ∧ q) ∨ (p ∧ r)) :=
  congrFun (congrFun (congrFun distribution_and_or p) q) r

theorem join_meet_distrib (p q r : Prop) : (p ∨ (q ∧ r)) = ((p ∨ q) ∧ (p ∨ r)) :=
  congrFun (congrFun (congrFun distribution_or_and p) q) r

theorem meet_em (p q : Prop) : (p ∧ (q ∨ ¬ q)) = p :=
  congrFun (congrFun dissolution_and_or p) q

theorem join_contra (p q : Prop) : (p ∨ (q ∧ ¬ q)) = p :=
  congrFun (congrFun dissolution_or_and p) q

/-! ### The bounds -/

theorem meet_top (p : Prop) : (p ∧ Top) = p := meet_em p everything
theorem join_bot (p : Prop) : (p ∨ Bot) = p := join_contra p everything
theorem top_meet (p : Prop) : (Top ∧ p) = p := by rw [meet_comm]; exact meet_top p
theorem bot_join (p : Prop) : (Bot ∨ p) = p := by rw [join_comm]; exact join_bot p

/-! ### Complements

Every excluded middle is `⊤` and every contradiction is `⊥`: the bounds absorb them, and
commutativity turns the absorption around. -/

theorem join_compl (p : Prop) : (p ∨ ¬ p) = Top :=
  calc (p ∨ ¬ p) = ((p ∨ ¬ p) ∧ Top) := (meet_top _).symm
    _ = (Top ∧ (p ∨ ¬ p)) := meet_comm _ _
    _ = Top := meet_em Top p

theorem meet_compl (p : Prop) : (p ∧ ¬ p) = Bot :=
  calc (p ∧ ¬ p) = ((p ∧ ¬ p) ∨ Bot) := (join_bot _).symm
    _ = (Bot ∨ (p ∧ ¬ p)) := join_comm _ _
    _ = Bot := join_contra Bot p

theorem compl_join_self (p : Prop) : ((¬ p) ∨ p) = Top := by
  rw [join_comm]; exact join_compl p

theorem compl_meet_self (p : Prop) : ((¬ p) ∧ p) = Bot := by
  rw [meet_comm]; exact meet_compl p

/-! ### Idempotence -/

theorem join_idem (p : Prop) : (p ∨ p) = p :=
  calc (p ∨ p) = ((p ∨ p) ∧ Top) := (meet_top _).symm
    _ = ((p ∨ p) ∧ (p ∨ ¬ p)) := by rw [join_compl]
    _ = (p ∨ (p ∧ ¬ p)) := (join_meet_distrib p p (¬ p)).symm
    _ = p := join_contra p p

theorem meet_idem (p : Prop) : (p ∧ p) = p :=
  calc (p ∧ p) = ((p ∧ p) ∨ Bot) := (join_bot _).symm
    _ = ((p ∧ p) ∨ (p ∧ ¬ p)) := by rw [meet_compl]
    _ = (p ∧ (p ∨ ¬ p)) := (meet_join_distrib p p (¬ p)).symm
    _ = p := meet_em p p

/-! ### Annihilation -/

theorem join_top (p : Prop) : (p ∨ Top) = Top :=
  calc (p ∨ Top) = ((p ∨ Top) ∧ Top) := (meet_top _).symm
    _ = ((p ∨ Top) ∧ (p ∨ ¬ p)) := by rw [join_compl]
    _ = (p ∨ (Top ∧ ¬ p)) := (join_meet_distrib p Top (¬ p)).symm
    _ = (p ∨ ¬ p) := by rw [top_meet]
    _ = Top := join_compl p

theorem meet_bot (p : Prop) : (p ∧ Bot) = Bot :=
  calc (p ∧ Bot) = ((p ∧ Bot) ∨ Bot) := (join_bot _).symm
    _ = ((p ∧ Bot) ∨ (p ∧ ¬ p)) := by rw [meet_compl]
    _ = (p ∧ (Bot ∨ ¬ p)) := (meet_join_distrib p Bot (¬ p)).symm
    _ = (p ∧ ¬ p) := by rw [bot_join]
    _ = Bot := meet_compl p

theorem top_join (p : Prop) : (Top ∨ p) = Top := by rw [join_comm]; exact join_top p
theorem bot_meet (p : Prop) : (Bot ∧ p) = Bot := by rw [meet_comm]; exact meet_bot p

/-! ### Absorption -/

theorem join_absorb (p q : Prop) : (p ∨ (p ∧ q)) = p :=
  calc (p ∨ (p ∧ q)) = ((p ∧ Top) ∨ (p ∧ q)) := by rw [meet_top]
    _ = (p ∧ (Top ∨ q)) := (meet_join_distrib p Top q).symm
    _ = (p ∧ Top) := by rw [top_join]
    _ = p := meet_top p

theorem meet_absorb (p q : Prop) : (p ∧ (p ∨ q)) = p :=
  calc (p ∧ (p ∨ q)) = ((p ∨ Bot) ∧ (p ∨ q)) := by rw [join_bot]
    _ = (p ∨ (Bot ∧ q)) := (join_meet_distrib p Bot q).symm
    _ = (p ∨ Bot) := by rw [bot_meet]
    _ = p := join_bot p

/-! ### Cancellation, and associativity

`eq_of_meet_eq` is the step that makes associativity available: two propositions that
agree under `p` and under `¬p` are identical, because the two cases recombine by
distributivity over `p ∨ ¬p = ⊤`. -/

theorem eq_of_meet_eq {p q r : Prop}
    (h₁ : (p ∧ q) = (p ∧ r)) (h₂ : ((¬ p) ∧ q) = ((¬ p) ∧ r)) : q = r :=
  calc q = (q ∧ Top) := (meet_top q).symm
    _ = (q ∧ (p ∨ ¬ p)) := by rw [join_compl]
    _ = ((q ∧ p) ∨ (q ∧ ¬ p)) := meet_join_distrib q p (¬ p)
    _ = ((p ∧ q) ∨ ((¬ p) ∧ q)) := by rw [meet_comm q p, meet_comm q (¬ p)]
    _ = ((p ∧ r) ∨ ((¬ p) ∧ r)) := by rw [h₁, h₂]
    _ = ((r ∧ p) ∨ (r ∧ ¬ p)) := by rw [meet_comm p r, meet_comm (¬ p) r]
    _ = (r ∧ (p ∨ ¬ p)) := (meet_join_distrib r p (¬ p)).symm
    _ = (r ∧ Top) := by rw [join_compl]
    _ = r := meet_top r

theorem join_assoc (p q r : Prop) : (p ∨ (q ∨ r)) = ((p ∨ q) ∨ r) := by
  refine eq_of_meet_eq (p := p) ?_ ?_
  · -- under `p` both sides collapse to `p`, by absorption
    calc (p ∧ (p ∨ (q ∨ r))) = p := meet_absorb p (q ∨ r)
      _ = (p ∨ (p ∧ r)) := (join_absorb p r).symm
      _ = ((p ∧ (p ∨ q)) ∨ (p ∧ r)) := by rw [meet_absorb]
      _ = (p ∧ ((p ∨ q) ∨ r)) := (meet_join_distrib p (p ∨ q) r).symm
  · -- under `¬p` the `p` disjunct vanishes on both sides
    calc ((¬ p) ∧ (p ∨ (q ∨ r)))
        = (((¬ p) ∧ p) ∨ ((¬ p) ∧ (q ∨ r))) := meet_join_distrib _ p (q ∨ r)
      _ = (Bot ∨ ((¬ p) ∧ (q ∨ r))) := by rw [compl_meet_self]
      _ = ((¬ p) ∧ (q ∨ r)) := bot_join _
      _ = (((¬ p) ∧ q) ∨ ((¬ p) ∧ r)) := meet_join_distrib _ q r
      _ = ((Bot ∨ ((¬ p) ∧ q)) ∨ ((¬ p) ∧ r)) := by rw [bot_join]
      _ = ((((¬ p) ∧ p) ∨ ((¬ p) ∧ q)) ∨ ((¬ p) ∧ r)) := by rw [compl_meet_self]
      _ = (((¬ p) ∧ (p ∨ q)) ∨ ((¬ p) ∧ r)) := by rw [← meet_join_distrib]
      _ = ((¬ p) ∧ ((p ∨ q) ∨ r)) := (meet_join_distrib _ (p ∨ q) r).symm

/-- The dual cancellation lemma, which is what associativity of `∧` needs. -/
theorem eq_of_join_eq {p q r : Prop}
    (h₁ : (p ∨ q) = (p ∨ r)) (h₂ : ((¬ p) ∨ q) = ((¬ p) ∨ r)) : q = r :=
  calc q = (q ∨ Bot) := (join_bot q).symm
    _ = (q ∨ (p ∧ ¬ p)) := by rw [meet_compl]
    _ = ((q ∨ p) ∧ (q ∨ ¬ p)) := join_meet_distrib q p (¬ p)
    _ = ((p ∨ q) ∧ ((¬ p) ∨ q)) := by rw [join_comm q p, join_comm q (¬ p)]
    _ = ((p ∨ r) ∧ ((¬ p) ∨ r)) := by rw [h₁, h₂]
    _ = ((r ∨ p) ∧ (r ∨ ¬ p)) := by rw [join_comm p r, join_comm (¬ p) r]
    _ = (r ∨ (p ∧ ¬ p)) := (join_meet_distrib r p (¬ p)).symm
    _ = (r ∨ Bot) := by rw [meet_compl]
    _ = r := join_bot r

theorem meet_assoc (p q r : Prop) : (p ∧ (q ∧ r)) = ((p ∧ q) ∧ r) := by
  refine eq_of_join_eq (p := p) ?_ ?_
  · -- under `p` both sides collapse to `p`, by absorption
    calc (p ∨ (p ∧ (q ∧ r))) = p := join_absorb p (q ∧ r)
      _ = (p ∧ (p ∨ r)) := (meet_absorb p r).symm
      _ = ((p ∨ (p ∧ q)) ∧ (p ∨ r)) := by rw [join_absorb]
      _ = (p ∨ ((p ∧ q) ∧ r)) := (join_meet_distrib p (p ∧ q) r).symm
  · -- under `¬p` the `p` conjunct vanishes on both sides
    calc ((¬ p) ∨ (p ∧ (q ∧ r)))
        = (((¬ p) ∨ p) ∧ ((¬ p) ∨ (q ∧ r))) := join_meet_distrib _ p (q ∧ r)
      _ = (Top ∧ ((¬ p) ∨ (q ∧ r))) := by rw [compl_join_self]
      _ = ((¬ p) ∨ (q ∧ r)) := top_meet _
      _ = (((¬ p) ∨ q) ∧ ((¬ p) ∨ r)) := join_meet_distrib _ q r
      _ = ((Top ∧ ((¬ p) ∨ q)) ∧ ((¬ p) ∨ r)) := by rw [top_meet]
      _ = ((((¬ p) ∨ p) ∧ ((¬ p) ∨ q)) ∧ ((¬ p) ∨ r)) := by rw [compl_join_self]
      _ = (((¬ p) ∨ (p ∧ q)) ∧ ((¬ p) ∨ r)) := by rw [← join_meet_distrib]
      _ = ((¬ p) ∨ ((p ∧ q) ∧ r)) := (join_meet_distrib _ (p ∧ q) r).symm

/-! ### Uniqueness of complements, double negation, De Morgan -/

theorem compl_unique {p q : Prop} (hj : (p ∨ q) = Top) (hm : (p ∧ q) = Bot) : q = ¬ p :=
  have hq : q = ((¬ p) ∧ q) :=
    calc q = (q ∧ Top) := (meet_top q).symm
      _ = (q ∧ (p ∨ ¬ p)) := by rw [join_compl]
      _ = ((q ∧ p) ∨ (q ∧ ¬ p)) := meet_join_distrib q p (¬ p)
      _ = (Bot ∨ (q ∧ ¬ p)) := by rw [meet_comm q p, hm]
      _ = (q ∧ ¬ p) := bot_join _
      _ = ((¬ p) ∧ q) := meet_comm _ _
  have hnp : (¬ p) = ((¬ p) ∧ q) :=
    calc (¬ p) = ((¬ p) ∧ Top) := (meet_top _).symm
      _ = ((¬ p) ∧ (p ∨ q)) := by rw [hj]
      _ = (((¬ p) ∧ p) ∨ ((¬ p) ∧ q)) := meet_join_distrib _ p q
      _ = (Bot ∨ ((¬ p) ∧ q)) := by rw [compl_meet_self]
      _ = ((¬ p) ∧ q) := bot_join _
  hq.trans hnp.symm

theorem compl_compl (p : Prop) : (¬ ¬ p) = p :=
  (compl_unique (p := ¬ p) (compl_join_self p) (compl_meet_self p)).symm

theorem compl_join (p q : Prop) : (¬ (p ∨ q)) = ((¬ p) ∧ (¬ q)) :=
  have hj : ((p ∨ q) ∨ ((¬ p) ∧ (¬ q))) = Top :=
    calc ((p ∨ q) ∨ ((¬ p) ∧ (¬ q)))
        = (((p ∨ q) ∨ ¬ p) ∧ ((p ∨ q) ∨ ¬ q)) := join_meet_distrib _ _ _
      _ = ((¬ p ∨ (p ∨ q)) ∧ ((p ∨ q) ∨ ¬ q)) := by rw [join_comm (p ∨ q) (¬ p)]
      _ = (((¬ p ∨ p) ∨ q) ∧ ((p ∨ q) ∨ ¬ q)) := by rw [join_assoc]
      _ = ((Top ∨ q) ∧ ((p ∨ q) ∨ ¬ q)) := by rw [compl_join_self]
      _ = (Top ∧ ((p ∨ q) ∨ ¬ q)) := by rw [top_join]
      _ = ((p ∨ q) ∨ ¬ q) := top_meet _
      _ = ((q ∨ p) ∨ ¬ q) := by rw [join_comm p q]
      _ = (¬ q ∨ (q ∨ p)) := join_comm _ _
      _ = ((¬ q ∨ q) ∨ p) := join_assoc _ _ _
      _ = (Top ∨ p) := by rw [compl_join_self]
      _ = Top := top_join p
  have hm : ((p ∨ q) ∧ ((¬ p) ∧ (¬ q))) = Bot :=
    calc ((p ∨ q) ∧ ((¬ p) ∧ (¬ q)))
        = (((¬ p) ∧ (¬ q)) ∧ (p ∨ q)) := meet_comm _ _
      _ = ((((¬ p) ∧ (¬ q)) ∧ p) ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := meet_join_distrib _ p q
      _ = (((¬ p) ∧ ((¬ q) ∧ p)) ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := by rw [← meet_assoc]
      _ = (((¬ p) ∧ (p ∧ (¬ q))) ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := by rw [meet_comm (¬ q) p]
      _ = ((((¬ p) ∧ p) ∧ (¬ q)) ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := by rw [meet_assoc]
      _ = ((Bot ∧ (¬ q)) ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := by rw [compl_meet_self]
      _ = (Bot ∨ (((¬ p) ∧ (¬ q)) ∧ q)) := by rw [bot_meet]
      _ = (((¬ p) ∧ (¬ q)) ∧ q) := bot_join _
      _ = ((¬ p) ∧ ((¬ q) ∧ q)) := by rw [← meet_assoc]
      _ = ((¬ p) ∧ Bot) := by rw [compl_meet_self]
      _ = Bot := meet_bot _
  (compl_unique hj hm).symm

theorem compl_meet (p q : Prop) : (¬ (p ∧ q)) = ((¬ p) ∨ (¬ q)) :=
  have hnp : ((p ∧ q) ∨ ¬ p) = ((¬ p) ∨ q) :=
    calc ((p ∧ q) ∨ ¬ p) = ((¬ p) ∨ (p ∧ q)) := join_comm _ _
      _ = (((¬ p) ∨ p) ∧ ((¬ p) ∨ q)) := join_meet_distrib _ p q
      _ = (Top ∧ ((¬ p) ∨ q)) := by rw [compl_join_self]
      _ = ((¬ p) ∨ q) := top_meet _
  have hj : ((p ∧ q) ∨ ((¬ p) ∨ (¬ q))) = Top :=
    calc ((p ∧ q) ∨ ((¬ p) ∨ (¬ q))) = (((p ∧ q) ∨ ¬ p) ∨ ¬ q) := join_assoc _ _ _
      _ = (((¬ p) ∨ q) ∨ ¬ q) := by rw [hnp]
      _ = ((¬ p) ∨ (q ∨ ¬ q)) := (join_assoc _ _ _).symm
      _ = ((¬ p) ∨ Top) := by rw [join_compl]
      _ = Top := join_top _
  have hm : ((p ∧ q) ∧ ((¬ p) ∨ (¬ q))) = Bot :=
    calc ((p ∧ q) ∧ ((¬ p) ∨ (¬ q)))
        = (((p ∧ q) ∧ ¬ p) ∨ ((p ∧ q) ∧ ¬ q)) := meet_join_distrib _ _ _
      _ = ((p ∧ (q ∧ ¬ p)) ∨ (p ∧ (q ∧ ¬ q))) := by rw [← meet_assoc, ← meet_assoc]
      _ = ((p ∧ ((¬ p) ∧ q)) ∨ (p ∧ (q ∧ ¬ q))) := by rw [meet_comm q (¬ p)]
      _ = (((p ∧ ¬ p) ∧ q) ∨ (p ∧ (q ∧ ¬ q))) := by rw [meet_assoc]
      _ = ((Bot ∧ q) ∨ (p ∧ Bot)) := by rw [meet_compl, meet_compl]
      _ = (Bot ∨ Bot) := by rw [bot_meet, meet_bot]
      _ = Bot := bot_join _
  (compl_unique hj hm).symm

/-- `¬⊤ = ⊥` and `¬⊥ = ⊤`, closing the algebra: each bound is the other's complement. -/
theorem compl_top : (¬ Top) = Bot :=
  (compl_unique (p := Top) (q := Bot) (top_join Bot) (top_meet Bot)).symm

theorem compl_bot : (¬ Bot) = Top :=
  (compl_unique (p := Bot) (q := Top) (bot_join Top) (bot_meet Top)).symm

/-! ### Lemmas the tautology tactic needs

`Classicism/Tautology.lean` decides identities between `∧`/`∨`/`¬` formulas by Shannon
expansion. Three laws carry the recursion: a conjunct distributes into a conjunction as
well as into a disjunction, and a conjunct may be pushed under a negation as a *relative*
complement. The last is the only non-obvious one. -/

/-- `l ∧ (q ∧ r) = (l ∧ q) ∧ (l ∧ r)`: a conjunct duplicates over `∧`, as it distributes
over `∨`. -/
theorem meet_meet_split (l q r : Prop) : (l ∧ (q ∧ r)) = ((l ∧ q) ∧ (l ∧ r)) :=
  (calc ((l ∧ q) ∧ (l ∧ r))
      = (l ∧ (q ∧ (l ∧ r))) := (meet_assoc l q (l ∧ r)).symm
    _ = (l ∧ ((q ∧ l) ∧ r)) := congrArg (fun x => l ∧ x) (meet_assoc q l r)
    _ = (l ∧ ((l ∧ q) ∧ r)) := congrArg (fun x => l ∧ (x ∧ r)) (meet_comm q l)
    _ = (l ∧ (l ∧ (q ∧ r))) := congrArg (fun x => l ∧ x) (meet_assoc l q r).symm
    _ = ((l ∧ l) ∧ (q ∧ r)) := meet_assoc l l (q ∧ r)
    _ = (l ∧ (q ∧ r)) := congrArg (fun x => x ∧ (q ∧ r)) (meet_idem l)).symm

/-- `l ∧ ¬q = l ∧ ¬(l ∧ q)`: under the conjunct `l`, the complement of `q` and the
complement of `l ∧ q` agree. This is what lets the recursion pass a negation. -/
theorem relative_compl (l q : Prop) : (l ∧ ¬ q) = (l ∧ ¬ (l ∧ q)) :=
  calc (l ∧ ¬ q) = (Bot ∨ (l ∧ ¬ q)) := (bot_join _).symm
    _ = ((l ∧ ¬ l) ∨ (l ∧ ¬ q)) := by rw [meet_compl]
    _ = (l ∧ ((¬ l) ∨ (¬ q))) := (meet_join_distrib l (¬ l) (¬ q)).symm
    _ = (l ∧ ¬ (l ∧ q)) := by rw [compl_meet]

/-- Base case of the recursion at a positive literal: `a ∧ a = a ∧ ⊤`. -/
theorem meet_self_eq_meet_top (a : Prop) : (a ∧ a) = (a ∧ Top) := by
  rw [meet_idem, meet_top]

/-- Base case at a negative literal: `¬a ∧ a = ¬a ∧ ⊥`. -/
theorem compl_meet_eq_meet_bot (a : Prop) : ((¬ a) ∧ a) = ((¬ a) ∧ Bot) := by
  rw [compl_meet_self, meet_bot]

end Classicism.Strict
