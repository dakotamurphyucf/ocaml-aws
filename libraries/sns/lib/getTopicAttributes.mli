open Types
type input = GetTopicAttributesInput.t
type output = GetTopicAttributesResponse.t
type error = Errors_internal.t
include
  Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error