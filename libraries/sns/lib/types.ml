open Aws.BaseTypes
type calendar = CalendarLib.Calendar.t
module GetSubscriptionAttributesInput =
  struct
    type t = {
      subscription_arn: String.t }
    let make ~subscription_arn  () = { subscription_arn }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Xml.required "SubscriptionArn"
               (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("SubscriptionArn", (String.to_query v.subscription_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("SubscriptionArn", (String.to_json v.subscription_arn))])
    let of_json j =
      {
        subscription_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "SubscriptionArn")))
      }
  end
module MapStringToString =
  struct
    type t = (String.t, String.t) Hashtbl.t
    let make elems () = elems
    let parse xml = None
    let to_query v =
      Aws.Query.to_query_hashtbl String.to_string String.to_query v
    let to_json v =
      `Assoc
        (Hashtbl.fold
           (fun k ->
              fun v ->
                fun acc -> ((String.to_string k), (String.to_json v)) :: acc)
           v [])
    let of_json j = Aws.Json.to_hashtbl String.of_string String.of_json j
  end
module CreatePlatformEndpointInput =
  struct
    type t =
      {
      platform_application_arn: String.t ;
      token: String.t ;
      custom_user_data: String.t option ;
      attributes: MapStringToString.t option }
    let make ~platform_application_arn  ~token  ?custom_user_data 
      ?attributes  () =
      { platform_application_arn; token; custom_user_data; attributes }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Xml.required "PlatformApplicationArn"
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplicationArn" xml) String.parse));
          token =
            (Aws.Xml.required "Token"
               (Aws.Util.option_bind (Aws.Xml.member "Token" xml)
                  String.parse));
          custom_user_data =
            (Aws.Util.option_bind (Aws.Xml.member "CustomUserData" xml)
               String.parse);
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               MapStringToString.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (MapStringToString.to_query f)));
           Aws.Util.option_map v.custom_user_data
             (fun f -> Aws.Query.Pair ("CustomUserData", (String.to_query f)));
           Some (Aws.Query.Pair ("Token", (String.to_query v.token)));
           Some
             (Aws.Query.Pair
                ("PlatformApplicationArn",
                  (String.to_query v.platform_application_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (MapStringToString.to_json f)));
           Aws.Util.option_map v.custom_user_data
             (fun f -> ("CustomUserData", (String.to_json f)));
           Some ("Token", (String.to_json v.token));
           Some
             ("PlatformApplicationArn",
               (String.to_json v.platform_application_arn))])
    let of_json j =
      {
        platform_application_arn =
          (String.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplicationArn")));
        token =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Token")));
        custom_user_data =
          (Aws.Util.option_map (Aws.Json.lookup j "CustomUserData")
             String.of_json);
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             MapStringToString.of_json)
      }
  end
module ListEndpointsByPlatformApplicationInput =
  struct
    type t =
      {
      platform_application_arn: String.t ;
      next_token: String.t option }
    let make ~platform_application_arn  ?next_token  () =
      { platform_application_arn; next_token }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Xml.required "PlatformApplicationArn"
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplicationArn" xml) String.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("PlatformApplicationArn",
                  (String.to_query v.platform_application_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some
             ("PlatformApplicationArn",
               (String.to_json v.platform_application_arn))])
    let of_json j =
      {
        platform_application_arn =
          (String.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplicationArn")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module SetEndpointAttributesInput =
  struct
    type t = {
      endpoint_arn: String.t ;
      attributes: MapStringToString.t }
    let make ~endpoint_arn  ~attributes  () = { endpoint_arn; attributes }
    let parse xml =
      Some
        {
          endpoint_arn =
            (Aws.Xml.required "EndpointArn"
               (Aws.Util.option_bind (Aws.Xml.member "EndpointArn" xml)
                  String.parse));
          attributes =
            (Aws.Xml.required "Attributes"
               (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
                  MapStringToString.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("Attributes", (MapStringToString.to_query v.attributes)));
           Some
             (Aws.Query.Pair
                ("EndpointArn", (String.to_query v.endpoint_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("Attributes", (MapStringToString.to_json v.attributes));
           Some ("EndpointArn", (String.to_json v.endpoint_arn))])
    let of_json j =
      {
        endpoint_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "EndpointArn")));
        attributes =
          (MapStringToString.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Attributes")))
      }
  end
module EndpointDisabledException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module DeleteEndpointInput =
  struct
    type t = {
      endpoint_arn: String.t }
    let make ~endpoint_arn  () = { endpoint_arn }
    let parse xml =
      Some
        {
          endpoint_arn =
            (Aws.Xml.required "EndpointArn"
               (Aws.Util.option_bind (Aws.Xml.member "EndpointArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("EndpointArn", (String.to_query v.endpoint_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("EndpointArn", (String.to_json v.endpoint_arn))])
    let of_json j =
      {
        endpoint_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "EndpointArn")))
      }
  end
module GetPlatformApplicationAttributesResponse =
  struct
    type t = {
      attributes: MapStringToString.t option }
    let make ?attributes  () = { attributes }
    let parse xml =
      Some
        {
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               MapStringToString.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (MapStringToString.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (MapStringToString.to_json f)))])
    let of_json j =
      {
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             MapStringToString.of_json)
      }
  end
module CreateEndpointResponse =
  struct
    type t = {
      endpoint_arn: String.t option }
    let make ?endpoint_arn  () = { endpoint_arn }
    let parse xml =
      Some
        {
          endpoint_arn =
            (Aws.Util.option_bind (Aws.Xml.member "EndpointArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.endpoint_arn
              (fun f -> Aws.Query.Pair ("EndpointArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.endpoint_arn
              (fun f -> ("EndpointArn", (String.to_json f)))])
    let of_json j =
      {
        endpoint_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "EndpointArn")
             String.of_json)
      }
  end
module SetTopicAttributesInput =
  struct
    type t =
      {
      topic_arn: String.t ;
      attribute_name: String.t ;
      attribute_value: String.t option }
    let make ~topic_arn  ~attribute_name  ?attribute_value  () =
      { topic_arn; attribute_name; attribute_value }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          attribute_name =
            (Aws.Xml.required "AttributeName"
               (Aws.Util.option_bind (Aws.Xml.member "AttributeName" xml)
                  String.parse));
          attribute_value =
            (Aws.Util.option_bind (Aws.Xml.member "AttributeValue" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attribute_value
              (fun f ->
                 Aws.Query.Pair ("AttributeValue", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("AttributeName", (String.to_query v.attribute_name)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attribute_value
              (fun f -> ("AttributeValue", (String.to_json f)));
           Some ("AttributeName", (String.to_json v.attribute_name));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        attribute_name =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "AttributeName")));
        attribute_value =
          (Aws.Util.option_map (Aws.Json.lookup j "AttributeValue")
             String.of_json)
      }
  end
module ListPlatformApplicationsInput =
  struct
    type t = {
      next_token: String.t option }
    let make ?next_token  () = { next_token }
    let parse xml =
      Some
        {
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)))])
    let of_json j =
      {
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module PlatformApplication =
  struct
    type t =
      {
      platform_application_arn: String.t option ;
      attributes: MapStringToString.t option }
    let make ?platform_application_arn  ?attributes  () =
      { platform_application_arn; attributes }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Util.option_bind
               (Aws.Xml.member "PlatformApplicationArn" xml) String.parse);
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               MapStringToString.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (MapStringToString.to_query f)));
           Aws.Util.option_map v.platform_application_arn
             (fun f ->
                Aws.Query.Pair
                  ("PlatformApplicationArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (MapStringToString.to_json f)));
           Aws.Util.option_map v.platform_application_arn
             (fun f -> ("PlatformApplicationArn", (String.to_json f)))])
    let of_json j =
      {
        platform_application_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "PlatformApplicationArn")
             String.of_json);
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             MapStringToString.of_json)
      }
  end
module ListOfPlatformApplications =
  struct
    type t = PlatformApplication.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map PlatformApplication.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list PlatformApplication.to_query v
    let to_json v = `List (List.map PlatformApplication.to_json v)
    let of_json j = Aws.Json.to_list PlatformApplication.of_json j
  end
module InternalErrorException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module PublishResponse =
  struct
    type t = {
      message_id: String.t option }
    let make ?message_id  () = { message_id }
    let parse xml =
      Some
        {
          message_id =
            (Aws.Util.option_bind (Aws.Xml.member "MessageId" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message_id
              (fun f -> Aws.Query.Pair ("MessageId", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message_id
              (fun f -> ("MessageId", (String.to_json f)))])
    let of_json j =
      {
        message_id =
          (Aws.Util.option_map (Aws.Json.lookup j "MessageId") String.of_json)
      }
  end
module SubscriptionLimitExceededException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module Endpoint =
  struct
    type t =
      {
      endpoint_arn: String.t option ;
      attributes: MapStringToString.t option }
    let make ?endpoint_arn  ?attributes  () = { endpoint_arn; attributes }
    let parse xml =
      Some
        {
          endpoint_arn =
            (Aws.Util.option_bind (Aws.Xml.member "EndpointArn" xml)
               String.parse);
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               MapStringToString.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (MapStringToString.to_query f)));
           Aws.Util.option_map v.endpoint_arn
             (fun f -> Aws.Query.Pair ("EndpointArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (MapStringToString.to_json f)));
           Aws.Util.option_map v.endpoint_arn
             (fun f -> ("EndpointArn", (String.to_json f)))])
    let of_json j =
      {
        endpoint_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "EndpointArn")
             String.of_json);
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             MapStringToString.of_json)
      }
  end
module ListOfEndpoints =
  struct
    type t = Endpoint.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map Endpoint.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list Endpoint.to_query v
    let to_json v = `List (List.map Endpoint.to_json v)
    let of_json j = Aws.Json.to_list Endpoint.of_json j
  end
module ListEndpointsByPlatformApplicationResponse =
  struct
    type t = {
      endpoints: ListOfEndpoints.t ;
      next_token: String.t option }
    let make ?(endpoints= [])  ?next_token  () = { endpoints; next_token }
    let parse xml =
      Some
        {
          endpoints =
            (Aws.Util.of_option []
               (Aws.Util.option_bind (Aws.Xml.member "Endpoints" xml)
                  ListOfEndpoints.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("Endpoints", (ListOfEndpoints.to_query v.endpoints)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some ("Endpoints", (ListOfEndpoints.to_json v.endpoints))])
    let of_json j =
      {
        endpoints =
          (ListOfEndpoints.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Endpoints")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module Topic =
  struct
    type t = {
      topic_arn: String.t option }
    let make ?topic_arn  () = { topic_arn }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> Aws.Query.Pair ("TopicArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> ("TopicArn", (String.to_json f)))])
    let of_json j =
      {
        topic_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "TopicArn") String.of_json)
      }
  end
module TopicsList =
  struct
    type t = Topic.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map Topic.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list Topic.to_query v
    let to_json v = `List (List.map Topic.to_json v)
    let of_json j = Aws.Json.to_list Topic.of_json j
  end
module ListTopicsResponse =
  struct
    type t = {
      topics: TopicsList.t ;
      next_token: String.t option }
    let make ?(topics= [])  ?next_token  () = { topics; next_token }
    let parse xml =
      Some
        {
          topics =
            (Aws.Util.of_option []
               (Aws.Util.option_bind (Aws.Xml.member "Topics" xml)
                  TopicsList.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some (Aws.Query.Pair ("Topics", (TopicsList.to_query v.topics)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some ("Topics", (TopicsList.to_json v.topics))])
    let of_json j =
      {
        topics =
          (TopicsList.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Topics")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module CreateTopicResponse =
  struct
    type t = {
      topic_arn: String.t option }
    let make ?topic_arn  () = { topic_arn }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> Aws.Query.Pair ("TopicArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> ("TopicArn", (String.to_json f)))])
    let of_json j =
      {
        topic_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "TopicArn") String.of_json)
      }
  end
module SetSubscriptionAttributesInput =
  struct
    type t =
      {
      subscription_arn: String.t ;
      attribute_name: String.t ;
      attribute_value: String.t option }
    let make ~subscription_arn  ~attribute_name  ?attribute_value  () =
      { subscription_arn; attribute_name; attribute_value }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Xml.required "SubscriptionArn"
               (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
                  String.parse));
          attribute_name =
            (Aws.Xml.required "AttributeName"
               (Aws.Util.option_bind (Aws.Xml.member "AttributeName" xml)
                  String.parse));
          attribute_value =
            (Aws.Util.option_bind (Aws.Xml.member "AttributeValue" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attribute_value
              (fun f ->
                 Aws.Query.Pair ("AttributeValue", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("AttributeName", (String.to_query v.attribute_name)));
           Some
             (Aws.Query.Pair
                ("SubscriptionArn", (String.to_query v.subscription_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attribute_value
              (fun f -> ("AttributeValue", (String.to_json f)));
           Some ("AttributeName", (String.to_json v.attribute_name));
           Some ("SubscriptionArn", (String.to_json v.subscription_arn))])
    let of_json j =
      {
        subscription_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "SubscriptionArn")));
        attribute_name =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "AttributeName")));
        attribute_value =
          (Aws.Util.option_map (Aws.Json.lookup j "AttributeValue")
             String.of_json)
      }
  end
module GetTopicAttributesInput =
  struct
    type t = {
      topic_arn: String.t }
    let make ~topic_arn  () = { topic_arn }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")))
      }
  end
module TopicLimitExceededException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module PlatformApplicationDisabledException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module CreatePlatformApplicationInput =
  struct
    type t =
      {
      name: String.t ;
      platform: String.t ;
      attributes: MapStringToString.t }
    let make ~name  ~platform  ~attributes  () =
      { name; platform; attributes }
    let parse xml =
      Some
        {
          name =
            (Aws.Xml.required "Name"
               (Aws.Util.option_bind (Aws.Xml.member "Name" xml) String.parse));
          platform =
            (Aws.Xml.required "Platform"
               (Aws.Util.option_bind (Aws.Xml.member "Platform" xml)
                  String.parse));
          attributes =
            (Aws.Xml.required "Attributes"
               (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
                  MapStringToString.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("Attributes", (MapStringToString.to_query v.attributes)));
           Some (Aws.Query.Pair ("Platform", (String.to_query v.platform)));
           Some (Aws.Query.Pair ("Name", (String.to_query v.name)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("Attributes", (MapStringToString.to_json v.attributes));
           Some ("Platform", (String.to_json v.platform));
           Some ("Name", (String.to_json v.name))])
    let of_json j =
      {
        name =
          (String.of_json (Aws.Util.of_option_exn (Aws.Json.lookup j "Name")));
        platform =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Platform")));
        attributes =
          (MapStringToString.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Attributes")))
      }
  end
module GetEndpointAttributesInput =
  struct
    type t = {
      endpoint_arn: String.t }
    let make ~endpoint_arn  () = { endpoint_arn }
    let parse xml =
      Some
        {
          endpoint_arn =
            (Aws.Xml.required "EndpointArn"
               (Aws.Util.option_bind (Aws.Xml.member "EndpointArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("EndpointArn", (String.to_query v.endpoint_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("EndpointArn", (String.to_json v.endpoint_arn))])
    let of_json j =
      {
        endpoint_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "EndpointArn")))
      }
  end
module NotFoundException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module ActionsList =
  struct
    type t = String.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map String.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list String.to_query v
    let to_json v = `List (List.map String.to_json v)
    let of_json j = Aws.Json.to_list String.of_json j
  end
module UnsubscribeInput =
  struct
    type t = {
      subscription_arn: String.t }
    let make ~subscription_arn  () = { subscription_arn }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Xml.required "SubscriptionArn"
               (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("SubscriptionArn", (String.to_query v.subscription_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("SubscriptionArn", (String.to_json v.subscription_arn))])
    let of_json j =
      {
        subscription_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "SubscriptionArn")))
      }
  end
module DelegatesList =
  struct
    type t = String.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map String.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list String.to_query v
    let to_json v = `List (List.map String.to_json v)
    let of_json j = Aws.Json.to_list String.of_json j
  end
module AddPermissionInput =
  struct
    type t =
      {
      topic_arn: String.t ;
      label: String.t ;
      a_w_s_account_id: DelegatesList.t ;
      action_name: ActionsList.t }
    let make ~topic_arn  ~label  ~a_w_s_account_id  ~action_name  () =
      { topic_arn; label; a_w_s_account_id; action_name }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          label =
            (Aws.Xml.required "Label"
               (Aws.Util.option_bind (Aws.Xml.member "Label" xml)
                  String.parse));
          a_w_s_account_id =
            (Aws.Xml.required "AWSAccountId"
               (Aws.Util.option_bind (Aws.Xml.member "AWSAccountId" xml)
                  DelegatesList.parse));
          action_name =
            (Aws.Xml.required "ActionName"
               (Aws.Util.option_bind (Aws.Xml.member "ActionName" xml)
                  ActionsList.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("ActionName", (ActionsList.to_query v.action_name)));
           Some
             (Aws.Query.Pair
                ("AWSAccountId", (DelegatesList.to_query v.a_w_s_account_id)));
           Some (Aws.Query.Pair ("Label", (String.to_query v.label)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("ActionName", (ActionsList.to_json v.action_name));
           Some ("AWSAccountId", (DelegatesList.to_json v.a_w_s_account_id));
           Some ("Label", (String.to_json v.label));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        label =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Label")));
        a_w_s_account_id =
          (DelegatesList.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "AWSAccountId")));
        action_name =
          (ActionsList.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "ActionName")))
      }
  end
module Subscription =
  struct
    type t =
      {
      subscription_arn: String.t option ;
      owner: String.t option ;
      protocol: String.t option ;
      endpoint: String.t option ;
      topic_arn: String.t option }
    let make ?subscription_arn  ?owner  ?protocol  ?endpoint  ?topic_arn  ()
      = { subscription_arn; owner; protocol; endpoint; topic_arn }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
               String.parse);
          owner =
            (Aws.Util.option_bind (Aws.Xml.member "Owner" xml) String.parse);
          protocol =
            (Aws.Util.option_bind (Aws.Xml.member "Protocol" xml)
               String.parse);
          endpoint =
            (Aws.Util.option_bind (Aws.Xml.member "Endpoint" xml)
               String.parse);
          topic_arn =
            (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> Aws.Query.Pair ("TopicArn", (String.to_query f)));
           Aws.Util.option_map v.endpoint
             (fun f -> Aws.Query.Pair ("Endpoint", (String.to_query f)));
           Aws.Util.option_map v.protocol
             (fun f -> Aws.Query.Pair ("Protocol", (String.to_query f)));
           Aws.Util.option_map v.owner
             (fun f -> Aws.Query.Pair ("Owner", (String.to_query f)));
           Aws.Util.option_map v.subscription_arn
             (fun f ->
                Aws.Query.Pair ("SubscriptionArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.topic_arn
              (fun f -> ("TopicArn", (String.to_json f)));
           Aws.Util.option_map v.endpoint
             (fun f -> ("Endpoint", (String.to_json f)));
           Aws.Util.option_map v.protocol
             (fun f -> ("Protocol", (String.to_json f)));
           Aws.Util.option_map v.owner
             (fun f -> ("Owner", (String.to_json f)));
           Aws.Util.option_map v.subscription_arn
             (fun f -> ("SubscriptionArn", (String.to_json f)))])
    let of_json j =
      {
        subscription_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "SubscriptionArn")
             String.of_json);
        owner =
          (Aws.Util.option_map (Aws.Json.lookup j "Owner") String.of_json);
        protocol =
          (Aws.Util.option_map (Aws.Json.lookup j "Protocol") String.of_json);
        endpoint =
          (Aws.Util.option_map (Aws.Json.lookup j "Endpoint") String.of_json);
        topic_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "TopicArn") String.of_json)
      }
  end
module SubscriptionsList =
  struct
    type t = Subscription.t list
    let make elems () = elems
    let parse xml =
      Aws.Util.option_all
        (List.map Subscription.parse (Aws.Xml.members "member" xml))
    let to_query v = Aws.Query.to_query_list Subscription.to_query v
    let to_json v = `List (List.map Subscription.to_json v)
    let of_json j = Aws.Json.to_list Subscription.of_json j
  end
module CreatePlatformApplicationResponse =
  struct
    type t = {
      platform_application_arn: String.t option }
    let make ?platform_application_arn  () = { platform_application_arn }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Util.option_bind
               (Aws.Xml.member "PlatformApplicationArn" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.platform_application_arn
              (fun f ->
                 Aws.Query.Pair
                   ("PlatformApplicationArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.platform_application_arn
              (fun f -> ("PlatformApplicationArn", (String.to_json f)))])
    let of_json j =
      {
        platform_application_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "PlatformApplicationArn")
             String.of_json)
      }
  end
module ConfirmSubscriptionInput =
  struct
    type t =
      {
      topic_arn: String.t ;
      token: String.t ;
      authenticate_on_unsubscribe: String.t option }
    let make ~topic_arn  ~token  ?authenticate_on_unsubscribe  () =
      { topic_arn; token; authenticate_on_unsubscribe }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          token =
            (Aws.Xml.required "Token"
               (Aws.Util.option_bind (Aws.Xml.member "Token" xml)
                  String.parse));
          authenticate_on_unsubscribe =
            (Aws.Util.option_bind
               (Aws.Xml.member "AuthenticateOnUnsubscribe" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.authenticate_on_unsubscribe
              (fun f ->
                 Aws.Query.Pair
                   ("AuthenticateOnUnsubscribe", (String.to_query f)));
           Some (Aws.Query.Pair ("Token", (String.to_query v.token)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.authenticate_on_unsubscribe
              (fun f -> ("AuthenticateOnUnsubscribe", (String.to_json f)));
           Some ("Token", (String.to_json v.token));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        token =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Token")));
        authenticate_on_unsubscribe =
          (Aws.Util.option_map
             (Aws.Json.lookup j "AuthenticateOnUnsubscribe") String.of_json)
      }
  end
module ListPlatformApplicationsResponse =
  struct
    type t =
      {
      platform_applications: ListOfPlatformApplications.t ;
      next_token: String.t option }
    let make ?(platform_applications= [])  ?next_token  () =
      { platform_applications; next_token }
    let parse xml =
      Some
        {
          platform_applications =
            (Aws.Util.of_option []
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplications" xml)
                  ListOfPlatformApplications.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("PlatformApplications",
                  (ListOfPlatformApplications.to_query
                     v.platform_applications)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some
             ("PlatformApplications",
               (ListOfPlatformApplications.to_json v.platform_applications))])
    let of_json j =
      {
        platform_applications =
          (ListOfPlatformApplications.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplications")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module InvalidParameterValueException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module DeleteTopicInput =
  struct
    type t = {
      topic_arn: String.t }
    let make ~topic_arn  () = { topic_arn }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")))
      }
  end
module AuthorizationErrorException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module SubscribeResponse =
  struct
    type t = {
      subscription_arn: String.t option }
    let make ?subscription_arn  () = { subscription_arn }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.subscription_arn
              (fun f ->
                 Aws.Query.Pair ("SubscriptionArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.subscription_arn
              (fun f -> ("SubscriptionArn", (String.to_json f)))])
    let of_json j =
      {
        subscription_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "SubscriptionArn")
             String.of_json)
      }
  end
module DeletePlatformApplicationInput =
  struct
    type t = {
      platform_application_arn: String.t }
    let make ~platform_application_arn  () = { platform_application_arn }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Xml.required "PlatformApplicationArn"
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplicationArn" xml) String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("PlatformApplicationArn",
                   (String.to_query v.platform_application_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some
              ("PlatformApplicationArn",
                (String.to_json v.platform_application_arn))])
    let of_json j =
      {
        platform_application_arn =
          (String.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplicationArn")))
      }
  end
module RemovePermissionInput =
  struct
    type t = {
      topic_arn: String.t ;
      label: String.t }
    let make ~topic_arn  ~label  () = { topic_arn; label }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          label =
            (Aws.Xml.required "Label"
               (Aws.Util.option_bind (Aws.Xml.member "Label" xml)
                  String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some (Aws.Query.Pair ("Label", (String.to_query v.label)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("Label", (String.to_json v.label));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        label =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Label")))
      }
  end
module CreateTopicInput =
  struct
    type t = {
      name: String.t }
    let make ~name  () = { name }
    let parse xml =
      Some
        {
          name =
            (Aws.Xml.required "Name"
               (Aws.Util.option_bind (Aws.Xml.member "Name" xml) String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some (Aws.Query.Pair ("Name", (String.to_query v.name)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt [Some ("Name", (String.to_json v.name))])
    let of_json j =
      {
        name =
          (String.of_json (Aws.Util.of_option_exn (Aws.Json.lookup j "Name")))
      }
  end
module TopicAttributesMap =
  struct
    type t = (String.t, String.t) Hashtbl.t
    let make elems () = elems
    let parse xml = None
    let to_query v =
      Aws.Query.to_query_hashtbl String.to_string String.to_query v
    let to_json v =
      `Assoc
        (Hashtbl.fold
           (fun k ->
              fun v ->
                fun acc -> ((String.to_string k), (String.to_json v)) :: acc)
           v [])
    let of_json j = Aws.Json.to_hashtbl String.of_string String.of_json j
  end
module GetTopicAttributesResponse =
  struct
    type t = {
      attributes: TopicAttributesMap.t option }
    let make ?attributes  () = { attributes }
    let parse xml =
      Some
        {
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               TopicAttributesMap.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (TopicAttributesMap.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (TopicAttributesMap.to_json f)))])
    let of_json j =
      {
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             TopicAttributesMap.of_json)
      }
  end
module ConfirmSubscriptionResponse =
  struct
    type t = {
      subscription_arn: String.t option }
    let make ?subscription_arn  () = { subscription_arn }
    let parse xml =
      Some
        {
          subscription_arn =
            (Aws.Util.option_bind (Aws.Xml.member "SubscriptionArn" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.subscription_arn
              (fun f ->
                 Aws.Query.Pair ("SubscriptionArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.subscription_arn
              (fun f -> ("SubscriptionArn", (String.to_json f)))])
    let of_json j =
      {
        subscription_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "SubscriptionArn")
             String.of_json)
      }
  end
module MessageAttributeValue =
  struct
    type t =
      {
      data_type: String.t ;
      string_value: String.t option ;
      binary_value: Blob.t option }
    let make ~data_type  ?string_value  ?binary_value  () =
      { data_type; string_value; binary_value }
    let parse xml =
      Some
        {
          data_type =
            (Aws.Xml.required "DataType"
               (Aws.Util.option_bind (Aws.Xml.member "DataType" xml)
                  String.parse));
          string_value =
            (Aws.Util.option_bind (Aws.Xml.member "StringValue" xml)
               String.parse);
          binary_value =
            (Aws.Util.option_bind (Aws.Xml.member "BinaryValue" xml)
               Blob.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.binary_value
              (fun f -> Aws.Query.Pair ("BinaryValue", (Blob.to_query f)));
           Aws.Util.option_map v.string_value
             (fun f -> Aws.Query.Pair ("StringValue", (String.to_query f)));
           Some (Aws.Query.Pair ("DataType", (String.to_query v.data_type)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.binary_value
              (fun f -> ("BinaryValue", (Blob.to_json f)));
           Aws.Util.option_map v.string_value
             (fun f -> ("StringValue", (String.to_json f)));
           Some ("DataType", (String.to_json v.data_type))])
    let of_json j =
      {
        data_type =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "DataType")));
        string_value =
          (Aws.Util.option_map (Aws.Json.lookup j "StringValue")
             String.of_json);
        binary_value =
          (Aws.Util.option_map (Aws.Json.lookup j "BinaryValue") Blob.of_json)
      }
  end
module MessageAttributeMap =
  struct
    type t = (String.t, MessageAttributeValue.t) Hashtbl.t
    let make elems () = elems
    let parse xml = None
    let to_query v =
      Aws.Query.to_query_hashtbl String.to_string
        MessageAttributeValue.to_query v
    let to_json v =
      `Assoc
        (Hashtbl.fold
           (fun k ->
              fun v ->
                fun acc ->
                  ((String.to_string k), (MessageAttributeValue.to_json v))
                  :: acc) v [])
    let of_json j =
      Aws.Json.to_hashtbl String.of_string MessageAttributeValue.of_json j
  end
module SubscriptionAttributesMap =
  struct
    type t = (String.t, String.t) Hashtbl.t
    let make elems () = elems
    let parse xml = None
    let to_query v =
      Aws.Query.to_query_hashtbl String.to_string String.to_query v
    let to_json v =
      `Assoc
        (Hashtbl.fold
           (fun k ->
              fun v ->
                fun acc -> ((String.to_string k), (String.to_json v)) :: acc)
           v [])
    let of_json j = Aws.Json.to_hashtbl String.of_string String.of_json j
  end
module GetSubscriptionAttributesResponse =
  struct
    type t = {
      attributes: SubscriptionAttributesMap.t option }
    let make ?attributes  () = { attributes }
    let parse xml =
      Some
        {
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               SubscriptionAttributesMap.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (SubscriptionAttributesMap.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (SubscriptionAttributesMap.to_json f)))])
    let of_json j =
      {
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             SubscriptionAttributesMap.of_json)
      }
  end
module InvalidParameterException =
  struct
    type t = {
      message: String.t option }
    let make ?message  () = { message }
    let parse xml =
      Some
        {
          message =
            (Aws.Util.option_bind (Aws.Xml.member "message" xml) String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> Aws.Query.Pair ("Message", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message
              (fun f -> ("message", (String.to_json f)))])
    let of_json j =
      {
        message =
          (Aws.Util.option_map (Aws.Json.lookup j "message") String.of_json)
      }
  end
module GetEndpointAttributesResponse =
  struct
    type t = {
      attributes: MapStringToString.t option }
    let make ?attributes  () = { attributes }
    let parse xml =
      Some
        {
          attributes =
            (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
               MapStringToString.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f ->
                 Aws.Query.Pair
                   ("Attributes", (MapStringToString.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.attributes
              (fun f -> ("Attributes", (MapStringToString.to_json f)))])
    let of_json j =
      {
        attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "Attributes")
             MapStringToString.of_json)
      }
  end
module ListSubscriptionsResponse =
  struct
    type t =
      {
      subscriptions: SubscriptionsList.t ;
      next_token: String.t option }
    let make ?(subscriptions= [])  ?next_token  () =
      { subscriptions; next_token }
    let parse xml =
      Some
        {
          subscriptions =
            (Aws.Util.of_option []
               (Aws.Util.option_bind (Aws.Xml.member "Subscriptions" xml)
                  SubscriptionsList.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("Subscriptions",
                  (SubscriptionsList.to_query v.subscriptions)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some
             ("Subscriptions", (SubscriptionsList.to_json v.subscriptions))])
    let of_json j =
      {
        subscriptions =
          (SubscriptionsList.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Subscriptions")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module PublishInput =
  struct
    type t =
      {
      topic_arn: String.t option ;
      target_arn: String.t option ;
      message: String.t ;
      subject: String.t option ;
      message_structure: String.t option ;
      message_attributes: MessageAttributeMap.t option }
    let make ?topic_arn  ?target_arn  ~message  ?subject  ?message_structure 
      ?message_attributes  () =
      {
        topic_arn;
        target_arn;
        message;
        subject;
        message_structure;
        message_attributes
      }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
               String.parse);
          target_arn =
            (Aws.Util.option_bind (Aws.Xml.member "TargetArn" xml)
               String.parse);
          message =
            (Aws.Xml.required "Message"
               (Aws.Util.option_bind (Aws.Xml.member "Message" xml)
                  String.parse));
          subject =
            (Aws.Util.option_bind (Aws.Xml.member "Subject" xml) String.parse);
          message_structure =
            (Aws.Util.option_bind (Aws.Xml.member "MessageStructure" xml)
               String.parse);
          message_attributes =
            (Aws.Util.option_bind (Aws.Xml.member "MessageAttributes" xml)
               MessageAttributeMap.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message_attributes
              (fun f ->
                 Aws.Query.Pair
                   ("MessageAttributes", (MessageAttributeMap.to_query f)));
           Aws.Util.option_map v.message_structure
             (fun f ->
                Aws.Query.Pair ("MessageStructure", (String.to_query f)));
           Aws.Util.option_map v.subject
             (fun f -> Aws.Query.Pair ("Subject", (String.to_query f)));
           Some (Aws.Query.Pair ("Message", (String.to_query v.message)));
           Aws.Util.option_map v.target_arn
             (fun f -> Aws.Query.Pair ("TargetArn", (String.to_query f)));
           Aws.Util.option_map v.topic_arn
             (fun f -> Aws.Query.Pair ("TopicArn", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.message_attributes
              (fun f ->
                 ("MessageAttributes", (MessageAttributeMap.to_json f)));
           Aws.Util.option_map v.message_structure
             (fun f -> ("MessageStructure", (String.to_json f)));
           Aws.Util.option_map v.subject
             (fun f -> ("Subject", (String.to_json f)));
           Some ("Message", (String.to_json v.message));
           Aws.Util.option_map v.target_arn
             (fun f -> ("TargetArn", (String.to_json f)));
           Aws.Util.option_map v.topic_arn
             (fun f -> ("TopicArn", (String.to_json f)))])
    let of_json j =
      {
        topic_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "TopicArn") String.of_json);
        target_arn =
          (Aws.Util.option_map (Aws.Json.lookup j "TargetArn") String.of_json);
        message =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Message")));
        subject =
          (Aws.Util.option_map (Aws.Json.lookup j "Subject") String.of_json);
        message_structure =
          (Aws.Util.option_map (Aws.Json.lookup j "MessageStructure")
             String.of_json);
        message_attributes =
          (Aws.Util.option_map (Aws.Json.lookup j "MessageAttributes")
             MessageAttributeMap.of_json)
      }
  end
module ListSubscriptionsInput =
  struct
    type t = {
      next_token: String.t option }
    let make ?next_token  () = { next_token }
    let parse xml =
      Some
        {
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)))])
    let of_json j =
      {
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module ListSubscriptionsByTopicInput =
  struct
    type t = {
      topic_arn: String.t ;
      next_token: String.t option }
    let make ~topic_arn  ?next_token  () = { topic_arn; next_token }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module SubscribeInput =
  struct
    type t =
      {
      topic_arn: String.t ;
      protocol: String.t ;
      endpoint: String.t option }
    let make ~topic_arn  ~protocol  ?endpoint  () =
      { topic_arn; protocol; endpoint }
    let parse xml =
      Some
        {
          topic_arn =
            (Aws.Xml.required "TopicArn"
               (Aws.Util.option_bind (Aws.Xml.member "TopicArn" xml)
                  String.parse));
          protocol =
            (Aws.Xml.required "Protocol"
               (Aws.Util.option_bind (Aws.Xml.member "Protocol" xml)
                  String.parse));
          endpoint =
            (Aws.Util.option_bind (Aws.Xml.member "Endpoint" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.endpoint
              (fun f -> Aws.Query.Pair ("Endpoint", (String.to_query f)));
           Some (Aws.Query.Pair ("Protocol", (String.to_query v.protocol)));
           Some (Aws.Query.Pair ("TopicArn", (String.to_query v.topic_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.endpoint
              (fun f -> ("Endpoint", (String.to_json f)));
           Some ("Protocol", (String.to_json v.protocol));
           Some ("TopicArn", (String.to_json v.topic_arn))])
    let of_json j =
      {
        topic_arn =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "TopicArn")));
        protocol =
          (String.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Protocol")));
        endpoint =
          (Aws.Util.option_map (Aws.Json.lookup j "Endpoint") String.of_json)
      }
  end
module GetPlatformApplicationAttributesInput =
  struct
    type t = {
      platform_application_arn: String.t }
    let make ~platform_application_arn  () = { platform_application_arn }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Xml.required "PlatformApplicationArn"
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplicationArn" xml) String.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("PlatformApplicationArn",
                   (String.to_query v.platform_application_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some
              ("PlatformApplicationArn",
                (String.to_json v.platform_application_arn))])
    let of_json j =
      {
        platform_application_arn =
          (String.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplicationArn")))
      }
  end
module SetPlatformApplicationAttributesInput =
  struct
    type t =
      {
      platform_application_arn: String.t ;
      attributes: MapStringToString.t }
    let make ~platform_application_arn  ~attributes  () =
      { platform_application_arn; attributes }
    let parse xml =
      Some
        {
          platform_application_arn =
            (Aws.Xml.required "PlatformApplicationArn"
               (Aws.Util.option_bind
                  (Aws.Xml.member "PlatformApplicationArn" xml) String.parse));
          attributes =
            (Aws.Xml.required "Attributes"
               (Aws.Util.option_bind (Aws.Xml.member "Attributes" xml)
                  MapStringToString.parse))
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Some
              (Aws.Query.Pair
                 ("Attributes", (MapStringToString.to_query v.attributes)));
           Some
             (Aws.Query.Pair
                ("PlatformApplicationArn",
                  (String.to_query v.platform_application_arn)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Some ("Attributes", (MapStringToString.to_json v.attributes));
           Some
             ("PlatformApplicationArn",
               (String.to_json v.platform_application_arn))])
    let of_json j =
      {
        platform_application_arn =
          (String.of_json
             (Aws.Util.of_option_exn
                (Aws.Json.lookup j "PlatformApplicationArn")));
        attributes =
          (MapStringToString.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Attributes")))
      }
  end
module ListTopicsInput =
  struct
    type t = {
      next_token: String.t option }
    let make ?next_token  () = { next_token }
    let parse xml =
      Some
        {
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)))])
    let of_json j =
      {
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end
module ListSubscriptionsByTopicResponse =
  struct
    type t =
      {
      subscriptions: SubscriptionsList.t ;
      next_token: String.t option }
    let make ?(subscriptions= [])  ?next_token  () =
      { subscriptions; next_token }
    let parse xml =
      Some
        {
          subscriptions =
            (Aws.Util.of_option []
               (Aws.Util.option_bind (Aws.Xml.member "Subscriptions" xml)
                  SubscriptionsList.parse));
          next_token =
            (Aws.Util.option_bind (Aws.Xml.member "NextToken" xml)
               String.parse)
        }
    let to_query v =
      Aws.Query.List
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> Aws.Query.Pair ("NextToken", (String.to_query f)));
           Some
             (Aws.Query.Pair
                ("Subscriptions",
                  (SubscriptionsList.to_query v.subscriptions)))])
    let to_json v =
      `Assoc
        (Aws.Util.list_filter_opt
           [Aws.Util.option_map v.next_token
              (fun f -> ("NextToken", (String.to_json f)));
           Some
             ("Subscriptions", (SubscriptionsList.to_json v.subscriptions))])
    let of_json j =
      {
        subscriptions =
          (SubscriptionsList.of_json
             (Aws.Util.of_option_exn (Aws.Json.lookup j "Subscriptions")));
        next_token =
          (Aws.Util.option_map (Aws.Json.lookup j "NextToken") String.of_json)
      }
  end