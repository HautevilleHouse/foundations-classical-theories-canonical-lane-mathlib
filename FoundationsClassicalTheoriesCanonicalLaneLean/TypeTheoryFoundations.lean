import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure SimpleTypeTheory where
  baseTypes : List (Type u)
  arrowType : Type u → Type u → Type u
  productType : Type u → Type u → Type u
  axiomsWellFormed : Prop
  axiomsWellFormedTerm : axiomsWellFormed

structure DependentTypeTheory extends SimpleTypeTheory where
  dependentProduct : (A : Type u) → (A → Type u) → Type u
  dependentSum : (A : Type u) → (A → Type u) → Type u
  axiomsDependentWellFormed : Prop
  axiomsDependentWellFormedTerm : axiomsDependentWellFormed

structure TypeTheoryMeta (T : DependentTypeTheory) where
  propositionAsTypes : Prop
  proofIrrelevance : Prop
  functionExtensionality : Prop
  propositionAsTypesTerm : propositionAsTypes
  proofIrrelevanceTerm : proofIrrelevance
  functionExtensionalityTerm : functionExtensionality

structure TypeTheoryFoundationsPackage (T : DependentTypeTheory) where
  meta : TypeTheoryMeta T
  consistencyProof : Prop
  consistencyProofEvidence : consistencyProof

def TypeTheoryFoundationsClosed {T : DependentTypeTheory} (P : TypeTheoryFoundationsPackage T) : Prop :=
  P.meta.propositionAsTypes ∧ P.meta.proofIrrelevance ∧ P.meta.functionExtensionality ∧ P.consistencyProof

theorem type_theory_foundations_closed {T : DependentTypeTheory} (P : TypeTheoryFoundationsPackage T) : TypeTheoryFoundationsClosed P := by
  exact And.intro P.meta.propositionAsTypesTerm
    (And.intro P.meta.proofIrrelevanceTerm
      (And.intro P.meta.functionExtensionalityTerm P.consistencyProofEvidence))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse