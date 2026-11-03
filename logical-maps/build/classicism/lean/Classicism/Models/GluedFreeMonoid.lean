import Classicism.Semantics.Glued
import Classicism.Certified.Signatures
import Classicism.Semantics.Arrows
import Classicism.Semantics.FullModels
import Classicism.Semantics.Numerals
import Classicism.Semantics.Interpretations
import Classicism.Models.Conditions
import Classicism.Models.FullActionModels
import Mathlib.Data.Stream.Init
import Mathlib.Tactic.CasesM

/-!
# The map's group `glued-free-monoid` in Lean

Bacon's models of Logical Necessity (*Logical Combinatorialism*, Appendix A.2–A.3): full
action models in which the constants of `Σ` are glued at free sites (`Semantics/Glued.lean`).
The group's Lean parameter is `GluedData`: a category with a base object, an action for the
individuals, sites at the base, a signature, and the values of its constants at each site; its
model is the glued premodel (`GluedData.model`), a full model, so the group meets
`full-model`, `full-action-model` and `extensionally-full` for every member.

The members, each at the signature `Σ = {c : t}` (`Signature.sigmaTop`), the map's statements
being about one model of an admitted signature:

* `freeMonoidThread` (`full-free-monoid-glued-constants`): the one-object category of the free
  monoid on generators indexed by the sentences of `Σ` (`FreeObj`), its arrows the words, with
  the thread individuals, the functions from infinite sequences of generators to `ℕ`
  (`threadDe`), and the constants glued by sentences (`Premodel.bySentences`): at the site of
  a sentence, the values of a full model over the frame in which it is true, as in the
  record's construction (Bacon's Theorem A.8 and Definition 18.15, the coalesced sum of
  copies of the frame, whose root is the base and whose components sit after the generators).
  The record indexes the generators by `ℕ` through an enumeration of the sentences; here the
  sentences index them directly, which gives an isomorphic frame for a countable signature.
* `freeMonoidSingleton` (`full-free-monoid-glued-constants-singleton`): the same with one
  individual.
* `doubleRetractionSites` (`full-double-retraction-glued-constants`): the two-object retract
  with two retractions with the free monoid of sites adjoined at `W₀` (`DSObj`), one
  individual, the constants glued by formulas (`Premodel.byFormulas`).

The fourth member, `full-free-product-glued-constants`, is not yet built: its monoid is a free
product of four monoids, whose normal forms the verdicts need.

**Verdicts proved here**, the members' own arguments: Logical Necessity in the free-monoid
members (`Premodel.holdsAx_logicalNecessity`); BF in both (every arrow is epic and onto the
individuals); the Axiom of Infinity at `e` with the thread individuals; and in the
double-retraction member Witnessed Possibility (`Premodel.holdsAx_witnessedPossibility`), B for
pure sentences (every object reaches the base) and the failure of Possibly Witnessed
Possibility (Strong Actuality holds exactly at the worlds into `W₁`, where no constant of type
`t` is the true atom, every arrow into `W₁` factoring through `h`).
-/

namespace Classicism.Meta.Intensional

open CategoryTheory

/-! ### The group's parameter -/

/-- **The data of a glued model**: the group `glued-free-monoid`'s parameter. -/
structure GluedData : Type 1 where
  /-- The category. -/
  C : Type
  [cat : SmallCategory C]
  /-- The base object. -/
  W₀ : C
  /-- The individuals. -/
  De : C ⥤ Type
  /-- There are individuals everywhere. -/
  ne : ∀ W : C, Nonempty (De.obj W)
  /-- The index of the sites. -/
  G : Type
  /-- The sites at the base. -/
  S : Sites De W₀ G
  /-- The signature. -/
  Sig : Signature
  /-- The values of the constants at each site. -/
  w : G → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj W₀

attribute [instance] GluedData.cat

namespace GluedData

variable (D : GluedData)

/-- The glued model. -/
noncomputable abbrev model : Premodel D.Sig D.C := Premodel.glued D.De D.W₀ D.ne D.S D.w

theorem isModel : D.model.IsModel := Premodel.glued_isModel D.S D.w

theorem full : D.model.Full := Premodel.glued_full D.S D.w

end GluedData

/-! ### The free monoid, as a one-object category -/

/-- The one object of the free monoid on `G`. -/
inductive FreeObj (G : Type)
  | star

instance (G : Type) : Subsingleton (FreeObj G) := ⟨fun | .star, .star => rfl⟩

/-- The free monoid on `G` as a category: its arrows are the words, `f ≫ g` the word `f` then
`g`. -/
instance (G : Type) : SmallCategory (FreeObj G) where
  Hom _ _ := List G
  id _ := []
  comp f g := f ++ g
  id_comp := List.nil_append
  comp_id := List.append_nil
  assoc := List.append_assoc

namespace FreeObj

variable {G : Type}

/-- An arrow as the word it is. -/
abbrev word {X Y : FreeObj G} (f : X ⟶ Y) : List G := f

theorem comp_word {X Y Z : FreeObj G} (f : X ⟶ Y) (g : Y ⟶ Z) : word (f ≫ g) = word f ++ word g := rfl

theorem id_word (X : FreeObj G) : word (𝟙 X) = [] := rfl

/-- The generator `k`, a one-letter word. -/
abbrev gen (k : G) : FreeObj.star ⟶ (FreeObj.star : FreeObj G) := ([k] : List G)

/-- The thread individuals: the functions from infinite sequences of generators to `ℕ`, a word
acting by putting itself before the sequence. -/
abbrev threadDe (G : Type) : FreeObj G ⥤ Type where
  obj _ := Stream' G → ℕ
  map f := TypeCat.ofHom fun a s => a (word f ++ₛ s)
  map_id _ := by
    ext a s
    simp [id_word]
  map_comp f g := by
    ext a s
    simp [comp_word, Stream'.append_append_stream]

/-- One individual. -/
abbrev unitDe (G : Type) : FreeObj G ⥤ Type := FullActionModels.unitDe (FreeObj G)

/-- The generators are sites, for any action whose individuals glue along them. -/
def sites (De : FreeObj G ⥤ Type)
    (glue_e : ∀ x : G → De.obj .star, ∃ y, ∀ k, De.map (gen k) y = x k) : Sites De .star G where
  s := gen
  sep {V} k k' u u' e := by
    obtain rfl : V = .star := Subsingleton.elim _ _
    have e : k :: word u = k' :: word u' := e
    exact ⟨(List.cons.inj e).1, (List.cons.inj e).2⟩
  glue_e := glue_e

/-- The thread individuals glue: the individual taking at a sequence beginning with `k` the
value of the `k`-th at the rest. -/
theorem thread_glue (x : G → Stream' G → ℕ) :
    ∃ y : Stream' G → ℕ, ∀ k, (threadDe G).map (gen k) y = x k :=
  ⟨fun s => x s.head s.tail, fun k => funext fun s => by
    show x (([k] ++ₛ s).head) (([k] ++ₛ s).tail) = x k s
    rw [Stream'.cons_append_stream, Stream'.nil_append_stream, Stream'.head_cons,
      Stream'.tail_cons]⟩

theorem unit_glue (x : G → Unit) : ∃ y : Unit, ∀ k, (unitDe G).map (gen k) y = x k :=
  ⟨(), fun _ => rfl⟩

/-! #### The conditions the free-monoid members meet -/

variable {Sig : Signature} {De : FreeObj G ⥤ Type} {ne : ∀ W, Nonempty (De.obj W)}
  {S : Sites De .star G} {w : G → ∀ c : Sig.Const, (FullT De (Sig.typeOf c)).obj .star}

local notation "A" => Premodel.glued De FreeObj.star ne S w

/-- An arrow with a retraction is the identity: a word is undone by no word. -/
theorem eq_id_of_comp {f g : (FreeObj.star : FreeObj G) ⟶ .star} (e : f ≫ g = 𝟙 _) : f = 𝟙 _ :=
  List.append_eq_nil_iff.1 e |>.1

theorem oneObject : (A).OneObject := inferInstance

/-- A generator has no retraction. -/
theorem unretracted (k : G) : (A).UnretractedArrow :=
  ⟨.star, gen k, fun _ e => List.cons_ne_nil k [] (eq_id_of_comp e)⟩

/-- Infinitely many propositions: the singletons of the words in one generator. -/
theorem infinitely_many_propositions (k : G) : (A).InfinitelyManyPropositions := by
  change Infinite (Set (Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)))
  have : Infinite (Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)) :=
    Infinite.of_injective (fun n : ℕ => (⟨.star, PUnit.unit, List.replicate n k⟩ :
      Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V))) fun _ _ e => by
        obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp e
        have := congrArg List.length (Prod.mk.inj (eq_of_heq hh)).2
        simpa using this
  exact Infinite.of_injective (fun x => ({x} : Set _)) Set.singleton_injective

/-- The actual world is isolated: no word after a non-empty word is empty. -/
theorem actual_world_isolated : (A).ActualWorldIsolated := by
  obtain ⟨a, ha⟩ := Premodel.glued_full (ne := ne) S w .t .star
    ({⟨.star, PUnit.unit, 𝟙 _⟩} : Set (Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)))
  refine ⟨a, ?_, fun p hp => ?_, fun {V U} i j hi => ?_⟩
  · change (⟨.star, PUnit.unit, 𝟙 _⟩ : Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)) ∈
      (A).incl .t .star a
    rw [ha]; rfl
  · change (A).incl .t .star a ⊆ (A).incl .t .star p
    rw [ha]
    intro t ht
    rw [Set.mem_singleton_iff.1 ht]
    exact hp
  · obtain rfl : V = .star := Subsingleton.elim _ _
    obtain rfl : U = .star := Subsingleton.elim _ _
    change (⟨.star, PUnit.unit, i⟩ : Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)) ∉
      (A).incl .t .star a at hi
    change (⟨.star, PUnit.unit, i ≫ j⟩ : Σ V : FreeObj G, PUnit × ((FreeObj.star : FreeObj G) ⟶ V)) ∉
      (A).incl .t .star a
    rw [ha] at hi ⊢
    intro h
    obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp (Set.mem_singleton_iff.1 h)
    exact hi (by rw [eq_id_of_comp (Prod.mk.inj (eq_of_heq hh)).2]; rfl)

