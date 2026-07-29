import FoundationsClassicalTheoriesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClassicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse