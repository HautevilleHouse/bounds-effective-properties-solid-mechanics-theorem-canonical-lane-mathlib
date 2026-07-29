import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure BoundsEffectivePropertiesPackage where
  microstructureGeometry : Prop
  homogenizedStiffness : Prop
  strainEnergyBounds : Prop
  stressConcentrationBounds : Prop
  effectiveElasticModuli : Type u
  boundsSatisfied : Prop

structure BoundsEffectivePropertiesEvidence (P : BoundsEffectivePropertiesPackage) where
  microstructureGeometryClosed : P.microstructureGeometry
  homogenizedStiffnessClosed : P.homogenizedStiffness
  strainEnergyBoundsClosed : P.strainEnergyBounds
  stressConcentrationBoundsClosed : P.stressConcentrationBounds
  effectiveElasticModuliDerived : P.effectiveElasticModuli
  boundsSatisfiedClosed : P.boundsSatisfied

def BoundsEffectivePropertiesClosed (P : BoundsEffectivePropertiesPackage) : Prop :=
  P.microstructureGeometry ∧ P.homogenizedStiffness ∧
  P.strainEnergyBounds ∧ P.stressConcentrationBounds ∧ P.boundsSatisfied

theorem bounds_effective_properties_closed_from_evidence
    (P : BoundsEffectivePropertiesPackage) (E : BoundsEffectivePropertiesEvidence P) :
    BoundsEffectivePropertiesClosed P := by
  exact And.intro E.microstructureGeometryClosed
    (And.intro E.homogenizedStiffnessClosed
      (And.intro E.strainEnergyBoundsClosed
        (And.intro E.stressConcentrationBoundsClosed E.boundsSatisfiedClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse