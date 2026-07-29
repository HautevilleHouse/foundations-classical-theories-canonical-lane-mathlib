import FoundationsClassicalTheoriesCanonicalLaneLean.ModelTheoryFoundation

/-!
# Proof Theory Foundation Package
-/

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ProofTheoryPackage {S : SetTheoryPackage} {M : ModelTheoryPackage S} where
  structuralProofs : Prop
  cutElimination : Prop
  sequentCalculus : Prop
  ordinalAnalysis : Prop
  provabilityLogic : Prop

structure ProofTheoryEvidence {S : SetTheoryPackage} {M : ModelTheoryPackage S} (P : ProofTheoryPackage S M) where
  structuralProofsClosed : P.structuralProofs
  cutEliminationClosed : P.cutElimination
  sequentCalculusClosed : P.sequentCalculus
  ordinalAnalysisClosed : P.ordinalAnalysis
  provabilityLogicClosed : P.provabilityLogic

def ProofTheoryClosed {S : SetTheoryPackage} {M : ModelTheoryPackage S} (P : ProofTheoryPackage S M) : Prop :=
  P.structuralProofs ∧ P.cutElimination ∧ P.sequentCalculus ∧ P.ordinalAnalysis ∧ P.provabilityLogic

theorem proof_theory_closed_from_evidence {S : SetTheoryPackage} {M : ModelTheoryPackage S} (P : ProofTheoryPackage S M) (E : ProofTheoryEvidence P) : ProofTheoryClosed P := by
  exact And.intro E.structuralProofsClosed (And.intro E.cutEliminationClosed (And.intro E.sequentCalculusClosed (And.intro E.ordinalAnalysisClosed E.provabilityLogicClosed)))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse
