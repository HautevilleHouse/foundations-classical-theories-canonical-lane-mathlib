import FoundationsClassicalTheoriesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure AdmissibleClass where
  object : ClassicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClassicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse