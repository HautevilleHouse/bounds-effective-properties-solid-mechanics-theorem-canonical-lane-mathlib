import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.EffectivePropertiesBounds

/-!
# Microstructure Model Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure MicrostructureModelPackage {B : EffectivePropertiesBoundsPackage} where
  inclusionShape : Type u
  volumeFraction : Prop
  spatialDistribution : Prop
  interfaceCondition : Prop
  homogenizationScale : Prop
  periodicity : Prop

structure MicrostructureModelEvidence {B : EffectivePropertiesBoundsPackage}
    (M : MicrostructureModelPackage B) where
  volumeFractionClosed : M.volumeFraction
  spatialDistributionClosed : M.spatialDistribution
  interfaceConditionClosed : M.interfaceCondition
  homogenizationScaleClosed : M.homogenizationScale
  periodicityClosed : M.periodicity

def MicrostructureModelClosed {B : EffectivePropertiesBoundsPackage}
    (M : MicrostructureModelPackage B) : Prop :=
  M.volumeFraction ∧ M.spatialDistribution ∧ M.interfaceCondition ∧
  M.homogenizationScale ∧ M.periodicity

theorem microstructure_model_closed_from_evidence
    {B : EffectivePropertiesBoundsPackage} (M : MicrostructureModelPackage B)
    (E : MicrostructureModelEvidence M) : MicrostructureModelClosed M := by
  exact And.intro E.volumeFractionClosed
    (And.intro E.spatialDistributionClosed
      (And.intro E.interfaceConditionClosed
        (And.intro E.homogenizationScaleClosed E.periodicityClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse