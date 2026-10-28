import Classicism.Semantics.FullModels
import Classicism.Semantics.IntensionalExamples

/-!
# What the arrows of a model decide

The map's general arguments whose conditions are about the arrows out of the evaluation point
(Classicism, Proposition 3.24, with fullness supplying the surjectivity or the
non-injectivity):

- **`epic-arrows`**: in a full model whose arrows out of every reachable object are
  epimorphisms and act surjectively on the individuals, transport is onto at every type, so
  `BF` holds at every world (`holds_box_bf_of_epic`): `full-epic-barcan`.
- **`invertible-arrows`**: `ND` and `BF` at every world (`holds_box_nd_of_invertible`,
  `holds_box_bf_of_invertible`).
- **`retractions`**: every arrow out of the evaluation object has a retraction, so its
  transport is injective, and `ND` holds there (`holds_nd_of_retractions`).
- **`unretracted-arrow`**: in a full model, an arrow out of the evaluation object without a
  retraction transports `⊥` and `{1}` alike, so `ND_t` fails (`not_holds_nd_t_of_unretracted`).
- **`nonidentity-arrow`**: in a full model, `⊤` and `{1}` differ, so the Fregean Axiom fails
  (`Premodel.not_fregean_of_propFull`).
- **`identity-singletons`** and **`unique-retractions-everywhere`**: at each world, the
  singleton of the identity becomes, along an arrow, the set of that arrow's retractions, at
  most one, so it is a true strong atom: Strong Actuality and its necessitation
  (`holds_box_strongActuality_of_unique`): `strong-actuality-unique-retractions`.
- **`separated-retractions`**: a true proposition becomes, along an arrow with two
  retractions, a set containing both, which a proposition there separates, so Strong Actuality
  fails (`not_holds_strongActuality_of_separated`): `separated-retractions-strong-actuality`.
-/

namespace Classicism.Meta.Intensional

open CategoryTheory

namespace Premodel

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C)

/-- `epic-arrows`: every arrow out of every object reachable from the evaluation point is an
epimorphism and acts surjectively on the individuals. -/
def EpicArrows : Prop :=
  ∀ {V U : C} (_ : A.W₀ ⟶ V) (k : V ⟶ U), Epi k ∧ Function.Surjective ((A.inner .e).map k)

/-- `invertible-arrows`: every arrow out of every object reachable from the evaluation point is
invertible. -/
def InvertibleArrows : Prop := ∀ {V U : C} (_ : A.W₀ ⟶ V) (k : V ⟶ U), IsIso k

/-- `retractions`: every arrow out of the evaluation object has a retraction. -/
def Retractions : Prop := ∀ {V : C} (k : A.W₀ ⟶ V), ∃ r : V ⟶ A.W₀, k ≫ r = 𝟙 A.W₀

/-- `unretracted-arrow`: some arrow out of the evaluation object has no retraction. -/
def UnretractedArrow : Prop := ∃ (V : C) (k : A.W₀ ⟶ V), ∀ m : V ⟶ A.W₀, k ≫ m ≠ 𝟙 A.W₀

/-- `nonidentity-arrow`: some arrow out of the evaluation object is not its identity. -/
def NonidentityArrow : Prop :=
  ∃ (V : C) (k : A.W₀ ⟶ V), (⟨V, PUnit.unit, k⟩ : Tuple A.inner .t A.W₀) ≠ ⟨A.W₀, PUnit.unit, 𝟙 A.W₀⟩

/-- `nonepic-arrow`: some arrow out of the evaluation object is not an epimorphism. -/
def NonepicArrow : Prop :=
  ∃ (V U : C) (k : A.W₀ ⟶ V) (j j' : V ⟶ U), j ≠ j' ∧ k ≫ j = k ≫ j'

/-- `returning-arrow`: some arrow out of the evaluation object other than its identity has a
retraction. -/
def ReturningArrow : Prop :=
  ∃ (V : C) (i : A.W₀ ⟶ V) (r : V ⟶ A.W₀), i ≫ r = 𝟙 A.W₀ ∧
    (⟨V, PUnit.unit, i⟩ : Tuple A.inner .t A.W₀) ≠ ⟨A.W₀, PUnit.unit, 𝟙 A.W₀⟩

/-- `coherent-retractions`: every arrow `g` out of the evaluation object has a retraction `r g`,
chosen so that `x ≫ r (g ≫ x) = r g` for every arrow `x` after `g`. -/
def CoherentRetractions : Prop :=
  ∃ r : ∀ {V : C}, (A.W₀ ⟶ V) → (V ⟶ A.W₀), (∀ {V : C} (g : A.W₀ ⟶ V), g ≫ r g = 𝟙 A.W₀) ∧
    ∀ {V U : C} (g : A.W₀ ⟶ V) (x : V ⟶ U), x ≫ r (g ≫ x) = r g

/-- `identity-singletons`: at the evaluation object, and at the target of every arrow out of it,
the singleton of the identity arrow is in the domain. -/
def IdentitySingletons : Prop :=
  ∀ {V : C} (_ : A.W₀ ⟶ V), ∃ x : A.Dom V (.rel .t),
    A.incl .t V x = {(⟨V, PUnit.unit, 𝟙 V⟩ : Tuple A.inner .t V)}

/-- `unique-retractions-everywhere`: at the evaluation object, and at the target of every arrow
out of it, every arrow out of that object has at most one retraction. -/
def UniqueRetractionsEverywhere : Prop :=
  ∀ {V U : C} (_ : A.W₀ ⟶ V) (k : V ⟶ U) (r r' : U ⟶ V), k ≫ r = 𝟙 V → k ≫ r' = 𝟙 V → r = r'

/-- `separated-retractions`: some arrow out of the evaluation object has two retractions that
some proposition in the domain at its target separates. -/
def SeparatedRetractions : Prop :=
  ∃ (V : C) (h : A.W₀ ⟶ V) (j j' : V ⟶ A.W₀) (y : A.Dom V (.rel .t)),
    h ≫ j = 𝟙 A.W₀ ∧ h ≫ j' = 𝟙 A.W₀ ∧
    (⟨A.W₀, PUnit.unit, j⟩ : Tuple A.inner .t V) ∈ A.incl .t V y ∧
    (⟨A.W₀, PUnit.unit, j'⟩ : Tuple A.inner .t V) ∉ A.incl .t V y

/-- A full model has the singleton of every identity arrow. -/
theorem Full.identitySingletons (hF : A.Full) : A.IdentitySingletons := fun {V} _ => hF .t V _

/-- In a full model, two distinct retractions of an arrow out of the evaluation object are
separated, by the singleton of one of them. -/
theorem Full.separatedRetractions (hF : A.Full) {V : C} (h : A.W₀ ⟶ V) (j j' : V ⟶ A.W₀)
    (hj : h ≫ j = 𝟙 A.W₀) (hj' : h ≫ j' = 𝟙 A.W₀) (hne : j ≠ j') : A.SeparatedRetractions := by
  obtain ⟨y, hy⟩ := hF .t V {(⟨A.W₀, PUnit.unit, j⟩ : Tuple A.inner .t V)}
  refine ⟨V, h, j, j', y, hj, hj', by rw [hy]; rfl, fun hm => hne ?_⟩
  rw [hy, Set.mem_singleton_iff] at hm
  obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp hm
  exact (Prod.mk.inj (eq_of_heq hh)).2.symm

variable {A} (M : A.IsModel)
include M

omit M in
/-- In a full model, transport along an epimorphism is onto at every relational type. -/
theorem full_map_surjective_of_epi (hF : A.Full) {W V : C} (k : W ⟶ V) [Epi k] (ρ : RTy) :
    Function.Surjective ((A.inner (.rel ρ)).map k) := by
  intro y
  obtain ⟨x, hx⟩ := hF ρ W {p | ∃ m : V ⟶ p.1, p.2.2 = k ≫ m ∧
    (⟨p.1, p.2.1, m⟩ : Tuple A.inner ρ V) ∈ A.incl ρ V y}
  refine ⟨x, A.incl_injective ρ V ?_⟩
  rw [A.incl_map, hx]
  ext ⟨U, a, m⟩
  simp only [Intension.mem_map, Set.mem_ofPred_eq]
  constructor
  · rintro ⟨m', e, hm'⟩
    rwa [(cancel_epi k).1 e]
  · intro hm
    exact ⟨m, rfl, hm⟩

/-- `BF` at every type of the paper's language, at a world all of whose arrows out are
epimorphisms acting surjectively on the individuals, in a full model. -/
theorem holds_bf_of_epic (hF : A.Full) (hE : A.EpicArrows) {W : C} (h : A.W₀ ⟶ W) (σ : Ty)
    (hσ : σ.Closed) : A.Holds h (Sentence.bf σ) .nil :=
  A.holds_bf_of_surjective M σ h fun {V} k => by
    have := (hE h k).1
    cases σ with
    | e => exact (hE h k).2
    | rel ρ => exact full_map_surjective_of_epi hF k ρ
    | var i => exact absurd hσ (Ty.not_closed_var i)

theorem holds_box_bf_of_epic (hF : A.Full) (hE : A.EpicArrows) {W : C} (h : A.W₀ ⟶ W) (σ : Ty)
    (hσ : σ.Closed) : A.Holds h (Term.box (Sentence.bf σ)) .nil := by
  rw [A.holds_box M]
  intro V k
  exact holds_bf_of_epic M hF hE (h ≫ k) σ hσ

theorem holds_box_nd_of_invertible (hI : A.InvertibleArrows) {W : C} (h : A.W₀ ⟶ W) (σ : Ty) :
    A.Holds h (Term.box (Sentence.nd σ)) .nil := by
  rw [A.holds_box M]
  intro V k
  exact A.holds_nd_of_iso M σ (h ≫ k) fun k' => hI (h ≫ k) k'

theorem holds_box_bf_of_invertible (hI : A.InvertibleArrows) {W : C} (h : A.W₀ ⟶ W) (σ : Ty) :
    A.Holds h (Term.box (Sentence.bf σ)) .nil := by
  rw [A.holds_box M]
  intro V k
  exact A.holds_bf_of_iso M σ (h ≫ k) fun k' => hI (h ≫ k) k'

/-- `ND` at every type holds at the base when every arrow out of it has a retraction: the
transport along the arrow is undone by the transport along the retraction. -/
theorem holds_nd_of_retractions (hr : A.Retractions) (σ : Ty) : A.HoldsSentence (Sentence.nd σ) := by
  rw [HoldsSentence, A.holds_nd_iff M]
  intro V k
  obtain ⟨r, hr⟩ := hr k
  intro x y e
  have := congrArg ((A.inner σ).map r) e
  simp only [← Functor.map_comp_apply, hr, Functor.map_id_apply] at this
  exact this

/-- In a full model, an arrow out of the evaluation object with no retraction transports `⊥`
and `{1}` alike, so `ND_t` fails. -/
theorem not_holds_nd_t_of_unretracted (hF : A.Full) (hU : A.UnretractedArrow) :
    ¬ A.HoldsSentence (Sentence.nd (.rel .t)) := by
  obtain ⟨V, k, hk⟩ := hU
  rw [HoldsSentence, A.holds_nd_iff M]
  intro H
  obtain ⟨x, hx⟩ := hF .t A.W₀ ∅
  obtain ⟨y, hy⟩ := hF .t A.W₀ {⟨A.W₀, PUnit.unit, 𝟙 A.W₀⟩}
  have e : (A.inner (.rel .t)).map k x = (A.inner (.rel .t)).map k y := by
    apply A.incl_injective .t V
    rw [A.incl_map, A.incl_map, hx, hy]
    ext ⟨U, a, m⟩
    simp only [Intension.mem_map, Set.mem_empty_iff_false, Set.mem_singleton_iff, false_iff]
    intro he
    obtain ⟨rfl, hh⟩ := Sigma.mk.inj_iff.mp he
    exact hk m (Prod.mk.inj (eq_of_heq hh)).2
  have := H k e
  subst this
  rw [hx] at hy
  exact Set.singleton_ne_empty _ hy.symm

omit M in
/-- **Distinctness-Preserving Collapse fails** in a full model with a returning arrow `i` other
than the identity: `{1}` is true, every true `q` contains the identity, so after `i`, which
returns, `◇q` holds while `{1}` does not. -/
theorem not_holds_dpc_of_returning {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full)
    (hR : B.ReturningArrow) : ¬ B.HoldsSentence P.DistinctnessPreservingCollapse.quoted := by
  obtain ⟨V, i, r, hir, hne⟩ := hR
  simp only [Premodel.HoldsSentence, P.DistinctnessPreservingCollapse.quoted, B.holds_forall M,
    B.holds_imp M, B.holds_exists M, B.holds_conj M, B.holds_box M, B.holds_dia M, holds_var,
    IEnv.get, IEnv.get_map, B.incl_map, Intension.mem_map, Category.comp_id, Category.id_comp]
  intro H
  obtain ⟨p, hp⟩ := hF .t B.W₀ {⟨B.W₀, PUnit.unit, 𝟙 B.W₀⟩}
  obtain ⟨q, hq, hbox⟩ := H p (by rw [hp]; rfl)
  have := @hbox V i ⟨B.W₀, r, by rw [hir]; exact hq⟩
  rw [hp] at this
  exact hne this

omit M in
/-- **Strong Atomicity at `t` fails** in a full model with an arrow `k` out of the evaluation
object that is not an epimorphism, `k ≫ j = k ≫ j'` with `j ≠ j'`: the proposition `{k ≫ j}` is
possible, its only candidate strong atom is itself, and after `k` it holds at both `j` and
`j'`, which a proposition there separates. -/
theorem not_holds_strongAtomicityT_of_nonepic {B : Premodel Signature.pure C} (M : B.IsModel)
    (hF : B.Full) (hN : B.NonepicArrow) : ¬ B.HoldsSentence P.StrongAtomicityT.quoted := by
  obtain ⟨V, U, k, j, j', hjj', hk⟩ := hN
  have sem_bot' : ∀ {Γ : Ctx} {W : C} (h : B.W₀ ⟶ W) (g : IEnv (B.Dom W) Γ),
      B.sem h (Term.bot : Formula Signature.pure Γ) g = ∅ := fun h g => B.sem_bot M h g
  simp only [Premodel.HoldsSentence, P.StrongAtomicityT.quoted, B.holds_forall M, B.holds_imp M,
    B.holds_exists M, B.holds_conj M, B.holds_neg M, B.holds_box M, B.holds_disj M]
  simp only [B.holds_eq M, sem_var, sem_bot', B.sem_disj M, B.sem_neg M, IEnv.get, IEnv.get_map,
    B.incl_map]
  intro H
  obtain ⟨x, hx⟩ := hF .t B.W₀ {⟨U, PUnit.unit, k ≫ j⟩}
  obtain ⟨w, ⟨hw, hbox⟩, hle⟩ := H x (by rw [hx]; exact Set.singleton_ne_empty _)
  -- `w` is below `{k ≫ j}` and not `⊥`, so it is `{k ≫ j}`
  rw [hx] at hle
  have hwx : B.incl .t B.W₀ w = {⟨U, PUnit.unit, k ≫ j⟩} := by
    have hsub : B.incl .t B.W₀ w ⊆ {⟨U, PUnit.unit, k ≫ j⟩} := Set.union_eq_right.1 hle.symm
    exact (Set.subset_singleton_iff_eq.1 hsub).resolve_left hw
  obtain ⟨y, hy⟩ := hF .t V {⟨U, PUnit.unit, j⟩}
  have hj : (⟨U, PUnit.unit, j⟩ : Tuple B.inner .t V) ∈
      Intension.map B.inner k (B.incl .t B.W₀ w) := by
    rw [hwx]; rfl
  have hj' : (⟨U, PUnit.unit, j'⟩ : Tuple B.inner .t V) ∈
      Intension.map B.inner k (B.incl .t B.W₀ w) := by
    rw [hwx]; show _ = _; rw [hk]
  rcases @hbox V k y with e | e
  · have : (⟨U, PUnit.unit, j'⟩ : Tuple B.inner .t V) ∈ B.incl .t V y := by
      rw [e]; exact Or.inl hj'
    rw [hy] at this
    obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp (Set.mem_singleton_iff.1 this)
    exact hjj' (Prod.mk.inj (eq_of_heq hh)).2.symm
  · have : (⟨U, PUnit.unit, j⟩ : Tuple B.inner .t V) ∈ (B.incl .t V y)ᶜ := by
      rw [e]; exact Or.inl hj
    rw [hy] at this
    exact this rfl

omit M in
/-- **Gallin Extensional Comprehension** holds where the retractions are coherent and the model is
full: the relation holding of a tuple at an arrow `g` when the tuple, pulled back along `g`'s
retraction, is in `X`'s extension is coextensive with `X` and unchanged along every arrow, so
it and its negation are persistent. -/
theorem holds_gallin_of_coherent {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full)
    (hR : B.CoherentRetractions) (ρ : RTy) :
    B.HoldsSentence (P.GallinExtensionalComprehension.quoted ρ) := by
  obtain ⟨r, hret, hcoh⟩ := hR
  simp only [Premodel.HoldsSentence, P.GallinExtensionalComprehension.quoted, B.holds_forall M,
    B.holds_exists M, B.holds_conj M, B.holds_box M, holds_inclR M, holds_coextR M, sem_boxR M,
    sem_negR M, sem_var, IEnv.get, IEnv.get_map, B.incl_map, Intension.mem_map, Set.mem_ofPred_eq,
    Set.mem_compl_iff, Category.comp_id, Category.id_comp]
  intro X
  have hr1 : r (𝟙 B.W₀) = 𝟙 B.W₀ := by simpa using hret (𝟙 B.W₀)
  have inv : ∀ {V U : C} (k : B.W₀ ⟶ V) (k₁ : V ⟶ U) (x : Args B.inner ρ V),
      Args.map B.inner ρ (r (k ≫ k₁)) (Args.map B.inner ρ k₁ x) = Args.map B.inner ρ (r k) x := by
    intro V U k k₁ x
    rw [← Args.map_comp, hcoh]
  obtain ⟨Y, hY⟩ := hF ρ B.W₀ {p | (⟨B.W₀, Args.map B.inner ρ (r p.2.2) p.2.1, 𝟙 B.W₀⟩ : Tuple B.inner ρ B.W₀) ∈
    B.incl ρ B.W₀ X}
  refine ⟨Y, fun k x hx U k₁ => ?_, fun k x hx U k₁ => ?_, fun x => ?_⟩
  · rw [hY] at hx ⊢
    show _ ∈ B.incl ρ B.W₀ X
    rw [inv]
    exact hx
  · rw [hY] at hx ⊢
    intro h'
    apply hx
    change _ ∈ B.incl ρ B.W₀ X at h'
    rwa [inv] at h'
  · rw [hY]
    show _ ↔ (⟨B.W₀, Args.map B.inner ρ (r (𝟙 B.W₀)) x, 𝟙 B.W₀⟩ : Tuple B.inner ρ B.W₀) ∈ B.incl ρ B.W₀ X
    rw [hr1, Args.map_id]


omit M in
/-- **Strong Actuality at a world** `h`, when the singleton of the identity at its object `V` is
in the domain and every arrow out of `V` has at most one retraction: along an arrow `k` the
singleton becomes the set of `k`'s retractions, which every proposition there contains or
excludes. -/
theorem holds_strongActuality_at {B : Premodel Signature.pure C} (M : B.IsModel) {V : C}
    (h : B.W₀ ⟶ V) (x : B.Dom V (.rel .t))
    (hx : B.incl .t V x = {(⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V)})
    (hu : ∀ {U : C} (k : V ⟶ U) (r r' : U ⟶ V), k ≫ r = 𝟙 V → k ≫ r' = 𝟙 V → r = r') :
    B.Holds h P.StrongActuality.quoted .nil := by
  simp only [P.StrongActuality.quoted, B.holds_exists M, B.holds_conj M, B.holds_box M,
    B.holds_forall M, B.holds_disj M, holds_var]
  simp only [B.holds_eq M, sem_var, B.sem_disj M, B.sem_neg M, IEnv.get, IEnv.get_map, B.incl_map]
  refine ⟨x, by rw [hx]; rfl, fun {U} k y => ?_⟩
  have key : ∀ t t' : Tuple B.inner .t U, t ∈ Intension.map B.inner k (B.incl .t V x) →
      t' ∈ Intension.map B.inner k (B.incl .t V x) → t = t' := by
    rintro ⟨Z, ⟨⟩, m⟩ ⟨Z', ⟨⟩, m'⟩ hm hm'
    rw [Intension.mem_map, hx, Set.mem_singleton_iff] at hm hm'
    obtain ⟨rfl, hh⟩ := Sigma.mk.inj_iff.mp hm
    obtain ⟨rfl, hh'⟩ := Sigma.mk.inj_iff.mp hm'
    rw [hu k m m' (Prod.mk.inj (eq_of_heq hh)).2 (Prod.mk.inj (eq_of_heq hh')).2]
  by_cases hex : ∃ t ∈ Intension.map B.inner k (B.incl .t V x), t ∈ B.incl .t U y
  · obtain ⟨t, ht, hty⟩ := hex
    exact Or.inl (Set.union_eq_right.2 fun t' ht' => key t t' ht ht' ▸ hty).symm
  · exact Or.inr (Set.union_eq_right.2 fun t ht hty => hex ⟨t, ht, hty⟩).symm

omit M in
/-- **Strong Actuality and its necessitation** where the identity singletons are in the domain
and the retractions unique, at the evaluation object and after it. -/
theorem holds_box_strongActuality_of_unique {B : Premodel Signature.pure C} (M : B.IsModel)
    (hI : B.IdentitySingletons) (hU : B.UniqueRetractionsEverywhere) :
    B.HoldsSentence P.StrongActuality.quoted ∧ B.HoldsSentence (Term.box P.StrongActuality.quoted) := by
  have at_ : ∀ {V : C} (h : B.W₀ ⟶ V), B.Holds h P.StrongActuality.quoted .nil := fun {V} h =>
    (hI h).elim fun x hx => holds_strongActuality_at M h x hx (hU h)
  refine ⟨at_ (𝟙 _), ?_⟩
  rw [HoldsSentence, B.holds_box M]
  intro V k
  exact at_ _

omit M in
/-- **Strong Actuality fails** where an arrow `h` out of the evaluation object has retractions
`j`, `j'` separated by a proposition `y`: a true proposition contains the identity, so after `h`
it holds at `j` and at `j'`, and lies neither below `y` nor below its negation. -/
theorem not_holds_strongActuality_of_separated {B : Premodel Signature.pure C} (M : B.IsModel)
    (hS : B.SeparatedRetractions) : ¬ B.HoldsSentence P.StrongActuality.quoted := by
  obtain ⟨V, h, j, j', y, hj, hj', hy, hy'⟩ := hS
  simp only [Premodel.HoldsSentence, P.StrongActuality.quoted, B.holds_exists M, B.holds_conj M,
    B.holds_box M, B.holds_forall M, B.holds_disj M, holds_var]
  simp only [B.holds_eq M, sem_var, B.sem_disj M, B.sem_neg M, IEnv.get, IEnv.get_map, B.incl_map]
  rintro ⟨w, hw, hbox⟩
  have mem : ∀ r : V ⟶ B.W₀, h ≫ r = 𝟙 B.W₀ →
      (⟨B.W₀, PUnit.unit, r⟩ : Tuple B.inner .t V) ∈ Intension.map B.inner h (B.incl .t B.W₀ w) := by
    intro r hr
    rw [Intension.mem_map]
    show (⟨B.W₀, PUnit.unit, h ≫ r⟩ : Tuple B.inner .t B.W₀) ∈ _
    rw [hr]
    exact hw
  rcases @hbox V h y with e | e
  · exact hy' (e ▸ Or.inl (mem j' hj'))
  · have : (⟨B.W₀, PUnit.unit, j⟩ : Tuple B.inner .t V) ∈ (B.incl .t V y)ᶜ := e ▸ Or.inl (mem j hj)
    exact this hy

end Premodel

end Classicism.Meta.Intensional
