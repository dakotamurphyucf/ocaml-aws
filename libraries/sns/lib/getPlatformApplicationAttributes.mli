open Types
type input = GetPlatformApplicationAttributesInput.t
type output = GetPlatformApplicationAttributesResponse.t
type error = Errors_internal.t
include
  Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error