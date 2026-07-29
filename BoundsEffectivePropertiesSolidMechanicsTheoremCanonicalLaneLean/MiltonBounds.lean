import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure MiltonBoundsPackage where
  dielectricAnalogy : Type u
  translationMethod : Prop
  improvedLowerBound : Prop
  improvedUpperBound : Prop
  threePointCorrelation : Prop

structure MiltonBoundsEvidence (M : MiltonBoundsPackage) where
  dielectricAnalogyClosed : M.dielectricAnalogy
  translationMethodClosed : M.translationMethod
  improvedLowerBoundClosed : M.improvedLowerBound
  improvedUpperBoundClosed : M.improvedUpperBound
  threePointCorrelationClosed : M.threePointCorrelation

def MiltonBoundsClosed (M : MiltonBoundsPackage) : Prop :=
  M.dielectricAnalogy ∧ M.translationMethod ∧
  M.improvedLowerBound ∧ M.improvedUpperBound ∧ M.threePointCorrelation

theorem milton_bounds_closed_from_evidence
    (M : MiltonBoundsPackage) (E : MiltonBoundsEvidence M) :
    MiltonBoundsClosed M := by
  exact And.intro E.dielectricAnalogyClosed
    (And.intro E.translationMethodClosed
      (And.intro E.improvedLowerBoundClosed
        (And.intro E.improvedUpperBoundClosed E.threePointCorrelationClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse