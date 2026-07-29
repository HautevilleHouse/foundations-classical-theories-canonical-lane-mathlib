import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure PrimitiveRecursiveFunctions where
  zero : Nat → Nat
  successor : Nat → Nat
  projection : (i : Nat) → Nat → Nat
  composition : (f : Nat → Nat) → (g : Nat → Nat) → Nat → Nat
  primitiveRecursion : (g : Nat → Nat) → (h : Nat → Nat → Nat → Nat) → Nat → Nat
  axiomsSatisfied : Prop
  axiomsSatisfiedTerm : axiomsSatisfied

structure Representability (PRF : PrimitiveRecursiveFunctions) where
  language : FirstOrderLanguage
  representation : (f : Nat → Nat) → formula : language.sentences → Prop
  representableIfPrimitiveRecursive : ∀ (f : PrimitiveRecursiveFunction), ∃ φ, representation f φ
  representationTerm : representableIfPrimitiveRecursive

structure GodelIncompletenessPackage (PRF : PrimitiveRecursiveFunctions) where
  theory : FirstOrderTheory (Representability PRF).language
  omegaConsistent : Prop
  omegaConsistencyEvidence : omegaConsistent
  undecidableSentence : (Representability PRF).language.sentences
  notProvable : ¬ (theory.axiomSet.contains undecidableSentence)
  notRefutable : ¬ (theory.axiomSet.contains (negation undecidableSentence))
  incompletenessConclusion : notProvable ∧ notRefutable

structure GodelIncompletenessEvidence (G : GodelIncompletenessPackage) where
  omegaConsistencyClosed : G.omegaConsistent
  incompletenessConclusionClosed : G.incompletenessConclusion

def GodelIncompletenessClosed (G : GodelIncompletenessPackage) : Prop :=
  G.omegaConsistent ∧ G.incompletenessConclusion

theorem godel_incompleteness_closed_from_evidence
    (G : GodelIncompletenessPackage) (E : GodelIncompletenessEvidence G) :
    GodelIncompletenessClosed G := by
  exact And.intro E.omegaConsistencyClosed E.incompletenessConclusionClosed

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse