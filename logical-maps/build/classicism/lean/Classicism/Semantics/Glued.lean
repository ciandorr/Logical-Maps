import Classicism.Semantics.IntensionalTheory
import Classicism.Semantics.IntensionalFull
import Classicism.Semantics.IntensionalProperties
import Classicism.Syntax.WitnessedPossibility

/-!
# Gluing constants at sites

Bacon's construction of models of Logical Necessity (*Logical Combinatorialism*, Appendix
A.3; *A Philosophical Introduction to Higher-Order Logics*, Definition 18.15), in the
intensional form of the full action models.

**Sites.** In a full action model based at `W₀`, a family of endo-arrows `s k : W₀ → W₀`,
`k : G`, is a family of *sites* when the arrows through them are told apart, `s k ≫ u =
s k' ≫ u'` only when `k = k'` and `u = u'`, and every family of individuals at `W₀` is the
family of transports along the sites of one individual (`Sites`). Then every family
`x : G → D` of entities of one type at `W₀` is **glued** by one entity `glue x`, whose
transport along `s k` is `x k` (`map_glue`): at a relational type, `glue x` holds of a
tuple at the world `s k ≫ u` iff `x k` holds of it at `u`, and of nothing at a world through
no site.

**The glued model.** Given, for each site, values `w k c` at `W₀` for all the constants,
the glued model interprets each constant `c` by `glue (fun k => w k c)`
(`Premodel.glued`). Its truncation along the site `s k` is the full model with the
constants interpreted by `w k` (`truncate_site`), so at the world `s k` a sentence holds iff
it holds at the base of that model.

**What it gives.** Witnessed Possibility holds at the base when the values are *rich*:
every pure formula whose existential closure is true at the base is satisfied, of its
constants, at the base of the full model with the values of some site (`WitnessRich`,
`holdsAx_witnessedPossibility`). With one object, every pure sentence true at the base is
true at every world, and Logical Necessity follows (`holdsAx_logicalNecessity`). Two ways of
choosing rich values, the two the map's records use:

* **by sentences** (`bySentences`, the glued free-monoid records, after Bacon's Theorem A.8):
  the sites are the sentences of `Σ`, and the values at a sentence are those of a full
  model over the same frame in which it is true, if there is one;
* **by formulas** (`byFormulas`, the free-product and double-retraction records): the sites
  are the pairs of a list of distinct constants and a pure formula in a matching block, and
  the values at such a pair put a witness of the formula's existential closure at the
  base, if there is one, for its constants.

Both are rich (`bySentences_rich`, `byFormulas_rich`).

Semantic facts used: a pure formula with constants put for a block of its variables holds
iff the formula holds of the constants' values (`holds_atConsts`), and the block
quantifiers quantify over tuples (`holds_existsBlock_tuple`, `holds_forallBlock_tuple`).
-/

namespace Classicism.Meta

/-! ### Tuples of values for a block -/

namespace IEnv

variable {Dom : Ty → Type}

/-- A tuple of values for a block, in the block's order, before an assignment: the
assignment to `Ctx.block σs Γ`. -/
def pushBlock : ∀ {σs : List Ty} {Γ : Ctx}, IEnv Dom σs → IEnv Dom Γ → IEnv Dom (Ctx.block σs Γ)
  | [], _, _, g => g
  | σ :: σs, Γ, .cons x xs, g => pushBlock (σs := σs) (Γ := σ :: Γ) xs (.cons x g)

end IEnv

/-- The values of a list of constants, by a function on all constants, as a tuple for the
block of their types. -/
def constVals {Sig : Signature} {Dom : Ty → Type} (v : ∀ c : Sig.Const, Dom (Sig.typeOf c)) :
    (cs : List Sig.Const) → IEnv Dom (cs.map Sig.typeOf)
  | [] => .nil
  | c :: cs => .cons (v c) (constVals v cs)

/-- `constVals` reads a function only on the list. -/
theorem constVals_congr {Sig : Signature} {Dom : Ty → Type} {v v' : ∀ c : Sig.Const, Dom (Sig.typeOf c)} :
    ∀ (cs : List Sig.Const), (∀ c ∈ cs, v c = v' c) → constVals v cs = constVals v' cs
  | [], _ => rfl
  | c :: cs, h => by
    show IEnv.cons (v c) (constVals v cs) = IEnv.cons (v' c) (constVals v' cs)
    rw [h c List.mem_cons_self, constVals_congr cs fun d hd => h d (List.mem_cons_of_mem c hd)]

/-- **Every tuple for the block of a list of distinct constants is their values** under some
function on all constants, given a value of each type to put elsewhere. -/
theorem exists_constVals {Sig : Signature} {Dom : Ty → Type} (d : ∀ σ, Dom σ) :
    ∀ (cs : List Sig.Const), cs.Nodup → ∀ xs : IEnv Dom (cs.map Sig.typeOf),
      ∃ v : ∀ c : Sig.Const, Dom (Sig.typeOf c), constVals v cs = xs
  | [], _, .nil => ⟨fun c => d _, rfl⟩
  | c :: cs, hnd, .cons x xs => by
    classical
    obtain ⟨v, hv⟩ := exists_constVals d cs (List.nodup_cons.1 hnd).2 xs
    refine ⟨Function.update v c x, ?_⟩
    show IEnv.cons (Function.update v c x c) (constVals (Function.update v c x) cs) = IEnv.cons x xs
    rw [Function.update_self, constVals_congr cs (v' := v) fun d hd => Function.update_of_ne
      (fun e => (List.nodup_cons.1 hnd).1 (by subst e; exact hd)) _ _, hv]

namespace Intensional

open CategoryTheory

namespace Premodel

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C) (M : A.IsModel)
include M

/-! ### The block quantifiers and constants put for a block -/

theorem holds_existsBlock_tuple {W : C} (h : A.W₀ ⟶ W) : ∀ (σs : List Ty) {Γ : Ctx}
    (P : Formula Sig (Ctx.block σs Γ)) (g : IEnv (A.Dom W) Γ),
    A.Holds h (Term.existsBlock σs P) g ↔ ∃ xs : IEnv (A.Dom W) σs, A.Holds h P (IEnv.pushBlock xs g)
  | [], _, P, g => ⟨fun H => ⟨.nil, H⟩, fun ⟨xs, H⟩ => by cases xs; exact H⟩
  | σ :: σs, Γ, P, g => by
    show A.Holds h (Term.exists' (Term.existsBlock σs P)) g ↔ _
    rw [A.holds_exists M h g]
    constructor
    · rintro ⟨x, hx⟩
      obtain ⟨xs, hxs⟩ := (holds_existsBlock_tuple h σs (Γ := σ :: Γ) P (.cons x g)).1 hx
      exact ⟨.cons x xs, hxs⟩
    · rintro ⟨xs', hxs⟩
      cases xs' with
      | cons x xs => exact ⟨x, (holds_existsBlock_tuple h σs (Γ := σ :: Γ) P (.cons x g)).2 ⟨xs, hxs⟩⟩

theorem holds_forallBlock_tuple {W : C} (h : A.W₀ ⟶ W) : ∀ (σs : List Ty) {Γ : Ctx}
    (P : Formula Sig (Ctx.block σs Γ)) (g : IEnv (A.Dom W) Γ),
    A.Holds h (Term.forallBlock σs P) g ↔ ∀ xs : IEnv (A.Dom W) σs, A.Holds h P (IEnv.pushBlock xs g)
  | [], _, P, g => ⟨fun H xs => by cases xs; exact H, fun H => H .nil⟩
  | σ :: σs, Γ, P, g => by
    show A.Holds h (Term.forall' (Term.forallBlock σs P)) g ↔ _
    rw [A.holds_forall M h g]
    constructor
    · intro H xs'
      cases xs' with
      | cons x xs => exact (holds_forallBlock_tuple h σs (Γ := σ :: Γ) P (.cons x g)).1 (H x) xs
    · intro H x
      exact (holds_forallBlock_tuple h σs (Γ := σ :: Γ) P (.cons x g)).2 fun xs => H (.cons x xs)

/-- The assignment a block substitution of constants pulls back: the constants' values,
before the assignment the rest pulls back. -/
theorem subEnv_consBlock_consts {W : C} (h : A.W₀ ⟶ W) : ∀ (cs : List Sig.Const) {Γ : Ctx}
    (s : Sub Sig Γ []),
    A.subEnv M h (Sub.consBlock (Terms.consts cs) s) .nil
      = IEnv.pushBlock (constVals (fun c => (A.inner _).map h (A.I c)) cs) (A.subEnv M h s .nil)
  | [], _, _ => rfl
  | c :: cs, Γ, s => by
    show A.subEnv M h (Sub.consBlock (Terms.consts cs) (Sub.cons (.const c) s)) .nil = _
    rw [subEnv_consBlock_consts h cs (Sub.cons (.const c) s)]
    show _ = IEnv.pushBlock (constVals _ cs) (IEnv.cons ((A.inner _).map h (A.I c)) (A.subEnv M h s .nil))
    congr 1
    apply IEnv.ext
    intro τ v
    apply A.Incl_injective
    rw [A.Incl_subEnv_get]
    cases v with
    | zero => rfl
    | succ v => exact (A.Incl_subEnv_get M h s .nil v).symm

/-- **A pure formula with constants put for its block holds iff it holds of the constants'
values**, in the pure reduct. -/
theorem holds_atConsts {W : C} (h : A.W₀ ⟶ W) (cs : List Sig.Const)
    (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])) :
    A.Holds h (Term.atConsts cs P) .nil ↔
      A.reduct.Holds h P (IEnv.pushBlock (constVals (fun c => (A.inner _).map h (A.I c)) cs) .nil) := by
  unfold Holds Term.atConsts
  rw [A.sem_subst M, subEnv_consBlock_consts A M h cs Sub.id, A.sem_ofPure,
    IEnv.nil_eq (A.subEnv M h Sub.id IEnv.nil)]
  rfl

omit M in
/-- A pure formula, read in the signature, holds at a world iff it holds there in the reduct. -/
theorem holds_ofPure {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (P : Formula Signature.pure Γ)
    (g : IEnv (A.Dom W) Γ) : A.Holds h (Term.ofPure P) g ↔ A.reduct.Holds h P g := by
  unfold Holds; rw [A.sem_ofPure]

omit M in
/-- A pure formula holds in the reduct at a world iff it holds at any other world with the
same target. -/
theorem reduct_holds_congr {Γ : Ctx} {W : C} (h h' : A.W₀ ⟶ W) (P : Formula Signature.pure Γ)
    (g : IEnv (A.Dom W) Γ) : A.reduct.Holds h P g ↔ A.reduct.Holds h' P g := by
  rw [← A.holds_ofPure h, ← A.holds_ofPure h']
  unfold Holds
  rw [A.sem_pure _ (Term.pure_ofPure P) h h']

end Premodel

/-! ### Sites, and gluing at them -/

variable {C : Type} [SmallCategory C]

/-- **Sites** at `W₀` for the action `De`: endo-arrows `s k`, `k : G`, such that the arrows
through them are told apart (`s k ≫ u = s k' ≫ u'` only when `k = k'` and `u = u'`), and every
family of individuals at `W₀` is the family of transports along the sites of one individual. -/
structure Sites (De : C ⥤ Type) (W₀ : C) (G : Type) where
  /-- The site arrows. -/
  s : G → (W₀ ⟶ W₀)
  /-- The arrows through the sites are told apart. -/
  sep : ∀ {V : C} (k k' : G) (u u' : W₀ ⟶ V), s k ≫ u = s k' ≫ u' → k = k' ∧ u = u'
  /-- The individuals glue. -/
  glue_e : ∀ x : G → De.obj W₀, ∃ y, ∀ k, De.map (s k) y = x k

namespace Sites

variable {De : C ⥤ Type} {W₀ : C} {G : Type} (S : Sites De W₀ G)

/-- The entity of a type at `W₀` glued from a family of them, one for each site: at a
relational type, it holds of a tuple at the world `s k ≫ u` iff the `k`-th holds of it at
`u`, and of nothing at a world through no site. -/
noncomputable def glue : ∀ σ : Ty, (G → (FullT De σ).obj W₀) → (FullT De σ).obj W₀
  | .e, x => (S.glue_e x).choose
  | .rel ρ, x => ({p | ∃ (k : G) (u : W₀ ⟶ p.1), p.2.2 = S.s k ≫ u ∧
      (⟨p.1, p.2.1, u⟩ : Σ V : C, (FullArgs De ρ).obj V × (W₀ ⟶ V)) ∈ x k} :
        Set (Σ V : C, (FullArgs De ρ).obj V × (W₀ ⟶ V)))
  | .var _, x => (S.glue_e x).choose

/-- **The transport of the glued entity along the `k`-th site is the `k`-th entity.** -/
theorem map_glue : ∀ (σ : Ty) (x : G → (FullT De σ).obj W₀) (k : G),
    (FullT De σ).map (S.s k) (S.glue σ x) = x k
  | .e, x, k => (S.glue_e x).choose_spec k
  | .var _, x, k => (S.glue_e x).choose_spec k
  | .rel ρ, x, k => by
    apply Set.ext
    rintro ⟨V, a, u⟩
    show (∃ (k' : G) (u' : W₀ ⟶ V), S.s k ≫ u = S.s k' ≫ u' ∧ _) ↔ _
    constructor
    · rintro ⟨k', u', e, hx⟩
      obtain ⟨rfl, rfl⟩ := S.sep k k' u u' e
      exact hx
    · exact fun hx => ⟨k, u, rfl, hx⟩

end Sites

namespace Premodel

variable {Sig : Signature} (De : C ⥤ Type) (W₀ : C) (ne : ∀ W : C, Nonempty (De.obj W))

/-- The full model of the pure language on the same frame. -/
noncomputable abbrev fullPure : Premodel Signature.pure C :=
  Premodel.full De W₀ ne (fun c => nomatch c)

/-- The pure reduct of a full premodel is the full premodel of the pure language. -/
theorem reduct_full (I : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀) :
    (Premodel.full De W₀ ne I).reduct = fullPure De W₀ ne := by
  unfold reduct Premodel.full
  congr

/-- The same at a world and an assignment: the reduct of a full premodel and the full
premodel of the pure language agree definitionally. -/
theorem reduct_full_holds (I : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀) {Γ : Ctx} {W : C}
    (h : W₀ ⟶ W) (P : Formula Signature.pure Γ) (g : IEnv (fun σ => (FullT De σ).obj W) Γ) :
    (Premodel.full De W₀ ne I).reduct.Holds h P g ↔ (fullPure De W₀ ne).Holds h P g := Iff.rfl

variable {G : Type}

/-- **The glued model**: the full premodel interpreting each constant `c` by the entity glued
from its values `w k c` at the sites. -/
noncomputable def glued (S : Sites De W₀ G) (w : G → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀) :
    Premodel Sig C :=
  Premodel.full De W₀ ne fun c => S.glue _ fun k => w k c

variable {De W₀ ne} (S : Sites De W₀ G) (w : G → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀)

theorem glued_isModel : (glued De W₀ ne S w).IsModel := Premodel.full_isModel De

theorem glued_full : (glued De W₀ ne S w).Full := fun ρ W => fullIncl_surjective De ρ W

theorem glued_reduct : (glued De W₀ ne S w).reduct = fullPure De W₀ ne := reduct_full De W₀ ne _

/-- **The truncation along a site is the full model with that site's values.** -/
theorem truncate_site (k : G) :
    (glued De W₀ ne S w).truncate (S.s k) = Premodel.full De W₀ ne (w k) := by
  unfold glued Premodel.full Premodel.truncate
  congr 1
  funext c
  exact S.map_glue _ _ k

/-- **Rich values**: every pure formula whose existential closure is true at the base is
satisfied, by its distinct constants, at the base of the full model with the values of some
site. -/
def WitnessRich (w : G → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀) : Prop :=
  ∀ (cs : List Sig.Const) (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])),
    cs.Nodup → (fullPure De W₀ ne).HoldsSentence (Term.existsBlock _ P) →
      ∃ k : G, (Premodel.full De W₀ ne (w k)).HoldsSentence (Term.atConsts cs P)

/-- **Witnessed Possibility holds in a glued model with rich values**: the formula is
satisfied at the base of a truncation along a site. -/
theorem holdsAx_witnessedPossibility (hw : WitnessRich (ne := ne) w) :
    (glued De W₀ ne S w).HoldsAx (AxiomSet.witnessedPossibility Sig) := by
  have M : (glued De W₀ ne S w).IsModel := glued_isModel S w
  rintro a ⟨-, cs, P, hnd, rfl⟩
  rw [HoldsSentence, Premodel.holds_imp _ M]
  intro H
  rw [← HoldsSentence, holdsSentence_ofPure, glued_reduct] at H
  obtain ⟨k, hk⟩ := hw cs P hnd H
  rw [← HoldsSentence, dia_iff_truncate _ M]
  exact ⟨W₀, S.s k, by rw [truncate_site]; exact hk⟩

/-- **Logical Necessity holds in a glued model with rich values on one object.** From left to
right, a counterexample to `∀x̄. P` is a witness of `∃x̄. ¬P`, so `¬P` holds of the constants
at the world of some site; from right to left, a pure formula true of everything at the base
is true of everything at every world, all worlds having the base as target. -/
theorem holdsAx_logicalNecessity [Subsingleton C] (hw : WitnessRich (ne := ne) w) :
    (glued De W₀ ne S w).HoldsAx (AxiomSet.logicalNecessity Sig) := by
  have M : (glued De W₀ ne S w).IsModel := glued_isModel S w
  set A := glued De W₀ ne S w
  rintro a ⟨-, cs, P, hnd, rfl⟩
  rw [HoldsSentence, A.holds_iff M, ← HoldsSentence, ← HoldsSentence, holdsSentence_ofPure]
  constructor
  · intro H
    by_contra hP
    have hex : (fullPure De W₀ ne).HoldsSentence (Term.existsBlock _ (Term.neg P)) := by
      rw [← glued_reduct S w]
      have MR : A.reduct.IsModel := A.reduct_isModel M
      rw [HoldsSentence, A.reduct.holds_forallBlock_tuple MR] at hP
      rw [HoldsSentence, A.reduct.holds_existsBlock_tuple MR]
      push Not at hP
      obtain ⟨xs, hxs⟩ := hP
      exact ⟨xs, (A.reduct.holds_neg MR _ _ _).2 hxs⟩
    obtain ⟨k, hk⟩ := hw cs (Term.neg P) hnd hex
    rw [box_iff_truncate _ M] at H
    have H := H W₀ (S.s k)
    rw [truncate_site] at H
    rw [Term.atConsts_neg] at hk
    exact (holdsSentence_neg _ (Premodel.full_isModel De) _).1 hk H
  · intro H
    rw [box_iff_truncate _ M]
    intro V h
    obtain rfl : V = W₀ := Subsingleton.elim _ _
    rw [holdsSentence_truncate, A.holds_atConsts M]
    have MR : A.reduct.IsModel := A.reduct_isModel M
    rw [HoldsSentence, A.reduct.holds_forallBlock_tuple MR] at H
    exact (A.reduct_holds_congr _ _ _ _).1 (H _)

/-! ### Two ways of choosing rich values -/

variable (De W₀ ne)

/-- An entity of each type at `W₀`: a chosen individual, or the empty intension. -/
noncomputable def defaultVal : ∀ σ : Ty, (FullT De σ).obj W₀
  | .e => Classical.choice (ne W₀)
  | .rel _ => (∅ : Set _)
  | .var _ => Classical.choice (ne W₀)

/-- A pure formula with distinct constants put for its block holds at the base of a full model
iff it holds there of the constants' values. -/
theorem holdsSentence_atConsts_full (v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀)
    (cs : List Sig.Const) (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])) :
    (Premodel.full De W₀ ne v).HoldsSentence (Term.atConsts cs P) ↔
      (fullPure De W₀ ne).Holds (𝟙 W₀) P (IEnv.pushBlock (constVals v cs) .nil) := by
  rw [HoldsSentence, holds_atConsts _ (Premodel.full_isModel De)]
  have e : (fun c : Sig.Const => (FullT De (Sig.typeOf c)).map (𝟙 W₀) (v c)) = v :=
    funext fun c => by rw [CategoryTheory.Functor.map_id]; rfl
  show (fullPure De W₀ ne).Holds (𝟙 W₀) P
    (IEnv.pushBlock (constVals (fun c => (FullT De (Sig.typeOf c)).map (𝟙 W₀) (v c)) cs) .nil) ↔ _
  rw [e]

/-- A witness of a pure formula's existential closure at the base, for a list of distinct
constants, is the constants' values in some full model. -/
theorem exists_full_atConsts {cs : List Sig.Const} (hnd : cs.Nodup)
    {P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])}
    (H : (fullPure De W₀ ne).HoldsSentence (Term.existsBlock _ P)) :
    ∃ v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀,
      (Premodel.full De W₀ ne v).HoldsSentence (Term.atConsts cs P) := by
  rw [HoldsSentence, (fullPure De W₀ ne).holds_existsBlock_tuple (Premodel.full_isModel De)] at H
  obtain ⟨xs, hxs⟩ := H
  obtain ⟨v, hv⟩ := exists_constVals (defaultVal De W₀ ne) cs hnd xs
  exact ⟨v, (holdsSentence_atConsts_full De W₀ ne v cs P).2 (hv ▸ hxs)⟩

/-- **Values by sentences** (Bacon, *Logical Combinatorialism*, Appendix A.3): at the site of
a sentence of `Σ`, the values of the constants in a full model over the frame in which the
sentence is true at the base, if there is one; otherwise the default values. -/
noncomputable def bySentences : Sentence Sig → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀ :=
  fun φ => open Classical in
    if h : ∃ v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀,
        (Premodel.full De W₀ ne v).HoldsSentence φ then h.choose
    else fun _ => defaultVal De W₀ ne _

theorem bySentences_spec {φ : Sentence Sig}
    (h : ∃ v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀, (Premodel.full De W₀ ne v).HoldsSentence φ) :
    (Premodel.full De W₀ ne (bySentences De W₀ ne φ)).HoldsSentence φ := by
  unfold bySentences
  rw [dif_pos h]
  exact h.choose_spec

/-- Values by sentences are rich: the site of the pure formula with its constants put in. -/
theorem bySentences_rich : WitnessRich (ne := ne) (bySentences (Sig := Sig) De W₀ ne) :=
  fun cs P hnd H => ⟨Term.atConsts cs P,
    bySentences_spec De W₀ ne (exists_full_atConsts De W₀ ne hnd H)⟩

/-- The sites of **values by formulas**: a list of constants and a pure formula in the block of
their types. -/
abbrev Datum (Sig : Signature) : Type :=
  Σ cs : List Sig.Const, Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])

/-- **Values by formulas** (the free-product and double-retraction records): at the site of a
list of distinct constants and a pure formula whose existential closure is true at the base,
the constants denote a witness, chosen; elsewhere the default values. -/
noncomputable def byFormulas : Datum Sig → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀ :=
  fun d => open Classical in
    if h : ∃ v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀,
        d.1.Nodup ∧ (Premodel.full De W₀ ne v).HoldsSentence (Term.atConsts d.1 d.2) then h.choose
    else fun _ => defaultVal De W₀ ne _

theorem byFormulas_rich : WitnessRich (ne := ne) (byFormulas (Sig := Sig) De W₀ ne) := by
  intro cs P hnd H
  refine ⟨⟨cs, P⟩, ?_⟩
  obtain ⟨v, hv⟩ := exists_full_atConsts De W₀ ne hnd H
  have h : ∃ v : ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀,
      cs.Nodup ∧ (Premodel.full De W₀ ne v).HoldsSentence (Term.atConsts cs P) := ⟨v, hnd, hv⟩
  unfold byFormulas
  rw [dif_pos h]
  exact h.choose_spec.2

end Premodel

end Intensional

end Classicism.Meta
