import Classicism.Strict.Transform
import Classicism.Background.Order
import Classicism.Pointwise

/-!
# Strict mirrors of the classes `Rel`, `Order` and `Pointwise`

`Rel τ` says that `τ` is a relational type, and carries three laws: `coext` is reflexive,
`X ∧_τ ⊤ = X`, and the identity behind Intensionality. The shallow layer states them with
Lean's `True` and proves them, in the instances, by gated Equivalence: `propext` at `Prop`
and `funext` at `σ → τ`. A proof that cites one of those laws therefore has nothing to
transform *into* until the class has a strict counterpart.

`SRel` is that counterpart, built the way `BA` is. Its laws are **closed identities between
λ-terms**, so that

* at `Prop` each is a tautology, and `boolean_eq` proves it between λ-terms;
* at `σ → τ` each follows from the law at `τ` by `congrArg`, which is Leibniz's Law.

The instance at `σ → τ` in the shallow layer is where ζ is used, as `funext` of a closed
identity. Here there is no `funext` at all: a closed identity about `τ` is lifted to one
about `σ → τ` in one congruence step, because the operations at `σ → τ` are pointwise and β
is free. The third law needs one more idea, that `∀u. C u` is identical to
`(∀u. C u) ∧ C z`, which is Absorption-∨∀.

`Order τ` has one law, relating the algebraic order to the boxed pointwise implication.
Nothing about it needs a new proof. The shallow instances prove it from `K`, `4`, the
Necessity of Identity, the Converse Barcan Formula and Modalized Functionality, all of
which transform; so the law at each instance of the mirror `SOrder` is *the transformer's
own output* on the shallow proof.

`Pointwise τ` (`Classicism/Pointwise.lean`) holds the pointwise laws of the implication
`⊑` at a relational type, each proved at `Prop` as a tautology and at `σ → τ` from the
law at `τ`. Its mirror `SPointwise` is set up exactly as `SOrder`: each law is held as a
necessitation, and each instance's law is the transform of the shallow instance's proof.

The registrations at the end tell the transformer which constant mirrors which.
-/

namespace Classicism.Strict

open Classicism.Axiomatic BA

/-! ### From a closed identity to its necessitation

`L = R` between functions gives `(∀x. L x = R x) = ⊤`: substitute `L` for `R` by Leibniz's
Law, which leaves `Ref`, and close under `∀` by Proposition A.1. -/

theorem eq_lam_top₁ {σ ρ : Type} [Ty σ] [RelTy ρ] {L R : σ → ρ} (h : L = R) :
    (fun x => L x = R x) = (fun _ => Top) :=
  (congrArg (fun (K : σ → ρ) x => L x = K x) h.symm).trans
    (congrArg (fun (K : ρ → Prop) (x : σ) => K (L x)) (ref_lam ρ))

theorem eq_lam_top₃ {σ₁ σ₂ σ₃ ρ : Type} [Ty σ₁] [Ty σ₂] [Ty σ₃] [RelTy ρ]
    {L R : σ₁ → σ₂ → σ₃ → ρ} (h : L = R) :
    (fun x y z => L x y z = R x y z) = (fun _ _ _ => Top) :=
  (congrArg (fun (K : σ₁ → σ₂ → σ₃ → ρ) x y z => L x y z = K x y z) h.symm).trans
    (congrArg (fun (K : ρ → Prop) (x : σ₁) (y : σ₂) (z : σ₃) => K (L x y z)) (ref_lam ρ))

/-- In any algebra: if `C` absorbs `A` on the join side, conjoining `C` to anything below
`A` changes nothing. With Absorption-∨∀ this is `(p ∧ ∀u.Cu) = (p ∧ ∀u.Cu) ∧ Cz`. -/
theorem BA.meet_eq_meet_of_absorb {τ : Type} [BA τ] {A C : τ} (P : τ)
    (h : (C ⊔ A) = C) : (P ⊓ A) = ((P ⊓ A) ⊓ C) :=
  have h₁ : BA.imp A C = top := BA.imp_top_of_join h
  have taut : BA.imp (BA.imp A C) (BA.iff (P ⊓ A) ((P ⊓ A) ⊓ C)) = top := by boolean_eq
  BA.eq_of_iff_top (BA.mp_top taut h₁)

/-! ### `SRel` -/

/-- The strict mirror of `Rel`: the same data, with the three laws as closed identities in
the paper's vocabulary. -/
class SRel (τ : Type) extends RelTy τ where
  /-- The constant relation at a proposition. -/
  constP : Prop → τ
  /-- Pointwise negation. -/
  neg : τ → τ
  /-- Pointwise conjunction. -/
  and : τ → τ → τ
  /-- Pointwise disjunction. -/
  or : τ → τ → τ
  /-- Coextensiveness. -/
  coext : τ → τ → Prop
  /-- `coext` is reflexive. -/
  coext_refl : (fun X : τ => coext X X) = (fun _ => Top)
  /-- Pointwise necessity. -/
  boxAt : τ → τ
  /-- Pointwise implication, as a proposition. -/
  incl : τ → τ → Prop
  /-- `X ∧_τ ⊤ = X`. -/
  and_constP_true : (fun X : τ => and X (constP Top)) = (fun X => X)
  /-- The identity behind Intensionality (Classicism, §1.5). -/
  and_constP_coext :
    (fun (X Y : τ) (p : Prop) => and X (constP (p ∧ coext X Y)))
      = (fun X Y p => and Y (constP (p ∧ coext X Y)))

/-- At `Prop` the three laws are tautologies, proved between λ-terms. -/
instance instSRelProp : SRel Prop where
  constP := fun p => p
  neg := Not
  and := And
  or := Or
  coext := Classicism.iff
  coext_refl := show (fun X : Prop => Classicism.iff X X) = (fun _ => Top) by boolean_eq
  boxAt := Strict.Box
  incl := Classicism.imp
  and_constP_true := show (fun X : Prop => X ∧ Top) = (fun X => X) by boolean_eq
  and_constP_coext :=
    show (fun (X Y p : Prop) => X ∧ (p ∧ Classicism.iff X Y))
        = (fun X Y p => Y ∧ (p ∧ Classicism.iff X Y)) by boolean_eq

/-- At `σ → τ` each law is the law at `τ`, lifted by congruence. No `funext`. -/
instance instSRelArrow {σ τ : Type} [Ty σ] [SRel τ] : SRel (σ → τ) where
  constP := fun p _ => SRel.constP p
  neg := fun X z => SRel.neg (X z)
  and := fun X Y z => SRel.and (X z) (Y z)
  or := fun X Y z => SRel.or (X z) (Y z)
  coext := fun X Y => ∀ z, SRel.coext (X z) (Y z)
  coext_refl :=
    (congrArg (fun (K : τ → Prop) (X : σ → τ) => ∀ z, K (X z)) SRel.coext_refl).trans
      (congrArg (fun (r : Prop) (_ : σ → τ) => r) forall_const_top)
  boxAt := fun X z => SRel.boxAt (X z)
  incl := fun X Y => ∀ z, SRel.incl (X z) (Y z)
  and_constP_true :=
    congrArg (fun (K : τ → τ) (X : σ → τ) z => K (X z)) SRel.and_constP_true
  and_constP_coext :=
    let T := (σ → τ) → (σ → τ) → Prop → σ → Prop
    let ALL : T := fun X Y _ _ => ∀ u, SRel.coext (X u) (Y u)
    let Cz : T := fun X Y _ z => SRel.coext (X z) (Y z)
    let P : T := fun _ _ p _ => p
    -- Absorption-∨∀, under the binders: `Cz ∨ ∀C = Cz`
    have ui : (Cz ⊔ ALL) = Cz :=
      congrArg (fun (K : (σ → Prop) → σ → Prop) (X Y : σ → τ) (_ : Prop) z =>
        K (fun u => SRel.coext (X u) (Y u)) z) (absorption_or_forall σ)
    have absorb : (P ⊓ ALL) = ((P ⊓ ALL) ⊓ Cz) := BA.meet_eq_meet_of_absorb P ui
    -- conjoin `coext (X z) (Y z)`, apply the law at `τ`, and take it off again
    (congrArg (fun (K : T) (X Y : σ → τ) p z => SRel.and (X z) (SRel.constP (K X Y p z)))
        absorb).trans <|
      (congrArg (fun (K : τ → τ → Prop → τ) (X Y : σ → τ) (p : Prop) z =>
          K (X z) (Y z) (p ∧ ∀ u, SRel.coext (X u) (Y u))) SRel.and_constP_coext).trans
        (congrArg (fun (K : T) (X Y : σ → τ) p z => SRel.and (Y z) (SRel.constP (K X Y p z)))
          absorb).symm

/-- `⊤_τ`. -/
abbrev SRel.top (τ : Type) [SRel τ] : τ := SRel.constP Top
/-- `⊥_τ`. -/
abbrev SRel.bot (τ : Type) [SRel τ] : τ := SRel.constP Bot
/-- Algebraic entailment at a relational type. -/
abbrev SRel.le {τ : Type} [SRel τ] (X Y : τ) : Prop := Y = SRel.or X Y

/-! The necessitations of the three laws, which is the form the transformer cites. -/

theorem SRel.coext_refl_nec (τ : Type) [SRel τ] : (∀ X : τ, SRel.coext X X) = Top :=
  forall_top₁ SRel.coext_refl

theorem SRel.and_constP_true_nec (τ : Type) [SRel τ] :
    (∀ X : τ, SRel.and X (SRel.constP Top) = X) = Top :=
  forall_top₁ (eq_lam_top₁ SRel.and_constP_true)

theorem SRel.and_constP_coext_nec (τ : Type) [SRel τ] :
    (∀ (X Y : τ) (p : Prop), SRel.and X (SRel.constP (p ∧ SRel.coext X Y))
      = SRel.and Y (SRel.constP (p ∧ SRel.coext X Y))) = Top :=
  forall_top₃ (eq_lam_top₃ SRel.and_constP_coext)

/-! ### `SOrder` -/

/-- The strict mirror of `Order`. Its law is held as a necessitation, since that is what
the transformer produces from the shallow instances' proofs. -/
class SOrder (τ : Type) [SRel τ] : Type where
  /-- `X ≤ Y` iff `□(X ⊑ Y)`, necessitated. -/
  le_iff : (∀ X Y : τ, Classicism.iff (SRel.le X Y) (Strict.Box (SRel.incl X Y))) = Top

theorem SOrder.le_iff_nec (τ : Type) [SRel τ] [SOrder τ] :
    (∀ X Y : τ, Classicism.iff (SRel.le X Y) (Strict.Box (SRel.incl X Y))) = Top :=
  SOrder.le_iff

/-! ### `SPointwise` -/

/-- The strict mirror of `Pointwise`: the pointwise laws of `⊑`, each as a necessitation. -/
class SPointwise (τ : Type) [SRel τ] : Type where
  incl_refl : (∀ X : τ, SRel.incl X X) = Top
  incl_trans : (∀ X Y Z : τ, Classicism.imp (SRel.incl X Y)
    (Classicism.imp (SRel.incl Y Z) (SRel.incl X Z))) = Top
  incl_and : (∀ X Y Z : τ, Classicism.imp (SRel.incl Z X)
    (Classicism.imp (SRel.incl Z Y) (SRel.incl Z (SRel.and X Y)))) = Top
  incl_and_left : (∀ X Y : τ, SRel.incl (SRel.and X Y) X) = Top
  incl_and_right : (∀ X Y : τ, SRel.incl (SRel.and X Y) Y) = Top
  incl_and_neg : (∀ X Y : τ, SRel.incl (SRel.and X (SRel.neg X)) Y) = Top
  incl_constP : (∀ (X : τ) (p : Prop), Classicism.imp p (SRel.incl X (SRel.constP p))) = Top
  incl_of_constP :
    (∀ (X : τ) (p : Prop), Classicism.imp (¬ p) (SRel.incl (SRel.constP p) X)) = Top
  coext_of_incl : (∀ X Y : τ, Classicism.imp (SRel.incl X Y)
    (Classicism.imp (SRel.incl Y X) (SRel.coext X Y))) = Top
  incl_of_coext : (∀ X Y : τ, Classicism.imp (SRel.coext X Y) (SRel.incl X Y)) = Top
  incl_of_coext' : (∀ X Y : τ, Classicism.imp (SRel.coext X Y) (SRel.incl Y X)) = Top

section
variable (τ : Type) [SRel τ] [SPointwise τ]
theorem SPointwise.incl_refl_nec : (∀ X : τ, SRel.incl X X) = Top := SPointwise.incl_refl
theorem SPointwise.incl_trans_nec : (∀ X Y Z : τ, Classicism.imp (SRel.incl X Y)
    (Classicism.imp (SRel.incl Y Z) (SRel.incl X Z))) = Top := SPointwise.incl_trans
theorem SPointwise.incl_and_nec : (∀ X Y Z : τ, Classicism.imp (SRel.incl Z X)
    (Classicism.imp (SRel.incl Z Y) (SRel.incl Z (SRel.and X Y)))) = Top :=
  SPointwise.incl_and
theorem SPointwise.incl_and_left_nec : (∀ X Y : τ, SRel.incl (SRel.and X Y) X) = Top :=
  SPointwise.incl_and_left
theorem SPointwise.incl_and_right_nec : (∀ X Y : τ, SRel.incl (SRel.and X Y) Y) = Top :=
  SPointwise.incl_and_right
theorem SPointwise.incl_and_neg_nec :
    (∀ X Y : τ, SRel.incl (SRel.and X (SRel.neg X)) Y) = Top := SPointwise.incl_and_neg
theorem SPointwise.incl_constP_nec :
    (∀ (X : τ) (p : Prop), Classicism.imp p (SRel.incl X (SRel.constP p))) = Top :=
  SPointwise.incl_constP
theorem SPointwise.incl_of_constP_nec :
    (∀ (X : τ) (p : Prop), Classicism.imp (¬ p) (SRel.incl (SRel.constP p) X)) = Top :=
  SPointwise.incl_of_constP
theorem SPointwise.coext_of_incl_nec : (∀ X Y : τ, Classicism.imp (SRel.incl X Y)
    (Classicism.imp (SRel.incl Y X) (SRel.coext X Y))) = Top := SPointwise.coext_of_incl
theorem SPointwise.incl_of_coext_nec :
    (∀ X Y : τ, Classicism.imp (SRel.coext X Y) (SRel.incl X Y)) = Top :=
  SPointwise.incl_of_coext
theorem SPointwise.incl_of_coext'_nec :
    (∀ X Y : τ, Classicism.imp (SRel.coext X Y) (SRel.incl Y X)) = Top :=
  SPointwise.incl_of_coext'
end

end Classicism.Strict

/-! ### Registrations -/

#classicism_mirror Classicism.Rel Classicism.Strict.SRel
#classicism_mirror Classicism.Rel.toRelTy Classicism.Strict.SRel.toRelTy
#classicism_mirror Classicism.Rel.constP Classicism.Strict.SRel.constP
#classicism_mirror Classicism.Rel.neg Classicism.Strict.SRel.neg
#classicism_mirror Classicism.Rel.and Classicism.Strict.SRel.and
#classicism_mirror Classicism.Rel.or Classicism.Strict.SRel.or
#classicism_mirror Classicism.Rel.coext Classicism.Strict.SRel.coext
#classicism_mirror Classicism.Rel.boxAt Classicism.Strict.SRel.boxAt
#classicism_mirror Classicism.Rel.incl Classicism.Strict.SRel.incl
#classicism_mirror Classicism.Rel.top Classicism.Strict.SRel.top
#classicism_mirror Classicism.Rel.bot Classicism.Strict.SRel.bot
#classicism_mirror Classicism.Rel.le Classicism.Strict.SRel.le
#classicism_mirror Classicism.instRelProp Classicism.Strict.instSRelProp
#classicism_mirror Classicism.instRelArrow Classicism.Strict.instSRelArrow

#classicism_nec Classicism.Rel.coext_refl Classicism.Strict.SRel.coext_refl_nec
#classicism_nec Classicism.Rel.and_constP_true Classicism.Strict.SRel.and_constP_true_nec
#classicism_nec Classicism.Rel.and_constP_coext Classicism.Strict.SRel.and_constP_coext_nec

#classicism_mirror Classicism.Order Classicism.Strict.SOrder
#classicism_nec Classicism.Order.le_iff Classicism.Strict.SOrder.le_iff_nec

/-! ### The instances of `SOrder`, from the transformer

`le_iff_prop` and `le_iff_arrow` are the shallow proofs of the law. Their transforms are the
law of the mirror, word for word. The second cites the law at `τ`, which by then is
registered, and Modalized Functionality, which the transformer derives from `SRel`. -/

#classicism_transform Classicism.le_iff_prop

instance Classicism.Strict.instSOrderProp : Classicism.Strict.SOrder Prop :=
  ⟨Classicism.le_iff_prop.nec⟩

#classicism_mirror Classicism.instOrderProp Classicism.Strict.instSOrderProp

#classicism_transform Classicism.le_iff_arrow

instance Classicism.Strict.instSOrderArrow {σ τ : Type} [Classicism.Ty σ]
    [Classicism.Strict.SRel τ] [Classicism.Strict.SOrder τ] :
    Classicism.Strict.SOrder (σ → τ) :=
  ⟨Classicism.le_iff_arrow.nec⟩

#classicism_mirror Classicism.instOrderArrow Classicism.Strict.instSOrderArrow

/-! ### `SPointwise`, from the transformer

As for `SOrder`: the class is registered first, then each shallow instance's law is
transformed, and the mirror instance is made of the transforms. -/

#classicism_mirror Classicism.Pointwise Classicism.Strict.SPointwise
#classicism_nec Classicism.Pointwise.incl_refl Classicism.Strict.SPointwise.incl_refl_nec
#classicism_nec Classicism.Pointwise.incl_trans Classicism.Strict.SPointwise.incl_trans_nec
#classicism_nec Classicism.Pointwise.incl_and Classicism.Strict.SPointwise.incl_and_nec
#classicism_nec Classicism.Pointwise.incl_and_left Classicism.Strict.SPointwise.incl_and_left_nec
#classicism_nec Classicism.Pointwise.incl_and_right Classicism.Strict.SPointwise.incl_and_right_nec
#classicism_nec Classicism.Pointwise.incl_and_neg Classicism.Strict.SPointwise.incl_and_neg_nec
#classicism_nec Classicism.Pointwise.incl_constP Classicism.Strict.SPointwise.incl_constP_nec
#classicism_nec Classicism.Pointwise.incl_of_constP Classicism.Strict.SPointwise.incl_of_constP_nec
#classicism_nec Classicism.Pointwise.coext_of_incl Classicism.Strict.SPointwise.coext_of_incl_nec
#classicism_nec Classicism.Pointwise.incl_of_coext Classicism.Strict.SPointwise.incl_of_coext_nec
#classicism_nec Classicism.Pointwise.incl_of_coext' Classicism.Strict.SPointwise.incl_of_coext'_nec

#classicism_transform Classicism.incl_refl_prop Classicism.incl_trans_prop
  Classicism.incl_and_prop Classicism.incl_and_left_prop Classicism.incl_and_right_prop
  Classicism.incl_and_neg_prop Classicism.incl_constP_prop Classicism.incl_of_constP_prop
  Classicism.coext_of_incl_prop Classicism.incl_of_coext_prop Classicism.incl_of_coext'_prop

instance Classicism.Strict.instSPointwiseProp : Classicism.Strict.SPointwise Prop where
  incl_refl := Classicism.incl_refl_prop.nec
  incl_trans := Classicism.incl_trans_prop.nec
  incl_and := Classicism.incl_and_prop.nec
  incl_and_left := Classicism.incl_and_left_prop.nec
  incl_and_right := Classicism.incl_and_right_prop.nec
  incl_and_neg := Classicism.incl_and_neg_prop.nec
  incl_constP := Classicism.incl_constP_prop.nec
  incl_of_constP := Classicism.incl_of_constP_prop.nec
  coext_of_incl := Classicism.coext_of_incl_prop.nec
  incl_of_coext := Classicism.incl_of_coext_prop.nec
  incl_of_coext' := Classicism.incl_of_coext'_prop.nec

#classicism_mirror Classicism.instPointwiseProp Classicism.Strict.instSPointwiseProp

#classicism_transform Classicism.incl_refl_arrow Classicism.incl_trans_arrow
  Classicism.incl_and_arrow Classicism.incl_and_left_arrow Classicism.incl_and_right_arrow
  Classicism.incl_and_neg_arrow Classicism.incl_constP_arrow Classicism.incl_of_constP_arrow
  Classicism.coext_of_incl_arrow Classicism.incl_of_coext_arrow Classicism.incl_of_coext'_arrow

instance Classicism.Strict.instSPointwiseArrow {σ τ : Type} [Classicism.Ty σ]
    [Classicism.Strict.SRel τ] [Classicism.Strict.SPointwise τ] :
    Classicism.Strict.SPointwise (σ → τ) where
  incl_refl := Classicism.incl_refl_arrow.nec
  incl_trans := Classicism.incl_trans_arrow.nec
  incl_and := Classicism.incl_and_arrow.nec
  incl_and_left := Classicism.incl_and_left_arrow.nec
  incl_and_right := Classicism.incl_and_right_arrow.nec
  incl_and_neg := Classicism.incl_and_neg_arrow.nec
  incl_constP := Classicism.incl_constP_arrow.nec
  incl_of_constP := Classicism.incl_of_constP_arrow.nec
  coext_of_incl := Classicism.coext_of_incl_arrow.nec
  incl_of_coext := Classicism.incl_of_coext_arrow.nec
  incl_of_coext' := Classicism.incl_of_coext'_arrow.nec

#classicism_mirror Classicism.instPointwiseArrow Classicism.Strict.instSPointwiseArrow
