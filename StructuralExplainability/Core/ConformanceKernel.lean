namespace StructuralExplainability.Core

/-!
Generic conformance kernel: common definitions.
Structural only; carries no domain semantics.
-/

def AndList : List Prop -> Prop
| [] => True
| p :: ps => p ∧ AndList ps

/-! Helper theorem: from conjunction of list, get member proposition. -/
theorem andList_of_mem {ps : List Prop} {p : Prop} :
    p ∈ ps -> AndList ps -> p := by
  intro hmem hand
  induction ps with
  | nil =>
      cases hmem
  | cons a as ih =>
      have hand' : a ∧ AndList as := by
        simpa [AndList] using hand
      have ha : a := hand'.1
      have hrest : AndList as := hand'.2
      have hmem' : p = a ∨ p ∈ as := by
        simpa using hmem
      cases hmem' with
      | inl hpa =>
          subst hpa
          exact ha
      | inr htail =>
          exact ih htail hrest

end StructuralExplainability.Core
