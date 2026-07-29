import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.EffectiveBoundsPackage

/-!
# Hashin-Shtrikman Bounds Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure HashinShtrikmanBoundsPackage {E : EffectiveBoundsPackage}
    where
  polarizedMedium : Prop
  optimalMicrostructure : Prop
  extremalComposites : Prop
  bulkShearBounds : Prop
  isotropicEffectiveModuli : Prop

structure HashinShtrikmanBoundsEvidence {E : EffectiveBoundsPackage}
    (H : HashinShtrikmanBoundsPackage) where
  polarizedMediumClosed : H.polarizedMedium
  optimalMicrostructureClosed : H.optimalMicrostructure
  extremalCompositesClosed : H.extremalComposites
  bulkShearBoundsClosed : H.bulkShearBounds
  isotropicEffectiveModuliClosed : H.isotropicEffectiveModuli

def HashinShtrikmanBoundsClosed {E : EffectiveBoundsPackage}
    (H : HashinShtrikmanBoundsPackage) : Prop :=
  H.polarizedMedium ∧ H.optimalMicrostructure ∧
  H.extremalComposites ∧ H.bulkShearBounds ∧ H.isotropicEffectiveModuli

theorem hashin_shtrikman_bounds_closed_from_evidence
    {E : EffectiveBoundsPackage} (H : HashinShtrikmanBoundsPackage)
    (Ev : HashinShtrikmanBoundsEvidence H) : HashinShtrikmanBoundsClosed H := by
  exact And.intro Ev.polarizedMediumClosed
    (And.intro Ev.optimalMicrostructureClosed
      (And.intro Ev.extremalCompositesClosed
        (And.intro Ev.bulkShearBoundsClosed Ev.isotropicEffectiveModuliClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
