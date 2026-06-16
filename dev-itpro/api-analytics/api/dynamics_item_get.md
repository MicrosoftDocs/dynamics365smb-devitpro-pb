---
title: Get items
description: Gets a item object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get items

Retrieve the properties and relationships of a item object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/items
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **item** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/items
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "itemNo": "1896-S",
    "itemDescription": "ATHENS Desk",
    "baseUnitofMeasure": "PCS",
    "unitCost": 25.5,
    "inventoryPostingGroup": "RESALE",
    "routingNo": "R-1000",
    "productionBomNo": "SP-BOM1001",
    "replenishmentSystem": "Purchase",
    "singleLevelCapOvhdCost": 25.5,
    "singleLevelCapacityCost": 25.5,
    "singleLevelMaterialCost": 25.5,
    "singleLevelMfgOvhdCost": 25.5,
    "singleLevelSubcontrdCost": 25.5,
    "singleLvlMatNonInvtCost": 25.5,
    "rolledUpCapOverheadCost": 25.5,
    "rolledUpCapacityCost": 25.5,
    "rolledUpMatNonInvtCost": 25.5,
    "rolledUpMaterialCost": 25.5,
    "rolledUpMfgOvhdCost": 25.5,
    "rolledUpSubcontractedCost": 25.5,
    "scrapPrc": 5.00,
    "itemCategoryCode": "FURNITURE",
    "itemCategoryDescription": "Furniture"
}
```

## Related information

[item](../resources/dynamics_item.md)
