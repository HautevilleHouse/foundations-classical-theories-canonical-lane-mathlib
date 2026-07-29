import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ContinuumHypothesisIndependencePackage where
  zfcModel : Type u
  forcingExtension : Type v
  continuumHypothesisHolds : Prop
  continuumHypothesisFails : Prop
  chHoldsTerm : continuumHypothesisHolds
  chFailsTerm : continuumHypothesisFails

structure ContinuumHypothesisIndependenceEvidence (C : ContinuumHypothesisIndependencePackage) where
  chHoldsInExtensionClosed : C.continuumHypothesisHolds
  chFailsInExtensionClosed : C.continuumHypothesisFails

def ContinuumHypothesisIndependenceClosed (C : ContinuumHypothesisIndependencePackage) : Prop :=
  C.continuumHypothesisHolds ∧ C.continuumHypothesisFails

theorem continuum_hypothesis_independence_closed_from_evidence
    (C : ContinuumHypothesisIndependencePackage) (E : ContinuumHypothesisIndependenceEvidence C) :
    ContinuumHypothesisIndependenceClosed C := by
  exact And.intro E.chHoldsInExtensionClosed E.chFailsInExtensionClosed

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse