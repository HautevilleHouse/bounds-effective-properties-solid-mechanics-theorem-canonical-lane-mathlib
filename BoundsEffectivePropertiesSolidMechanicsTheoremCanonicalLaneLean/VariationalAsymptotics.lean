import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.BoundsEffectiveProperties

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure VariationalAsymptoticsPackage {P : BoundsEffectivePropertiesPackage}
    (E : BoundsEffectivePropertiesEvidence P) where
  asymptoticExpansionValid : Prop
  cellProblemSolved : Prop
  homogenizedConstitutiveRelation : Prop
  energyConvergence : Prop
  correctorEstimates : Prop
  expansionHierarchy : Prop

structure VariationalAsymptoticsEvidence {P : BoundsEffectivePropertiesPackage}
    {E : BoundsEffectivePropertiesEvidence P} (V : VariationalAsymptoticsPackage E) where
  asymptoticExpansionValidClosed : V.asymptoticExpansionValid
  cellProblemSolvedClosed : V.cellProblemSolved
  homogenizedConstitutiveRelationClosed : V.homogenizedConstitutiveRelation
  energyConvergenceClosed : V.energyConvergence
  correctorEstimatesClosed : V.correctorEstimates
  expansionHierarchyClosed : V.expansionHierarchy

def VariationalAsymptoticsClosed {P : BoundsEffectivePropertiesPackage}
    {E : BoundsEffectivePropertiesEvidence P} (V : VariationalAsymptoticsPackage E) : Prop :=
  V.asymptoticExpansionValid ∧ V.cellProblemSolved ∧
  V.homogenizedConstitutiveRelation ∧ V.energyConvergence ∧
  V.correctorEstimates ∧ V.expansionHierarchy

theorem variational_asymptotics_closed_from_evidence
    {P : BoundsEffectivePropertiesPackage} {E : BoundsEffectivePropertiesEvidence P}
    (V : VariationalAsymptoticsPackage E) (VE : VariationalAsymptoticsEvidence V) :
    VariationalAsymptoticsClosed V := by
  exact And.intro VE.asymptoticExpansionValidClosed
    (And.intro VE.cellProblemSolvedClosed
      (And.intro VE.homogenizedConstitutiveRelationClosed
        (And.intro VE.energyConvergenceClosed
          (And.intro VE.correctorEstimatesClosed VE.expansionHierarchyClosed))))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse