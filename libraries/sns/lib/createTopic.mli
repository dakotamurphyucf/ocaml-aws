open Types
type input = CreateTopicInput.t
type output = CreateTopicResponse.t
type error = Errors_internal.t
include
  Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error