import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.EffectivePropertiesPackage

/-!
# Variational Bounds Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure VariationalBoundsPackage {P : EffectivePropertiesPackage} where
  hashinShtrikmanBound : Prop
  voigtReussBound : Prop
  selfConsistentEstimate : Prop
  boundHierarchyEstablished : Prop

structure VariationalBoundsEvidence {P : EffectivePropertiesPackage}
    (V : VariationalBoundsPackage P) where
  hashinShtrikmanBoundClosed : V.hashinShtrikmanBound
  voigtReussBoundClosed : V.voigtReussBound
  selfConsistentEstimateClosed : V.selfConsistentEstimate
  boundHierarchyEstablishedClosed : V.boundHierarchyEstablished

def VariationalBoundsClosed {P : EffectivePropertiesPackage}
    (V : VariationalBoundsPackage P) : Prop :=
  V.hashinShtrikmanBound ∧ V.voigtReussBound ∧
  V.selfConsistentEstimate ∧ V.boundHierarchyEstablished

theorem variational_bounds_closed_from_evidence {P : EffectivePropertiesPackage}
    (V : VariationalBoundsPackage P) (E : VariationalBoundsEvidence V) :
    VariationalBoundsClosed V := by
  exact And.intro E.hashinShtrikmanBoundClosed
    (And.intro E.voigtReussBoundClosed
      (And.intro E.selfConsistentEstimateClosed E.boundHierarchyEstablishedClosed))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
