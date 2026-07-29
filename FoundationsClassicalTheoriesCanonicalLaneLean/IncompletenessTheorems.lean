import FoundationsClassicalTheoriesCanonicalLaneLean.ZermeloFraenkelAxioms

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure IncompletenessPackage {Z : ZermeloFraenkelPackage}
    (G : GödelNumberingPackage Z) where
  firstIncompleteness : Prop
  secondIncompleteness : Prop
  consistencyStatementFormalized : Prop
  rossersStrengthening : Prop
  firstIncompletenessClosed : firstIncompleteness
  secondIncompletenessClosed : secondIncompleteness
  consistencyStatementFormalizedClosed : consistencyStatementFormalized
  rossersStrengtheningClosed : rossersStrengthening

structure IncompletenessEvidence {Z : ZermeloFraenkelPackage}
    {G : GödelNumberingPackage Z} (I : IncompletenessPackage G) where
  firstIncompletenessClosed : I.firstIncompleteness
  secondIncompletenessClosed : I.secondIncompleteness
  consistencyStatementFormalizedClosed : I.consistencyStatementFormalized
  rossersStrengtheningClosed : I.rossersStrengthening

def IncompletenessClosed {Z : ZermeloFraenkelPackage}
    {G : GödelNumberingPackage Z} (I : IncompletenessPackage G) : Prop :=
  I.firstIncompleteness ∧ I.secondIncompleteness ∧
  I.consistencyStatementFormalized ∧ I.rossersStrengthening

theorem incompleteness_closed_from_evidence
    {Z : ZermeloFraenkelPackage} {G : GödelNumberingPackage Z}
    (I : IncompletenessPackage G) (E : IncompletenessEvidence I) :
    IncompletenessClosed I := by
  exact And.intro E.firstIncompletenessClosed
    (And.intro E.secondIncompletenessClosed
      (And.intro E.consistencyStatementFormalizedClosed
        E.rossersStrengtheningClosed))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse