import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure CompositeMicrostructurePackage where
  constituentPhases : Type u
  phaseModuli : constituentPhases → ℝ
  volumeFractions : constituentPhases → ℝ
  isotropy : Prop
  twoPhase : ∃ (a b : constituentPhases), a ≠ b ∧ (∀ x, x = a ∨ x = b)
  volumeSumOne : (∑ p, volumeFractions p) = 1

structure MicrostructureEvidence where
  isotropyClosed : CompositeMicrostructurePackage.isotropy
  twoPhaseClosed : CompositeMicrostructurePackage.twoPhase
  volumeSumOneClosed : CompositeMicrostructurePackage.volumeSumOne

def MicrostructureClosed (M : CompositeMicrostructurePackage) : Prop :=
  M.isotropy ∧ M.twoPhase ∧ M.volumeSumOne

theorem microstructure_closed_from_evidence (M : CompositeMicrostructurePackage) (E : MicrostructureEvidence) :
    MicrostructureClosed M := by
  exact And.intro E.isotropyClosed (And.intro E.twoPhaseClosed E.volumeSumOneClosed)

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse