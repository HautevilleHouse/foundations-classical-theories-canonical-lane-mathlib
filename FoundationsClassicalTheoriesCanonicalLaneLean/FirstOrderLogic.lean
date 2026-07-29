import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure FirstOrderLogicPackage where
  signature : Type u
  formulaSyntax : Type v
  proofSystem : Type w
  soundness : Prop
  completeness : Prop
  soundnessTerm : soundness
  completenessTerm : completeness

structure FirstOrderLogicEvidence (L : FirstOrderLogicPackage) where
  soundnessClosed : L.soundness
  completenessClosed : L.completeness

def FirstOrderLogicClosed (L : FirstOrderLogicPackage) : Prop :=
  L.soundness ∧ L.completeness

theorem first_order_logic_closed_from_evidence
    (L : FirstOrderLogicPackage) (E : FirstOrderLogicEvidence L) :
    FirstOrderLogicClosed L := by
  exact And.intro E.soundnessClosed E.completenessClosed

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse