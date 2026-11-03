import Lean.Elab.Tactic
import Classicism.Completeness.Theories
import Classicism.Syntax.SentenceSchemas
import Classicism.Syntax.Pure

/-!
# Boxed results from unboxed ones

The map's boxed twins: a result `□A₁, …, □Aₙ ⇒ □B` whose argument is "necessitate the
argument for `A₁, …, Aₙ ⇒ B` and distribute by `K`". One general theorem does this for
every such result, as a fact about entailment between schemas:

* `Entails.box`: `A ⟹ B` gives `A.box ⟹ B.box`. A theorem of `C ∪ A` uses finitely many
  sentences of `A` (`Completeness.Theorem.exists_hyps`); from `q₁, …, qₖ ⊢ b` in `C`,
  `□q₁, …, □qₖ ⊢ □b`, by the deduction theorem, `nec` and `K`
  (`Completeness.Derivable.box_hyps`).
* `Entails.box_union`: the form for a union of premises.
* For the map's statements, which quantify over the schema `Ax` that entails the premises:
  `unbox Ax`, the sentences whose necessitations `Ax` proves. If `Ax` entails each `□Aᵢ`,
  `unbox Ax` entails each `Aᵢ`; the unboxed statement at `unbox Ax` then gives
  `unbox Ax ⟹ B`, and so `Ax ⟹ (unbox Ax).box ⟹ B.box`. This needs no case on the number
  of premises: the tactic `map_boxed h` turns the certificate `h` of an unboxed result's
  statement into one of its boxed twin's, matching each boxed premise `P.NecX.schemaIn` with
  the box of `P.X.schemaIn` (`box_schema`, the tactic `map_box` of `Map.lean` at the pure
  signature).
-/

namespace Classicism.Meta.AxiomSet

variable {Sig : Signature}

/-- **Necessitation of an entailment**: if `A ⟹ B` then `□A ⟹ □B`. -/
theorem Entails.box {A B : AxiomSet Sig} (h : A ⟹ B) : A.box ⟹ B.box := by
  rintro _ ⟨b, hb, rfl⟩
  obtain ⟨L, hL, d⟩ := Completeness.Theorem.exists_hyps (h b hb)
  refine Completeness.Theorem.of_hyps (L := L.map Term.box) ?_ (Completeness.Derivable.box_hyps d)
  intro q hq
  obtain ⟨p, hp, rfl⟩ := List.mem_map.1 hq
  exact mem_box (hL p hp)

/-- `□(A ∪ B)` is `□A ∪ □B`. -/
theorem box_union_subset (A B : AxiomSet Sig) : (A ∪ B).box ⊆ A.box ∪ B.box := by
  rintro _ ⟨p, hp | hp, rfl⟩
  · exact Or.inl (mem_box hp)
  · exact Or.inr (mem_box hp)

/-- **Necessitation of an entailment from a union**: if `A ∪ B ⟹ D` then `□A ∪ □B ⟹ □D`. -/
theorem Entails.box_union {A B D : AxiomSet Sig} (h : A ∪ B ⟹ D) : A.box ∪ B.box ⟹ D.box :=
  Entails.trans (Entails.of_subset (box_union_subset A B)) (Entails.box h)

/-- The sentences whose necessitations `Ax` proves. -/
def unbox (Ax : AxiomSet Sig) : AxiomSet Sig := fun p => Theorem (C.axioms ∪ Ax) (Term.box p)

/-- `Ax` entails the necessitation of what it unboxes to. -/
theorem entails_box_unbox (Ax : AxiomSet Sig) : Ax ⟹ (unbox Ax).box := by
  rintro _ ⟨p, hp, rfl⟩
  exact hp

/-- What `Ax` entails the necessitation of, `unbox Ax` entails. -/
theorem unbox_entails {Ax A : AxiomSet Sig} (h : Ax ⟹ A.box) : unbox Ax ⟹ A :=
  fun _ ha => Theorem.ax (h _ (mem_box ha))

/-- What `unbox Ax` entails, `Ax` entails the necessitation of. -/
theorem entails_box_of_unbox {Ax B : AxiomSet Sig} (h : unbox Ax ⟹ B) : Ax ⟹ B.box :=
  Entails.trans (entails_box_unbox Ax) (Entails.box h)

/-- Reading a pure schema in a signature commutes with necessitation. -/
theorem ofPure_box_subset (A : AxiomSet Signature.pure) :
    (AxiomSet.ofPure (Sig := Sig) A).box ⊆ AxiomSet.ofPure A.box := by
  rintro _ ⟨_, ⟨p, hp, rfl⟩, rfl⟩
  exact ⟨Term.box p, mem_box hp, rfl⟩

