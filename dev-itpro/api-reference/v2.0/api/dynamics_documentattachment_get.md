---
title: Get documentAttachments
description: Gets a document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get documentAttachments

Retrieves the properties and relationships of a document attachment object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/documentAttachments({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **documentAttachment** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/documentAttachments({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "ATT00089",
    "fileName": "Invoice_10542.pdf",
    "byteSize": 245823,
    "attachmentContent": "JVBERi0xLjUKJeTl5OTlCjEgMCBvYmoKPDwKL1R5cGUgL0NhdGFsb2cKL1BhZ2VzIDIgMCBSCj4+CmVuZG9iagoyIDAgb2JqCjw8Ci9UeXBlIC9QYWdlcwo+PgplbmRvYmoKeHJlZgowIDMKMDAwMDAwMDAwMCiAgICAgIG4gCjAwMDAwMDAwMTAgMDAwMDAgbiAKMDAwMDAwMDA1MyAwMDAwMCBuIAp0cmFpbGVyCjw8Ci9Sb290IDEgMCBSCi9TaXplIDMKPj4KJWlzQmluYXJ5Cg==",
    "parentType": "Purchase Invoice",
    "parentId": "INV-10542",
    "lineNumber": 0,
    "documentFlowSales": false,
    "documentFlowPurchase": true,
    "lastModifiedDateTime": "2025-04-28T09:15:42Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[documentAttachment](../resources/dynamics_documentAttachment.md)  
[DELETE documentAttachment](dynamics_documentattachment_delete.md)  
[POST documentAttachment](dynamics_documentattachment_create.md)  
[PATCH documentAttachment](dynamics_documentattachment_update.md)
