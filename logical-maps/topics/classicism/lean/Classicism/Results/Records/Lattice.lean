import Classicism.Paper
import Classicism.Principles
import Classicism.Results.Records.Coarse
import Classicism.Results.Records.Extensionality
import Classicism.Results.Records.Comprehension

/-!
# Proofs of map records: Actuality, Boolean Completeness, Atomicity, Vicinity and Strong Atomicity

Records concluding in the principles of the map's category `lattice`, and the
comprehension principles they give: Classicism, §2.2, Propositions 2.5–2.9 and 2.15, and
n. 42; Vicinity; Inextensible Comprehension from Actuality; Strong Atomicity
Biconditionals (Bacon, §8.2). The records that need `C5` are in `C5.lean`.
The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### Actuality and Boolean Completeness (Classicism, §2.2; Propositions 2.5–2.9, 2.15)

The records among Actuality, Boolean Completeness, Atomicity, the comprehension principles
and Plenitude that a shallow proof reaches. The constructions of a greatest lower bound
and of a comprehension witness are written at type `t` (or `σ → t`), where they are
propositions (or properties); the map's records range over every relational type, and
the paper says "parallel arguments establish the proposition at other relational
types". At a type parameter the shallow layer cannot write `λz̄. ∀Y. X*Y → Y z̄`, so the
uniform statement is one for the metalogical layer, by induction on the arity. -/

/-- `necessary-actuality-implies-actuality`: `T`. -/
theorem necessary_actuality_implies_actuality : NecActuality → Actuality := box_elim

/-- `necessary-boolean-completeness-r-implies-boolean-completeness-r`: `T`. -/
theorem necessary_boolean_completeness_r_implies_boolean_completeness_r {τ : Type} [Rel τ] :
    NecBooleanCompleteness τ → BooleanCompleteness τ := box_elim

/-- `boolean-completeness-r-implies-boolean-completeness-t`: the instance at `t`. -/
theorem boolean_completeness_r_implies_boolean_completeness_t :
    BooleanCompleteness Prop → BooleanCompletenessT := fun h => h

/-- `extensionality-r-implies-actuality`: `⊤` is the witness. By the Fregean Axiom every
truth `q` is `⊤ ∨ q`, which is `⊤ ≤ q`. -/
theorem extensionality_r_implies_actuality : Extensionality Prop → Actuality :=
  fun ext => ⟨True, trivial, fun q hq => ext q (True ∨ q) ⟨fun _ => Or.inl trivial, fun _ => hq⟩⟩

/-- `∀p. Tp → p` and `Tq` give `q`. -/
theorem all_of_T_imp (T : Prop → Prop) (q : Prop) : T q → (∀ p, T p → p) → q := fun h hw => hw q h

/-- `persistent-comprehension-r-implies-actuality` (Classicism, n. 38): take a persistent
`T` coextensive with truth and `w := ∀p. Tp → p`. Then `w` is true; and if `q` is true,
`Tq`, hence `□Tq` by persistence, and `w` entails `q` by `K`. Persistence is all that
is used, not inextensibility. -/
theorem persistent_comprehension_r_implies_actuality :
    PersistentComprehension (Prop → Prop) → Actuality := fun pc =>
  (pc (λ p ↦ p)).elim fun T hT =>
    ⟨∀ p, T p → p, fun p hTp => (hT.2 p).2 hTp, fun q hq =>
      le_of_box_incl (modal_K _ _ (nec% (all_of_T_imp T q))
        (weaklyPersistent_apply (weaklyPersistent_of_persistent hT.1) q ((hT.2 q).1 hq)))⟩

/-- `rigid-comprehension-r-implies-actuality` (Proposition 2.9): through Persistent
Comprehension. -/
theorem rigid_comprehension_r_implies_actuality : RigidComprehension (Prop → Prop) → Actuality :=
  fun rc => persistent_comprehension_r_implies_actuality
    (rigid_comprehension_r_implies_persistent_comprehension_r rc)

/-- With `w` the actual world, `λy. w ≤ Xy` is a persistent coextension of `X`
(Classicism, n. 38): persistent, since entailments are necessary when true, and
coextensive with `X`, since `w` entails exactly the truths. -/
theorem persistent_coext_of_actual_world {σ : Type} [Ty σ] (w : Prop) (hw : ActualWorld w)
    (X : σ → Prop) : Persistent (λ y ↦ w ≤ X y) ∧ X ≡ (λ y ↦ w ≤ X y) :=
  ⟨nec% (le_apply_box w X),
    fun y => ⟨fun hX => hw.2 (X y) hX, fun h => imp_of_le_prop w (X y) h hw.1⟩⟩

/-- `w → ∀y. w ∧ Xy → Zy` gives `∀y. w ∧ Xy → Zy`. -/
theorem imp_of_w_imp {σ : Type} [Ty σ] (w : Prop) (X Z : σ → Prop) :
    (w → ∀ y, w ∧ X y → Z y) → ∀ y, w ∧ X y → Z y := fun h y hy => h hy.1 y hy

/-- With `w` the actual world, `λy. w ∧ Xy` is *weakly* inextensible: if
`∀y. w ∧ Xy → □Zy`, then `∀y. w ∧ Xy → Zy` is a truth, so `w` entails it, which is
`□∀y. w ∧ Xy → Zy` (Classicism, n. 38). The box that `Inextensible` adds would need `w`
to entail the truths at every world, which Actuality does not say. -/
theorem weaklyInextensible_of_actualWorld {σ : Type} [Ty σ] (w : Prop) (hw : ActualWorld w)
    (X : σ → Prop) : WeaklyInextensible (λ y ↦ w ∧ X y) := fun Z hZ =>
  modal_K _ _ (nec% (imp_of_w_imp w X Z))
    ((le_iff_prop _ _).1 (hw.2 _ (fun y hy => box_elim (hZ y hy))))

/-- `actuality-implies-weakly-inextensible-comprehension-r`, at `σ → t`, its list form
being the map's record: with `w` the actual world, `λy. w ∧ Xy` is a weakly inextensible
coextension of `X`. -/
theorem actuality_implies_weakly_inextensible_comprehension_r {σ : Type} [Ty σ] :
    Actuality → WeaklyInextensibleComprehension (σ → Prop) := fun act X =>
  act.elim fun w (hw : ActualWorld w) =>
    ⟨λ y ↦ w ∧ X y, weaklyInextensible_of_actualWorld w hw X,
      fun y => ⟨fun hX => ⟨hw.1, hX⟩, fun h => h.2⟩⟩

/-- `w → Zx` gives `∀y. w ∧ y = x → Zy`. -/
theorem profile_of_w_imp {σ : Type} [Ty σ] (w : Prop) (Z : σ → Prop) (x : σ) :
    (w → Z x) → ∀ y, w ∧ y = x → Z y := fun h y hy => hy.2 ▸ h hy.1

/-- Actuality to its form Actual Profile (Classicism, n. 36), at `σ`, its list form being
the map's record: `λy. w ∧ y = x` is the true profile of `x`, and it entails every `Z`
with `Zx`, since `w` entails `Zx`. -/
theorem actuality_implies_actual_profile_r {σ : Type} [Ty σ] : Actuality → ActualProfile σ :=
  fun act x => act.elim fun w (hw : ActualWorld w) =>
    ⟨λ y ↦ w ∧ y = x, ⟨hw.1, rfl⟩, fun Z hZ =>
      (le_iff _ _).2 (modal_K _ _ (nec% (profile_of_w_imp w Z x))
        ((le_iff_prop _ _).1 (hw.2 (Z x) hZ)))⟩

/-! The greatest lower bound of a property `X` of propositions, from a weakly rigid
`X*` coextensive with it: `U := ∀p. X*p → p` (Classicism, n. 40, at type `t`). -/

/-- `V → ∀q. X*q → q` and `X*p` give `V → p`. -/
theorem meet_imp (T : Prop → Prop) (V p : Prop) : (V → ∀ q, T q → q) → T p → V → p :=
  fun h hT hV => h hV p hT

/-- `∀q. X*q → V → q` gives `V → ∀q. X*q → q`. -/
theorem meet_of_forall_imp (T : Prop → Prop) (V : Prop) : (∀ q, T q → V → q) → V → ∀ q, T q → q :=
  fun h hV q hT => h q hT hV

/-- `∀p. X*p → p` is a greatest lower bound of `X`, for `X*` weakly rigid and
coextensive with `X`. A lower bound `V` of `X` is one of `X*`, so `∀q. X*q → □(V → q)`;
weak inextensibility boxes the universal, `□∀q. X*q → V → q`, which is `V ≤ U`.
Conversely from `V ≤ U` and `X*p`, `□X*p` by weak persistence, and `K` gives `V ≤ p`. -/
theorem glb_of_weaklyRigid (X T : Prop → Prop) (hT : WeaklyRigid T) (hco : X ≡ T) :
    GLB (∀ p, T p → p) X := fun V =>
  ⟨fun hlb => (le_iff_prop _ _).2 (modal_K _ _ (nec% (meet_of_forall_imp T V))
      (hT.2 (λ q ↦ V → q) (fun q hTq => (le_iff_prop _ _).1 (hlb q ((hco q).2 hTq))))),
   fun hle p hXp => (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _ (nec% (meet_imp T V p))
      ((le_iff_prop _ _).1 hle)) (weaklyPersistent_apply hT.1 p ((hco p).1 hXp)))⟩

/-- `weak-rigid-comprehension-r-implies-boolean-completeness-r`, at `t`. -/
theorem weak_rigid_comprehension_r_implies_boolean_completeness_r_at_t :
    WeakRigidComprehension (Prop → Prop) → BooleanCompleteness Prop := fun wrc X =>
  (wrc X).elim fun T hT => ⟨∀ p, T p → p, glb_of_weaklyRigid X T hT.1 hT.2⟩

/-- `rigid-comprehension-r-implies-boolean-completeness-r` (Proposition 2.8), at `t`. -/
theorem rigid_comprehension_r_implies_boolean_completeness_r_at_t :
    RigidComprehension (Prop → Prop) → BooleanCompleteness Prop := fun rc =>
  weak_rigid_comprehension_r_implies_boolean_completeness_r_at_t
    (rigid_comprehension_r_implies_weak_rigid_comprehension_r rc)

/-! At `σ → t` the greatest lower bound of a property `X` of properties is the pointwise
meet `λz. ∀Y. X*Y → Yz` of a weakly rigid coextension `X*`, an ordinary term, and the
argument is the one at `t`, pointwise. Vectorized in `σ` it is the record at every
relational type `σs ⇒* t`, `t` itself the empty list (`Results/Arity.lean`). The records
at `t` above stay for the proofs at `t` that cite them. -/

/-- `∀Y. X*Y → V ⊆ Y` gives `V ⊆ λz. ∀Y. X*Y → Yz`. -/
theorem meet_of_forall_imp_arrow {σ : Type} [Ty σ] (T : (σ → Prop) → Prop) (V : σ → Prop) :
    (∀ Y : σ → Prop, T Y → ∀ z, V z → Y z) → ∀ z, V z → ∀ Y : σ → Prop, T Y → Y z :=
  fun h z hV Y hT => h Y hT z hV

/-- `V ⊆ λz. ∀Y. X*Y → Yz` and `X*Y` give `V ⊆ Y`. -/
theorem meet_imp_arrow {σ : Type} [Ty σ] (T : (σ → Prop) → Prop) (V Y : σ → Prop) :
    (∀ z, V z → ∀ Y' : σ → Prop, T Y' → Y' z) → T Y → ∀ z, V z → Y z :=
  fun h hT z hV => h z hV Y hT

/-- `λz. ∀Y. X*Y → Yz` is a greatest lower bound of `X`, for `X*` weakly rigid and
coextensive with `X`: `glb_of_weaklyRigid` at `σ → t`. -/
theorem glb_of_weaklyRigid_arrow {σ : Type} [Ty σ] (X T : (σ → Prop) → Prop)
    (hT : WeaklyRigid T) (hco : X ≡ T) : GLB (λ z ↦ ∀ Y : σ → Prop, T Y → Y z) X := fun V =>
  ⟨fun hlb => (le_iff _ _).2 (modal_K _ _ (nec% (meet_of_forall_imp_arrow T V))
      (hT.2 (λ Y ↦ ∀ z, V z → Y z) (fun Y hTY => (le_iff _ _).1 (hlb Y ((hco Y).2 hTY))))),
   fun hle Y hXY => (le_iff _ _).2 (modal_K _ _ (modal_K _ _ (nec% (meet_imp_arrow T V Y))
      ((le_iff _ _).1 hle)) (weaklyPersistent_apply hT.1 Y ((hco Y).1 hXY)))⟩

/-- `weak-rigid-comprehension-r-implies-boolean-completeness-r`, at `σ → t`, its list form
being the map's record. -/
theorem weak_rigid_comprehension_r_implies_boolean_completeness_r {σ : Type} [Ty σ] :
    WeakRigidComprehension ((σ → Prop) → Prop) → BooleanCompleteness (σ → Prop) := fun wrc X =>
  (wrc X).elim fun T hT =>
    ⟨λ z ↦ ∀ Y : σ → Prop, T Y → Y z, glb_of_weaklyRigid_arrow X T hT.1 hT.2⟩

/-- `rigid-comprehension-r-implies-boolean-completeness-r` (Proposition 2.8), at `σ → t`,
its list form being the map's record. -/
theorem rigid_comprehension_r_implies_boolean_completeness_r {σ : Type} [Ty σ] :
    RigidComprehension ((σ → Prop) → Prop) → BooleanCompleteness (σ → Prop) := fun rc =>
  weak_rigid_comprehension_r_implies_boolean_completeness_r
    (rigid_comprehension_r_implies_weak_rigid_comprehension_r rc)

/-- `necessary-rigid-comprehension-r-implies-necessary-actuality`: the unboxed record
necessitated, and `K`. -/
theorem necessary_rigid_comprehension_r_implies_necessary_actuality :
    NecRigidComprehension (Prop → Prop) → NecActuality :=
  modal_K _ _ (nec% rigid_comprehension_r_implies_actuality)

/-- `necessary-rigid-comprehension-r-implies-necessary-boolean-completeness-r`, at `σ → t`,
its list form being the map's record: the unboxed record necessitated. -/
theorem necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r
    {σ : Type} [Ty σ] :
    NecRigidComprehension ((σ → Prop) → Prop) → NecBooleanCompleteness (σ → Prop) :=
  modal_K _ _ (nec% (rigid_comprehension_r_implies_boolean_completeness_r (σ := σ)))

/-- `actuality-incompatible-with-atomlessness`: a strongest truth `a` is an atom. It is
possible, so Atomlessness gives a possible `q` strictly below it; `q` is not true, else
`a ≤ q` and antisymmetry make `q = a`; so `a ∧ ¬q` is true, `a ≤ a ∧ ¬q ≤ ¬q`, and with
`q ≤ a`, `q ≤ ¬q`, which makes `q = ⊥`, against its possibility. -/
theorem actuality_incompatible_with_atomlessness : Actuality → Atomlessness → False :=
  fun act atl => act.elim fun a ha => (atl a (dia_intro a ha.1)).elim fun q hq =>
    (em q).elim
      (fun hqt => hq.2.2 (le_antisymm_prop q a hq.2.1 (ha.2 q hqt)))
      (fun hqf => hq.1 (eq_false_of_le_neg q (le_trans_prop q a (¬ q) hq.2.1
        (le_trans_prop a (a ∧ ¬ q) (¬ q) (ha.2 (a ∧ ¬ q) ⟨ha.1, hqf⟩) (and_le_right_prop a (¬ q))))))

/-! Atomicity and BF imply `□`Actuality (Classicism, Proposition 2.7). -/

/-- `w ∧ ∀q. q → w ≤ q` gives Actuality, with `w` as witness. -/
theorem actuality_of_witness (w : Prop) : ActualWorld w → Actuality := fun h => ⟨w, h.1, h.2⟩

/-- Given Tractarianism at `t`, an atom entails Actuality: it entails `q → w ≤ q` for
each `q`, so by Tractarianism it entails `∀q. q → w ≤ q`, and it entails itself. -/
theorem atom_le_actuality (w : Prop) (hw : Atom w) (tr : Tractarianism Prop) : w ≤ Actuality :=
  le_of_le_of_box_imp w _ _
    (le_and_prop w w _ (le_refl_prop w) (tr w (λ q ↦ q → w ≤ q) (fun q => atom_le_imp_le w q hw)))
    (nec% (actuality_of_witness w))

/-- `¬A ≤ ¬¬A` says `¬A = ⊥`, that is `□A`. -/
theorem box_of_neg_le_neg_neg (A : Prop) (h : (¬ A) ≤ (¬ ¬ A)) : □ A := by
  have h' : (¬ A) = False := eq_false_of_le_neg (¬ A) h
  show A = True
  calc A = ¬ ¬ A := (not_not_eq A).symm
    _ = ¬ False := by rw [h']
    _ = True := not_false_eq

/-- `atomicity-t-and-bf-imply-necessary-actuality` (Proposition 2.7): if Actuality is not
necessary, `¬Actuality` is not `⊥`, so by Atomicity at `t` some atom `w` lies below it;
but by BF (through Tractarianism) every atom entails Actuality; so `w ≤ ⊥`, and `w` is
not an atom. -/
theorem atomicity_t_and_bf_imply_necessary_actuality : AtomicityT → Barcan Prop → NecActuality :=
  fun at_ bf =>
    have tr : Tractarianism Prop :=
      functionality_r_implies_tractarianism_r (barcan_r_implies_functionality_r bf)
    (em (□ Actuality)).elim id fun hn =>
      (at_ (¬ Actuality)).elim
        (fun h => absurd (box_of_neg_le_neg_neg Actuality h) hn)
        (fun h => h.elim fun w hw => by
          have h1 : w ≤ (Actuality ∧ ¬ Actuality) :=
            le_and_prop w Actuality (¬ Actuality) (atom_le_actuality w hw.1 tr) hw.2
          rw [and_not_self_eq Actuality] at h1
          exact (not_le_neg_of_atom hw.1 (le_trans_prop w False (¬ w) h1 (bot_le_prop (¬ w)))).elim)

/-- `atomicity-and-bf-imply-necessary-actuality`: only the `t` instance of Atomicity is
used. -/
theorem atomicity_and_bf_imply_necessary_actuality : Atomicity Prop → Barcan Prop → NecActuality :=
  atomicity_t_and_bf_imply_necessary_actuality

/-! The least upper bound of the haecceities `λx. u = x` of the `X`s, at `σ → t`, from
Boolean Completeness, as the greatest lower bound of their upper bounds (n. 42). It holds
necessarily of each `u` with `Xu`, so it is below every property that does; with the
actual world it is coextensive with `X`. -/

/-- `Hu` gives `∀z. u = z → Hz`. -/
theorem haec_imp {σ : Type} [Ty σ] (u : σ) (H : σ → Prop) : H u → ∀ z, u = z → H z :=
  fun h z e => e ▸ h

/-- The haecceity `λx. u = x` is below `H` when `Hu` is necessary. -/
theorem haec_le_of_box {σ : Type} [Ty σ] (u : σ) (H : σ → Prop) (h : □ (H u)) :
    (λ x ↦ u = x) ≤ H :=
  (le_iff _ _).2 (modal_K _ _ (nec% (haec_imp u H)) h)

/-- `(u = u → p) → p`. -/
theorem imp_of_rfl_imp {σ : Type} [Ty σ] (u : σ) (p : Prop) : (u = u → p) → p := fun h => h rfl

/-- The least upper bound `G` of the haecceities of the `X`s, as the greatest lower
bound of their upper bounds, is below every `H` that is necessary of each `X`. -/
theorem lub_haec_le {σ : Type} [Ty σ] (X G : σ → Prop)
    (hG : GLB G (λ w ↦ UB w (λ Y ↦ ∃ u, X u ∧ Y = λ x ↦ u = x)))
    (H : σ → Prop) (hH : X ⊆ boxAt H) : G ≤ H :=
  glb_ub_least _ G hG H fun Y hY => hY.elim fun u hu => by
    rw [hu.2]
    exact haec_le_of_box u H (hH u hu.1)

/-- And `Gu` is necessary for each `X`, `u` (n. 42, (i) and (iii)). -/
theorem box_lub_haec_of {σ : Type} [Ty σ] (X G : σ → Prop)
    (hG : GLB G (λ w ↦ UB w (λ Y ↦ ∃ u, X u ∧ Y = λ x ↦ u = x)))
    (u : σ) (hu : X u) : □ (G u) :=
  modal_K _ _ (nec% (imp_of_rfl_imp u (G u)))
    ((le_iff_prop _ _).1 (le_apply_of_le _ G u (glb_ub_upper _ G hG _ ⟨u, hu, rfl⟩)))

/-- `Gu → Xu`, given the actual world `w` (n. 42, (ii)): `λy. w → Xy` is necessary of
each `X`, so above `G`. -/
theorem lub_haec_imp {σ : Type} [Ty σ] (act : Actuality) (X G : σ → Prop)
    (hG : GLB G (λ w ↦ UB w (λ Y ↦ ∃ u, X u ∧ Y = λ x ↦ u = x)))
    (u : σ) (hu : G u) : X u :=
  act.elim fun w (hw : ActualWorld w) =>
    imp_of_le_prop (G u) (w → X u)
      (le_apply_of_le G (λ y ↦ w → X y) u
        (lub_haec_le X G hG _ fun v hv => (le_iff_prop _ _).1 (hw.2 (X v) hv))) hu hw.1

/-- `completeness-and-actuality-imply-weak-rigid-comprehension`, at `σ → t`, its list form
being the map's record: the least upper bound `G` of the haecceities of the `X`s is a
weakly rigid coextension of `X`. It is persistent, being below `λx. □Gx`, which holds
necessarily of each `X`-thing by `4`; and weakly inextensible, being below any `Z` with
`G ⊆ □Z`, which holds necessarily of each `X`-thing. -/
theorem completeness_and_actuality_imply_weak_rigid_comprehension {σ : Type} [Ty σ] :
    BooleanCompleteness (σ → Prop) → Actuality → WeakRigidComprehension (σ → Prop) :=
  fun bc act X =>
    (bc (λ W ↦ UB W (λ Y ↦ ∃ u, X u ∧ Y = λ x ↦ u = x))).elim fun G hG =>
      have hco : X ≡ G := fun u =>
        ⟨fun hu => box_elim (box_lub_haec_of X G hG u hu), lub_haec_imp act X G hG u⟩
      ⟨G, ⟨box_elim ((le_iff _ _).1 (lub_haec_le X G hG (boxAt G)
            fun u hu => modal_four _ (box_lub_haec_of X G hG u hu))),
          fun Z hZ => (le_iff _ _).1 (lub_haec_le X G hG Z
            fun u hu => hZ u ((hco u).1 hu))⟩, hco⟩

/-- `atomicity-r-implies-atomicity-t`: the `t`-instance. -/
theorem atomicity_r_implies_atomicity_t : Atomicity Prop → AtomicityT := fun h => h
/-- `strong-atomicity-r-implies-strong-atomicity-t`: the `t`-instance. -/
theorem strong_atomicity_r_implies_strong_atomicity_t : StrongAtomicity Prop → StrongAtomicityT :=
  fun h => h
/-- `necessary-strong-atomicity-r-implies-necessary-strong-atomicity-t`. -/
theorem necessary_strong_atomicity_r_implies_necessary_strong_atomicity_t :
    NecStrongAtomicity Prop → NecStrongAtomicityT := fun h => h

/-- `necessary-atomicity-r-implies-atomicity-r`: `T`. -/
theorem necessary_atomicity_r_implies_atomicity_r {τ : Type} [Rel τ] :
    NecAtomicity τ → Atomicity τ := box_elim
/-- `necessary-strong-atomicity-t-implies-strong-atomicity-t`: `T`. -/
theorem necessary_strong_atomicity_t_implies_strong_atomicity_t : NecStrongAtomicityT → StrongAtomicityT :=
  box_elim

/-- `extensionality-r-implies-boolean-completeness-r` (Classicism, n. 33), at `σ → t`, its
list form being the map's record: under the Fregean Axiom (the nullary instance) every
truth is necessary, so the order is pointwise implication, and `λz. ∀Y. XY → Yz` is a
greatest lower bound outright. -/
theorem extensionality_r_implies_boolean_completeness_r {σ : Type} [Ty σ] :
    Extensionality Prop → BooleanCompleteness (σ → Prop) := fun ext X =>
  ⟨λ z ↦ ∀ Y : σ → Prop, X Y → Y z, fun V =>
    ⟨fun hlb => (le_iff _ _).2 (box_of_fregean ext _
        (fun z hV Y hXY => box_elim ((le_iff _ _).1 (hlb Y hXY)) z hV)),
     fun hle Y hXY => (le_iff _ _).2 (box_of_fregean ext _
        (fun z hV => box_elim ((le_iff _ _).1 hle) z hV Y hXY))⟩⟩

/-- `atomicity-t-incompatible-with-atomlessness`: an atom below `⊤` has nothing possible
strictly below it. -/
theorem atomicity_t_incompatible_with_atomlessness : AtomicityT → Atomlessness → False :=
  fun at_ atl => ((at_ True).elim
    (fun h => absurd (eq_false_of_le_neg True h) (fun e => e ▸ trivial))
    (fun h => h.elim fun q hq =>
      have hdq : ◇ q := fun e => not_le_neg_of_atom hq.1 (le_neg_of_eq_false q e)
      (atl q hdq).elim fun r hr =>
        hr.1 (eq_false_of_le_neg r ((hq.1 r).1 ⟨hr.2.1, hr.2.2⟩))))

/-- `strong-atomicity-t-implies-atomicity-t`: a strong atom is a weak one, `T`, hence an
atom. -/
theorem strong_atomicity_t_implies_atomicity_t : StrongAtomicityT → AtomicityT := fun sl x =>
  (em (x ≤ ¬ x)).elim Or.inl fun hx =>
    have hne : x ≠ False := fun e => hx (le_neg_of_eq_false x e)
    (sl x hne).elim fun w hw => Or.inr ⟨w, atom_of_decides w ⟨hw.1.1, box_elim hw.1.2⟩, hw.2⟩

/-- `atomicity-t-and-bf-t-imply-strong-atomicity-t`: an atom below `p` decides every `q`,
each decision is necessary, and BF at `t` boxes the quantifier. -/
theorem atomicity_t_and_bf_t_imply_strong_atomicity_t : AtomicityT → BarcanT → StrongAtomicityT :=
  fun at_ bf p hp => ((at_ p).elim (fun h => absurd h (not_le_neg_of_ne_false p hp))
    (fun h => h.elim fun w hw =>
      ⟨w, ⟨fun e => not_le_neg_of_atom hw.1 (le_neg_of_eq_false w e),
        bf (λ q ↦ w ≤ q ∨ w ≤ ¬ q) fun q => box_le_or_le w q (atom_le_or_le_neg w q hw.1)⟩, hw.2⟩))

/-- `necessary-atomicity-and-necessary-bf-t-imply-necessary-strong-atomicity-t`. -/
theorem necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t :
    NecAtomicity Prop → NecBarcanT → NecStrongAtomicityT := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% atomicity_t_and_bf_t_imply_strong_atomicity_t) h₁) h₂

/-- `necessary-actuality-implies-necessary-weakly-inextensible-comprehension-r`, at `σ → t`:
the unboxed record necessitated, and `K`. -/
theorem necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r
    {σ : Type} [Ty σ] : NecActuality → NecWeaklyInextensibleComprehension (σ → Prop) :=
  modal_K _ _ (nec% (actuality_implies_weakly_inextensible_comprehension_r (σ := σ)))

/-- `(∀z. Sz → Zz) → ∀z. Sz ∧ Xz → Zz`. -/
theorem and_imp_of_imp {σ : Type} [Ty σ] (S X Z : σ → Prop) :
    (∀ z, S z → Z z) → ∀ z, S z ∧ X z → Z z := fun h z hz => h z hz.1

/-- `boolean-completeness-r-implies-weakly-inextensible-comprehension-r`, at `σ → t`, its
list form being the map's record: with `S` the least upper bound of the haecceities of the
`X`s, `λz. Sz ∧ Xz` is coextensive with `X`, and below any `Z` with `Y ⊆ □Z`, since such
a `Z` holds necessarily of each `X`-thing and so is above `S`. -/
theorem boolean_completeness_r_implies_weakly_inextensible_comprehension_r {σ : Type} [Ty σ] :
    BooleanCompleteness (σ → Prop) → WeaklyInextensibleComprehension (σ → Prop) := fun bc X =>
  (bc (λ W ↦ UB W (λ Y ↦ ∃ u, X u ∧ Y = λ x ↦ u = x))).elim fun S hS =>
    ⟨λ z ↦ S z ∧ X z,
      fun Z hZ => modal_K _ _ (nec% (and_imp_of_imp S X Z))
        ((le_iff _ _).1 (lub_haec_le X S hS Z fun u hu =>
          hZ u ⟨box_elim (box_lub_haec_of X S hS u hu), hu⟩)),
      fun u => ⟨fun hu => ⟨box_elim (box_lub_haec_of X S hS u hu), hu⟩, fun h => h.2⟩⟩

/-! ### Vicinity (27 September) -/

/-- `actuality-implies-vicinity`: an actual world entails each truth, hence its
possibility. -/
theorem actuality_implies_vicinity : Actuality → Vicinity := fun act =>
  act.elim fun w hw => ⟨w, hw.1, fun q hq => (le_iff_prop _ _).2
    (modal_K _ _ (nec% (imp_dia_of_imp w q)) ((le_iff_prop _ _).1 (hw.2 q hq)))⟩

/-- `◇q → ⊤ → ◇q`. -/
theorem dia_imp_true_imp (q : Prop) : ◇ q → True → ◇ q := fun h _ => h

/-- `distinctness-necessary-t-implies-vicinity`: a truth is distinct from `⊥`, necessarily
so by `ND` at `t`; so `⊤` entails its possibility. -/
theorem distinctness_necessary_t_implies_vicinity : NecessityOfDistinctnessT → Vicinity :=
  fun nd => ⟨True, trivial, fun q hq => (le_iff_prop _ _).2
    (modal_K _ _ (nec% (dia_imp_true_imp q)) (nd q False (fun e => (e ▸ hq : False))))⟩

/-- `necessary-distinctness-necessary-t-implies-necessary-vicinity`: necessitated, and `K`. -/
theorem necessary_distinctness_necessary_t_implies_necessary_vicinity :
    NecNecessityOfDistinctnessT → NecVicinity :=
  modal_K _ _ (nec% distinctness_necessary_t_implies_vicinity)

/-- `necessary-actuality-implies-necessary-vicinity`: necessitated, and `K`. -/
theorem necessary_actuality_implies_necessary_vicinity : NecActuality → NecVicinity :=
  modal_K _ _ (nec% actuality_implies_vicinity)

/-- `necessary-vicinity-implies-vicinity`: `T`. -/
theorem necessary_vicinity_implies_vicinity : NecVicinity → Vicinity := fun h => box_elim h

/-- `vicinity-and-distinctness-preserving-collapse-imply-actuality`: the witness of
Vicinity entails `◇q` for the true `q` the collapse gives with `◇q ≤ p`, so it entails
each truth `p`. -/
theorem vicinity_and_distinctness_preserving_collapse_imply_actuality :
    Vicinity → DistinctnessPreservingCollapse → Actuality := fun vic col =>
  vic.elim fun w hw => ⟨w, hw.1, fun p hp => (col p hp).elim fun q hq =>
    le_trans_prop w (◇ q) p (hw.2 q hq.1) ((le_iff_prop _ _).2 hq.2)⟩

/-- `(∀p. Fp → w → ◇(q ∧ p))` and `w ∧ ∀p. p ↔ Fp` give `q`: else `F¬q`, and `◇(q ∧ ¬q)`. -/
theorem actual_of_vicinity_inext (F : Prop → Prop) (w q : Prop) :
    (∀ p, F p → w → ◇ (q ∧ p)) → (w ∧ ∀ p, p ↔ F p) → q := fun h ha =>
  (em q).elim id fun hnq => (not_dia_and_not q (h (¬ q) ((ha.2 (¬ q)).1 hnq) ha.1)).elim

/-- `vicinity-and-weakly-inextensible-comprehension-imply-actuality`: with `w` the witness
of Vicinity and `F` a weakly inextensible coextension of `λp. p`, `w ∧ ∀p. p ↔ Fp` is an
actual world. For a truth `q`, each `Fp` makes `q ∧ p` true, so `w ≤ ◇(q ∧ p)`; weak
inextensibility boxes that, and at `p := ¬q` it refutes `w ∧ F¬q`. -/
theorem vicinity_and_weakly_inextensible_comprehension_imply_actuality :
    Vicinity → WeaklyInextensibleComprehension (Prop → Prop) → Actuality := fun vic wic =>
  vic.elim fun w hw => (wic (λ p ↦ p)).elim fun F hF =>
    ⟨w ∧ ∀ p, p ↔ F p, ⟨hw.1, hF.2⟩, fun q hq => (le_iff_prop _ _).2
      (modal_K _ _ (nec% (actual_of_vicinity_inext F w q))
        (hF.1 (λ p ↦ w → ◇ (q ∧ p)) fun p hFp =>
          (le_iff_prop _ _).1 (hw.2 (q ∧ p) ⟨hq, (hF.2 p).2 hFp⟩)))⟩

/-- `necessary-vicinity-and-necessary-weakly-inextensible-comprehension-imply-necessary-actuality`:
the unboxed record necessitated, and `K`. -/
theorem necessary_vicinity_and_necessary_weakly_inextensible_comprehension_imply_necessary_actuality :
    NecVicinity → NecWeaklyInextensibleComprehension (Prop → Prop) → NecActuality :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% vicinity_and_weakly_inextensible_comprehension_imply_actuality) h₁) h₂

/-! ### Inextensible Comprehension from Actuality (25–27 September)

At `σ → t`, the list forms being the records at every arity. -/

/-- `(◇a → ActualWorld a)` makes `λy. a ∧ Xy` weakly inextensible: where `◇a`, by the
actual world; where not, `□¬a` makes it entail anything. -/
theorem weaklyInextensible_of_dia_actual {σ : Type} [Ty σ] (a : Prop) (X : σ → Prop) :
    (◇ a → ActualWorld a) → WeaklyInextensible (λ y ↦ a ∧ X y) := fun h =>
  (em (◇ a)).elim (fun hd => weaklyInextensible_of_actualWorld a (h hd) X)
    (fun hnd => fun Z _ => modal_K _ _
      (nec% (fun (hna : ¬ a) (y : σ) (hy : a ∧ X y) => (hna hy.1).elim : ¬ a → ∀ y, a ∧ X y → Z y))
      (box_not_of_not_dia a hnd))

/-- `actuality-and-distinctness-preserving-collapse-imply-inextensible-comprehension`, at
`σ → t`: with `a` the actual world, the collapse makes `◇a → ActualWorld a` necessary, so
`λy. a ∧ Xy`, weakly inextensible wherever that holds, is inextensible. -/
theorem actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension
    {σ : Type} [Ty σ] :
    Actuality → DistinctnessPreservingCollapse → InextensibleComprehension (σ → Prop) :=
  fun act col X => act.elim fun a (ha : ActualWorld a) => (col (ActualWorld a) ha).elim
    fun q hq =>
      have h₁ : □ (◇ a → ◇ q) := modal_K _ _ (nec% (dia_mono a q))
        (modal_four _ ((le_iff_prop _ _).1 (ha.2 q hq.1)))
      have h₂ : □ (◇ a → ActualWorld a) := modal_K _ _ (modal_K _ _
        (nec% (fun (f : ◇ a → ◇ q) (g : ◇ q → ActualWorld a) (h : ◇ a) => g (f h))) h₁) hq.2
      ⟨λ y ↦ a ∧ X y, modal_K _ _ (nec% (weaklyInextensible_of_dia_actual a X)) h₂,
        fun y => ⟨fun hx => ⟨ha.1, hx⟩, fun h => h.2⟩⟩

/-- `(w → ¬p) → ¬(w ∧ p)`. -/
theorem not_and_of_imp_not (w p : Prop) : (w → ¬ p) → ¬ (w ∧ p) := fun h hwp => h hwp.1 hwp.2

/-- With `BF` at `σ`, `λz. ◇(w ∧ Fz)` is weakly inextensible: its negation is persistent,
by `4`, so `Cz → □Xz` gives `□(Cz → Xz)` at each `z`, and BF boxes the quantifier. -/
theorem weaklyInextensible_dia_of_bf {σ : Type} [Ty σ] (w : Prop) (F : σ → Prop) :
    P.Barcan σ → WeaklyInextensible (λ z ↦ ◇ (w ∧ F z)) := fun bf X hX =>
  bf (λ z ↦ ◇ (w ∧ F z) → X z) fun z =>
    (em (◇ (w ∧ F z))).elim (fun hc => box_imp_of_box _ _ (hX z hc))
      (fun hn => box_imp_of_box_not _ _ (modal_K _ _ (nec% (not_dia_of_box_not (w ∧ F z)))
        (modal_four _ (box_not_of_not_dia _ hn))))

/-- With `w` the actual world, `λz. ◇(w ∧ Fz)` is coextensive with `F`. -/
theorem coext_dia_actual {σ : Type} [Ty σ] (w : Prop) (hw : ActualWorld w) (F : σ → Prop) :
    ∀ z, F z ↔ ◇ (w ∧ F z) := fun z =>
  ⟨fun h => dia_intro _ ⟨hw.1, h⟩, fun h => (em (F z)).elim id fun hn =>
    (not_dia_of_box_not _ (modal_K _ _ (nec% (not_and_of_imp_not w (F z)))
      ((le_iff_prop _ _).1 (hw.2 _ hn))) h).elim⟩

/-- `necessary-bf-and-actuality-imply-inextensible-comprehension`, at `σ → t`: with `w`
the actual world, `λz. ◇(w ∧ Fz)` is coextensive with `F`, and weakly inextensible
wherever BF at `σ` holds, so inextensible given `□BF`. -/
theorem necessary_bf_and_actuality_imply_inextensible_comprehension {σ : Type} [Ty σ] :
    NecBarcan σ → Actuality → InextensibleComprehension (σ → Prop) := fun hbf act X =>
  act.elim fun w (hw : ActualWorld w) =>
    ⟨λ z ↦ ◇ (w ∧ X z), modal_K _ _ (nec% (weaklyInextensible_dia_of_bf w X)) hbf,
      coext_dia_actual w hw X⟩

/-- `(∀x. ¬Yx) → ¬∃x. Yx`. -/
theorem not_exists_of_forall_not' {τ : Type} [Ty τ] (Y : τ → Prop) :
    (∀ x, ¬ Y x) → ¬ ∃ x, Y x := fun h hx => hx.elim fun x hy => h x hy

/-- `¬(∀z. Cz → Xz) → ∃z. Cz ∧ ¬Xz`. -/
theorem exists_not_of_not_forall' {σ : Type} [Ty σ] (C X : σ → Prop) :
    ¬ (∀ z, C z → X z) → ∃ z, C z ∧ ¬ X z := fun h =>
  (em (∃ z, C z ∧ ¬ X z)).elim id fun hn =>
    (h fun z hc => (em (X z)).elim id fun hx => (hn ⟨z, hc, hx⟩).elim).elim

/-- A property that is not weakly inextensible has an `X` boxed on it that it possibly
exceeds. -/
theorem not_weaklyInextensible {σ : Type} [Ty σ] (C : σ → Prop) :
    ¬ WeaklyInextensible C →
      ∃ X : σ → Prop, (∀ z, C z → □ (X z)) ∧ ◇ (∃ z, C z ∧ ¬ X z) := fun h =>
  (em (∃ X : σ → Prop, (∀ z, C z → □ (X z)) ∧ ◇ (∃ z, C z ∧ ¬ X z))).elim id fun hn =>
    (h fun X hX => (em (□ (∀ z, C z → X z))).elim id fun hb =>
      (hn ⟨X, hX, dia_mono _ _ (nec% (exists_not_of_not_forall' C X))
        (dia_not_of_not_box _ hb)⟩).elim).elim

/-- `(∃z'. ◇(w ∧ Fz') ∧ ¬Xz') → ◇w`. -/
theorem dia_of_exists_dia_and {σ : Type} [Ty σ] (w : Prop) (F X : σ → Prop) :
    (∃ z', ◇ (w ∧ F z') ∧ ¬ X z') → ◇ ◇ w := fun h =>
  h.elim fun z' hz => dia_intro _ (dia_mono _ _ (nec% (fun (h : w ∧ F z') => h.1)) hz.1)

/-- Where `X` is boxed on `C := λz. ◇(w ∧ Fz)` and possibly exceeded by it, `◇w` holds;
so `◇w → Cz` and `◇w → ◇¬Xz` cannot both hold there. -/
theorem inext_dia_contra {σ : Type} [Ty σ] (w : Prop) (F X : σ → Prop) (z : σ) :
    (◇ w → ◇ (w ∧ F z)) → (◇ w → ◇ (¬ X z)) →
      ¬ ((∀ z', ◇ (w ∧ F z') → □ (X z')) ∧ ◇ (∃ z', ◇ (w ∧ F z') ∧ ¬ X z')) :=
  fun h₂ h₃ hΦ =>
    have hdw : ◇ w := dia_dia w (dia_dia _ (dia_mono _ _ (nec% (dia_of_exists_dia_and w F X)) hΦ.2))
    h₃ hdw (not_eq_false_of_box _ (hΦ.1 z (h₂ hdw)))

/-- `actuality-and-bf-imply-inextensible-comprehension`, at `σ → t`, its list form being
the map's record: with `w` the actual world, `C := λz. ◇(w ∧ Fz)` is coextensive with
`F`, and inextensible. Were it possibly not weakly inextensible, BF at the type of
properties and at `σ` would give an actual `X` and `z` with `Fz`, `◇¬Xz`, and possibly `X`
boxed on `C` and exceeded by it; but `w` entails `Fz` and `◇¬Xz`, so by `4` wherever `◇w`
both `Cz` and `◇¬Xz` hold, which refutes that possibility. -/
theorem actuality_and_bf_imply_inextensible_comprehension {σ : Type} [Ty σ] :
    Actuality → P.Barcan (σ → Prop) → P.Barcan σ → InextensibleComprehension (σ → Prop) :=
  fun act bf₁ bf X => act.elim fun w (hw : ActualWorld w) =>
    ⟨λ z ↦ ◇ (w ∧ X z), (em (□ (WeaklyInextensible (λ z ↦ ◇ (w ∧ X z))))).elim id fun hn =>
      ((dia_exists_of_bf bf₁ _ (dia_mono _ _
          (nec% (not_weaklyInextensible (λ z ↦ ◇ (w ∧ X z)))) (dia_not_of_not_box _ hn))).elim
        fun Y hY =>
          (dia_exists_of_bf bf _ (dia_dia _ (dia_mono _ _
              (nec% (fun (h : (∀ z, ◇ (w ∧ X z) → □ (Y z)) ∧ ◇ (∃ z, ◇ (w ∧ X z) ∧ ¬ Y z)) =>
                h.2)) hY))).elim fun z hz =>
            have hC : ◇ (w ∧ X z) := dia_dia _
              (dia_mono _ _ (nec% (fun (h : ◇ (w ∧ X z) ∧ ¬ Y z) => h.1)) hz)
            have hnY : ◇ (¬ Y z) := dia_mono _ _ (nec% (fun (h : ◇ (w ∧ X z) ∧ ¬ Y z) => h.2)) hz
            have f₂ : □ (◇ w → ◇ (w ∧ X z)) := modal_K _ _ (nec% (dia_mono w (w ∧ X z)))
              (modal_four _ (modal_K _ _ (nec% (fun (h : w → X z) (h' : w) => (⟨h', h h'⟩ : w ∧ X z)))
                ((le_iff_prop _ _).1 (hw.2 _ ((coext_dia_actual w hw X z).2 hC)))))
            have f₃ : □ (◇ w → ◇ (¬ Y z)) := modal_K _ _
              (nec% (fun (f : ◇ w → ◇ ◇ (¬ Y z)) (h : ◇ w) => dia_dia _ (f h)))
              (modal_K _ _ (nec% (dia_mono w (◇ (¬ Y z))))
                (modal_four _ ((le_iff_prop _ _).1 (hw.2 _ hnY))))
            hY ((box_not_eq _).mp (modal_K _ _ (modal_K _ _
              (nec% (inext_dia_contra w X Y z)) f₂) f₃))).elim,
      coext_dia_actual w hw X⟩

/-! ### Strong Atomicity (22–26 September)

At `σ → t` where the principle is over relational types, the list forms being the records
at every arity (`Results/Arity.lean`). -/

/-- `necessary-strong-atomicity-r-implies-strong-atomicity-r`: `T`. -/
theorem necessary_strong_atomicity_r_implies_strong_atomicity_r {τ : Type} [Rel τ] :
    NecStrongAtomicity τ → StrongAtomicity τ := fun h => box_elim h

/-- `strong-atomicity-r-implies-atomicity-r`, at `σ → t`, its list form being the map's
record: a strong atom decides every property, by `T`, so it is an atom. -/
theorem strong_atomicity_r_implies_atomicity_r {σ : Type} [Ty σ] :
    StrongAtomicity (σ → Prop) → Atomicity (σ → Prop) := fun sl X =>
  (em (X ≤ ¬ X)).elim Or.inl fun hX => Or.inr
    ((sl X fun e => hX (by rw [e]; exact bot_le_arrow _)).elim fun W hW =>
      ⟨W, atom_of_decides_arrow W hW.1.1 (box_elim hW.1.2), hW.2⟩)

/-- `atomicity-and-bf-imply-strong-atomicity`, at `σ → t`, its list form being the map's
record: an atom below a non-bottom property decides every property, each decision is
necessary, and BF at the type of properties boxes the quantifier. -/
theorem atomicity_and_bf_imply_strong_atomicity {σ : Type} [Ty σ] :
    Atomicity (σ → Prop) → Barcan (σ → Prop) → StrongAtomicity (σ → Prop) := fun at_ bf X hX =>
  (at_ X).elim (fun h => (hX (eq_bot_of_le_neg_arrow X h)).elim) fun h => h.elim fun W hW =>
    ⟨W, ⟨fun e => not_le_neg_of_atom hW.1 (by rw [e]; exact bot_le_arrow _),
      bf (λ Y ↦ W ≤ Y ∨ W ≤ ¬ Y) fun Y => box_le_or_le_arrow W Y (atom_decides_arrow W Y hW.1)⟩,
     hW.2⟩

/-- `necessary-strong-atomicity-implies-necessary-atomicity`, at `σ → t`. -/
theorem necessary_strong_atomicity_implies_necessary_atomicity {σ : Type} [Ty σ] :
    NecStrongAtomicity (σ → Prop) → NecAtomicity (σ → Prop) :=
  modal_K _ _ (nec% (strong_atomicity_r_implies_atomicity_r (σ := σ)))

/-- `necessary-atomicity-and-necessary-bf-imply-necessary-strong-atomicity`, at `σ → t`. -/
theorem necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity {σ : Type} [Ty σ] :
    NecAtomicity (σ → Prop) → NecBarcan (σ → Prop) → NecStrongAtomicity (σ → Prop) :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% (atomicity_and_bf_imply_strong_atomicity (σ := σ))) h₁) h₂

/-- A true proposition deciding every proposition is an actual world. -/
theorem actuality_of_decides (w : Prop) : (∀ q, w ≤ q ∨ w ≤ ¬ q) → w → Actuality :=
  fun h hw => ⟨w, hw, fun q hq => (h q).elim id fun hn => (imp_of_le_prop w (¬ q) hn hw hq).elim⟩

/-- `(w → A) → (w → ¬A) → ¬w`. -/
theorem not_of_imp_both (w A : Prop) : (w → A) → (w → ¬ A) → ¬ w := fun h₁ h₂ hw => h₂ hw (h₁ hw)

/-- `strong-atomicity-t-implies-necessary-actuality`: a strong atom entails Actuality, since
where it holds it decides every truth; so were Actuality possibly false, a strong atom
below its negation would entail both, and be `⊥`. -/
theorem strong_atomicity_t_implies_necessary_actuality : StrongAtomicityT → NecActuality := fun sl =>
  (em (□ Actuality)).elim id fun hn =>
    (sl (¬ Actuality) (dia_not_of_not_box _ hn)).elim fun w hw =>
      (hw.1.1 ((box_not_eq w).mp (modal_K _ _ (modal_K _ _ (nec% (not_of_imp_both w Actuality))
        (modal_K _ _ (nec% (actuality_of_decides w)) hw.1.2))
        ((le_iff_prop _ _).1 hw.2)))).elim

/-- A strong atom is possible. -/
theorem dia_of_satom (w : Prop) : SAtom w → ◇ w := fun h => h.1

/-- Under 5, a strong atom is necessarily one: 5 boxes its possibility, 4 its decisions. -/
theorem box_satom_of_five (five : ModalFive) (w : Prop) (h : SAtom w) : □ (SAtom w) :=
  (box_and_eq (◇ w) (□ (∀ Y : Prop, w ≤ Y ∨ w ≤ ¬ Y))).mpr ⟨five w h.1, modal_four _ h.2⟩

/-- A necessarily strong atom, where it holds, makes some necessarily strong atom true. -/
theorem not_of_box_satom (w : Prop) :
    □ (SAtom w) → (w → ¬ ∃ v : Prop, □ (SAtom v) ∧ v) → ¬ w :=
  fun hs hi hw => hi hw ⟨w, hs, hw⟩

/-- A true, necessarily strong atom entails each truth and is necessarily possible, so
every truth is necessarily possible: B. -/
theorem modal_b_of_true_box_satom : (∃ v : Prop, □ (SAtom v) ∧ v) → ModalB := fun h p hp =>
  h.elim fun v hv =>
    ((box_elim (box_elim hv.1).2) p).elim
      (fun hle => modal_K _ _ (modal_K _ _ (nec% (dia_mono v p))
          (modal_four _ ((le_iff_prop _ _).1 hle)))
        (modal_K _ _ (nec% (dia_of_satom v)) hv.1))
      (fun hle => (imp_of_le_prop v (¬ p) hle hv.2 hp).elim)

/-- Under 5 and Strong Atomicity at `t`, necessarily some necessarily strong
atom is true: were that possibly false, a strong atom would entail its falsity, though
wherever that world holds it is itself such a world. -/
theorem box_true_box_satom (five : ModalFive) (sl : StrongAtomicityT) :
    □ (∃ v : Prop, □ (SAtom v) ∧ v) :=
  (em (□ (∃ v : Prop, □ (SAtom v) ∧ v))).elim id fun hn =>
    (sl _ (dia_not_of_not_box _ hn)).elim fun w hw =>
      (hw.1.1 ((box_not_eq w).mp (modal_K _ _ (modal_K _ _ (nec% (not_of_box_satom w))
        (modal_four _ (box_satom_of_five five w hw.1)))
        ((le_iff_prop _ _).1 hw.2)))).elim

/-- `five-and-strong-atomicity-t-imply-necessary-b`: necessitate the passage from a true
necessarily strong atom to B, and apply `K`. -/
theorem five_and_strong_atomicity_t_imply_necessary_b : ModalFive → StrongAtomicityT → NecModalB :=
  fun five sl => modal_K _ _ (nec% modal_b_of_true_box_satom) (box_true_box_satom five sl)

/-- `(w ∧ x = x) = w`. -/
theorem and_rfl_eq {σ : Type} [Ty σ] (w : Prop) (x : σ) : (w ∧ x = x) = w :=
  propext ⟨fun h => h.1, fun h => ⟨h, rfl⟩⟩

/-- `w ≤ Yx` gives `(λy. w ∧ y = x) ≤ Y`, by Leibniz's law. -/
theorem pin_le_of_le {σ : Type} [Ty σ] (w : Prop) (x : σ) (Y : σ → Prop) (h : w ≤ Y x) :
    (λ y ↦ w ∧ y = x) ≤ Y :=
  (le_iff _ _).2 (modal_K _ _
    (nec% (fun (f : w → Y x) (y : σ) (hy : w ∧ y = x) => (hy.2 ▸ f hy.1 : Y y)))
    ((le_iff_prop _ _).1 h))

/-- A proposition deciding every proposition, pinned at `x`, decides every property. -/
theorem pin_decides {σ : Type} [Ty σ] (w : Prop) (x : σ) :
    (∀ q : Prop, w ≤ q ∨ w ≤ ¬ q) →
      ∀ Y : σ → Prop, (λ y ↦ w ∧ y = x) ≤ Y ∨ (λ y ↦ w ∧ y = x) ≤ ¬ Y := fun h Y =>
  (h (Y x)).elim (fun h₁ => Or.inl (pin_le_of_le w x Y h₁))
    (fun h₂ => Or.inr (pin_le_of_le w x (¬ Y) h₂))

/-- Strong Atomicity at `t` and BF at `σ` give Strong Atomicity at `σ → t`: a non-bottom `X`
is possibly instantiated, BF gives `x` with `◇Xx`, a strong atom `w` at `t` lies below
`Xx`, and `λy. w ∧ y = x` is a strong atom below `X`. Not a record of the map, which has
its necessitation. -/
theorem strong_atomicity_t_and_bf_imply_strong_atomicity {σ : Type} [Ty σ] :
    StrongAtomicityT → Barcan σ → StrongAtomicity (σ → Prop) := fun sl bf X hX =>
  (dia_exists_of_bf bf X (dia_exists_of_ne_bot X hX)).elim fun x hx =>
    (sl (X x) hx).elim fun w hw =>
      ⟨λ y ↦ w ∧ y = x,
        ⟨fun e => hw.1.1 ((and_rfl_eq w x).symm.trans (congrFun e x)),
          modal_K _ _ (nec% (pin_decides w x)) hw.1.2⟩,
        pin_le_of_le w x X hw.2⟩

/-- `atomicity-t-and-bf-imply-atomicity`, at `σ → t`, its list form being the map's record
(Cian Dorr, 23 September): a non-bottom `X` is possibly instantiated, BF gives `x` with
`◇Xx`, Atomicity at `t` an atom `w ≤ Xx`, which decides every proposition; so
`λy. w ∧ y = x` decides every property, and is an atom below `X`. -/
theorem atomicity_t_and_bf_imply_atomicity {σ : Type} [Ty σ] :
    AtomicityT → Barcan σ → Atomicity (σ → Prop) := fun at_ bf X =>
  (em (X ≤ ¬ X)).elim Or.inl fun hX => Or.inr <|
    (dia_exists_of_bf bf X
        (dia_exists_of_ne_bot X fun e => hX (by rw [e]; exact bot_le_arrow _))).elim fun x hx =>
      ((at_ (X x)).elim (fun h => (hx (eq_false_of_le_neg _ h)).elim) id).elim fun w hw =>
        ⟨λ y ↦ w ∧ y = x,
          atom_of_decides_arrow _
            (fun e => not_le_neg_of_atom hw.1
              (le_neg_of_eq_false w ((and_rfl_eq w x).symm.trans (congrFun e x))))
            (pin_decides w x fun q => atom_le_or_le_neg w q hw.1),
          pin_le_of_le w x X hw.2⟩

/-- `necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity`, at `σ → t`,
its list form being the map's record: the last theorem necessitated, and `K`. -/
theorem necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity
    {σ : Type} [Ty σ] :
    NecStrongAtomicityT → NecBarcan σ → NecStrongAtomicity (σ → Prop) := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% (strong_atomicity_t_and_bf_imply_strong_atomicity (σ := σ))) h₁) h₂


