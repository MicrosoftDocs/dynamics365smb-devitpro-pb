---
title: Get purchaseInvoiceLines
description: Gets a purchaseInvoiceLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseInvoiceLines

Retrieve the properties and relationships of a purchaseInvoiceLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/purchaseInvoiceLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseInvoiceLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/purchaseInvoiceLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "postingDate": "Date",
    "type": "string",
    "description": "string",
    "documentNo": "string",
    "lineNo": "integer",
    "no": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "returnReasonCode": "string",
    "expectedReceiptDate": "Date",
    "dimensionSetID": "integer",
    "projectNo": "string",
    "payToVendorNo": "string",
    "buyFromVendorNo": "string",
    "purchaseInvoiceDocumentNo": "string",
    "campaignNo": "string",
    "purchaserCode": "string",
    "quoteNo": "string"
}
```

## Related information

[purchaseInvoiceLine](../resources/dynamics_purchaseinvoiceline.md)
