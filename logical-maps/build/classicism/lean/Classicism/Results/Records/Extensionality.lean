import Classicism.Paper
import Classicism.Principles
import Classicism.Results.Records.Coarse

/-!
# Proofs of map records: Extensionality and the Fregean Axiom

Records concluding in the principles of the map's category `extensionality`, and the
Truths are ND-necessary, which the Fregean Axiom gives (Classicism, §§1.4, 2.6).
The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### Extensionality (Classicism, §1.4) -/

/-- `extensionality-r-implies-fregean-axiom`: the nullary instance. -/
theorem extensionality_r_implies_fregean_axiom : Extensionality Prop → FregeanAxiom :=
  fun ext p q h => ext p q h

/-- `fregean-axiom-implies-extensionality-r`: the Fregean Axiom makes the true
coextension sentence identical to `True`, and Intensionality finishes. -/
theorem fregean_axiom_implies_extensionality_r {τ : Type} [Rel τ] :
    FregeanAxiom → Extensionality τ := by
  intro fa X Y h
  exact intensionality X Y (fa (X ≡ Y) True ⟨fun _ => trivial, fun _ => h⟩)

/-- `necessary-extensionality-r-implies-extensionality-r`: `T`. -/
theorem necessary_extensionality_r_implies_extensionality_r {τ : Type} [Rel τ] :
    NecExtensionality τ → Extensionality τ := box_elim
/-- `necessary-fregean-axiom-implies-fregean-axiom`: `T`. -/
theorem necessary_fregean_axiom_implies_fregean_axiom : NecFregeanAxiom → FregeanAxiom := box_elim
/-- `necessary-functionality-r-implies-functionality-r`: `T`. -/
theorem necessary_functionality_r_implies_functionality_r {σ τ : Type} [Ty σ] [Rel τ] :
    NecFunctionality σ τ → Functionality σ τ := box_elim
/-- `necessary-barcan-r-implies-necessary-functionality-r`: Proposition 2.1 necessitated. -/
theorem necessary_barcan_r_implies_necessary_functionality_r {σ τ : Type} [Ty σ] [Rel τ] :
    NecBarcan σ → NecFunctionality σ τ :=
  modal_K _ _ (nec% (barcan_r_implies_functionality_r (σ := σ) (τ := τ)))
/-- `extensionality-r-implies-functionality-r`: pointwise identity is coextension. -/
theorem extensionality_r_implies_functionality_r {σ τ : Type} [Ty σ] [Rel τ] :
    Extensionality (σ → τ) → Functionality σ τ := fun ext X Y h =>
  ext X Y (fun z => by show Rel.coext (X z) (Y z); rw [h z]; exact Rel.coext_refl (Y z))

/-- A truth is `⊤` under the Fregean Axiom, so necessary. -/
theorem box_of_fregean (fa : FregeanAxiom) (p : Prop) (hp : p) : □ p :=
  fa p True ⟨fun _ => trivial, fun _ => hp⟩

/-- `fregean-axiom-implies-necessary-fregean-axiom`. -/
theorem fregean_axiom_implies_necessary_fregean_axiom : FregeanAxiom → NecFregeanAxiom :=
  fun fa => box_of_fregean fa _ fa

/-- `extensionality-r-implies-necessary-extensionality-r`: the nullary instance is the
Fregean Axiom, which makes every truth necessary. -/
theorem extensionality_r_implies_necessary_extensionality_r {τ : Type} [Rel τ] :
    Extensionality τ → Extensionality Prop → NecExtensionality τ := fun ext extP =>
  box_of_fregean (extensionality_r_implies_fregean_axiom extP) _ ext

/-- `fregean-axiom-implies-truths-are-nd-necessary`: `⊤` is a true `q` with
`□(◇⊤ → p)`, since `p` is necessary. -/
theorem fregean_axiom_implies_truths_are_nd_necessary :
    FregeanAxiom → TruthsAreNDNecessary := fun fa p hp =>
  ⟨True, trivial, box_of_fregean fa _ (fun _ => hp)⟩

/-- `truths-are-nd-necessary-and-nd-imply-fregean-axiom`: under `ND_t` the two
necessities coincide, so every truth is `⊤` and every falsehood `⊥`. -/
theorem truths_are_nd_necessary_and_nd_imply_fregean_axiom :
    TruthsAreNDNecessary → NecessityOfDistinctness Prop → FregeanAxiom :=
  fun col nd p q hpq =>
    have box : ∀ r : Prop, r → □ r := fun r hr => (col r hr).elim fun s hs =>
      modal_K _ _ hs.2 (nd s False (fun e => (e ▸ hs.1 : False)))
    (em p).elim
      (fun hp => (box p hp).trans (box q (hpq.1 hp)).symm)
      (fun hnp =>
        have hp0 : p = False := by rw [← box_not_eq]; exact box _ hnp
        have hq0 : q = False := by rw [← box_not_eq]; exact box _ (fun hq => hnp (hpq.2 hq))
        hp0.trans hq0.symm)

end Classicism.Proofs
