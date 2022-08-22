open Types
type input = SubscribeInput.t
type output = SubscribeResponse.t
type error = Errors_internal.t
include
  Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error