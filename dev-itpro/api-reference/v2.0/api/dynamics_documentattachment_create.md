---
title: Create documentAttachments
description: Creates a document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/08/2023
ms.author: solsen
---

# Create documentAttachments

Creates a document attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/documentAttachments({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **documentAttachment**, the **documentAttachment** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **documentAttachment** object.

## Response

If successful, this method returns ```201 Created``` response code and a **documentAttachment** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/documentAttachments({id})
Content-type: application/json
{
    "id" : "",
    "fileName" : "",
    "byteSize" : "",
    "attachmentContent" : "",
    "parentType" : "",
    "parentId" : "",
    "lineNumber" : "",
    "documentFlowSales" : "",
    "documentFlowPurchase" : "",
    "lastModifiedDateTime" : ""
}
```

**Response**

Here is an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "",
    "fileName" : "",
    "byteSize" : "",
    "attachmentContent" : "",
    "parentType" : "",
    "parentId" : "",
    "lineNumber" : "",
    "documentFlowSales" : "",
    "documentFlowPurchase" : "",
    "lastModifiedDateTime" : ""
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[documentAttachment](../resources/dynamics_documentAttachment.md)  
[GET documentAttachment](dynamics_documentattachment_get.md)  
[DELETE documentAttachment](dynamics_documentattachment_delete.md)  
[PATCH documentAttachment](dynamics_documentattachment_update.md)  
