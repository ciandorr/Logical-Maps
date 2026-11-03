import Classicism.Coalesced.Complete
import Classicism.Semantics.Interpretations
import Classicism.Semantics.Numerals
import Classicism.Results.Consistency.Consistency
import Mathlib.Data.Fintype.Prod

/-!
# The map's group `coalesced-sums` in Lean

The construction's data, bundled (`SumData`): a family of intensional action premodels on
categories `C k`, the **root arrows** (any `RootArrows`, so that distinguished arrows,
interpretation arrows and substitution arrows are all instances), a **root action** and a
**root inclusion** (any root domains: the fullest, pinned, definable), the root individuals'
nonemptiness, the root values of the constants, and the proof that the coalesced sum
(`RootAction.coalescedSum`) is a model. The group's Lean parameter is a `SumData`; its model is
`SumData.model`, and each member gives its own data as `lean.param`.

The group's conditions, as predicates of the data:

* `complete-components` (`SumData.CompleteComponents`): every closed-type pure sentence
  consistent with `C` is true at the root of some component. Over distinguished arrows this
  gives the weaker `RootAction.CompleteComponents`, the sentence holding in the component seen
  from some root arrow, which is what Maximalism at the root needs
  (`SumData.completeComponents_root`).
* `distinguished-arrows` (`SumData.DistinguishedArrows`): the root has only its identity as
  endo-arrow, and each component has an arrow `d` from the root to the component's root
  through which every root arrow into the component factors uniquely.
* `fullest-domains` (`SumData.FullestDomains`): every intension at the root whose transport
  along every root arrow is in the component's domain is a root entity.
* `free-root-component` (`SumData.FreeRootComponent`): any intension at the root agreeing
  with a root entity off the root (on the tuples whose world lies in a component) is a root
  entity: the root component is an arbitrary function of the root arguments.

What they give:

* with a free root component the root is **extensionally full**
  (`SumData.extFull_root`), so Relational Choice holds there (`holds_rc_root`, by choice in the
  metatheory) and, with infinitely many root individuals, the Axiom of Infinity at `e`
  (`holds_axiomOfInfinityE_root`);
* with a free root component and only the identity at the root, **the actual world is
  isolated** (`actualWorldIsolated_of`): the singleton of the root's identity arrow is a root
  proposition.

**The distinguished members** (`SumData.ofDistinguished`, and `SumData.ofAppendixE` with
Appendix E's product individuals and union constants): Appendix E's construction over the
distinguished arrows with the fullest root domains, any root individuals and any root values of
the constants transported to the components'. They meet `distinguished-arrows`
(`distinguishedArrows_ofDistinguished`) and `free-root-component`
(`freeRootComponent_ofDistinguished`), and `complete-components` when every sentence consistent
with `C(Σ)` holds at the base of some component (`completeComponents_ofDistinguished`). The
three members built here, all over the complete family of `Complete.lean`:

* `maximalistData`: product root individuals, the constants' root values the unions of the
  components' (`coalesced-maximalist-root`, at the signature `Σ = {c : t}`, `Signature.sigmaTop`);
* `singleIndividualData`: one root individual, carried to a chosen individual of each
  component, at the pure signature (`coalesced-single-individual-root`);
* `constantIndexedData`: the signature with individual constants `cₙ`, `n : ℕ`, and one
  constant of type `t` (`constantSig`); the root individuals are the `n`, the constant `cₙ`
  denoting `n` at the root and carried to its value in each component
  (`coalesced-constant-indexed-root`).
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

/-- **The data of a coalesced sum that is a model**: the group `coalesced-sums`'s parameter. -/
structure SumData : Type 1 where
  /-- The signature. -/
  Sig : Signature
  /-- The index of the components. -/
  ι : Type
  /-- The components' categories. -/
  C : ι → Type
  [cat : ∀ k, SmallCategory (C k)]
  /-- The root arrows. -/
  S : RootArrows C
  /-- The components. -/
  A : ∀ k, Premodel Sig (C k)
  /-- The root domains and their transports. -/
  RA : RootAction S A
  /-- The inclusion of the root relational domains into the intensions. -/
  RI : RootIncl RA
  /-- There is a root individual. -/
  ne : Nonempty (RA.D .e)
  /-- The root values of the constants. -/
  I : ∀ c : Sig.Const, RA.D (Sig.typeOf c)
  /-- The coalesced sum is a model. -/
  isModel' : (RA.coalescedSum RI ne I).IsModel

attribute [instance] SumData.cat

namespace SumData

variable (D : SumData)

/-- The coalesced sum, evaluated at its root. -/
abbrev model : Premodel D.Sig (CoalescedSum D.S) := D.RA.coalescedSum D.RI D.ne D.I

theorem isModel : D.model.IsModel := D.isModel'

/-- Every closed-type pure sentence consistent with `C` is true at the root of some component. -/
def CompleteAtRoots : Prop :=
  ∀ p : Sentence Signature.pure, p.closedTypes = true → AxiomSet.Consistent (AxiomSet.single p) →
    ∃ k : D.ι, (D.A k).HoldsSentence (Term.ofPure p)

/-- `complete-components`: every closed-type pure sentence consistent with `C` is true at the
root of some component, and so in the component seen from some root arrow. The second conjunct
follows from the first over distinguished arrows (`completeComponents_of_roots`); it is what
Maximalism at the root uses, whatever the root arrows, and the first is what the transfer
arguments use. -/
def CompleteComponents : Prop := D.CompleteAtRoots ∧ D.RA.CompleteComponents D.I

/-- `distinguished-arrows`: only the identity at the root, and in each component a root arrow `d`
to the component's root through which every root arrow into the component factors uniquely. -/
def DistinguishedArrows : Prop :=
  (∀ m : D.S.End, m = D.S.one) ∧
    ∀ k : D.ι, ∃ d : D.S.R.obj ⟨k, (D.A k).W₀⟩, ∀ (V : D.C k) (r : D.S.R.obj ⟨k, V⟩),
      ∃! j : (D.A k).W₀ ⟶ V, D.S.R.map (SigmaHom.mk j) d = r

/-- `free-root-component`: an intension at the root that agrees with a root entity on every
tuple whose world lies in a component is a root entity. -/
def FreeRootComponent : Prop :=
  ∀ (ρ : RTy) (x : D.RA.D (.rel ρ)) (Y : Intension D.RA.inner ρ (CoalescedSum.base D.S)),
    (∀ p : Tuple D.RA.inner ρ (CoalescedSum.base D.S), p.1 ≠ CoalescedSum.root →
      (p ∈ Y ↔ p ∈ D.RI.incl ρ x)) →
      ∃ y, D.RI.incl ρ y = Y

/-- `fullest-domains`: the root domains are the **fullest**, every landing intension at the root
being the inclusion of a root entity (`RootAction.Fullest`). -/
def FullestDomains : Prop := D.RA.Fullest D.RI

/-- Over distinguished arrows, a sentence true at the root of a component holds in the component
seen from the distinguished arrow into it, a pure sentence not depending on the constants: so
`complete-components` gives the components' completeness as Maximalism at the root uses it
(`RootAction.holds_dia_of_complete`). -/
theorem completeComponents_of_roots {D : SumData} (hD : D.DistinguishedArrows) (hc : D.CompleteAtRoots) :
    D.CompleteComponents := ⟨hc, fun p hp h => by
  obtain ⟨k, hk⟩ := hc p hp h
  obtain ⟨d, -⟩ := hD.2 k
  have e : (D.RA.component D.I d).reduct = (D.A k).reduct := rfl
  have h1 := (Premodel.holdsSentence_ofPure (D.A k) p).1 hk
  rw [← e] at h1
  exact ⟨k, _, d, (Premodel.holdsSentence_ofPure (D.RA.component D.I d) p).2 h1⟩⟩

/-- The form of `complete-components` Maximalism at the root uses. -/
theorem completeComponents_root {D : SumData} (_hD : D.DistinguishedArrows) (hc : D.CompleteComponents) :
    D.RA.CompleteComponents D.I := hc.2

/-! ### A free root component -/

variable {D}

/-- Every root relational domain is inhabited: by the value of `⊥_ρ`. -/
theorem nonempty_rel (ρ : RTy) : Nonempty (D.RA.D (.rel ρ)) :=
  ⟨(D.isModel (𝟙 _) (Term.botR (Sig := D.Sig) (Γ := []) ρ) .nil).choose⟩

/-- **With a free root component the root is extensionally full**: every set of tuples of root
arguments is the extension at the root of a root entity. -/
theorem extFull_root (hF : D.FreeRootComponent) (ρ : RTy)
    (E : Set (Args D.model.inner ρ D.model.W₀)) :
    ∃ x : D.model.Dom D.model.W₀ (.rel ρ), (D.model.incl ρ D.model.W₀ x).ext' D.model.inner = E := by
  obtain ⟨x0⟩ := nonempty_rel (D := D) ρ
  let Y : Intension D.RA.inner ρ (CoalescedSum.base D.S) :=
    {p | (p.1 = CoalescedSum.root ∧ ∃ a ∈ E, p = ⟨_, a, 𝟙 _⟩) ∨
      (p.1 ≠ CoalescedSum.root ∧ p ∈ D.RI.incl ρ x0)}
  obtain ⟨y, hy⟩ := hF ρ x0 Y fun p hp =>
    ⟨fun h => h.elim (fun h => absurd h.1 hp) And.right, fun h => Or.inr ⟨hp, h⟩⟩
  refine ⟨y, ?_⟩
  show {a | (⟨_, a, 𝟙 _⟩ : Tuple D.RA.inner ρ (CoalescedSum.base D.S)) ∈ D.RI.incl ρ y} = E
  rw [hy]
  ext a
  constructor
  · rintro (⟨-, a', ha', e⟩ | ⟨h, -⟩)
    · cases e; exact ha'
    · exact absurd rfl h
  · exact fun ha => Or.inl ⟨rfl, a, ha, rfl⟩

/-- **Relational Choice at the root** (`relational-choice-free-root`): the root is extensionally
full, and a serial relation's extension there has a functional subset, by choice in the
metatheory (`Premodel.holds_rc_at`). -/
theorem holds_rc_root (hF : D.FreeRootComponent) :
    D.model.HoldsAx P.RelationalChoice.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  rintro _ ⟨σ, τ, -, -, rfl⟩
  exact Premodel.holds_rc_at (D.model.reduct_isModel D.isModel) (extFull_root hF) (𝟙 _) σ τ

/-- **The Axiom of Infinity at `e` at the root**, with a free root component and infinitely many
root individuals: the property of the finite cardinalities is a root entity
(`Premodel.holds_axInf_of_finiteCards`). -/
theorem holds_axiomOfInfinityE_root (hF : D.FreeRootComponent) (hinf : Infinite (D.RA.D .e)) :
    D.model.HoldsAx P.AxiomOfInfinityE.schemaIn := by
  have : Infinite (D.model.reduct.Dom D.model.reduct.W₀ .e) := hinf
  rw [Premodel.holdsAx_ofPure]
  rintro _ rfl
  exact Premodel.holds_axInf_of_finiteCards (D.model.reduct_isModel D.isModel) (𝟙 _) .e
    (extFull_root hF _ _)

/-- **The actual world is isolated** at a root with a free root component and no endo-arrow but
the identity: the singleton of the root's identity arrow is a root proposition, true, below
every truth, and no arrow out of the root other than the identity reaches the root. -/
theorem actualWorldIsolated_of (hF : D.FreeRootComponent) (hE : ∀ m : D.S.End, m = D.S.one) :
    D.model.ActualWorldIsolated := by
  obtain ⟨b, hb⟩ := D.isModel (𝟙 _) (Term.bot (Sig := D.Sig) (Γ := [])) .nil
  have hb' : D.RI.incl .t b = ∅ := hb.trans (D.model.sem_bot D.isModel _ _)
  let a0 : Tuple D.RA.inner .t (CoalescedSum.base D.S) := ⟨CoalescedSum.root, PUnit.unit, D.S.one⟩
  obtain ⟨a, ha⟩ := hF .t b {a0} fun p hp => by
    rw [hb']
    exact ⟨fun h => hp (by rw [show p = a0 from h]), fun h => h.elim⟩
  refine ⟨a, ?_, fun p hp => ?_, fun {V U} i j hi hj => ?_⟩
  · show a0 ∈ D.RI.incl .t a
    rw [ha]; rfl
  · show D.RI.incl .t a ⊆ D.RI.incl .t p
    rw [ha]
    rintro _ rfl
    exact hp
  · change (⟨U, PUnit.unit, i ≫ j⟩ : Tuple D.RA.inner .t (CoalescedSum.base D.S)) ∈ D.RI.incl .t a at hj
    change (⟨V, PUnit.unit, i⟩ : Tuple D.RA.inner .t (CoalescedSum.base D.S)) ∉ D.RI.incl .t a at hi
    rw [ha] at hi hj
    have hU : U = CoalescedSum.root := congrArg Sigma.fst hj
    subst hU
    match V, i, j with
    | .root, i, _ => exact hi (by rw [show i = D.S.one from hE i]; rfl)
    | .of _, _, j => exact nomatch j

end SumData

/-! ### Distinguished arrows with the fullest root domains -/

section Distinguished

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  (A : ∀ k, Premodel Sig (C k)) (ae : AtomAction (baseArrows A) A .e)
  (av : ∀ i, AtomAction (baseArrows A) A (.var i)) (ne : Nonempty ae.D)
  (I : ∀ c : Sig.Const, (fullAction ae av).D (Sig.typeOf c))

/-- **Appendix E's coalesced sum as group data**: the distinguished arrows into the bases of the
components, the fullest root domains, the given root individuals and root values of the
constants, transported to the components' values. -/
noncomputable abbrev SumData.ofDistinguished (hI : TransportsConstants (fullAction ae av) I)
    (M : ∀ k, (A k).IsModel) : SumData where
  Sig := Sig
  ι := ι
  C := C
  S := baseArrows A
  A := A
  RA := fullAction ae av
  RI := fullRootIncl ae av
  ne := ne
  I := I
  isModel' := isModel_distinguished A ae av ne I hI M

variable {A ae av ne I}

/-- They meet `distinguished-arrows`: an arrow `h` out of a component's base is `𝟙 ≫ h`, and only
so. -/
theorem SumData.distinguishedArrows_ofDistinguished (hI : TransportsConstants (fullAction ae av) I)
    (M : ∀ k, (A k).IsModel) : (SumData.ofDistinguished A ae av ne I hI M).DistinguishedArrows :=
  ⟨fun _ => rfl, fun k => ⟨dist A k, fun _ r =>
    ⟨r, Category.id_comp r, fun j hj => (Category.id_comp j).symm.trans hj⟩⟩⟩

/-- They meet `free-root-component`, the root domains being the fullest: an intension that agrees
with a root entity off the root has the same transports along the root arrows, so lands. -/
theorem SumData.freeRootComponent_ofDistinguished (hI : TransportsConstants (fullAction ae av) I)
    (M : ∀ k, (A k).IsModel) : (SumData.ofDistinguished A ae av ne I hI M).FreeRootComponent := by
  intro ρ x Y hY
  refine fullest_full ae av ρ Y fun {k V} r => ?_
  have e : (fullAction ae av).transport r Y = (fullAction ae av).transport r ((fullRootIncl ae av).incl ρ x) := by
    ext p
    exact hY _ (fun h => by cases h)
  rw [e]
  exact (fullAction ae av).lands_incl (fullRootIncl ae av) x r

/-- They meet `fullest-domains`: the root domains are `fullAction`'s (`fullest_full`). -/
theorem SumData.fullestDomains_ofDistinguished (hI : TransportsConstants (fullAction ae av) I)
    (M : ∀ k, (A k).IsModel) : (SumData.ofDistinguished A ae av ne I hI M).FullestDomains :=
  fullest_full ae av

/-- They meet `complete-components` when every sentence consistent with `C(Σ)` holds at the base
of some component, the signature being closed. -/
theorem SumData.completeComponents_ofDistinguished (hI : TransportsConstants (fullAction ae av) I)
    (M : ∀ k, (A k).IsModel) (hS : Sig.Closed)
    (hA : ∀ p : Sentence Sig, p.closedTypes = true → AxiomSet.Consistent (AxiomSet.single p) →
      ∃ k : ι, (A k).HoldsSentence p) :
    (SumData.ofDistinguished A ae av ne I hI M).CompleteComponents :=
  SumData.completeComponents_of_roots (SumData.distinguishedArrows_ofDistinguished hI M) fun p hp hc =>
  hA (Term.ofPure p) (by rw [Term.closedTypes_ofPure]; exact hp)
    (by
      have := (AxiomSet.consistent_ofPure_iff (Sig := Sig) hS (A := AxiomSet.single p)).2 hc
      refine AxiomSet.Consistent.mono ?_ this
      rintro _ rfl
      exact ⟨p, rfl, rfl⟩)

end Distinguished

/-! ### Appendix E's choices -/

section AppendixE

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  (A : ∀ k, Premodel Sig (C k)) (M : ∀ k, (A k).IsModel)

/-- **Appendix E's coalesced sum of a family of models as group data**: distinguished arrows,
the fullest root domains, the product of the components' individuals as root individuals, the
unions of the components' intensions as the root values of the constants. Its model is
`(appendixE A).coalescedSum (fullRootIncl _ _) ne (appendixEConst A)` for any `ne`. -/
noncomputable abbrev SumData.ofAppendixE : SumData :=
  SumData.ofDistinguished A (productAtom A .e) (fun i => productAtom A (.var i))
    ⟨fun k => Classical.choice ((A k).nonempty_e _)⟩ (appendixEConst A) (transportsConstants_appendixE A) M

variable {A}

theorem SumData.ofAppendixE_distinguished : (SumData.ofAppendixE A M).DistinguishedArrows :=
  SumData.distinguishedArrows_ofDistinguished _ _

theorem SumData.ofAppendixE_free : (SumData.ofAppendixE A M).FreeRootComponent :=
  SumData.freeRootComponent_ofDistinguished _ _

theorem SumData.ofAppendixE_fullest : (SumData.ofAppendixE A M).FullestDomains :=
  SumData.fullestDomains_ofDistinguished _ _

theorem SumData.ofAppendixE_isolated : (SumData.ofAppendixE A M).model.ActualWorldIsolated :=
  SumData.actualWorldIsolated_of (SumData.ofAppendixE_free M) fun _ => rfl

end AppendixE

/-! ### Root values of relational constants over the distinguished arrows -/

section UnionConst

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {A : ∀ k, Premodel Sig (C k)} (ae : AtomAction (baseArrows A) A .e)
  (av : ∀ i, AtomAction (baseArrows A) A (.var i))

/-- Appendix E's root value at a relational type for any root individuals: the union of the
components' intensions, with the empty extension at the root (`productConst`). -/
noncomputable def unionConst {ρ : RTy} (y : ∀ k, (A k).Dom (A k).W₀ (.rel ρ)) :
    (fullAction ae av).D (.rel ρ) :=
  ⟨unionTuples A y, fun h => ⟨_, (rootTransport_unionTuples A y h).symm⟩, trivial⟩

theorem tr_unionConst {ρ : RTy} (y : ∀ k, (A k).Dom (A k).W₀ (.rel ρ)) (k : ι) :
    (fullAction ae av).tr (.rel ρ) (dist A k) (unionConst ae av y) = y k := by
  apply (A k).incl_injective ρ _
  refine (incl_relLevel_tr Selector.all ρ _ (dist A k) _).trans ?_
  exact (rootTransport_unionTuples A y _).trans
    (congrArg ((A k).incl ρ _) (((A k).inner (.rel ρ)).map_id_apply _ (y k)))

end UnionConst

/-! ### The three members over the complete family -/

open Completeness

/-- The maximalist root over a countable closed signature, as group data. -/
noncomputable abbrev maximalistData (Sig : Signature) [Countable Sig.Const] : SumData :=
  SumData.ofAppendixE (canonicalFamily Sig) canonicalFamily_isModel

instance : Countable Signature.sigmaTop.Const := inferInstanceAs (Countable Unit)

/-- **`coalesced-maximalist-root`**: the maximalist root at the signature `{c : t}`. -/
noncomputable abbrev maximalistRoot : SumData := maximalistData Signature.sigmaTop

theorem sigmaTop_closed : Signature.sigmaTop.Closed := fun _ => (by decide : Ty.Closed (.rel .t))

theorem maximalistData_complete {Sig : Signature} [Countable Sig.Const] (hS : Sig.Closed) :
    (maximalistData Sig).CompleteComponents :=
  SumData.completeComponents_ofDistinguished (transportsConstants_appendixE _) canonicalFamily_isModel hS (canonicalFamily_complete hS)

theorem maximalistData_distinguished {Sig : Signature} [Countable Sig.Const] :
    (maximalistData Sig).DistinguishedArrows :=
  SumData.ofAppendixE_distinguished canonicalFamily_isModel

theorem maximalistData_free {Sig : Signature} [Countable Sig.Const] :
    (maximalistData Sig).FreeRootComponent :=
  SumData.ofAppendixE_free canonicalFamily_isModel

theorem maximalistData_fullest {Sig : Signature} [Countable Sig.Const] :
    (maximalistData Sig).FullestDomains :=
  SumData.ofAppendixE_fullest canonicalFamily_isModel

theorem maximalistData_isolated {Sig : Signature} [Countable Sig.Const] :
    (maximalistData Sig).model.ActualWorldIsolated :=
  SumData.actualWorldIsolated_of maximalistData_free fun _ => rfl

/-- **Maximalism for the signature at the maximalist root** (Theorem 3.26): every closed identity
of the signature that `C(Σ)` does not prove is false there. -/
theorem maximalistData_distinctnessC {Sig : Signature} [Countable Sig.Const] (hS : Sig.Closed) :
    (maximalistData Sig).model.HoldsAx (AxiomSet.distinctnessC Sig) :=
  maximalist_distinctnessC hS

/-- The root individuals of the maximalist root are infinitely many: some component satisfies the
Axiom of Infinity at `e` (it is consistent with `C`), so has infinitely many individuals at its
base, and the root individuals are the families of the components' individuals. -/
theorem maximalistData_infinite {Sig : Signature} [Countable Sig.Const] (hS : Sig.Closed) :
    Infinite ((maximalistData Sig).RA.D .e) := by
  obtain ⟨w, hw⟩ := canonicalFamily_complete hS (Term.ofPure P.AxiomOfInfinityE.quoted)
    (by rw [Term.closedTypes_ofPure]; decide)
    (by
      have := (AxiomSet.consistent_ofPure_iff (Sig := Sig) hS).2 axiomOfInfinityE_consistent
      refine AxiomSet.Consistent.mono ?_ this
      rintro _ rfl
      exact ⟨_, rfl, rfl⟩)
  rw [Premodel.holdsSentence_ofPure] at hw
  have hinf : Infinite ((canonicalFamily Sig w).reduct.Dom (canonicalFamily Sig w).reduct.W₀ .e) := by
    by_contra hfin
    rw [not_infinite_iff_finite] at hfin
    exact Premodel.not_holds_axInf_of_finite ((canonicalFamily Sig w).reduct_isModel
      (canonicalFamily_isModel w)) (𝟙 _) .e hw
  have : ∀ k, Nonempty ((canonicalFamily Sig k).Dom (canonicalFamily Sig k).W₀ .e) :=
    fun k => (canonicalFamily Sig k).nonempty_e _
  have : Infinite ((canonicalFamily Sig w).Dom (canonicalFamily Sig w).W₀ .e) := hinf
  exact Pi.infinite_of_exists_right w

/-! #### One root individual -/

/-- The single-individual root: the complete family at the pure signature, one root individual,
carried by the distinguished arrow to a chosen individual of each component. -/
noncomputable abbrev singleIndividualData : SumData :=
  SumData.ofDistinguished (canonicalFamily Signature.pure)
    (pointAtom _ .e PUnit fun k _ => Classical.choice ((canonicalFamily Signature.pure k).nonempty_e _))
    (fun i => productAtom _ (.var i)) ⟨PUnit.unit⟩ (fun c => c.elim) (fun c => c.elim)
    canonicalFamily_isModel

theorem pure_closed : Signature.pure.Closed := fun c => c.elim

theorem singleIndividualData_complete : singleIndividualData.CompleteComponents :=
  SumData.completeComponents_ofDistinguished _ _ pure_closed (canonicalFamily_complete pure_closed)

theorem singleIndividualData_distinguished : singleIndividualData.DistinguishedArrows :=
  SumData.distinguishedArrows_ofDistinguished _ _

theorem singleIndividualData_free : singleIndividualData.FreeRootComponent :=
  SumData.freeRootComponent_ofDistinguished _ _

theorem singleIndividualData_fullest : singleIndividualData.FullestDomains :=
  SumData.fullestDomains_ofDistinguished _ _

theorem singleIndividualData_isolated : singleIndividualData.model.ActualWorldIsolated :=
  SumData.actualWorldIsolated_of singleIndividualData_free fun _ => rfl

/-- With one root individual the second instance of the Infinity schema at `e` fails at the root
(`Premodel.holds_count`). -/
theorem singleIndividualData_not_infinityE :
    ¬ singleIndividualData.model.HoldsAx (AxiomSet.pureVersion AxiomSet.infinityE) := by
  intro H
  rw [Premodel.holdsAx_ofPure] at H
  obtain ⟨f, hf⟩ := (Premodel.holds_count (singleIndividualData.model.reduct_isModel
    singleIndividualData.isModel) (𝟙 _) .e 2).1 (H _ ⟨2, by decide, rfl⟩)
  have : Subsingleton (singleIndividualData.model.reduct.Dom singleIndividualData.model.reduct.W₀ .e) :=
    inferInstanceAs (Subsingleton PUnit)
  exact absurd (hf (Subsingleton.elim (f 0) (f 1))) (by decide)

/-! #### Root individuals indexed by constants -/

/-- The signature with individual constants `cₙ`, `n : ℕ` (`some n`), and one constant of type
`t` (`none`). -/
abbrev constantSig : Signature := ⟨Option ℕ, fun | none => .rel .t | some _ => .e⟩

instance : Countable constantSig.Const := inferInstanceAs (Countable (Option ℕ))

theorem constantSig_closed : constantSig.Closed := fun
  | none => (by decide : Ty.Closed (.rel .t))
  | some _ => (by decide : Ty.Closed .e)

theorem constantSig_admitted : constantSig.Admitted := ⟨constantSig_closed, none, by decide⟩

/-- The root individuals of the constant-indexed root: the indices of the individual constants,
`cₙ` carried by the distinguished arrow to its value in each component. -/
noncomputable abbrev constantAtom : AtomAction (baseArrows (canonicalFamily constantSig)) (canonicalFamily constantSig) .e :=
  pointAtom _ .e ℕ fun k n => (canonicalFamily constantSig k).I (some n)

/-- The root values of the constants: `cₙ` denotes `n`; the constant of type `t` the union of the
components' values. -/
noncomputable def constantConst :
    ∀ c : constantSig.Const, (fullAction constantAtom (fun i => productAtom _ (.var i))).D (constantSig.typeOf c)
  | none => unionConst constantAtom (fun i => productAtom _ (.var i))
      (ρ := .t) fun k => (canonicalFamily constantSig k).I none
  | some n => (n : ℕ)

theorem constantConst_transports :
    TransportsConstants (fullAction constantAtom (fun i => productAtom _ (.var i))) constantConst
  | none, k => tr_unionConst _ _ (ρ := .t) _ k
  | some n, k => by
    show ((canonicalFamily constantSig k).inner .e).map (𝟙 _) ((canonicalFamily constantSig k).I (some n)) = _
    rw [CategoryTheory.Functor.map_id]; rfl

/-- The constant-indexed root as group data. -/
noncomputable abbrev constantIndexedData : SumData :=
  SumData.ofDistinguished (canonicalFamily constantSig) constantAtom (fun i => productAtom _ (.var i))
    ⟨(0 : ℕ)⟩ constantConst constantConst_transports canonicalFamily_isModel

theorem constantIndexedData_complete : constantIndexedData.CompleteComponents :=
  SumData.completeComponents_ofDistinguished _ _ constantSig_closed (canonicalFamily_complete constantSig_closed)

theorem constantIndexedData_distinguished : constantIndexedData.DistinguishedArrows :=
  SumData.distinguishedArrows_ofDistinguished _ _

theorem constantIndexedData_free : constantIndexedData.FreeRootComponent :=
  SumData.freeRootComponent_ofDistinguished _ _

theorem constantIndexedData_fullest : constantIndexedData.FullestDomains :=
  SumData.fullestDomains_ofDistinguished _ _

theorem constantIndexedData_isolated : constantIndexedData.model.ActualWorldIsolated :=
  SumData.actualWorldIsolated_of constantIndexedData_free fun _ => rfl

/-- The root individuals of the constant-indexed root are infinitely many: they are the natural
numbers, the indices of the individual constants. -/
theorem constantIndexedData_infinite : Infinite (constantIndexedData.RA.D .e) :=
  inferInstanceAs (Infinite ℕ)

end Classicism.Meta.Coalesced
