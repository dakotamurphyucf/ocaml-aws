type t =
  | AuthFailure 
  | AuthorizationError 
  | Blocked 
  | DryRunOperation 
  | EndpointDisabled 
  | IdempotentParameterMismatch 
  | IncompleteSignature 
  | InternalError 
  | InternalFailure 
  | InvalidAction 
  | InvalidClientTokenId 
  | InvalidParameter 
  | InvalidParameterCombination 
  | InvalidParameterValue 
  | InvalidQueryParameter 
  | MalformedQueryString 
  | MissingAction 
  | MissingAuthenticationToken 
  | MissingParameter 
  | NotFound 
  | OptInRequired 
  | ParameterValueInvalid 
  | PendingVerification 
  | PlatformApplicationDisabled 
  | RequestExpired 
  | RequestLimitExceeded 
  | ServiceUnavailable 
  | SubscriptionLimitExceeded 
  | Throttling 
  | TopicLimitExceeded 
  | UnauthorizedOperation 
  | UnknownParameter 
  | UnsupportedProtocol 
  | ValidationError 
  | Uninhabited 
let common =
  [UnsupportedProtocol;
  UnknownParameter;
  UnauthorizedOperation;
  RequestLimitExceeded;
  PendingVerification;
  InvalidParameter;
  IdempotentParameterMismatch;
  DryRunOperation;
  Blocked;
  AuthFailure;
  ValidationError;
  Throttling;
  ServiceUnavailable;
  RequestExpired;
  OptInRequired;
  MissingParameter;
  MissingAuthenticationToken;
  MissingAction;
  MalformedQueryString;
  InvalidQueryParameter;
  InvalidParameterValue;
  InvalidParameterCombination;
  InvalidClientTokenId;
  InvalidAction;
  InternalFailure;
  IncompleteSignature]
let to_http_code e =
  match e with
  | AuthFailure -> None
  | AuthorizationError -> Some 403
  | Blocked -> None
  | DryRunOperation -> None
  | EndpointDisabled -> Some 400
  | IdempotentParameterMismatch -> None
  | IncompleteSignature -> Some 400
  | InternalError -> Some 500
  | InternalFailure -> Some 500
  | InvalidAction -> Some 400
  | InvalidClientTokenId -> Some 403
  | InvalidParameter -> Some 400
  | InvalidParameterCombination -> Some 400
  | InvalidParameterValue -> Some 400
  | InvalidQueryParameter -> Some 400
  | MalformedQueryString -> Some 404
  | MissingAction -> Some 400
  | MissingAuthenticationToken -> Some 403
  | MissingParameter -> Some 400
  | NotFound -> Some 404
  | OptInRequired -> Some 403
  | ParameterValueInvalid -> Some 400
  | PendingVerification -> None
  | PlatformApplicationDisabled -> Some 400
  | RequestExpired -> Some 400
  | RequestLimitExceeded -> None
  | ServiceUnavailable -> Some 503
  | SubscriptionLimitExceeded -> Some 403
  | Throttling -> Some 400
  | TopicLimitExceeded -> Some 403
  | UnauthorizedOperation -> None
  | UnknownParameter -> None
  | UnsupportedProtocol -> None
  | ValidationError -> Some 400
  | Uninhabited -> None
let to_string e =
  match e with
  | AuthFailure -> "AuthFailure"
  | AuthorizationError -> "AuthorizationError"
  | Blocked -> "Blocked"
  | DryRunOperation -> "DryRunOperation"
  | EndpointDisabled -> "EndpointDisabled"
  | IdempotentParameterMismatch -> "IdempotentParameterMismatch"
  | IncompleteSignature -> "IncompleteSignature"
  | InternalError -> "InternalError"
  | InternalFailure -> "InternalFailure"
  | InvalidAction -> "InvalidAction"
  | InvalidClientTokenId -> "InvalidClientTokenId"
  | InvalidParameter -> "InvalidParameter"
  | InvalidParameterCombination -> "InvalidParameterCombination"
  | InvalidParameterValue -> "InvalidParameterValue"
  | InvalidQueryParameter -> "InvalidQueryParameter"
  | MalformedQueryString -> "MalformedQueryString"
  | MissingAction -> "MissingAction"
  | MissingAuthenticationToken -> "MissingAuthenticationToken"
  | MissingParameter -> "MissingParameter"
  | NotFound -> "NotFound"
  | OptInRequired -> "OptInRequired"
  | ParameterValueInvalid -> "ParameterValueInvalid"
  | PendingVerification -> "PendingVerification"
  | PlatformApplicationDisabled -> "PlatformApplicationDisabled"
  | RequestExpired -> "RequestExpired"
  | RequestLimitExceeded -> "RequestLimitExceeded"
  | ServiceUnavailable -> "ServiceUnavailable"
  | SubscriptionLimitExceeded -> "SubscriptionLimitExceeded"
  | Throttling -> "Throttling"
  | TopicLimitExceeded -> "TopicLimitExceeded"
  | UnauthorizedOperation -> "UnauthorizedOperation"
  | UnknownParameter -> "UnknownParameter"
  | UnsupportedProtocol -> "UnsupportedProtocol"
  | ValidationError -> "ValidationError"
  | Uninhabited -> "Uninhabited"
let of_string e =
  match e with
  | "AuthFailure" -> Some AuthFailure
  | "AuthorizationError" -> Some AuthorizationError
  | "Blocked" -> Some Blocked
  | "DryRunOperation" -> Some DryRunOperation
  | "EndpointDisabled" -> Some EndpointDisabled
  | "IdempotentParameterMismatch" -> Some IdempotentParameterMismatch
  | "IncompleteSignature" -> Some IncompleteSignature
  | "InternalError" -> Some InternalError
  | "InternalFailure" -> Some InternalFailure
  | "InvalidAction" -> Some InvalidAction
  | "InvalidClientTokenId" -> Some InvalidClientTokenId
  | "InvalidParameter" -> Some InvalidParameter
  | "InvalidParameterCombination" -> Some InvalidParameterCombination
  | "InvalidParameterValue" -> Some InvalidParameterValue
  | "InvalidQueryParameter" -> Some InvalidQueryParameter
  | "MalformedQueryString" -> Some MalformedQueryString
  | "MissingAction" -> Some MissingAction
  | "MissingAuthenticationToken" -> Some MissingAuthenticationToken
  | "MissingParameter" -> Some MissingParameter
  | "NotFound" -> Some NotFound
  | "OptInRequired" -> Some OptInRequired
  | "ParameterValueInvalid" -> Some ParameterValueInvalid
  | "PendingVerification" -> Some PendingVerification
  | "PlatformApplicationDisabled" -> Some PlatformApplicationDisabled
  | "RequestExpired" -> Some RequestExpired
  | "RequestLimitExceeded" -> Some RequestLimitExceeded
  | "ServiceUnavailable" -> Some ServiceUnavailable
  | "SubscriptionLimitExceeded" -> Some SubscriptionLimitExceeded
  | "Throttling" -> Some Throttling
  | "TopicLimitExceeded" -> Some TopicLimitExceeded
  | "UnauthorizedOperation" -> Some UnauthorizedOperation
  | "UnknownParameter" -> Some UnknownParameter
  | "UnsupportedProtocol" -> Some UnsupportedProtocol
  | "ValidationError" -> Some ValidationError
  | "Uninhabited" -> Some Uninhabited
  | _ -> None