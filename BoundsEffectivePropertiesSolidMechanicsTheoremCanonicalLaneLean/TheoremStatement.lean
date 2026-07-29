import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure BoundsEffectivePropertiesSolidMechanicsTheoremAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  boundsEffectiveProperties : Prop
  solidMechanics : Prop
  conclusion : boundsEffectiveProperties ∧ solidMechanics

def BoundsEffectivePropertiesSolidMechanicsTheoremWitnessClosed (O : BoundsEffectivePropertiesSolidMechanicsTheoremAdmittedObject) : Prop :=
  O.boundsEffectiveProperties ∧ O.solidMechanics

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse