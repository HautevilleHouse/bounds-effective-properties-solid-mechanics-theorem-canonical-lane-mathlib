import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.VariationalBoundsPackage

/-!
# Homogenization Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure HomogenizationPackage {P : EffectivePropertiesPackage}
    {V : VariationalBoundsPackage P} where
  periodicMicrostructure : Prop
  scaleSeparation : Prop
  cellProblemSolved : Prop
  effectiveModuliComputed : Prop
  boundsConverge : Prop

structure HomogenizationEvidence {P : EffectivePropertiesPackage}
    {V : VariationalBoundsPackage P} (H : HomogenizationPackage V) where
  periodicMicrostructureClosed : H.periodicMicrostructure
  scaleSeparationClosed : H.scaleSeparation
  cellProblemSolvedClosed : H.cellProblemSolved
  effectiveModuliComputedClosed : H.effectiveModuliComputed
  boundsConvergeClosed : H.boundsConverge

def HomogenizationClosed {P : EffectivePropertiesPackage}
    {V : VariationalBoundsPackage P} (H : HomogenizationPackage V) : Prop :=
  H.periodicMicrostructure ∧ H.scaleSeparation ∧
  H.cellProblemSolved ∧ H.effectiveModuliComputed ∧ H.boundsConverge

theorem homogenization_closed_from_evidence {P : EffectivePropertiesPackage}
    {V : VariationalBoundsPackage P} (H : HomogenizationPackage V)
    (E : HomogenizationEvidence H) : HomogenizationClosed H := by
  exact And.intro E.periodicMicrostructureClosed
    (And.intro E.scaleSeparationClosed
      (And.intro E.cellProblemSolvedClosed
        (And.intro E.effectiveModuliComputedClosed E.boundsConvergeClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
