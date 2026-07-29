import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ZFCAxioms where
  extensionality : Prop
  foundation : Prop
  separation : Prop
  pairing : Prop
  union : Prop
  powerset : Prop
  infinity : Prop
  replacement : Prop
  choice : Prop
  extensionalityTerm : extensionality
  foundationTerm : foundation
  separationTerm : separation
  pairingTerm : pairing
  unionTerm : union
  powersetTerm : powerset
  infinityTerm : infinity
  replacementTerm : replacement
  choiceTerm : choice

structure ZFCAxiomsEvidence (Z : ZFCAxioms) where
  extensionalityClosed : Z.extensionality
  foundationClosed : Z.foundation
  separationClosed : Z.separation
  pairingClosed : Z.pairing
  unionClosed : Z.union
  powersetClosed : Z.powerset
  infinityClosed : Z.infinity
  replacementClosed : Z.replacement
  choiceClosed : Z.choice

def ZFCAxiomsClosed (Z : ZFCAxioms) : Prop :=
  Z.extensionality ∧ Z.foundation ∧ Z.separation ∧ Z.pairing ∧ Z.union ∧
  Z.powerset ∧ Z.infinity ∧ Z.replacement ∧ Z.choice

theorem zfc_axioms_closed_from_evidence (Z : ZFCAxioms) (E : ZFCAxiomsEvidence Z) : ZFCAxiomsClosed Z := by
  exact And.intro E.extensionalityClosed
    (And.intro E.foundationClosed
      (And.intro E.separationClosed
        (And.intro E.pairingClosed
          (And.intro E.unionClosed
            (And.intro E.powersetClosed
              (And.intro E.infinityClosed
                (And.intro E.replacementClosed E.choiceClosed)))))))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse