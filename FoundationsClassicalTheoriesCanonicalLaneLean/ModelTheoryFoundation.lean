import FoundationsClassicalTheoriesCanonicalLaneLean.SetTheoryFoundation

/-!
# Model Theory Foundation Package
-/

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ModelTheoryPackage {S : SetTheoryPackage} where
  firstOrderLogic : Prop
  completenessTheorem : Prop
  compactnessTheorem : Prop
  lowenheimSkolem : Prop
  categoricalTheories : Prop

structure ModelTheoryEvidence {S : SetTheoryPackage} (M : ModelTheoryPackage S) where
  firstOrderLogicClosed : M.firstOrderLogic
  completenessTheoremClosed : M.completenessTheorem
  compactnessTheoremClosed : M.compactnessTheorem
  lowenheimSkolemClosed : M.lowenheimSkolem
  categoricalTheoriesClosed : M.categoricalTheories

def ModelTheoryClosed {S : SetTheoryPackage} (M : ModelTheoryPackage S) : Prop :=
  M.firstOrderLogic ∧ M.completenessTheorem ∧ M.compactnessTheorem ∧ M.lowenheimSkolem ∧ M.categoricalTheories

theorem model_theory_closed_from_evidence {S : SetTheoryPackage} (M : ModelTheoryPackage S) (E : ModelTheoryEvidence M) : ModelTheoryClosed M := by
  exact And.intro E.firstOrderLogicClosed (And.intro E.completenessTheoremClosed (And.intro E.compactnessTheoremClosed (And.intro E.lowenheimSkolemClosed E.categoricalTheoriesClosed)))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse
