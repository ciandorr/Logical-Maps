import Classicism.Coalesced
import Classicism.Models.Conditions
import Classicism.Certified.Entailed
import Classicism.Models.SymBase

/-!
# The coalesced sum over all finite individual domains

The map's model `coalesced-all-finite-individual-domains` (a member of the group
`coalesced-sums`): the coalesced sum (Classicism, Appendix E), over the distinguished arrows
and with the fullest root domains, of the one-world full Henkin models `M_n` with individual
domain `{1, …, n}` for every `n ≥ 1`, evaluated at the root. Here `M_{n+1}` is `comp n`, the
full model on the one-object category of the trivial monoid with individuals `Fin (n + 1)`, and
the root individuals are Appendix E's product of the components' individuals, the **threads**
`(a_n)_n` with `a_n ∈ M_n` (`productAtom`); the language is the pure one.

* `isModel`: it is a model (`isModel_distinguished`, Appendix E).
* `full`: it is a *full* model: every component is full, so every intension at the root lands,
  and the fullest root domains contain it (`fullest_full`). So the topic's arguments about full
  (action) models apply to it.
* The arrows: between any two objects there is at most one (`hom_subsingleton`); out of the
  root there are the identity and one distinguished arrow into each component, and no arrow
  returns to the root. Hence the arrows are epimorphisms acting surjectively on the individuals
  (`epicArrows`), and the distinguished arrows have no retraction (`unretractedArrow`).
* Counting: infinitely many individuals (the threads) and propositions at the root
  (`infinitelyManyIndividuals`, `infinitelyManyPropositions`), and only two propositions in the
  one-individual component, from which no arrow leaves (`fewerPropositionsAfter`).
* `holdsSentence_box_iff`: a sentence is necessary at the root iff it holds there and in every
  component (each component being the truncation by its distinguished arrow, Theorem 3.26).
* The actual world is isolated at the root (`actualWorldIsolated`) and in every component
  (`comp_actualWorldIsolated`); so Actuality holds at the root and at the root of every
  component (`actuality`, `comp_actuality`), and with the fullest root domains (`fullest`) and
  the distinguished arrows (`distinguishedArrows`) these are the group's conditions the model
  meets. Distinctness-Preserving Collapse holds at every world, and
  with it, by the map's result, every truth is necessarily 5-necessary
  (`holds_necessary_truth_implies_five_necessity`), the record's own argument
  `five-necessity-is-truth`.
-/

namespace Classicism.Meta.Coalesced.AllFinite

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

/-! ### The components -/

/-- The individuals of the component `M_{n+1}`: `Fin (n + 1)` at its one object. -/
abbrev De (n : ℕ) : SingleObj Unit ⥤ Type := (Functor.const (SingleObj Unit)).obj (Fin (n + 1))

/-- **The component `M_{n+1}`**: the one-world full Henkin model with `n + 1` individuals, as a
full intensional action model on the one-object category of the trivial monoid. -/
noncomputable abbrev comp (n : ℕ) : Premodel Signature.pure (SingleObj Unit) :=
  Premodel.full (De n) (SingleObj.star Unit) (fun _ => ⟨(0 : Fin (n + 1))⟩) (fun c => nomatch c)

theorem comp_isModel (n : ℕ) : (comp n).IsModel := Premodel.full_isModel _

theorem comp_full (n : ℕ) : (comp n).Full := fun ρ W => fullIncl_surjective (De n) ρ W

instance (X Y : SingleObj Unit) : Subsingleton (X ⟶ Y) := inferInstanceAs (Subsingleton Unit)

/-! ### The coalesced sum -/

/-- The root arrows: one distinguished arrow into each component. -/
noncomputable abbrev S : RootArrows (fun _ : ℕ => SingleObj Unit) := baseArrows comp

/-- The objects of the sum. -/
abbrev Obj : Type := CoalescedSum S

/-- The root individuals are nonempty. -/
theorem ne : Nonempty (productAtom comp .e).D := ⟨fun n => (0 : Fin (n + 1))⟩

/-- **The model**: Appendix E's coalesced sum of the components, with the threads as the root
individuals, the fullest root domains, evaluated at the root. -/
noncomputable def model : Premodel Signature.pure Obj :=
  (appendixE comp).coalescedSum (fullRootIncl _ _) ne (appendixEConst comp)

/-- The root individuals are the threads. -/
example : model.Dom model.W₀ .e = ∀ n : ℕ, Fin (n + 1) := rfl

/-- **The coalesced sum is a model** (Appendix E). -/
theorem isModel : model.IsModel :=
  isModel_distinguished comp _ _ ne _ (transportsConstants_appendixE comp) comp_isModel

/-! ### Fullness -/

/-- **The coalesced sum is full**: at the root every intension lands, the components being
full, and the fullest root domains contain every landing intension; at a component object the
domains are the component's. -/
theorem full : model.Full := by
  intro ρ W
  cases W with
  | root =>
    intro Y
    exact fullest_full _ _ ρ Y fun {k V} r => comp_full k ρ V _
  | of x =>
    obtain ⟨k, V⟩ := x
    intro X
    obtain ⟨y, hy⟩ := comp_full k ρ V ((appendixE comp).compI X)
    refine ⟨y, ?_⟩
    show (appendixE comp).ofCompI ((comp k).incl ρ V y) = X
    rw [hy]
    exact (appendixE comp).ofCompI_compI X

/-! ### The arrows -/

/-- Between two objects of the sum there is at most one arrow. -/
instance hom_subsingleton : ∀ X Y : Obj, Subsingleton (X ⟶ Y)
  | .root, .root => inferInstanceAs (Subsingleton PUnit)
  | .root, .of ⟨_, V⟩ => inferInstanceAs (Subsingleton (SingleObj.star Unit ⟶ V))
  | .of _, .root => inferInstanceAs (Subsingleton PEmpty)
  | .of ⟨_, _⟩, .of ⟨_, _⟩ => ⟨fun f g => by
      cases f with
      | mk f => cases g with
        | mk g => exact congrArg SigmaHom.mk (Subsingleton.elim f g)⟩

/-- An arrow into a component object of the sum, in the form of the transport lemmas. -/
theorem arr_eq {n : ℕ} {V : SingleObj Unit} (k : (CoalescedSum.base S) ⟶ CoalescedSum.of ⟨n, V⟩) :
    k = CoalescedSum.arr S (dist comp n) := by
  cases V; exact Subsingleton.elim _ _

/-- `epic-arrows`: every arrow is an epimorphism, there being at most one arrow between two
objects, and acts surjectively on the individuals: the identities trivially, and a
distinguished arrow, the projection of the threads to a component, since every element of
`{1, …, n}` is the value of some thread. -/
theorem epicArrows : model.EpicArrows := by
  intro V U _ k
  refine ⟨⟨fun g h _ => Subsingleton.elim g h⟩, ?_⟩
  cases V with
  | root =>
    cases U with
    | root =>
      intro a
      exact ⟨a, by rw [Subsingleton.elim k (𝟙 _), Functor.map_id_apply]⟩
    | of x =>
      obtain ⟨n, W⟩ := x
      cases W
      rw [arr_eq k]
      intro b
      refine ⟨fun m => if h : m = n then h ▸ b else (0 : Fin (m + 1)), ?_⟩
      show ((comp n).inner .e).map (𝟙 _) (if h : n = n then h ▸ b else (0 : Fin (n + 1))) = b
      rw [Functor.map_id_apply]; simp only; exact dif_pos rfl
  | of x =>
    cases U with
    | root => exact (nomatch k)
    | of y =>
      obtain ⟨n, W⟩ := x
      obtain ⟨m, W'⟩ := y
      cases k with
      | mk f => exact fun a => ⟨a, rfl⟩

/-- `unretracted-arrow`: no arrow returns to the root, so the distinguished arrows have no
retraction. -/
theorem unretractedArrow : model.UnretractedArrow :=
  ⟨CoalescedSum.of ⟨0, SingleObj.star Unit⟩, CoalescedSum.arr S (dist comp 0), fun m => nomatch m⟩

/-! ### Necessity at the root -/

/-- **A sentence is necessary at the root iff it holds there and in every component**: the
arrows out of the root are its identity and the distinguished arrows, along which the sum is
the component (Theorem 3.26). -/
theorem holdsSentence_box_iff (p : Sentence Signature.pure) :
    model.HoldsSentence (Term.box p) ↔ model.HoldsSentence p ∧ ∀ n, (comp n).HoldsSentence p := by
  have hc : ∀ n, model.Holds (CoalescedSum.arr S (dist comp n)) p .nil ↔ (comp n).HoldsSentence p :=
    fun n => by
      have := (appendixE comp).holds_arr_sentence (fullRootIncl _ _) ne (appendixEConst comp)
        (dist comp n) p
      rwa [component_dist (transportsConstants_appendixE comp) n] at this
  rw [Premodel.HoldsSentence, model.holds_box isModel]
  constructor
  · intro H
    refine ⟨?_, fun n => ?_⟩
    · have := H (𝟙 model.W₀)
      rwa [Category.id_comp, IEnv.nil_eq (model.push _ _)] at this
    · have := H (V := CoalescedSum.of ⟨n, SingleObj.star Unit⟩) (CoalescedSum.arr S (dist comp n))
      erw [Category.id_comp, IEnv.nil_eq (model.push _ _)] at this
      exact (hc n).1 this
  · rintro ⟨h0, hn⟩ V k
    rw [Category.id_comp, IEnv.nil_eq (model.push _ _)]
    cases V with
    | root => rw [Subsingleton.elim k (𝟙 _)]; exact h0
    | of x =>
      obtain ⟨n, W⟩ := x
      rw [arr_eq k]
      exact (hc n).2 (hn n)

/-! ### Counting -/

/-- `infinitely-many-individuals`: the threads `n ↦ min m n`, for `m : ℕ`, are distinct. -/
theorem infinitelyManyIndividuals : model.InfinitelyManyIndividuals := by
  refine @Infinite.of_injective (model.Dom model.W₀ .e) ℕ _
    (fun m n => ⟨min m n, Nat.lt_succ_of_le (Nat.min_le_right m n)⟩) ?_
  intro m m' e
  have := congrArg Fin.val (congrFun e (m + m'))
  simp only at this
  omega

/-- The proposition true exactly at the distinguished arrow into the component `M_{n+1}`. -/
noncomputable def atArrow (n : ℕ) : model.Dom model.W₀ (.rel .t) :=
  Classical.choose (full .t model.W₀
    {q | q = ⟨CoalescedSum.of ⟨n, SingleObj.star Unit⟩, PUnit.unit, CoalescedSum.arr S (dist comp n)⟩})

theorem incl_atArrow (n : ℕ) : model.incl .t model.W₀ (atArrow n) =
    {q | q = ⟨CoalescedSum.of ⟨n, SingleObj.star Unit⟩, PUnit.unit, CoalescedSum.arr S (dist comp n)⟩} :=
  Classical.choose_spec (full .t model.W₀ _)

theorem atArrow_injective : Function.Injective atArrow := by
  intro m n e
  have h : (⟨CoalescedSum.of ⟨m, SingleObj.star Unit⟩, PUnit.unit,
      CoalescedSum.arr S (dist comp m)⟩ : Tuple model.inner .t model.W₀) ∈ model.incl .t model.W₀ (atArrow n) := by
    rw [← e, incl_atArrow]; rfl
  rw [incl_atArrow] at h
  have := congrArg Sigma.fst h
  simp only [CoalescedSum.of.injEq, Sigma.mk.injEq] at this
  exact this.1

/-- `infinitely-many-propositions`: the propositions true at exactly one distinguished arrow are
distinct. -/
theorem infinitelyManyPropositions : model.InfinitelyManyPropositions :=
  Infinite.of_injective _ atArrow_injective

/-- Three sets of a type with at most one element are not distinct. -/
theorem not_injective_three {α : Type} [Subsingleton α] (f : Fin 3 → Set α) : ¬ Function.Injective f := by
  have key : ∀ T : Set α, T = ∅ ∨ T = Set.univ := fun T =>
    (Set.eq_empty_or_nonempty T).imp id fun ⟨a, ha⟩ =>
      Set.eq_univ_of_forall fun b => Subsingleton.elim a b ▸ ha
  intro hf
  rcases key (f 0) with h0 | h0 <;> rcases key (f 1) with h1 | h1 <;> rcases key (f 2) with h2 | h2
  all_goals first
    | exact absurd (hf (h0.trans h1.symm)) (by decide)
    | exact absurd (hf (h0.trans h2.symm)) (by decide)
    | exact absurd (hf (h1.trans h2.symm)) (by decide)

/-- At a component object the tuples of type `t` are one: the one arrow, with no arguments. -/
instance tuple_t_subsingleton (n : ℕ) (W : SingleObj Unit) : Subsingleton (Tuple (comp n).inner .t W) :=
  ⟨fun ⟨V, ⟨⟩, i⟩ ⟨V', ⟨⟩, i'⟩ => by
    cases V; cases V'
    exact congrArg (fun i => (⟨_, PUnit.unit, i⟩ : Tuple (comp n).inner .t W)) (Subsingleton.elim i i')⟩

/-- `fewer-propositions-after`: there are three distinct propositions at the root, and only two
in the one-individual component `M_1`, from which no arrow leaves. -/
theorem fewerPropositionsAfter : model.FewerPropositionsAfter := by
  refine ⟨3, CoalescedSum.of ⟨0, SingleObj.star Unit⟩, CoalescedSum.arr S (dist comp 0),
    ⟨fun i => atArrow i.val, fun i j e => Fin.ext (atArrow_injective e)⟩, ?_⟩
  intro U k f
  cases U with
  | root => exact nomatch k
  | of y =>
    obtain ⟨m, W⟩ := y
    cases k with
    | mk _ => exact not_injective_three (α := Tuple (comp 0).inner .t W) f

/-! ### The actual world -/

/-- `actual-world-isolated`: the proposition true at the root's identity alone is in the domain,
entails every truth, and is false at every world of a component, from which no arrow returns
to the root. -/
theorem actualWorldIsolated : model.ActualWorldIsolated := by
  obtain ⟨a, ha⟩ := full .t model.W₀ {q | q.1 = CoalescedSum.root}
  refine ⟨a, ?_, ?_, ?_⟩
  · show _ ∈ model.incl .t model.W₀ a
    rw [ha]; rfl
  · intro p hp q hq
    rw [ha] at hq
    obtain ⟨V, ⟨⟩, i⟩ := q
    cases (show V = CoalescedSum.root from hq)
    cases i
    exact hp
  · intro V U i j hi hj
    rw [ha] at hi hj
    cases V with
    | root => exact hi rfl
    | of x =>
      cases U with
      | root => exact nomatch j
      | of y => exact nomatch (show CoalescedSum.of y = CoalescedSum.root from hj)

/-- In a component, the one-world model, the actual world is isolated: the top proposition,
which contains the one arrow. -/
theorem comp_actualWorldIsolated (n : ℕ) : (comp n).ActualWorldIsolated := by
  obtain ⟨a, ha⟩ := comp_full n .t (comp n).W₀ Set.univ
  refine ⟨a, by rw [ha]; trivial, fun p hp q _ => Subsingleton.elim q _ ▸ hp, ?_⟩
  intro V U i j hi _
  exact hi (by rw [ha]; trivial)

/-- Actuality holds where the actual world is isolated: the isolated proposition is true and
entails every truth (`Premodel.holds_actuality_of`). -/
theorem holds_actuality_of_isolated {C : Type} [SmallCategory C] {B : Premodel Signature.pure C}
    (M : B.IsModel) (h : B.ActualWorldIsolated) : B.HoldsSentence P.Actuality.quoted :=
  let ⟨a, ha, hle, _⟩ := h
  Premodel.holds_actuality_of M a ha hle

/-- Actuality at the root, the isolated actual world witnessing it. -/
theorem actuality : model.HoldsSentence P.Actuality.quoted :=
  holds_actuality_of_isolated isModel actualWorldIsolated

/-- Actuality at the root of every component (the group's condition `two-actual-components`,
with `fullest` below): the top proposition of a one-world model is its true atom. -/
theorem comp_actuality (n : ℕ) : (comp n).HoldsSentence P.Actuality.quoted :=
  holds_actuality_of_isolated (comp_isModel n) (comp_actualWorldIsolated n)

/-! ### The group's conditions -/

/-- `distinguished-arrows`: the root arrows are Appendix E's distinguished arrows into the bases
of the components. -/
theorem distinguishedArrows : S = RootArrows.distinguished fun n => (comp n).W₀ := rfl

/-- The root domains are the fullest: every landing intension at the root is in the domain
(for `two-actual-components` and `free-root-component`). -/
theorem fullest : (appendixE comp).Fullest (fullRootIncl _ _) := fullest_full _ _

/-! ### Every truth necessarily 5-necessary -/

/-- **Distinctness-Preserving Collapse is necessary at the root**: it holds at the root and in
every component, the actual world being isolated in each (`Premodel.holds_truths_nd_necessary`). -/
theorem holds_box_dpc : model.HoldsSentence (Term.box P.TruthsAreNDNecessary.quoted) :=
  (holdsSentence_box_iff _).2 ⟨Premodel.holds_truths_nd_necessary isModel actualWorldIsolated,
    fun n => Premodel.holds_truths_nd_necessary (comp_isModel n) (comp_actualWorldIsolated n)⟩

/-- **Every truth is necessarily 5-necessary** at the root (the record's argument
`five-necessity-is-truth`): every truth is ND-necessary at every world (`holds_box_dpc`), and
the map's result `necessary-truth-implies-nd-implies-necessary-truth-implies-five` carries this
to 5-necessity, through the theory of the model. -/
theorem holds_necessary_truth_implies_five_necessity :
    model.HoldsAx P.NecTruthImpliesFiveNecessity.schema := by
  have h : AxiomSet.Entails model.theory P.NecTruthsAreNDNecessary.schema :=
    Premodel.entails_of_holdsAx isModel fun _ e => e ▸ holds_box_dpc
  have := (Premodel.theory_entails_iff isModel _).1
    (h.trans Proofs.necessary_truth_implies_nd_implies_necessary_truth_implies_five.entails)
  exact fun a e => this a e

end Classicism.Meta.Coalesced.AllFinite