/-! ### Atomicity and Boolean Completeness at `t`, boxed -/

/-- `necessary-atomicity-t-implies-atomicity-t`: `T`. -/
theorem necessary_atomicity_t_implies_atomicity_t : NecAtomicityT → AtomicityT := box_elim
/-- `necessary-boolean-completeness-t-implies-boolean-completeness-t`: `T`. -/
theorem necessary_boolean_completeness_t_implies_boolean_completeness_t :
    NecBooleanCompletenessT → BooleanCompletenessT := box_elim
/-- `necessary-atomicity-r-implies-necessary-atomicity-t`: the instance at `t`. -/
theorem necessary_atomicity_r_implies_necessary_atomicity_t :
    NecAtomicity Prop → NecAtomicityT := fun h => h
/-- `necessary-boolean-completeness-r-implies-necessary-boolean-completeness-t`: the instance
at `t`. -/
theorem necessary_boolean_completeness_r_implies_necessary_boolean_completeness_t :
    NecBooleanCompleteness Prop → NecBooleanCompletenessT := fun h => h
/-- `necessary-strong-atomicity-t-implies-necessary-atomicity-t`: the unboxed record,
necessitated. -/
theorem necessary_strong_atomicity_t_implies_necessary_atomicity_t :
    NecStrongAtomicityT → NecAtomicityT :=
  modal_K _ _ (nec% strong_atomicity_t_implies_atomicity_t)
/-- `necessary-persistent-comprehension-implies-necessary-actuality`: the unboxed record,
necessitated. -/
theorem necessary_persistent_comprehension_implies_necessary_actuality :
    NecPersistentComprehension (Prop → Prop) → NecActuality :=
  modal_K _ _ (nec% persistent_comprehension_r_implies_actuality)


/-! ### Boxed forms of the records above -/

/-- `necessary-atomicity-t-and-necessary-bf-imply-necessary-atomicity`: the unboxed record,
necessitated. -/
theorem necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity {σ : Type} [Ty σ] :
    NecAtomicityT → NecBarcan σ → NecAtomicity (σ → Prop) := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% (atomicity_t_and_bf_imply_atomicity (σ := σ))) h₁) h₂

/-- `necessary-atomicity-t-and-necessary-bf-t-imply-necessary-strong-atomicity-t`: the unboxed
record, necessitated. -/
theorem necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t :
    NecAtomicityT → NecBarcanT → NecStrongAtomicityT := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% atomicity_t_and_bf_t_imply_strong_atomicity_t) h₁) h₂

/-- `necessary-actuality-and-necessary-bf-imply-necessary-inextensible-comprehension`: the
unboxed record, necessitated. -/
theorem necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension
    {σ : Type} [Ty σ] :
    NecActuality → NecBarcan (σ → Prop) → NecBarcan σ → NecInextensibleComprehension (σ → Prop) :=
  fun h₁ h₂ h₃ => modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (actuality_and_bf_imply_inextensible_comprehension (σ := σ))) h₁) h₂) h₃

/-- `necessary-completeness-and-necessary-actuality-imply-necessary-weak-rigid-comprehension`:
the unboxed record, necessitated. -/
theorem necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension
    {σ : Type} [Ty σ] :
    NecBooleanCompleteness (σ → Prop) → NecActuality → NecWeakRigidComprehension (σ → Prop) :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% (completeness_and_actuality_imply_weak_rigid_comprehension (σ := σ))) h₁) h₂

/-! ### Strong Actuality (6 October) -/

/-- `strong-actuality-implies-actuality`: a true strong atom decides every proposition,
by `T`, so it is an actual world. -/
theorem strong_actuality_implies_actuality : StrongActuality → Actuality := fun h =>
  h.elim fun w hw => actuality_of_decides w (box_elim hw.2) hw.1

/-- `necessary-strong-actuality-implies-necessary-actuality`: necessitated, and `K`. -/
theorem necessary_strong_actuality_implies_necessary_actuality :
    NecStrongActuality → NecActuality :=
  modal_K _ _ (nec% strong_actuality_implies_actuality)

/-- `necessary-strong-actuality-implies-strong-actuality`: `T`. -/
theorem necessary_strong_actuality_implies_strong_actuality :
    NecStrongActuality → StrongActuality := fun h => box_elim h

/-- `strong-atomicity-t-implies-strong-actuality`: with `a` the actual world (Actuality from
Strong Atomicity), a strong atom `w ≤ a` is true, since otherwise
`a ≤ ¬w` and `w ≤ ¬w`, making `w` bottom. -/
theorem strong_atomicity_t_implies_strong_actuality : StrongAtomicityT → StrongActuality := fun sl =>
  (box_elim (strong_atomicity_t_implies_necessary_actuality sl)).elim fun a ha =>
    (sl a (dia_intro a ha.1)).elim fun w hw =>
      ⟨w, (em w).elim id fun hnw => (hw.1.1 (eq_false_of_le_neg w
        (le_trans_prop w a (¬ w) hw.2 (ha.2 (¬ w) hnw)))).elim, hw.1.2⟩

/-- `necessary-strong-atomicity-t-implies-necessary-strong-actuality`: necessitated, and `K`. -/
theorem necessary_strong_atomicity_t_implies_necessary_strong_actuality :
    NecStrongAtomicityT → NecStrongActuality :=
  modal_K _ _ (nec% strong_atomicity_t_implies_strong_actuality)

/-- `actuality-and-bf-t-imply-strong-actuality`: the actual world decides each
proposition, each decision is necessary, and BF at `t` boxes the quantifier (Bacon's
Exercise 8.12, at the actual world). -/
theorem actuality_and_bf_t_imply_strong_actuality : Actuality → BarcanT → StrongActuality :=
  fun act bf => act.elim fun a ha => ⟨a, ha.1, bf (λ q ↦ a ≤ q ∨ a ≤ ¬ q) fun q =>
    box_le_or_le a q ((em q).elim (fun hq => Or.inl (ha.2 q hq))
      (fun hnq => Or.inr (ha.2 (¬ q) hnq)))⟩

/-- `necessary-actuality-and-necessary-bf-t-imply-necessary-strong-actuality`: the unboxed
record, necessitated. -/
theorem necessary_actuality_and_necessary_bf_t_imply_necessary_strong_actuality :
    NecActuality → NecBarcanT → NecStrongActuality := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% actuality_and_bf_t_imply_strong_actuality) h₁) h₂

/-- `□¬a → a ≤ q`. -/
theorem le_of_box_not (a q : Prop) : □ (¬ a) → a ≤ q := fun h => (le_iff_prop _ _).2
  (modal_K _ _ (nec% (fun (hna : ¬ a) (ha : a) => (hna ha).elim : ¬ a → a → q)) h)

/-- `(◇a → ActualWorld a) → ∀q. a ≤ q ∨ a ≤ ¬q`: where `◇a`, the actual world decides
every proposition; where not, `□¬a` puts `a` below everything. -/
theorem decides_of_dia_actual (a : Prop) :
    (◇ a → ActualWorld a) → ∀ q : Prop, a ≤ q ∨ a ≤ ¬ q := fun h q =>
  (em (◇ a)).elim
    (fun hd => (em q).elim (fun hq => Or.inl ((h hd).2 q hq))
      (fun hnq => Or.inr ((h hd).2 (¬ q) hnq)))
    (fun hnd => Or.inl (le_of_box_not a q (box_not_of_not_dia a hnd)))

/-- `actuality-and-distinctness-preserving-collapse-imply-strong-actuality`: with `a` the
actual world, the collapse makes `◇a → ActualWorld a` necessary (as for Inextensible
Comprehension), and that decides every proposition, so `a` is a strong atom. -/
theorem actuality_and_distinctness_preserving_collapse_imply_strong_actuality :
    Actuality → DistinctnessPreservingCollapse → StrongActuality :=
  fun act col => act.elim fun a (ha : ActualWorld a) => (col (ActualWorld a) ha).elim
    fun q hq =>
      have h₁ : □ (◇ a → ◇ q) := modal_K _ _ (nec% (dia_mono a q))
        (modal_four _ ((le_iff_prop _ _).1 (ha.2 q hq.1)))
      have h₂ : □ (◇ a → ActualWorld a) := modal_K _ _ (modal_K _ _
        (nec% (fun (f : ◇ a → ◇ q) (g : ◇ q → ActualWorld a) (h : ◇ a) => g (f h))) h₁) hq.2
      ⟨a, ha.1, modal_K _ _ (nec% (decides_of_dia_actual a)) h₂⟩

/-! ### BF at the relational types (11 October 2026) -/

/-- `atomicity-and-bf-relational-imply-strong-atomicity`, at `σ → t`: the argument of
`atomicity_and_bf_imply_strong_atomicity` uses BF only at the relational type `σ → t`. -/
theorem atomicity_and_bf_relational_imply_strong_atomicity {σ : Type} [Ty σ] :
    Atomicity (σ → Prop) → BarcanRelational (σ → Prop) → StrongAtomicity (σ → Prop) :=
  atomicity_and_bf_imply_strong_atomicity

/-- `necessary-atomicity-and-necessary-bf-relational-imply-necessary-strong-atomicity`. -/
theorem necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity
    {σ : Type} [Ty σ] :
    NecAtomicity (σ → Prop) → NecBarcanRelational (σ → Prop) → NecStrongAtomicity (σ → Prop) :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% (atomicity_and_bf_relational_imply_strong_atomicity (σ := σ))) h₁) h₂

/-! ### Atomicity (type t) and Weakly Inextensible Comprehension give Actuality (11 October 2026) -/

/-- `atomicity-t-and-weakly-inextensible-comprehension-imply-actuality`: a weakly inextensible
`X*` coextensive with `λp. ⊤` lets every atom entail the existence of a true proposition
deciding every member of `X*`; Atomicity (type `t`) makes that existence true, and `X*` holds
of every proposition. -/
theorem atomicity_t_and_weakly_inextensible_comprehension_imply_actuality :
    AtomicityT → WeaklyInextensibleComprehension (Prop → Prop) → Actuality := fun at_ wic =>
  (wic (fun _ : Prop => True)).elim fun Xs ⟨hwi, hco⟩ =>
  have hC : (∃ p : Prop, p ∧ ∀ q : Prop, Xs q → p ≤ q ∨ p ≤ ¬ q) :=
    (at_ (¬ ∃ p : Prop, p ∧ ∀ q : Prop, Xs q → p ≤ q ∨ p ≤ ¬ q)).elim
      (fun h => box_elim (box_of_neg_le_neg_neg _ h))
      (fun ⟨w, hw, hwn⟩ => by
        have hwC : w ≤ (∃ p : Prop, p ∧ ∀ q : Prop, Xs q → p ≤ q ∨ p ≤ ¬ q) :=
          (le_iff_prop w _).2 (modal_K _ _
            (nec% (fun (h : ∀ q : Prop, Xs q → w ≤ q ∨ w ≤ ¬ q) (hw : w) =>
              (⟨w, hw, h⟩ : ∃ p : Prop, p ∧ ∀ q : Prop, Xs q → p ≤ q ∨ p ≤ ¬ q)))
            (hwi (fun q => w ≤ q ∨ w ≤ ¬ q)
              fun q _ => box_le_or_le w q (atom_le_or_le_neg w q hw)))
        have h1 := le_and_prop w _ _ hwC hwn
        rw [and_not_self_eq] at h1
        exact (not_le_neg_of_atom hw (le_trans_prop w False (¬ w) h1 (bot_le_prop (¬ w)))).elim)
  hC.elim fun p ⟨hp, hd⟩ => actuality_of_decides p (fun q => hd q ((hco q).1 trivial)) hp

/-- `necessary-atomicity-t-and-necessary-wic-imply-necessary-actuality`: the last,
necessitated. -/
theorem necessary_atomicity_t_and_necessary_wic_imply_necessary_actuality :
    NecAtomicityT → NecWeaklyInextensibleComprehension (Prop → Prop) → NecActuality :=
  fun h₁ h₂ => modal_K _ _ (modal_K _ _
    (nec% atomicity_t_and_weakly_inextensible_comprehension_imply_actuality) h₁) h₂

end Classicism.Proofs
