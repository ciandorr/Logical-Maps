import Classicism.Completeness.PartialMaps
import Classicism.Completeness.TypeVariables
import Classicism.Completeness.Lindenbaum

/-!
# The reserve is conservative

An axiom set of `Sig` that is consistent together with Existence at the type variables
(`AxiomSet.varExistence`) stays consistent when read in the ambient signature `ext Sig`,
with the reserve constants added (`AxiomSet.Consistent.lift_of_varExistence`). With
`AxiomSet.Consistent.union_varExistence` this gives the hypothesis of
`exists_world_of_consistent_lift` for every consistent theory of the paper's language.

A derivation of `⊥` in `ext Sig` from sentences of `Sig` uses finitely many constants
(`Derivable.omap_support`). Its reserve constants are eliminated by a partial constant map:
those of type `e` become one variable of type `e`, those of a relational type `ρ` the closed
term `⊤_ρ`, and those of a type variable `var i`, for the finitely many `i` the derivation
needs, one variable of type `var i` each. The result is a derivation of `⊥` in `Sig` in a
context of those variables, which Existence at `e` and at the type variables discharge.
-/

namespace Classicism.Meta

namespace Completeness

variable {Sig : Signature}

open Term

/-- The variable of type `var i` in the context of the variables of the types `var j`,
`j ∈ is`. -/
def varAt : ∀ (is : List Nat) (i : Nat), i ∈ is → Var (is.map Ty.var) (Ty.var i)
  | [], _, h => absurd h List.not_mem_nil
  | j :: is, i, h =>
    if e : i = j then by subst e; exact Var.zero
    else Var.succ (varAt is i ((List.mem_cons.1 h).resolve_left e))

/-- What a reserve constant of type `τ` becomes, in the context `e, var i₁, …, var iₙ`. -/
def reserveImage (is : List Nat) : (τ : Ty) → Option (Term Sig (Ty.e :: is.map Ty.var) τ)
  | .e => some (.var .zero)
  | .rel ρ => some (Term.topR ρ)
  | .var i => if h : i ∈ is then some (.var (.succ (varAt is i h))) else none

/-- The partial map eliminating the reserve. -/
def reserveMap (is : List Nat) : OMap (ext Sig) Sig (Ty.e :: is.map Ty.var)
  | .inl c => some (.const c)
  | .inr (τ, _) => reserveImage is τ

/-- A term of `Sig`, read in the ambient signature, maps back to itself. -/
theorem omap_lift : ∀ {Γ Δ : Ctx} {σ : Ty} (r : Ren Γ Δ) (θ : OMap (ext Sig) Sig Δ),
    (∀ c, θ (Sum.inl c) = some (.const c)) → ∀ (t : Term Sig Γ σ),
    (Completeness.lift t).omap r θ = some (t.rename r)
  | _, _, _, _, _, _, .var _ | _, _, _, _, _, _, .and | _, _, _, _, _, _, .or
  | _, _, _, _, _, _, .not | _, _, _, _, _, _, .all _ | _, _, _, _, _, _, .ex _
  | _, _, _, _, _, _, .eq _ | _, _, _, _, _, _, .constR _ | _, _, _, _, _, _, .negR _
  | _, _, _, _, _, _, .andR _ | _, _, _, _, _, _, .orR _ | _, _, _, _, _, _, .coextR _
  | _, _, _, _, _, _, .boxR _ | _, _, _, _, _, _, .inclR _ => rfl
  | _, _, _, _, _, hθ, .const c => hθ c
  | _, _, _, r, θ, hθ, .app f a => by
    show (Term.app (Completeness.lift f) (Completeness.lift a)).omap r θ = _
    rw [omap_app_of r θ (omap_lift r θ hθ f) (omap_lift r θ hθ a)]; rfl
  | _, _, _, r, θ, hθ, .lam b => by
    show (Term.lam (Completeness.lift b)).omap r θ = _
    rw [omap_lam_of r θ (omap_lift (Ren.lift r) θ.weaken (fun c => by
      show Option.map _ (θ (Sum.inl c)) = _
      rw [hθ c]; rfl) b)]; rfl

/-- A closed sentence placed in a context with one more variable is the weakening of its
placement in the smaller context. -/
theorem close_cons {Θ : Ctx} {σ : Ty} (q : Sentence Sig) :
    (q.close : Formula Sig (σ :: Θ)) = (q.close : Formula Sig Θ).weaken := by
  simp only [Term.close, Term.weaken, Term.rename_rename]
  congr 1; funext τ v; exact nomatch v

/-- Variables whose types are inhabited can be discharged from a derivation of `⊥` from
closed hypotheses. -/
theorem discharge_ctx {A : AxiomSet Sig} :
    ∀ (Θ : Ctx) (L : List (Sentence Sig)),
      (∀ σ ∈ Θ, Theorem A (Term.exists' (σ := σ) (eq' (Term.var .zero) (Term.var .zero)))) →
      Derivable A (L.map (fun q => (q.close : Formula Sig Θ))) Term.bot → Derivable A L Term.bot
  | [], L, _, d => by simpa using d
  | σ :: Θ, L, hΘ, d => by
    refine discharge_ctx Θ L (fun τ hτ => hΘ τ (List.mem_cons_of_mem _ hτ)) ?_
    have hex := Derivable.ofTheorem
      (Δ := L.map (fun q => (q.close : Formula Sig Θ))) (hΘ σ List.mem_cons_self)
    refine Derivable.exE hex (Derivable.weaken₁ ?_)
    have e : L.map (fun q => (q.close : Formula Sig (σ :: Θ))) =
        Hyps.weaken (L.map (fun q => (q.close : Formula Sig Θ))) := by
      simp only [Hyps.weaken, List.map_map]
      exact List.map_congr_left fun q _ => close_cons q
    rw [e] at d
    exact d

/-- The hypotheses of a derivation in the ambient signature, read from `Sig`, map to their
placements. -/
theorem hyps_of_lift {Ax : AxiomSet Sig} {Θ : Ctx} (θ : OMap (ext Sig) Sig Θ)
    (hθ : ∀ c, θ (Sum.inl c) = some (.const c)) :
    ∀ L : List (Sentence (ext Sig)), (∀ q ∈ L, AxiomSet.lift Ax q) →
      ∃ L₀ : List (Sentence Sig), (∀ q ∈ L₀, Ax q) ∧
        OMap.Hyps Ren.ofEmpty θ L (L₀.map fun q => (q.close : Formula Sig Θ))
  | [], _ => ⟨[], by simp, .nil⟩
  | q :: L, h => by
    obtain ⟨b, hb, rfl⟩ := h q List.mem_cons_self
    obtain ⟨L₀, hL₀, hL⟩ := hyps_of_lift θ hθ L (fun q hq => h q (List.mem_cons_of_mem _ hq))
    refine ⟨b :: L₀, fun q hq => ?_, .cons (omap_lift _ θ hθ b) hL⟩
    rcases List.mem_cons.1 hq with rfl | hq
    · exact hb
    · exact hL₀ q hq

/-- **The reserve is conservative**: an axiom set consistent with Existence at the type
variables is consistent in the ambient signature. -/
theorem AxiomSet.Consistent.lift_of_varExistence {Ax : AxiomSet Sig}
    (h : AxiomSet.Consistent (Ax ∪ AxiomSet.varExistence)) :
    AxiomSet.Consistent (AxiomSet.lift Ax) := by
  intro hb
  obtain ⟨L, hL, d⟩ := Theorem.exists_hyps hb
  obtain ⟨F, hF, hd⟩ := Derivable.omap_support (Sig₂ := Sig) d (fun _ ha => ha)
  -- the type variables at which the derivation has reserve constants
  let g : (ext Sig).Const → Nat := fun c => match c with
    | .inr (.var i, _) => i
    | _ => 0
  have hI : (g '' F).Finite := hF.image g
  let is : List Nat := hI.toFinset.toList
  have his : ∀ i n, (Sum.inr (Ty.var i, n) : (ext Sig).Const) ∈ F → i ∈ is := fun i n hc => by
    simp only [is, Finset.mem_toList, Set.Finite.mem_toFinset]
    exact ⟨_, hc, rfl⟩
  let θ : OMap (ext Sig) Sig (Ty.e :: is.map Ty.var) := reserveMap is
  have hcov : θ.Covers F := by
    intro c hc
    rcases c with c | ⟨τ, n⟩
    · rfl
    · cases τ with
      | e => rfl
      | rel ρ => rfl
      | var i => simp only [θ, reserveMap, reserveImage, dif_pos (his i n hc)]; rfl
  obtain ⟨L₀, hL₀, hH⟩ := hyps_of_lift (Ax := Ax) θ (fun _ => rfl) L hL
  have d' := hd Ren.ofEmpty θ hcov hH (p' := Term.bot) rfl
  have d'' : Derivable (C.axioms ∪ (Ax ∪ AxiomSet.varExistence))
      (L₀.map fun q => (q.close : Formula Sig _)) Term.bot :=
    Derivable.mono (fun _ ha => Or.inl ha) d'
  have d₀ := discharge_ctx _ L₀ (fun σ hσ => ?_) d''
  · exact h (Derivable.discharge d₀ (fun q hq => Theorem.ax (Or.inl (hL₀ q hq))))
  rcases List.mem_cons.1 hσ with rfl | hσ
  · exact Derivable.axiom (Or.inl rfl)
  · obtain ⟨i, -, rfl⟩ := List.mem_map.1 hσ
    exact Derivable.axiom (Or.inr (Or.inr ⟨i, rfl⟩))

end Completeness

end Classicism.Meta
