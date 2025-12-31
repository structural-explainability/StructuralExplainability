import StructuralExplainability.Spec.IdentifierMap

namespace StructuralExplainability.Spec

/-! Helper function for conjunction of a list of propositions. -/
def AndList : List Prop -> Prop
| [] => True
| p :: ps => p ∧ AndList ps

/-! Conformance evidence structure. -/
structure ConformanceEvidence where
  SE_CONFORMANCE_CORE : Prop
  SE_NEUTRALITY_EXTENSION_STABILITY : Prop
  SE_NEUTRALITY_PRECAUSAL : Prop
  SE_NEUTRALITY_PRENORMATIVE : Prop
  SE_SCOPE_EXCLUSIONS : Prop

/-! List of all conformance requirements. -/
def requirements (e : ConformanceEvidence) : List Prop :=
  [ e.SE_CONFORMANCE_CORE
  , e.SE_NEUTRALITY_EXTENSION_STABILITY
  , e.SE_NEUTRALITY_PRECAUSAL
  , e.SE_NEUTRALITY_PRENORMATIVE
  , e.SE_SCOPE_EXCLUSIONS
  ]

/-! Conformance predicate: all requirements hold. -/
def Conforms (e : ConformanceEvidence) : Prop :=
  AndList (requirements e)

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

/-! From conformance evidence and proof of conformance, get any required proposition. -/
theorem conforms_of_mem (e : ConformanceEvidence) (p : Prop) :
    p ∈ requirements e -> Conforms e -> p := by
  intro hmem hconf
  unfold Conforms at hconf
  exact andList_of_mem (ps := requirements e) (p := p) hmem hconf

end StructuralExplainability.Spec
