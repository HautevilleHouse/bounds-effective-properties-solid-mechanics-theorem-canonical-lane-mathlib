import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.EffectiveBoundsPackage

/-!
# Variational Principles Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure VariationalPrinciplesPackage {E : EffectiveBoundsPackage}
    where
  energyFunctional : Prop
  stationarityCondition : Prop
  convexDuality : Prop
  extremumPrinciple : Prop
  saddlePointTheorem : Prop

structure VariationalPrinciplesEvidence {E : EffectiveBoundsPackage}
    (V : VariationalPrinciplesPackage) where
  energyFunctionalClosed : V.energyFunctional
  stationarityConditionClosed : V.stationarityCondition
  convexDualityClosed : V.convexDuality
  extremumPrincipleClosed : V.extremumPrinciple
  saddlePointTheoremClosed : V.saddlePointTheorem

def VariationalPrinciplesClosed {E : EffectiveBoundsPackage}
    (V : VariationalPrinciplesPackage) : Prop :=
  V.energyFunctional ∧ V.stationarityCondition ∧
  V.convexDuality ∧ V.extremumPrinciple ∧ V.saddlePointTheorem

theorem variational_principles_closed_from_evidence
    {E : EffectiveBoundsPackage} (V : VariationalPrinciplesPackage)
    (Ev : VariationalPrinciplesEvidence V) : VariationalPrinciplesClosed V := by
  exact And.intro Ev.energyFunctionalClosed
    (And.intro Ev.stationarityConditionClosed
      (And.intro Ev.convexDualityClosed
        (And.intro Ev.extremumPrincipleClosed Ev.saddlePointTheoremClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
