import Classicism.Coalesced.Premodel
import Classicism.Semantics.IntensionalTheory
import Classicism.Syntax.Constants

/-!
# Constants as parameters

A premodel whose pure reduct is a model at an object `V` stays a model when it is re-based at
`V` with *any* values of the constants there (`Premodel.isModel_rebase`): the constants of a
term behave as parameters. Each term mentions finitely many constants (`Term.consts`); put
for them variables beyond the term's context (`Term.abstractConsts`), and the value of the
term under the values `J` is the value of the pure term so obtained under the assignment
extended by `J` (`sem_abstractConsts`), which is inner since the reduct is a model.

This is what the interpretation-arrow members of the group `coalesced-sums` need: the
component seen from the root arrow `⟨V, J⟩` is `V`'s component re-based at `V` with the
interpretation `J`, for every interpretation `J` (`Coalesced/Interpretations.lean`).
-/

namespace Classicism.Meta

/-! ### Appending contexts and assignments -/

namespace Var

/-- A variable of `Γ`, in `Γ ++ Δ`. -/
def appendL : ∀ {Γ : Ctx} (Δ : Ctx) {σ : Ty}, Var Γ σ → Var (Γ ++ Δ) σ
  | _, _, _, .zero => .zero
  | _, Δ, _, .succ v => .succ (appendL Δ v)

/-- A variable of `Δ`, in `Γ ++ Δ`. -/
def appendR : ∀ (Γ : Ctx) {Δ : Ctx} {σ : Ty}, Var Δ σ → Var (Γ ++ Δ) σ
  | [], _, _, v => v
  | _ :: Γ, _, _, v => .succ (appendR Γ v)

/-- The variable of a constant `c ∈ cs` in the context of the types of `cs`: its first
occurrence. -/
noncomputable def ofMem {Sig : Signature} (c : Sig.Const) :
    ∀ cs : List Sig.Const, c ∈ cs → Var (cs.map Sig.typeOf) (Sig.typeOf c)
  | c' :: cs, h => by
    classical
    exact if e : c' = c then by subst e; exact .zero
      else .succ (ofMem c cs ((List.mem_cons.1 h).resolve_left (Ne.symm e)))

end Var

namespace IEnv

variable {Dom : Ty → Type}

/-- The assignment on `Γ ++ Δ` from assignments on `Γ` and on `Δ`. -/
def append : ∀ {Γ Δ : Ctx}, IEnv Dom Γ → IEnv Dom Δ → IEnv Dom (Γ ++ Δ)
  | _, _, .nil, e => e
  | _, _, .cons x g, e => .cons x (append g e)

@[simp] theorem get_appendL : ∀ {Γ Δ : Ctx} {σ : Ty} (v : Var Γ σ) (g : IEnv Dom Γ) (e : IEnv Dom Δ),
    (append g e).get (v.appendL Δ) = g.get v
  | _, _, _, .zero, .cons _ _, _ => rfl
  | _, _, _, .succ v, .cons _ g, e => get_appendL v g e

@[simp] theorem get_appendR : ∀ {Γ Δ : Ctx} {σ : Ty} (v : Var Δ σ) (g : IEnv Dom Γ) (e : IEnv Dom Δ),
    (append g e).get (Var.appendR Γ v) = e.get v
  | _, _, _, _, .nil, _ => rfl
  | _, _, _, v, .cons _ g, e => get_appendR v g e

theorem map_append {Dom' : Ty → Type} (f : ∀ σ, Dom σ → Dom' σ) :
    ∀ {Γ Δ : Ctx} (g : IEnv Dom Γ) (e : IEnv Dom Δ), (append g e).map f = append (g.map f) (e.map f)
  | _, _, .nil, _ => rfl
  | _, _, .cons x g, e => congrArg (IEnv.cons (f _ x)) (map_append f g e)

/-- The assignment to the variables of a list of constants of the values `val`. -/
def ofConsts {Sig : Signature} (val : ∀ c : Sig.Const, Dom (Sig.typeOf c)) :
    ∀ cs : List Sig.Const, IEnv Dom (cs.map Sig.typeOf)
  | [] => .nil
  | c :: cs => .cons (val c) (ofConsts val cs)

theorem get_ofConsts {Sig : Signature} (val : ∀ c : Sig.Const, Dom (Sig.typeOf c)) (c : Sig.Const) :
    ∀ (cs : List Sig.Const) (h : c ∈ cs), (ofConsts val cs).get (Var.ofMem c cs h) = val c
  | c' :: cs, h => by
    classical
    by_cases e : c' = c
    · subst e
      simp only [Var.ofMem, dite_true]
      rfl
    · simp only [Var.ofMem, e, dite_false]
      exact get_ofConsts val c cs _

theorem map_ofConsts {Sig : Signature} {Dom' : Ty → Type} (f : ∀ σ, Dom σ → Dom' σ)
    (val : ∀ c : Sig.Const, Dom (Sig.typeOf c)) :
    ∀ cs : List Sig.Const, (ofConsts val cs).map f = ofConsts (fun c => f _ (val c)) cs
  | [] => rfl
  | c :: cs => congrArg (IEnv.cons (f _ (val c))) (map_ofConsts f val cs)

end IEnv

/-! ### Putting variables for constants -/

namespace Term

variable {Sig : Signature}

/-- Put for each constant of a term, all among `cs`, its variable beyond the term's context:
a pure term in `Γ ++ cs.map Sig.typeOf`. -/
noncomputable def abstractConsts (cs : List Sig.Const) :
    ∀ {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ), t.consts ⊆ {c | c ∈ cs} →
      Term Signature.pure (Γ ++ cs.map Sig.typeOf) σ
  | _, _, .var v, _ => .var (v.appendL _)
  | Γ, _, .const c, h => .var (Var.appendR Γ (Var.ofMem c cs (h (Set.mem_singleton c))))
  | _, _, .app f a, h =>
    .app (abstractConsts cs f ((consts_app_left f a).trans h))
      (abstractConsts cs a ((consts_app_right f a).trans h))
  | _, _, .lam b, h => .lam (abstractConsts cs b h)
  | _, _, .and, _ => .and
  | _, _, .or, _ => .or
  | _, _, .not, _ => .not
  | _, _, .all σ, _ => .all σ
  | _, _, .ex σ, _ => .ex σ
  | _, _, .eq σ, _ => .eq σ
  | _, _, .constR ρ, _ => .constR ρ
  | _, _, .negR ρ, _ => .negR ρ
  | _, _, .andR ρ, _ => .andR ρ
  | _, _, .orR ρ, _ => .orR ρ
  | _, _, .coextR ρ, _ => .coextR ρ
  | _, _, .boxR ρ, _ => .boxR ρ
  | _, _, .inclR ρ, _ => .inclR ρ

end Term

namespace Intensional.Premodel

open CategoryTheory

variable {Sig : Signature} {C : Type} [SmallCategory C]

/-- The pure reduct of `A`, based at `V`: `A`'s actions and inclusions, no constants.
Reducible, so that its domains are `A`'s to the elaborator. -/
abbrev reductAt (A : Premodel Sig C) (V : C) : Premodel Signature.pure C where
  W₀ := V
  inner := A.inner
  nonempty_e := A.nonempty_e
  incl := A.incl
  incl_map := A.incl_map
  incl_injective := A.incl_injective
  I := fun c => nomatch c

theorem reduct_rebase (A : Premodel Sig C) (V : C) (J : ∀ c : Sig.Const, A.Dom V (Sig.typeOf c)) :
    (A.rebase V J).reduct = A.reductAt V := rfl

theorem reductAt_Incl (A : Premodel Sig C) (V : C) :
    ∀ (σ : Ty) (W : C) (x : A.Dom W σ), (A.reductAt V).Incl σ W x = A.Incl σ W x
  | .e, _, _ => rfl
  | .rel _, _, _ => rfl
  | .var _, _, _ => rfl

theorem reductAt_apply (A : Premodel Sig C) (V : C) {σ : Ty} {ρ : RTy} {W : C}
    (F : Intension A.inner (.arr σ ρ) W) (x : Outer A.inner σ W) :
    (A.reductAt V).apply F x = A.apply F x := by
  ext p
  simp only [apply, Set.mem_ofPred_eq]
  constructor <;> rintro ⟨x', h1, h2⟩
  · exact ⟨x', (A.reductAt_Incl V _ _ x').symm.trans h1, h2⟩
  · exact ⟨x', (A.reductAt_Incl V _ _ x').trans h1, h2⟩

variable (A : Premodel Sig C) (cs : List Sig.Const)

/-- **Constants as parameters**: the value of a term in `A` is the value in `A`'s pure reduct
of the pure term with variables put for its constants, under the assignment extended by the
values of the constants moved along the arrow. -/
theorem sem_abstractConsts :
    ∀ {Γ : Ctx} {σ : Ty} {W : C} (h : A.W₀ ⟶ W) (t : Term Sig Γ σ) (ht : t.consts ⊆ {c | c ∈ cs})
      (g : IEnv (A.Dom W) Γ),
      A.sem h t g =
        (A.reductAt A.W₀).sem h (t.abstractConsts cs ht)
          (g.append (IEnv.ofConsts (fun c => (A.inner _).map h (A.I c)) cs))
  | _, _, _, _, .var v, _, g => by
    show A.Incl _ _ (g.get v) = (A.reductAt A.W₀).Incl _ _ ((g.append _).get (v.appendL _))
    rw [IEnv.get_appendL]
    exact (A.reductAt_Incl _ _ _ _).symm
  | Γ, _, _, h, .const c, ht, g => by
    show A.Incl _ _ ((A.inner _).map h (A.I c)) =
      (A.reductAt A.W₀).Incl _ _ ((g.append _).get (Var.appendR Γ (Var.ofMem c cs _)))
    rw [IEnv.get_appendR, IEnv.get_ofConsts]
    exact (A.reductAt_Incl _ _ _ _).symm
  | _, _, _, h, .app f a, ht, g => by
    have hf := sem_abstractConsts h f ((Term.consts_app_left f a).trans ht) g
    have ha := sem_abstractConsts h a ((Term.consts_app_right f a).trans ht) g
    show A.apply (A.sem h f g) (A.sem h a g) = (A.reductAt A.W₀).sem h (Term.app _ _) _
    rw [hf, ha]
    exact (A.reductAt_apply _ _ _).symm
  | _, _, _, h, .lam b, ht, g => by
    ext ⟨U, ⟨x, a⟩, i⟩
    have e : (IEnv.cons (Dom := A.Dom U) x (A.push i g)).append
          (IEnv.ofConsts (fun c => (A.inner _).map (h ≫ i) (A.I c)) cs) =
        IEnv.cons (Dom := A.Dom U) x ((A.reductAt A.W₀).push i
          (g.append (IEnv.ofConsts (fun c => (A.inner _).map h (A.I c)) cs))) := by
      show IEnv.cons (Dom := A.Dom U) x _ = IEnv.cons (Dom := A.Dom U) x _
      congr 1
      rw [Premodel.push, Premodel.push, IEnv.map_append, IEnv.map_ofConsts]
      congr 1
      congr 1
      funext c
      rw [Functor.map_comp]; rfl
    show _ ∈ A.sem (h ≫ i) b _ ↔ _ ∈ (A.reductAt A.W₀).sem (h ≫ i) (b.abstractConsts cs ht) _
    rw [sem_abstractConsts (h ≫ i) b ht, e]
  | _, _, _, _, .and, _, _ | _, _, _, _, .or, _, _ | _, _, _, _, .not, _, _
  | _, _, _, _, .all _, _, _ | _, _, _, _, .ex _, _, _ | _, _, _, _, .eq _, _, _
  | _, _, _, _, .constR _, _, _ | _, _, _, _, .negR _, _, _ | _, _, _, _, .andR _, _, _
  | _, _, _, _, .orR _, _, _ | _, _, _, _, .coextR _, _, _ | _, _, _, _, .boxR _, _, _
  | _, _, _, _, .inclR _, _, _ => rfl

/-- **A premodel whose pure reduct is a model at its base is a model**, whatever the values
of its constants. -/
theorem isModel_of_reductAt (hA : (A.reductAt A.W₀).IsModel) : A.IsModel := by
  intro Γ σ W h t g
  obtain ⟨F, hF⟩ := (Term.consts_finite t).exists_finset_coe
  have ht : t.consts ⊆ {c | c ∈ F.toList} := fun c hc => by
    rw [← hF] at hc
    exact Finset.mem_toList.2 hc
  obtain ⟨y, hy⟩ := hA h (t.abstractConsts F.toList ht) _
  exact ⟨y, (A.reductAt_Incl _ _ _ y).symm.trans (hy.trans (sem_abstractConsts A _ h t ht g).symm)⟩

/-- **Re-based at `V` with any values of the constants there, a premodel whose pure reduct
is a model at `V` is a model.** -/
theorem isModel_rebase (V : C) (J : ∀ c : Sig.Const, A.Dom V (Sig.typeOf c))
    (hV : (A.reductAt V).IsModel) : (A.rebase V J).IsModel :=
  (A.rebase V J).isModel_of_reductAt hV

/-- A model's pure reduct is a model at its base. -/
theorem reductAt_isModel {A : Premodel Sig C} (M : A.IsModel) : (A.reductAt A.W₀).IsModel :=
  A.reduct_isModel M

end Intensional.Premodel

end Classicism.Meta
