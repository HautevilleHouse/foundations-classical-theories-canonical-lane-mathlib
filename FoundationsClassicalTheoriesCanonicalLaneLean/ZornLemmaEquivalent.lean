import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure ZornLemmaPackage where
  everyChainHasUpperBound : Prop
  maximalElementExists : Prop
  axiomOfChoiceEquiv : Prop
  wellOrderingPrincipleEquiv : Prop

structure ZornLemmaEvidence (Z : ZornLemmaPackage) where
  everyChainHasUpperBoundClosed : Z.everyChainHasUpperBound
  maximalElementExistsClosed : Z.maximalElementExists
  axiomOfChoiceEquivClosed : Z.axiomOfChoiceEquiv
  wellOrderingPrincipleEquivClosed : Z.wellOrderingPrincipleEquiv

def ZornLemmaClosed (Z : ZornLemmaPackage) : Prop :=
  Z.everyChainHasUpperBound ∧ Z.maximalElementExists ∧
  Z.axiomOfChoiceEquiv ∧ Z.wellOrderingPrincipleEquiv

theorem zorn_lemma_closed_from_evidence (Z : ZornLemmaPackage)
    (E : ZornLemmaEvidence Z) : ZornLemmaClosed Z := by
  exact And.intro E.everyChainHasUpperBoundClosed
    (And.intro E.maximalElementExistsClosed
      (And.intro E.axiomOfChoiceEquivClosed E.wellOrderingPrincipleEquivClosed))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse