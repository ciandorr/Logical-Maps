import Classicism.Tools.Schema
import Classicism.Certified.Schemas
import Classicism.Certified.Entailed
import Classicism.Results.Lists
import Classicism.Principles
import Classicism.Pointwise
import Classicism.Paper
import Classicism.Background.RigidityClosure

-- goals and hover print `fun y ↦ …`, matching the source
set_option pp.unicode.fun true

/-!
# Results at every arity

The map states comprehension, Boolean Completeness, Atomicity and their kin for relations
of every arity, `∀^Ty σ̄`, and several of the paper's proofs reason about an argument tuple
`x̄`: "BF, one argument at a time", "the persistent coextension `λȳ. w ≤ X[ȳ]`". Two kinds
of shallow proof reach every arity:

- **pointwise reasoning at a relational type**: a theorem at a Rel-parameter `τ`, its
  pointwise steps through the laws of `Pointwise`, which the translator derives for every
  object type by induction on the type. It is at every arity already;
- **a unary proof**, at `σ → t`, for a result that uses BF over the tuple: vectorized in
  `σ` (its list rule), it holds at `σs ⇒* t` for every list, which is every relational
  type (`schema_subset_args`). BF at `σ` in such a proof becomes BF over the list, which
  BF gives (`P.Barcan.schema_entails_listSchema`); in `C5`, `□`BF at `σ` comes from `□ND`
  at `t` inside the proof, and the vectorized result has no list premise at all.

The file has three parts:

1. **The shallow layer**: the shallow cores at `τ`, the unary ones at `σ → t`, and the
   boxed step of Atomicity.
2. **Certification.** The certification command makes each a rule between schema
   instances, and, with a Ty-parameter, a list rule; the entailment command an entailment
   between schemas, and a list entailment.
3. **The metalogic**: the compositions of certified entailments, among them the ones in
   `Certified/Entailed.lean`, into the map's arrows. Each theorem here named by a map id
   is that record, for every arity.
-/

namespace Classicism
open Paper

/-! ## 1. The shallow layer -/

section shallowCores
variable {τ : Type} [Rel τ] [Pointwise τ]

/-- `w` an actual world gives `q ↔ □(¬w ∨ q)` for every `q`. -/
theorem actual_iff (w : Prop) (hw : ActualWorld w) : ∀ q : Prop, q ↔ □ (¬ w ∨ q) := fun q =>
  ⟨fun hq => modal_K _ _ (nec% (not_or_of_imp w q)) ((le_iff_prop w q).1 (hw.2 q hq)),
   fun h => Or.elim (box_elim h) (fun hn => absurd hw.1 hn) (fun hq => hq)⟩

/-- With `w` the actual world, `λx̄. □(¬w ∨ X[x̄])`, that is `λx̄. w ≤ X[x̄]`, is a persistent
coextension of `X` (Classicism, n. 38). -/
theorem persistent_coext_of_actual (X : τ) (w : Prop) (hw : ActualWorld w) :
    Persistent (boxAt (Rel.or (Rel.neg (constP w)) X)) ∧
      X ≡ boxAt (Rel.or (Rel.neg (constP w)) X) :=
  ⟨nec% (boxAt_four (Rel.or (Rel.neg (constP w)) X)), coext_boxAt_actual X w (actual_iff w hw)⟩

/-- `actuality-implies-persistent-comprehension-r`, at every relational type. -/
theorem actuality_implies_persistent_comprehension_r :
    P.Actuality → P.PersistentComprehension τ := fun act X =>
  act.elim fun w (hw : ActualWorld w) => ⟨_, persistent_coext_of_actual X w hw⟩

/-- If every truth is necessary, every relation is weakly inextensible. -/
theorem weaklyInextensible_of_all (X : τ) : (∀ p : Prop, p → □ p) → WeaklyInextensible X :=
  fun h Z hZ => h _ (incl_trans X (boxAt Z) Z hZ (boxAt_T Z))

/-- `extensionality-r-implies-rigid-comprehension-r`, at every arity: under the Fregean
Axiom (the nullary instance) every truth is necessary, and necessarily so; so every
relation is persistent and inextensible, and is its own rigid coextension. -/
theorem extensionality_r_implies_rigid_comprehension_r :
    P.Extensionality Prop → P.RigidComprehension τ := fun extP X =>
  have fa := Proofs.extensionality_r_implies_fregean_axiom extP
  have hall : □ (∀ p : Prop, p → □ p) := Proofs.box_of_fregean fa _ (Proofs.box_of_fregean fa)
  ⟨X, ⟨modal_K _ _ (nec% (incl_boxAt_of_all X)) hall,
      modal_K _ _ (nec% (weaklyInextensible_of_all X)) hall⟩, Rel.coext_refl X⟩

/-- In `C5` the negation of a persistent relation is persistent: where `Y` fails, `B` and
the persistence of `Y` make it fail necessarily, at every world. -/
theorem persistent_neg_of_c5 (Y : τ) :
    P.NecNecessityOfDistinctness Prop → Persistent Y → Persistent (Rel.neg Y) := fun hnd hP =>
  modal_K _ _ (modal_K _ _ (nec% (neg_incl_boxAt_of_b Y)) (Proofs.box_b_of_box_nd_t hnd))
    (modal_K _ _ (nec% (top_boxAt_of_box Y (boxAt Y))) (modal_four _ hP))

/-- `c5-and-persistent-comprehension-imply-gallin`, at every arity. -/
theorem c5_and_persistent_comprehension_imply_gallin :
    P.NecNecessityOfDistinctness Prop → P.PersistentComprehension τ →
      P.GallinExtensionalComprehension τ := fun hnd pc X =>
  (pc X).elim fun Y hY => ⟨Y, hY.1, persistent_neg_of_c5 Y hnd hY.1, hY.2⟩

/-- Rigid Comprehension gives Gallin's, in `C5`. -/
theorem c5_rigid_gallin :
    P.NecNecessityOfDistinctness Prop → P.RigidComprehension τ →
      P.GallinExtensionalComprehension τ := fun hnd rc =>
  c5_and_persistent_comprehension_imply_gallin hnd fun X => (rc X).elim fun Y hY => ⟨Y, hY.1.1, hY.2⟩

/-- `c5-and-necessary-rigid-comprehension-imply-necessary-gallin-comprehension`, at every
arity: the last lemma necessitated, `□ND` boxed by `4`. -/
theorem c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension :
    P.NecNecessityOfDistinctness Prop → P.NecRigidComprehension τ →
      P.NecGallinExtensionalComprehension τ := fun hnd hrc =>
  modal_K _ _ (modal_K _ _ (nec% (c5_rigid_gallin (τ := τ))) (modal_four _ hnd)) hrc

/-- `necessary-actuality-implies-necessary-persistent-comprehension`. -/
theorem necessary_actuality_implies_necessary_persistent_comprehension :
    P.NecActuality → P.NecPersistentComprehension τ :=
  modal_K _ _ (nec% (actuality_implies_persistent_comprehension_r (τ := τ)))

/-- `c5-and-necessary-persistent-comprehension-imply-necessary-gallin`: the unboxed record
necessitated, `□ND` boxed by `4`. -/
theorem c5_and_necessary_persistent_comprehension_imply_necessary_gallin :
    P.NecNecessityOfDistinctness Prop → P.NecPersistentComprehension τ →
      P.NecGallinExtensionalComprehension τ := fun hnd hpc =>
  modal_K _ _ (modal_K _ _ (nec% (c5_and_persistent_comprehension_imply_gallin (τ := τ)))
    (modal_four _ hnd)) hpc

end shallowCores

section unary
variable {σ : Type} [Ty σ]

/-- With BF at `σ`, a property whose negation is weakly persistent is weakly inextensible:
where `Y` fails it fails necessarily, so `Y ⊆ □Z` gives `□(Y z → Z z)` at each `z`, and BF
boxes the quantifier. -/
theorem weaklyInextensible_of_neg_bf (Y : σ → Prop) :
    P.Barcan σ → WeaklyPersistent (¬ Y) → WeaklyInextensible Y := fun bf hn Z hZ =>
  bf (λ z ↦ Y z → Z z) fun z =>
    (em (Y z)).elim (fun hy => box_imp_of_box (Y z) (Z z) (hZ z hy))
      (fun hny => box_imp_of_box_not (Y z) (Z z) (hn z hny))

/-- Gallin Extensional Comprehension and BF give Weak Rigid Comprehension, at `σ → t`:
the Gallin-rigid coextension is persistent and, its negation being persistent, weakly
inextensible. -/
theorem gallin_bf_weak_rigid_comprehension :
    P.GallinExtensionalComprehension (σ → Prop) → P.Barcan σ →
      P.WeakRigidComprehension (σ → Prop) :=
  fun g bf X => (g X).elim fun Y hY =>
    ⟨Y, ⟨box_elim hY.1, weaklyInextensible_of_neg_bf Y bf (box_elim hY.2.1)⟩, hY.2.2⟩

/-- And in `C5`, Rigid Comprehension: the argument above under the box, with `□`BF at `σ`
from `□ND` at `t` (Proposition 2.3), the persistence of the negation being boxed
already. -/
theorem gallin_c5_rigid_comprehension :
    P.GallinExtensionalComprehension (σ → Prop) → P.NecNecessityOfDistinctness Prop →
      P.RigidComprehension (σ → Prop) :=
  fun g hnd X => (g X).elim fun Y hY =>
    ⟨Y, ⟨hY.1, modal_K _ _ (modal_K _ _ (nec% (weaklyInextensible_of_neg_bf Y))
      (Proofs.necessary_distinctness_necessary_r_implies_necessary_barcan_r hnd)) hY.2.1⟩,
     hY.2.2⟩

/-- Boxed Gallin Extensional Comprehension gives `□`Rigid Comprehension in `C5`, at
`σ → t`: the last lemma necessitated, `□ND` boxed by `4`. -/
theorem nec_gallin_c5_nec_rigid_comprehension :
    P.NecGallinExtensionalComprehension (σ → Prop) → P.NecNecessityOfDistinctness Prop →
      P.NecRigidComprehension (σ → Prop) := fun hg hnd =>
  modal_K _ _ (modal_K _ _ (nec% (gallin_c5_rigid_comprehension (σ := σ))) hg)
    (modal_four _ hnd)

/-! ### Rigid Rigidity and Weakly Rigid Weak Rigidity, with BF (10 October 2026) -/

/-- Every relation entails `λz. ⊤`. -/
theorem le_top_unary (F : σ → Prop) : F ≤ (fun _ : σ => True) :=
  le_of_box_incl (nec% (fun (z : σ) (_ : F z) => trivial))

/-- `barcan-and-weakly-rigid-power-imply-weakly-rigid-weak-rigidity`, at `σ → t`: the power
property of the weakly rigid `λz. ⊤` is weak rigidity itself. -/
theorem bf_wrp_weakly_rigid_weak_rigidity :
    P.Barcan σ → P.WeaklyRigidPower (σ → Prop) → P.WeaklyRigidWeakRigidity (σ → Prop) :=
  fun bf wrp =>
  have heq : (fun X : σ → Prop => WeaklyRigid X ∧ X ≤ (fun _ : σ => True)) =
      (fun X : σ → Prop => WeaklyRigid X) :=
    le_antisymm_rel _ _
      (le_of_box_incl (nec% (fun (X : σ → Prop) (h : WeaklyRigid X ∧ X ≤ (fun _ : σ => True)) =>
        h.1)))
      (le_of_box_incl (nec% (fun (X : σ → Prop) (h : WeaklyRigid X) =>
        (⟨h, le_top_unary X⟩ : WeaklyRigid X ∧ X ≤ (fun _ : σ => True)))))
  show WeaklyRigid (fun X : σ → Prop => WeaklyRigid X) from
    heq ▸ wrp _ (P.Barcan.to_universalWeaklyRigid bf)

/-- `rigid-rigidity-implies-necessary-barcan`, at `σ → t`: at every world, a property
necessary of everything is entailed by every rigid property, by the latter's weak
inextensibility; the weak inextensibility of rigidity carries this under the box, and every
individual has a rigid haecceity. -/
theorem rr_necessary_barcan : P.RigidRigidity (σ → Prop) → P.NecBarcan σ := fun h =>
  modal_K _ _
    (nec% (fun (wi : WeaklyInextensible (fun Z : σ → Prop => Rigid Z)) (X : σ → Prop)
        (hX : ∀ x : σ, □ (X x)) =>
      modal_K _ _
        (nec% (fun (hq : ∀ Z : σ → Prop, Rigid Z → ∀ y : σ, Z y → X y) (y : σ) =>
          hq (fun z : σ => z = y) (Rigidity.singleton_rigid y) y rfl))
        (wi (fun Z : σ → Prop => ∀ y : σ, Z y → X y)
          (fun (Z : σ → Prop) (hZ : Rigid Z) =>
            weaklyInextensible_of_inextensible hZ.2 X (fun y _ => hX y)))))
    h.2

/-- `necessary-barcan-and-rigid-power-imply-rigid-rigidity`, at `σ → t`: □BF makes `λz. ⊤`
rigid, and its rigid power property is rigidity itself. -/
theorem nbf_rp_rigid_rigidity :
    P.NecBarcan σ → P.RigidPower (σ → Prop) → P.RigidRigidity (σ → Prop) := fun nbf rp =>
  have htop : Rigid (fun _ : σ => True) :=
    ⟨nec% (fun (_ : σ) (_ : True) => box_true),
     modal_K _ _ (nec% (fun (bf : P.Barcan σ) => (P.Barcan.to_universalWeaklyRigid bf).2)) nbf⟩
  have heq : (fun X : σ → Prop => Rigid X ∧ X ≤ (fun _ : σ => True)) =
      (fun X : σ → Prop => Rigid X) :=
    le_antisymm_rel _ _
      (le_of_box_incl (nec% (fun (X : σ → Prop) (h : Rigid X ∧ X ≤ (fun _ : σ => True)) =>
        h.1)))
      (le_of_box_incl (nec% (fun (X : σ → Prop) (h : Rigid X) =>
        (⟨h, le_top_unary X⟩ : Rigid X ∧ X ≤ (fun _ : σ => True)))))
  show Rigid (fun X : σ → Prop => Rigid X) from heq ▸ rp _ htop

/-! ### ND, Strong Actuality and Gallin (11 October 2026) -/

/-- A possible `w` entailing `¬q` does not entail `q`. -/
theorem not_le_of_dia_le_neg (w q : Prop) (hd : ◇ w) (h : w ≤ ¬ q) : ¬ (w ≤ q) := fun h' =>
  hd (Eq.mp (box_not_eq w) (modal_K _ _ (modal_K _ _
    (nec% (fun (a : w → q) (b : w → ¬ q) (hw : w) => b hw (a hw)))
    ((le_iff_prop w q).1 h')) ((le_iff_prop w (¬ q)).1 h)))

/-- `nd-and-strong-actuality-imply-gallin-comprehension`, at `σ → t` (Cian Dorr): for `w`
witnessing Strong Actuality, `λz. w ≤ Xz` is coextensive with `X`, persistent by `4`, and has
a persistent negation by `B` (from ND at `t`) and the boxed decisions of `w`. -/
theorem nd_strong_actuality_gallin :
    P.NecessityOfDistinctness Prop → P.StrongActuality →
      P.GallinExtensionalComprehension (σ → Prop) := fun nd sa X =>
  sa.elim fun w hw =>
  have hb : □ (◇ w) :=
    Proofs.modal_five_implies_modal_b (Proofs.distinctness_necessary_t_implies_modal_five nd) w hw.1
  ⟨fun z => w ≤ X z,
   nec% (fun (z : σ) (h : w ≤ X z) => box_le_prop w (X z) h),
   modal_K _ _ (modal_K _ _
     (nec% (fun (hb : □ (◇ w)) (hd : ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q) (z : σ) (hn : ¬ (w ≤ X z)) =>
       (hd (X z)).elim (fun h => absurd h hn) fun h =>
         modal_K _ _ (modal_K _ _ (nec% (not_le_of_dia_le_neg w (X z))) hb)
           (box_le_prop w (¬ X z) h)))
     (modal_four _ hb)) hw.2,
   fun z => ⟨fun hx => (box_elim hw.2 (X z)).elim id
       fun h => absurd hx (imp_of_le_prop w (¬ X z) h hw.1),
     fun h => imp_of_le_prop w (X z) h hw.1⟩⟩

/-- `c5-and-necessary-strong-actuality-imply-necessary-gallin-comprehension`, at `σ → t`. -/
theorem c5_nec_strong_actuality_nec_gallin :
    P.NecNecessityOfDistinctness Prop → P.NecStrongActuality →
      P.NecGallinExtensionalComprehension (σ → Prop) := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% (nd_strong_actuality_gallin (σ := σ))) h₁) h₂

/-! ### □BF, □Atomicity and □Rigid Comprehension give □Rigid Power (11 October 2026)

The argument of the write-up of
`necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power`, at `σ → t`:
the weak inextensibility of the power property at one world from BF, Atomicity (type `t`)
and Rigid Comprehension there; then necessitated. Entailment at `t` is handled as the boxed
implication. -/

/-- An atom is possible. -/
theorem dia_of_atom {a : Prop} (ha : Atom a) : ◇ a := fun h =>
  not_le_neg_of_atom ha (le_neg_of_eq_false a h)

/-- An atom necessarily implying a falsehood is absurd. -/
theorem atom_absurd {a : Prop} (ha : Atom a) (h : □ (a → False)) : False :=
  dia_of_atom ha (Eq.mp (box_not_eq a) h)

/-- An atom compatible with `p` entails it. -/
theorem atom_le_of_dia_and {a : Prop} (ha : Atom a) (p : Prop) (hd : ◇ (a ∧ p)) : a ≤ p :=
  (atom_le_or_le_neg a p ha).elim id fun h => (hd (Eq.mp (box_not_eq _) (modal_K _ _
    (nec% (fun (f : a → ¬ p) (hap : a ∧ p) => f hap.1 hap.2)) ((le_iff_prop a (¬ p)).1 h)))).elim

/-- With BF, an atom entailing an existential entails an instance. -/
theorem atom_le_exists_of_bf {τ : Type} [Ty τ] (bf : P.Barcan τ) {a : Prop} (ha : Atom a)
    (Q : τ → Prop) (h : a ≤ ∃ x, Q x) : ∃ x, a ≤ Q x :=
  (em (∃ x, a ≤ Q x)).elim id fun hn => (atom_absurd ha (modal_K _ _ (modal_K _ _
    (nec% (fun (g : ∀ x, a → ¬ Q x) (f : a → ∃ x, Q x) (ha : a) =>
      (f ha).elim fun x hx => g x ha hx))
    (bf (fun x => a → ¬ Q x) fun x => (le_iff_prop a (¬ Q x)).1
      ((atom_le_or_le_neg a (Q x) ha).elim (fun h' => (hn ⟨x, h'⟩).elim) id)))
    ((le_iff_prop a _).1 h))).elim

/-- Below an atom a weakly rigid property has no new instances: an atom entailing `R z`
entails `z = z₁` for an actual instance `z₁`. -/
theorem atom_actual_instance {σ : Type} [Ty σ] {R : σ → Prop} (hR : WeaklyRigid R) {a : Prop}
    (ha : Atom a) (z : σ) (h : a ≤ R z) : ∃ z₁, R z₁ ∧ a ≤ (z = z₁) :=
  (em (∃ z₁, R z₁ ∧ a ≤ (z = z₁))).elim id fun hn => (atom_absurd ha (modal_K _ _ (modal_K _ _
    (nec% (fun (g : ∀ z₁ : σ, R z₁ → a → ¬ z = z₁) (f : a → R z) (ha : a) => g z (f ha) ha rfl))
    (hR.2 (fun z₁ => a → ¬ z = z₁) fun z₁ h₁ => (le_iff_prop a (¬ z = z₁)).1
      ((atom_le_or_le_neg a (z = z₁) ha).elim (fun h' => (hn ⟨z₁, h₁, h'⟩).elim) id)))
    ((le_iff_prop a _).1 h))).elim

/-- The power property is persistent, in C. -/
theorem rigid_power_property_persistent {τ : Type} [Rel τ] [Order τ] (F : τ) :
    Persistent (fun X : τ => Rigid X ∧ X ≤ F) :=
  nec% (fun (X : τ) (hX : Rigid X ∧ X ≤ F) =>
    Eq.mpr (box_and_eq (Rigid X) (X ≤ F)) ⟨rigid_necessary X hX.1, box_le_rel X F hX.2⟩)

/-- The core, at one world: BF at `σ` and at `σ → t`, Atomicity at `t` and Rigid
Comprehension at `σ → t` make the power property of a rigid `F` weakly inextensible. -/
theorem rigid_power_core (F : σ → Prop) (bf : P.Barcan σ) (bf₂ : P.Barcan (σ → Prop))
    (at_ : P.Atomicity Prop) (rc : P.RigidComprehension (σ → Prop)) (hF : Rigid F) :
    WeaklyInextensible (fun X : σ → Prop => Rigid X ∧ X ≤ F) := fun 𝒳 h =>
  (em (□ (∀ X : σ → Prop, (Rigid X ∧ X ≤ F) → 𝒳 X))).elim id fun hn =>
  (at_ (∃ X : σ → Prop, (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X)).elim
    (fun hq => (hn (modal_K _ _
      (nec% (fun (hq : ¬ ∃ X : σ → Prop, (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) (X : σ → Prop)
          (hP : Rigid X ∧ X ≤ F) => (em (𝒳 X)).elim id fun hx => (hq ⟨X, hP, hx⟩).elim))
      (Eq.mpr (box_not_eq _) (eq_false_of_le_neg _ hq)))).elim)
    fun ⟨a, ha, haq⟩ =>
  (atom_le_exists_of_bf bf₂ ha _ haq).elim fun X hX =>
  have hXb : □ (a → (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) := (le_iff_prop a _).1 hX
  (rc (fun z => F z ∧ ◇ (a ∧ X z))).elim fun X' ⟨hX', hco⟩ =>
  have hX'F : X' ≤ F := le_of_box_incl (weaklyInextensible_of_inextensible hX'.2 F
    fun z hz => weaklyPersistent_of_persistent hF.1 z ((hco z).2 hz).1)
  have h𝒳 : □ (𝒳 X') := h X' ⟨hX', hX'F⟩
  -- below `a`, X and X' agree at every argument
  have hpt : ∀ z : σ, □ (a → (X z ↔ X' z)) := fun z =>
    have hXF : □ (a → X z → F z) := modal_K _ _
      (nec% (fun (f : a → (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) (ha : a) (hx : X z) =>
        incl_of_le (f ha).1.2 z hx)) hXb
    (atom_le_or_le_neg a (X z) ha).elim
      (fun h₁ => (atom_le_or_le_neg a (X' z) ha).elim
        (fun h₂ => modal_K _ _ (modal_K _ _
          (nec% (fun (f : a → X z) (g : a → X' z) (ha : a) => (⟨fun _ => g ha, fun _ => f ha⟩ :
            X z ↔ X' z))) ((le_iff_prop a _).1 h₁)) ((le_iff_prop a _).1 h₂))
        (fun h₂ =>
          -- a ≤ X z and a ≤ ¬X' z: impossible
          have haF : a ≤ F z := (le_iff_prop a _).2 (modal_K _ _ (modal_K _ _
            (nec% (fun (f : a → X z → F z) (g : a → X z) (ha : a) => f ha (g ha))) hXF)
            ((le_iff_prop a _).1 h₁))
          (atom_actual_instance (weaklyRigid_of_rigid hF) ha z haF).elim fun z₁ ⟨hz₁, he⟩ =>
          have heb : □ (a → z = z₁) := (le_iff_prop a _).1 he
          have hax : □ (a → X z₁) := modal_K _ _ (modal_K _ _
            (nec% (fun (f : a → X z) (e : a → z = z₁) (ha : a) => (e ha) ▸ f ha))
            ((le_iff_prop a _).1 h₁)) heb
          have hd : ◇ (a ∧ X z₁) := dia_mono _ _ (modal_K _ _
            (nec% (fun (f : a → X z₁) (ha : a) => (⟨ha, f ha⟩ : a ∧ X z₁))) hax) (dia_of_atom ha)
          have hx' : □ (X' z₁) :=
            weaklyPersistent_of_persistent hX'.1 z₁ ((hco z₁).1 ⟨hz₁, hd⟩)
          (atom_absurd ha (modal_K _ _ (modal_K _ _ (modal_K _ _
            (nec% (fun (g : X' z₁) (e : a → z = z₁) (k : a → ¬ X' z) (ha : a) =>
              k ha ((e ha) ▸ g)))
            hx') heb) ((le_iff_prop a _).1 h₂))).elim))
      (fun h₁ => (atom_le_or_le_neg a (X' z) ha).elim
        (fun h₂ =>
          -- a ≤ ¬X z and a ≤ X' z: impossible
          (atom_actual_instance (weaklyRigid_of_rigid hX') ha z h₂).elim fun z₁ ⟨hz₁, he⟩ =>
          have hd : ◇ (a ∧ X z₁) := ((hco z₁).2 hz₁).2
          have hax : a ≤ X z₁ := atom_le_of_dia_and ha (X z₁) hd
          (atom_absurd ha (modal_K _ _ (modal_K _ _ (modal_K _ _
            (nec% (fun (g : a → X z₁) (e : a → z = z₁) (k : a → ¬ X z) (ha : a) =>
              k ha ((e ha).symm ▸ g ha)))
            ((le_iff_prop a _).1 hax)) ((le_iff_prop a _).1 he))
            ((le_iff_prop a _).1 h₁))).elim)
        (fun h₂ => modal_K _ _ (modal_K _ _
          (nec% (fun (f : a → ¬ X z) (g : a → ¬ X' z) (ha : a) =>
            (⟨fun hx => (f ha hx).elim, fun hx => (g ha hx).elim⟩ : X z ↔ X' z)))
          ((le_iff_prop a _).1 h₁)) ((le_iff_prop a _).1 h₂)))
  have hco' : □ (∀ z : σ, a → (X z ↔ X' z)) := bf (fun z => a → (X z ↔ X' z)) hpt
  have heq : □ (a → X = X') := modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (f : a → (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) (g : WeaklyRigid X')
        (k : ∀ z : σ, a → (X z ↔ X' z)) (ha : a) =>
      eq_of_weaklyRigid_coext (weaklyRigid_of_rigid (f ha).1.1) g (fun z => k z ha)))
    hXb) ((rigid_iff_box_weaklyRigid X').1 hX')) hco'
  (atom_absurd ha (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (f : a → (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) (g : 𝒳 X') (k : a → X = X') (ha : a) =>
      (f ha).2 (Eq.subst (motive := fun Y => 𝒳 Y) (k ha).symm g)))
    hXb) h𝒳) heq)).elim

/-- The record unboxed in its conclusion, at `σ → t`: the power property is persistent in C,
and the core, necessitated, gives its inextensibility. -/
theorem nbf_natom_nrc_rigid_power :
    P.NecBarcan σ → P.NecBarcan (σ → Prop) → P.NecAtomicity Prop →
      P.NecRigidComprehension (σ → Prop) → P.RigidPower (σ → Prop) := fun h₁ h₂ h₃ h₄ F hF =>
  ⟨rigid_power_property_persistent F,
   modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
     (nec% (rigid_power_core (σ := σ) F)) h₁) h₂) h₃) h₄) (rigid_necessary F hF)⟩

/-- `necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power`, at `σ → t`:
the last, necessitated, the premises boxed again by `4`. -/
theorem nbf_natom_nrc_nec_rigid_power :
    P.NecBarcan σ → P.NecBarcan (σ → Prop) → P.NecAtomicity Prop →
      P.NecRigidComprehension (σ → Prop) → P.NecRigidPower (σ → Prop) := fun h₁ h₂ h₃ h₄ =>
  modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (nbf_natom_nrc_rigid_power (σ := σ))) (modal_four _ h₁)) (modal_four _ h₂))
    (modal_four _ h₃)) (modal_four _ h₄)

/-! ### Strong Atomicity, □Rigid Comprehension and Rigid Power give BF (11 October 2026)

Cian Dorr's argument. Let `A` be rigid and coextensive with being an atom. (a) Necessarily
everything lies in some `A`-member; (b) necessarily every `A`-member decides every entity of
its type. (ii) At every world each entity `Y` is the join `J(R_Y)` of a rigid `R_Y ≤ A`, from
Rigid Comprehension there. (iii) BF at the type of `Y` then follows from the weak
inextensibility of the rigid power property of `A`. -/

/-- An atom of type `σ → t` is a strong atom, given Strong Atomicity there. -/
theorem sl_atom_decides (sl : P.StrongAtomicity (σ → Prop)) (W : σ → Prop) (hW : Atom W) :
    □ (∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z) :=
  (sl W fun e => not_le_neg_of_atom hW (by rw [e]; exact bot_le_arrow _)).elim fun S ⟨hS, hSW⟩ =>
    have e : S = W := (em (S = W)).elim id fun hne =>
      (hS.1 (eq_bot_of_le_neg_arrow S ((hW S).1 ⟨hSW, hne⟩))).elim
    e ▸ hS.2

/-- The join of the members of `R` applying to an argument. -/
def JoinOf (R : (σ → Prop) → Prop) : σ → Prop := fun x => ∃ W, R W ∧ W x

/-- (ii), at one world: from Rigid Comprehension there and the necessary facts (a) and (b) about
`A`, every `Y` is the join of a rigid `R ≤ A`. -/
theorem sl_join_rep (A : (σ → Prop) → Prop) (rc : P.RigidComprehension ((σ → Prop) → Prop))
    (wpA : WeaklyPersistent A) (wiA : WeaklyInextensible A)
    (ha : □ (∀ x : σ, ∃ W, A W ∧ W x))
    (hb : □ (∀ W, A W → ∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z)) (Y : σ → Prop) :
    ∃ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) ∧ Y = JoinOf R :=
  (rc (fun W => A W ∧ W ≤ Y)).elim fun R ⟨hR, hco⟩ =>
  have hRA : R ≤ A := le_of_box_incl (weaklyInextensible_of_inextensible hR.2 A
    fun W hW => wpA W ((hco W).2 hW).1)
  have h1 : JoinOf R ≤ Y := (le_iff _ _).2 (modal_K _ _
    (nec% (fun (h : ∀ W, R W → W ≤ Y) (x : σ) (hx : JoinOf R x) =>
      hx.elim fun W ⟨hW, hWx⟩ => incl_of_le (h W hW) x hWx))
    (weaklyInextensible_of_inextensible hR.2 (fun W => W ≤ Y)
      fun W hW => box_le_rel W Y ((hco W).2 hW).2))
  have hz : □ (∀ W, A W → (∃ x, W x) → W ≤ Y → R W) :=
    wiA (fun W => (∃ x, W x) → W ≤ Y → R W) fun W hW =>
      (box_elim hb W hW Y).elim
        (fun h => modal_K _ _ (nec% (fun (h : R W) (_ : ∃ x, W x) (_ : W ≤ Y) => h))
          (weaklyPersistent_of_persistent hR.1 W ((hco W).1 ⟨hW, h⟩)))
        (fun h => modal_K _ _ (nec% (fun (hn : W ≤ ¬ Y) (hx : ∃ x, W x) (hy : W ≤ Y) =>
            (hx.elim fun x hx => (incl_of_le hn x hx (incl_of_le hy x hx)).elim : R W)))
          (box_le_rel W (¬ Y) h))
  have h2 : Y ≤ JoinOf R := (le_iff _ _).2 (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (ha : ∀ x : σ, ∃ W, A W ∧ W x) (hb : ∀ W, A W → ∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z)
        (hz : ∀ W, A W → (∃ x, W x) → W ≤ Y → R W) (x : σ) (hY : Y x) =>
      (ha x).elim fun W ⟨hW, hWx⟩ =>
        (⟨W, hz W hW ⟨x, hWx⟩ ((hb W hW Y).elim id fun hn => (incl_of_le hn x hWx hY).elim),
          hWx⟩ : JoinOf R x)))
    ha) hb) hz)
  ⟨R, ⟨hR, hRA⟩, le_antisymm_arrow Y _ h2 h1⟩

/-- `strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational`, at
`σ → t` (Cian Dorr). -/
theorem sl_nrc_rp_bf :
    P.StrongAtomicity (σ → Prop) → P.NecRigidComprehension ((σ → Prop) → Prop) →
      P.RigidPower ((σ → Prop) → Prop) → P.BarcanRelational (σ → Prop) := fun sl nrc rp X hX =>
  (box_elim nrc (fun W => Atom W)).elim fun A ⟨hA, hco⟩ =>
  -- (a)
  have ha : □ (∀ x : σ, ∃ W, A W ∧ W x) :=
    have h := P.Atomicity.to_dual (Proofs.strong_atomicity_r_implies_atomicity_r sl) (JoinOf A)
      fun W hW => (le_iff _ _).2 (modal_K _ _
        (nec% (fun (h : A W) (x : σ) (hx : W x) => (⟨W, h, hx⟩ : JoinOf A x)))
        (weaklyPersistent_of_persistent hA.1 W ((hco W).1 hW)))
    modal_K _ _ (nec% (fun (h : ∀ x : σ, ¬ JoinOf A x → JoinOf A x) (x : σ) =>
      ((em (JoinOf A x)).elim id (h x) : ∃ W, A W ∧ W x))) ((le_iff _ _).1 h)
  -- (b)
  have hb : □ (∀ W, A W → ∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z) :=
    weaklyInextensible_of_inextensible hA.2 (fun W => ∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z)
      fun W hW => sl_atom_decides sl W ((hco W).2 hW)
  -- (ii), at every world
  have key : □ (∀ Y : σ → Prop, ∃ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) ∧ Y = JoinOf R) :=
    modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (rc : P.RigidComprehension ((σ → Prop) → Prop)) (wpA : WeaklyPersistent A)
          (wiA : WeaklyInextensible A) (ha : □ (∀ x : σ, ∃ W, A W ∧ W x))
          (hb : □ (∀ W, A W → ∀ Z : σ → Prop, W ≤ Z ∨ W ≤ ¬ Z)) (Y : σ → Prop) =>
        sl_join_rep A rc wpA wiA ha hb Y))
      nrc) hA.1) hA.2) (modal_four _ ha)) (modal_four _ hb)
  -- (iii)
  have hall : □ (∀ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) → X (JoinOf R)) :=
    weaklyInextensible_of_inextensible (rp A hA).2 (fun R => X (JoinOf R)) fun R _ => hX _
  modal_K _ _ (modal_K _ _
    (nec% (fun (hall : ∀ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) → X (JoinOf R))
        (key : ∀ Y : σ → Prop, ∃ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) ∧ Y = JoinOf R)
        (Y : σ → Prop) =>
      (key Y).elim fun R ⟨hR, e⟩ => Eq.subst (motive := fun Z => X Z) e.symm (hall R hR)))
    hall) key

/-! ### The same at type `t` (11 October 2026) -/

/-- An atom is a strong atom, given Strong Atomicity at `t`. -/
theorem slt_atom_decides (sl : P.StrongAtomicityT) (w : Prop) (hw : Atom w) :
    □ (∀ q : Prop, w ≤ q ∨ w ≤ ¬ q) :=
  (sl w (dia_of_atom hw)).elim fun s ⟨hs, hsw⟩ =>
    have e : s = w := (em (s = w)).elim id fun hne =>
      (hs.1 (eq_false_of_le_neg s ((hw s).1 ⟨hsw, hne⟩))).elim
    e ▸ hs.2

/-- (ii) at `t`, at one world. -/
theorem slt_join_rep (A : Prop → Prop) (rc : P.RigidComprehension (Prop → Prop))
    (wpA : WeaklyPersistent A) (wiA : WeaklyInextensible A)
    (ha : □ (∃ w, A w ∧ w)) (hb : □ (∀ w, A w → ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q)) (p : Prop) :
    ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = (∃ w, R w ∧ w) :=
  (rc (fun w => A w ∧ w ≤ p)).elim fun R ⟨hR, hco⟩ =>
  have hRA : R ≤ A := le_of_box_incl (weaklyInextensible_of_inextensible hR.2 A
    fun w hw => wpA w ((hco w).2 hw).1)
  have h1 : (∃ w, R w ∧ w) ≤ p := (le_iff_prop _ _).2 (modal_K _ _
    (nec% (fun (h : ∀ w, R w → w ≤ p) (hx : ∃ w, R w ∧ w) =>
      hx.elim fun w ⟨hw, hww⟩ => imp_of_le_prop w p (h w hw) hww))
    (weaklyInextensible_of_inextensible hR.2 (fun w => w ≤ p)
      fun w hw => box_le_prop w p ((hco w).2 hw).2))
  have hz : □ (∀ w, A w → w → w ≤ p → R w) :=
    wiA (fun w => w → w ≤ p → R w) fun w hw =>
      (box_elim hb w hw p).elim
        (fun h => modal_K _ _ (nec% (fun (h : R w) (_ : w) (_ : w ≤ p) => h))
          (weaklyPersistent_of_persistent hR.1 w ((hco w).1 ⟨hw, h⟩)))
        (fun h => modal_K _ _ (nec% (fun (hn : w ≤ ¬ p) (hx : w) (hy : w ≤ p) =>
            ((imp_of_le_prop w (¬ p) hn hx (imp_of_le_prop w p hy hx)).elim : R w)))
          (box_le_prop w (¬ p) h))
  have h2 : p ≤ (∃ w, R w ∧ w) := (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (ha : ∃ w, A w ∧ w) (hb : ∀ w, A w → ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q)
        (hz : ∀ w, A w → w → w ≤ p → R w) (hp : p) =>
      ha.elim fun w ⟨hw, hww⟩ =>
        (⟨w, hz w hw hww ((hb w hw p).elim id fun hn =>
          (imp_of_le_prop w (¬ p) hn hww hp).elim), hww⟩ : ∃ w, R w ∧ w)))
    ha) hb) hz)
  ⟨R, ⟨hR, hRA⟩, le_antisymm_prop p _ h2 h1⟩

/-- `strong-atomicity-t-necessary-rigid-comprehension-and-rigid-power-imply-bf-t` (Cian Dorr). -/
theorem slt_nrc_rp_bft :
    P.StrongAtomicityT → P.NecRigidComprehension (Prop → Prop) → P.RigidPower (Prop → Prop) →
      P.BarcanT := fun sl nrc rp X hX =>
  (box_elim nrc (fun w => Atom w)).elim fun A ⟨hA, hco⟩ =>
  have ha : □ (∃ w, A w ∧ w) :=
    (Proofs.strong_atomicity_t_implies_atomicity_t sl (¬ ∃ w, A w ∧ w)).elim
      (fun h => Proofs.box_of_neg_le_neg_neg _ h)
      (fun ⟨y, hy, hyn⟩ => (atom_absurd hy (modal_K _ _ (modal_K _ _
        (nec% (fun (h : A y) (f : y → ¬ ∃ w, A w ∧ w) (hy : y) => f hy ⟨y, h, hy⟩))
        (weaklyPersistent_of_persistent hA.1 y ((hco y).1 hy)))
        ((le_iff_prop _ _).1 hyn))).elim)
  have hb : □ (∀ w, A w → ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q) :=
    weaklyInextensible_of_inextensible hA.2 (fun w => ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q)
      fun w hw => slt_atom_decides sl w ((hco w).2 hw)
  have key : □ (∀ p : Prop, ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = (∃ w, R w ∧ w)) :=
    modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (rc : P.RigidComprehension (Prop → Prop)) (wpA : WeaklyPersistent A)
          (wiA : WeaklyInextensible A) (ha : □ (∃ w, A w ∧ w))
          (hb : □ (∀ w, A w → ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q)) (p : Prop) =>
        slt_join_rep A rc wpA wiA ha hb p))
      nrc) hA.1) hA.2) (modal_four _ ha)) (modal_four _ hb)
  have hall : □ (∀ R : Prop → Prop, (Rigid R ∧ R ≤ A) → X (∃ w, R w ∧ w)) :=
    weaklyInextensible_of_inextensible (rp A hA).2 (fun R => X (∃ w, R w ∧ w)) fun R _ => hX _
  modal_K _ _ (modal_K _ _
    (nec% (fun (hall : ∀ R : Prop → Prop, (Rigid R ∧ R ≤ A) → X (∃ w, R w ∧ w))
        (key : ∀ p : Prop, ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = (∃ w, R w ∧ w)) (p : Prop) =>
      (key p).elim fun R ⟨hR, e⟩ => Eq.subst (motive := fun Z => X Z) e.symm (hall R hR)))
    hall) key

/-! ### Atomicity and Rigid Comprehension give Rigid Power (19 October 2026)

Lemma C.6 of Bacon, *Could the truths of mathematics have been different?*, with `□` for his
`□_N`: an atom `W` of the power type below the power property of a rigid `F` singles out an
actual rigid `X ≤ F` that is, wherever `W` is instantiated, its only instance. With Atomicity at
the power type that makes the power property weakly inextensible, and Rigid Comprehension at the
power type, as Tame Rigidity there, makes it rigid. No BF is used. -/

/-- Lemma C.6 (Bacon). `W` an atom of type `(σ → t) → t` below `λX. Rigid X ∧ X ≤ F`, `F`
rigid: by Rigid Comprehension at `σ → t` let `X` be rigid and coextensive with
`λz. Fz ∧ □∀Y. WY → Yz`. Then `X ≤ F`, and `W` entails being coextensive with `X`: one
inclusion by the inextensibility of `X`, the other by that of `F`, with `W` deciding `λY. Yz`
at each actual `z`. Coextensive weakly rigid relations being identical, `W` entails being `X`. -/
theorem atom_power_pullback (F : σ → Prop) (hF : Rigid F) (rc : P.RigidComprehension (σ → Prop))
    (W : (σ → Prop) → Prop) (hW : Atom W)
    (hWP : □ (∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F)) :
    ∃ X : σ → Prop, (Rigid X ∧ X ≤ F) ∧ □ (∀ Y : σ → Prop, W Y → Y = X) :=
  (rc (fun z => F z ∧ □ (∀ Y : σ → Prop, W Y → Y z))).elim fun X ⟨hX, hco⟩ =>
  -- (a) `X ≤ F`
  have hXF : X ≤ F := le_of_box_incl (weaklyInextensible_of_inextensible hX.2 F
    fun z hz => weaklyPersistent_of_persistent hF.1 z ((hco z).2 hz).1)
  -- (b) necessarily every member of `W` includes `X`
  have hb : □ (∀ z : σ, X z → ∀ Y : σ → Prop, W Y → Y z) :=
    weaklyInextensible_of_inextensible hX.2 (fun z => ∀ Y : σ → Prop, W Y → Y z)
      fun z hz => ((hco z).2 hz).2
  -- (c) necessarily every member of `W` is included in `X`, on `F`
  have hc : □ (∀ z : σ, F z → ∀ Y : σ → Prop, W Y → Y z → X z) :=
    weaklyInextensible_of_inextensible hF.2 (fun z => ∀ Y : σ → Prop, W Y → Y z → X z)
      fun z hz => (em (X z)).elim
        (fun hx => modal_K _ _ (nec% (fun (h : X z) (Y : σ → Prop) (_ : W Y) (_ : Y z) => h))
          (weaklyPersistent_of_persistent hX.1 z hx))
        (fun hnx =>
          have hnle : ¬ W ≤ (fun Y : σ → Prop => Y z) := fun hle =>
            hnx ((hco z).1 ⟨hz, ((le_iff _ _).1 hle : □ (∀ Y : σ → Prop, W Y → Y z))⟩)
          (atom_decides_arrow W (fun Y : σ → Prop => Y z) hW).elim (fun h => (hnle h).elim)
            fun h => modal_K _ _
              (nec% (fun (h : ∀ Y : σ → Prop, W Y → ¬ Y z) (Y : σ → Prop) (hY : W Y)
                  (hYz : Y z) => ((h Y hY hYz).elim : X z)))
              ((le_iff _ _).1 h))
  ⟨X, ⟨hX, hXF⟩,
    modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (hWP : ∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F)
          (hb : ∀ z : σ, X z → ∀ Y : σ → Prop, W Y → Y z)
          (hc : ∀ z : σ, F z → ∀ Y : σ → Prop, W Y → Y z → X z)
          (hwX : WeaklyRigid X) (Y : σ → Prop) (hY : W Y) =>
        eq_of_weaklyRigid_coext (weaklyRigid_of_rigid (hWP Y hY).1) hwX
          fun z => ⟨fun hYz => hc z (incl_of_le (hWP Y hY).2 z hYz) Y hY hYz,
                    fun hXz => hb z hXz Y hY⟩))
      hWP) hb) hc) ((rigid_iff_box_weaklyRigid X).1 hX)⟩

/-- With Atomicity at the power type, the power property of a rigid `F` is weakly
inextensible: a counterexample `𝒳`, necessary of every actual rigid `X ≤ F` but possibly
failing of some, has an atom `W` below `λX. (Rigid X ∧ X ≤ F) ∧ ¬𝒳X`, and Lemma C.6 makes the
possible instance of `W` an actual `X`, of which `𝒳` is both necessary and possibly false. -/
theorem atom_rc_rigid_power_core (F : σ → Prop) (hF : Rigid F)
    (at_ : P.Atomicity ((σ → Prop) → Prop)) (rc : P.RigidComprehension (σ → Prop)) :
    WeaklyInextensible (fun X : σ → Prop => Rigid X ∧ X ≤ F) := fun 𝒳 h =>
  (em (□ (∀ X : σ → Prop, (Rigid X ∧ X ≤ F) → 𝒳 X))).elim id fun hn =>
  (at_ (fun X : σ → Prop => (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X)).elim
    (fun hq => (hn (modal_K _ _
      (nec% (fun (hq : ∀ X : σ → Prop, ((Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) →
            ¬ ((Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X)) (X : σ → Prop) (hP : Rigid X ∧ X ≤ F) =>
        (em (𝒳 X)).elim id fun hx => (hq X ⟨hP, hx⟩ ⟨hP, hx⟩).elim))
      ((le_iff _ _).1 hq))).elim)
    fun ⟨W, hW, hWQ⟩ =>
  have hWQ' : □ (∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y) := (le_iff _ _).1 hWQ
  have hWP : □ (∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F) := modal_K _ _
    (nec% (fun (h : ∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y) (Y : σ → Prop)
        (hY : W Y) => (h Y hY).1)) hWQ'
  (atom_power_pullback F hF rc W hW hWP).elim fun X ⟨hPX, heq⟩ =>
  have h𝒳 : □ (𝒳 X) := h X hPX
  have hne : W ≠ Rel.bot ((σ → Prop) → Prop) := fun e =>
    not_le_neg_of_atom hW (by rw [e]; exact bot_le_arrow _)
  have hdia : ◇ (∃ Y : σ → Prop, W Y) := dia_exists_of_ne_bot W hne
  -- but `W` necessarily has no instance: its only possible instance `X` would be `𝒳` and not `𝒳`
  have hbox : □ (¬ ∃ Y : σ → Prop, W Y) := modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (f : ∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y)
        (g : ∀ Y : σ → Prop, W Y → Y = X) (k : 𝒳 X) =>
      (fun hex => hex.elim fun Y hY =>
          (f Y hY).2 (Eq.subst (motive := fun Z => 𝒳 Z) (g Y hY).symm k)
        : ¬ ∃ Y : σ → Prop, W Y)))
    hWQ') heq) h𝒳
  (not_dia_of_box_not _ hbox hdia).elim

/-- `atomicity-and-rigid-comprehension-imply-rigid-power`, at `σ → t`: the power property is
persistent in C and, by the core, weakly inextensible; Rigid Comprehension at the power type,
as Tame Rigidity there, makes it rigid. -/
theorem atom_rc_rigid_power :
    P.Atomicity ((σ → Prop) → Prop) → P.RigidComprehension (σ → Prop) →
      P.RigidComprehension ((σ → Prop) → Prop) → P.RigidPower (σ → Prop) := fun at_ rc rc' F hF =>
  Proofs.rigid_comprehension_implies_tame_rigidity rc' _
    ⟨weaklyPersistent_of_persistent (rigid_power_property_persistent F),
     atom_rc_rigid_power_core F hF at_ rc⟩

/-- `necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power`, at
`σ → t`: the last, necessitated. -/
theorem natom_nrc_nec_rigid_power :
    P.NecAtomicity ((σ → Prop) → Prop) → P.NecRigidComprehension (σ → Prop) →
      P.NecRigidComprehension ((σ → Prop) → Prop) → P.NecRigidPower (σ → Prop) := fun h₁ h₂ h₃ =>
  modal_K _ _ (modal_K _ _ (modal_K _ _ (nec% (atom_rc_rigid_power (σ := σ))) h₁) h₂) h₃

/-- Cian Dorr's core `sl_nrc_rp_bf`, necessitated, its premises boxed (`4` boxes `□`Rigid
Comprehension again): the step of
`necessary-strong-atomicity-and-necessary-rigid-comprehension-imply-necessary-bf-relational`
after `□`Rigid Power has been obtained in the metalogic. -/
theorem nsl_nrc_nrp_nbf :
    P.NecStrongAtomicity (σ → Prop) → P.NecRigidComprehension ((σ → Prop) → Prop) →
      P.NecRigidPower ((σ → Prop) → Prop) → P.NecBarcanRelational (σ → Prop) := fun h₁ h₂ h₃ =>
  modal_K _ _ (modal_K _ _ (modal_K _ _ (nec% (sl_nrc_rp_bf (σ := σ))) h₁) (modal_four _ h₂)) h₃

end unary

/-- In `C5`, `□`Boolean Completeness gives `□`Plenitude, for relations `σ → (σ' → t) → t`:
Proposition 2.14 necessitated, `□ND` boxed by `4`. -/
theorem necessary_completeness_c5_necessary_plenitude {σ' σ : Type} [Ty σ'] [Ty σ] :
    P.NecBooleanCompleteness (σ → σ' → Prop) → P.NecNecessityOfDistinctness Prop →
      P.NecPlenitude σ (σ' → Prop) := fun hbc hnd =>
  modal_K _ _ (modal_K _ _ (nec% (Proofs.c5_and_completeness_imply_plenitude (σ' := σ') (σ := σ)))
    hbc) (modal_four _ hnd)

/-- The boxed step of Atomicity: `□`Atomicity at `t` and `□`BF at `σ` give `□`Atomicity at
`σ → t`, the record `atomicity-t-and-bf-imply-atomicity` at `σ → t` necessitated. -/
theorem necAtomicity_step {σ : Type} [Ty σ] :
    P.NecAtomicity Prop → P.NecBarcan σ → P.NecAtomicity (σ → Prop) := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% (Proofs.atomicity_t_and_bf_imply_atomicity (σ := σ))) h₁) h₂

/-- In `C5`, `□`Actuality gives `□`Atomicity at `t`: Proposition 2.6 at `t`, necessitated. -/
theorem c5_necessary_atomicity_t :
    P.NecActuality → P.NecNecessityOfDistinctness Prop → P.NecAtomicity Prop := fun hna hnd =>
  modal_K _ _ (modal_K _ _ (nec% Proofs.c5_and_necessary_actuality_imply_atomicity_at_t)
    (modal_four _ hna)) (modal_four _ hnd)

/-- Under the Fregean Axiom a truth is necessary, Actuality among them. -/
theorem fregean_actuality_necessary_actuality : P.FregeanAxiom → P.Actuality → P.NecActuality :=
  fun fa act => fa _ True ⟨fun _ => trivial, fun _ => act⟩

/-! ## 2. Certification -/

#classicism_certify Classicism.actuality_implies_persistent_comprehension_r
  Classicism.necessary_actuality_implies_necessary_persistent_comprehension
  Classicism.c5_and_necessary_persistent_comprehension_imply_necessary_gallin
  Classicism.nd_strong_actuality_gallin Classicism.c5_nec_strong_actuality_nec_gallin
  Classicism.nbf_natom_nrc_nec_rigid_power Classicism.sl_nrc_rp_bf Classicism.slt_nrc_rp_bft
  Classicism.bf_wrp_weakly_rigid_weak_rigidity Classicism.rr_necessary_barcan
  Classicism.nbf_rp_rigid_rigidity
  Classicism.gallin_bf_weak_rigid_comprehension Classicism.gallin_c5_rigid_comprehension
  Classicism.nec_gallin_c5_nec_rigid_comprehension
  Classicism.necAtomicity_step Classicism.Proofs.atomicity_r_implies_atomicity_t
  Classicism.c5_necessary_atomicity_t Classicism.fregean_actuality_necessary_actuality
  Classicism.extensionality_r_implies_rigid_comprehension_r
  Classicism.c5_and_persistent_comprehension_imply_gallin
  Classicism.c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension
  Classicism.necessary_completeness_c5_necessary_plenitude
  Classicism.atom_rc_rigid_power Classicism.natom_nrc_nec_rigid_power Classicism.nsl_nrc_nrp_nbf

#classicism_entails Classicism.actuality_implies_persistent_comprehension_r
  Classicism.necessary_actuality_implies_necessary_persistent_comprehension
  Classicism.c5_and_necessary_persistent_comprehension_imply_necessary_gallin
  Classicism.nd_strong_actuality_gallin Classicism.c5_nec_strong_actuality_nec_gallin
  Classicism.nbf_natom_nrc_nec_rigid_power Classicism.sl_nrc_rp_bf Classicism.slt_nrc_rp_bft
  Classicism.bf_wrp_weakly_rigid_weak_rigidity Classicism.rr_necessary_barcan
  Classicism.nbf_rp_rigid_rigidity
  Classicism.gallin_bf_weak_rigid_comprehension Classicism.gallin_c5_rigid_comprehension
  Classicism.nec_gallin_c5_nec_rigid_comprehension
  Classicism.c5_necessary_atomicity_t Classicism.fregean_actuality_necessary_actuality
  Classicism.extensionality_r_implies_rigid_comprehension_r
  Classicism.c5_and_persistent_comprehension_imply_gallin
  Classicism.c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension
  Classicism.necessary_completeness_c5_necessary_plenitude
  Classicism.atom_rc_rigid_power Classicism.natom_nrc_nec_rigid_power Classicism.nsl_nrc_nrp_nbf

/-! ## 3. The metalogic -/

namespace Meta
open AxiomSet

/-- `classicism-implies-existence-r`, at every type: the instance at `e` (the axiom
`e_exists`) and those at relational types (theorems of `C⁻`), the two records. -/
theorem classicism_implies_existence_r : empty ⟹ P.Existence.schema := by
  rintro a ⟨σ, hσ, rfl⟩
  cases σ with
  | e => exact Proofs.classicism_implies_existence_r_at_e.entails _ rfl
  | rel ρ => exact Proofs.classicism_implies_existence_r_relational.entails _ ⟨ρ, hσ, rfl⟩
  | var i => exact hσ.elim

/-- `actuality-implies-persistent-comprehension-r`, the map's record, at every arity. -/
theorem actuality_implies_persistent_comprehension_r :
    P.Actuality.schema ⟹ P.PersistentComprehension.schema :=
  Classicism.actuality_implies_persistent_comprehension_r.entails

/-- `c5-and-actuality-imply-rigid-comprehension` (Proposition 2.10), at every arity: the
record at `σ → t`, vectorized. -/
theorem c5_and_actuality_imply_rigid_comprehension :
    P.NecNecessityOfDistinctness.schema ∪ P.Actuality.schema ⟹ P.RigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_right _ _) (Entails.union_left _ _))
      Proofs.c5_and_actuality_imply_rigid_comprehension.listEntails)

/-- `gallin-comprehension-and-bf-imply-weak-rigid-comprehension`, at every arity: the core
at `σ → t`, vectorized, with BF over every list from BF. -/
theorem gallin_comprehension_and_bf_imply_weak_rigid_comprehension :
    P.GallinExtensionalComprehension.schema ∪ P.Barcan.schema ⟹
      P.WeakRigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.Barcan.schema_entails_listSchema))
      gallin_bf_weak_rigid_comprehension.listEntails)

/-- `gallin-comprehension-and-bf-imply-rigid-comprehension`, at every arity: Gallin gives
ND, ND and BF give `□ND`, and the core at `σ → t`, vectorized. -/
theorem gallin_comprehension_and_bf_imply_rigid_comprehension :
    P.GallinExtensionalComprehension.schema ∪ P.Barcan.schema ⟹ P.RigidComprehension.schema :=
  have nd : P.GallinExtensionalComprehension.schema ∪ P.Barcan.schema ⟹
      P.NecessityOfDistinctness.schema :=
    Entails.trans (Entails.union_left _ _) Proofs.gallin_comprehension_implies_nd.entails
  have nnd : P.GallinExtensionalComprehension.schema ∪ P.Barcan.schema ⟹
      P.NecNecessityOfDistinctness.schema :=
    Entails.trans (Entails.union nd (Entails.union_right _ _))
      Proofs.nd_and_bf_imply_necessary_nd.entails
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_left _ _) nnd)
      gallin_c5_rigid_comprehension.listEntails)

/-- `c5-and-atomicity-imply-necessary-rigid-comprehension`, at every arity: the record at
`σ → t`, from Atomicity at `t`, vectorized. -/
theorem c5_and_atomicity_imply_necessary_rigid_comprehension :
    P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹
      P.NecRigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_right _ _) (Entails.union_left _ _))
      Proofs.c5_and_atomicity_imply_necessary_rigid_comprehension.listEntails)

/-- `atomicity-t-and-bf-imply-atomicity`, at every arity: the record at `σ → t`, vectorized,
with BF over every list from BF. -/
theorem atomicity_t_and_bf_imply_atomicity :
    P.AtomicityT.schema ∪ P.Barcan.schema ⟹ P.Atomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.Barcan.schema_entails_listSchema))
      Proofs.atomicity_t_and_bf_imply_atomicity.listEntails)

/-- The same, with Atomicity at `t` read as the instance of Atomicity, the form the `C5`
records conclude with. -/
theorem atomicity_of_atomicity_at_t_barcan :
    single (P.Atomicity.quoted RTy.t) ∪ P.Barcan.schema ⟹ P.Atomicity.schema :=
  Entails.trans
    (Entails.union
      (by rintro a rfl
          exact (Theorem.ofC Proofs.atomicity_r_implies_atomicity_t.rule).mp (Theorem.ax (Or.inl rfl)))
      (Entails.union_right _ _))
    atomicity_t_and_bf_imply_atomicity

/-- `c5-and-necessary-actuality-imply-atomicity` (Proposition 2.6, right to left), at every
arity: Atomicity at `t` from the `t` record, BF from `□ND`, and the induction. -/
theorem c5_and_necessary_actuality_imply_atomicity :
    P.NecNecessityOfDistinctness.schema ∪ P.NecActuality.schema ⟹ P.Atomicity.schema :=
  Entails.trans
    (Entails.union
      (Entails.trans (Entails.union (Entails.union_right _ _) (Entails.union_left _ _))
        Proofs.c5_and_necessary_actuality_imply_atomicity_at_t.entails)
      (Entails.trans (Entails.union_left _ _) Proofs.necessary_nd_implies_bf.entails))
    atomicity_of_atomicity_at_t_barcan

/-- `c5-and-necessary-completeness-imply-atomicity` (Proposition 2.6), at every arity. -/
theorem c5_and_necessary_completeness_imply_atomicity :
    P.NecNecessityOfDistinctness.schema ∪ P.NecBooleanCompleteness.schema ⟹
      P.Atomicity.schema :=
  Entails.trans
    (Entails.union
      (Entails.trans (Entails.union (Entails.union_right _ _) (Entails.union_left _ _))
        Proofs.c5_and_necessary_completeness_imply_atomicity_at_t.entails)
      (Entails.trans (Entails.union_left _ _) Proofs.necessary_nd_implies_bf.entails))
    atomicity_of_atomicity_at_t_barcan

/-- **`□`Atomicity at `t` and `□`BF entail `□`Atomicity**: the boxed step, vectorized, with
`□`BF over every list from `□`BF. -/
theorem necAtomicity_of_at_t_necBarcan :
    single (P.NecAtomicity.quoted RTy.t) ∪ P.NecBarcan.schema ⟹ P.NecAtomicity.schema := by
  refine Entails.mono_right (schema_subset_args _) ?_
  rintro a ⟨σs, hσs, rfl⟩
  exact (Theorem.ofC (necAtomicity_step.listRule σs)).mp₂ (Theorem.ax (Or.inl rfl))
    (Entails.mono_left (fun _ => Or.inr) P.NecBarcan.schema_entails_listSchema _ ⟨σs, hσs, rfl⟩)

/-- `c5-and-atomicity-imply-necessary-atomicity` (Proposition 2.6 with 2.7), at every
arity: Atomicity and BF give `□`Actuality, which with `□ND` gives `□`Atomicity at `t`,
and `□`BF, from `□ND`, carries it to every type. -/
theorem c5_and_atomicity_imply_necessary_atomicity :
    P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹ P.NecAtomicity.schema :=
  have bf : P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹ P.Barcan.schema :=
    Entails.trans (Entails.union_left _ _) Proofs.necessary_nd_implies_bf.entails
  have na : P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹
      single P.NecActuality.quoted :=
    Entails.trans (Entails.union (Entails.union_right _ _) bf)
      Proofs.atomicity_and_bf_imply_necessary_actuality.entails
  Entails.trans
    (Entails.union
      (Entails.trans (Entails.union na (Entails.union_left _ _)) c5_necessary_atomicity_t.entails)
      (Entails.trans (Entails.union_left _ _)
        Proofs.necessary_distinctness_necessary_r_implies_necessary_barcan_r.entails))
    necAtomicity_of_at_t_necBarcan

/-- `extensionality-r-implies-atomicity-r`, at every arity: Extensionality gives the
Fregean Axiom and Actuality; the Fregean Axiom gives `□ND` and makes Actuality necessary;
and in `C5` `□`Actuality gives Atomicity. -/
theorem extensionality_r_implies_atomicity_r :
    P.Extensionality.schema ⟹ P.Atomicity.schema :=
  have fa : P.Extensionality.schema ⟹ single P.FregeanAxiom.quoted :=
    Proofs.extensionality_r_implies_fregean_axiom.entails
  have act : P.Extensionality.schema ⟹ single P.Actuality.quoted :=
    Proofs.extensionality_r_implies_actuality.entails
  Entails.trans
    (Entails.union (Entails.trans fa Proofs.fregean_axiom_implies_necessary_distinctness_necessary_r.entails)
      (Entails.trans (Entails.union fa act) fregean_actuality_necessary_actuality.entails))
    c5_and_necessary_actuality_imply_atomicity

/-- `necessary-gallin-comprehension-implies-necessary-rigid-comprehension`, at every arity:
`□`Gallin gives `□ND`, and the boxed core at `σ → t`, vectorized. -/
theorem necessary_gallin_comprehension_implies_necessary_rigid_comprehension :
    P.NecGallinExtensionalComprehension.schema ⟹ P.NecRigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.refl _)
        Proofs.necessary_gallin_comprehension_implies_necessary_nd.entails)
      nec_gallin_c5_nec_rigid_comprehension.listEntails)

/-- `necessary-plenitude-r-implies-atomicity-r` (Propositions 2.13, 2.15 and 2.6 boxed),
at every arity: `□`Plenitude gives `□ND` and `□`Actuality, and in `C5` `□`Actuality gives
Atomicity. -/
theorem necessary_plenitude_r_implies_atomicity_r :
    P.NecPlenitude.schema ⟹ P.Atomicity.schema :=
  Entails.trans
    (Entails.union Proofs.necessary_plenitude_r_implies_necessary_distinctness_necessary_r.entails
      Proofs.necessary_plenitude_r_implies_necessary_actuality.entails)
    c5_and_necessary_actuality_imply_atomicity

/-- `necessary-plenitude-r-implies-necessary-atomicity-r`, at every arity. -/
theorem necessary_plenitude_r_implies_necessary_atomicity_r :
    P.NecPlenitude.schema ⟹ P.NecAtomicity.schema :=
  Entails.trans
    (Entails.union Proofs.necessary_plenitude_r_implies_necessary_distinctness_necessary_r.entails
      necessary_plenitude_r_implies_atomicity_r)
    c5_and_atomicity_imply_necessary_atomicity

/-! ### Boolean Completeness, Plenitude and the haecceities

The records at `σ → t` in `Results/Records.lean` whose greatest lower bounds are pointwise
meets `λz. ∀Y. X*Y → Yz`, or whose witnesses are haecceities `λx. u = x`, vectorized; and
the Plenitude records for output `σ' → t`, vectorized in `σ'`, every output type being
`σs ⇒* t`. -/

/-- `weak-rigid-comprehension-r-implies-boolean-completeness-r`, at every arity. -/
theorem weak_rigid_comprehension_r_implies_boolean_completeness_r :
    P.WeakRigidComprehension.schema ⟹ P.BooleanCompleteness.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.weak_rigid_comprehension_r_implies_boolean_completeness_r.listEntails

/-- `rigid-comprehension-r-implies-boolean-completeness-r` (Proposition 2.8), at every
arity. -/
theorem rigid_comprehension_r_implies_boolean_completeness_r :
    P.RigidComprehension.schema ⟹ P.BooleanCompleteness.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.rigid_comprehension_r_implies_boolean_completeness_r.listEntails

/-- `extensionality-r-implies-boolean-completeness-r`, at every arity. -/
theorem extensionality_r_implies_boolean_completeness_r :
    P.Extensionality.schema ⟹ P.BooleanCompleteness.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.extensionality_r_implies_boolean_completeness_r.listEntails

/-- `necessary-rigid-comprehension-r-implies-necessary-boolean-completeness-r`, at every
arity. -/
theorem necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r :
    P.NecRigidComprehension.schema ⟹ P.NecBooleanCompleteness.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r.listEntails

/-- `c5-and-actuality-imply-completeness` (Proposition 2.5, right to left), at every arity:
Rigid Comprehension (Proposition 2.10), then Proposition 2.8. -/
theorem c5_and_actuality_imply_completeness :
    P.NecNecessityOfDistinctness.schema ∪ P.Actuality.schema ⟹ P.BooleanCompleteness.schema :=
  Entails.trans c5_and_actuality_imply_rigid_comprehension
    rigid_comprehension_r_implies_boolean_completeness_r

/-- `c5-and-atomicity-imply-necessary-completeness` (Proposition 2.6), at every arity:
`□`Rigid Comprehension, then Proposition 2.8 boxed. -/
theorem c5_and_atomicity_imply_necessary_completeness :
    P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹
      P.NecBooleanCompleteness.schema :=
  Entails.trans c5_and_atomicity_imply_necessary_rigid_comprehension
    necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r

/-- `completeness-and-actuality-imply-weak-rigid-comprehension`, at every arity: the least
upper bound of the haecceities. -/
theorem completeness_and_actuality_imply_weak_rigid_comprehension :
    P.BooleanCompleteness.schema ∪ P.Actuality.schema ⟹ P.WeakRigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.completeness_and_actuality_imply_weak_rigid_comprehension.listEntails

/-- `c5-and-completeness-imply-plenitude` (Proposition 2.14), at every output type. -/
theorem c5_and_completeness_imply_plenitude :
    P.NecNecessityOfDistinctness.schema ∪ P.BooleanCompleteness.schema ⟹ P.Plenitude.schema :=
  Entails.mono_right (schema_subset_args₂ _)
    (Entails.trans (Entails.union (Entails.union_right _ _) (Entails.union_left _ _))
      Proofs.c5_and_completeness_imply_plenitude.listEntails)

/-- `weak-rigid-comprehension-and-nd-imply-plenitude` (Proposition 2.16, with Weak Rigid
Comprehension), at every output type. -/
theorem weak_rigid_comprehension_and_nd_imply_plenitude :
    P.WeakRigidComprehension.schema ∪ P.NecessityOfDistinctness.schema ⟹ P.Plenitude.schema :=
  Entails.mono_right (schema_subset_args₂ _)
    Proofs.weak_rigid_comprehension_and_nd_imply_plenitude.listEntails

/-- `extensionality-r-implies-plenitude-r`, at every output type: Extensionality gives the
Fregean Axiom, hence `□ND`, and Boolean Completeness, and Proposition 2.14. -/
theorem extensionality_r_implies_plenitude_r :
    P.Extensionality.schema ⟹ P.Plenitude.schema :=
  Entails.trans
    (Entails.union
      (Entails.trans Proofs.extensionality_r_implies_fregean_axiom.entails
        Proofs.fregean_axiom_implies_necessary_distinctness_necessary_r.entails)
      extensionality_r_implies_boolean_completeness_r)
    c5_and_completeness_imply_plenitude

/-- `c5-and-atomicity-imply-necessary-plenitude`, at every output type: `□`Boolean
Completeness (Proposition 2.6) and Proposition 2.14 boxed. -/
theorem c5_and_atomicity_imply_necessary_plenitude :
    P.NecNecessityOfDistinctness.schema ∪ P.Atomicity.schema ⟹ P.NecPlenitude.schema :=
  Entails.mono_right (schema_subset_args₂ _)
    (Entails.trans
      (Entails.union c5_and_atomicity_imply_necessary_completeness (Entails.union_left _ _))
      necessary_completeness_c5_necessary_plenitude.listEntails)

/-- Actuality from its form Actual Profile: over the empty list of argument
types is Actuality, on the nose. -/
theorem actual_profile_r_implies_actuality :
    P.ActualProfile.listSchema ⟹ P.Actuality.schema := by
  rintro a rfl
  exact Theorem.ax ⟨[], by simp [Ty.AllClosed], rfl⟩

/-! ### Weakly Inextensible and Inextensible Comprehension, Modalized Plenitude

The records of 25–28 September proved at `σ → t` (output `σ' → t` for Modalized
Plenitude) in `Results/Records.lean`, vectorized. -/

/-- `actuality-implies-weakly-inextensible-comprehension-r`, at every arity. -/
theorem actuality_implies_weakly_inextensible_comprehension_r :
    P.Actuality.schema ⟹ P.WeaklyInextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.actuality_implies_weakly_inextensible_comprehension_r.listEntails

/-- `necessary-actuality-implies-necessary-weakly-inextensible-comprehension-r`, at every
arity. -/
theorem necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r :
    P.NecActuality.schema ⟹ P.NecWeaklyInextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r.listEntails

/-- `boolean-completeness-r-implies-weakly-inextensible-comprehension-r`, at every arity: the
least upper bound of the haecceities. -/
theorem boolean_completeness_r_implies_weakly_inextensible_comprehension_r :
    P.BooleanCompleteness.schema ⟹ P.WeaklyInextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.boolean_completeness_r_implies_weakly_inextensible_comprehension_r.listEntails

/-- `actuality-and-bf-imply-inextensible-comprehension`, at every arity: BF at the type of
relations, and over the list of argument types. -/
theorem actuality_and_bf_imply_inextensible_comprehension :
    P.Actuality.schema ∪ P.Barcan.schema ⟹ P.InextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.refl _)
        (Entails.trans (Entails.union_right _ _) P.Barcan.schema_entails_listSchema))
      Proofs.actuality_and_bf_imply_inextensible_comprehension.listEntails)

/-- `necessary-bf-and-actuality-imply-inextensible-comprehension`, at every arity. -/
theorem necessary_bf_and_actuality_imply_inextensible_comprehension :
    P.NecBarcan.schema ∪ P.Actuality.schema ⟹ P.InextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union
        (Entails.trans (Entails.union_left _ _) P.NecBarcan.schema_entails_listSchema)
        (Entails.union_right _ _))
      Proofs.necessary_bf_and_actuality_imply_inextensible_comprehension.listEntails)

/-- `actuality-and-distinctness-preserving-collapse-imply-inextensible-comprehension`, at
every arity. -/
theorem actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension :
    P.Actuality.schema ∪ P.DistinctnessPreservingCollapse.schema ⟹
      P.InextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension.listEntails

/-- `classicism-implies-modalized-plenitude-r`, at every output type. -/
theorem classicism_implies_modalized_plenitude_r :
    AxiomSet.empty ⟹ P.ModalizedPlenitude.schema :=
  Entails.mono_right (schema_subset_args₂ _)
    Proofs.classicism_implies_modalized_plenitude_r.listEntails

/-! ### Strong Atomicity

The records at `σ → t` in `Results/Records.lean`, vectorized. -/

/-- `strong-atomicity-r-implies-atomicity-r`, at every arity. -/
theorem strong_atomicity_r_implies_atomicity_r :
    P.StrongAtomicity.schema ⟹ P.Atomicity.schema :=
  Entails.mono_right (schema_subset_args _) Proofs.strong_atomicity_r_implies_atomicity_r.listEntails

/-- `atomicity-and-bf-imply-strong-atomicity`, at every arity. -/
theorem atomicity_and_bf_imply_strong_atomicity :
    P.Atomicity.schema ∪ P.Barcan.schema ⟹ P.StrongAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.atomicity_and_bf_imply_strong_atomicity.listEntails

/-- `necessary-strong-atomicity-implies-necessary-atomicity`, at every arity. -/
theorem necessary_strong_atomicity_implies_necessary_atomicity :
    P.NecStrongAtomicity.schema ⟹ P.NecAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_strong_atomicity_implies_necessary_atomicity.listEntails

/-- `necessary-atomicity-and-necessary-bf-imply-necessary-strong-atomicity`, at every arity. -/
theorem necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity :
    P.NecAtomicity.schema ∪ P.NecBarcan.schema ⟹ P.NecStrongAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity.listEntails

/-- `necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity`, at every
arity: `□`BF over the list of argument types, from `□`BF. -/
theorem necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity :
    P.NecStrongAtomicityT.schema ∪ P.NecBarcan.schema ⟹ P.NecStrongAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.NecBarcan.schema_entails_listSchema))
      Proofs.necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity.listEntails)


/-! ### Boxed forms, at every arity (6 October 2026) -/

/-- `necessary-atomicity-t-and-necessary-bf-imply-necessary-atomicity`, at every arity. -/
theorem necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity :
    P.NecAtomicityT.schema ∪ P.NecBarcan.schema ⟹ P.NecAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.NecBarcan.schema_entails_listSchema))
      Proofs.necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity.listEntails)

/-- `necessary-actuality-and-necessary-bf-imply-necessary-inextensible-comprehension`, at every
arity. -/
theorem necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension :
    P.NecActuality.schema ∪ P.NecBarcan.schema ⟹ P.NecInextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.refl _)
        (Entails.trans (Entails.union_right _ _) P.NecBarcan.schema_entails_listSchema))
      Proofs.necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension.listEntails)

/-- `necessary-completeness-and-necessary-actuality-imply-necessary-weak-rigid-comprehension`,
at every arity. -/
theorem necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension :
    P.NecBooleanCompleteness.schema ∪ P.NecActuality.schema ⟹ P.NecWeakRigidComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension.listEntails


/-- `c5-implies-necessary-rigid-power`, at every arity: the core at `σ → t`, vectorized. -/
theorem c5_implies_necessary_rigid_power :
    P.NecNecessityOfDistinctness.schema ⟹ P.NecRigidPower.schema :=
  Entails.mono_right (schema_subset_args _) Proofs.c5_implies_necessary_rigid_power.listEntails


/-- `c5-implies-tame-rigidity`, at every arity. -/
theorem c5_implies_tame_rigidity : P.NecNecessityOfDistinctness.schema ⟹ P.TameRigidity.schema :=
  Entails.mono_right (schema_subset_args _) Proofs.c5_implies_tame_rigidity.listEntails

/-- `c5-implies-necessary-tame-rigidity`, at every arity. -/
theorem c5_implies_necessary_tame_rigidity :
    P.NecNecessityOfDistinctness.schema ⟹ P.NecTameRigidity.schema :=
  Entails.mono_right (schema_subset_args _) Proofs.c5_implies_necessary_tame_rigidity.listEntails


/-! ### Rigid Rigidity and Weakly Rigid Weak Rigidity, at every arity (10 October 2026) -/

/-- `barcan-and-weakly-rigid-power-imply-weakly-rigid-weak-rigidity`, at every arity: the core
at `σ → t`, vectorized, with BF over every list from BF. -/
theorem barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity :
    P.Barcan.schema ∪ P.WeaklyRigidPower.schema ⟹ P.WeaklyRigidWeakRigidity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union
        (Entails.trans (Entails.union_left _ _) P.Barcan.schema_entails_listSchema)
        (Entails.union_right _ _))
      bf_wrp_weakly_rigid_weak_rigidity.listEntails)

/-- `barcan-and-weakly-rigid-power-imply-necessary-tame-rigidity`, at every arity: through
Weakly Rigid Weak Rigidity. -/
theorem barcan_and_weakly_rigid_power_imply_necessary_tame_rigidity :
    P.Barcan.schema ∪ P.WeaklyRigidPower.schema ⟹ P.NecTameRigidity.schema :=
  Entails.trans barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity
    Proofs.weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity.entails

/-- `rigid-rigidity-implies-necessary-barcan`: Rigid Rigidity at `σ → t` gives □BF at `σ`. -/
theorem rigid_rigidity_implies_necessary_barcan :
    P.RigidRigidity.schema ⟹ P.NecBarcan.schema :=
  rr_necessary_barcan.entails

/-- `necessary-barcan-and-rigid-power-imply-rigid-rigidity`, at every arity: the core at
`σ → t`, vectorized, with □BF over every list from □BF. -/
theorem necessary_barcan_and_rigid_power_imply_rigid_rigidity :
    P.NecBarcan.schema ∪ P.RigidPower.schema ⟹ P.RigidRigidity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union
        (Entails.trans (Entails.union_left _ _) P.NecBarcan.schema_entails_listSchema)
        (Entails.union_right _ _))
      nbf_rp_rigid_rigidity.listEntails)


/-! ### BF at the relational types; ND, Strong Actuality and Gallin (11 October 2026) -/

/-- `atomicity-and-bf-relational-imply-strong-atomicity`, at every arity. -/
theorem atomicity_and_bf_relational_imply_strong_atomicity :
    P.Atomicity.schema ∪ P.BarcanRelational.schema ⟹ P.StrongAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.atomicity_and_bf_relational_imply_strong_atomicity.listEntails

/-- `necessary-atomicity-and-necessary-bf-relational-imply-necessary-strong-atomicity`, at every
arity. -/
theorem necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity :
    P.NecAtomicity.schema ∪ P.NecBarcanRelational.schema ⟹ P.NecStrongAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity.listEntails

/-- `nd-and-strong-actuality-imply-gallin-comprehension`, at every arity. -/
theorem nd_and_strong_actuality_imply_gallin_comprehension :
    P.NecessityOfDistinctness.schema ∪ P.StrongActuality.schema ⟹
      P.GallinExtensionalComprehension.schema :=
  Entails.mono_right (schema_subset_args _) nd_strong_actuality_gallin.listEntails

/-- `c5-and-necessary-strong-actuality-imply-necessary-gallin-comprehension`, at every arity. -/
theorem c5_and_necessary_strong_actuality_imply_necessary_gallin_comprehension :
    P.NecNecessityOfDistinctness.schema ∪ P.NecStrongActuality.schema ⟹
      P.NecGallinExtensionalComprehension.schema :=
  Entails.mono_right (schema_subset_args _) c5_nec_strong_actuality_nec_gallin.listEntails


/-- `necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power`, at every
arity: the core at `σ → t`, vectorized, with `□`BF over every list from `□`BF. -/
theorem necessary_bf_atomicity_and_rigid_comprehension_imply_necessary_rigid_power :
    P.NecBarcan.schema ∪ P.NecAtomicity.schema ∪ P.NecRigidComprehension.schema ⟹
      P.NecRigidPower.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.union (Entails.union
        (Entails.trans (Entails.trans (Entails.union_left _ _) (Entails.union_left _ _))
          P.NecBarcan.schema_entails_listSchema)
        (Entails.trans (Entails.union_left _ _) (Entails.union_left _ _)))
        (Entails.trans (Entails.union_left _ _) (Entails.union_right _ _)))
        (Entails.union_right _ _))
      nbf_natom_nrc_nec_rigid_power.listEntails)


/-- `bf-weak-rigid-comprehension-atomicity-and-relational-choice-imply-intensional-choice`,
by composition: Relational Choice and Weak Rigid Comprehension give Transversal Choice, which
gives Zorn's Lemma and so Well-Ordering; with Weak Rigid Comprehension and BF, Modal
Well-Ordering; and that gives Intensional Choice. Atomicity is not used. -/
theorem bf_weak_rigid_comprehension_atomicity_and_relational_choice_imply_intensional_choice :
    P.Barcan.schema ∪ P.WeakRigidComprehension.schema ∪ P.Atomicity.schema ∪
      P.RelationalChoice.schema ⟹ P.IntensionalChoice.schema :=
  have bf := Entails.trans (Entails.union_left _ _)
    (Entails.trans (Entails.union_left _ _) (Entails.union_left _ _))
  have wrc := Entails.trans (Entails.union_left _ _)
    (Entails.trans (Entails.union_left _ _) (Entails.union_right _ _))
  have rc := Entails.union_right _ _
  have tc := Entails.trans (Entails.union rc wrc)
    Proofs.relational_choice_and_weak_rigid_comprehension_imply_transversal_choice.entails
  have wo := Entails.trans (Entails.trans (Entails.union tc tc)
    Proofs.transversal_choice_r_implies_zorn_r.entails)
    Proofs.zorn_r_implies_well_ordering_r.entails
  Entails.trans (Entails.trans (Entails.union (Entails.union (Entails.union wo wrc) wrc) bf)
    Proofs.well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering.entails)
    Proofs.modal_well_ordering_r_implies_intensional_choice_r.entails


/-- `strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational`, at every
relational type (Cian Dorr): the core at `σ → t`, vectorized. -/
theorem strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational :
    P.StrongAtomicity.schema ∪ P.NecRigidComprehension.schema ∪ P.RigidPower.schema ⟹
      P.BarcanRelational.schema :=
  Entails.mono_right (schema_subset_args _) sl_nrc_rp_bf.listEntails


/-! ### Atomicity and Rigid Comprehension give Rigid Power, at every arity (19 October 2026) -/

/-- `atomicity-and-rigid-comprehension-imply-rigid-power`, at every arity: the core at
`σ → t`, vectorized; its premises are instances at relational types, so nothing is needed over
the list. -/
theorem atomicity_and_rigid_comprehension_imply_rigid_power :
    P.Atomicity.schema ∪ P.RigidComprehension.schema ⟹ P.RigidPower.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.union (Entails.union_left _ _) (Entails.union_right _ _))
        (Entails.union_right _ _))
      atom_rc_rigid_power.listEntails)

/-- `necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power`, at
every arity. -/
theorem necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power :
    P.NecAtomicity.schema ∪ P.NecRigidComprehension.schema ⟹ P.NecRigidPower.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans
      (Entails.union (Entails.union (Entails.union_left _ _) (Entails.union_right _ _))
        (Entails.union_right _ _))
      natom_nrc_nec_rigid_power.listEntails)

/-- `necessary-strong-atomicity-and-necessary-rigid-comprehension-imply-necessary-bf-relational`,
at every relational type: `□`Strong Atomicity gives `□`Atomicity, with `□`Rigid Comprehension
`□`Rigid Power, and Cian Dorr's core, necessitated, gives `□`BF. -/
theorem necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational :
    P.NecStrongAtomicity.schema ∪ P.NecRigidComprehension.schema ⟹ P.NecBarcanRelational.schema :=
  have sl := Entails.union_left P.NecStrongAtomicity.schema P.NecRigidComprehension.schema
  have rc := Entails.union_right P.NecStrongAtomicity.schema P.NecRigidComprehension.schema
  have rp := Entails.trans
    (Entails.union (Entails.trans sl necessary_strong_atomicity_implies_necessary_atomicity) rc)
    necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union sl rc) rp) nsl_nrc_nrp_nbf.listEntails)

end Meta

end Classicism
