open Types
type input = ListResourceTagsRequest.t
type output = ListResourceTagsResponse.t
type error = Errors_internal.t
include
  Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error