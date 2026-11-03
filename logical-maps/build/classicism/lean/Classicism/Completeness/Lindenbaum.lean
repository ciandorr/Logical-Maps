import Mathlib.Data.Nat.Nth
import Classicism.Completeness.Reserve
import Classicism.Completeness.Countable
import Classicism.Completeness.ConstantMaps

/-!
# Lindenbaum–Henkin, in the reserve

A consistent set of sentences of a roomy language `S₀` extends to a maximal consistent,
witnessed theory of a larger roomy language `S ⊇ S₀` (`lindenbaum`): the canonical worlds of
`Completeness/Worlds.lean` are such theories, and both the successor lemma and the
existence of a world are instances.

The construction is the standard ω-sequence. At every type `τ` the reserve constants
unused by `S₀` are enumerated, `(τ, f τ 0), (τ, f τ 1), …`; those at even places are the
**witnesses**, added to the language, and those at odd places stay unused, which keeps the
new language roomy. The sentences of the ambient signature are enumerated (there are
countably many, `Completeness/Countable.lean`), and at stage `k` the `k`-th sentence is
added if it is in the new language and consistent with what is there; if it is an
existential `∃F`, so is `F c` for a witness `c` occurring in nothing added so far, which
keeps the stage consistent by the witness lemma (`consistent_witness`). Each stage adds
finitely many sentences to the starting set, so it is a list.
-/

namespace Classicism.Meta

namespace Completeness

variable {Sig : Signature}

open Term

/-! ### Languages -/

section Language

variable {S S' : Set Reserve}

theorem InLang.mono {Γ : Ctx} (hS : S ⊆ S') {σ : Ty} {t : Term (ext Sig) Γ σ} (h : InLang S t) :
    InLang S' t := fun r hr => hS (h r hr)

@[simp] theorem inLang_app {Γ : Ctx} {σ : Ty} {ρ : RTy} {f : Term (ext Sig) Γ (σ ⇒ ρ)}
    {a : Term (ext Sig) Γ σ} : InLang S (.app f a) ↔ InLang S f ∧ InLang S a :=
  ⟨fun h => ⟨fun r hr => h r (Or.inl hr), fun r hr => h r (Or.inr hr)⟩,
    fun h r hr => hr.elim (h.1 r) (h.2 r)⟩

@[simp] theorem inLang_lam {Γ : Ctx} {σ : Ty} {ρ : RTy} {b : Term (ext Sig) (σ :: Γ) ρ} :
    InLang S (.lam b) ↔ InLang S b := Iff.rfl

theorem inLang_reserve {Γ : Ctx} {r : Reserve} :
    InLang (Sig := Sig) (Γ := Γ) S (.const (Sum.inr r)) ↔ r ∈ S :=
  ⟨fun h => h r rfl, fun h r' hr' => by
    have : (Sum.inr r' : (ext Sig).Const) = Sum.inr r := hr'
    cases this; exact h⟩

theorem inLang_of_not_mem_consts {Γ : Ctx} {σ : Ty} {t : Term (ext Sig) Γ σ}
    (h : ∀ c, c ∉ t.consts) : InLang S t := fun _ hr => absurd hr (h _)

/-- The logical constants are in every language. -/
theorem inLang_op {Γ : Ctx} {σ : Ty} {t : Term (ext Sig) Γ σ}
    (h : t.consts = ∅) : InLang S t := fun r hr => by rw [h] at hr; exact hr.elim

theorem inLang_neg {Γ : Ctx} {p : Formula (ext Sig) Γ} : InLang S (neg p) ↔ InLang S p := by
  simp only [neg, inLang_app]
  exact ⟨fun h => h.2, fun h => ⟨inLang_op rfl, h⟩⟩

theorem inLang_bin {Γ : Ctx} {σ : Ty} {ρ : RTy} {o : Term (ext Sig) Γ (σ ⇒ σ ⇒ ρ)}
    (ho : o.consts = ∅) {a b : Term (ext Sig) Γ σ} :
    InLang S (.app (.app o a) b) ↔ InLang S a ∧ InLang S b := by
  simp only [inLang_app]
  exact ⟨fun h => ⟨h.1.2, h.2⟩, fun h => ⟨⟨inLang_op ho, h.1⟩, h.2⟩⟩

theorem inLang_conj {Γ : Ctx} {p q : Formula (ext Sig) Γ} :
    InLang S (conj p q) ↔ InLang S p ∧ InLang S q := inLang_bin rfl
theorem inLang_disj {Γ : Ctx} {p q : Formula (ext Sig) Γ} :
    InLang S (disj p q) ↔ InLang S p ∧ InLang S q := inLang_bin rfl
theorem inLang_eq' {Γ : Ctx} {σ : Ty} {a b : Term (ext Sig) Γ σ} :
    InLang S (eq' a b) ↔ InLang S a ∧ InLang S b := inLang_bin rfl

theorem inLang_quant {Γ : Ctx} {σ : Ty} {Q : Term (ext Sig) Γ ((σ ⇒ RTy.t) ⇒ RTy.t)}
    (hQ : Q.consts = ∅) {F : Term (ext Sig) Γ (σ ⇒ RTy.t)} : InLang S (.app Q F) ↔ InLang S F := by
  simp only [inLang_app]
  exact ⟨fun h => h.2, fun h => ⟨inLang_op hQ, h⟩⟩

theorem inLang_all_app {Γ : Ctx} {σ : Ty} {F : Term (ext Sig) Γ (σ ⇒ RTy.t)} :
    InLang S (.app (.all σ) F) ↔ InLang S F := inLang_quant rfl
theorem inLang_ex_app {Γ : Ctx} {σ : Ty} {F : Term (ext Sig) Γ (σ ⇒ RTy.t)} :
    InLang S (.app (.ex σ) F) ↔ InLang S F := inLang_quant rfl

theorem inLang_top {Γ : Ctx} : InLang S (top : Formula (ext Sig) Γ) :=
  inLang_of_not_mem_consts fun c => by simp [Term.consts]
theorem inLang_bot {Γ : Ctx} : InLang S (bot : Formula (ext Sig) Γ) :=
  inLang_of_not_mem_consts fun c => by simp [Term.consts]

theorem inLang_box {Γ : Ctx} {p : Formula (ext Sig) Γ} : InLang S (box p) ↔ InLang S p := by
  rw [box, inLang_eq']; exact ⟨fun h => h.1, fun h => ⟨h, inLang_top⟩⟩

theorem inLang_imp {Γ : Ctx} {p q : Formula (ext Sig) Γ} :
    InLang S (imp p q) ↔ InLang S p ∧ InLang S q := by
  rw [imp, inLang_disj, inLang_neg]

@[simp] theorem inLang_rename {Γ Δ : Ctx} (r : Ren Γ Δ) {σ : Ty} {t : Term (ext Sig) Γ σ} :
    InLang S (t.rename r) ↔ InLang S t := by
  unfold InLang; rw [Term.consts_rename]

end Language

/-! ### The fresh constants -/

section Fresh

variable {S₀ : Set Reserve} (hS₀ : Roomy S₀)

/-- The `k`-th reserve constant of type `τ` unused by `S₀`. -/
noncomputable def freshNum (τ : Ty) (k : ℕ) : ℕ := Nat.nth (fun n => (τ, n) ∉ S₀) k

include hS₀ in
theorem freshNum_not_mem (τ : Ty) (k : ℕ) : (τ, freshNum (S₀ := S₀) τ k) ∉ S₀ :=
  Nat.nth_mem_of_infinite (p := fun n => (τ, n) ∉ S₀) (hS₀ τ) k

include hS₀ in
theorem freshNum_injective (τ : Ty) : Function.Injective (freshNum (S₀ := S₀) τ) :=
  Nat.nth_injective (p := fun n => (τ, n) ∉ S₀) (hS₀ τ)

/-- The witnesses: the fresh constants at even places. -/
def witnesses (S₀ : Set Reserve) : Set Reserve := {r | ∃ k, r = (r.1, freshNum (S₀ := S₀) r.1 (2 * k))}

/-- The new language: `S₀` and the witnesses. -/
def newLang (S₀ : Set Reserve) : Set Reserve := S₀ ∪ witnesses S₀

include hS₀ in
/-- The new language leaves the fresh constants at odd places unused, so it is roomy. -/
theorem newLang_roomy : Roomy (newLang S₀) := by
  intro τ
  refine Set.Infinite.mono (s := Set.range fun k => freshNum (S₀ := S₀) τ (2 * k + 1)) ?_
    (Set.infinite_range_of_injective fun k k' h => by
      have := freshNum_injective hS₀ τ h; omega)
  rintro _ ⟨k, rfl⟩
  rintro (h | ⟨j, hj⟩)
  · exact freshNum_not_mem hS₀ τ _ h
  · have := freshNum_injective hS₀ τ (Prod.mk.inj hj).2
    omega

theorem witness_mem_newLang (τ : Ty) (k : ℕ) : (τ, freshNum (S₀ := S₀) τ (2 * k)) ∈ newLang S₀ :=
  Or.inr ⟨k, rfl⟩

include hS₀ in
/-- Some witness of each type occurs in no sentence of a given list. -/
theorem exists_fresh_witness (τ : Ty) (L : List (Sentence (ext Sig))) :
    ∃ k, ∀ q ∈ L, (Sum.inr (τ, freshNum (S₀ := S₀) τ (2 * k)) : (ext Sig).Const) ∉ q.consts := by
  have hfin : {c : (ext Sig).Const | ∃ q ∈ L, c ∈ q.consts}.Finite := by
    have : {c : (ext Sig).Const | ∃ q ∈ L, c ∈ q.consts} = ⋃ q ∈ L, q.consts := by
      ext c; simp
    rw [this]
    exact Set.Finite.biUnion L.finite_toSet fun q _ => Term.consts_finite q
  let g : ℕ → (ext Sig).Const := fun k => Sum.inr (τ, freshNum (S₀ := S₀) τ (2 * k))
  have hg : Function.Injective g := fun k k' h => by
    have := freshNum_injective hS₀ τ (Prod.mk.inj (Sum.inr.inj h)).2
    omega
  obtain ⟨k, hk⟩ := (hfin.preimage hg.injOn).infinite_compl.nonempty
  exact ⟨k, fun q hq hc => hk ⟨q, hq, hc⟩⟩

end Fresh

/-! ### The construction -/

section Construction

variable [Countable Sig.Const] {S₀ : Set Reserve} (hS₀ : Roomy S₀) (A : AxiomSet (ext Sig))

instance : Countable (ext Sig).Const := inferInstanceAs (Countable (Sig.Const ⊕ Reserve))

instance : Nonempty (Sentence (ext Sig)) := ⟨Term.top⟩

/-- An enumeration of the sentences of the ambient signature. -/
noncomputable def enum : ℕ → Sentence (ext Sig) :=
  Classical.choose (exists_surjective_nat (Sentence (ext Sig)))

theorem enum_surjective : Function.Surjective (enum (Sig := Sig)) :=
  Classical.choose_spec (exists_surjective_nat (Sentence (ext Sig)))

/-- `A` with a list of sentences. -/
def withList (L : List (Sentence (ext Sig))) : AxiomSet (ext Sig) := fun q => A q ∨ q ∈ L

open Classical in
/-- The witness instance added with an existential `φ = ∃F`, its witness fresh for `L`. -/
noncomputable def witnessFor (L : List (Sentence (ext Sig))) (φ : Sentence (ext Sig))
    (h : ∃ (σ : Ty) (F : Term (ext Sig) [] (σ ⇒ RTy.t)), φ = .app (.ex σ) F) : Sentence (ext Sig) :=
  let σ := Classical.choose h
  let F := Classical.choose (Classical.choose_spec h)
  .app F (.const (Sig := ext Sig) (Sum.inr (σ, freshNum (S₀ := S₀) σ
    (2 * Classical.choose (exists_fresh_witness hS₀ σ (φ :: L))))))

open Classical in
/-- One stage: add the sentence if it is in the new language and consistent with what is
there, and with an existential its witness instance. -/
noncomputable def step (L : List (Sentence (ext Sig))) (φ : Sentence (ext Sig)) :
    List (Sentence (ext Sig)) :=
  if InLang (newLang S₀) φ ∧ AxiomSet.Consistent (withList A (φ :: L)) then
    if h : ∃ (σ : Ty) (F : Term (ext Sig) [] (σ ⇒ RTy.t)), φ = .app (.ex σ) F then
      witnessFor hS₀ L φ h :: φ :: L
    else φ :: L
  else L

/-- The stages. -/
noncomputable def stage : ℕ → List (Sentence (ext Sig))
  | 0 => []
  | k + 1 => step hS₀ A (stage k) (enum k)

/-- The theory: `A` with every stage. -/
def limit : Set (Sentence (ext Sig)) := fun q => A q ∨ ∃ k, q ∈ stage hS₀ A k

variable {hS₀ A}

theorem stage_subset_succ (k : ℕ) : stage hS₀ A k ⊆ stage hS₀ A (k + 1) := by
  show stage hS₀ A k ⊆ step hS₀ A (stage hS₀ A k) (enum k)
  unfold step
  split_ifs <;> simp [List.subset_cons_of_subset]

theorem stage_mono {j k : ℕ} (h : j ≤ k) : stage hS₀ A j ⊆ stage hS₀ A k := by
  induction h with
  | refl => exact List.Subset.refl _
  | step _ ih => exact List.Subset.trans ih (stage_subset_succ _)

omit [Countable Sig.Const] in
/-- The witness instance is in the new language, and its witness is fresh. -/
theorem witnessFor_spec (L : List (Sentence (ext Sig))) (φ : Sentence (ext Sig))
    (h : ∃ (σ : Ty) (F : Term (ext Sig) [] (σ ⇒ RTy.t)), φ = .app (.ex σ) F)
    (hφ : InLang (newLang S₀) φ) (hc : AxiomSet.Consistent (withList A (φ :: L)))
    (hA : ∀ p, A p → InLang S₀ p) :
    InLang (newLang S₀) (witnessFor hS₀ L φ h) ∧
      AxiomSet.Consistent (withList A (witnessFor hS₀ L φ h :: φ :: L)) := by
  set σ := Classical.choose h
  set F := Classical.choose (Classical.choose_spec h)
  have hφ' : φ = .app (.ex σ) F := Classical.choose_spec (Classical.choose_spec h)
  have hk := Classical.choose_spec (exists_fresh_witness (Sig := Sig) hS₀ σ (φ :: L))
  set k := Classical.choose (exists_fresh_witness (Sig := Sig) hS₀ σ (φ :: L))
  have hF : InLang (newLang S₀) F := by rw [hφ'] at hφ; exact inLang_ex_app.1 hφ
  have hw : witnessFor hS₀ L φ h = .app F (.const (Sig := ext Sig) (Sum.inr (σ, freshNum (S₀ := S₀) σ (2 * k)))) := rfl
  rw [hw]
  refine ⟨inLang_app.2 ⟨hF, inLang_reserve.2 (witness_mem_newLang σ k)⟩, ?_⟩
  have := consistent_witness (A := withList A (φ :: L)) (Sum.inr (σ, freshNum (S₀ := S₀) σ (2 * k)))
    (F := F) (fun q hq hcq => by
      rcases hq with hq | hq
      · exact freshNum_not_mem hS₀ σ _ (hA q hq _ hcq)
      · exact hk q hq hcq)
    (fun hcF => hk φ List.mem_cons_self (by rw [hφ']; exact Or.inr hcF))
    (Or.inr (hφ' ▸ List.mem_cons_self)) hc
  refine Consistent.of_subset (fun q hq => ?_) this
  rcases hq with hq | hq
  · exact Or.inl (Or.inl hq)
  · rcases List.mem_cons.1 hq with rfl | hq
    · exact Or.inr rfl
    · exact Or.inl (Or.inr hq)

omit [Countable Sig.Const] in
theorem ex_inj_witness {σ σ' : Ty} {F : Term (ext Sig) [] (σ ⇒ RTy.t)}
    {F' : Term (ext Sig) [] (σ' ⇒ RTy.t)} (e : Term.app (.ex σ) F = Term.app (.ex σ') F') (m : ℕ) :
    ∃ k, Term.app F' (.const (Sig := ext Sig) (Sum.inr (σ', freshNum (S₀ := S₀) σ' (2 * m)))) =
      Term.app F (.const (Sig := ext Sig) (Sum.inr (σ, freshNum (S₀ := S₀) σ (2 * k)))) := by
  cases e
  exact ⟨m, rfl⟩

omit [Countable Sig.Const] in
/-- The witness instance of `∃F` is `F c` for a witness `c`. -/
theorem witnessFor_eq (L : List (Sentence (ext Sig))) (φ : Sentence (ext Sig))
    (h : ∃ (σ : Ty) (F : Term (ext Sig) [] (σ ⇒ RTy.t)), φ = .app (.ex σ) F)
    {σ : Ty} {F : Term (ext Sig) [] (σ ⇒ RTy.t)} (hφ : φ = .app (.ex σ) F) :
    ∃ k, witnessFor hS₀ L φ h =
      Term.app F (.const (Sig := ext Sig) (Sum.inr (σ, freshNum (S₀ := S₀) σ (2 * k)))) :=
  ex_inj_witness (hφ.symm.trans (Classical.choose_spec (Classical.choose_spec h))) _

variable (hA : ∀ p, A p → InLang S₀ p) (hc : AxiomSet.Consistent A)

include hA hc in
/-- Every stage is consistent, and in the new language. -/
theorem stage_spec : ∀ k, AxiomSet.Consistent (withList A (stage hS₀ A k)) ∧
    ∀ q ∈ stage hS₀ A k, InLang (newLang S₀) q
  | 0 => ⟨Consistent.of_subset (fun q hq => hq.elim id (fun h => absurd h (List.not_mem_nil))) hc,
      fun q hq => absurd hq List.not_mem_nil⟩
  | k + 1 => by
    obtain ⟨ihc, ihl⟩ := stage_spec k
    show AxiomSet.Consistent (withList A (step hS₀ A (stage hS₀ A k) (enum k))) ∧
      ∀ q ∈ step hS₀ A (stage hS₀ A k) (enum k), InLang (newLang S₀) q
    unfold step
    split_ifs with h₁ h₂
    · obtain ⟨hw₁, hw₂⟩ := witnessFor_spec _ _ h₂ h₁.1 h₁.2 hA
      refine ⟨hw₂, fun q hq => ?_⟩
      rcases List.mem_cons.1 hq with rfl | hq
      · exact hw₁
      rcases List.mem_cons.1 hq with rfl | hq
      · exact h₁.1
      · exact ihl q hq
    · refine ⟨h₁.2, fun q hq => ?_⟩
      rcases List.mem_cons.1 hq with rfl | hq
      · exact h₁.1
      · exact ihl q hq
    · exact ⟨ihc, ihl⟩

/-- Finitely many sentences of the limit are in `A` with one stage. -/
theorem exists_stage_of_list : ∀ L : List (Sentence (ext Sig)), (∀ q ∈ L, limit hS₀ A q) →
    ∃ k, ∀ q ∈ L, withList A (stage hS₀ A k) q
  | [], _ => ⟨0, by simp⟩
  | q :: L, h => by
    obtain ⟨k, hk⟩ := exists_stage_of_list L (fun r hr => h r (List.mem_cons_of_mem _ hr))
    rcases h q List.mem_cons_self with hq | ⟨j, hj⟩
    · exact ⟨k, fun r hr => (List.mem_cons.1 hr).elim (fun e => e ▸ Or.inl hq) (hk r)⟩
    · refine ⟨max j k, fun r hr => ?_⟩
      rcases List.mem_cons.1 hr with rfl | hr
      · exact Or.inr (stage_mono (le_max_left _ _) hj)
      · exact (hk r hr).elim Or.inl (fun h => Or.inr (stage_mono (le_max_right _ _) h))

include hA hc in
theorem limit_consistent : AxiomSet.Consistent (fun q => limit hS₀ A q) := by
  rw [consistent_iff]
  intro L hL d
  obtain ⟨k, hk⟩ := exists_stage_of_list L hL
  exact (consistent_iff.1 (stage_spec hA hc k).1) L hk d

include hA hc in
theorem limit_inLang {q : Sentence (ext Sig)} (h : limit hS₀ A q) : InLang (newLang S₀) q :=
  h.elim (fun h => (hA q h).mono Set.subset_union_left) fun ⟨k, hk⟩ => (stage_spec hA hc k).2 q hk

/-- A sentence of the new language consistent with the limit is in it. -/
theorem mem_limit_of_consistent {p : Sentence (ext Sig)} (hp : InLang (newLang S₀) p)
    (h : AxiomSet.Consistent (fun q => limit hS₀ A q ∨ q = p)) : limit hS₀ A p := by
  obtain ⟨k, rfl⟩ := enum_surjective p
  have hc' : AxiomSet.Consistent (withList A (enum k :: stage hS₀ A k)) :=
    Consistent.of_subset (fun q hq => by
      rcases hq with hq | hq
      · exact Or.inl (Or.inl hq)
      rcases List.mem_cons.1 hq with rfl | hq
      · exact Or.inr rfl
      · exact Or.inl (Or.inr ⟨k, hq⟩)) h
  refine Or.inr ⟨k + 1, ?_⟩
  show enum k ∈ step hS₀ A (stage hS₀ A k) (enum k)
  unfold step
  rw [if_pos ⟨hp, hc'⟩]
  split_ifs <;> simp

include hA hc in
theorem limit_complete {p : Sentence (ext Sig)} (hp : InLang (newLang S₀) p) :
    limit hS₀ A p ∨ limit hS₀ A (neg p) := by
  by_cases h : AxiomSet.Consistent (fun q => limit hS₀ A q ∨ q = p)
  · exact Or.inl (mem_limit_of_consistent hp h)
  · refine Or.inr (mem_limit_of_consistent (inLang_neg.2 hp) fun hb => ?_)
    have h₁ := not_consistent_insert_iff.1 h
    have h₂ := not_consistent_insert_iff.1 (fun hcons => hcons hb)
    exact limit_consistent hA hc (Derivable.notE h₁ h₂)

include hA hc in
theorem limit_witnessed {σ : Ty} {F : Term (ext Sig) [] (σ ⇒ RTy.t)}
    (h : limit hS₀ A (.app (.ex σ) F)) :
    ∃ a : Term (ext Sig) [] σ, InLang (newLang S₀) a ∧ limit hS₀ A (.app F a) := by
  obtain ⟨k, hk⟩ := enum_surjective (Sig := Sig) (.app (.ex σ) F)
  have hφ : InLang (newLang S₀) (enum k) := hk ▸ limit_inLang hA hc h
  have hc' : AxiomSet.Consistent (withList A (enum k :: stage hS₀ A k)) :=
    Consistent.of_subset (fun q hq => by
      rcases hq with hq | hq
      · exact Or.inl hq
      rcases List.mem_cons.1 hq with rfl | hq
      · exact hk ▸ h
      · exact Or.inr ⟨k, hq⟩) (limit_consistent hA hc)
  have hex : ∃ (σ' : Ty) (F' : Term (ext Sig) [] (σ' ⇒ RTy.t)), enum k = .app (.ex σ') F' :=
    ⟨σ, F, hk⟩
  have hmem : witnessFor hS₀ (stage hS₀ A k) (enum k) hex ∈ stage hS₀ A (k + 1) := by
    show _ ∈ step hS₀ A (stage hS₀ A k) (enum k)
    unfold step
    rw [if_pos ⟨hφ, hc'⟩, dif_pos hex]
    exact List.mem_cons_self
  have hw := (witnessFor_spec (hS₀ := hS₀) (stage hS₀ A k) (enum k) hex hφ hc' hA).1
  obtain ⟨m, hm⟩ := witnessFor_eq (stage hS₀ A k) (enum k) hex hk
  rw [hm] at hw hmem
  exact ⟨_, (inLang_app.1 hw).2, Or.inr ⟨k + 1, hmem⟩⟩

end Construction

/-! ### The theorem -/

/-- **Lindenbaum–Henkin**: a set of sentences of a roomy language `S₀`, consistent with `C`,
is included in a maximal consistent witnessed theory of a roomy language `S ⊇ S₀`. -/
theorem lindenbaum [Countable Sig.Const] {S₀ : Set Reserve} (hS₀ : Roomy S₀)
    {A : AxiomSet (ext Sig)} (hA : ∀ p, A p → InLang S₀ p) (hc : AxiomSet.Consistent A) :
    ∃ (S : Set Reserve) (Γ : Set (Sentence (ext Sig))), S₀ ⊆ S ∧ Roomy S ∧
      (∀ p, A p → p ∈ Γ) ∧ (∀ p ∈ Γ, InLang S p) ∧ AxiomSet.Consistent (fun p => p ∈ Γ) ∧
      (∀ p, InLang S p → p ∈ Γ ∨ neg p ∈ Γ) ∧
      (∀ {σ : Ty} (F : Term (ext Sig) [] (σ ⇒ RTy.t)), Term.app (.ex σ) F ∈ Γ →
        ∃ a : Term (ext Sig) [] σ, InLang S a ∧ Term.app F a ∈ Γ) :=
  ⟨newLang S₀, limit hS₀ A, Set.subset_union_left, newLang_roomy hS₀, fun _ h => Or.inl h,
    fun _ h => limit_inLang hA hc h, limit_consistent hA hc, fun _ h => limit_complete hA hc h,
    fun _ h => limit_witnessed hA hc h⟩

/-- A term of `Sig`, read in the ambient signature, has no reserve constant. -/
@[simp] theorem inLang_lift {S : Set Reserve} : ∀ {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ),
    InLang S (Completeness.lift t)
  | _, _, .var _ => fun _ h => h.elim
  | _, _, .const c => fun r h => by
    have : (Sum.inr r : (ext Sig).Const) = Sum.inl c := h
    cases this
  | _, _, .app f a => inLang_app.2 ⟨inLang_lift f, inLang_lift a⟩
  | _, _, .lam b => inLang_lam.2 (inLang_lift b)
  | _, _, .and | _, _, .or | _, _, .not | _, _, .all _ | _, _, .ex _ | _, _, .eq _
  | _, _, .constR _ | _, _, .negR _ | _, _, .andR _ | _, _, .orR _ | _, _, .coextR _
  | _, _, .boxR _ | _, _, .inclR _ => fun _ h => h.elim

end Completeness

end Classicism.Meta
