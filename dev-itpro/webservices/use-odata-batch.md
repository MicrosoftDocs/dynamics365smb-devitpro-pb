---
title: Using OData Transactional $batch Requests
description: How to specify that all inner requests in a certain OData $batch request are processed in a transactional way in Business Central.
ms.custom: na
ms.date: 02/09/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
---

# Using OData Transactional $batch Requests

> **APPLIES TO:** Business Central 2020 release wave 2 (version 17.1) and later

It's possible to specify that all inner requests in a certain OData $batch request are processed in a transactional way. If one of the inner requests fails after another request (or requests) has committed changes, all changes within a batch will be reverted as if the batch request never happened. Transactional $batch requests are useful in scenarios where a single business operation spans multiple requests, because they prevent adverse effects if parts of the operation fail. Also, they can improve performance by reducing the number of requests the client needs to do when errors occur.

## Enabling OData transactional batch behavior

To enable transactional batch behavior, include the `Isolation: snapshot` header with the $batch request.

## Example

```
POST businesscentralPrefix/api/v2.0/$batch HTTP/1.1
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |   Bearer {token}. Required.|
|Content-Type   | application/json. Required for JSON Batch content.|
|Accept |  application/json|
|Isolation|snapshot|

## Request body

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

## Response

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
 [OData Web Services](OData-Web-Services.md)   
 [Using OData to Return-Obtain a JSON Document](return-obtain-json-document.md)   
