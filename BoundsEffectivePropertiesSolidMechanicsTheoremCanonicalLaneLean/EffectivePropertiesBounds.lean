import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Effective Properties Bounds Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectivePropertiesBoundsPackage where
  strainEnergyDensity : Type u
  stressPotential : Type v
  lowerBound : Prop
  upperBound : Prop
  hashinShtrikmanBound : Prop
  voigtReussBound : Prop
  boundaryConditions : Prop

structure EffectivePropertiesBoundsEvidence (B : EffectivePropertiesBoundsPackage) where
  lowerBoundClosed : B.lowerBound
  upperBoundClosed : B.upperBound
  hashinShtrikmanBoundClosed : B.hashinShtrikmanBound
  voigtReussBoundClosed : B.voigtReussBound
  boundaryConditionsClosed : B.boundaryConditions

def EffectivePropertiesBoundsClosed (B : EffectivePropertiesBoundsPackage) : Prop :=
  B.lowerBound ∧ B.upperBound ∧ B.hashinShtrikmanBound ∧ B.voigtReussBound ∧ B.boundaryConditions

theorem effective_properties_bounds_closed_from_evidence
    (B : EffectivePropertiesBoundsPackage) (E : EffectivePropertiesBoundsEvidence B) :
    EffectivePropertiesBoundsClosed B := by
  exact And.intro E.lowerBoundClosed
    (And.intro E.upperBoundClosed
      (And.intro E.hashinShtrikmanBoundClosed
        (And.intro E.voigtReussBoundClosed E.boundaryConditionsClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse