import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.CompositeMicrostructure

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectiveModuliBoundsPackage {M : CompositeMicrostructurePackage} where
  effectiveBulkModulus : ℝ
  effectiveShearModulus : ℝ
  hashinShtrikmanUpperBound : Prop
  hashinShtrikmanLowerBound : Prop
  boundAdmissible : hashinShtrikmanUpperBound ∧ hashinShtrikmanLowerBound

structure BoundEvidence {M : CompositeMicrostructurePackage} (B : EffectiveModuliBoundsPackage M) where
  upperBoundClosed : B.hashinShtrikmanUpperBound
  lowerBoundClosed : B.hashinShtrikmanLowerBound

def BoundClosed {M : CompositeMicrostructurePackage} (B : EffectiveModuliBoundsPackage M) : Prop :=
  B.boundAdmissible

theorem bound_closed_from_evidence {M : CompositeMicrostructurePackage} (B : EffectiveModuliBoundsPackage M) (E : BoundEvidence B) :
    BoundClosed B := by
  exact And.intro E.upperBoundClosed E.lowerBoundClosed

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse