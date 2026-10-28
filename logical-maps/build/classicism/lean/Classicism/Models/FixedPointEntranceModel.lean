import Classicism.Models.FixedPointEntranceBase
import Classicism.Models.QualitativeLinksBase
import Classicism.Semantics.SymmetricExternal

/-!
# The concrete singleton-individual qualitative-link entrance model

Original formalization (misc), 23 October 2026, of the construction in
`research/2026-10-22/notes/fixed-point-entrance-cone.md`, sections 1 and 7
(unpaginated). This instantiates every category, symmetry, support ideal,
and individual domain. Its IsModel proof is obtained from term closure,
not supplied as a premise. Higher-type rigidity verdicts require additional
proofs and are not asserted by this module.
-/

namespace Classicism.Meta.Intensional.FixedPointEntrance.Qualitative

open CategoryTheory
noncomputable section

abbrev tail : Tail where
  X := QualitativeLinks.Node
  Arrow := QualitativeLinks.Arrow
  arrow_id := Or.inl QualitativeLinks.sym_id
  arrow_comp := QualitativeLinks.arrow_comp
  Sym := QualitativeLinks.Sym
  sym_arrow := Or.inl
  sym_id := QualitativeLinks.sym_id
  sym_comp := QualitativeLinks.sym_comp
  sym_inverse := fun {f} hf =>
    ⟨(Equiv.ofBijective f hf.1).symm, QualitativeLinks.sym_inverse hf,
      (Equiv.ofBijective f hf.1).symm_apply_apply,
      (Equiv.ofBijective f hf.1).apply_symm_apply⟩

/-- The pinning category has a singleton root and an isolated fixed point
adjoined to the qualitative-link tail. -/
abbrev cone : FunCat := cat tail

/-- Interpreted individuals are singleton at both objects, independently
of the qualitative-link pinning base. Relational domains are exactly the
symmetric, finitely pinned intensions, recursively at every finite type. -/
noncomputable def model : Premodel Signature.pure cone.Ob :=
  SymmetricExternal.singletonModel cone.De (syms tail) (PinIdeal.fin cone.De) (A tail)

theorem isModel : model.IsModel :=
  SymmetricExternal.singleton_fin_isModel cone.De (syms tail) (A tail) (syms_inv tail)

theorem individual_singleton (W : cone.Ob) : Subsingleton (model.Dom W .e) :=
  SymmetricExternal.singleton_individuals cone.De (syms tail) (PinIdeal.fin cone.De)
    (A tail) W

/-- The concrete collapse remains a genuine tail arrow after adjoining
the fixed point. -/
noncomputable def collapse : B tail ⟶ B tail :=
  lift tail QualitativeLinks.collapseFn (Or.inr QualitativeLinks.collapse_collapses)

theorem collapse_not_sym : collapse ∉ syms tail (B tail) := by
  rintro ⟨f, hf, he⟩
  have e : QualitativeLinks.collapseFn = f := by
    funext x
    exact Option.some.inj (he (some x))
  apply QualitativeLinks.collapse_not_injective
  rw [e]
  exact hf.1.1

/-- Every root-denoting entity, including relations of every finite type,
is fixed after transport by every tail arrow, including this collapse. -/
theorem transported_fixed (σ : Ty) (x : model.Dom (A tail) σ) (h : B tail ⟶ B tail) :
    (model.inner σ).map h ((model.inner σ).map (entrance tail) x) =
      (model.inner σ).map (entrance tail) x :=
  transport_fixed tail (model.inner σ) x h

end
end Classicism.Meta.Intensional.FixedPointEntrance.Qualitative
