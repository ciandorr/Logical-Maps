import Classicism.Completeness.ConstantMaps
import Classicism.Syntax.WitnessedPossibility
import Classicism.Syntax.Conservativity

/-!
# Constants as a block of variables

The step "abstract the constants" of the map's proofs about the Σ-combinatorialism family:
a list `cs` of distinct constants, and the block of variables `x̄` of their types.

- `CMap.block cs Γ`, the constant map putting the block's variables for the constants `cs`
  (and leaving every other constant), in the context `Γ` extended by the block.
- **Abstraction** (`Term.exists_abstract`): a term whose constants are among `cs` is
  `t°[c̄/x̄]` for a pure term `t°` in the block, `t°` having the types of `t`.
- **Unabstraction** (`Term.cmap_block_subst_consts`): putting the constants for the block's
  variables in a pure term and then the variables back for the constants gives the term
  back, the constants being distinct. With `Derivable.cmap`, a derivation in `C` about
  `P[c̄/x̄]` becomes one about `P` (`C.Theorem.unabstract`): "a fresh constant behaves like a
  variable", for a block.

`Terms.constsAt Γ cs` is the tuple of the constants in any context (`Terms.consts`, of
`Syntax/WitnessedPossibility.lean`, is it at the empty context).
-/

namespace Classicism.Meta

variable {Sig : Signature}

/-! ### The constants as a tuple in any context -/

/-- The constants of a list as a tuple, in any context. -/
def Terms.constsAt (Γ : Ctx) : (cs : List Sig.Const) → Terms Sig Γ (cs.map Sig.typeOf)
  | [] => .nil
  | c :: cs => .cons (.const c) (Terms.constsAt Γ cs)

theorem Terms.consts_eq_constsAt : ∀ cs : List Sig.Const, Terms.consts cs = Terms.constsAt [] cs
  | [] => rfl
  | c :: cs => congrArg (Terms.cons (Term.const c)) (consts_eq_constsAt cs)

theorem Terms.rename_constsAt {Γ Δ : Ctx} (r : Ren Γ Δ) :
    ∀ cs : List Sig.Const, (Terms.constsAt Γ cs).rename r = Terms.constsAt Δ cs
  | [] => rfl
  | c :: cs => by
    show Terms.cons (Term.const c) ((Terms.constsAt Γ cs).rename r) = _
    rw [rename_constsAt r cs]; rfl

theorem Terms.subst_constsAt {Γ Δ : Ctx} (s : Sub Sig Γ Δ) :
    ∀ cs : List Sig.Const, (Terms.constsAt Γ cs).subst s = Terms.constsAt Δ cs
  | [] => rfl
  | c :: cs => by
    show Terms.cons (Term.const c) ((Terms.constsAt Γ cs).subst s) = _
    rw [subst_constsAt s cs]; rfl

/-- A tuple with constants put for constants. -/
def Terms.cmap {Γ : Ctx} (θ : CMap Sig Γ) : ∀ {σs : List Ty}, Terms Sig Γ σs → Terms Sig Γ σs
  | [], _ => .nil
  | _ :: _, as => .cons (as.head.cmap θ) (Terms.cmap θ as.tail)

/-- Two maps agreeing on `cs`, up to a renaming, agree on the tuple of `cs`. -/
theorem Terms.cmap_constsAt_congr {Γ Δ : Ctx} (r : Ren Γ Δ) (θ : CMap Sig Δ) (θ' : CMap Sig Γ) :
    ∀ cs : List Sig.Const, (∀ c ∈ cs, θ c = (θ' c).rename r) →
      (Terms.constsAt Δ cs).cmap θ = ((Terms.constsAt Γ cs).cmap θ').rename r
  | [], _ => rfl
  | c :: cs, h => by
    show Terms.cons (θ c) ((Terms.constsAt Δ cs).cmap θ) = Terms.cons ((θ' c).rename r) _
    rw [h c List.mem_cons_self,
      cmap_constsAt_congr r θ θ' cs (fun c' hc' => h c' (List.mem_cons_of_mem _ hc'))]
    rfl

/-! ### The block's variables for the constants -/

open Classical in
/-- Put the variables of a block for the constants `cs`, in the context `Γ` extended by the
block; the first variable for the first constant. -/
noncomputable def CMap.block : (cs : List Sig.Const) → (Γ : Ctx) →
    CMap Sig (Ctx.block (cs.map Sig.typeOf) Γ)
  | [], _ => fun c => .const c
  | d :: cs, Γ => fun c =>
    if h : c = d then by
      subst h
      exact (Term.var .zero : Term Sig (Sig.typeOf c :: Γ) _).rename (Ren.wkBlock (cs.map Sig.typeOf))
    else CMap.block cs (Sig.typeOf d :: Γ) c

theorem CMap.block_head (d : Sig.Const) (cs : List Sig.Const) (Γ : Ctx) :
    CMap.block (d :: cs) Γ d =
      (Term.var .zero : Term Sig (Sig.typeOf d :: Γ) _).rename (Ren.wkBlock (cs.map Sig.typeOf)) := by
  simp [CMap.block]

theorem CMap.block_tail {d c : Sig.Const} (cs : List Sig.Const) (Γ : Ctx) (h : c ≠ d) :
    CMap.block (d :: cs) Γ c = CMap.block cs (Sig.typeOf d :: Γ) c := by
  simp [CMap.block, h]

theorem CMap.block_not_mem : ∀ (cs : List Sig.Const) (Γ : Ctx) {c : Sig.Const}, c ∉ cs →
    CMap.block cs Γ c = .const c
  | [], _, _, _ => rfl
  | d :: cs, Γ, c, h => by
    rw [CMap.block_tail cs Γ (fun e => h (by rw [e]; exact List.mem_cons_self))]
    exact CMap.block_not_mem cs _ (fun h' => h (List.mem_cons_of_mem _ h'))

theorem CMap.block_fixes (cs : List Sig.Const) (Γ : Ctx) : (CMap.block cs Γ).Fixes {c | c ∈ cs} :=
  fun _ hc => CMap.block_not_mem cs Γ hc

theorem CMap.block_pure : ∀ (cs : List Sig.Const) (Γ : Ctx) {c : Sig.Const}, c ∈ cs →
    (CMap.block cs Γ c).pure = true
  | [], _, _, h => nomatch h
  | d :: cs, Γ, c, h => by
    by_cases e : c = d
    · subst e; rw [CMap.block_head]; rfl
    · rw [CMap.block_tail cs Γ e]
      exact CMap.block_pure cs _ ((List.mem_cons.1 h).resolve_left e)

/-- The block substitution of the constants undoes the block map. -/
theorem CMap.block_subst {Δ : Ctx} : ∀ (cs : List Sig.Const) {Γ : Ctx} (s : Sub Sig Γ Δ)
    (c : Sig.Const), (CMap.block cs Γ c).subst (Sub.consBlock (Terms.constsAt Δ cs) s) = .const c
  | [], _, _, _ => rfl
  | d :: cs, Γ, s, c => by
    show (CMap.block (d :: cs) Γ c).subst (Sub.consBlock (Terms.constsAt Δ cs) (Sub.cons (.const d) s)) = _
    by_cases e : c = d
    · subst e
      rw [CMap.block_head, Term.subst_rename, Sub.compRen_consBlock_wkBlock]; rfl
    · rw [CMap.block_tail cs Γ e]
      exact CMap.block_subst cs (Sub.cons (.const d) s) c

/-- The block map at the constants is the block's variables, the constants being distinct. -/
theorem CMap.block_constsAt : ∀ (cs : List Sig.Const) (Γ : Ctx), cs.Nodup →
    (Terms.constsAt (Ctx.block (cs.map Sig.typeOf) Γ) cs).cmap (CMap.block cs Γ) =
      Terms.vars (cs.map Sig.typeOf) Γ
  | [], _, _ => rfl
  | d :: cs, Γ, hnd => by
    have hd : d ∉ cs := (List.nodup_cons.1 hnd).1
    show Terms.cons (CMap.block (d :: cs) Γ d) ((Terms.constsAt _ cs).cmap (CMap.block (d :: cs) Γ)) =
      Terms.cons _ (Terms.vars (cs.map Sig.typeOf) (Sig.typeOf d :: Γ))
    rw [CMap.block_head]
    congr 1
    have := Terms.cmap_constsAt_congr Ren.id (CMap.block (d :: cs) Γ) (CMap.block cs (Sig.typeOf d :: Γ)) cs
      (fun c hc => by
        rw [CMap.block_tail cs Γ (fun e => hd (by rw [← e]; exact hc)), Term.rename_id])
    refine this.trans ?_
    have ih := CMap.block_constsAt cs (Sig.typeOf d :: Γ) (List.nodup_cons.1 hnd).2
    rw [show (Terms.constsAt (Ctx.block ((d :: cs).map Sig.typeOf) Γ) cs : Terms Sig _ _) =
      Terms.constsAt (Ctx.block (cs.map Sig.typeOf) (Sig.typeOf d :: Γ)) cs from rfl, ih,
      Terms.rename_eq_subst, show (Sub.ofRen Ren.id : Sub Sig _ _) = Sub.id from rfl, Terms.subst_id]

/-! ### Substitution and constant maps -/

theorem Sub.cmap_cons {Γ Δ : Ctx} {σ : Ty} (θ : CMap Sig Δ) (a : Term Sig Δ σ) (s : Sub Sig Γ Δ) :
    Sub.cmap θ (Sub.cons a s) = Sub.cons (a.cmap θ) (Sub.cmap θ s) := by
  funext τ v; cases v <;> rfl

theorem Sub.cmap_consBlock {Δ : Ctx} (θ : CMap Sig Δ) : ∀ {σs : List Ty} {Γ : Ctx}
    (as : Terms Sig Δ σs) (s : Sub Sig Γ Δ),
    Sub.cmap θ (Sub.consBlock as s) = Sub.consBlock (as.cmap θ) (Sub.cmap θ s)
  | [], _, .nil, _ => rfl
  | _ :: _, _, .cons a as, s => by
    show Sub.cmap θ (Sub.consBlock as (Sub.cons a s)) = Sub.consBlock (as.cmap θ) (Sub.cons (a.cmap θ) _)
    rw [Sub.cmap_consBlock θ as (Sub.cons a s), Sub.cmap_cons]

/-- Every substitution or renaming out of the empty context is the same. -/
theorem Sub.eq_of_nil {Δ : Ctx} (s s' : Sub Sig [] Δ) : s = s' := by
  funext τ v; exact nomatch v

namespace Term

/-- A map whose values at a term's constants are pure makes the term pure. -/
theorem pure_cmap : ∀ {Γ : Ctx} {σ : Ty} (θ : CMap Sig Γ) (t : Term Sig Γ σ),
    (∀ c ∈ t.consts, (θ c).pure = true) → (t.cmap θ).pure = true
  | _, _, _, .var _, _ | _, _, _, .and, _ | _, _, _, .or, _ | _, _, _, .not, _
  | _, _, _, .all _, _ | _, _, _, .ex _, _ | _, _, _, .eq _, _ | _, _, _, .constR _, _
  | _, _, _, .negR _, _ | _, _, _, .andR _, _ | _, _, _, .orR _, _ | _, _, _, .coextR _, _
  | _, _, _, .boxR _, _ | _, _, _, .inclR _, _ => rfl
  | _, _, _, .const c, h => h c rfl
  | _, _, θ, .app f a, h => by
    simp only [cmap, Term.pure, Bool.and_eq_true]
    exact ⟨pure_cmap θ f (fun c hc => h c (Or.inl hc)), pure_cmap θ a (fun c hc => h c (Or.inr hc))⟩
  | _, _, θ, .lam b, h => by
    show (b.cmap θ.weaken).pure = true
    exact pure_cmap θ.weaken b (fun c hc => by
      show ((θ c).rename Ren.shift).pure = true
      rw [pure_rename]; exact h c hc)
where
  pure_rename : ∀ {Γ Δ : Ctx} (r : Ren Γ Δ) {σ : Ty} (t : Term Sig Γ σ), (t.rename r).pure = t.pure
    | _, _, _, _, .var _ | _, _, _, _, .const _ | _, _, _, _, .and | _, _, _, _, .or
    | _, _, _, _, .not | _, _, _, _, .all _ | _, _, _, _, .ex _ | _, _, _, _, .eq _
    | _, _, _, _, .constR _ | _, _, _, _, .negR _ | _, _, _, _, .andR _ | _, _, _, _, .orR _
    | _, _, _, _, .coextR _ | _, _, _, _, .boxR _ | _, _, _, _, .inclR _ => rfl
    | _, _, r, _, .app f a => by
      simp only [rename_app, Term.pure, pure_rename r f, pure_rename r a]
    | _, _, r, _, .lam b => by
      simp only [rename_lam, Term.pure, pure_rename (Ren.lift r) b]

/-- A substitution into a pure term, with constants then put for constants: the
substitution with the constants put in its terms. -/
theorem cmap_subst_pure : ∀ {Γ Δ : Ctx} (s : Sub Sig Γ Δ) (θ : CMap Sig Δ) {σ : Ty}
    (t : Term Sig Γ σ), t.pure = true → (t.subst s).cmap θ = t.subst (Sub.cmap θ s)
  | _, _, _, _, _, .var _, _ | _, _, _, _, _, .and, _ | _, _, _, _, _, .or, _
  | _, _, _, _, _, .not, _ | _, _, _, _, _, .all _, _ | _, _, _, _, _, .ex _, _
  | _, _, _, _, _, .eq _, _ | _, _, _, _, _, .constR _, _ | _, _, _, _, _, .negR _, _
  | _, _, _, _, _, .andR _, _ | _, _, _, _, _, .orR _, _ | _, _, _, _, _, .coextR _, _
  | _, _, _, _, _, .boxR _, _ | _, _, _, _, _, .inclR _, _ => rfl
  | _, _, _, _, _, .const _, h => by simp [Term.pure] at h
  | _, _, s, θ, _, .app f a, h => by
    simp only [Term.pure, Bool.and_eq_true] at h
    simp only [subst_app, cmap, cmap_subst_pure s θ f h.1, cmap_subst_pure s θ a h.2]
  | _, _, s, θ, _, .lam b, h => by
    simp only [subst_lam, cmap]
    rw [cmap_subst_pure (Sub.lift s) θ.weaken b h, Sub.cmap_lift]

/-- The identity constant map leaves a term in place. -/
theorem cmap_const_self {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) :
    t.cmap (fun c => (Term.const c : Term Sig Γ _)) = t :=
  cmap_of_fixes (M := ∅) _ (fun _ _ => rfl) t (fun _ _ h => h)

/-! ### Abstraction -/

/-- The block substitution of constants keeps the paper's language. -/
theorem keepsTypes_consBlock_constsAt : ∀ (cs : List Sig.Const) {Γ Δ : Ctx} (s : Sub Sig Γ Δ),
    s.KeepsTypes → (Sub.consBlock (Terms.constsAt Δ cs) s).KeepsTypes
  | [], _, _, _, h => h
  | _ :: cs, _, _, _, h => keepsTypes_consBlock_constsAt cs _ (Sub.KeepsTypes.cons rfl h)

/-- **Abstraction**: a term whose constants are among the distinct constants `cs` is a pure
term in the block of their types, with the constants put for the block. -/
theorem exists_abstract (cs : List Sig.Const) {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ)
    (h : ∀ c ∈ t.consts, c ∈ cs) :
    ∃ t' : Term Signature.pure (Ctx.block (cs.map Sig.typeOf) Γ) σ,
      (Term.ofPure t').subst (Sub.consBlock (Terms.constsAt Γ cs) Sub.id) = t ∧
      t'.closedTypes = t.closedTypes := by
  let u := (t.rename (Ren.wkBlock (cs.map Sig.typeOf))).cmap (CMap.block cs Γ)
  have hu : u.pure = true := pure_cmap _ _ (fun c hc => by
    rw [consts_rename] at hc; exact CMap.block_pure cs Γ (h c hc))
  obtain ⟨t', ht'⟩ := exists_ofPure u hu
  have e : (Term.ofPure t').subst (Sub.consBlock (Terms.constsAt Γ cs) Sub.id) = t := by
    rw [ht']
    have hs : Sub.cmap (fun c => (Term.const c : Term Sig Γ _))
        (Sub.consBlock (Terms.constsAt Γ cs) Sub.id) = Sub.consBlock (Terms.constsAt Γ cs) Sub.id := by
      funext τ v; exact cmap_const_self _
    have := cmap_subst (Sub.consBlock (Terms.constsAt Γ cs) Sub.id) (CMap.block cs Γ)
      (fun c => (Term.const c : Term Sig Γ _)) (fun c => by rw [hs]; exact CMap.block_subst cs _ c)
      (t.rename (Ren.wkBlock (cs.map Sig.typeOf)))
    rw [hs] at this
    show u.subst _ = t
    rw [this, subst_rename, Sub.compRen_consBlock_wkBlock, subst_id, cmap_const_self]
  refine ⟨t', e, ?_⟩
  conv => rhs; rw [← e]
  rw [closedTypes_subst _ (keepsTypes_consBlock_constsAt cs _ Sub.KeepsTypes.id), closedTypes_ofPure]

/-- **Unabstraction**: in a pure term of the block, put the constants for the block's
variables, carry the result into a context `Δ`, and put back, for each constant, its
variable carried along a renaming `r`: the term carried along `r`. -/
theorem cmap_block_subst_consts (cs : List Sig.Const) (hnd : cs.Nodup) {Δ : Ctx} {σ : Ty}
    (t : Term Sig (Ctx.block (cs.map Sig.typeOf) []) σ) (ht : t.pure = true)
    (r : Ren (Ctx.block (cs.map Sig.typeOf) []) Δ) (r₀ : Ren [] Δ) (θ : CMap Sig Δ)
    (hθ : ∀ c ∈ cs, θ c = (CMap.block cs [] c).rename r) :
    ((t.subst (Sub.consBlock (Terms.constsAt [] cs) Sub.id)).rename r₀).cmap θ = t.rename r := by
  rw [rename_subst, Ren.compSub_consBlock, Terms.rename_constsAt, cmap_subst_pure _ _ _ ht,
    Sub.cmap_consBlock, Terms.cmap_constsAt_congr r θ (CMap.block cs []) cs hθ,
    CMap.block_constsAt cs [] hnd, rename_eq_subst r t]
  congr 1
  have e1 : (Sub.ofRen r : Sub Sig _ Δ) = Ren.compSub r Sub.id := by funext τ v; rfl
  rw [e1, ← Sub.consBlock_vars_wkBlock (cs.map Sig.typeOf) [], Ren.compSub_consBlock]
  exact congrArg _ (Sub.eq_of_nil _ _)

end Term

end Classicism.Meta
