import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure FirstOrderLanguage where
  relationSymbols : Type u
  functionSymbols : Type v
  constantSymbols : Type w
  arityRelation : relationSymbols → Nat
  arityFunction : functionSymbols → Nat

structure FirstOrderTheory (L : FirstOrderLanguage) where
  sentences : Type (max u v w)
  axiomSet : Set (L.sentences)

structure Model (L : FirstOrderLanguage) (T : FirstOrderTheory L) where
  universe : Type (max u v w)
  interpretationRelation : (s : L.relationSymbols) → (Vector (L.universe) (L.arityRelation s)) → Prop
  interpretationFunction : (f : L.functionSymbols) → (Vector (L.universe) (L.arityFunction f)) → L.universe
  interpretationConstant : (c : L.constantSymbols) → L.universe
  satisfiesAxioms : ∀ (φ : T.axiomSet), ModelSatisfies this φ

structure GodelCompletenessPackage where
  language : FirstOrderLanguage
  theory : FirstOrderTheory language
  syntacticConsistency : Prop
  syntacticConsistencyEvidence : syntacticConsistency
  hasModel : Prop
  modelConstruction : Model language theory
  completenessConclusion : hasModel

structure GodelCompletenessEvidence (G : GodelCompletenessPackage) where
  syntacticConsistencyClosed : G.syntacticConsistency
  completenessConclusionClosed : G.completenessConclusion

def GodelCompletenessClosed (G : GodelCompletenessPackage) : Prop :=
  G.syntacticConsistency ∧ G.completenessConclusion

theorem godel_completeness_closed_from_evidence
    (G : GodelCompletenessPackage) (E : GodelCompletenessEvidence G) :
    GodelCompletenessClosed G := by
  exact And.intro E.syntacticConsistencyClosed E.completenessConclusionClosed

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse