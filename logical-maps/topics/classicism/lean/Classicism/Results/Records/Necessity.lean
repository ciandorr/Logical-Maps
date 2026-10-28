import Classicism.Paper
import Classicism.Principles
import Classicism.Results.Records.Coarse
import Classicism.Results.Records.C5
import Classicism.Results.Records.Lattice
import Classicism.Background.AppendixD
import Classicism.Background.Varieties

/-!
# Proofs of map records: varieties of necessity

Records concluding in the principles of the map's category `necessity-varieties`: the
Distinctness-Preserving Collapse and the principles comparing truth, `□₅`, `□̂̂` and `□_≠`
(Background, *Hats, two-hat necessity and 5-necessity*). The conventions are in
`Results/Records.lean`.

Most of them are corollaries of the chain of theorems of C

    □ ≤ □_≠ ≤ □̂̂ ≤ □₅ ≤ λp. p

proved first, link by link. The link `□̂̂ ≤ □₅` is Proposition D21 of *The Bounds of
Possibility*, Appendix D, right to left; here it is proved directly: an S5 operator `X`
is necessarily above `□_≠` (from N and B), so B for `X` at a witness `q` of `□̂̂p`, with N
and K, gives `Xp`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### The chain `□ ≤ □_≠ ≤ □̂̂ ≤ □₅ ≤ λp. p` -/

/-! ### Corollaries of the chain -/

/-- `five-implies-nd-implies-two-hat-implies-nd`: `□̂̂p → □₅p → □_≠p`. -/
theorem five_implies_nd_implies_two_hat_implies_nd :
    FiveImpliesNdNecessity → TwoHatImpliesNdNecessity := fun h p hp =>
  h p (boxHH_le_box5 p hp)

/-- `truth-implies-nd-implies-five-implies-nd`: `□₅p → p → □_≠p`. -/
theorem truth_implies_nd_implies_five_implies_nd :
    DistinctnessPreservingCollapse → FiveImpliesNdNecessity := fun h p hp =>
  h p (box5_le p hp)

/-- `truth-implies-nd-implies-truth-implies-five`: `p → □_≠p → □̂̂p → □₅p`. -/
theorem truth_implies_nd_implies_truth_implies_five :
    DistinctnessPreservingCollapse → TruthImpliesFiveNecessity := fun h p hp =>
  boxHH_le_box5 p (boxNe_le_boxHH p (h p hp))

/-- `truth-implies-two-hat-implies-five-implies-two-hat`: `□₅p → p → □̂̂p`. -/
theorem truth_implies_two_hat_implies_five_implies_two_hat :
    TruthImpliesTwoHatNecessity → FiveImpliesTwoHatNecessity := fun h p hp =>
  h p (box5_le p hp)

/-- `truth-implies-two-hat-implies-truth-implies-five`: `p → □̂̂p → □₅p`. -/
theorem truth_implies_two_hat_implies_truth_implies_five :
    TruthImpliesTwoHatNecessity → TruthImpliesFiveNecessity := fun h p hp =>
  boxHH_le_box5 p (h p hp)

/-- `five-implies-nd-implies-five-implies-two-hat`: `□₅p → □_≠p → □̂̂p`. -/
theorem five_implies_nd_implies_five_implies_two_hat :
    FiveImpliesNdNecessity → FiveImpliesTwoHatNecessity := fun h p hp =>
  boxNe_le_boxHH p (h p hp)

/-- `five-implies-nd-and-truth-implies-five-imply-truth-implies-nd`: `p → □₅p → □_≠p`. -/
theorem five_implies_nd_and_truth_implies_five_imply_truth_implies_nd :
    FiveImpliesNdNecessity → TruthImpliesFiveNecessity → DistinctnessPreservingCollapse :=
  fun h₁ h₂ p hp => h₁ p (h₂ p hp)

/-- `five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat`:
`p → □₅p → □̂̂p`. -/
theorem five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat :
    FiveImpliesTwoHatNecessity → TruthImpliesFiveNecessity → TruthImpliesTwoHatNecessity :=
  fun h₁ h₂ p hp => h₁ p (h₂ p hp)

/-- `two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd`: `□₅p → □̂̂p → □_≠p`. -/
theorem two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd :
    TwoHatImpliesNdNecessity → FiveImpliesTwoHatNecessity → FiveImpliesNdNecessity :=
  fun h₁ h₂ p hp => h₁ p (h₂ p hp)

/-! ### Under ND at `t`, `□` is an S5 operator -/

/-- Under `□`ND at `t`, `□` is an S5 operator: necessarily N and K in C, and necessarily B,
since ND at `t` gives `p → □◇p` (`b_of_nd_t`). -/
theorem s5Op_box_of_box_nd_t : NecNecessityOfDistinctnessT → S5Op Box := fun h =>
  ⟨nec% (fun (p : Prop) (hp : □ p) => hp),
   nec% (fun (p q : Prop) => modal_K p q),
   modal_K _ _ (nec% (fun (nd : NecessityOfDistinctnessT) (p : Prop) (hp : p) =>
     (by have hb := b_of_nd_t nd p hp; rwa [dia_eq_not_box_not] at hb :
       □ (¬ □ (¬ p))))) h⟩

/-- Under `□`ND at `t`, two-hat necessity implies ND-necessity: `□̂̂p → □₅p → □p → □_≠p`. -/
theorem two_hat_implies_nd_of_box_nd_t :
    NecNecessityOfDistinctnessT → TwoHatImpliesNdNecessity := fun h p hp =>
  box_le_boxNe p (boxHH_le_box5 p hp Box (s5Op_box_of_box_nd_t h))

/-- `necessary-distinctness-necessary-t-implies-necessary-two-hat-implies-nd`: the lemma
above, necessitated, with `4`. -/
theorem necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd :
    NecNecessityOfDistinctnessT → NecTwoHatImpliesNdNecessity := fun h =>
  modal_K _ _ (nec% two_hat_implies_nd_of_box_nd_t) (modal_four _ h)

/-! ### Boxed forms -/

/-- `necessary-five-implies-nd-implies-two-hat-implies-nd`. -/
theorem necessary_five_implies_nd_implies_two_hat_implies_nd :
    NecFiveImpliesNdNecessity → NecTwoHatImpliesNdNecessity :=
  modal_K _ _ (nec% five_implies_nd_implies_two_hat_implies_nd)

/-- `necessary-truth-implies-nd-implies-necessary-five-implies-nd`. -/
theorem necessary_truth_implies_nd_implies_necessary_five_implies_nd :
    NecDistinctnessPreservingCollapse → NecFiveImpliesNdNecessity :=
  modal_K _ _ (nec% truth_implies_nd_implies_five_implies_nd)

/-- `necessary-truth-implies-nd-implies-necessary-truth-implies-five`. -/
theorem necessary_truth_implies_nd_implies_necessary_truth_implies_five :
    NecDistinctnessPreservingCollapse → NecTruthImpliesFiveNecessity :=
  modal_K _ _ (nec% truth_implies_nd_implies_truth_implies_five)

/-- `necessary-truth-implies-two-hat-implies-five-implies-two-hat`. -/
theorem necessary_truth_implies_two_hat_implies_five_implies_two_hat :
    NecTruthImpliesTwoHatNecessity → NecFiveImpliesTwoHatNecessity :=
  modal_K _ _ (nec% truth_implies_two_hat_implies_five_implies_two_hat)

/-- `necessary-truth-implies-two-hat-implies-truth-implies-five`. -/
theorem necessary_truth_implies_two_hat_implies_truth_implies_five :
    NecTruthImpliesTwoHatNecessity → NecTruthImpliesFiveNecessity :=
  modal_K _ _ (nec% truth_implies_two_hat_implies_truth_implies_five)

/-- `necessary-five-implies-nd-implies-five-implies-two-hat`. -/
theorem necessary_five_implies_nd_implies_five_implies_two_hat :
    NecFiveImpliesNdNecessity → NecFiveImpliesTwoHatNecessity :=
  modal_K _ _ (nec% five_implies_nd_implies_five_implies_two_hat)

/-- `necessary-five-implies-nd-and-necessary-truth-implies-five-imply-necessary-truth-implies-nd`. -/
theorem necessary_five_implies_nd_and_necessary_truth_implies_five_imply_necessary_truth_implies_nd :
    NecFiveImpliesNdNecessity → NecTruthImpliesFiveNecessity →
      NecDistinctnessPreservingCollapse := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% five_implies_nd_and_truth_implies_five_imply_truth_implies_nd) h₁) h₂

/-- `necessary-five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat`. -/
theorem necessary_five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat :
    NecFiveImpliesTwoHatNecessity → NecTruthImpliesFiveNecessity →
      NecTruthImpliesTwoHatNecessity := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat) h₁) h₂

/-- `necessary-two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd`. -/
theorem necessary_two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd :
    NecTwoHatImpliesNdNecessity → NecFiveImpliesTwoHatNecessity →
      NecFiveImpliesNdNecessity := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd) h₁) h₂

/-! ### `□_≠` from a witness: Vicinity with BF at `t`, and Strong Atomicity at `t` -/

/-- `□(w → ◇t) → □(◇w → ◇t)`, by `4` and `◇◇t → ◇t`. -/
theorem box_dia_imp_of_box_imp_dia (w t : Prop) (h : □ (w → ◇ t)) : □ (◇ w → ◇ t) :=
  modal_K _ _ (nec% (fun (g : □ (w → ◇ t)) (hw : ◇ w) => dia_dia t (dia_mono w (◇ t) g hw)))
    (modal_four _ h)

/-- `◇(◇r ∧ q) → ¬□(◇r → ¬q)`. -/
theorem not_box_of_dia_and (r q : Prop) : ◇ (◇ r ∧ q) → ¬ □ (◇ r → ¬ q) := fun h hb =>
  not_dia_of_box_not _ (modal_K _ _ (nec% (fun (g : ◇ r → ¬ q) (c : ◇ r ∧ q) => g c.1 c.2)) hb) h

/-- `vicinity-and-barcan-t-imply-two-hat-implies-nd`. Let `w` witness Vicinity and `q` witness
`□̂̂p`, so `□(¬□_≠¬q → p)`; `w` witnesses `□_≠p` once `□(◇w → ¬□_≠¬q)`. That is
`□∀r. ◇w → r → ¬□(◇r → ¬q)`, and by BF at `t` it suffices to show each instance necessary:
vacuously if `□¬r`, and otherwise from Vicinity at the truth `◇r ∧ q`, with `4`. -/
theorem vicinity_and_barcan_t_imply_two_hat_implies_nd :
    Vicinity → BarcanT → TwoHatImpliesNdNecessity := fun ⟨w, hw, hv⟩ bf p ⟨q, hq, hb⟩ =>
  have hX : ∀ r : Prop, □ (◇ w → r → ¬ □ (◇ r → ¬ q)) := fun r =>
    (em (□ (¬ r))).elim
      (fun hn => modal_K _ _
        (nec% (fun (g : ¬ r) (_ : ◇ w) (hr : r) => ((g hr).elim : ¬ □ (◇ r → ¬ q)))) hn)
      (fun hn =>
        have hdr : ◇ r := fun e => hn ((box_not_eq r).mpr e)
        modal_K _ _
          (nec% (fun (g : ◇ w → ◇ (◇ r ∧ q)) (hw' : ◇ w) (_ : r) =>
            not_box_of_dia_and r q (g hw')))
          (box_dia_imp_of_box_imp_dia w _ ((le_iff_prop _ _).1 (hv _ ⟨hdr, hq⟩))))
  ⟨w, hw, modal_K _ _ (modal_K _ _
    (nec% (fun (H : ∀ r : Prop, ◇ w → r → ¬ □ (◇ r → ¬ q)) (g : ¬ BoxNe (¬ q) → p)
        (hw' : ◇ w) => g (fun ⟨r, hr, hb'⟩ => H r hw' hr hb')))
    (bf (fun r => ◇ w → r → ¬ □ (◇ r → ¬ q)) hX)) hb⟩

/-- `necessary-vicinity-and-necessary-barcan-t-imply-necessary-two-hat-implies-nd`: the
unboxed record, necessitated. -/
theorem necessary_vicinity_and_necessary_barcan_t_imply_necessary_two_hat_implies_nd :
    NecVicinity → NecBarcanT → NecTwoHatImpliesNdNecessity := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% vicinity_and_barcan_t_imply_two_hat_implies_nd) h₁) h₂

/-- A true proposition deciding `Y` entails it if `Y` is true. -/
theorem le_of_decides_true (v Y : Prop) (S : v ≤ Y ∨ v ≤ ¬ Y) (hv : v) (hY : Y) : v ≤ Y :=
  S.elim id fun h => (imp_of_le_prop v (¬ Y) h hv hY).elim

/-- At a world where `v` holds and decides every proposition, and `◇(◇v ∧ q)`, `□_≠¬q` fails:
a witness `r` of it is true, so `v ≤ r`, so `◇(◇r ∧ q)`, against `□(◇r → ¬q)`. -/
theorem not_boxNe_neg_of_decides (v q : Prop) :
    (∀ Y : Prop, v ≤ Y ∨ v ≤ ¬ Y) → (v → ◇ (◇ v ∧ q)) → v → ¬ BoxNe (¬ q) :=
  fun S D hv ⟨r, hr, hb⟩ =>
    have hdr : □ (◇ v ∧ q → ◇ r ∧ q) := modal_K _ _
      (nec% (fun (g : ◇ v → ◇ r) (c : ◇ v ∧ q) => (⟨g c.1, c.2⟩ : ◇ r ∧ q)))
      (modal_K _ _ (nec% (fun (g : □ (v → r)) => dia_mono v r g))
        (modal_four _ ((le_iff_prop v r).1 (le_of_decides_true v r (S r) hv hr))))
    not_box_of_dia_and r q (dia_mono _ _ hdr (D hv)) hb

/-- `strong-atomicity-t-implies-two-hat-implies-nd`. Let `w` be a true strong atom (Strong
Actuality) and `q` witness `□̂̂p`; `w` witnesses `□_≠p`, by the dual of Strong Atomicity: every
strong atom `v` entails `◇w → p`. If `v ≤ ¬◇w`, trivially. If `v ≤ ◇w`: `w` entails the truth
`◇v ∧ q`, so `v ≤ ◇(◇v ∧ q)`, and since `v` necessarily decides everything,
`v ≤ ¬□_≠¬q ≤ p`. -/
theorem strong_atomicity_t_implies_two_hat_implies_nd :
    StrongAtomicityT → TwoHatImpliesNdNecessity := fun sl p ⟨q, hq, hb⟩ =>
  (strong_atomicity_t_implies_strong_actuality sl).elim fun w ⟨hw, hS⟩ =>
    have key : ∀ v : Prop, SAtom v → v ≤ (◇ w → p) := fun v ⟨hv0, hvS⟩ =>
      ((box_elim hvS) (◇ w)).elim
        (fun hvw =>
          have hwv : w ≤ (◇ v ∧ q) := le_of_decides_true w _ (box_elim hS _) hw ⟨hv0, hq⟩
          have h₁ : □ (◇ w → ◇ (◇ v ∧ q)) := modal_K _ _
            (nec% (fun (g : □ (w → ◇ v ∧ q)) => dia_mono w _ g))
            (modal_four _ ((le_iff_prop _ _).1 hwv))
          have hvD : □ (v → ◇ (◇ v ∧ q)) := modal_K _ _ (modal_K _ _
            (nec% (fun (a : v → ◇ w) (b : ◇ w → ◇ (◇ v ∧ q)) (hv : v) => b (a hv)))
            ((le_iff_prop _ _).1 hvw)) h₁
          have hneg : □ (v → ¬ BoxNe (¬ q)) := modal_K _ _ (modal_K _ _
            (nec% (not_boxNe_neg_of_decides v q)) hvS) hvD
          (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _
            (nec% (fun (a : v → ¬ BoxNe (¬ q)) (b : ¬ BoxNe (¬ q) → p) (hv : v) (_ : ◇ w) =>
              b (a hv))) hneg) hb))
        (fun hvn => (le_iff_prop _ _).2 (modal_K _ _
          (nec% (fun (a : v → ¬ ◇ w) (hv : v) (h : ◇ w) => ((a hv h).elim : p)))
          ((le_iff_prop _ _).1 hvn)))
    ⟨w, hw, StrongAtomicityT.to_dual sl _ key⟩

/-- `necessary-strong-atomicity-t-implies-necessary-two-hat-implies-nd`: necessitated, and `K`. -/
theorem necessary_strong_atomicity_t_implies_necessary_two_hat_implies_nd :
    NecStrongAtomicityT → NecTwoHatImpliesNdNecessity :=
  modal_K _ _ (nec% strong_atomicity_t_implies_two_hat_implies_nd)

/-! ### Records from *The Bounds of Possibility*, Appendix D -/

open AppD in
/-- `□_≠` is NKJ: N by `□ ≤ □_≠`; K with the conjunction of the witnesses; J with `p` itself. -/
theorem boxNe_nkj : AppD.OpNKJ BoxNe :=
  ⟨box_le_boxNe,
   fun p r ⟨q, hq, hb⟩ ⟨q', hq', hb'⟩ => ⟨q ∧ q', ⟨hq, hq'⟩, modal_K _ _ (modal_K _ _
     (nec% (fun (g : ◇ q → (p → r)) (g' : ◇ q' → p) (hd : ◇ (q ∧ q')) =>
       g (dia_mono _ _ (nec% (fun (c : q ∧ q') => c.1)) hd)
         (g' (dia_mono _ _ (nec% (fun (c : q ∧ q') => c.2)) hd)))) hb) hb'⟩,
   fun p hp => ⟨p, hp, nec% (fun (h : ◇ p) => h)⟩⟩

open AppD in
/-- `actuality-implies-five-implies-two-hat`. With `a` witnessing Actuality, `W@ a`; `□_≠` is
`□NKJ`, so `□̂̂`, its hat, is NKJ (D14) and, at the actual world, F⟨⟩ (D19). The map's `□₅` is
below the appendix's (D16), which is below every operator that is NKJF⟨⟩, by relativization as
in D8. -/
theorem actuality_implies_five_implies_two_hat :
    Actuality → FiveImpliesTwoHatNecessity := fun ⟨a, ha, hle⟩ p h5 =>
  have hW : WAt a := ⟨ha, fun q hq => (le_iff_prop _ _).1 (hle q hq)⟩
  have hBN : □ (OpNKJ BoxNe) := nec% boxNe_nkj
  have h14 : OpNKJ (Hat BoxNe) := prop_D14_core BoxNe
    (modal_K _ _ (nec% (fun (h : OpNKJ BoxNe) => (⟨h.1, h.2.1⟩ : OpNK BoxNe))) hBN)
  box5A_le_of_nkjf BoxHH ⟨h14.1, h14.2.1, h14.2.2, prop_D19 BoxNe hBN a hW⟩ p
    (box5_le_box5A p h5)

/-- `necessary-actuality-implies-necessary-five-implies-two-hat`: necessitated, and `K`. -/
theorem necessary_actuality_implies_necessary_five_implies_two_hat :
    NecActuality → NecFiveImpliesTwoHatNecessity :=
  modal_K _ _ (nec% actuality_implies_five_implies_two_hat)

/-- Under `□`(two-hat ⇒ ND), `□_≠` is an S5 operator: necessarily N and K, and necessarily B,
since D11 gives `p → □̂̂¬□_≠¬p`. -/
theorem s5Op_boxNe_of_nec_two_hat_nd : NecTwoHatImpliesNdNecessity → S5Op BoxNe := fun H =>
  ⟨nec% box_le_boxNe, nec% boxNe_nkj.2.1,
   modal_K _ _ (nec% (fun (h : TwoHatImpliesNdNecessity) (p : Prop) (hp : p) =>
     h _ (AppD.prop_D11a BoxNe p hp))) H⟩

/-- Under `□`(two-hat ⇒ ND), 5-necessity implies two-hat necessity: `□₅p → □_≠p → □̂̂p`. -/
theorem five_implies_two_hat_of_nec_two_hat_nd :
    NecTwoHatImpliesNdNecessity → FiveImpliesTwoHatNecessity := fun H p h5 =>
  boxNe_le_boxHH p (h5 BoxNe (s5Op_boxNe_of_nec_two_hat_nd H))

/-- `necessary-two-hat-implies-nd-implies-necessary-five-implies-two-hat`: the lemma above,
necessitated, with `4`. -/
theorem necessary_two_hat_implies_nd_implies_necessary_five_implies_two_hat :
    NecTwoHatImpliesNdNecessity → NecFiveImpliesTwoHatNecessity := fun H =>
  modal_K _ _ (nec% five_implies_two_hat_of_nec_two_hat_nd) (modal_four _ H)

/-- A possible proposition that is not an atom has a possible strict lower bound, `p ≤ a` being
the identity `a = p ∨ a`. -/
theorem lower_bound_of_not_atom (a : Prop) :
    ◇ a ∧ ¬ Atom a → ∃ p : Prop, p ≠ a ∧ a = (p ∨ a) ∧ ◇ p := fun ⟨hd, hn⟩ =>
  (em (∃ p : Prop, p ≠ a ∧ a = (p ∨ a) ∧ ◇ p)).elim id fun hno => (hn fun z =>
    ⟨fun ⟨hza, hne⟩ => (em (z = False)).elim (fun e => le_neg_of_eq_false z e)
        fun hz => (hno ⟨z, hne, hza, hz⟩).elim,
     fun hz => have e := eq_false_of_le_neg z hz
       ⟨e ▸ bot_le_prop a, fun eza => hd (eza ▸ e)⟩⟩).elim

/-- A true proposition entailing every truth is an atom. -/
theorem atom_of_wAt (a : Prop) (ha : AppD.WAt a) : Atom a := fun z =>
  ⟨fun ⟨hza, hne⟩ => (em z).elim
      (fun hz => (hne (le_antisymm_prop z a hza ((le_iff_prop _ _).2 (ha.2 z hz)))).elim)
      (fun hz => le_trans_prop z a (¬ z) hza ((le_iff_prop _ _).2 (ha.2 _ hz))),
   fun hz => have e := eq_false_of_le_neg z hz
     ⟨e ▸ bot_le_prop a, fun eza => (eza ▸ e : a = False) ▸ ha.1⟩⟩

/-- Where `a` is impossible or an atom, it decides every proposition. -/
theorem decides_of (a : Prop) : ¬ (◇ a ∧ ¬ Atom a) → ∀ q : Prop, a ≤ q ∨ a ≤ ¬ q := fun h q =>
  (em (◇ a)).elim
    (fun hd => atom_le_or_le_neg a q ((em (Atom a)).elim id fun hn => (h ⟨hd, hn⟩).elim))
    (fun hd => have e : a = False := (em (a = False)).elim id fun hne => (hd hne).elim
      Or.inl (e ▸ bot_le_prop q))

open AppD in
/-- `actuality-and-two-hat-implies-nd-imply-strong-actuality`. Let `a` witness Actuality, an atom
entailing every truth. If possibly `a` is possible but not an atom, then `◇_≠` of that, since
`a` entails every truth; by the premise, `◇̂̂` of it, so `◇̂̂` that `a` has a possible strict
lower bound; BF for `□̂̂` at the actual world (D19) gives a `p` with `◇̂̂(p ≠ a ∧ p ≤ a ∧ ◇p)`;
and since `□̂̂` is NKJ (D14), D1 and N bring back `p ≠ a`, `p ≤ a` and `◇p`, against the
atomicity of `a`. -/
theorem actuality_and_two_hat_implies_nd_imply_strong_actuality :
    Actuality → TwoHatImpliesNdNecessity → StrongActuality := fun ⟨a, ha, hle⟩ h2 =>
  have hW : WAt a := ⟨ha, fun q hq => (le_iff_prop _ _).1 (hle q hq)⟩
  have hBN : □ (OpNKJ BoxNe) := nec% boxNe_nkj
  have h14 : OpNKJ BoxHH := prop_D14_core BoxNe
    (modal_K _ _ (nec% (fun (h : OpNKJ BoxNe) => (⟨h.1, h.2.1⟩ : OpNK BoxNe))) hBN)
  have hNK : OpNK BoxHH := ⟨h14.1, h14.2.1⟩
  have hF : OpF0 BoxHH := prop_D19 BoxNe hBN a hW
  have hnot : ¬ ◇ (◇ a ∧ ¬ Atom a) := fun hB =>
    -- `◇_≠ B`: for a true `q`, `a ≤ q`, so necessarily `B → ◇q`.
    have hdne : ¬ BoxNe (¬ (◇ a ∧ ¬ Atom a)) := fun ⟨q, hq, hb⟩ =>
      not_dia_of_box_not _ (modal_K _ _ (modal_K _ _
        (nec% (fun (g : □ (a → q)) (g' : ◇ q → ¬ (◇ a ∧ ¬ Atom a)) (c : ◇ a ∧ ¬ Atom a) =>
          g' (dia_mono a q g c.1) c)) (modal_four _ (hW.2 q hq))) hb) hB
    have hhh : ¬ BoxHH (¬ ∃ p : Prop, p ≠ a ∧ a = (p ∨ a) ∧ ◇ p) :=
      op_dual_mono BoxHH hNK _ _ (nec% (lower_bound_of_not_atom a)) (fun h => hdne (h2 _ h))
    (f0_dual BoxHH hNK hF _ hhh).elim fun p hp =>
      have hne : p ≠ a := ne_of_dia_ne p a (nk_dual_dia BoxHH hNK _
        (op_dual_mono BoxHH hNK _ _ (nec% (fun (c : p ≠ a ∧ a = (p ∨ a) ∧ ◇ p) => c.1)) hp))
      have hpa : a = (p ∨ a) := prop_D1_dual BoxHH h14 a (p ∨ a)
        (op_dual_mono BoxHH hNK _ _ (nec% (fun (c : p ≠ a ∧ a = (p ∨ a) ∧ ◇ p) => c.2.1)) hp)
      have hdp : ◇ p := dia_dia p (nk_dual_dia BoxHH hNK _
        (op_dual_mono BoxHH hNK _ _ (nec% (fun (c : p ≠ a ∧ a = (p ∨ a) ∧ ◇ p) => c.2.2)) hp))
      hdp (eq_false_of_le_neg p ((atom_of_wAt a hW p).1 ⟨hpa, hne⟩))
  ⟨a, ha, modal_K _ _ (nec% (decides_of a)) (box_not_of_not_dia _ hnot)⟩

/-- `necessary-actuality-and-necessary-two-hat-implies-nd-imply-necessary-strong-actuality`. -/
theorem necessary_actuality_and_necessary_two_hat_implies_nd_imply_necessary_strong_actuality :
    NecActuality → NecTwoHatImpliesNdNecessity → NecStrongActuality := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% actuality_and_two_hat_implies_nd_imply_strong_actuality) h₁) h₂

/-! ### `T` -/

/-- `necessary-truth-implies-five-necessity-implies-truth-implies-five-necessity`. -/
theorem necessary_truth_implies_five_necessity_implies_truth_implies_five_necessity :
    NecTruthImpliesFiveNecessity → TruthImpliesFiveNecessity := box_elim
/-- `necessary-truth-implies-two-hat-necessity-implies-truth-implies-two-hat-necessity`. -/
theorem necessary_truth_implies_two_hat_necessity_implies_truth_implies_two_hat_necessity :
    NecTruthImpliesTwoHatNecessity → TruthImpliesTwoHatNecessity := box_elim
/-- `necessary-five-implies-two-hat-necessity-implies-five-implies-two-hat-necessity`. -/
theorem necessary_five_implies_two_hat_necessity_implies_five_implies_two_hat_necessity :
    NecFiveImpliesTwoHatNecessity → FiveImpliesTwoHatNecessity := box_elim
/-- `necessary-five-implies-nd-necessity-implies-five-implies-nd-necessity`. -/
theorem necessary_five_implies_nd_necessity_implies_five_implies_nd_necessity :
    NecFiveImpliesNdNecessity → FiveImpliesNdNecessity := box_elim
/-- `necessary-two-hat-implies-nd-necessity-implies-two-hat-implies-nd-necessity`. -/
theorem necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity :
    NecTwoHatImpliesNdNecessity → TwoHatImpliesNdNecessity := box_elim

end Classicism.Proofs
