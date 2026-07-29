import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Effective Properties Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectivePropertiesPackage where
  materialPhase : Type u
  stiffnessTensor : Type v
  compositeStiffness : Type w
  volumeFraction : Prop
  isotropyAssumed : Prop
  boundsDerived : Prop

structure EffectivePropertiesEvidence (P : EffectivePropertiesPackage) where
  volumeFractionClosed : P.volumeFraction
  isotropyAssumedClosed : P.isotropyAssumed
  boundsDerivedClosed : P.boundsDerived

def EffectivePropertiesClosed (P : EffectivePropertiesPackage) : Prop :=
  P.volumeFraction ∧ P.isotropyAssumed ∧ P.boundsDerived

theorem effective_properties_closed_from_evidence (P : EffectivePropertiesPackage)
    (E : EffectivePropertiesEvidence P) : EffectivePropertiesClosed P := by
  exact And.intro E.volumeFractionClosed
    (And.intro E.isotropyAssumedClosed E.boundsDerivedClosed)

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
