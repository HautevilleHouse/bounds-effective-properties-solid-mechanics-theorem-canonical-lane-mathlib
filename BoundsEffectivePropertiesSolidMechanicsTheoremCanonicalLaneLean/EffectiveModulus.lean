import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectiveModulusPackage where
  microstructure : Type u
  phaseProperties : Type v
  volumeFraction : ℝ
  inclusionShape : String
  effectiveBulkModulus : ℝ
  effectiveShearModulus : ℝ
  admissible : Prop

def EffectiveModulusClosed (E : EffectiveModulusPackage) : Prop :=
  E.admissible

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse