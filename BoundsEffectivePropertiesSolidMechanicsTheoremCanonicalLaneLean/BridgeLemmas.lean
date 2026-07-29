import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SolidMechanicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
