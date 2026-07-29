import BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean.HashinShtrikmanBounds

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean

structure SpectralStochasticMethodsPackage {P : BoundsEffectivePropertiesPackage}
    {E : BoundsEffectivePropertiesEvidence P} {V : VariationalAsymptoticsPackage E}
    {VE : VariationalAsymptoticsEvidence V} {HS : HashinShtrikmanBoundsPackage VE}
    (HSE : HashinShtrikmanBoundsEvidence HS) where
  randomFieldModeled : Prop
  karhunenLoeveExpansion : Prop
  polynomialChaosRepresentation : Prop
  spectralConvergence : Prop
  probabilityDistributionCaptured : Prop
  boundsUnderStochasticUncertainty : Prop

structure SpectralStochasticMethodsEvidence {P : BoundsEffectivePropertiesPackage}
    {E : BoundsEffectivePropertiesEvidence P} {V : VariationalAsymptoticsPackage E}
    {VE : VariationalAsymptoticsEvidence V} {HS : HashinShtrikmanBoundsPackage VE}
    {HSE : HashinShtrikmanBoundsEvidence HS} (SS : SpectralStochasticMethodsPackage HSE) where
  randomFieldModeledClosed : SS.randomFieldModeled
  karhunenLoeveExpansionClosed : SS.karhunenLoeveExpansion
  polynomialChaosRepresentationClosed : SS.polynomialChaosRepresentation
  spectralConvergenceClosed : SS.spectralConvergence
  probabilityDistributionCapturedClosed : SS.probabilityDistributionCaptured
  boundsUnderStochasticUncertaintyClosed : SS.boundsUnderStochasticUncertainty

def SpectralStochasticMethodsClosed {P : BoundsEffectivePropertiesPackage}
    {E : BoundsEffectivePropertiesEvidence P} {V : VariationalAsymptoticsPackage E}
    {VE : VariationalAsymptoticsEvidence V} {HS : HashinShtrikmanBoundsPackage VE}
    {HSE : HashinShtrikmanBoundsEvidence HS} (SS : SpectralStochasticMethodsPackage HSE) : Prop :=
  SS.randomFieldModeled ∧ SS.karhunenLoeveExpansion ∧
  SS.polynomialChaosRepresentation ∧ SS.spectralConvergence ∧
  SS.probabilityDistributionCaptured ∧ SS.boundsUnderStochasticUncertainty

theorem spectral_stochastic_methods_closed_from_evidence
    {P : BoundsEffectivePropertiesPackage} {E : BoundsEffectivePropertiesEvidence P}
    {V : VariationalAsymptoticsPackage E} {VE : VariationalAsymptoticsEvidence V}
    {HS : HashinShtrikmanBoundsPackage VE} {HSE : HashinShtrikmanBoundsEvidence HS}
    (SS : SpectralStochasticMethodsPackage HSE) (SSE : SpectralStochasticMethodsEvidence SS) :
    SpectralStochasticMethodsClosed SS := by
  exact And.intro SSE.randomFieldModeledClosed
    (And.intro SSE.karhunenLoeveExpansionClosed
      (And.intro SSE.polynomialChaosRepresentationClosed
        (And.intro SSE.spectralConvergenceClosed
          (And.intro SSE.probabilityDistributionCapturedClosed SSE.boundsUnderStochasticUncertaintyClosed))))

end BoundsEffectivePropertiesSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse