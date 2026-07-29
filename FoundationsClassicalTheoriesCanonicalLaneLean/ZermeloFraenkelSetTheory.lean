import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ZermeloFraenkelSetTheoryPackage where
  extensionalityAxiom : Prop
  emptySetAxiom : Prop
  pairingAxiom : Prop
  unionAxiom : Prop
  powerSetAxiom : Prop
  infinityAxiom : Prop
  replacementSchema : Prop
  foundationAxiom : Prop

structure ZermeloFraenkelSetTheoryEvidence (P : ZermeloFraenkelSetTheoryPackage) where
  extensionalityAxiomClosed : P.extensionalityAxiom
  emptySetAxiomClosed : P.emptySetAxiom
  pairingAxiomClosed : P.pairingAxiom
  unionAxiomClosed : P.unionAxiom
  powerSetAxiomClosed : P.powerSetAxiom
  infinityAxiomClosed : P.infinityAxiom
  replacementSchemaClosed : P.replacementSchema
  foundationAxiomClosed : P.foundationAxiom

def ZermeloFraenkelSetTheoryClosed (P : ZermeloFraenkelSetTheoryPackage) : Prop :=
  P.extensionalityAxiom ∧ P.emptySetAxiom ∧ P.pairingAxiom ∧ P.unionAxiom ∧
  P.powerSetAxiom ∧ P.infinityAxiom ∧ P.replacementSchema ∧ P.foundationAxiom

theorem zermelo_fraenkel_set_theory_closed_from_evidence
    (P : ZermeloFraenkelSetTheoryPackage) (E : ZermeloFraenkelSetTheoryEvidence P) :
    ZermeloFraenkelSetTheoryClosed P := by
  exact And.intro E.extensionalityAxiomClosed
    (And.intro E.emptySetAxiomClosed (And.intro E.pairingAxiomClosed (And.intro E.unionAxiomClosed
      (And.intro E.powerSetAxiomClosed (And.intro E.infinityAxiomClosed (And.intro E.replacementSchemaClosed E.foundationAxiomClosed))))))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse