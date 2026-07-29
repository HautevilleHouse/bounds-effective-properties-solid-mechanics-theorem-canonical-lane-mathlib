import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : SolidMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SolidMechanicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