/-- Every arrow is an epimorphism: words cancel on the right. -/
instance epi {X Y : FreeObj G} (f : X ⟶ Y) : Epi f :=
  ⟨fun {_} _ _ e => List.append_cancel_left (as := word f) e⟩

/-- Every arrow is epic and onto the individuals, given that every arrow acts onto them. -/
theorem epicArrows (hs : ∀ {X Y : FreeObj G} (f : X ⟶ Y), Function.Surjective (De.map f)) :
    (A).EpicArrows := fun _ k => ⟨inferInstance, hs k⟩

/-- A word acts onto the thread individuals: forget the word's length of the sequence. -/
theorem thread_surjective {X Y : FreeObj G} (f : X ⟶ Y) : Function.Surjective ((threadDe G).map f) :=
  fun b => ⟨fun s => b (s.drop (word f).length), funext fun s => by
    show b ((word f ++ₛ s).drop (word f).length) = b s
    rw [Stream'.drop_append_stream]⟩

theorem unit_surjective {X Y : FreeObj G} (f : X ⟶ Y) : Function.Surjective ((unitDe G).map f) :=
  fun _ => ⟨(), rfl⟩

/-- **BF at every type**: every arrow is epic and acts onto the individuals. -/
theorem holdsAx_barcan (hs : ∀ {X Y : FreeObj G} (f : X ⟶ Y), Function.Surjective (De.map f)) :
    (A).HoldsAx P.Barcan.schemaIn := by
  have M : (A).IsModel := Premodel.glued_isModel S w
  rw [Premodel.holdsAx_ofPure]
  rintro _ ⟨σ, hσ, rfl⟩
  exact Premodel.holds_bf_of_epic ((A).reduct_isModel M) (Premodel.glued_full (ne := ne) S w)
    (epicArrows (S := S) (w := w) (ne := ne) hs) (𝟙 _) σ hσ

/-- The thread individuals are infinitely many: the constant ones. -/
theorem thread_infinite [Nonempty G] : Infinite (Stream' G → ℕ) :=
  Infinite.of_injective (fun n : ℕ => fun _ => n) fun _ _ e =>
    congrFun e (Stream'.const (Classical.arbitrary G))

end FreeObj

/-! ### The free-monoid members -/

/-- The generators of the free-monoid members: the sentences of `Σ = {c : t}`. -/
abbrev SentSig : Type := Sentence Signature.sigmaTop

instance : Nonempty SentSig := ⟨Term.top⟩

/-- **`full-free-monoid-glued-constants`**: the free monoid on the sentences of `Σ`, the thread
individuals, the constants glued by sentences. -/
noncomputable def freeMonoidThread : GluedData where
  C := FreeObj SentSig
  W₀ := .star
  De := FreeObj.threadDe SentSig
  ne _ := ⟨fun _ => 0⟩
  G := SentSig
  S := FreeObj.sites _ FreeObj.thread_glue
  Sig := Signature.sigmaTop
  w := Premodel.bySentences (FreeObj.threadDe SentSig) .star fun _ => ⟨fun _ => 0⟩

/-- **`full-free-monoid-glued-constants-singleton`**: the same with one individual. -/
noncomputable def freeMonoidSingleton : GluedData where
  C := FreeObj SentSig
  W₀ := .star
  De := FreeObj.unitDe SentSig
  ne _ := ⟨()⟩
  G := SentSig
  S := FreeObj.sites _ FreeObj.unit_glue
  Sig := Signature.sigmaTop
  w := Premodel.bySentences (FreeObj.unitDe SentSig) .star fun _ => ⟨()⟩

namespace FreeMonoidMembers

open FreeObj

theorem thread_oneObject : freeMonoidThread.model.OneObject := FreeObj.oneObject
theorem singleton_oneObject : freeMonoidSingleton.model.OneObject := FreeObj.oneObject

theorem thread_unretracted : freeMonoidThread.model.UnretractedArrow := FreeObj.unretracted Term.top
theorem singleton_unretracted : freeMonoidSingleton.model.UnretractedArrow := FreeObj.unretracted Term.top

theorem thread_infinitely_many_propositions : freeMonoidThread.model.InfinitelyManyPropositions :=
  FreeObj.infinitely_many_propositions Term.top
theorem singleton_infinitely_many_propositions :
    freeMonoidSingleton.model.InfinitelyManyPropositions :=
  FreeObj.infinitely_many_propositions Term.top

theorem thread_actual_world_isolated : freeMonoidThread.model.ActualWorldIsolated :=
  FreeObj.actual_world_isolated
theorem singleton_actual_world_isolated : freeMonoidSingleton.model.ActualWorldIsolated :=
  FreeObj.actual_world_isolated

theorem singleton_one_individual : freeMonoidSingleton.model.OneIndividual :=
  fun _ => inferInstanceAs (Subsingleton Unit)

/-- **Logical Necessity** (`full-free-monoid-glued-constants`): the values by sentences are
rich, and the frame has one object. -/
theorem thread_logicalNecessity :
    freeMonoidThread.model.HoldsAx (AxiomSet.logicalNecessity Signature.sigmaTop) :=
  Premodel.holdsAx_logicalNecessity (C := FreeObj SentSig) _ _ (Premodel.bySentences_rich _ _ _)

theorem singleton_logicalNecessity :
    freeMonoidSingleton.model.HoldsAx (AxiomSet.logicalNecessity Signature.sigmaTop) :=
  Premodel.holdsAx_logicalNecessity (C := FreeObj SentSig) _ _ (Premodel.bySentences_rich _ _ _)

theorem thread_barcan : freeMonoidThread.model.HoldsAx P.Barcan.schemaIn :=
  FreeObj.holdsAx_barcan FreeObj.thread_surjective

theorem singleton_barcan : freeMonoidSingleton.model.HoldsAx P.Barcan.schemaIn :=
  FreeObj.holdsAx_barcan FreeObj.unit_surjective

/-- **The Axiom of Infinity at `e`** with the thread individuals: they are infinitely many, and
the model is full (`Premodel.holds_axInf_of_infinite`). -/
theorem thread_axiomOfInfinityE : freeMonoidThread.model.HoldsAx P.AxiomOfInfinityE.schemaIn := by
  have M : freeMonoidThread.model.IsModel := freeMonoidThread.isModel
  have : Infinite (freeMonoidThread.model.reduct.Dom freeMonoidThread.model.reduct.W₀ .e) :=
    FreeObj.thread_infinite
  rw [Premodel.holdsAx_ofPure]
  rintro _ rfl
  exact Premodel.holds_axInf_of_infinite (freeMonoidThread.model.reduct_isModel M)
    (Premodel.Full.extFull _ freeMonoidThread.full) (𝟙 _) .e

end FreeMonoidMembers

/-! ### The double retraction with free sites -/

/-- The objects `W₀`, `W₁` of the two-object retract with two retractions and the free monoid
on `G` adjoined at `W₀`. -/
inductive DSObj (G : Type)
  | w0
  | w1
  deriving DecidableEq

/-- Its arrows, in normal form, written in the order they are applied: `W₀ → W₀` a word `u` of
generators; `W₀ → W₁` a word `u` then `h`; `W₁ → W₀` a retraction `j_b` then a word `u`, as
`(b, u)`; `W₁ → W₁` the identity (`none`), or `j_b`, a word `u`, then `h` (`some (b, u)`), the
idempotent `e_b = h ∘ j_b` when `u` is empty. (A reduced alternating word of the pushout has
at most one syllable of the free monoid: a syllable of the retract between two of the free
monoid would be a non-identity arrow `W₀ → W₀` of the retract, and there is none.) -/
@[reducible] def DSHom (G : Type) : DSObj G → DSObj G → Type
  | .w0, .w0 => List G
  | .w0, .w1 => List G
  | .w1, .w0 => Bool × List G
  | .w1, .w1 => Option (Bool × List G)

/-- Composition `f ≫ g`, first `f`, from the one relation `j_b ∘ h = 1`. -/
def DSHom.comp {G : Type} : ∀ {X Y Z : DSObj G}, DSHom G X Y → DSHom G Y Z → DSHom G X Z
  | .w0, .w0, .w0, u, v => (u ++ v : List G)
  | .w0, .w0, .w1, u, v => (u ++ v : List G)
  | .w0, .w1, .w0, u, (_, v) => (u ++ v : List G)
  | .w0, .w1, .w1, u, none => (u : List G)
  | .w0, .w1, .w1, u, some (_, v) => (u ++ v : List G)
  | .w1, .w0, .w0, (b, u), v => ((b, u ++ v) : Bool × List G)
  | .w1, .w0, .w1, (b, u), v => (some (b, u ++ v) : Option (Bool × List G))
  | .w1, .w1, .w0, none, g => g
  | .w1, .w1, .w0, some (b, u), (_, v) => ((b, u ++ v) : Bool × List G)
  | .w1, .w1, .w1, none, g => g
  | .w1, .w1, .w1, some (b, u), none => (some (b, u) : Option (Bool × List G))
  | .w1, .w1, .w1, some (b, u), some (_, v) => (some (b, u ++ v) : Option (Bool × List G))

/-- The identities. -/
def DSHom.id {G : Type} : ∀ X : DSObj G, DSHom G X X
  | .w0 => ([] : List G)
  | .w1 => (none : Option (Bool × List G))

instance (G : Type) : SmallCategory (DSObj G) where
  Hom := DSHom G
  id := DSHom.id
  comp := DSHom.comp
  id_comp := by
    intro X Y
    cases X <;> cases Y <;> intro f
    all_goals first
      | exact List.nil_append _
      | (rcases (f : Bool × List G) with ⟨b, u⟩; rfl)
      | rfl
  comp_id := by
    intro X Y
    cases X <;> cases Y <;> intro f
    all_goals first
      | exact List.append_nil _
      | (rcases (f : Bool × List G) with ⟨b, u⟩; exact congrArg (Prod.mk b) (List.append_nil u))
      | (rcases (f : Option (Bool × List G)) with _ | ⟨b, u⟩ <;> rfl)
      | rfl
  assoc := by
    intro W X Y Z
    cases W <;> cases X <;> cases Y <;> cases Z <;> intro f g k <;>
      (try simp only [DSHom] at f g k) <;> (try cases_type* Option Prod) <;>
      first
        | rfl
        | (show _ ++ _ = _ ++ _; exact List.append_assoc _ _ _)
        | (show (_, _) = (_, _); exact congrArg _ (List.append_assoc _ _ _))
        | (show some _ = some _; exact congrArg (fun u => some (_, u)) (List.append_assoc _ _ _))

namespace DSObj

variable {G : Type}

/-- `h : W₀ → W₁`. -/
def h : (DSObj.w0 : DSObj G) ⟶ .w1 := ([] : List G)
/-- The retraction `j_b : W₁ → W₀`. -/
def j (b : Bool) : (DSObj.w1 : DSObj G) ⟶ .w0 := ((b, []) : Bool × List G)
/-- The idempotent `e_b = h ∘ j_b`. -/
def e (b : Bool) : (DSObj.w1 : DSObj G) ⟶ .w1 := (some (b, []) : Option (Bool × List G))
/-- The generator `k` at `W₀`, a site. -/
def gen (k : G) : (DSObj.w0 : DSObj G) ⟶ .w0 := ([k] : List G)

theorem h_j (b : Bool) : h ≫ j b = 𝟙 (DSObj.w0 : DSObj G) := rfl
theorem h_e (b : Bool) : h ≫ e b = (h : (DSObj.w0 : DSObj G) ⟶ .w1) := rfl
theorem j_ne : j false ≠ (j true : (DSObj.w1 : DSObj G) ⟶ .w0) := fun e =>
  Bool.false_ne_true (congrArg Prod.fst (show ((false, []) : Bool × List G) = (true, []) from e))
theorem e_ne_id (b : Bool) : e b ≠ 𝟙 (DSObj.w1 : DSObj G) := fun e' => by
  have : (some (b, []) : Option (Bool × List G)) = none := e'
  exact Option.some_ne_none _ this

/-- Every arrow `W₀ → W₁` is a word then `h`, and is fixed by the idempotents after it. -/
theorem comp_e (u : (DSObj.w0 : DSObj G) ⟶ .w1) (b : Bool) : u ≫ e b = u :=
  List.append_nil (u : List G)

/-- No arrow out of `W₁` other than its identity has a retraction. -/
theorem retraction_w1 {U : DSObj G} (k : (DSObj.w1 : DSObj G) ⟶ U) (r : U ⟶ .w1)
    (hr : k ≫ r = 𝟙 _) : U = .w1 ∧ HEq k (𝟙 (DSObj.w1 : DSObj G)) ∧ HEq r (𝟙 (DSObj.w1 : DSObj G)) := by
  cases U with
  | w0 =>
    rcases (k : Bool × List G) with ⟨b, u⟩
    exact absurd (show (some (b, u ++ (r : List G)) : Option (Bool × List G)) = none from hr)
      (Option.some_ne_none _)
  | w1 =>
    rcases hk : (k : Option (Bool × List G)) with _ | ⟨b, u⟩
    · have hk' : k = 𝟙 _ := hk
      subst hk'
      exact ⟨rfl, HEq.rfl, heq_of_eq ((Category.id_comp r).symm.trans hr)⟩
    · have hk' : k = (some (b, u) : Option (Bool × List G)) := hk
      subst hk'
      rcases hr' : (r : Option (Bool × List G)) with _ | ⟨c, v⟩
      · have : r = 𝟙 _ := hr'
        subst this
        exact absurd (show (some (b, u) : Option (Bool × List G)) = none from hr) (Option.some_ne_none _)
      · have : r = (some (c, v) : Option (Bool × List G)) := hr'
        subst this
        exact absurd (show (some (b, u ++ v) : Option (Bool × List G)) = none from hr) (Option.some_ne_none _)

/-- The generators are sites at `W₀`, with one individual. -/
def sites : Sites (FullActionModels.unitDe (DSObj G)) .w0 G where
  s := gen
  sep {V} k k' u u' e := by
    cases V with
    | w0 =>
      have e : k :: (u : List G) = k' :: (u' : List G) := e
      exact ⟨(List.cons.inj e).1, (List.cons.inj e).2⟩
    | w1 =>
      have e : k :: (u : List G) = k' :: (u' : List G) := e
      exact ⟨(List.cons.inj e).1, (List.cons.inj e).2⟩
  glue_e _ := ⟨(), fun _ => rfl⟩

end DSObj

/-- The sites' index of the double-retraction member: lists of constants of `Σ = {c : t}` with
pure formulas. -/
abbrev DRS : Type := Premodel.Datum Signature.sigmaTop

/-- The glued model of `full-double-retraction-glued-constants`. -/
noncomputable abbrev drModel : Premodel Signature.sigmaTop (DSObj DRS) :=
  Premodel.glued (FullActionModels.unitDe (DSObj DRS)) DSObj.w0 (fun _ => ⟨()⟩) DSObj.sites
    (Premodel.byFormulas (FullActionModels.unitDe (DSObj DRS)) DSObj.w0 fun _ => ⟨()⟩)

/-- **`full-double-retraction-glued-constants`**: the double retraction with the free monoid of
sites adjoined at `W₀`, one individual, the constants glued by formulas. -/
noncomputable def doubleRetractionSites : GluedData where
  C := DSObj DRS
  W₀ := .w0
  De := FullActionModels.unitDe _
  ne _ := ⟨()⟩
  G := DRS
  S := DSObj.sites
  Sig := Signature.sigmaTop
  w := Premodel.byFormulas (FullActionModels.unitDe (DSObj DRS)) DSObj.w0 fun _ => ⟨()⟩

namespace DoubleRetractionSites

open DSObj

/-- The sites' index is nonempty: the empty list with `⊤`. -/
def datum₀ : DRS := ⟨[], Term.top⟩

local notation "A" => drModel

theorem isModel : (A).IsModel := Premodel.glued_isModel _ _

theorem full : (A).Full := Premodel.glued_full _ _

theorem one_individual : (A).OneIndividual := fun _ => (inferInstance : Subsingleton Unit)

theorem identity_singletons : (A).IdentitySingletons := Premodel.Full.identitySingletons _ full

theorem nonidentity : (A).NonidentityArrow :=
  ⟨.w1, DSObj.h, fun e => by cases congrArg Sigma.fst e⟩

theorem nonepic : (A).NonepicArrow :=
  ⟨.w1, .w1, DSObj.h, 𝟙 _, DSObj.e false, (DSObj.e_ne_id false).symm, rfl⟩

theorem returning : (A).ReturningArrow :=
  ⟨.w1, DSObj.h, DSObj.j false, rfl, fun e => by cases congrArg Sigma.fst e⟩

theorem separated : (A).SeparatedRetractions :=
  Premodel.Full.separatedRetractions _ full DSObj.h (DSObj.j false) (DSObj.j true) rfl rfl DSObj.j_ne

theorem unretracted : (A).UnretractedArrow :=
  ⟨.w0, gen datum₀, fun m e => List.cons_ne_nil datum₀ (m : List _) e⟩

theorem infinitely_many_propositions : (A).InfinitelyManyPropositions := by
  change Infinite (Set (Σ V : DSObj DRS, PUnit × ((DSObj.w0 : DSObj DRS) ⟶ V)))
  have : Infinite (Σ V : DSObj DRS, PUnit × ((DSObj.w0 : DSObj DRS) ⟶ V)) :=
    Infinite.of_injective (fun n : ℕ => (⟨.w0, PUnit.unit, (List.replicate n datum₀ : List _)⟩ :
      Σ V : DSObj DRS, PUnit × ((DSObj.w0 : DSObj DRS) ⟶ V))) fun _ _ e => by
        obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp e
        have := congrArg List.length (show (List.replicate _ datum₀ : List _) = List.replicate _ datum₀ from
          (Prod.mk.inj (eq_of_heq hh)).2)
        simpa using this
  exact Infinite.of_injective (fun x => ({x} : Set _)) Set.singleton_injective

/-- **Witnessed Possibility**: the values by formulas are rich. -/
theorem witnessedPossibility :
    (A).HoldsAx (AxiomSet.witnessedPossibility Signature.sigmaTop) :=
  Premodel.holdsAx_witnessedPossibility _ _ (Premodel.byFormulas_rich _ _ _)

/-- **B for pure sentences**: every object reaches the base, `W₁` by `j_b`; a pure sentence
true at the base holds at every world into the base. -/
theorem pureB : (A).HoldsAx (AxiomSet.pureVersion AxiomSet.signatureB) := by
  have MR : (A).reduct.IsModel := (A).reduct_isModel isModel
  rw [AxiomSet.pureVersion, Premodel.holdsAx_ofPure]
  rintro _ ⟨-, p, rfl⟩
  rw [Premodel.HoldsSentence, (A).reduct.holds_imp MR, (A).reduct.holds_box MR]
  intro H V k
  rw [(A).reduct.holds_dia MR]
  have back : ∀ V : DSObj DRS, V ⟶ DSObj.w0 := fun
    | .w0 => 𝟙 _
    | .w1 => DSObj.j false
  refine ⟨_, back V, ?_⟩
  rw [IEnv.nil_eq ((A).reduct.push (back V) ((A).reduct.push k IEnv.nil))]
  exact ((A).reduct_holds_congr _ _ p .nil).1 H

/-! #### Possibly Witnessed Possibility fails -/

/-- `P(x)`: Strong Actuality holds and `x` is a true atom, `x ∧ ∀q. □(x → q) ∨ □(x → ¬q)`. -/
noncomputable def trueAtomSA : Formula Signature.pure (Ctx.block [Ty.t] []) :=
  Term.conj (P.StrongActuality.quoted.weaken (τ := Ty.t))
    (Term.conj (.var .zero)
      (Term.forall' (Term.disj (Term.box (Term.imp (.var (.succ .zero)) (.var .zero)))
        (Term.box (Term.imp (.var (.succ .zero)) (Term.neg (.var .zero)))))))

/-- The reading of `P(x)` at a world. -/
theorem holds_trueAtomSA {V : DSObj DRS} (u : (A).reduct.W₀ ⟶ V) (x : (A).reduct.Dom V (.rel .t)) :
    (A).reduct.Holds u trueAtomSA (.cons x .nil) ↔
      (A).reduct.Holds u P.StrongActuality.quoted .nil ∧
        (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple (A).inner .t V) ∈ (A).incl .t V x ∧
        ∀ q : (A).reduct.Dom V (.rel .t),
          (∀ {U : DSObj DRS} (m : V ⟶ U), (⟨U, PUnit.unit, m⟩ : Tuple (A).inner .t V) ∈ (A).incl .t V x →
            (⟨U, PUnit.unit, m⟩ : Tuple (A).inner .t V) ∈ (A).incl .t V q) ∨
          (∀ {U : DSObj DRS} (m : V ⟶ U), (⟨U, PUnit.unit, m⟩ : Tuple (A).inner .t V) ∈ (A).incl .t V x →
            (⟨U, PUnit.unit, m⟩ : Tuple (A).inner .t V) ∉ (A).incl .t V q) := by
  have MR : (A).reduct.IsModel := (A).reduct_isModel isModel
  simp only [trueAtomSA, (A).reduct.holds_conj MR, (A).reduct.holds_weaken, Premodel.holds_var,
    (A).reduct.holds_forall MR, (A).reduct.holds_disj MR, (A).reduct.holds_box MR,
    (A).reduct.holds_neg MR, IEnv.get, Premodel.push, IEnv.map,
    (A).reduct.incl_map, Intension.mem_map, Category.comp_id, imp_iff_not_or]
  rfl

/-- Strong Actuality holds at every world into `W₁`: the true atom there is the singleton of
its identity, and no arrow out of `W₁` but the identity has a retraction. -/
theorem sa_w1 (u : (A).reduct.W₀ ⟶ DSObj.w1) : (A).reduct.Holds u P.StrongActuality.quoted .nil := by
  have MR : (A).reduct.IsModel := (A).reduct_isModel isModel
  obtain ⟨x, hx⟩ := full .t .w1 {(⟨.w1, PUnit.unit, 𝟙 _⟩ : Tuple (A).inner .t .w1)}
  refine Premodel.holds_strongActuality_at MR u x hx fun {U} k r r' e e' => ?_
  obtain ⟨rfl, -, hr⟩ := DSObj.retraction_w1 k r e
  obtain ⟨-, -, hr'⟩ := DSObj.retraction_w1 k r' e'
  exact eq_of_heq (hr.trans hr'.symm)

/-- Strong Actuality fails at every world into `W₀`: it fails at the base, where `h` has two
separated retractions, and a pure sentence's truth depends only on the world's target. -/
theorem sa_w0 (u : (A).reduct.W₀ ⟶ DSObj.w0) : ¬ (A).reduct.Holds u P.StrongActuality.quoted .nil := by
  have MR : (A).reduct.IsModel := (A).reduct_isModel isModel
  exact fun H => Premodel.not_holds_strongActuality_of_separated MR separated
    (((A).reduct_holds_congr u (𝟙 _) _ _).1 H)

/-- At the world `h`, the singleton of the identity of `W₁` is a true atom, and Strong
Actuality holds. -/
theorem trueAtomSA_at_h : ∃ x, (A).reduct.Holds DSObj.h trueAtomSA (.cons x .nil) := by
  obtain ⟨x, hx⟩ := full .t .w1 {(⟨.w1, PUnit.unit, 𝟙 _⟩ : Tuple (A).inner .t .w1)}
  refine ⟨x, (holds_trueAtomSA _ x).2 ⟨sa_w1 _, by rw [hx]; rfl, fun q => ?_⟩⟩
  by_cases hq : (⟨.w1, PUnit.unit, 𝟙 _⟩ : Tuple (A).inner .t .w1) ∈ (A).incl .t .w1 q
  · refine Or.inl fun {U} m hm => ?_
    rw [hx, Set.mem_singleton_iff] at hm
    exact hm ▸ hq
  · refine Or.inr fun {U} m hm => ?_
    rw [hx, Set.mem_singleton_iff] at hm
    exact hm ▸ hq

/-- **No transport of a proposition at `W₀` is a true atom at a world where Strong Actuality
holds**: into `W₀` it fails, and into `W₁` the transport along `u` contains the identity iff it
contains `e_b`, since `u ∘ e_b = u`, so it is not the singleton of the identity. -/
theorem not_trueAtomSA {V : DSObj DRS} (u : (A).reduct.W₀ ⟶ V)
    (p : (A).reduct.Dom (A).reduct.W₀ (.rel .t)) :
    ¬ (A).reduct.Holds u trueAtomSA (.cons (((A).inner (.rel .t)).map u p) .nil) := by
  intro H
  obtain ⟨hsa, h1, hq⟩ := (holds_trueAtomSA u _).1 H
  cases V with
  | w0 => exact sa_w0 u hsa
  | w1 =>
    obtain ⟨q, hqd⟩ := full .t .w1 {(⟨.w1, PUnit.unit, 𝟙 _⟩ : Tuple (A).inner .t .w1)}
    change (⟨.w1, PUnit.unit, u⟩ : Tuple (A).inner .t (A).W₀) ∈ (A).incl .t (A).W₀ p at h1
    have he : (⟨.w1, PUnit.unit, DSObj.e false⟩ : Tuple (A).inner .t .w1) ∈
        (A).incl .t .w1 (((A).inner (.rel .t)).map u p) := by
      change (⟨.w1, PUnit.unit, ((show List DRS from u) ++ [] : List DRS)⟩ : Tuple (A).inner .t (A).W₀) ∈
        (A).incl .t (A).W₀ p
      rw [List.append_nil]
      exact h1
    rcases hq q with H | H
    · have := H (DSObj.e false) he
      rw [hqd, Set.mem_singleton_iff] at this
      obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp this
      exact DSObj.e_ne_id false (Prod.mk.inj (eq_of_heq hh)).2
    · exact H (𝟙 _) h1 (by rw [hqd]; rfl)

/-- **Possibly Witnessed Possibility fails**: `◇∃x. P(x)` holds, at the world `h`, but `P(c)`
holds at no world, the constant `c` of type `t` denoting there the transport of a proposition
at the base. -/
theorem not_possiblyWitnessedPossibility :
    ¬ (A).HoldsAx (AxiomSet.possiblyWitnessedPossibility Signature.sigmaTop) := by
  have M : (A).IsModel := isModel
  have MR : (A).reduct.IsModel := (A).reduct_isModel M
  intro H
  have inst := H (Term.imp (Term.dia (Term.ofPure (Term.existsBlock _ trueAtomSA)))
      (Term.dia (Term.atConsts [()] trueAtomSA)))
    ⟨by decide, [()], trueAtomSA, List.nodup_singleton _, rfl⟩
  rw [Premodel.HoldsSentence, (A).holds_imp M, (A).holds_dia M, (A).holds_dia M] at inst
  let hh : (A).W₀ ⟶ DSObj.w1 := DSObj.h
  have hex : (A).Holds (𝟙 (A).W₀ ≫ hh) (Term.ofPure (Term.existsBlock _ trueAtomSA))
      ((A).push hh IEnv.nil) := by
    rw [IEnv.nil_eq ((A).push hh IEnv.nil)]
    refine ((A).holds_ofPure _ _ _).2 (((A).reduct.holds_existsBlock_tuple MR _ _ _ _).2 ?_)
    obtain ⟨x, hx⟩ := trueAtomSA_at_h
    exact ⟨.cons x .nil, hx⟩
  obtain ⟨V, k, hk⟩ := inst ⟨_, hh, hex⟩
  rw [IEnv.nil_eq ((A).push k IEnv.nil)] at hk
  exact not_trueAtomSA _ _ (((A).holds_atConsts M _ _ _).1 hk)

end DoubleRetractionSites

end Classicism.Meta.Intensional
