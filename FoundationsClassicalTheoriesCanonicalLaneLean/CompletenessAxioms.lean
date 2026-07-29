import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure CompletenessAxiomsPackage where
  everyBoundedAboveSetHasSupremum : Prop
  archimedeanProperty : Prop
  cauchyComplete : Prop
  dedekindCutProperty : Prop

structure CompletenessAxiomsEvidence (C : CompletenessAxiomsPackage) where
  everyBoundedAboveSetHasSupremumClosed : C.everyBoundedAboveSetHasSupremum
  archimedeanPropertyClosed : C.archimedeanProperty
  cauchyCompleteClosed : C.cauchyComplete
  dedekindCutPropertyClosed : C.dedekindCutProperty

def CompletenessAxiomsClosed (C : CompletenessAxiomsPackage) : Prop :=
  C.everyBoundedAboveSetHasSupremum ∧ C.archimedeanProperty ∧
  C.cauchyComplete ∧ C.dedekindCutProperty

theorem completeness_axioms_closed_from_evidence (C : CompletenessAxiomsPackage)
    (E : CompletenessAxiomsEvidence C) : CompletenessAxiomsClosed C := by
  exact And.intro E.everyBoundedAboveSetHasSupremumClosed
    (And.intro E.archimedeanPropertyClosed
      (And.intro E.cauchyCompleteClosed E.dedekindCutPropertyClosed))

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse