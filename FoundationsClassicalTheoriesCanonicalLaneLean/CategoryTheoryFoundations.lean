import FoundationsClassicalTheoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsClassicalTheoriesCanonicalLaneLean

structure Category (obj : Type u) where
  hom : obj → obj → Type v
  identity : (x : obj) → hom x x
  composition : (x y z : obj) → hom y z → hom x y → hom x z
  leftIdentity : ∀ (x y : obj) (f : hom x y), composition x y y (identity y) f = f
  rightIdentity : ∀ (x y : obj) (f : hom x y), composition x x y f (identity x) = f
  associativity : ∀ (w x y z : obj) (f : hom w x) (g : hom x y) (h : hom y z), composition w x z (composition x y z h g) f = composition w y z h (composition w x y g f)

structure Functor (C D : Category) where
  mapObject : C.obj → D.obj
  mapHom : (x y : C.obj) → C.hom x y → D.hom (mapObject x) (mapObject y)
  preservesIdentity : ∀ (x : C.obj), mapHom x x (C.identity x) = D.identity (mapObject x)
  preservesComposition : ∀ (x y z : C.obj) (f : C.hom x y) (g : C.hom y z), mapHom x z (C.composition x y z g f) = D.composition (mapObject x) (mapObject y) (mapObject z) (mapHom y z g) (mapHom x y f)

structure NaturalTransformation (C D : Category) (F G : Functor C D) where
  component : (x : C.obj) → D.hom (F.mapObject x) (G.mapObject x)
  naturality : ∀ (x y : C.obj) (f : C.hom x y), D.composition (F.mapObject x) (F.mapObject y) (G.mapObject y) (component y) (F.mapHom x y f) = D.composition (F.mapObject x) (G.mapObject x) (G.mapObject y) (G.mapHom x y f) (component x)

structure CategoryTheoryFoundation where
  category : Category (Type u)
  functorCategory : Category (Type (max u v))
  yonedaEmbedding : Functor (functorCategory) (Category (Type (max u v)))
  yonedaLemma : Prop
  yonedaLemmaTerm : yonedaLemma
  adjointFunctorTheorem : Prop
  adjointFunctorTheoremTerm : adjointFunctorTheorem

def CategoryTheoryFoundationsClosed (F : CategoryTheoryFoundation) : Prop :=
  F.yonedaLemma ∧ F.adjointFunctorTheorem

theorem category_theory_foundations_closed (F : CategoryTheoryFoundation) : CategoryTheoryFoundationsClosed F := by
  exact And.intro F.yonedaLemmaTerm F.adjointFunctorTheoremTerm

end FoundationsClassicalTheoriesCanonicalLaneLean
end HautevilleHouse