import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure EffectivePropertiesModel where
  microstructureType : Type u
  volumeFraction : Type v
  elasticModuli : Type w
  effectiveStiffness : Type x
  homogenizationScheme : Prop
  boundsComputed : Prop

structure EffectivePropertiesEvidence (M : EffectivePropertiesModel) where
  homogenizationSchemeClosed : M.homogenizationScheme
  boundsComputedClosed : M.boundsComputed

def EffectivePropertiesModelClosed (M : EffectivePropertiesModel) : Prop :=
  M.homogenizationScheme ∧ M.boundsComputed

theorem effective_properties_model_closed_from_evidence
    (M : EffectivePropertiesModel) (E : EffectivePropertiesEvidence M) :
    EffectivePropertiesModelClosed M := by
  exact And.intro E.homogenizationSchemeClosed E.boundsComputedClosed

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse