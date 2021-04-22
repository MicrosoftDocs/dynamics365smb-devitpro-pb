---
title: Delete purchaseInvoiceLines | Microsoft Docs
description: Deletes a purchase invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete purchaseInvoiceLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Delete a purchase invoice line object from [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
DELETE businesscentralPrefix/companies({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
```

## Request headers

|Header         |Value                      |
|---------------|---------------------------|
|Authorization  |Bearer {token}. Required.  |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **purchaseInvoiceLines**, the **purchaseInvoiceLines** will not be deleted.  |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[purchaseinvoiceline](../resources/dynamics_purchaseinvoiceline.md)    
[Get purchaseinvoiceline](dynamics_purchaseinvoiceline_Get.md)    
[Create purchaseinvoiceline](dynamics_purchaseinvoiceline_Create.md)    
[Update purchaseinvoiceline](dynamics_purchaseinvoiceline_Update.md)    
