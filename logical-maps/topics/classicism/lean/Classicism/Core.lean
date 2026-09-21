/-!
# Classicism in base Lean: the signature and the type system

This file fixes the objects that Bacon and Dorr's *Classicism* takes for granted, and
nothing else. It is deliberately tiny: everything that follows is either a definition
(a metalinguistic abbreviation of the paper) or a theorem.

## The correspondence

Lean's `Prop` plays the paper's type `t`. Lean's primitive connectives (`→`, `∀`,
`And`, `Or`, `Not`, `Iff`, `Exists`, `Eq`, `True`, `False`) are the logical constants;
each is H-equivalent to the paper's, and Classicism identifies H-equivalents, so the
choice of primitives is immaterial (Classicism, §1.1). Base Lean's rules for these
connectives are exactly the rules of the paper's `H`, with two gaps that the axioms
below fill:

* Base Lean does not prove excluded middle; `H` does (its PC schema). `em` adds it.
* Base Lean allows empty types; `H` proves `∃ x. x = x` at every type. Existence is a
  theorem at every relational type, witnessed by the closed term `⊤_τ`, so only type `e`
  needs the axiom `e_exists`. Without that axiom the fragment is the paper's
  existentially neutral logic `H⁻`, and the library is `C⁻`. `e_exists` is kept separate
  from the type system precisely so that each theorem's axiom report says whether it is a
  theorem of `C⁻` or needs full `C` (Classicism, nn. 12–13).

Everything Lean proves *from these axioms alone* is a theorem of `H` (plus
Existence). Classicism proper adds the rule of Logical Equivalence, which is not an
axiom and cannot be one: see `Classicism/Equivalence.lean` for how it is rendered, and
`README.md` for the discipline every proof must follow.

## The relational type system

The paper's type system `R` admits `e`, `t`, and `σ → τ` whenever `τ ≠ e`. Lean has
many more types. The class `Ty σ` certifies that `σ` is an `R`-type and `Rel τ` that
it is a relational one (ends in `t`); instances exist only for `e`, `Prop` and arrows
into relational types, which is exactly `R`. Schemata over "every type" and "every
relational type" are rendered as `∀ {σ} [Ty σ]` and `∀ {τ} [Rel τ]`. A class rather
than an inductive type is used so that Lean's own `σ → τ` is the type of the
formalisation, not an encoding of it.

`Rel τ` also carries the pointwise Boolean structure that the paper writes with type
subscripts (`¬_τ`, `∧_τ`, `∨_τ`, Figure 1 of Classicism) and the coextension relation
`∀ z̄. X[z̄] ↔ Y[z̄]`, together with two closed identities that let Intensionality be
proved uniformly at every relational type without applying Functionality to a
hypothesis. Those fields are proof-carrying; each instance proves them by Logical
Equivalence.
-/

namespace Classicism

/-- The type of individuals, the paper's `e`. It is a constant of the theory; nothing
is assumed about it beyond `e_exists`. -/
axiom e : Type

/-- Existence at type `e` (Classicism, §1.1). The only Existence instance that base
Lean cannot prove. -/
axiom e_exists : ∃ x : e, x = x

/-- Excluded middle. Base Lean's propositional logic is intuitionistic; `H` contains
every tautology, and this is the one schema that closes the gap. Named to avoid
`Classical.em`, whose proof uses `Classical.choice`. -/
axiom em (p : Prop) : p ∨ ¬ p

/-! ### Necessity and possibility

Classicism defines necessity as identity with the tautology (§1.5): `□p := (p = ⊤)`,
and possibility as distinctness from `⊥`. The tautology is Lean's `True`; the paper's
`∀p.p ∨ ¬∀p.p` is identical to it in C. -/

/-- `□p` : `p` is broadly necessary, that is, identical to `True`. -/
abbrev Box (p : Prop) : Prop := p = True

/-- `◇p` : `p` is broadly possible, that is, distinct from `False`. -/
abbrev Dia (p : Prop) : Prop := ¬ (p = False)

@[inherit_doc] prefix:max "□" => Box
@[inherit_doc] prefix:max "◇" => Dia

/-- The paper's material implication (Figure 1), `λpq. ¬p ∨ q`.

This is **not** Lean's `→`. The arrow is primitive in Lean and `Iff` is an inductive, and
no Classicist or Boolean identity mentions either, so neither is connected to the Boolean
structure of propositions. Wherever an identity is wanted, the paper's abbreviations are
what must appear. See `Classicism/Strict.lean`. -/
def imp (p q : Prop) : Prop := ¬ p ∨ q

/-- The paper's biconditional (Figure 1), `λpq. (¬p ∨ q) ∧ (¬q ∨ p)`. -/
def iff (p q : Prop) : Prop := (¬ p ∨ q) ∧ (¬ q ∨ p)

@[inherit_doc] scoped infixr:25 " ⟹ " => imp
@[inherit_doc] scoped infix:20 " ⟺ " => iff

/-- Algebraic entailment at type `t` (Classicism, Figure 1): `p ≤ q` iff `q = p ∨ q`.
It is equivalent in C to `□(p → q)` but is not defined that way. -/
abbrev entails (p q : Prop) : Prop := q = (p ∨ q)

@[inherit_doc] infix:50 " ≤ " => entails

/-! ### The type classes `Ty` and `Rel` -/

/-- `σ` is a type of the relational type system `R`.

It is a **marker**, carrying no inhabitation claim. That is deliberate: `C⁻`, the paper's
`H⁻` plus any axiomatization of Classicism, is a perfectly good theory in which `e` is a
type whose inhabitation is not provable, and it proves the great majority of the paper's
theorems. If `Ty` required a witness, declaring `e` an `R`-type would silently discharge
`e_exists`, `C⁻` could not be expressed at all, and Existence would come out as a
triviality instead of a theorem with a stated cost. So Existence lives outside the class:
see `Modal.existence_rel`, which needs no axiom, and `Modal.existence_e`, which is the
axiom. A theorem's `#print axioms` report then names `e_exists` exactly when the theorem
really uses it.

The class lives in `Type`, not `Prop`, because an instance argument is type-system
evidence rather than a hypothesis: the checker treats variables of propositional type
as hypotheses that Logical Equivalence may not depend on. -/
class Ty (σ : Type) : Type where
  /-- `σ` is an `R`-type and nothing follows from that alone. -/
  isTy : Unit := ()

/-- `τ` is a **relational** type of `R`: `t`, or an arrow into a relational type. Like
`Ty` a marker, and for a sharper reason than mere economy.

`Rel` below carries the Boolean operations *and* two Logical-Equivalence identities, which
its instances discharge with `propext` and `funext` under the gate. If the only route to
"`σ → τ` is a type of `R`" ran through `Rel`, then a proof needing nothing but that fact
would mention a `Rel` instance and so come out depending on those axioms. A strict proof in
`Classicism/Quantifier.lean` needs `Ty (σ → Prop)` and would have been contaminated exactly
this way. Keeping the type system in pure markers, with `Rel` layered on top, is what keeps
type-system evidence free of the gate. -/
class RelTy (τ : Type) : Type where
  /-- `τ` is a relational type of `R`, and nothing follows from that alone. -/
  isRelTy : Unit := ()

/-- `τ` is a relational type: `Prop`, or `σ → τ'` with `τ'` relational. The Boolean
operations are pointwise (Classicism, Figure 1). `coext X Y` is the paper's
`∀ z̄. X[z̄] ↔ Y[z̄]`, `constP p` lifts a proposition to a constant relation, and the
two identity fields are the closed Logical-Equivalence instances used to prove
Intensionality at this type (§1.5, p. 17). -/
class Rel (τ : Type) extends RelTy τ where
  constP : Prop → τ
  neg : τ → τ
  and : τ → τ → τ
  or : τ → τ → τ
  coext : τ → τ → Prop
  coext_refl : ∀ X : τ, coext X X
  /-- `□_τ`, the operation `Y ↦ λx̄. □Y[x̄]` that the comprehension predicates use. -/
  boxAt : τ → τ
  /-- `∀x̄. X[x̄] → Y[x̄]`, the universally closed pointwise implication. Unboxed: the
  algebraic order `X ≤_τ Y` is its *necessitation*, which is `Order.le_iff`. -/
  boxImp : τ → τ → Prop
  /-- `X ∧_τ ⊤ = X`. -/
  and_constP_true : ∀ X : τ, and X (constP True) = X
  /-- `(λz̄. X[z̄] ∧ (p ∧ ∀ū. X[ū] ↔ Y[ū])) = (λz̄. Y[z̄] ∧ (p ∧ ∀ū. X[ū] ↔ Y[ū]))`. -/
  and_constP_coext : ∀ (X Y : τ) (p : Prop),
    and X (constP (p ∧ coext X Y)) = and Y (constP (p ∧ coext X Y))

export Rel (coext constP boxAt boxImp)

instance instTyE : Ty e := ⟨()⟩

instance (priority := high) instRelTyProp : RelTy Prop := ⟨()⟩

instance (priority := high) instRelTyArrow {σ τ : Type} [Ty σ] [RelTy τ] :
    RelTy (σ → τ) := ⟨()⟩

instance (priority := high) instTyOfRelTy {τ : Type} [RelTy τ] : Ty τ := ⟨()⟩

/-- `Prop` is the relational type `t`. The identity fields are instances of Logical
Equivalence: the arguments of `propext` are closed. -/
instance instRelProp : Rel Prop where
  constP := fun p => p
  neg := Not
  and := And
  or := Or
  coext := Iff
  coext_refl := fun _ => Iff.rfl
  boxAt := Box
  boxImp := fun p q => p → q
  and_constP_true := fun _ =>
    propext ⟨fun h => h.1, fun h => ⟨h, trivial⟩⟩
  and_constP_coext := fun _ _ _ =>
    propext ⟨fun ⟨hp, hr, hpq⟩ => ⟨hpq.1 hp, hr, hpq⟩, fun ⟨hq, hr, hpq⟩ => ⟨hpq.2 hq, hr, hpq⟩⟩

/-- `σ → τ` is relational when `σ` is a type and `τ` is relational. The identity fields
are ζ-Equivalence instances: each is `funext` of a closed identity at `τ`. -/
instance instRelArrow {σ τ : Type} [Ty σ] [Rel τ] : Rel (σ → τ) where
  constP := fun p _ => Rel.constP p
  neg := fun X z => Rel.neg (X z)
  and := fun X Y z => Rel.and (X z) (Y z)
  or := fun X Y z => Rel.or (X z) (Y z)
  coext := fun X Y => ∀ z, Rel.coext (X z) (Y z)
  coext_refl := fun X z => Rel.coext_refl (X z)
  boxAt := fun X z => Rel.boxAt (X z)
  boxImp := fun X Y => ∀ z, Rel.boxImp (X z) (Y z)
  and_constP_true := fun X => funext fun z => Rel.and_constP_true (X z)
  and_constP_coext := fun X Y p => funext fun z =>
    -- `H := ∀ u, coext (X u) (Y u)` is identical to `H ∧ coext (X z) (Y z)`; rewrite
    -- with that closed identity, apply the identity field at `τ`, and rewrite back.
    have absorb : (p ∧ ∀ u, Rel.coext (X u) (Y u))
        = ((p ∧ ∀ u, Rel.coext (X u) (Y u)) ∧ Rel.coext (X z) (Y z)) :=
      propext ⟨fun h => ⟨h, h.2 z⟩, fun h => h.1⟩
    calc Rel.and (X z) (Rel.constP (p ∧ ∀ u, Rel.coext (X u) (Y u)))
        = Rel.and (X z) (Rel.constP ((p ∧ ∀ u, Rel.coext (X u) (Y u)) ∧ Rel.coext (X z) (Y z))) := by
          rw [← absorb]
      _ = Rel.and (Y z) (Rel.constP ((p ∧ ∀ u, Rel.coext (X u) (Y u)) ∧ Rel.coext (X z) (Y z))) :=
          Rel.and_constP_coext (X z) (Y z) _
      _ = Rel.and (Y z) (Rel.constP (p ∧ ∀ u, Rel.coext (X u) (Y u))) := by
          rw [← absorb]

/-- Pointwise `⊤_τ`. -/
abbrev Rel.top (τ : Type) [Rel τ] : τ := Rel.constP True
/-- Pointwise `⊥_τ`. -/
abbrev Rel.bot (τ : Type) [Rel τ] : τ := Rel.constP False

/-- Algebraic entailment at a relational type: `X ≤ Y` iff `Y = X ∨_τ Y`. It is *not*
defined as the pointwise implication; that they agree, once the implication is boxed, is
`Order.le_iff`. -/
abbrev Rel.le {τ : Type} [Rel τ] (X Y : τ) : Prop := Y = Rel.or X Y

@[inherit_doc] scoped infix:50 " ≼ " => Rel.le

end Classicism
