import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.MicrostructureHomogenization

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure ElasticityTensorPackage where
  fourthOrderStiffness : Type u
  fourthOrderCompliance : Type v
  majorSymmetry : Prop
  minorSymmetry : Prop
  positiveDefiniteness : Prop
  majorSymmetryClosed : majorSymmetry
  minorSymmetryClosed : minorSymmetry
  positiveDefinitenessClosed : positiveDefiniteness

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  majorSymmetryClosed : E.majorSymmetry
  minorSymmetryClosed : E.minorSymmetry
  positiveDefinitenessClosed : E.positiveDefiniteness

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.majorSymmetry ∧ E.minorSymmetry ∧ E.positiveDefiniteness

theorem elasticity_tensor_closed_from_evidence
    (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) :
    ElasticityTensorClosed E := by
  exact And.intro Ev.majorSymmetryClosed
    (And.intro Ev.minorSymmetryClosed Ev.positiveDefinitenessClosed)

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
