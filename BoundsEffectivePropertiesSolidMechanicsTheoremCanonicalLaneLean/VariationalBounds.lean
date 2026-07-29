import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure VariationalBoundsPackage where
  energyFunctional : Type u
  trialFields : Type v
  minVariationalStatement : Prop
  maxVariationalStatement : Prop
  gapClosedUnderAdmissibility : Prop

structure VariationalBoundsEvidence (V : VariationalBoundsPackage) where
  energyFunctionalClosed : V.energyFunctional
  trialFieldsClosed : V.trialFields
  minVariationalClosed : V.minVariationalStatement
  maxVariationalClosed : V.maxVariationalStatement
  gapClosedUnderAdmissibilityClosed : V.gapClosedUnderAdmissibility

def VariationalBoundsClosed (V : VariationalBoundsPackage) : Prop :=
  V.energyFunctional ∧ V.trialFields ∧
  V.minVariationalStatement ∧ V.maxVariationalStatement ∧
  V.gapClosedUnderAdmissibility

theorem variational_bounds_closed_from_evidence
    (V : VariationalBoundsPackage) (E : VariationalBoundsEvidence V) :
    VariationalBoundsClosed V := by
  exact And.intro E.energyFunctionalClosed
    (And.intro E.trialFieldsClosed
      (And.intro E.minVariationalClosed
        (And.intro E.maxVariationalClosed E.gapClosedUnderAdmissibilityClosed)))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse