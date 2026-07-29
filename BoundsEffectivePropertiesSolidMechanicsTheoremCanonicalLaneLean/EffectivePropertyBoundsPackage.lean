import canonicalLaneMathlib.AdmissibleClass

/-!
# Effective Property Bounds Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectivePropertyBoundsPackage where
  voigtUpperBound : Prop
  reussLowerBound : Prop
  hashinShtrikmanUpper : Prop
  hashinShtrikmanLower : Prop
  boundsConsistency : Prop

structure EffectivePropertyBoundsEvidence (P : EffectivePropertyBoundsPackage) where
  voigtUpperBoundClosed : P.voigtUpperBound
  reussLowerBoundClosed : P.reussLowerBound
  hashinShtrikmanUpperClosed : P.hashinShtrikmanUpper
  hashinShtrikmanLowerClosed : P.hashinShtrikmanLower
  boundsConsistencyClosed : P.boundsConsistency

def EffectivePropertyBoundsClosed (P : EffectivePropertyBoundsPackage) : Prop :=
  P.voigtUpperBound ∧ P.reussLowerBound ∧
  P.hashinShtrikmanUpper ∧ P.hashinShtrikmanLower ∧
  P.boundsConsistency

theorem effective_property_bounds_closed_from_evidence
    (P : EffectivePropertyBoundsPackage) (E : EffectivePropertyBoundsEvidence P) :
    EffectivePropertyBoundsClosed P := by
  exact And.intro E.voigtUpperBoundClosed
    (And.intro E.reussLowerBoundClosed
      (And.intro E.hashinShtrikmanUpperClosed
        (And.intro E.hashinShtrikmanLowerClosed E.boundsConsistencyClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse