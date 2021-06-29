---
title: "Tips for working with the APIs"
description: Provides some tips about working with Business Central API.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Tips for working with the APIs


## GET

+ Call (GET) the endpoint to list all the API
+ Call (GET) the endpoint with `$metadata` to list all metadata for the API

<!--
+ Call (GET) the endpoint with the `odata.track-changes` preference to obtain a [deltaLink](devenv-connect-apps-delta.md) to return the records that have changed in the data set since the last query
+ Call (GET) the endpoint with `$filter` to list all the records within the specified range by providing [Filters](devenv-connect-apps-filtering.md)
-->

+ Calling a resource API (GET) will return a list of all instances of the resource type
+ Each resource is uniquely identified through an ID, see the following example:  

    ```json
    {
        "@odata.context": "<endpoint>/$metadata#companies",
        "value": [
            {
                "id": "bb6d48b6-c7b2-4a38-9a93-ad5506407f12",
                "systemVersion": "18453",
                "name": "CRONUS USA, Inc.",
                "displayName": "CRONUS USA, Inc.",
                "businessProfileId": ""
            }
        ]
    }
    ```

+ The resource ID must be provided in the URL when trying to read or modify a resource or any of its children. The ID is provided in () after the API endpoint. For example, to GET the "CRONUS USA, Inc." company details, you must call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/`
+ All resources live in the context of a parent company, which means that the company ID must be provided in the URL for all resource API calls. For example, to GET all customers in the "CRONUS USA, Inc." company, you must call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/customers`

## <a name="AcceptLanguage"></a>Accept-Language

By specifying `Accept-Language` in the request header, you can set a specific language for your web service response. It's strongly recommended to use this setting, if your app is dependent on a web service response to be in a specific language. If `Accept-Language` is set, it will override default settings. This setting also controls the regional formatting settings, affecting behavior such as how date and time will be formatted.

One of the most common examples is showing error messages to the users in their language. To see which possible error messages to display, see [Error Codes](/dynamics-nav/api-reference/v2.0/dynamics_error_codes). Another common example is displaying reports in a specific language, see the example below for how to specify `Accept-Language`. The following example sets the language to always be `en-US`.

### Example

`GET businesscentralPrefix/companies({id})/salesInvoices({salesInvoiceId})/pdfDocument({salesInvoiceId})/content`

#### Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Accept-Language|en-US|

#### Request body
Do not supply a request body for this method.

#### Reponse
If successful, this method returns a `200 OK` response code and a report PDF file in the response body.

## <a name="batch"></a>OData transactional $batch requests

> **APPLIES TO:** Business Central 2020 release wave 2 (version 17.1) and later

It's possible to specify that all inner requests in a certain OData $batch request are processed in a transactional way. If one of the inner requests fails after another request (or requests) has committed changes, all changes within a batch will be reverted as if the batch request never happened. Transactional $batch requests are useful in scenarios where a single business operation spans multiple requests, because they prevent adverse effects if parts of the operation fail. Also, they can improve performance by reducing the number of requests the client needs to do when errors occur.

To enable transactional batch behavior, include the `Isolation: snapshot` header with the $batch request.

### Example

```
POST businesscentralPrefix/api/v2.0/$batch HTTP/1.1
```

### Request headers

|Header|Value|
|------|-----|
|Authorization |   Bearer {token}. Required.|
|Content-Type   | application/json. Required for JSON Batch content.|
|Accept |  application/json|
|Isolation|snapshot|

### Request body

The following request body contains three inner requests. The first two requests should execute successfully. The last request  includes content that triggers a validation failure, so the request fails.

```json
{
       "requests": [
              {
                     "method": "PATCH",
                     "url": "items(7ce0af2e-0963-460f-9b1f-0014aea3e117)",
                     "headers": {
                           "Company": "CRONUS International Ltd.",
                           "Content-Type": "application/json",
                           "If-Match": "*"
                     },
                     "body": {
                           "displayName": "Touring Bicycle v2"
                     }
              },
              {
                     "method": "PATCH",
                     "url": "items(7ce0af2e-0963-460f-9b1f-0014aea3e117)/picture(7ce0af2e-0963-460f-9b1f-0014aea3e117)/contentValue",
                     "headers": {
                           "Company": "CRONUS International Ltd.",
                           "Content-Type": "application/json",
                           "If-Match": "*"
                     },
                     "body": {
                           "value": "Picture Blob"
                     }
              },      
              {
                     "method": "PATCH",
                     "url": "items(7ce0af2e-0963-460f-9b1f-0014aea3e117)",
                     "headers": {
                           "Company": "CRONUS International Ltd.",
                           "Content-Type": "application/json",
                           "If-Match": "*"
                     },
                     "body": {
                           "type": "Invalid Type"
                     }
              }
       ]
}

```

### Response

The following response includes successful responses for the first two inner requests, and an error for the last inner request. Because the `Isolation: snapshot` header was present in the batch request, none of the changes made by either of the successful inner requests are applied after completion of the batch request.

```json
{
       "responses": [
              {
                     "id": null,
                     "status": 200,
                     "headers": {
                           "content-type": "application/json; odata.metadata=minimal",
                           "odata-version": "4.0"
                     },
                     "body": {
                           "displayName": "Touring Bicycle v2",
                           // ...
                     }
              },
              {
                     "id": null,
                     "status": 204,
                     "headers": {}
              },
              {
                     "id": null,
                     "status": 400,
                     "headers": {
                           "content-type": "application/json; odata.metadata=minimal",
                           "odata-version": "4.0"
                     },
                     "body": {
                           "error": {
                                  "code": "Unknown",
                                  "message": "'Invalid Type' is not an option. The existing options are: Inventory,Service,Non-Inventory  CorrelationId:  x."
                           }
                     }
              }
       ]
}
```

## See Also
<!-- [Using Deltas With APIs](devenv-connect-apps-delta.md)-->  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)  
[Performance Articles For Developers](../performance/performance-developer.md)  
