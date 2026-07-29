import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure VoigtReussBoundsPackage where
  constituentModuli : List ℝ
  volumeFractions : List ℝ
  voigtEstimate : ℝ
  reussEstimate : ℝ
  boundsValid : Prop

def VoigtReussBoundsClosed (V : VoigtReussBoundsPackage) : Prop :=
  V.boundsValid

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse