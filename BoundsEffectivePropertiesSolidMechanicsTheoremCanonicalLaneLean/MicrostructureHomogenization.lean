import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure MicrostructureHomogenizationPackage where
  representativeVolumeElement : Type u
  localElasticityTensor : Type v
  homogenizedStiffnessTensor : Type w
  ergodicAssumption : Prop
  scaleSeparation : Prop
  ergodicAssumptionClosed : ergodicAssumption
  scaleSeparationClosed : scaleSeparation

structure MicrostructureHomogenizationEvidence (M : MicrostructureHomogenizationPackage) where
  ergodicAssumptionClosed : M.ergodicAssumption
  scaleSeparationClosed : M.scaleSeparation

def MicrostructureHomogenizationClosed (M : MicrostructureHomogenizationPackage) : Prop :=
  M.ergodicAssumption ∧ M.scaleSeparation

theorem microstructure_homogenization_closed_from_evidence
    (M : MicrostructureHomogenizationPackage) (E : MicrostructureHomogenizationEvidence M) :
    MicrostructureHomogenizationClosed M := by
  exact And.intro E.ergodicAssumptionClosed E.scaleSeparationClosed

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
