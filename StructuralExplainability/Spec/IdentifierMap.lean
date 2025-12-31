namespace StructuralExplainability.Spec

abbrev ReqId := String

/-! Requirement entry structure. -/
structure Entry where
  id : ReqId
  description : String
  leanModule : String
  leanDecl : String
  deriving Repr, BEq, DecidableEq

namespace Req

def SE_CONFORMANCE_CORE : ReqId := "SE.CONFORMANCE.CORE"
def SE_NEUTRALITY_PRECAUSAL : ReqId := "SE.NEUTRALITY.PRECAUSAL"
def SE_NEUTRALITY_PRENORMATIVE : ReqId := "SE.NEUTRALITY.PRENORMATIVE"
def SE_NEUTRALITY_EXTENSION_STABILITY : ReqId := "SE.NEUTRALITY.EXTENSION.STABILITY"
def SE_SCOPE_EXCLUSIONS : ReqId := "SE.SCOPE.EXCLUSIONS"

end Req

def entries : List Entry :=
  [
    { id := Req.SE_CONFORMANCE_CORE
      description := "SE provides core conformance machinery used by downstream specs."
      leanModule := "StructuralExplainability.Core.ConformanceKernel"
      leanDecl := "ConformanceKernel" },

    { id := Req.SE_NEUTRALITY_EXTENSION_STABILITY
      description := "Neutral substrates must be stable under incompatible extensions."
      leanModule := "StructuralExplainability.Core.Neutrality"
      leanDecl := "ExtensionStability" },

    { id := Req.SE_NEUTRALITY_PRECAUSAL
      description := "Neutral substrates are pre-causal at the foundational layer."
      leanModule := "StructuralExplainability.Core.Neutrality"
      leanDecl := "PreCausal" },

    { id := Req.SE_NEUTRALITY_PRENORMATIVE
      description := "Neutral substrates are pre-normative at the foundational layer."
      leanModule := "StructuralExplainability.Core.Neutrality"
      leanDecl := "PreNormative" },

    { id := Req.SE_SCOPE_EXCLUSIONS
      description := "SE excludes causal, epistemic, or normative conclusions as ontological facts."
      leanModule := "StructuralExplainability.Core.Neutrality"
      leanDecl := "ScopeExclusions" }
  ]

/-! Lookup a requirement entry by its identifier. -/
def lookup (rid : ReqId) : Option Entry :=
  entries.find? (fun e => e.id = rid)

end StructuralExplainability.Spec
