import Classicism.Coalesced.Model

/-!
# The fullest root domains

Appendix E's choice of root domains, for any root arrows: at a relational type, *every*
landing intension, `W₀^{σ→τ} = {α | k^{σ→τ} α ∈ W_k^{σ→τ} for every root arrow k}`. The root
individuals (and the root domains at type variables) are a parameter, any set with
natural transports into the components (`AtomAction`): Appendix E's product of the base
domains with its projections is one choice (`Distinguished.lean`), its closing paragraph's
"any set `X` with functions `k^e : X → W_k^e`" the general one.

The domains are defined by recursion on the type, through the recursor of the mutual
inductive, as the full domains of `IntensionalFull.lean` are: at a relational type the
intensions at the root are sets of `RootTuple`s, a tuple being either a root endo-arrow
with arguments from the root domains, or a component object, arguments there and a root
arrow into it; the domain is the set of those intensions that land. Then the
inclusion into the intensions of the coalesced sum is the preimage under the bijection
between its tuples and `RootTuple`s, and the root domains are the fullest
(`fullest_full`), so the sum is a model when the components seen from root arrows are
(`isModel_full`).
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  (S : RootArrows C) (A : ∀ k, Premodel Sig (C k))

/-- The root data at a type, without the laws: a domain, the transport along each root
arrow, and the action of the root endo-arrows. -/
structure RootLevel (σ : Ty) where
  /-- The root domain. -/
  D : Type
  /-- The transport along a root arrow. -/
  tr : ∀ {k : ι} {V : C k}, S.R.obj ⟨k, V⟩ → D → ((A k).inner σ).obj V
  /-- The action of a root endo-arrow. -/
  trE : S.End → D → D

/-- The root data at a non-relational type (`e` or a type variable): a root level with the
laws of a root action. -/
structure AtomAction (σ : Ty) extends RootLevel S A σ where
  tr_map : ∀ {k : ι} {V U : C k} (j : V ⟶ U) (r : S.R.obj ⟨k, V⟩) (a : D),
    tr (S.R.map (SigmaHom.mk j) r) a = ((A k).inner σ).map j (tr r a)
  tr_act : ∀ {k : ι} {V : C k} (m : S.End) (r : S.R.obj ⟨k, V⟩) (a : D), tr (S.act m r) a = tr r (trE m a)
  trE_one : ∀ a : D, trE S.one a = a
  trE_mul : ∀ (m m' : S.End) (a : D), trE (S.mul m m') a = trE m' (trE m a)

/-! ### Tuples at the root -/

/-- A tuple of relational type `ρ` from the root, given the arguments `RA` of `ρ` at the
root: a root endo-arrow and arguments at the root, or a component object `U`, arguments
there and a root arrow into `U`. -/
abbrev RootTuple (ρ : RTy) (RA : Type) : Type :=
  (S.End × RA) ⊕ (Σ k : ι, Σ U : C k, Args (A k).inner ρ U × S.R.obj ⟨k, U⟩)

variable {S A}

/-- The transport along a root arrow `r : W₀ → V` of a set of root tuples:
`{⟨ā, j⟩ | ⟨ā, R j r⟩ ∈ X}`. -/
def rootTransport {ρ : RTy} {RA : Type} (X : Set (RootTuple S A ρ RA)) {k : ι} {V : C k}
    (r : S.R.obj ⟨k, V⟩) : Intension (A k).inner ρ V :=
  {p | Sum.inr ⟨k, p.1, p.2.1, S.R.map (SigmaHom.mk p.2.2) r⟩ ∈ X}

/-- A set of root tuples **lands** when its transport along every root arrow is in the
component's domain. -/
def LandsT {ρ : RTy} {RA : Type} (X : Set (RootTuple S A ρ RA)) : Prop :=
  ∀ {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩), ∃ y, (A k).incl ρ V y = rootTransport X r

/-- Precomposition of a root tuple with a root endo-arrow. -/
def shift {ρ : RTy} {RA : Type} (m : S.End) : RootTuple S A ρ RA → RootTuple S A ρ RA
  | .inl (m', a) => .inl (S.mul m m', a)
  | .inr ⟨k, U, a, r⟩ => .inr ⟨k, U, a, S.act m r⟩

theorem rootTransport_shift {ρ : RTy} {RA : Type} (m : S.End) (X : Set (RootTuple S A ρ RA))
    {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩) :
    rootTransport {q | shift m q ∈ X} r = rootTransport X (S.act m r) := by
  ext ⟨U, a, j⟩
  show Sum.inr ⟨k, U, a, S.act m (S.R.map (SigmaHom.mk j) r)⟩ ∈ X ↔ Sum.inr ⟨k, U, a, S.R.map (SigmaHom.mk j) (S.act m r)⟩ ∈ X
  rw [S.act_natural]

theorem landsT_shift {ρ : RTy} {RA : Type} (m : S.End) {X : Set (RootTuple S A ρ RA)} (hX : LandsT X) :
    LandsT {q | shift m q ∈ X} := fun r => by
  rw [rootTransport_shift]; exact hX _

variable (S A) in
/-- A **domain selector**: at each relational type `ρ`, given the arguments `RA` of `ρ` at
the root, a set of sets of root tuples, closed under precomposition with the root
endo-arrows. The root domain at `ρ` is the landing sets it selects. The fullest choice
selects every set (`Selector.all`); a choice that depends on the root domains at lower
types sees them only through `RA`. -/
structure Selector where
  /-- The selected sets of root tuples. -/
  sel : ∀ (ρ : RTy) (RA : Type), Set (Set (RootTuple S A ρ RA))
  shift_mem : ∀ (ρ : RTy) (RA : Type) (m : S.End) (X : Set (RootTuple S A ρ RA)),
    X ∈ sel ρ RA → {q | shift m q ∈ X} ∈ sel ρ RA

/-- The fullest selector: every set. -/
def Selector.all : Selector S A := ⟨fun _ _ => Set.univ, fun _ _ _ _ _ => trivial⟩

/-- The root level at a relational type, given the arguments at the root: the selected
landing sets of root tuples, transported to the element of the component's domain with
that intension. -/
noncomputable def relLevel (sel : Selector S A) (ρ : RTy) (RA : Type) : RootLevel S A (.rel ρ) where
  D := {X : Set (RootTuple S A ρ RA) // LandsT X ∧ X ∈ sel.sel ρ RA}
  tr r X := Classical.choose (X.2.1 r)
  trE m X := ⟨{q | shift m q ∈ X.1}, landsT_shift m X.2.1, sel.shift_mem ρ RA m X.1 X.2.2⟩

theorem incl_relLevel_tr (sel : Selector S A) (ρ : RTy) (RA : Type) {k : ι} {V : C k} (r : S.R.obj ⟨k, V⟩)
    (X : (relLevel sel ρ RA).D) :
    (A k).incl ρ V ((relLevel sel ρ RA).tr r X) = rootTransport X.1 r :=
  Classical.choose_spec (X.2.1 r)

/-! ### The recursion on the type -/

variable (ae : AtomAction S A .e) (av : ∀ i, AtomAction S A (.var i)) (sel : Selector S A)

/-- The fullest root level at each type: the atom data at `e` and at type variables, the
landing intensions at relational types. Through the recursor of the mutual inductive, so
that it reduces by iota at a constructor. -/
noncomputable abbrev selLevel (σ : Ty) : RootLevel S A σ :=
  @Ty.rec (fun σ => RootLevel S A σ) (fun _ => Type) ae.toRootLevel (fun ρ ih => relLevel sel ρ ih)
    (fun i => (av i).toRootLevel) PUnit (fun _ _ ihσ ihρ => ihσ.D × ihρ) σ

/-- The arguments at the root of a relational type. -/
noncomputable abbrev selArgsT (ρ : RTy) : Type :=
  @RTy.rec (fun σ => RootLevel S A σ) (fun _ => Type) ae.toRootLevel (fun ρ ih => relLevel sel ρ ih)
    (fun i => (av i).toRootLevel) PUnit (fun _ _ ihσ ihρ => ihσ.D × ihρ) ρ

example (ρ : RTy) : selLevel ae av sel (.rel ρ) = relLevel sel ρ (selArgsT ae av sel ρ) := rfl
example (σ : Ty) (ρ : RTy) : selArgsT ae av sel (.arr σ ρ) = ((selLevel ae av sel σ).D × selArgsT ae av sel ρ) := rfl

theorem selLevel_tr_map : ∀ (σ : Ty) {k : ι} {V U : C k} (j : V ⟶ U) (r : S.R.obj ⟨k, V⟩)
    (a : (selLevel ae av sel σ).D),
    (selLevel ae av sel σ).tr (S.R.map (SigmaHom.mk j) r) a = ((A k).inner σ).map j ((selLevel ae av sel σ).tr r a)
  | .e, _, _, _, j, r, a => ae.tr_map j r a
  | .var i, _, _, _, j, r, a => (av i).tr_map j r a
  | .rel ρ, k, V, U, j, r, X => by
    apply (A k).incl_injective ρ U
    show (A k).incl ρ U ((relLevel sel ρ (selArgsT ae av sel ρ)).tr _ X) =
      (A k).incl ρ U (((A k).inner (.rel ρ)).map j ((relLevel sel ρ (selArgsT ae av sel ρ)).tr r X))
    rw [(A k).incl_map, incl_relLevel_tr, incl_relLevel_tr]
    ext ⟨T, a, i⟩
    show Sum.inr ⟨k, T, a, S.R.map (SigmaHom.mk i) (S.R.map (SigmaHom.mk j) r)⟩ ∈ X.1 ↔
      Sum.inr ⟨k, T, a, S.R.map (SigmaHom.mk j ≫ SigmaHom.mk i) r⟩ ∈ X.1
    rw [S.map_comp_apply]

theorem selLevel_tr_act : ∀ (σ : Ty) {k : ι} {V : C k} (m : S.End) (r : S.R.obj ⟨k, V⟩)
    (a : (selLevel ae av sel σ).D),
    (selLevel ae av sel σ).tr (S.act m r) a = (selLevel ae av sel σ).tr r ((selLevel ae av sel σ).trE m a)
  | .e, _, _, m, r, a => ae.tr_act m r a
  | .var i, _, _, m, r, a => (av i).tr_act m r a
  | .rel ρ, k, V, m, r, X => by
    apply (A k).incl_injective ρ V
    show (A k).incl ρ V ((relLevel sel ρ (selArgsT ae av sel ρ)).tr _ X) =
      (A k).incl ρ V ((relLevel sel ρ (selArgsT ae av sel ρ)).tr r ((relLevel sel ρ (selArgsT ae av sel ρ)).trE m X))
    rw [incl_relLevel_tr, incl_relLevel_tr]
    exact (rootTransport_shift m X.1 r).symm

theorem shift_one {ρ : RTy} {RA : Type} : ∀ q : RootTuple S A ρ RA, shift S.one q = q
  | .inl (m', a) => by simp only [shift, S.one_mul]
  | .inr ⟨k, U, a, r⟩ => by simp only [shift, S.act_one]

theorem shift_mul {ρ : RTy} {RA : Type} (m m' : S.End) :
    ∀ q : RootTuple S A ρ RA, shift (S.mul m m') q = shift m (shift m' q)
  | .inl (m'', a) => by simp only [shift, S.mul_assoc]
  | .inr ⟨k, U, a, r⟩ => by simp only [shift, S.act_mul]

theorem selLevel_trE_one : ∀ (σ : Ty) (a : (selLevel ae av sel σ).D), (selLevel ae av sel σ).trE S.one a = a
  | .e, a => ae.trE_one a
  | .var i, a => (av i).trE_one a
  | .rel _, X => Subtype.ext (Set.ext fun q => by
      show shift S.one q ∈ X.1 ↔ q ∈ X.1
      rw [shift_one])

theorem selLevel_trE_mul : ∀ (σ : Ty) (m m' : S.End) (a : (selLevel ae av sel σ).D),
    (selLevel ae av sel σ).trE (S.mul m m') a = (selLevel ae av sel σ).trE m' ((selLevel ae av sel σ).trE m a)
  | .e, m, m', a => ae.trE_mul m m' a
  | .var i, m, m', a => (av i).trE_mul m m' a
  | .rel _, m, m', X => Subtype.ext (Set.ext fun q => by
      show shift (S.mul m m') q ∈ X.1 ↔ shift m (shift m' q) ∈ X.1
      rw [shift_mul])

/-- **The root action of a selector**: the atom data at `e` and at type variables, and at
a relational type the selected landing intensions. -/
noncomputable def selAction : RootAction S A where
  D σ := (selLevel ae av sel σ).D
  tr σ := (selLevel ae av sel σ).tr
  trE σ := (selLevel ae av sel σ).trE
  tr_map := selLevel_tr_map ae av sel
  tr_act := selLevel_tr_act ae av sel
  trE_one := selLevel_trE_one ae av sel
  trE_mul := selLevel_trE_mul ae av sel

/-! ### The tuples of the sum at the root -/

/-- The arguments of the sum at the root, as the arguments of the recursion. -/
def argsRootOut : ∀ ρ : RTy, Args (selAction ae av sel).inner ρ (CoalescedSum.base S) → selArgsT ae av sel ρ
  | .t, _ => PUnit.unit
  | .arr _ ρ, a => (a.1, argsRootOut ρ a.2)

/-- Its inverse. -/
def argsRootIn : ∀ ρ : RTy, selArgsT ae av sel ρ → Args (selAction ae av sel).inner ρ (CoalescedSum.base S)
  | .t, _ => PUnit.unit
  | .arr _ ρ, a => (a.1, argsRootIn ρ a.2)

theorem argsRootOut_argsRootIn : ∀ (ρ : RTy) (a : selArgsT ae av sel ρ),
    argsRootOut ae av sel ρ (argsRootIn ae av sel ρ a) = a
  | .t, _ => rfl
  | .arr _ ρ, a => Prod.ext rfl (argsRootOut_argsRootIn ρ a.2)

theorem argsRootIn_argsRootOut : ∀ (ρ : RTy) (a : Args (selAction ae av sel).inner ρ (CoalescedSum.base S)),
    argsRootIn ae av sel ρ (argsRootOut ae av sel ρ a) = a
  | .t, _ => rfl
  | .arr _ ρ, a => Prod.ext rfl (argsRootIn_argsRootOut ρ a.2)

/-- The tuples of the sum from the root, as root tuples. -/
noncomputable def toRT {ρ : RTy} : Tuple (selAction ae av sel).inner ρ (CoalescedSum.base S) → RootTuple S A ρ (selArgsT ae av sel ρ)
  | ⟨.root, a, m⟩ => .inl (m, argsRootOut ae av sel ρ a)
  | ⟨.of ⟨k, U⟩, a, r⟩ => .inr ⟨k, U, (selAction ae av sel).argsOut ρ a, r⟩

/-- Its inverse. -/
noncomputable def ofRT {ρ : RTy} : RootTuple S A ρ (selArgsT ae av sel ρ) → Tuple (selAction ae av sel).inner ρ (CoalescedSum.base S)
  | .inl (m, a) => ⟨.root, argsRootIn ae av sel ρ a, m⟩
  | .inr ⟨k, U, a, r⟩ => ⟨.of ⟨k, U⟩, (selAction ae av sel).argsIn ρ a, r⟩

theorem toRT_ofRT {ρ : RTy} : ∀ q : RootTuple S A ρ (selArgsT ae av sel ρ), toRT ae av sel (ofRT ae av sel q) = q
  | .inl (m, a) => by
    show (Sum.inl (m, argsRootOut ae av sel ρ (argsRootIn ae av sel ρ a)) : RootTuple S A ρ (selArgsT ae av sel ρ)) = _
    rw [argsRootOut_argsRootIn]
  | .inr ⟨k, U, a, r⟩ => by
    show (Sum.inr ⟨k, U, (selAction ae av sel).argsOut ρ ((selAction ae av sel).argsIn ρ a), r⟩ :
      RootTuple S A ρ (selArgsT ae av sel ρ)) = _
    rw [RootAction.argsOut_argsIn]

theorem ofRT_toRT {ρ : RTy} : ∀ p : Tuple (selAction ae av sel).inner ρ (CoalescedSum.base S),
    ofRT ae av sel (toRT ae av sel p) = p
  | ⟨.root, a, m⟩ => by
    show (⟨.root, argsRootIn ae av sel ρ (argsRootOut ae av sel ρ a), m⟩ : Tuple (selAction ae av sel).inner ρ _) = _
    rw [argsRootIn_argsRootOut]
  | ⟨.of ⟨k, U⟩, a, r⟩ => by
    show (⟨.of ⟨k, U⟩, (selAction ae av sel).argsIn ρ ((selAction ae av sel).argsOut ρ a), r⟩ :
      Tuple (selAction ae av sel).inner ρ _) = _
    rw [RootAction.argsIn_argsOut]

/-- The root inclusion of a selector: the preimage under `toRT`. -/
noncomputable def selIncl : RootIncl (selAction ae av sel) where
  incl ρ X := {p | toRT ae av sel p ∈ X.1}
  incl_trE ρ m X := by
    ext ⟨W, a, x⟩
    cases W with
    | root => rfl
    | of y => rfl
  incl_tr ρ k V r X := by
    refine (incl_relLevel_tr sel ρ (selArgsT ae av sel ρ) r X).trans ?_
    ext ⟨U, a, j⟩
    show _ ↔ Sum.inr ⟨k, U, (selAction ae av sel).argsOut ρ ((selAction ae av sel).argsIn ρ a), _⟩ ∈ X.1
    rw [RootAction.argsOut_argsIn]
    rfl
  incl_injective ρ X Y e := Subtype.ext (Set.ext fun q => by
    have := Set.ext_iff.mp e (ofRT ae av sel q)
    simp only [Set.mem_ofPred_eq, toRT_ofRT] at this
    exact this)

/-- **Root closure for selected domains**: when the components seen from root arrows are
models, the root domains are closed under the language at the root iff the selector selects
the value of every term of relational type there, read as a set of root tuples. -/
theorem rootClosed_iff_selected (ne : Nonempty ae.D) (I : ∀ c : Sig.Const, (selAction ae av sel).D (Sig.typeOf c))
    (hQ : (selAction ae av sel).ComponentsAreModels I) :
    (selAction ae av sel).RootClosed (selIncl ae av sel) ne I ↔
      ∀ (m : S.End) {Γ : Ctx} {ρ : RTy} (t : Term Sig Γ (.rel ρ)) (g : IEnv (selAction ae av sel).D Γ),
        {q | ofRT ae av sel q ∈
          ((selAction ae av sel).coalescedSum (selIncl ae av sel) ne I).sem (CoalescedSum.endo S m) t g}
          ∈ sel.sel ρ (selArgsT ae av sel ρ) := by
  refine ((selAction ae av sel).rootClosed_iff_rel (selIncl ae av sel) ne I).trans ?_
  refine forall_congr' fun m => forall_congr' fun Γ => forall_congr' fun ρ => forall_congr' fun t =>
    forall_congr' fun g => ?_
  constructor
  · rintro ⟨X, hX⟩
    rw [← hX]
    have e : {q | ofRT ae av sel q ∈ (selIncl ae av sel).incl ρ X} = X.1 := by
      ext q
      show toRT ae av sel (ofRT ae av sel q) ∈ X.1 ↔ q ∈ X.1
      rw [toRT_ofRT]
    rw [e]
    exact X.2.2
  · intro H
    refine ⟨⟨{q | ofRT ae av sel q ∈
      ((selAction ae av sel).coalescedSum (selIncl ae av sel) ne I).sem (CoalescedSum.endo S m) t g},
      fun r => (selAction ae av sel).lands_sem_endo (selIncl ae av sel) ne I hQ m t g r, H⟩, ?_⟩
    ext p
    show ofRT ae av sel (toRT ae av sel p) ∈
      ((selAction ae av sel).coalescedSum (selIncl ae av sel) ne I).sem (CoalescedSum.endo S m) t g ↔ _
    rw [ofRT_toRT]

/-! ### The fullest root domains -/

/-- **The fullest root action**: the atom data at `e` and at type variables, and at a
relational type every landing intension. -/
noncomputable abbrev fullAction : RootAction S A := selAction ae av Selector.all

/-- The fullest root inclusion. -/
noncomputable abbrev fullRootIncl : RootIncl (fullAction ae av) := selIncl ae av Selector.all

/-- **The fullest root domains are the fullest**: every landing intension at the root is
the inclusion of an element of the root domain. -/
theorem fullest_full : (fullAction ae av).Fullest (fullRootIncl ae av) := by
  intro ρ Y hY
  refine ⟨⟨{q | ofRT ae av .all q ∈ Y}, fun r => hY r, trivial⟩, ?_⟩
  ext p
  show ofRT ae av .all (toRT ae av .all p) ∈ Y ↔ p ∈ Y
  rw [ofRT_toRT]

/-- **Appendix E, for any root arrows**: the coalesced sum with the fullest root domains is
a model whenever the components seen from the root arrows are. -/
theorem isModel_full (ne : Nonempty ae.D) (I : ∀ c : Sig.Const, (fullAction ae av).D (Sig.typeOf c))
    (hQ : (fullAction ae av).ComponentsAreModels I) :
    ((fullAction ae av).coalescedSum (fullRootIncl ae av) ne I).IsModel :=
  (fullAction ae av).isModel_of_fullest (fullRootIncl ae av) ne I hQ (fullest_full ae av)

end Classicism.Meta.Coalesced
