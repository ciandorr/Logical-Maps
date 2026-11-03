import Classicism.Results.SentenceSchemas.WitnessedPossibility
import Classicism.Results.SentenceSchemas.PossibilityDistinctness
import Classicism.Completeness.ConstantBlocks
import Classicism.Syntax.Inhabited
import Classicism.Syntax.PossibilityPlus

/-!
# Separated Structure, Independence and the signature schemas

The map's results about the Σ-combinatorialism family that put terms for constants or
variables for constants in derivations (`Completeness/ConstantBlocks.lean`):

- **Iterated Separated Structure** (`ss_iter`): `F d̄ = G d̄ → F = G` for distinct constants
  `d̄` occurring in neither `F` nor `G`, peeling one constant at a time; and its form for a
  formula (`ss_box`): `□P[d̄/x̄] → λx̄. P = λx̄. ⊤`.
- `separated-structure-r-implies-possibly-witnessed-possibility-r`,
  `separated-structure-r-implies-independence-signature-r`,
  `pure-distinctness-and-separated-structure-imply-signature-distinctness`: from `ss_box`.
- `distinctness-signature-r-implies-separated-structure-r`: where `Fc = Gc` is a theorem,
  the variable put for `c` (`CMap.abstract`) makes `∀x. Fx = Gx` one, and Modalized
  Functionality gives `F = G`; otherwise Distinctness refutes `Fc = Gc`.
- `possibility-signature-r-implies-witnessed-possibility-r`: where `P[c̄/x̄]` is consistent,
  Possibility; otherwise `C ⊢ ¬P[c̄/x̄]`, so `C ⊢ ¬P` with the block put back for the
  constants (`Term.cmap_block_subst_consts`), and `∃x̄. P` is refutable.
- `possibly-witnessed-possibility-r-implies-separated-structure-r`: the constants of `F`,
  `G` other than `c` abstracted (`Term.exists_abstract`), Possibly Witnessed Possibility at
  `¬(F°ȳx = G°ȳx)`, then Modalized Functionality; and
  `logical-necessity-r-implies-separated-structure-r` through Possibly Witnessed Possibility.
- `witnessed-possibility-r-implies-independence-signature-r`: Witnessed Possibility at
  `x ≠ Aȳ`, whose closure is a theorem.
- `logical-necessity-r-implies-modal-freedom-signature-r`.
-/

namespace Classicism

section shallow

/-- Separated Structure gives Possibly Witnessed Possibility: `□¬a` gives `e`, a necessary
truth when true, which necessitates `¬g`. -/
theorem ss_pwp_glue (a g e : Prop) : (□ ¬ a → e) → (e → □ e) → □ (e → ¬ g) → ◇ g → ◇ a :=
  fun h1 h2 h3 hg => (em (◇ a)).elim id fun hna =>
    absurd hg (not_dia_of_box_not g (modal_K _ _ h3 (h2 (h1 (box_not_of_not_dia a hna)))))

/-- Logical Necessity gives Possibly Witnessed Possibility: at `¬a`, and with no constants
at `f`. -/
theorem ln_pwp_glue (a f g : Prop) : (□ ¬ a ↔ f) → (□ f ↔ f) → □ (f → ¬ g) → ◇ g → ◇ a :=
  fun h1 h2 h3 hg => (em (◇ a)).elim id fun hna =>
    absurd hg (not_dia_of_box_not g (modal_K _ _ h3 (h2.2 (h1.1 (box_not_of_not_dia a hna)))))

/-- Possibly Witnessed Possibility gives Separated Structure: `q` is necessary, so `◇¬q`
fails, so `◇g` does, and `□¬g` necessitates `f`. -/
theorem pwp_ss_glue (q g f : Prop) : (◇ g → ◇ ¬ q) → (q → □ q) → □ (¬ g → f) → q → □ f :=
  fun h1 h2 h3 hq => modal_K _ _ h3 (box_not_of_not_dia g (fun hg =>
    not_dia_of_box_not (¬ q) (modal_K _ _ (nec% (fun (h : q) (hn : ¬ q) => hn h)) (h2 hq)) (h1 hg)))

section ind
variable {τ : Type} [Rel τ]

/-- Separated Structure gives Independence: `x = u` necessitated makes `e`, which puts both
`⊤` and `⊥` for `u`. -/
theorem ss_ind_glue (x u : τ) (e : Prop) : (x = u → □ (x = u)) → (□ (x = u) → e) →
    (e → Rel.top τ = u) → (e → Rel.bot τ = u) → ¬ Rel.top τ = Rel.bot τ → ¬ x = u :=
  fun hni hb ht hbot htb hx => htb ((ht (hb (hni hx))).trans (hbot (hb (hni hx))).symm)

end ind

/-- Witnessed Possibility gives Independence: what is necessary when true is false when
its negation is possible. -/
theorem wp_ind_glue (q : Prop) : (q → □ q) → ◇ ¬ q → ¬ q :=
  fun hn hd hq => not_dia_of_box_not (¬ q) (modal_K _ _ (nec% (fun (h : q) (hn' : ¬ q) => hn' h)) (hn hq)) hd

/-- Logical Necessity at `¬a`: `◇a` refutes `∀x̄. ¬P`, so gives `∃x̄. P`. -/
theorem ln_mf_glue₁ (a f e : Prop) : (□ ¬ a ↔ f) → (¬ f → e) → ◇ a → e :=
  fun h1 h2 ha => h2 (fun hf => not_dia_of_box_not a (h1.2 hf) ha)

/-- Logical Necessity at `¬r`: what refutes `∀x̄. ¬R` makes `r` possible. -/
theorem ln_mf_glue₂ (r f e : Prop) : (□ ¬ r ↔ f) → (e → ¬ f) → e → ◇ r :=
  fun h1 h2 he => by rw [dia_eq_not_box_not]; exact fun hb => h2 he (h1.1 hb)

end shallow

#classicism_derive Classicism.ln_mf_glue₁ Classicism.ln_mf_glue₂
#classicism_derive Classicism.ss_ind_glue Classicism.wp_ind_glue
#classicism_derive Classicism.ss_pwp_glue Classicism.ln_pwp_glue Classicism.modalized_functionality
  Classicism.pwp_ss_glue

namespace Meta

open AxiomSet

variable {Sig : Signature}

/-! ### Block forms: constants, types, conversions -/

namespace Term

theorem consts_lamBlock : ∀ (σs : List Ty) {Γ : Ctx} {ρ : RTy} (b : Term Sig (Ctx.block σs Γ) ρ),
    (lamBlock σs b).consts = b.consts
  | [], _, _, _ => rfl
  | _ :: σs, _, _, b => consts_lamBlock σs (Γ := _ :: _) b

theorem closedTypes_lamBlock : ∀ (σs : List Ty) {Γ : Ctx} {ρ : RTy} (b : Term Sig (Ctx.block σs Γ) ρ),
    (lamBlock σs b).closedTypes = (σs.all (fun σ => decide σ.Closed) && b.closedTypes)
  | [], _, _, _ => by simp [lamBlock]
  | σ :: σs, _, _, b => by
    simp only [lamBlock, closedTypes, closedTypes_lamBlock σs b, List.all_cons, Bool.and_assoc]

theorem ofPure_lamBlock : ∀ (σs : List Ty) {Γ : Ctx} {ρ : RTy} (b : Term Signature.pure (Ctx.block σs Γ) ρ),
    Term.ofPure (Sig := Sig) (lamBlock σs b) = lamBlock σs (Term.ofPure b)
  | [], _, _, _ => rfl
  | _ :: σs, _, _, b => by
    show Term.ofPure (Term.lam (lamBlock σs b)) = Term.lam (lamBlock σs (Term.ofPure b))
    rw [ofPure_lam, ofPure_lamBlock σs b]

theorem consts_ofPure : ∀ {Γ : Ctx} {σ : Ty} (t : Term Signature.pure Γ σ),
    (Term.ofPure (Sig := Sig) t).consts = ∅ :=
  fun t => consts_eq_empty_of_pure _ (pure_ofPure t)

end Term

/-- `□`'s right side is `⊤` in every context: substitution leaves it. -/
theorem Term.subst_top {Γ Δ : Ctx} (s : Sub Sig Γ Δ) : (Term.top : Formula Sig Γ).subst s = Term.top := rfl

/-- Conversion of the two sides of an implication. -/
theorem Conv.imp_congr {Γ : Ctx} {p p' q q' : Formula Sig Γ} (hp : p ≡ p') (hq : q ≡ q') :
    Term.imp p q ≡ Term.imp p' q' :=
  Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.app_congr (Conv.refl _) hp)) hq

/-- Conversion of the two sides of an identity. -/
theorem Conv.eq_congr {Γ : Ctx} {σ : Ty} {a a' b b' : Term Sig Γ σ} (ha : a ≡ a') (hb : b ≡ b') :
    Term.eq' a b ≡ Term.eq' a' b' :=
  Conv.app_congr (Conv.app_congr (Conv.refl _) ha) hb

/-- The theorems of `C` with the empty schema are those of `C`. -/
theorem theorem_union_empty {p : Sentence Sig} :
    Theorem (C.axioms ∪ (empty : AxiomSet Sig)) p ↔ C.Theorem p :=
  ⟨fun h => Derivable.mono (fun _ h => h.elim id False.elim) h, fun h => Theorem.ofC h⟩

namespace Derivable

variable {Ax : AxiomSet Sig}

/-- `λx̄. P = λx̄. ⊤` gives `∀x̄. P`: Leibniz's Law at the block quantifier. -/
theorem forallBlock_of_lamBlock_eq_top (σs : List Ty) {Γ : Ctx} {Δ : List (Formula Sig Γ)}
    {P : Formula Sig (Ctx.block σs Γ)}
    (h : Derivable Ax Δ (Term.eq' (Term.lamBlock σs P) (Term.lamBlock σs Term.top))) :
    Derivable Ax Δ (Term.forallBlock σs P) :=
  conv (ll (Term.allC σs) (eqSymm h) (allIC σs top)) (Conv.allC_lamBlock σs P)

/-- `¬∃x̄. ¬P` gives `∀x̄. P`. -/
theorem forallBlock_of_not_existsBlock_neg (σs : List Ty) {Γ : Ctx} {Δ : List (Formula Sig Γ)}
    {P : Formula Sig (Ctx.block σs Γ)}
    (h : Derivable Ax Δ (Term.neg (Term.existsBlock σs (Term.neg P)))) :
    Derivable Ax Δ (Term.forallBlock σs P) :=
  allIBlock σs (orE (em P) hyp₀
    (notE (exIBlock_vars σs hyp₀) (weaken₁ (rename (Ren.wkBlock σs) h))))

end Derivable

/-! ### Iterated Separated Structure -/

/-- **Iterated Separated Structure**: `F d̄ = G d̄ → F = G`, for distinct constants `d̄` in
neither `F` nor `G`, by Separated Structure at each constant, the last first. -/
theorem ss_iter {X : AxiomSet Sig} (hX : separatedStructure Sig ⊆ X) :
    ∀ (ds : List Sig.Const) {ρ : RTy} (F G : Term Sig [] (ds.map Sig.typeOf ⇒* ρ)), ds.Nodup →
    (∀ d ∈ ds, d ∉ F.consts ∧ d ∉ G.consts) → F.closedTypes = true → G.closedTypes = true →
    Theorem (C.axioms ∪ X) (Term.imp (Term.eq' (Term.appBlock F (Terms.consts ds))
      (Term.appBlock G (Terms.consts ds))) (Term.eq' F G))
  | [], _, _, _, _, _, _, _ => Derivable.impI Derivable.hyp₀
  | d :: ds, ρ, F, G, hnd, hc, hF, hG => by
    have hd : d ∉ ds := (List.nodup_cons.1 hnd).1
    have hcl := Term.closed_of_closedTypes hF
    have hτ : (Sig.typeOf d).Closed := hcl.1
    have hτ' : (ds.map Sig.typeOf ⇒* ρ).Closed := hcl.2
    have fresh : ∀ (H : Term Sig [] ((d :: ds).map Sig.typeOf ⇒* ρ)), (∀ d' ∈ d :: ds, d' ∉ H.consts) →
        ∀ d' ∈ ds, d' ∉ (Term.app H (Term.const d)).consts := by
      intro H hH d' hd' h'
      rcases h' with h' | h'
      · exact hH d' (List.mem_cons_of_mem _ hd') h'
      · exact hd (by rw [Set.mem_singleton_iff.1 h'] at hd'; exact hd')
    have ih := ss_iter hX ds (Term.app F (Term.const d)) (Term.app G (Term.const d))
      (List.nodup_cons.1 hnd).2
      (fun d' hd' => ⟨fresh F (fun d' h => (hc d' h).1) d' hd', fresh G (fun d' h => (hc d' h).2) d' hd'⟩)
      (by simp [Term.closedTypes, hF, hτ]) (by simp [Term.closedTypes, hG, hτ])

    have hs : Theorem (C.axioms ∪ X) (Term.imp (Term.eq' (Term.app F (Term.const d))
        (Term.app G (Term.const d))) (Term.eq' F G)) :=
      Theorem.ax (hX _ ⟨by simp [Term.closedTypes, hF, hG, hτ, hτ'], d, _, F, G,
        (hc d List.mem_cons_self).1, (hc d List.mem_cons_self).2, rfl⟩)
    exact Derivable.impI (Derivable.impE (Derivable.weaken₁ hs)
      (Derivable.impE (Derivable.weaken₁ ih) Derivable.hyp₀))

/-- **Iterated Separated Structure for a formula**: `□P[d̄/x̄] → λx̄. P = λx̄. ⊤`, for a
formula `P` in the block of the distinct constants `d̄`, none of which occurs in it. -/
theorem ss_box {X : AxiomSet Sig} (hX : separatedStructure Sig ⊆ X) (cs : List Sig.Const)
    (hnd : cs.Nodup) (P : Formula Sig (Ctx.block (cs.map Sig.typeOf) []))
    (hP : ∀ c ∈ cs, c ∉ P.consts) (hcl : (Term.lamBlock _ P).closedTypes = true) :
    Theorem (C.axioms ∪ X) (Term.imp (Term.box (P.subst (Sub.consBlock (Terms.constsAt [] cs) Sub.id)))
      (Term.eq' (Term.lamBlock _ P) (Term.lamBlock _ Term.top))) := by
  have hcl' : (Term.lamBlock (Γ := []) (cs.map Sig.typeOf) (Term.top : Formula Sig _)).closedTypes = true := by
    rw [Term.closedTypes_lamBlock] at hcl ⊢
    simp only [Bool.and_eq_true] at hcl
    simp [hcl.1]
  have h := ss_iter hX cs (Term.lamBlock _ P) (Term.lamBlock _ Term.top) hnd
    (fun c hc => ⟨by rw [Term.consts_lamBlock]; exact hP c hc,
      by rw [Term.consts_lamBlock]; exact fun h => by simp [Term.consts] at h⟩) hcl hcl'
  rw [Terms.consts_eq_constsAt] at h
  refine Derivable.conv h (Conv.imp_congr (Conv.eq_congr (Conv.appBlock_lamBlock _ P _) ?_) (Conv.refl _))
  exact Conv.appBlock_lamBlock _ Term.top _

/-! ### Separated Structure gives Possibly Witnessed Possibility -/

/-- The block quantifiers, read in a signature, keep the paper's language when the block's
types are closed. -/
local macro "split_closed " h:ident : tactic => `(tactic| simp only [Term.closedTypes_imp,
  Term.closedTypes_iff, Term.closedTypes_dia, Term.closedTypes_box, Term.closedTypes_conj,
  Term.closedTypes_neg, Term.closedTypes_ofPure, Term.closedTypes_atConsts,
  Term.closedTypes_forallBlock_eq_existsBlock, Term.closedTypes_eq', Term.closedTypes_bot,
  Term.closedTypes_top, Term.closedTypes_forall', Term.closedTypes_var, Ty.closed_rel,
  RTy.closed_t, decide_true, Bool.and_true, Bool.and_eq_true, and_true] at $h:ident)

/-- `atConsts`, as the block substitution of `Terms.constsAt`. -/
theorem atConsts_eq (cs : List Sig.Const)
    (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])) :
    Term.atConsts cs P = (Term.ofPure P).subst (Sub.consBlock (Terms.constsAt [] cs) Sub.id) := by
  rw [Term.atConsts, Terms.consts_eq_constsAt]

/-- `separated-structure-r-implies-possibly-witnessed-possibility-r`. -/
theorem separatedStructure_entails_possiblyWitnessedPossibility :
    separatedStructure Sig ⟹ possiblyWitnessedPossibility Sig := by
  rintro a ⟨hc, cs, P, hcs, rfl⟩
  split_closed hc
  have hex := hc.1
  rw [Term.closedTypes_existsBlock] at hex
  simp only [Bool.and_eq_true] at hex
  let L : Term Sig [] _ := Term.lamBlock (cs.map Sig.typeOf) (Term.neg (Term.ofPure P))
  let e : Sentence Sig := Term.eq' L (Term.lamBlock (cs.map Sig.typeOf) Term.top)
  have h1 : Theorem (C.axioms ∪ separatedStructure Sig)
      (Term.imp (Term.box (Term.neg (Term.atConsts cs P))) e) := by
    rw [atConsts_eq]
    exact ss_box (fun _ h => h) cs hcs (Term.neg (Term.ofPure P))
      (fun c _ h => by
        have : (Term.neg (Term.ofPure (Sig := Sig) P)).consts = ∅ := Term.consts_ofPure (Term.neg P)
        rw [this] at h; exact h)
      (by rw [Term.closedTypes_lamBlock]; simp [hex.1, hex.2])
  have h2 : C.Theorem (Term.imp e (Term.box e)) := Completeness.nec_identity _ _
  have h3 : C.Theorem (Term.box (Term.imp e (Term.neg (Term.ofPure (Term.existsBlock _ P))))) := by
    refine C.Theorem.nec (Derivable.impI ?_)
    rw [Term.ofPure_existsBlock]
    exact Derivable.notI (q := Term.top)
      (Derivable.existsBlock_forallBlock_neg _ Derivable.hyp₀
        (Derivable.forallBlock_of_lamBlock_eq_top _ (Derivable.weaken₁ Derivable.hyp₀)))
      (Derivable.existsBlock_forallBlock_neg _ Derivable.hyp₀
        (Derivable.forallBlock_of_lamBlock_eq_top _ (Derivable.weaken₁ Derivable.hyp₀)))
  exact Theorem.mp (Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure ss_pwp_glue.derivable)) _ _ e) h1 (Theorem.ofC h2))
    (Theorem.ofC h3)

/-! ### Logical Necessity gives Possibly Witnessed Possibility -/

/-- Logical Necessity gives Possibly Witnessed Possibility: at `¬P`, and with no constants
at `∀x̄. ¬P`. -/
theorem logicalNecessity_entails_possiblyWitnessedPossibility :
    logicalNecessity Sig ⟹ possiblyWitnessedPossibility Sig := by
  rintro a ⟨hc, cs, P, hcs, rfl⟩
  split_closed hc
  have h1 : Theorem (C.axioms ∪ logicalNecessity Sig)
      (Term.iff (Term.box (Term.atConsts cs (Term.neg P))) (Term.ofPure (Term.forallBlock _ (Term.neg P)))) :=
    Theorem.ax (logicalNecessity_mem hcs (by rw [closedTypes_existsBlock_neg]; exact hc.1))
  have h2 : Theorem (C.axioms ∪ logicalNecessity Sig)
      (Term.iff (Term.box (Term.atConsts [] (Term.forallBlock _ (Term.neg P))))
        (Term.ofPure (Term.forallBlock [] (Term.forallBlock _ (Term.neg P))))) :=
    Theorem.ax (logicalNecessity_mem List.nodup_nil (by
      show (Term.forallBlock _ (Term.neg P)).closedTypes = true
      rw [Term.closedTypes_forallBlock_eq_existsBlock, closedTypes_existsBlock_neg]; exact hc.1))
  rw [Term.atConsts_nil] at h2
  have h3 : C.Theorem (Sig := Sig) (Term.box (Term.imp (Term.ofPure (Term.forallBlock _ (Term.neg P)))
      (Term.neg (Term.ofPure (Term.existsBlock _ P))))) := by
    refine C.Theorem.nec (Derivable.impI ?_)
    rw [Term.ofPure_existsBlock, Term.ofPure_forallBlock]
    exact Derivable.notI (q := Term.top)
      (Derivable.existsBlock_forallBlock_neg _ Derivable.hyp₀ (Derivable.weaken₁ Derivable.hyp₀))
      (Derivable.existsBlock_forallBlock_neg _ Derivable.hyp₀ (Derivable.weaken₁ Derivable.hyp₀))
  exact Theorem.mp (Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure ln_pwp_glue.derivable)) _ _ _) h1 h2) (Theorem.ofC h3)

/-! ### Distinctness gives Separated Structure and Witnessed Possibility -/

/-- Modalized Functionality, at two closed terms: `□(∀x. Fx = Gx) → F = G`. -/
theorem modalizedFunctionality_at {σ : Ty} {ρ : RTy} (F G : Term Sig [] (σ ⇒ ρ)) :
    C.TheoremMinus (Term.imp (Term.box (Term.forall' (Term.eq' (Term.app F.weaken (Term.var .zero))
      (Term.app G.weaken (Term.var .zero))))) (Term.eq' F G)) :=
  Derivable.allE₂β (C.TheoremMinus.ofPure (modalized_functionality.derivable σ ρ)) F G

/-- `distinctness-signature-r-implies-separated-structure-r`: where `Fc = Gc` is a theorem,
the variable put for `c` makes `∀x. Fx = Gx` one, and Modalized Functionality gives
`F = G`; where it is not, Distinctness refutes it. -/
theorem distinctness_entails_separatedStructure :
    distinctness (empty : AxiomSet Sig) ⟹ separatedStructure Sig := by
  rintro a ⟨hc, c, ρ, F, G, hF, hG, rfl⟩
  have hc' := hc
  simp only [Term.closedTypes_imp, Bool.and_eq_true] at hc'
  by_cases hthm : Theorem (C.axioms ∪ (empty : AxiomSet Sig))
      (Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c)))
  · have h₁ := Derivable.rename (Ren.shift (σ := Sig.typeOf c)) (theorem_union_empty.1 hthm)
    have h₂ := Derivable.cmap (M := {c}) (fun a ha c' hc' => absurd hc' (C.axioms_consts ha c'))
      (CMap.abstract c (.zero : Var [Sig.typeOf c] _)) (CMap.abstract_fixes _ _) h₁
    have fx : ∀ H : Term Sig [] (Sig.typeOf c ⇒ ρ), c ∉ H.consts →
        (H.rename (Ren.shift (σ := Sig.typeOf c))).cmap (CMap.abstract c .zero) = H.weaken :=
      fun H hH => Term.cmap_of_fixes _ (CMap.abstract_fixes _ _) _ (fun c' hc' => by
        rw [Term.consts_rename] at hc'
        simp only [Set.mem_singleton_iff]
        rintro rfl; exact hH hc')
    have h₃ : C.Derivable ([] : List (Formula Sig [Sig.typeOf c]))
        (Term.eq' (Term.app F.weaken (Term.var .zero)) (Term.app G.weaken (Term.var .zero))) := by
      have e : ((Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c))).rename
          (Ren.shift (σ := Sig.typeOf c))).cmap (CMap.abstract c .zero) =
          Term.eq' (Term.app F.weaken (Term.var .zero)) (Term.app G.weaken (Term.var .zero)) := by
        simp only [Term.rename_app, Term.rename_eq, Term.rename_const, Term.cmap, fx F hF, fx G hG,
          CMap.abstract_self]
      rw [← e]; exact h₂
    have h₅ := C.Theorem.nec (Derivable.allI (Δ := []) h₃)
    exact Derivable.impI (Derivable.weaken₁
      (Theorem.mp (Theorem.ofCMinus (modalizedFunctionality_at F G)) (Theorem.ofC h₅)))
  · have hd := Theorem.ax (Ax := distinctness (empty : AxiomSet Sig)) (distinctness_mem hc'.1 hthm)
    exact Derivable.impI (Derivable.notE Derivable.hyp₀ (Derivable.weaken₁ hd))

/-- Possibility relative to `C` gives Witnessed Possibility: where `P[c̄/x̄]` is consistent,
it is possible; where it is not, `C ⊢ ¬P[c̄/x̄]`, so with the block put back for the
constants `C ⊢ ¬P`, and `∃x̄. P` is refuted. -/
theorem possibility_entails_witnessedPossibility :
    possibility (empty : AxiomSet Sig) ⟹ witnessedPossibility Sig := by
  rintro a ⟨hc, cs, P, hcs, rfl⟩
  split_closed hc
  by_cases hcons : Consistent ((empty : AxiomSet Sig) ∪ single (Term.atConsts cs P))
  · exact Derivable.impI (Derivable.weaken₁ (Theorem.ax (possibility_mem
      (by rw [Term.closedTypes_atConsts]; exact closedTypes_of_existsBlock hc.1) hcons)))
  · have h₀ : C.Theorem (Term.imp (Term.atConsts cs P) Term.bot) :=
      theorem_union_empty.1 (Theorem.deductionC (Classical.not_not.1 hcons))
    have h₁ := Derivable.rename (Ren.wkBlock (cs.map Sig.typeOf) (Γ := [])) h₀
    have h₂ := Derivable.cmap (M := {c | c ∈ cs})
      (fun a ha c' hc' => absurd hc' (C.axioms_consts ha c')) (CMap.block cs []) (CMap.block_fixes cs []) h₁
    have e : ((Term.imp (Term.atConsts cs P) Term.bot).rename (Ren.wkBlock (cs.map Sig.typeOf))).cmap
        (CMap.block cs []) = Term.imp (Term.ofPure P) Term.bot := by
      have := Term.cmap_block_subst_consts cs hcs (Term.ofPure P) (Term.pure_ofPure P) Ren.id
        (Ren.wkBlock _) (CMap.block cs []) (fun c _ => (Term.rename_id _).symm)
      rw [Term.rename_id] at this
      rw [atConsts_eq]
      show Term.imp (((Term.ofPure P).subst _).rename _ |>.cmap _) Term.bot = _
      rw [this]
    rw [e] at h₂
    have h₃ : Derivable (C.axioms ∪ possibility (empty : AxiomSet Sig))
        ([] : List (Formula Sig (Ctx.block (cs.map Sig.typeOf) []))) (Term.imp (Term.ofPure P) Term.bot) :=
      Derivable.mono (fun _ => Or.inl) h₂
    rw [Term.ofPure_existsBlock]
    exact Derivable.impI (Derivable.exEBlock _ Derivable.hyp₀
      (Derivable.botE (Derivable.impE (Derivable.weaken h₃ (List.nil_subset _)) Derivable.hyp₀)))

/-- `possibility-signature-r-implies-witnessed-possibility-r` (the map's premise is
Maximalism in its official form, Distinctness). -/
theorem distinctness_entails_witnessedPossibility :
    distinctness (empty : AxiomSet Sig) ⟹ witnessedPossibility Sig :=
  Entails.trans (distinctness_entails_possibility empty) possibility_entails_witnessedPossibility

/-! ### Possibly Witnessed Possibility gives Separated Structure -/

/-- A block abstraction at `[τ]`, then the constant `a` for the remaining variable. -/
theorem subst_consBlock_constsAt_cons (ds : List Sig.Const) {τ σ : Ty} (a : Term Sig [] τ)
    (X : Term Sig (Ctx.block (ds.map Sig.typeOf) [τ]) σ) :
    (X.subst (Sub.consBlock (Terms.constsAt [τ] ds) Sub.id)).subst (Sub.cons a Sub.id) =
      X.subst (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons a Sub.id)) := by
  rw [Term.subst_subst, Sub.comp_consBlock, Terms.subst_constsAt]
  rfl

/-- `∀x. B` gives `∀x. B'` where `B` gives `B'`. -/
theorem Derivable.forall_mono {Ax : AxiomSet Sig} {τ : Ty} {B B' : Formula Sig [τ]}
    (h : Derivable Ax [B] B') : Derivable Ax [Term.forall' B] (Term.forall' B') :=
  Derivable.allI (Derivable.impE (Derivable.weaken (Derivable.impI h) (List.nil_subset _))
    (Derivable.conv (Derivable.allE (F := (Term.lam B).weaken) Derivable.hyp₀ (Term.var .zero))
      (Conv.app_lam_weaken_zero B)))

/-- The constants of two terms, listed without repetition. -/
theorem exists_consts_list {Γ Γ' : Ctx} {σ σ' : Ty} (F : Term Sig Γ σ) (G : Term Sig Γ' σ') :
    ∃ ds : List Sig.Const, ds.Nodup ∧ ∀ d, d ∈ ds ↔ d ∈ F.consts ∪ G.consts :=
  ⟨((Term.consts_finite F).union (Term.consts_finite G)).toFinset.toList, Finset.nodup_toList _,
    fun d => by simp⟩

theorem all_closed_map (hS : Sig.Closed) (cs : List Sig.Const) :
    (cs.map Sig.typeOf).all (fun σ => decide σ.Closed) = true := by
  simp [List.all_eq_true, hS _]

/-- `possibly-witnessed-possibility-r-implies-separated-structure-r`. -/
theorem possiblyWitnessedPossibility_entails_separatedStructure (hS : Sig.Closed) :
    possiblyWitnessedPossibility Sig ⟹ separatedStructure Sig := by
  rintro a ⟨hc, c, ρ, F, G, hF, hG, rfl⟩
  have hc' := hc
  simp only [Term.closedTypes_imp, Term.closedTypes_eq', Bool.and_eq_true] at hc'
  have hFc : F.closedTypes = true := hc'.2.1
  have hGc : G.closedTypes = true := hc'.2.2
  have hτ : (Sig.typeOf c).Closed := (Term.closed_of_closedTypes hFc).1
  have hρ : ρ.Closed := (Term.closed_of_closedTypes hFc).2
  obtain ⟨ds, hds, hdsm⟩ := exists_consts_list F G
  have hcds : c ∉ ds := fun h => ((hdsm c).1 h).elim hF hG
  let τ := Sig.typeOf c
  let Fx : Term Sig [τ] ρ := Term.app F.weaken (Term.var .zero)
  let Gx : Term Sig [τ] ρ := Term.app G.weaken (Term.var .zero)
  have mem : ∀ H : Term Sig [] (τ ⇒ ρ), (∀ d ∈ H.consts, d ∈ F.consts ∪ G.consts) →
      ∀ d ∈ (Term.app H.weaken (Term.var .zero) : Term Sig [τ] ρ).consts, d ∈ ds := by
    intro H hH d hd
    rcases hd with hd | hd
    · rw [Term.consts_rename] at hd; exact (hdsm d).2 (hH d hd)
    · exact absurd hd (Set.notMem_empty d)
  obtain ⟨F₀, eF, cF⟩ := Term.exists_abstract ds Fx (mem F (fun d h => Or.inl h))
  obtain ⟨G₀, eG, cG⟩ := Term.exists_abstract ds Gx (mem G (fun d h => Or.inr h))
  let E : Formula Signature.pure (Ctx.block ((c :: ds).map Sig.typeOf) []) := Term.eq' F₀ G₀
  have hnd : (c :: ds).Nodup := List.nodup_cons.2 ⟨hcds, hds⟩
  have hEc : (Term.existsBlock ((c :: ds).map Sig.typeOf) (Term.neg E)).closedTypes = true := by
    rw [Term.closedTypes_existsBlock, all_closed_map hS]
    simp only [E, cF, cG, Fx, Gx, Term.closedTypes,
      Term.weaken, Term.closedTypes_rename, hFc, hGc, hτ, hρ, Ty.closed_rel, Bool.true_and,
      decide_true]
  have hpwp := Theorem.ax (Ax := possiblyWitnessedPossibility Sig)
    (possiblyWitnessedPossibility_mem hnd hEc)
  have eq₀ : (Term.ofPure (Sig := Sig) E).subst
      (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons (Term.const c) Sub.id)) =
      Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c)) := by
    show Term.eq' ((Term.ofPure F₀).subst _) ((Term.ofPure G₀).subst _) = _
    rw [← subst_consBlock_constsAt_cons, ← subst_consBlock_constsAt_cons, eF, eG]
    show Term.eq' (Term.app (F.weaken.instantiate _) _) (Term.app (G.weaken.instantiate _) _) = _
    rw [Term.instantiate_weaken, Term.instantiate_weaken]
    rfl
  rw [atConsts_eq] at hpwp
  have eq₁ : (Term.ofPure (Sig := Sig) (Term.neg E)).subst
      (Sub.consBlock (Terms.constsAt [] (c :: ds)) Sub.id) =
      Term.neg (Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c))) := by
    show Term.neg ((Term.ofPure E).subst (Sub.consBlock (Terms.constsAt [] ds)
      (Sub.cons (Term.const c) Sub.id))) = _
    rw [eq₀]
  rw [eq₁] at hpwp
  let f : Sentence Sig := Term.forall' (Term.eq' Fx Gx)
  have h3 : C.Theorem (Term.box (Term.imp
      (Term.neg (Term.ofPure (Term.existsBlock ((c :: ds).map Sig.typeOf) (Term.neg E)))) f)) := by
    refine C.Theorem.nec (Derivable.impI ?_)
    rw [Term.ofPure_existsBlock]
    have hall : C.Derivable [Term.neg (Term.existsBlock _ (Term.neg (Term.ofPure (Sig := Sig) E)))]
        (Term.forallBlock ((c :: ds).map Sig.typeOf) (Term.ofPure E)) :=
      Derivable.forallBlock_of_not_existsBlock_neg _ Derivable.hyp₀
    refine Derivable.impE (Derivable.weaken (Derivable.impI (Derivable.forall_mono ?_)) (List.nil_subset _)) hall
    have := Derivable.allEBlock (ds.map Sig.typeOf) (Γ := [τ]) (Ax := C.axioms)
      (Δ := [Term.forallBlock (ds.map Sig.typeOf) (Γ := [τ]) (Term.ofPure (Sig := Sig) E)])
      Derivable.hyp₀ (Terms.constsAt [τ] ds)
    refine Derivable.conv this (Conv.of_eq ?_)
    show Term.eq' ((Term.ofPure F₀).subst _) ((Term.ofPure G₀).subst _) = _
    rw [eF, eG]
  have hni : C.Theorem (Term.imp (Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c)))
      (Term.box (Term.eq' (Term.app F (Term.const c)) (Term.app G (Term.const c))))) :=
    Completeness.nec_identity _ _
  have hg := Theorem.mp (Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure pwp_ss_glue.derivable)) _ _ f) hpwp (Theorem.ofC hni))
    (Theorem.ofC h3)
  exact Derivable.impI (Derivable.impE
    (Derivable.weaken₁ (Theorem.ofCMinus (modalizedFunctionality_at F G)))
    (Derivable.impE (Derivable.weaken₁ hg) Derivable.hyp₀))

/-- `logical-necessity-r-implies-separated-structure-r`, through Possibly Witnessed
Possibility. -/
theorem logicalNecessity_entails_separatedStructure (hS : Sig.Closed) :
    logicalNecessity Sig ⟹ separatedStructure Sig :=
  Entails.trans logicalNecessity_entails_possiblyWitnessedPossibility
    (possiblyWitnessedPossibility_entails_separatedStructure hS)

/-! ### Distinctness from its pure version and Separated Structure -/

/-- `pure-distinctness-and-separated-structure-imply-signature-distinctness`: with the
constants `d̄` of `A`, `B` abstracted, `A = B` is `E[d̄/ȳ]` for a pure `E`; `λȳ. E = λȳ. ⊤`
is not a theorem (else `A = B` would be), so pure Distinctness refutes it, and iterated
Separated Structure gets it from `□(A = B)`. -/
theorem pureDistinctness_separatedStructure_entails_distinctness (hS : Sig.Closed) :
    AxiomSet.ofPure (distinctness (empty : AxiomSet Signature.pure)) ∪ separatedStructure Sig ⟹
      distinctness (empty : AxiomSet Sig) := by
  rintro a ⟨hc, σ, A, B, hnt, rfl⟩
  have hAB : (Term.eq' A B).closedTypes = true := by simpa using hc
  obtain ⟨ds, hds, hdsm⟩ := exists_consts_list A B
  obtain ⟨A₀, eA, cA⟩ := Term.exists_abstract ds A (fun d hd => (hdsm d).2 (Or.inl hd))
  obtain ⟨B₀, eB, cB⟩ := Term.exists_abstract ds B (fun d hd => (hdsm d).2 (Or.inr hd))
  let E : Formula Signature.pure (Ctx.block (ds.map Sig.typeOf) []) := Term.eq' A₀ B₀
  have eE : (Term.ofPure (Sig := Sig) E).subst (Sub.consBlock (Terms.constsAt [] ds) Sub.id) =
      Term.eq' A B := by
    show Term.eq' ((Term.ofPure A₀).subst _) ((Term.ofPure B₀).subst _) = _
    rw [eA, eB]
  have hEc : E.closedTypes = true := by
    simp only [E, Term.closedTypes_eq', cA, cB]; simpa using hAB
  have hLc : (Term.lamBlock (Γ := []) (ds.map Sig.typeOf) (Term.ofPure (Sig := Sig) E)).closedTypes = true := by
    rw [Term.closedTypes_lamBlock, all_closed_map hS, Term.closedTypes_ofPure, hEc]; rfl
  let X := AxiomSet.ofPure (distinctness (empty : AxiomSet Signature.pure)) ∪ separatedStructure Sig
  have hnt' : ¬ Theorem (C.axioms ∪ (empty : AxiomSet Signature.pure))
      (Term.eq' (Term.lamBlock _ E) (Term.lamBlock _ Term.top)) := by
    intro h
    have h₁ : C.Theorem (Sig := Sig) (Term.eq' (Term.lamBlock _ (Term.ofPure E)) (Term.lamBlock _ Term.top)) := by
      have := C.Theorem.ofPure (Sig := Sig) (theorem_union_empty.1 h)
      rwa [show Term.ofPure (Sig := Sig) (Term.eq' (Term.lamBlock _ E) (Term.lamBlock _ Term.top)) =
        Term.eq' (Term.ofPure (Term.lamBlock _ E)) (Term.ofPure (Term.lamBlock _ Term.top)) from rfl,
        Term.ofPure_lamBlock, Term.ofPure_lamBlock] at this
    have h₂ := Derivable.allEBlock _ (Derivable.forallBlock_of_lamBlock_eq_top _ h₁) (Terms.constsAt [] ds)
    rw [eE] at h₂
    exact hnt (theorem_union_empty.2 h₂)
  have hFGc : (Term.eq' (Term.lamBlock (Γ := []) (ds.map Sig.typeOf) E)
      (Term.lamBlock _ Term.top)).closedTypes = true := by
    rw [Term.closedTypes_eq', Term.closedTypes_lamBlock, Term.closedTypes_lamBlock, all_closed_map hS, hEc]; rfl
  have hpd : Theorem (C.axioms ∪ X) (Term.neg (Term.eq' (Term.lamBlock _ (Term.ofPure (Sig := Sig) E))
      (Term.lamBlock _ Term.top))) := by
    refine Theorem.ax (Or.inl ⟨_, distinctness_mem hFGc hnt', ?_⟩)
    show _ = Term.neg (Term.eq' (Term.ofPure (Term.lamBlock _ E)) (Term.ofPure (Term.lamBlock _ Term.top)))
    rw [Term.ofPure_lamBlock, Term.ofPure_lamBlock]; rfl
  have hss := ss_box (X := X) (fun _ h => Or.inr h) ds hds (Term.ofPure E)
    (fun c _ h => by rw [Term.consts_ofPure] at h; exact h) hLc
  rw [eE] at hss
  exact Derivable.notI (q := Term.eq' (Term.lamBlock _ (Term.ofPure (Sig := Sig) E)) (Term.lamBlock _ Term.top))
    (Derivable.impE (Derivable.weaken₁ hss)
      (Derivable.impE (Derivable.weaken₁ (Theorem.ofC (Completeness.nec_identity A B))) Derivable.hyp₀))
    (Derivable.weaken₁ hpd)

/-! ### Independence -/

theorem Term.ofPure_appBlock {Γ : Ctx} : ∀ {σs : List Ty} {ρ : RTy}
    (f : Term Signature.pure Γ (σs ⇒* ρ)) (as : Terms Signature.pure Γ σs),
    Term.ofPure (Sig := Sig) (Term.appBlock f as) = Term.appBlock (Term.ofPure f) (Terms.ofPure as)
  | [], _, _, .nil => rfl
  | _ :: _, _, f, .cons a as => Term.ofPure_appBlock (Term.app f a) as

/-- A term of a relational type `ρ`, read at a type `τ` equal to it. -/
def Term.castR {S : Signature} {Γ : Ctx} {τ : Ty} {ρ : RTy} (h : τ = Ty.rel ρ)
    (x : Term S Γ (Ty.rel ρ)) : Term S Γ τ := h.symm ▸ x

/-- `x = A ȳ`, for `x` the first variable of a block and `ȳ` the rest, read at the type
`τ` of `x` through `τ = ρ`. -/
def indFormula {τ : Ty} {ρ : RTy} (h : τ = Ty.rel ρ) (σs : List Ty)
    (A : Term Signature.pure [] (σs ⇒* ρ)) : Formula Signature.pure (Ctx.block σs [τ]) :=
  Term.eq' ((Term.var .zero : Term Signature.pure [τ] τ).rename (Ren.wkBlock σs))
    (Term.castR h (Term.appBlock (A.rename Ren.ofEmpty) (Terms.vars σs [τ])))

theorem indFormula_subst {τ : Ty} {ρ : RTy} (h : τ = Ty.rel ρ) (ds : List Sig.Const)
    (A : Term Signature.pure [] (ds.map Sig.typeOf ⇒* ρ)) (t : Term Sig [] τ) :
    (Term.ofPure (indFormula h (ds.map Sig.typeOf) A)).subst
        (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons t Sub.id)) =
      Term.eq' (h ▸ t) (Term.appBlock (Term.ofPure A) (Terms.constsAt [] ds)) := by
  subst h
  show Term.eq' ((Term.ofPure ((Term.var .zero : Term Signature.pure [_] _).rename (Ren.wkBlock _))).subst _)
    ((Term.ofPure (Term.appBlock (A.rename Ren.ofEmpty) (Terms.vars _ _))).subst _) = _
  rw [Term.ofPure_rename, Term.ofPure_appBlock, Term.ofPure_rename, Terms.ofPure_vars, Term.subst_rename,
    Sub.compRen_consBlock_wkBlock, Term.subst_appBlock, Term.subst_rename, Terms.vars_subst_consBlock,
    Sub.eq_of_nil (Sub.compRen _ Ren.ofEmpty) Sub.id, Term.subst_id]
  rfl

theorem cast_cancel {Γ : Ctx} {τ : Ty} {ρ : RTy} (h : τ = Ty.rel ρ) (x : Term Sig Γ (Ty.rel ρ)) :
    (h ▸ Term.castR h x : Term Sig Γ (Ty.rel ρ)) = x := by
  subst h; rfl

theorem closedTypes_appBlock_left {Γ : Ctx} : ∀ {σs : List Ty} {ρ : RTy} (f : Term Sig Γ (σs ⇒* ρ))
    (as : Terms Sig Γ σs), (Term.appBlock f as).closedTypes = true → f.closedTypes = true
  | [], _, _, _, h => h
  | _ :: _, _, f, as, h => by
    have := closedTypes_appBlock_left (Term.app f as.head) as.tail h
    simp only [Term.closedTypes, Bool.and_eq_true] at this
    exact this.1

/-- The pieces of an instance of Independence: the formula `x = Aȳ`, in the paper's
language, with the constants `c, d̄` put for `x, ȳ`. -/
theorem independence_parts (hS : Sig.Closed) {c : Sig.Const} {ds : List Sig.Const} {ρ : RTy}
    (h : Sig.typeOf c = Ty.rel ρ) (A : Term Signature.pure [] (ds.map Sig.typeOf ⇒* ρ))
    (hc : (Term.neg (Term.eq' (h ▸ Term.const c) (Term.appBlock (Term.ofPure A) (Terms.consts ds)))).closedTypes = true) :
    (Term.ofPure (Sig := Sig) (indFormula h (ds.map Sig.typeOf) A)).closedTypes = true ∧
    ((c :: ds).map Sig.typeOf).all (fun σ => decide σ.Closed) = true := by
  refine ⟨?_, all_closed_map hS _⟩
  have := Term.closedTypes_subst _ (Term.keepsTypes_consBlock_constsAt ds _
    (Sub.KeepsTypes.cons (a := Term.const c) rfl Sub.KeepsTypes.id))
    (Term.ofPure (Sig := Sig) (indFormula h (ds.map Sig.typeOf) A))
  rw [indFormula_subst, ← Terms.consts_eq_constsAt] at this
  rw [← this]; simpa using hc

/-- `separated-structure-r-implies-independence-signature-r`: Separated Structure, iterated
over `c, d̄`, from `□(c = A d̄)` gives `λxȳ. x = Aȳ = λxȳ. ⊤`, so `⊤_ρ = A d̄ = ⊥_ρ`. -/
theorem separatedStructure_entails_independence (hS : Sig.Closed) :
    separatedStructure Sig ⟹ independence Sig := by
  rintro a ⟨hc, c, ds, ρ, h, A, hnd, rfl⟩
  obtain ⟨hPc, hall⟩ := independence_parts hS h A hc
  have hρ : ρ.Closed := by have := hS c; rw [h] at this; exact this
  let P : Formula Sig (Ctx.block ((c :: ds).map Sig.typeOf) []) :=
    Term.ofPure (indFormula h (ds.map Sig.typeOf) A)
  let U : Term Sig [] (Ty.rel ρ) := Term.appBlock (Term.ofPure A) (Terms.constsAt [] ds)
  let e : Sentence Sig := Term.eq' (Term.lamBlock _ P) (Term.lamBlock _ Term.top)
  have hss := ss_box (X := separatedStructure Sig) (fun _ h => h) (c :: ds) hnd P
    (fun c _ h' => by rw [Term.consts_ofPure] at h'; exact h')
    (by rw [Term.closedTypes_lamBlock, hall, hPc]; rfl)
  have hss' : Theorem (C.axioms ∪ separatedStructure Sig)
      (Term.imp (Term.box (Term.eq' (h ▸ Term.const c) U)) e) := by
    rw [← indFormula_subst]; exact hss
  have inst : ∀ x : Term Sig [] (Ty.rel ρ), C.Theorem (Term.imp e (Term.eq' x U)) := fun x => by
    refine Derivable.impI ?_
    have := Derivable.allEBlock ((c :: ds).map Sig.typeOf) (Derivable.forallBlock_of_lamBlock_eq_top _
      (Derivable.hyp₀ (Ax := C.axioms) (Δ := []) (p := e))) (Terms.cons (Term.castR h x) (Terms.constsAt [] ds))
    refine Derivable.conv this (Conv.of_eq ?_)
    show (Term.ofPure (indFormula h (ds.map Sig.typeOf) A)).subst
      (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons (Term.castR h x) Sub.id)) = _
    rw [indFormula_subst, cast_cancel]
  have hni : C.Theorem (Term.imp (Term.eq' (h ▸ Term.const c) U) (Term.box (Term.eq' (h ▸ Term.const c) U))) :=
    Completeness.nec_identity _ _
  rw [Terms.consts_eq_constsAt]
  exact Theorem.mp (Theorem.mp (Theorem.mp (Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure (ss_ind_glue.derivable ρ))) (h ▸ Term.const c) U e)
    (Theorem.ofC hni) hss') (Theorem.ofC (inst _))) (Theorem.ofC (inst _)))
    (Theorem.ofC (C.topR_ne_botR ρ hρ))

/-- `witnessed-possibility-r-implies-independence-signature-r`: Witnessed Possibility at
`x ≠ Aȳ`, whose closure is a theorem (one of `⊤_ρ`, `⊥_ρ` differs from `A d̄`), gives
`◇(c ≠ A d̄)`, against the necessity of identity. -/
theorem witnessedPossibility_entails_independence (hS : Sig.Closed) :
    witnessedPossibility Sig ⟹ independence Sig := by
  rintro a ⟨hc, c, ds, ρ, h, A, hnd, rfl⟩
  obtain ⟨hPc, hall⟩ := independence_parts hS h A hc
  have hρ : ρ.Closed := by have := hS c; rw [h] at this; exact this
  let P₀ : Formula Signature.pure (Ctx.block ((c :: ds).map Sig.typeOf) []) :=
    Term.neg (indFormula h (ds.map Sig.typeOf) A)
  let U : Term Sig [] (Ty.rel ρ) := Term.appBlock (Term.ofPure A) (Terms.constsAt [] ds)
  have hwp := Theorem.ax (Ax := witnessedPossibility Sig) (witnessedPossibility_mem (P := P₀) hnd (by
    rw [Term.closedTypes_existsBlock, hall]
    simpa [P₀] using hPc))
  have inst : ∀ x : Term Sig [] (Ty.rel ρ), (Term.ofPure (Sig := Sig) P₀).subst
      (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons (Term.castR h x) Sub.id)) = Term.neg (Term.eq' x U) := by
    intro x
    show Term.neg ((Term.ofPure (indFormula h (ds.map Sig.typeOf) A)).subst _) = _
    rw [indFormula_subst, cast_cancel]
  have hex : C.Theorem (Term.ofPure (Sig := Sig) (Term.existsBlock _ P₀)) := by
    rw [Term.ofPure_existsBlock]
    refine Derivable.orE (Derivable.em (Term.eq' (Term.topR ρ) U)) ?_ ?_
    · refine Derivable.exIBlock _ (Terms.cons (Term.castR h (Term.botR ρ)) (Terms.constsAt [] ds)) ?_
      show Derivable _ _ ((Term.ofPure P₀).subst (Sub.consBlock (Terms.constsAt [] ds)
        (Sub.cons (Term.castR h (Term.botR ρ)) Sub.id)))
      rw [inst]
      exact Derivable.notI (q := Term.eq' (Term.topR ρ) (Term.botR ρ))
        (Derivable.eqTrans (Derivable.weaken₁ Derivable.hyp₀) (Derivable.eqSymm Derivable.hyp₀))
        (Derivable.weaken (C.topR_ne_botR ρ hρ) (List.nil_subset _))
    · refine Derivable.exIBlock _ (Terms.cons (Term.castR h (Term.topR ρ)) (Terms.constsAt [] ds)) ?_
      show Derivable _ _ ((Term.ofPure P₀).subst (Sub.consBlock (Terms.constsAt [] ds)
        (Sub.cons (Term.castR h (Term.topR ρ)) Sub.id)))
      rw [inst]
      exact Derivable.hyp₀
  have hdia : Theorem (C.axioms ∪ witnessedPossibility Sig)
      (Term.dia (Term.neg (Term.eq' (h ▸ Term.const c) U))) := by
    have := Theorem.mp hwp (Theorem.ofC hex)
    rw [atConsts_eq] at this
    refine Derivable.conv this (Conv.of_eq ?_)
    show Term.dia (Term.neg ((Term.ofPure (indFormula h (ds.map Sig.typeOf) A)).subst
      (Sub.consBlock (Terms.constsAt [] ds) (Sub.cons (Term.const c) Sub.id)))) = _
    rw [indFormula_subst]
  have hni : C.Theorem (Term.imp (Term.eq' (h ▸ Term.const c) U) (Term.box (Term.eq' (h ▸ Term.const c) U))) :=
    Completeness.nec_identity _ _
  rw [Terms.consts_eq_constsAt]
  exact Theorem.mp₂ (Derivable.allEβ
    (Theorem.ofCMinus (C.TheoremMinus.ofPure wp_ind_glue.derivable)) (Term.eq' (h ▸ Term.const c) U))
    (Theorem.ofC hni) hdia

/-! ### Logical Necessity gives Modal Freedom -/

/-- Renaming from the empty context is unique. -/
theorem Ren.eq_of_nil {Δ : Ctx} (r r' : Ren [] Δ) : r = r' := by
  funext τ v; exact nomatch v

/-- Weakening past a block, then a renaming lifted over it: the renaming, then the
weakening. -/
theorem Ren.comp_liftBlock_wkBlock : ∀ (σs : List Ty) {Γ Γ' : Ctx} (r : Ren Γ Γ'),
    Ren.comp (Ren.liftBlock σs r) (Ren.wkBlock σs) = Ren.comp (Ren.wkBlock σs) r
  | [], _, _, _ => rfl
  | σ :: σs, Γ, Γ', r => by
    have ih := Ren.comp_liftBlock_wkBlock σs (Γ := σ :: Γ) (Γ' := σ :: Γ') (Ren.lift r (σ := σ))
    show Ren.comp (Ren.liftBlock σs (Ren.lift r (σ := σ))) (Ren.comp (Ren.wkBlock σs) (Ren.shift (σ := σ))) =
      Ren.comp (Ren.comp (Ren.wkBlock σs) (Ren.shift (σ := σ))) r
    have e : Ren.comp (Ren.liftBlock σs (Ren.lift r (σ := σ))) (Ren.comp (Ren.wkBlock σs) (Ren.shift (σ := σ))) =
        Ren.comp (Ren.comp (Ren.liftBlock σs (Ren.lift r (σ := σ))) (Ren.wkBlock σs)) (Ren.shift (σ := σ)) := rfl
    rw [e, ih]; rfl

/-- The block map, renamed by a renaming lifted over the block, is the block map in the
renamed context, at the block's constants. -/
theorem CMap.block_rename : ∀ (cs : List Sig.Const) {Γ Γ' : Ctx} (r : Ren Γ Γ') {c : Sig.Const},
    c ∈ cs → (CMap.block cs Γ c).rename (Ren.liftBlock (cs.map Sig.typeOf) r) = CMap.block cs Γ' c
  | [], _, _, _, _, h => nomatch h
  | d :: cs, Γ, Γ', r, c, h => by
    by_cases e : c = d
    · subst e
      rw [CMap.block_head, CMap.block_head]
      show ((Term.var .zero).rename (Ren.wkBlock _)).rename (Ren.liftBlock _ (Ren.lift r)) = _
      rw [Term.rename_rename, Ren.comp_liftBlock_wkBlock, ← Term.rename_rename]; rfl
    · rw [CMap.block_tail cs Γ e, CMap.block_tail cs Γ' e]
      exact CMap.block_rename cs (Ren.lift r) ((List.mem_cons.1 h).resolve_left e)

/-- The constants of a substitution instance. -/
theorem Term.consts_subst : ∀ {Γ Δ : Ctx} (s : Sub Sig Γ Δ) {σ : Ty} (t : Term Sig Γ σ) {c : Sig.Const},
    c ∈ (t.subst s).consts → c ∈ t.consts ∨ ∃ τ, ∃ v : Var Γ τ, c ∈ (s τ v).consts
  | _, _, s, _, .var v, _, h => Or.inr ⟨_, v, h⟩
  | _, _, _, _, .const _, _, h => Or.inl h
  | _, _, _, _, .and, _, h | _, _, _, _, .or, _, h | _, _, _, _, .not, _, h
  | _, _, _, _, .all _, _, h | _, _, _, _, .ex _, _, h | _, _, _, _, .eq _, _, h
  | _, _, _, _, .constR _, _, h | _, _, _, _, .negR _, _, h | _, _, _, _, .andR _, _, h
  | _, _, _, _, .orR _, _, h | _, _, _, _, .coextR _, _, h | _, _, _, _, .boxR _, _, h
  | _, _, _, _, .inclR _, _, h => Or.inl h
  | _, _, s, _, .app f a, _, h => by
    rcases h with h | h
    · exact (consts_subst s f h).imp Or.inl id
    · exact (consts_subst s a h).imp Or.inr id
  | _, _, s, _, .lam b, _, h => by
    rcases consts_subst (Sub.lift s) b h with h | ⟨τ, v, hv⟩
    · exact Or.inl h
    · cases v with
      | zero => exact absurd hv (Set.notMem_empty _)
      | succ v =>
        rw [Sub.lift_succ, Term.weaken, Term.consts_rename] at hv
        exact Or.inr ⟨τ, v, hv⟩

/-- The constants of a block substitution of constants. -/
theorem consts_consBlock_constsAt {Δ : Ctx} : ∀ (cs : List Sig.Const) {Γ : Ctx} (s : Sub Sig Γ Δ)
    {τ : Ty} (v : Var (Ctx.block (cs.map Sig.typeOf) Γ) τ) {c : Sig.Const},
    c ∈ (Sub.consBlock (Terms.constsAt Δ cs) s τ v).consts → c ∈ cs ∨ ∃ τ', ∃ w : Var Γ τ', c ∈ (s τ' w).consts
  | [], _, _, _, v, _, h => Or.inr ⟨_, v, h⟩
  | d :: cs, Γ, s, _, v, c, h => by
    rcases consts_consBlock_constsAt cs (Sub.cons (Term.const d) s) v h with h | ⟨τ', w, hw⟩
    · exact Or.inl (List.mem_cons_of_mem _ h)
    · cases w with
      | zero => exact Or.inl (by rw [Set.mem_singleton_iff.1 hw]; exact List.mem_cons_self)
      | succ w => exact Or.inr ⟨τ', w, hw⟩

/-- The constants of `P[c̄/x̄]` are among `c̄`. -/
theorem consts_atConsts (cs : List Sig.Const)
    (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) [])) {c : Sig.Const}
    (h : c ∈ (Term.atConsts cs P).consts) : c ∈ cs := by
  rw [atConsts_eq] at h
  rcases Term.consts_subst _ _ h with h | ⟨τ, v, hv⟩
  · rw [Term.consts_ofPure] at h; exact absurd h (Set.notMem_empty _)
  · rcases consts_consBlock_constsAt cs Sub.id v hv with h | ⟨_, w, _⟩
    · exact h
    · exact nomatch w

/-- `¬∃x̄. P` gives `∀x̄. ¬P`. -/
theorem Derivable.forallBlock_neg_of_not_existsBlock {Ax : AxiomSet Sig} (σs : List Ty) {Γ : Ctx}
    {Δ : List (Formula Sig Γ)} {P : Formula Sig (Ctx.block σs Γ)}
    (h : Derivable Ax Δ (Term.neg (Term.existsBlock σs P))) :
    Derivable Ax Δ (Term.forallBlock σs (Term.neg P)) :=
  Derivable.allIBlock σs (Derivable.orE (Derivable.em P)
    (Derivable.notE (Derivable.exIBlock_vars σs Derivable.hyp₀)
      (Derivable.weaken₁ (Derivable.rename (Ren.wkBlock σs) h)))
    Derivable.hyp₀)

/-- `¬∀x̄. ¬P` gives `∃x̄. P`. -/
theorem existsBlock_of_not_forallBlock_neg (σs : List Ty) (P : Formula Sig (Ctx.block σs [])) :
    C.Theorem (Term.imp (Term.neg (Term.forallBlock σs (Term.neg P))) (Term.existsBlock σs P)) :=
  Derivable.impI (Derivable.orE (Derivable.em (Term.existsBlock σs P)) Derivable.hyp₀
    (Derivable.notE (Derivable.forallBlock_neg_of_not_existsBlock σs Derivable.hyp₀)
      (Derivable.weaken₁ Derivable.hyp₀)))

open Classical in
/-- `∃x̄. P` and `∃ȳ. Q` give `∃x̄ȳ. R`, for `R[c̄d̄/x̄ȳ]` the conjunction `P[c̄/x̄] ∧ Q[d̄/ȳ]`:
the theorem `P[c̄/x̄] ∧ Q[d̄/ȳ] → ∃x̄ȳ. R`, with the variables `x̄ȳ` put for the constants. -/
theorem existsBlock_conj (cs ds : List Sig.Const) (hnd : (cs ++ ds).Nodup)
    (P : Formula Signature.pure (Ctx.block (cs.map Sig.typeOf) []))
    (Q : Formula Signature.pure (Ctx.block (ds.map Sig.typeOf) []))
    (R : Formula Signature.pure (Ctx.block ((cs ++ ds).map Sig.typeOf) []))
    (hR : (Term.ofPure (Sig := Sig) R).subst (Sub.consBlock (Terms.constsAt [] (cs ++ ds)) Sub.id) =
      Term.conj (Term.atConsts cs P) (Term.atConsts ds Q)) :
    C.Theorem (Term.imp (Term.ofPure (Sig := Sig) (Term.existsBlock _ P))
      (Term.imp (Term.ofPure (Term.existsBlock _ Q)) (Term.ofPure (Term.existsBlock _ R)))) := by
  have hcs : cs.Nodup := (List.nodup_append.1 hnd).1
  have hds : ds.Nodup := (List.nodup_append.1 hnd).2.1
  have hdisj : ∀ c ∈ cs, c ∉ ds := fun c hc hd => (List.nodup_append.1 hnd).2.2 c hc c hd rfl
  let τc := cs.map Sig.typeOf
  let τd := ds.map Sig.typeOf
  let Δ : Ctx := Ctx.block τd (Ctx.block τc [])
  let rQ : Ren (Ctx.block τd []) Δ := Ren.liftBlock τd (Ren.wkBlock τc)
  let θ : CMap Sig Δ := fun c => if c ∈ ds then CMap.block ds (Ctx.block τc []) c
    else (CMap.block cs [] c).rename (Ren.wkBlock τd)
  have hθc : ∀ c ∈ cs, θ c = (CMap.block cs [] c).rename (Ren.wkBlock τd) := fun c hc => by
    simp [θ, hdisj c hc]
  have hθd : ∀ d ∈ ds, θ d = (CMap.block ds [] d).rename rQ := fun d hd => by
    simp only [θ, hd, if_true]
    exact (CMap.block_rename ds (Ren.wkBlock τc) hd).symm
  have hfix : θ.Fixes {c | c ∈ cs ∨ c ∈ ds} := fun c hc => by
    simp only [Set.mem_ofPred_eq, not_or] at hc
    simp only [θ, hc.2, if_false, CMap.block_not_mem cs [] hc.1, Term.rename_const]
  -- the theorem in the signature, then with the variables for the constants
  have t₀ : C.Theorem (Term.imp (Term.conj (Term.atConsts cs P) (Term.atConsts ds Q))
      (Term.ofPure (Sig := Sig) (Term.existsBlock _ R))) := by
    rw [Term.ofPure_existsBlock]
    refine Derivable.impI (Derivable.exIBlock _ (Terms.constsAt [] (cs ++ ds)) ?_)
    rw [hR]; exact Derivable.hyp₀
  have t₁ := Derivable.cmap (M := {c | c ∈ cs ∨ c ∈ ds})
    (fun a ha c' hc' => absurd hc' (C.axioms_consts ha c')) θ hfix
    (Derivable.rename (Ren.ofEmpty (Γ := Δ)) t₀)
  have eP := Term.cmap_block_subst_consts cs hcs (Term.ofPure P) (Term.pure_ofPure P)
    (Ren.wkBlock τd) Ren.ofEmpty θ hθc
  have eQ := Term.cmap_block_subst_consts ds hds (Term.ofPure Q) (Term.pure_ofPure Q) rQ Ren.ofEmpty θ hθd
  have eR : ((Term.ofPure (Sig := Sig) (Term.existsBlock _ R)).rename (Ren.ofEmpty (Γ := Δ))).cmap θ =
      (Term.ofPure (Sig := Sig) (Term.existsBlock _ R)).rename (Ren.ofEmpty (Γ := Δ)) :=
    Term.cmap_of_fixes θ hfix _ (fun c hc => by
      rw [Term.consts_rename, Term.consts_ofPure] at hc; exact absurd hc (Set.notMem_empty _))
  have t₂ : C.Derivable ([] : List (Formula Sig Δ)) (Term.imp
      (Term.conj ((Term.ofPure P).rename (Ren.wkBlock τd)) ((Term.ofPure Q).rename rQ))
      ((Term.ofPure (Sig := Sig) (Term.existsBlock _ R)).rename (Ren.ofEmpty (Γ := Δ)))) := by
    have e : ((Term.imp (Term.conj (Term.atConsts cs P) (Term.atConsts ds Q))
        (Term.ofPure (Sig := Sig) (Term.existsBlock _ R))).rename (Ren.ofEmpty (Γ := Δ))).cmap θ =
        Term.imp (Term.conj ((((Term.atConsts cs P).rename Ren.ofEmpty)).cmap θ)
          (((Term.atConsts ds Q).rename Ren.ofEmpty).cmap θ))
          (((Term.ofPure (Sig := Sig) (Term.existsBlock _ R)).rename (Ren.ofEmpty (Γ := Δ))).cmap θ) := rfl
    rw [e, eR, atConsts_eq, atConsts_eq, eP, eQ] at t₁
    exact t₁
  -- now the two existentials, eliminated in turn
  refine Derivable.impI (Derivable.impI ?_)
  rw [Term.ofPure_existsBlock (σs := τc), Term.ofPure_existsBlock (σs := τd)]
  refine Derivable.exEBlock τc (Derivable.weaken₁ (Derivable.hyp₀)) ?_
  have hQ : Derivable C.axioms (Term.ofPure P :: Hyps.wkBlock τc
      [Term.existsBlock τd (Term.ofPure Q), Term.existsBlock τc (Term.ofPure P)])
      ((Term.existsBlock τd (Term.ofPure (Sig := Sig) Q)).rename (Ren.wkBlock τc)) :=
    Derivable.weaken₁ Derivable.hyp₀
  rw [Term.rename_existsBlock] at hQ
  refine Derivable.exEBlock τd hQ ?_
  have t₃ := Derivable.weaken t₂ (List.nil_subset
    ((Term.ofPure Q).rename rQ :: Hyps.wkBlock τd (Term.ofPure P :: Hyps.wkBlock τc
      [Term.existsBlock τd (Term.ofPure Q), Term.existsBlock τc (Term.ofPure P)])))
  have t₄ := Derivable.impE t₃ (Derivable.andI
    (Derivable.weaken₁ (Derivable.hyp (List.mem_map.2 ⟨_, List.mem_cons_self, rfl⟩)))
    Derivable.hyp₀)
  have e2 : (((Term.ofPure (Sig := Sig) (Term.existsBlock _ R)).rename (Ren.wkBlock τc)).rename
      (Ren.wkBlock τd)) = (Term.ofPure (Term.existsBlock _ R)).rename (Ren.ofEmpty (Γ := Δ)) := by
    rw [Term.rename_rename, Ren.eq_of_nil (Ren.comp (Ren.wkBlock τd) (Ren.wkBlock τc)) Ren.ofEmpty]
  rw [e2]
  exact t₄

/-- `logical-necessity-r-implies-modal-freedom-signature-r` (Bacon): `◇P[c̄/x̄]` gives
`∃x̄. P` and `◇Q[d̄/ȳ]` gives `∃ȳ. Q`, by Logical Necessity at `¬P` and `¬Q`; so
`∃x̄ȳ. P ∧ Q`, and Logical Necessity at `¬(P ∧ Q)` and `c̄d̄` gives the joint possibility. -/
theorem logicalNecessity_entails_modalFreedom (hS : Sig.Closed) :
    logicalNecessity Sig ⟹ modalFreedom Sig := by
  rintro a ⟨hc, cs, ds, P, Q, hnd, rfl⟩
  split_closed hc
  have hcs : cs.Nodup := (List.nodup_append.1 hnd).1
  have hds : ds.Nodup := (List.nodup_append.1 hnd).2.1
  have hPc : P.closedTypes = true := by simpa [Term.closedTypes_atConsts] using hc.1.1
  have hQc : Q.closedTypes = true := by simpa [Term.closedTypes_atConsts] using hc.1.2
  obtain ⟨R, eR, cR⟩ := Term.exists_abstract (cs ++ ds)
    (Term.conj (Term.atConsts (Sig := Sig) cs P) (Term.atConsts ds Q)) (fun c hc' => by
      rcases hc' with h | h
      · rcases h with h | h
        · exact absurd h (Set.notMem_empty _)
        · exact List.mem_append_left _ (consts_atConsts cs P h)
      · exact List.mem_append_right _ (consts_atConsts ds Q h))
  have hRc : R.closedTypes = true := by
    rw [cR, Term.closedTypes_conj, Term.closedTypes_atConsts, Term.closedTypes_atConsts, hPc, hQc]; rfl
  have exc : ∀ (es : List Sig.Const) (S : Formula Signature.pure (Ctx.block (es.map Sig.typeOf) [])),
      S.closedTypes = true → (Term.existsBlock _ (Term.neg S)).closedTypes = true := fun es S hS' => by
    rw [Term.closedTypes_existsBlock, all_closed_map hS, Term.closedTypes_neg, hS']; rfl
  let X := logicalNecessity Sig
  have h1 : Theorem (C.axioms ∪ X) (Term.iff (Term.box (Term.atConsts cs (Term.neg P)))
      (Term.ofPure (Term.forallBlock _ (Term.neg P)))) :=
    Theorem.ax (logicalNecessity_mem hcs (exc cs P hPc))
  have h2 : Theorem (C.axioms ∪ X) (Term.iff (Term.box (Term.atConsts ds (Term.neg Q)))
      (Term.ofPure (Term.forallBlock _ (Term.neg Q)))) :=
    Theorem.ax (logicalNecessity_mem hds (exc ds Q hQc))
  have h3 : Theorem (C.axioms ∪ X) (Term.iff (Term.box (Term.atConsts (cs ++ ds) (Term.neg R)))
      (Term.ofPure (Term.forallBlock _ (Term.neg R)))) :=
    Theorem.ax (logicalNecessity_mem hnd (exc (cs ++ ds) R hRc))
  have eR' : Term.atConsts (Sig := Sig) (cs ++ ds) (Term.neg R) =
      Term.neg (Term.conj (Term.atConsts cs P) (Term.atConsts ds Q)) := by
    rw [atConsts_eq]
    show Term.neg ((Term.ofPure R).subst _) = _
    rw [eR]
  rw [eR'] at h3
  have dm : ∀ (es : List Sig.Const) (S : Formula Signature.pure (Ctx.block (es.map Sig.typeOf) [])),
      C.Theorem (Term.imp (Term.neg (Term.ofPure (Sig := Sig) (Term.forallBlock _ (Term.neg S))))
        (Term.ofPure (Term.existsBlock _ S))) := fun es S => by
    rw [Term.ofPure_forallBlock, Term.ofPure_existsBlock]
    exact existsBlock_of_not_forallBlock_neg _ _
  have hef : C.Theorem (Term.imp (Term.ofPure (Sig := Sig) (Term.existsBlock _ R))
      (Term.neg (Term.ofPure (Term.forallBlock ((cs ++ ds).map Sig.typeOf) (Term.neg R))))) := by
    rw [Term.ofPure_existsBlock, Term.ofPure_forallBlock]
    exact Derivable.impI (Derivable.notI (q := Term.top)
      (Derivable.existsBlock_forallBlock_neg _ (Derivable.weaken₁ Derivable.hyp₀) Derivable.hyp₀)
      (Derivable.existsBlock_forallBlock_neg _ (Derivable.weaken₁ Derivable.hyp₀) Derivable.hyp₀))
  have g₁ := Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure ln_mf_glue₁.derivable)) _ _ _) h1 (Theorem.ofC (dm cs P))
  have g₂ := Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure ln_mf_glue₁.derivable)) _ _ _) h2 (Theorem.ofC (dm ds Q))
  have g₃ := Theorem.mp₂ (Derivable.allE₃β
    (Theorem.ofCMinus (C.TheoremMinus.ofPure ln_mf_glue₂.derivable)) _ _ _) h3 (Theorem.ofC hef)
  have hEx := existsBlock_conj (Sig := Sig) cs ds hnd P Q R eR
  exact Derivable.impI (Derivable.impE (Derivable.weaken₁ g₃)
    (Derivable.impE (Derivable.impE (Derivable.weaken₁ (Theorem.ofC hEx))
      (Derivable.impE (Derivable.weaken₁ g₁) (Derivable.andE₁ Derivable.hyp₀)))
      (Derivable.impE (Derivable.weaken₁ g₂) (Derivable.andE₂ Derivable.hyp₀))))

end Meta

end Classicism
