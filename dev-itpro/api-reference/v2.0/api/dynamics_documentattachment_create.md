---
title: Create documentAttachments
description: Creates a document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
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

## Request body

In the request body, supply a JSON representation of a **documentAttachment** object.

## Response

If successful, this method returns ```201 Created``` response code and a **documentAttachment** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/documentAttachments({id})
Content-type: application/json
{
    "fileName": "Invoice_10542.pdf",
    "byteSize": 245823,
    "attachmentContent": "JVBERi0xLjUKJeTl5OTlCjEgMCBvYmoKPDwKL1R5cGUgL0NhdGFsb2cKL1BhZ2VzIDIgMCBSCj4+CmVuZG9iagoyIDAgb2JqCjw8Ci9UeXBlIC9QYWdlcwo+PgplbmRvYmoKeHJlZgowIDMKMDAwMDAwMDAwMCiAgICAgIG4gCjAwMDAwMDAwMTAgMDAwMDAgbiAKMDAwMDAwMDA1MyAwMDAwMCBuIAp0cmFpbGVyCjw8Ci9Sb290IDEgMCBSCi9TaXplIDMKPj4KJWlzQmluYXJ5Cg==",
    "parentType": "Purchase Invoice",
    "parentId": "INV-10542",
    "documentFlowPurchase": true
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
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
    "lastModifiedDateTime": "2025-04-29T14:25:36Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[documentAttachment](../resources/dynamics_documentAttachment.md)  
[GET documentAttachment](dynamics_documentattachment_get.md)  
[DELETE documentAttachment](dynamics_documentattachment_delete.md)  
[PATCH documentAttachment](dynamics_documentattachment_update.md)
