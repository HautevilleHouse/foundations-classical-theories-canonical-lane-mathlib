import FoundationsClassicalTheoriesCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "foundations-classical-theories-canonical-lane",
  theoremName := "foundations-classical-theories-canonical-lane",
  theoremObject := "Foundations Classical Theories",
  classicalBoundary := "classical boundary: complete first-order theory with decidable model",
  manifoldConstrainedStatement := "decidable model via canonical lane bridge",
  certificateLane := "manifold_constrained",
  carriedRemainder := "classical source boundary carried by formalization"
}

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse