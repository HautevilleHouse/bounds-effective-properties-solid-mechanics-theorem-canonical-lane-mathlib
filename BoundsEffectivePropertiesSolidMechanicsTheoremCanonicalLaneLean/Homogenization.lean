import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.MicrostructureModel

/-!
# Homogenization Process Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure HomogenizationPackage {B : EffectivePropertiesBoundsPackage}
    {M : MicrostructureModelPackage B} where
  localProblemSolved : Prop
  concentrationTensors : Prop
  effectiveModuliComputed : Prop
  convergenceRate : Prop
  scaleSeparation : Prop

structure HomogenizationEvidence {B : EffectivePropertiesBoundsPackage}
    {M : MicrostructureModelPackage B} (H : HomogenizationPackage M) where
  localProblemSolvedClosed : H.localProblemSolved
  concentrationTensorsClosed : H.concentrationTensors
  effectiveModuliComputedClosed : H.effectiveModuliComputed
  convergenceRateClosed : H.convergenceRate
  scaleSeparationClosed : H.scaleSeparation

def HomogenizationClosed {B : EffectivePropertiesBoundsPackage}
    {M : MicrostructureModelPackage B} (H : HomogenizationPackage M) : Prop :=
  H.localProblemSolved ∧ H.concentrationTensors ∧ H.effectiveModuliComputed ∧
  H.convergenceRate ∧ H.scaleSeparation

theorem homogenization_closed_from_evidence
    {B : EffectivePropertiesBoundsPackage} {M : MicrostructureModelPackage B}
    (H : HomogenizationPackage M) (E : HomogenizationEvidence H) :
    HomogenizationClosed H := by
  exact And.intro E.localProblemSolvedClosed
    (And.intro E.concentrationTensorsClosed
      (And.intro E.effectiveModuliComputedClosed
        (And.intro E.convergenceRateClosed E.scaleSeparationClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse