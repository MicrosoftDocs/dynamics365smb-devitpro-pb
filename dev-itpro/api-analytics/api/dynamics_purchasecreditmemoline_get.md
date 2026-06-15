---
title: Get purchaseCreditMemoLines
description: Gets a purchaseCreditMemoLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseCreditMemoLines

Retrieve the properties and relationships of a purchaseCreditMemoLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/purchaseCreditMemoLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseCreditMemoLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/purchaseCreditMemoLines
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
    "purchaseCreditMemoDocumentNo": "string",
    "campaignNo": "string",
    "purchaserCode": "string"
}
```

## Related information

[purchaseCreditMemoLine](../resources/dynamics_purchasecreditmemoline.md)
