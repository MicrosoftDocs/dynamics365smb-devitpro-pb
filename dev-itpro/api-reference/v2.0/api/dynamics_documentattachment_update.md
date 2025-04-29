---
title: Update documentAttachments
description: Updates a  document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
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
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **documentAttachment**, the **document attachment** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **documentAttachment** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/documentAttachments({id})
Content-type: application/json
{
    "fileName": "Updated_Invoice_10542.pdf",
    "documentFlowSales": true
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "ATT00089",
    "fileName": "Updated_Invoice_10542.pdf",
    "byteSize": 245823,
    "attachmentContent": "JVBERi0xLjUKJeTl5OTlCjEgMCBvYmoKPDwKL1R5cGUgL0NhdGFsb2cKL1BhZ2VzIDIgMCBSCj4+CmVuZG9iagoyIDAgb2JqCjw8Ci9UeXBlIC9QYWdlcwo+PgplbmRvYmoKeHJlZgowIDMKMDAwMDAwMDAwMCiAgICAgIG4gCjAwMDAwMDAwMTAgMDAwMDAgbiAKMDAwMDAwMDA1MyAwMDAwMCBuIAp0cmFpbGVyCjw8Ci9Sb290IDEgMCBSCi9TaXplIDMKPj4KJWlzQmluYXJ5Cg==",
    "parentType": "Purchase Invoice",
    "parentId": "INV-10542",
    "lineNumber": 0,
    "documentFlowSales": true,
    "documentFlowPurchase": true,
    "lastModifiedDateTime": "2025-04-29T17:48:22Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[documentAttachment](../resources/dynamics_documentAttachment.md)  
[GET documentAttachment](dynamics_documentattachment_get.md)  
[DELETE documentAttachment](dynamics_documentattachment_delete.md)  
[POST documentAttachment](dynamics_documentattachment_create.md)
