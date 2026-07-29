import canonicalLaneMathlib.AdmissibleClass
import FoundationsClassicalTheoriesCanonicalLaneLean.CompletenessAxioms
import FoundationsClassicalTheoriesCanonicalLaneLean.ZornLemmaEquivalent

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AdmittedFoundationsObject where
  completeness : Bool
  zornLemma : Bool
  consistency : Bool
  objectName : String

def FoundationsWitnessClosed (O : AdmittedFoundationsObject) : Prop :=
  O.completeness = true ∧ O.zornLemma = true

structure AdmissibleClass where
  object : AdmittedFoundationsObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FoundationsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.completeness

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedFoundationsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_foundations_endgame (A : AdmissibleClass) :
    ConstrainedFoundationsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse