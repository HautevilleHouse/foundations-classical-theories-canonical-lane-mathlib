import FoundationsClassicalTheoriesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ClassicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ClassicalAdmittedObject where
  space : ClassicalSpace
  firstOrderTheory : Prop
  complete : Prop
  decidableModel : Prop
  conclusion : decidableModel

structure ClassicalEndgameState where
  object : ClassicalAdmittedObject

def ClassicalWitnessClosed (O : ClassicalAdmittedObject) : Prop :=
  O.decidableModel

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse