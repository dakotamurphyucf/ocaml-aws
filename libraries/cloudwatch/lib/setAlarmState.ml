open Types
open Aws
type input = SetAlarmStateInput.t
type output = unit
type error = Errors_internal.t
let service = "monitoring"
let to_http service region req =
  let uri =
    Uri.add_query_params
      (Uri.of_string
         (Aws.Util.of_option_exn (Endpoints.url_of service region)))
      (List.append
         [("Version", ["2010-08-01"]); ("Action", ["SetAlarmState"])]
         (Util.drop_empty
            (Uri.query_of_encoded
               (Query.render (SetAlarmStateInput.to_query req))))) in
  (`POST, uri, [])
let of_http body = `Ok ()
let parse_error code err =
  let errors =
    [Errors_internal.InvalidFormat; Errors_internal.ResourceNotFound] @
      Errors_internal.common in
  match Errors_internal.of_string err with
  | Some var ->
      if
        (List.mem var errors) &&
          ((match Errors_internal.to_http_code var with
            | Some var -> var = code
            | None -> true))
      then Some var
      else None
  | None -> None