import Classicism.Semantics.ExternalPinning

/-!
# Symmetric models with independent pinning and individual actions

Original generalization for `research/2026-10-22/notes/fixed-point-entrance-cone.md`
section 1 (misc, unpaginated). The existing symmetric-intension construction
is adapted without modifying its shared source. Relational domains contain
exactly the symmetric intensions pinned through `De`; the individual action
is a separate `E`. The construction is a genuine model when the values of
`E` are ideally pinned through `De`. Constant singleton individuals satisfy
that condition with empty support, without any condition equating the two
base actions. This file does not construct the qualitative-link tail or the
entrance cone.
-/

namespace Classicism.Meta.Intensional.SymmetricExternal

open CategoryTheory

variable {C : Type} [SmallCategory C]
variable (De E : C ⥤ Type) (G : ∀ V : C, Set (V ⟶ V)) (J : PinIdeal De)

/-- The symmetric ideally full inner action at a type: `E` at `e`, independently pinned through `De`; at a relational type,
the symmetric finitely pinned intensions over its arguments. -/
noncomputable abbrev SymT (σ : Ty) : C ⥤ Type :=
  @Ty.rec (fun _ => C ⥤ Type) (fun _ => C ⥤ Type) E
    (fun _ ih => symPinnedAction De G J ih) (fun _ => E)
    pointAction (fun _ _ ihσ ihρ => prodAction ihσ ihρ) σ

/-- The arguments of a relational type, as an action. -/
noncomputable abbrev SymArgs (ρ : RTy) : C ⥤ Type :=
  @RTy.rec (fun _ => C ⥤ Type) (fun _ => C ⥤ Type) E
    (fun _ ih => symPinnedAction De G J ih) (fun _ => E)
    pointAction (fun _ _ ihσ ihρ => prodAction ihσ ihρ) ρ

/-- The symmetric ideally full inner action at a relational type. -/
noncomputable abbrev SymR (ρ : RTy) : C ⥤ Type := symPinnedAction De G J (SymArgs De E G J ρ)

example (ρ : RTy) : SymT De E G J (.rel ρ) = SymR De E G J ρ := rfl

/-- The raw intensions over the arguments. -/
abbrev SymRaw (ρ : RTy) (W : C) : Type := Set (Σ V : C, (SymArgs De E G J ρ).obj V × (W ⟶ V))

/-- The two spellings of the arguments, related. -/
def symArgs : ∀ (ρ : RTy) (V : C), Args (SymT De E G J) ρ V → (SymArgs De E G J ρ).obj V
  | .t, _, _ => PUnit.unit
  | .arr _ ρ, V, a => (a.1, symArgs ρ V a.2)

def symArgs' : ∀ (ρ : RTy) (V : C), (SymArgs De E G J ρ).obj V → Args (SymT De E G J) ρ V
  | .t, _, _ => PUnit.unit
  | .arr _ ρ, V, a => (a.1, symArgs' ρ V a.2)

theorem symArgs_symArgs' : ∀ (ρ : RTy) (V : C) (a : (SymArgs De E G J ρ).obj V),
    symArgs De E G J ρ V (symArgs' De E G J ρ V a) = a
  | .t, _, _ => rfl
  | .arr _ ρ, V, a => by
    show (a.1, symArgs De E G J ρ V (symArgs' De E G J ρ V a.2)) = a
    exact Prod.ext rfl (symArgs_symArgs' ρ V a.2)

theorem symArgs'_symArgs : ∀ (ρ : RTy) (V : C) (a : Args (SymT De E G J) ρ V),
    symArgs' De E G J ρ V (symArgs De E G J ρ V a) = a
  | .t, _, _ => rfl
  | .arr _ ρ, V, a => by
    show (a.1, symArgs' De E G J ρ V (symArgs De E G J ρ V a.2)) = a
    exact Prod.ext rfl (symArgs'_symArgs ρ V a.2)

/-- The arrows act alike on the two spellings. -/
theorem symArgs_map : ∀ (ρ : RTy) {V V' : C} (j : V ⟶ V') (a : Args (SymT De E G J) ρ V),
    symArgs De E G J ρ V' (Args.map (SymT De E G J) ρ j a) = (SymArgs De E G J ρ).map j (symArgs De E G J ρ V a)
  | .t, _, _, _, _ => rfl
  | .arr σ ρ, V, V', j, a => by
    show ((SymT De E G J σ).map j a.1, symArgs De E G J ρ V' (Args.map (SymT De E G J) ρ j a.2)) =
      ((SymT De E G J σ).map j a.1, (SymArgs De E G J ρ).map j (symArgs De E G J ρ V a.2))
    rw [symArgs_map ρ j a.2]

theorem symArgs'_map (ρ : RTy) {V V' : C} (j : V ⟶ V') (b : (SymArgs De E G J ρ).obj V) :
    symArgs' De E G J ρ V' ((SymArgs De E G J ρ).map j b) = Args.map (SymT De E G J) ρ j (symArgs' De E G J ρ V b) := by
  rw [← symArgs_symArgs' De E G J ρ V b, ← symArgs_map, symArgs'_symArgs, symArgs'_symArgs]

/-- A raw intension read as an intension, and back. -/
def symRead (ρ : RTy) (W : C) (A : SymRaw De E G J ρ W) : Intension (SymT De E G J) ρ W :=
  {p | (⟨p.1, symArgs De E G J ρ p.1 p.2.1, p.2.2⟩ : Σ V : C, (SymArgs De E G J ρ).obj V × (W ⟶ V)) ∈ A}

def symRead' (ρ : RTy) (W : C) (F : Intension (SymT De E G J) ρ W) : SymRaw De E G J ρ W :=
  {p | (⟨p.1, symArgs' De E G J ρ p.1 p.2.1, p.2.2⟩ : Tuple (SymT De E G J) ρ W) ∈ F}

theorem symRead_symRead' (ρ : RTy) (W : C) (F : Intension (SymT De E G J) ρ W) :
    symRead De E G J ρ W (symRead' De E G J ρ W F) = F := by
  ext ⟨V, a, i⟩
  simp [symRead, symRead', symArgs'_symArgs]

theorem symRead'_symRead (ρ : RTy) (W : C) (A : SymRaw De E G J ρ W) :
    symRead' De E G J ρ W (symRead De E G J ρ W A) = A := by
  ext ⟨V, a, i⟩
  simp [symRead, symRead', symArgs_symArgs']

theorem symRead_map (ρ : RTy) {W V : C} (h : W ⟶ V) (A : SymRaw De E G J ρ W) :
    symRead De E G J ρ V ((intensionAction (SymArgs De E G J ρ)).map h A) =
      Intension.map (SymT De E G J) h (symRead De E G J ρ W A) := by
  ext ⟨U, a, i⟩
  exact Iff.rfl

theorem symRead'_map (ρ : RTy) {W V : C} (h : W ⟶ V) (F : Intension (SymT De E G J) ρ W) :
    symRead' De E G J ρ V (Intension.map (SymT De E G J) h F) =
      (intensionAction (SymArgs De E G J ρ)).map h (symRead' De E G J ρ W F) := by
  ext ⟨U, a, i⟩
  exact Iff.rfl

/-- The inclusion of the domain into the intensions. -/
def symIncl (ρ : RTy) (W : C) (A : (SymR De E G J ρ).obj W) : Intension (SymT De E G J) ρ W :=
  symRead De E G J ρ W A.1

theorem symIncl_map (ρ : RTy) {W V : C} (h : W ⟶ V) (A : (SymR De E G J ρ).obj W) :
    symIncl De E G J ρ V ((SymR De E G J ρ).map h A) = Intension.map (SymT De E G J) h (symIncl De E G J ρ W A) :=
  symRead_map De E G J ρ h A.1

theorem symIncl_injective (ρ : RTy) (W : C) : Function.Injective (symIncl De E G J ρ W) := by
  intro A B e
  apply Subtype.ext
  have := congrArg (symRead' De E G J ρ W) e
  rwa [symIncl, symIncl, symRead'_symRead, symRead'_symRead] at this

/-- Symmetry of an intension over the symmetric actions (`Premodel.Sym` for this premodel). -/
def SymCond {ρ : RTy} {W : C} (F : Intension (SymT De E G J) ρ W) : Prop :=
  ∀ (V : C) (a : Args (SymT De E G J) ρ V) (k : W ⟶ V) (g : V ⟶ V), g ∈ G V →
    (⟨V, a, k⟩ : Tuple (SymT De E G J) ρ W) ∈ F → (⟨V, Args.map (SymT De E G J) ρ g a, k ≫ g⟩ : Tuple (SymT De E G J) ρ W) ∈ F

/-- An intension over the symmetric actions is in the domain iff it is finitely pinned and
symmetric. -/
theorem mem_range_symIncl (ρ : RTy) (W : C) (F : Intension (SymT De E G J) ρ W) :
    F ∈ Set.range (symIncl De E G J ρ W) ↔
      (∃ N : Set (De.obj W), N ∈ J.mem W ∧
        ∀ (V : C) (h i : W ⟶ V), AgreeOn De N h i →
          Intension.map (SymT De E G J) h F = Intension.map (SymT De E G J) i F) ∧ SymCond De E G J F := by
  constructor
  · rintro ⟨⟨A, ⟨N, hN, hA⟩, hS⟩, rfl⟩
    refine ⟨⟨N, hN, fun V h i ha => ?_⟩, ?_⟩
    · show Intension.map (SymT De E G J) h (symRead De E G J ρ W A) = Intension.map (SymT De E G J) i (symRead De E G J ρ W A)
      rw [← symRead_map, ← symRead_map, hA V h i ha]
    · intro V a k g hg ha
      show (⟨V, symArgs De E G J ρ V (Args.map (SymT De E G J) ρ g a), k ≫ g⟩ : Σ V : C, (SymArgs De E G J ρ).obj V × (W ⟶ V)) ∈ A
      rw [symArgs_map]
      exact hS V _ k g hg ha
  · rintro ⟨⟨N, hN, hF⟩, hS⟩
    refine ⟨⟨symRead' De E G J ρ W F, ⟨N, hN, fun V h i ha => ?_⟩, ?_⟩, ?_⟩
    · show (intensionAction (SymArgs De E G J ρ)).map h (symRead' De E G J ρ W F)
        = (intensionAction (SymArgs De E G J ρ)).map i (symRead' De E G J ρ W F)
      rw [← symRead'_map, ← symRead'_map, hF V h i ha]
    · intro V b k g hg hb
      show (⟨V, symArgs' De E G J ρ V ((SymArgs De E G J ρ).map g b), k ≫ g⟩ : Tuple (SymT De E G J) ρ W) ∈ F
      rw [symArgs'_map]
      exact hS V _ k g hg hb
    · exact symRead_symRead' De E G J ρ W F

/-- The external-pinning premodel, with individual action `E`. -/
noncomputable def model {Sig : Signature} (W₀ : C)
    (hne : ∀ W : C, Nonempty (E.obj W))
    (I : ∀ c : Sig.Const, (SymT De E G J (Sig.typeOf c)).obj W₀) : Premodel Sig C where
  W₀ := W₀
  inner := SymT De E G J
  nonempty_e := hne
  incl := symIncl De E G J
  incl_map := symIncl_map De E G J
  incl_injective := symIncl_injective De E G J
  I := I

variable {De E G J} {Sig : Signature} {W₀ : C}
  {hne : ∀ W : C, Nonempty (E.obj W)}
  {I : ∀ c : Sig.Const, (SymT De E G J (Sig.typeOf c)).obj W₀}

local notation "A" => model De E G J W₀ hne I

theorem domSym : (A).DomSym G := fun ρ W x =>
  ((mem_range_symIncl De E G J ρ W _).1 ⟨x, rfl⟩).2

/-- Primitive values are the only extra pinning hypothesis; relational
pinning follows from the domain construction itself. Type variables use E. -/
theorem inner_pinned (hE : ∀ W (x : E.obj W), IdealPinned De J E x) :
    ∀ (σ : Ty) (W : C) (x : (A).Dom W σ),
      ∃ N : Set (De.obj W), N ∈ J.mem W ∧
        ExternalPinning.PinnedO A De σ N ((A).Incl σ W x)
  | .e, W, x => by
    obtain ⟨N, hN, hp⟩ := hE W x
    exact ⟨N, hN, (ExternalPinning.pinnedO_Incl_iff A De .e N x).2 hp⟩
  | .rel ρ, W, x => ((mem_range_symIncl De E G J ρ W _).1 ⟨x, rfl⟩).1
  | .var n, W, x => by
    obtain ⟨N, hN, hp⟩ := hE W x
    exact ⟨N, hN, (ExternalPinning.pinnedO_Incl_iff A De (.var n) N x).2 hp⟩

/-- All typed terms denote admitted elements, including lambda abstraction
and quantification; no IsModel premise occurs. -/
theorem isModel (hG : SymGroup G)
    (hE : ∀ W (x : E.obj W), IdealPinned De J E x) : (A).IsModel :=
  ExternalPinning.isModel_of_pinned_sym A De J hG domSym (inner_pinned hE)
    fun ρ W F hp hs => (mem_range_symIncl De E G J ρ W F).2 ⟨hp, hs⟩

/-- The singleton action is pinned by the empty set through any external action. -/
theorem pointAction_pinned (De : C ⥤ Type) (J : PinIdeal De) (W : C)
    (x : (pointAction : C ⥤ Type).obj W) : IdealPinned De J pointAction x :=
  ⟨∅, J.finite Set.finite_empty, fun _ _ _ _ => rfl⟩

/-- A symmetric model with literally one interpreted individual at each world.
No relationship between the external base and this singleton is assumed. -/
noncomputable def singletonModel (De : C ⥤ Type) (G : ∀ V : C, Set (V ⟶ V))
    (J : PinIdeal De) (W₀ : C) : Premodel Signature.pure C :=
  model De pointAction G J W₀ (fun _ => ⟨PUnit.unit⟩) (fun c => nomatch c)

theorem singleton_isModel (De : C ⥤ Type) (G : ∀ V : C, Set (V ⟶ V))
    (J : PinIdeal De) (W₀ : C) (hG : SymGroup G) :
    (singletonModel De G J W₀).IsModel :=
  isModel hG (pointAction_pinned De J)

theorem singleton_individuals (De : C ⥤ Type) (G : ∀ V : C, Set (V ⟶ V))
    (J : PinIdeal De) (W₀ W : C) :
    Subsingleton ((singletonModel De G J W₀).Dom W .e) :=
  inferInstanceAs (Subsingleton PUnit)

/-- For finite pinning there are no ideal or primitive-pinning premises to supply. -/
theorem singleton_fin_isModel (De : C ⥤ Type) (G : ∀ V : C, Set (V ⟶ V))
    (W₀ : C) (hG : SymGroup G) :
    (singletonModel De G (PinIdeal.fin De) W₀).IsModel :=
  singleton_isModel De G (PinIdeal.fin De) W₀ hG

end Classicism.Meta.Intensional.SymmetricExternal