theorem box_ofPure_subset (A : AxiomSet Signature.pure) :
    AxiomSet.ofPure (Sig := Sig) A.box ⊆ (AxiomSet.ofPure A).box := by
  rintro _ ⟨_, ⟨p, hp, rfl⟩, rfl⟩
  exact ⟨Term.ofPure p, ⟨p, hp, rfl⟩, rfl⟩

/-- A boxed premise, for the unboxed statement at `unbox Ax`: `N` the schema of the boxed
principle, whose sentences are those of `A.box`. -/
theorem unbox_entails_ofPure {Ax : AxiomSet Sig} {A N : AxiomSet Signature.pure}
    (hN : A.box ⊆ N) (h : Ax ⟹ AxiomSet.ofPure N) : unbox Ax ⟹ AxiomSet.ofPure A :=
  unbox_entails (Entails.trans h (Entails.of_subset (by
    rintro _ ⟨_, ⟨p, hp, rfl⟩, rfl⟩
    exact ⟨Term.box p, hN _ (mem_box hp), rfl⟩)))

/-- The boxed conclusion: `N` the schema of the boxed principle, whose sentences are those
of `B.box`. -/
theorem entails_ofPure_of_unbox {Ax : AxiomSet Sig} {B N : AxiomSet Signature.pure}
    (hN : N ⊆ B.box) (h : unbox Ax ⟹ AxiomSet.ofPure B) : Ax ⟹ AxiomSet.ofPure N :=
  Entails.mono_right (fun a ha => box_ofPure_subset B a (by
      obtain ⟨p, hp, rfl⟩ := ha
      exact ⟨p, hN p hp, rfl⟩))
    (entails_box_of_unbox h)

end Classicism.Meta.AxiomSet

namespace Classicism.Meta

/-- `N ⊆ box A` or `box A ⊆ N`, for `N` the schema of the boxed principle of `A`: their
instances are the same sentences (as `map_box` in `Map.lean`). -/
syntax "box_schema" : tactic
macro_rules
  | `(tactic| box_schema) => `(tactic| first
      | (intro _ h; cases h; exact AxiomSet.mem_box rfl)
      | (intro _ h; obtain ⟨_, hc, he⟩ := h; cases he; exact AxiomSet.mem_box ⟨_, hc, rfl⟩)
      | (intro _ h; obtain ⟨_, _, hc₁, hc₂, he⟩ := h; cases he
         exact AxiomSet.mem_box ⟨_, _, hc₁, hc₂, rfl⟩)
      | (intro _ h; obtain ⟨_, hp, he⟩ := h; cases hp; cases he; rfl)
      | (intro _ h; obtain ⟨_, ⟨_, hc, hp⟩, he⟩ := h; cases hp; cases he; exact ⟨_, hc, rfl⟩)
      | (intro _ h; obtain ⟨_, ⟨_, _, hc₁, hc₂, hp⟩, he⟩ := h; cases hp; cases he
         exact ⟨_, _, hc₁, hc₂, rfl⟩))

open Lean Elab Tactic in
/-- Close `unbox Ax ⟹ ofPure A` from a hypothesis `Ax ⟹ ofPure N` with `N` the boxed schema of
`A`, trying each hypothesis in turn. -/
elab "unbox_premise" : tactic => withMainContext do
  for ldecl in (← getLCtx) do
    if ldecl.isImplementationDetail then continue
    unless (← instantiateMVars ldecl.type).isAppOf ``AxiomSet.Entails do continue
    let saved ← saveState
    try
      let h ← Term.exprToSyntax ldecl.toExpr
      Term.withoutErrToSorry <| evalTactic
        (← `(tactic| exact AxiomSet.unbox_entails_ofPure (by box_schema) $h))
      return
    catch _ => saved.restore
  throwError "unbox_premise: no hypothesis entails the boxed premise"

/-- `map_boxed h`: from `h`, a proof of an unboxed result's statement
`∀ {Sig} (_ : Sig.Admitted) Ax, Entails Ax A₁ → … → Entails Ax B`, the boxed twin's
`∀ {Sig} (_ : Sig.Admitted) Ax, Entails Ax N₁ → … → Entails Ax N`, with `Nᵢ` the boxed
schema of `Aᵢ` and `N` of `B`: the unboxed statement at `unbox Ax`, necessitated. -/
macro "map_boxed " h:term : tactic => `(tactic| (
  intro _ hS Ax
  intros
  refine AxiomSet.entails_ofPure_of_unbox ?_
    (by apply $h hS (AxiomSet.unbox Ax) <;> unbox_premise)
  box_schema))

end Classicism.Meta
