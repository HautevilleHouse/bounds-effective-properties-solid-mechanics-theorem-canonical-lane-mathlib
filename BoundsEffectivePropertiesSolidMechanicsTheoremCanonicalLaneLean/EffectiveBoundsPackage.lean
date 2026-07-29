import canonicalLaneMathlib.AdmissibleClass

/-!
# Effective Bounds for Solid Mechanics Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectiveBoundsPackage where
  constitutiveModel : Type u
  microGeometry : Type v
  appliedLoading : Type w
  effectiveProperty : Type x
  lowerBound : Prop
  upperBound : Prop
  microMacroRelation : Prop

structure EffectiveBoundsEvidence (E : EffectiveBoundsPackage) where
  lowerBoundClosed : E.lowerBound
  upperBoundClosed : E.upperBound
  microMacroRelationClosed : E.microMacroRelation

def EffectiveBoundsClosed (E : EffectiveBoundsPackage) : Prop :=
  E.lowerBound ∧ E.upperBound ∧ E.microMacroRelation

theorem effective_bounds_closed_from_evidence
    (E : EffectiveBoundsPackage) (Ev : EffectiveBoundsEvidence E) :
    EffectiveBoundsClosed E := by
  exact And.intro Ev.lowerBoundClosed
    (And.intro Ev.upperBoundClosed Ev.microMacroRelationClosed)

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
