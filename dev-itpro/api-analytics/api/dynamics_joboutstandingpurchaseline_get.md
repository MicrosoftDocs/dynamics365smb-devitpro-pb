---
title: Get jobOutstandingPurchaseLines
description: Gets a jobOutstandingPurchaseLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get jobOutstandingPurchaseLines

Retrieve the properties and relationships of a jobOutstandingPurchaseLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/jobOutstandingPurchaseLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobOutstandingPurchaseLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/jobOutstandingPurchaseLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "documentType": "Invoice",
    "documentNo": "103001",
    "no": "10000",
    "type": "Item",
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "expectedReceiptDate": "2026-01-18",
    "dimensionSetID": 102,
    "description": "ATHENS Desk",
    "auxiliaryIndex1": 1
}
```

## Related information

[jobOutstandingPurchaseLine](../resources/dynamics_joboutstandingpurchaseline.md)
