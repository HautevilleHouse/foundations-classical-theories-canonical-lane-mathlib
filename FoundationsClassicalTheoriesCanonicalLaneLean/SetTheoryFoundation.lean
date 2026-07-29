import FoundationsClassicalTheoriesCanonicalLaneLean.Basic

/-!
# Set Theory Foundation Package
-/

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure SetTheoryPackage where
  zfAxioms : Prop
  choicePrinciple : Prop
  consistencyRelative : Prop
  largeCardinalHierarchy : Prop

structure SetTheoryEvidence (S : SetTheoryPackage) where
  zfAxiomsClosed : S.zfAxioms
  choicePrincipleClosed : S.choicePrinciple
  consistencyRelativeClosed : S.consistencyRelative
  largeCardinalHierarchyClosed : S.largeCardinalHierarchy

def SetTheoryClosed (S : SetTheoryPackage) : Prop :=
  S.zfAxioms ∧ S.choicePrinciple ∧ S.consistencyRelative ∧ S.largeCardinalHierarchy

theorem set_theory_closed_from_evidence (S : SetTheoryPackage) (E : SetTheoryEvidence S) : SetTheoryClosed S := by
  exact And.intro E.zfAxiomsClosed (And.intro E.choicePrincipleClosed (And.intro E.consistencyRelativeClosed E.largeCardinalHierarchyClosed))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse
