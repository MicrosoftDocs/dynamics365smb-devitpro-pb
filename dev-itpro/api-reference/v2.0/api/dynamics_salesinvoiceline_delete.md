---
title: Delete salesInvoiceLines  
description: Deletes a sales invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Delete salesInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Delete a sales invoice line object from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/salesInvoices({id})/salesInvoiceLines({salesInvoiceLineId})
DELETE businesscentralPrefix/companies({id})/salesInvoiceLines({salesInvoiceLineId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **salesInvoiceLines**, the **salesInvoiceLines** won't be updated. |

## Request body
Don't supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It doesn't return anything in the response body.

## Example

**Request**

Here's an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices({id})/salesInvoiceLines({salesInvoiceLineId})
```

**Response** 

Here's an example of the response. 

```json
HTTP/1.1 204 No Content
```

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[salesinvoiceline](../resources/dynamics_salesinvoiceline.md)    
[Get salesinvoiceline](dynamics_salesinvoiceline_Get.md)    
[Create salesinvoiceline](dynamics_salesinvoiceline_Create.md)    
[Update salesinvoiceline](dynamics_salesinvoiceline_Update.md)    
