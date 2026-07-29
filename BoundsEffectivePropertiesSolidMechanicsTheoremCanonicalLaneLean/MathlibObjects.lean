import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SolidMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidMechanicsAdmittedObject where
  space : SolidMechanicsSpace
  effectivePropertyComputed : Prop
  boundSatisfied : Prop
  conclusion : boundSatisfied

structure SolidMechanicsEndgameState where
  object : SolidMechanicsAdmittedObject

def SolidMechanicsWitnessClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.boundSatisfied

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse