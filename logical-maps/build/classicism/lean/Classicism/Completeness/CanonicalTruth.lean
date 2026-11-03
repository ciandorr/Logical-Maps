import Classicism.Completeness.Canonical
import Classicism.Semantics.IntensionalSoundness

/-!
# The canonical intensional action model and its truth lemma

The canonical premodel on the preorder of worlds with base `w₀` (`premodel`): the term
classes of `Completeness/Canonical.lean` as inner domains, their canonical inclusion, the
domain of individuals nonempty because Existence is in every world and worlds are
witnessed, and each constant `c` of `Sig` interpreted by the class of `c`.

**The truth lemma** (`sem_eq`), by induction on terms: relative to an arrow `w₀ ⟶ W` and an
assignment `g` of classes at `W`, the value of a term of `Sig` is the inclusion of the class
of the closed term it becomes in the ambient signature, `lift t`, with representatives of
`g` substituted for its variables. Any representatives will do, which is what lets the
abstraction case pass to an accessible world without changing them. The cases of the
logical constants are the readings of `Completeness/Canonical.lean`, the type-subscripted
ones by their own induction on the type.

So the premodel is a model (`isModel`), the value of every term being the inclusion of a
class; and a sentence holds in it iff it is in the base world's theory
(`holdsSentence_iff`).
-/

namespace Classicism.Meta

namespace Completeness

open CategoryTheory Term Intensional

variable {Sig : Signature}

namespace Canonical

/-- Existence is in every world, being an axiom of `C`. -/
theorem existence_mem (w : World Sig) : (Meta.existence_e : Sentence (ext Sig)) ∈ w.Γ :=
  World.mem_of_th (World.th_of_C (Derivable.axiom rfl)) (by unfold Meta.existence_e; simp)

/-- There are individuals at every world: a witness to Existence. -/
theorem nonempty_dom_e (w : World Sig) : Nonempty (Dom w .e) := by
  obtain ⟨a, ha, _⟩ := w.witnessed (σ := .e) _ (existence_mem w)
  exact ⟨cls a ha⟩

/-- **The canonical inclusion is injective**: classes with the same intension are
coextensive at every accessible world, so necessarily coextensive, so identical by
Intensionality. -/
theorem incl_injective [Countable Sig.Const] (ρ : RTy) (w : World Sig) :
    Function.Injective (incl ρ w) := by
  intro X Y hXY
  induction X using dom_ind with
  | h a ha =>
  induction Y using dom_ind with
  | h b hb =>
  apply cls_eq_cls.2
  have hco : ∀ (v : World Sig) (_ : w ⟶ v), Term.app (.app (.coextR ρ) a) b ∈ v.Γ := by
    intro v j
    refine (mem_coext ρ (World.inLang_of_le j.le ha) (World.inLang_of_le j.le hb)).2 fun xs => ?_
    exact Iff.of_eq (congrArg (fun S => (⟨v, xs, j⟩ : Tuple inner ρ w) ∈ S) hXY)
  have hbox : Term.box (Term.app (.app (.coextR ρ) a) b) ∈ w.Γ :=
    (mem_box_iff (by simp [ha, hb])).2 hco
  exact World.mem_of_th (Derivable.iffE₂ (World.th_of_C (intensionality a b)) (World.th_of_mem hbox))
    (by simp [ha, hb])

/-- The canonical intensional action premodel with base `w₀`. -/
noncomputable abbrev premodel [Countable Sig.Const] (w₀ : World Sig) : Premodel Sig (World Sig) where
  W₀ := w₀
  inner := inner
  nonempty_e := nonempty_dom_e
  incl ρ w := incl ρ w
  incl_map ρ _ _ h x := incl_map ρ h x
  incl_injective ρ w := incl_injective ρ w
  I c := cls (Term.const (Sig := ext Sig) (Sum.inl c)) (inLang_const_inl c)

variable [Countable Sig.Const] (w₀ : World Sig)

@[simp] theorem premodel_incl : (premodel w₀).incl = incl := rfl

/-! ### The readings of the logical constants are inclusions of their classes -/

section Readings

variable {W : World Sig}

theorem andRead_eq : (premodel w₀).andRead .t W = incl _ W (cls .and inLang_and) := by
  ext ⟨V, ⟨X, Y, u⟩, k⟩
  show ⟨V, u, 𝟙 V⟩ ∈ incl .t V X ∧ ⟨V, u, 𝟙 V⟩ ∈ incl .t V Y ↔ _
  rw [mem_incl, mem_incl, mem_incl_cls]
  exact (World.mem_conj_iff (rep_inLang X) (rep_inLang Y)).symm

theorem orRead_eq : (premodel w₀).orRead .t W = incl _ W (cls .or inLang_or) := by
  ext ⟨V, ⟨X, Y, u⟩, k⟩
  show ⟨V, u, 𝟙 V⟩ ∈ incl .t V X ∨ ⟨V, u, 𝟙 V⟩ ∈ incl .t V Y ↔ _
  rw [mem_incl, mem_incl, mem_incl_cls]
  exact (World.mem_disj_iff (rep_inLang X) (rep_inLang Y)).symm

theorem notRead_eq : (premodel w₀).negRead .t W = incl _ W (cls .not inLang_not) := by
  ext ⟨V, ⟨X, u⟩, k⟩
  show ⟨V, u, 𝟙 V⟩ ∉ incl .t V X ↔ _
  rw [mem_incl, mem_incl_cls]
  exact (World.mem_neg_iff (rep_inLang X)).symm

theorem allRead_eq (σ : Ty) : (premodel w₀).allRead σ W = incl _ W (cls (.all σ) (inLang_all σ)) := by
  ext ⟨V, ⟨B, u⟩, k⟩
  show (∀ a : Dom V σ, ⟨V, (a, PUnit.unit), 𝟙 V⟩ ∈ incl (σ ⇒ RTy.t) V B) ↔ _
  rw [mem_incl_cls]
  show _ ↔ Term.app (.all σ) (rep B) ∈ V.Γ
  rw [World.mem_all_iff (rep_inLang B)]
  constructor
  · intro h c hc
    have := (mem_incl _ B _).1 (h (cls c hc))
    exact (ev_congr_arg .t (rep_inLang B) PUnit.unit (rep_cls c hc)).1 this
  · intro h a
    exact (mem_incl _ B _).2 (h (rep a) (rep_inLang a))

theorem exRead_eq (σ : Ty) : (premodel w₀).exRead σ W = incl _ W (cls (.ex σ) (inLang_ex σ)) := by
  ext ⟨V, ⟨B, u⟩, k⟩
  show (∃ a : Dom V σ, ⟨V, (a, PUnit.unit), 𝟙 V⟩ ∈ incl (σ ⇒ RTy.t) V B) ↔ _
  rw [mem_incl_cls]
  show _ ↔ Term.app (.ex σ) (rep B) ∈ V.Γ
  rw [World.mem_ex_iff (rep_inLang B)]
  constructor
  · rintro ⟨a, ha⟩
    exact ⟨rep a, rep_inLang a, (mem_incl _ B _).1 ha⟩
  · rintro ⟨c, hc, h⟩
    refine ⟨cls c hc, (mem_incl _ B _).2 ?_⟩
    exact (ev_congr_arg .t (rep_inLang B) PUnit.unit (rep_cls c hc)).2 h

theorem eqRead_eq (σ : Ty) : (premodel w₀).eqRead σ W = incl _ W (cls (.eq σ) (inLang_eq σ)) := by
  ext ⟨V, ⟨x, y, u⟩, k⟩
  show x = y ↔ _
  rw [mem_incl_cls]
  exact (eq_rep_iff x y).symm

theorem constRead_eq (ρ : RTy) :
    (premodel w₀).constRead ρ W = incl _ W (cls (.constR ρ) (inLang_constR ρ)) := by
  ext ⟨V, ⟨q, xs⟩, k⟩
  show ⟨V, PUnit.unit, 𝟙 V⟩ ∈ incl .t V q ↔ _
  rw [mem_incl, mem_incl_cls]
  exact (ev_constR ρ xs (rep_inLang q)).symm

theorem negRead_eq (ρ : RTy) :
    (premodel w₀).negRead ρ W = incl _ W (cls (.negR ρ) (inLang_negR ρ)) := by
  ext ⟨V, ⟨X, xs⟩, k⟩
  show ⟨V, xs, 𝟙 V⟩ ∉ incl ρ V X ↔ _
  rw [mem_incl, mem_incl_cls]
  exact (ev_negR ρ xs (rep_inLang X)).symm

theorem andRRead_eq (ρ : RTy) :
    (premodel w₀).andRead ρ W = incl _ W (cls (.andR ρ) (inLang_andR ρ)) := by
  ext ⟨V, ⟨X, Y, xs⟩, k⟩
  show ⟨V, xs, 𝟙 V⟩ ∈ incl ρ V X ∧ ⟨V, xs, 𝟙 V⟩ ∈ incl ρ V Y ↔ _
  rw [mem_incl, mem_incl, mem_incl_cls]
  exact (ev_andR ρ xs (rep_inLang X) (rep_inLang Y)).symm

theorem orRRead_eq (ρ : RTy) :
    (premodel w₀).orRead ρ W = incl _ W (cls (.orR ρ) (inLang_orR ρ)) := by
  ext ⟨V, ⟨X, Y, xs⟩, k⟩
  show ⟨V, xs, 𝟙 V⟩ ∈ incl ρ V X ∨ ⟨V, xs, 𝟙 V⟩ ∈ incl ρ V Y ↔ _
  rw [mem_incl, mem_incl, mem_incl_cls]
  exact (ev_orR ρ xs (rep_inLang X) (rep_inLang Y)).symm

theorem coextRead_eq (ρ : RTy) :
    (premodel w₀).coextRead ρ W = incl _ W (cls (.coextR ρ) (inLang_coextR ρ)) := by
  ext ⟨V, ⟨X, Y, u⟩, k⟩
  show (∀ a : Args inner ρ V, ⟨V, a, 𝟙 V⟩ ∈ incl ρ V X ↔ ⟨V, a, 𝟙 V⟩ ∈ incl ρ V Y) ↔ _
  rw [mem_incl_cls]
  show _ ↔ Term.app (.app (.coextR ρ) (rep X)) (rep Y) ∈ V.Γ
  rw [mem_coext ρ (rep_inLang X) (rep_inLang Y)]
  exact forall_congr' fun a => by rw [mem_incl, mem_incl]

theorem inclRead_eq (ρ : RTy) :
    (premodel w₀).inclRead ρ W = incl _ W (cls (.inclR ρ) (inLang_inclR ρ)) := by
  ext ⟨V, ⟨X, Y, u⟩, k⟩
  show (∀ a : Args inner ρ V, ⟨V, a, 𝟙 V⟩ ∈ incl ρ V X → ⟨V, a, 𝟙 V⟩ ∈ incl ρ V Y) ↔ _
  rw [mem_incl_cls]
  show _ ↔ Term.app (.app (.inclR ρ) (rep X)) (rep Y) ∈ V.Γ
  rw [mem_inclR ρ (rep_inLang X) (rep_inLang Y)]
  exact forall_congr' fun a => by rw [mem_incl, mem_incl]

theorem boxRead_eq (ρ : RTy) :
    (premodel w₀).boxRead ρ W = incl _ W (cls (.boxR ρ) (inLang_boxR ρ)) := by
  ext ⟨V, ⟨X, xs⟩, k⟩
  show (∀ (U : World Sig) (j : V ⟶ U), ⟨U, Args.map inner ρ j xs, j⟩ ∈ incl ρ V X) ↔ _
  rw [mem_incl_cls]
  show _ ↔ ev ρ V (Term.app (.boxR ρ) (rep X)) xs
  rw [ev_boxR ρ xs (rep_inLang X)]
  exact forall_congr' fun U => forall_congr' fun j => by rw [mem_incl]

end Readings

/-! ### The truth lemma -/

/-- **The truth lemma.** The value of a term, relative to an arrow `w₀ ⟶ W` and an
assignment `g` of classes at `W`, is the inclusion of the class of the term read in the
ambient signature with representatives `s` of `g` substituted. -/
theorem sem_eq : ∀ {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) {W : World Sig} (h : w₀ ⟶ W)
    (g : IEnv ((premodel w₀).Dom W) Γ) (s : Sub (ext Sig) Γ []) (hs : ∀ τ (v : Var Γ τ), InLang W.S (s τ v)),
    (∀ τ (v : Var Γ τ), cls (s τ v) (hs τ v) = g.get v) →
    (premodel w₀).sem h t g = (premodel w₀).Incl σ W (cls ((lift t).subst s) (inLang_subst (inLang_lift t) hs))
  | _, _, .var v, W, h, g, s, hs, hsg => by
    show (premodel w₀).Incl _ W (g.get v) = (premodel w₀).Incl _ W (cls (s _ v) (hs _ v))
    rw [hsg]
  | _, _, .const c, W, h, g, s, hs, hsg => rfl
  | _, _, .app f a, W, h, g, s, hs, hsg => by
    show (premodel w₀).apply ((premodel w₀).sem h f g) ((premodel w₀).sem h a g) = _
    rw [sem_eq f h g s hs hsg, sem_eq a h g s hs hsg, Premodel.apply_Incl]
    exact incl_app _ _ _ _
  | _, _, .lam (σ := σ) (ρ := ρ) b, W, h, g, s, hs, hsg => by
    ext ⟨V, ⟨x, xs⟩, k⟩
    have hs' : ∀ τ (v : Var (σ :: _) τ), InLang V.S (Sub.cons (rep x) s τ v) := by
      intro τ v
      cases v with
      | zero => exact rep_inLang x
      | succ v => exact World.inLang_of_le k.le (hs _ v)
    have hsg' : ∀ τ (v : Var (σ :: _) τ), cls (Sub.cons (rep x) s τ v) (hs' τ v)
        = (IEnv.cons x ((premodel w₀).push k g)).get v := by
      intro τ v
      cases v with
      | zero => exact cls_rep x
      | succ v =>
        show cls (s τ v) _ = ((premodel w₀).push k g).get v
        rw [Premodel.push, IEnv.get_map, ← hsg τ v]
        rfl
    rw [Premodel.mem_sem_lam, sem_eq b (h ≫ k) _ _ hs' hsg']
    show ev ρ V ((lift b).subst (Sub.cons (rep x) s)) xs
      ↔ ev ρ V (.app (.lam ((lift b).subst (Sub.lift s))) (rep x)) xs
    have hb : InLang V.S ((lift b).subst (Sub.lift s)) := inLang_subst (inLang_lift b) fun τ v => by
      cases v with
      | zero => exact inLang_var _
      | succ v => exact (inLang_rename _).2 (World.inLang_of_le k.le (hs _ v))
    rw [ev_conv ρ xs (Conv.beta _ _) (by simp [hb, rep_inLang x])
      (inLang_instantiate hb (rep_inLang x)), Term.instantiate, Term.subst_subst, Sub.comp_cons_lift]
  | _, _, .and, _, _, _, _, _, _ => andRead_eq w₀
  | _, _, .or, _, _, _, _, _, _ => orRead_eq w₀
  | _, _, .not, _, _, _, _, _, _ => notRead_eq w₀
  | _, _, .all σ, _, _, _, _, _, _ => allRead_eq w₀ σ
  | _, _, .ex σ, _, _, _, _, _, _ => exRead_eq w₀ σ
  | _, _, .eq σ, _, _, _, _, _, _ => eqRead_eq w₀ σ
  | _, _, .constR ρ, _, _, _, _, _, _ => constRead_eq w₀ ρ
  | _, _, .negR ρ, _, _, _, _, _, _ => negRead_eq w₀ ρ
  | _, _, .andR ρ, _, _, _, _, _, _ => andRRead_eq w₀ ρ
  | _, _, .orR ρ, _, _, _, _, _, _ => orRRead_eq w₀ ρ
  | _, _, .coextR ρ, _, _, _, _, _, _ => coextRead_eq w₀ ρ
  | _, _, .boxR ρ, _, _, _, _, _, _ => boxRead_eq w₀ ρ
  | _, _, .inclR ρ, _, _, _, _, _, _ => inclRead_eq w₀ ρ

/-- **The canonical premodel is a model**: every value is the inclusion of a class. -/
theorem isModel : (premodel w₀).IsModel := fun {_ _ _} h t g =>
  ⟨_, (sem_eq w₀ t h g (fun _ v => rep (g.get v)) (fun _ _ => rep_inLang _) (fun _ _ => cls_rep _)).symm⟩

/-- A sentence holds in the canonical model iff it is in the base world's theory. -/
theorem holdsSentence_iff (p : Sentence Sig) : (premodel w₀).HoldsSentence p ↔ lift p ∈ w₀.Γ := by
  unfold Premodel.HoldsSentence Premodel.Holds
  rw [sem_eq w₀ p (𝟙 _) .nil Sub.id (fun _ v => nomatch v) (fun _ v => nomatch v)]
  show (lift p).subst Sub.id ∈ w₀.Γ ↔ _
  rw [Term.subst_id]

end Canonical

end Completeness

end Classicism.Meta
