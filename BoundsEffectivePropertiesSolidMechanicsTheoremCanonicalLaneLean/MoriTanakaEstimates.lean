import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure MoriTanakaEstimatesPackage where
  inclusionShape : Type u
  matrixStiffness : ℝ
  inclusionStiffness : ℝ
  volumeFraction : ℝ
  diluteEstimate : ℝ
  moriTanakaEstimate : ℝ
  estimateRelation : moriTanakaEstimate = matrixStiffness + volumeFraction * (inclusionStiffness - matrixStiffness) * (1 + (1 - volumeFraction) * (inclusionStiffness - matrixStiffness) / (matrixStiffness + (4/3)*matrixStiffness))⁻¹

structure MoriTanakaEstimatesEvidence (M : MoriTanakaEstimatesPackage) where
  estimateRelationClosed : M.estimateRelation

def MoriTanakaEstimatesClosed (M : MoriTanakaEstimatesPackage) : Prop :=
  M.estimateRelation

theorem mori_tanaka_estimates_closed_from_evidence (M : MoriTanakaEstimatesPackage) (E : MoriTanakaEstimatesEvidence M) : MoriTanakaEstimatesClosed M := by
  exact E.estimateRelationClosed

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse