import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ZermeloFraenkelPackage where
  extensionality : Prop
  foundation : Prop
  comprehension : Prop
  pairing : Prop
  union : Prop
  powerset : Prop
  infinity : Prop
  replacement : Prop
  choice : Prop
  extensionalityClosed : extensionality
  foundationClosed : foundation
  comprehensionClosed : comprehension
  pairingClosed : pairing
  unionClosed : union
  powersetClosed : powerset
  infinityClosed : infinity
  replacementClosed : replacement
  choiceClosed : choice

structure ZermeloFraenkelEvidence (Z : ZermeloFraenkelPackage) where
  extensionalityClosed : Z.extensionality
  foundationClosed : Z.foundation
  comprehensionClosed : Z.comprehension
  pairingClosed : Z.pairing
  unionClosed : Z.union
  powersetClosed : Z.powerset
  infinityClosed : Z.infinity
  replacementClosed : Z.replacement
  choiceClosed : Z.choice

def ZermeloFraenkelClosed (Z : ZermeloFraenkelPackage) : Prop :=
  Z.extensionality ∧ Z.foundation ∧ Z.comprehension ∧ Z.pairing ∧
  Z.union ∧ Z.powerset ∧ Z.infinity ∧ Z.replacement ∧ Z.choice

theorem zermelo_fraenkel_closed_from_evidence
    (Z : ZermeloFraenkelPackage) (E : ZermeloFraenkelEvidence Z) :
    ZermeloFraenkelClosed Z := by
  exact And.intro E.extensionalityClosed
    (And.intro E.foundationClosed
      (And.intro E.comprehensionClosed
        (And.intro E.pairingClosed
          (And.intro E.unionClosed
            (And.intro E.powersetClosed
              (And.intro E.infinityClosed
                (And.intro E.replacementClosed
                  E.choiceClosed)))))))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse