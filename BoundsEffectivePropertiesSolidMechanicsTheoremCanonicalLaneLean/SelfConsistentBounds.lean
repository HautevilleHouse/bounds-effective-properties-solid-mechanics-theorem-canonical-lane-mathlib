import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure SelfConsistentBoundsPackage where
  inclusionGeometry : Type u
  effectiveMediumCondition : Prop
  consistencyEquation : Prop
  boundValidity : Prop
  iterativeFixpoint : Prop

structure SelfConsistentBoundsEvidence (S : SelfConsistentBoundsPackage) where
  inclusionGeometryClosed : S.inclusionGeometry
  effectiveMediumConditionClosed : S.effectiveMediumCondition
  consistencyEquationClosed : S.consistencyEquation
  boundValidityClosed : S.boundValidity
  iterativeFixpointClosed : S.iterativeFixpoint

def SelfConsistentBoundsClosed (S : SelfConsistentBoundsPackage) : Prop :=
  S.inclusionGeometry ∧ S.effectiveMediumCondition ∧
  S.consistencyEquation ∧ S.boundValidity ∧ S.iterativeFixpoint

theorem self_consistent_bounds_closed_from_evidence
    (S : SelfConsistentBoundsPackage) (E : SelfConsistentBoundsEvidence S) :
    SelfConsistentBoundsClosed S := by
  exact And.intro E.inclusionGeometryClosed
    (And.intro E.effectiveMediumConditionClosed
      (And.intro E.consistencyEquationClosed
        (And.intro E.boundValidityClosed E.iterativeFixpointClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse