---
title: Update documentAttachments
description: Updates a  document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/08/2023
ms.author: solsen
---

# Update documentAttachments

Updates the properties of a document attachment object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/documentAttachments({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **documentAttachment**, the **document attachment** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **documentAttachment** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/documentAttachments({id})
Content-type: application/json
{
    "id" : ,
    "fileName" :
}
```

**Response**

Here is an example of the response.


```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id" : ,
    "fileName" : ,
    "byteSize" : ,
    "attachmentContent" : ,
    "parentType" : ,
    "parentId" : ,
    "lineNumber" : ,
    "documentFlowSales" : ,
    "documentFlowPurchase" : ,
    "lastModifiedDateTime" :
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[documentAttachment](../resources/dynamics_documentAttachment.md)  
[GET documentAttachment](dynamics_documentattachment_get.md)  
[DELETE documentAttachment](dynamics_documentattachment_delete.md)  
[POST documentAttachment](dynamics_documentattachment_create.md)  
