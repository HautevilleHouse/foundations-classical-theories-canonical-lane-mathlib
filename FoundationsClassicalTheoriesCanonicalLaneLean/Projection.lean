import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def classicalProjection : Projection ClassicalEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem classical_projection_idempotent (x : ClassicalEndgameState) :
    classicalProjection.toFun (classicalProjection.toFun x) = classicalProjection.toFun x := by
  exact classicalProjection.idempotent x

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse