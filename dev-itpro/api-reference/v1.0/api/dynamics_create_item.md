---
title: (v1.0) Create items
description: (v1.0) Creates an item object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create items (v1.0)
Create an item in [!INCLUDE[prod_short](../../../includes/prod_short.md)] for use on invoices, quotes, etc.

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/items
```

## Request headers (v1.0)

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json         |

## Request body (v1.0)
In the request body, supply a JSON representation of an **items** object.
## Response (v1.0)
If successful, this method returns ```201 Created``` response code and an **items** object in the response body.

## Example (v1.0)
**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/items
Content-type: application/json

{
  "number": "1896-S",
  "displayName": "ATHENS Desk",
  "type": "Inventory",
  "blocked": false,
  "baseUnitOfMeasure": {
    "unitCode": "PCS",
    "unitName": "Piece",
    "symbol": "",
    "unitConversion": null
  },
  "gtin": "",
  "itemCategory": {
    "categoryId": "TABLE", 
    "description": "Assorted Tables"
  },
  "inventory": 0,
  "unitPrice": 1000.8,
  "priceIncludesTax": false,
  "unitCost": 780.7,
  "taxGroupCode": "FURNITURE"
} 
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "number": "1896-S",
  "displayName": "ATHENS Desk",
  "lastModifiedDateTime": "2015-11-09T02:14:32Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
  
[Item](../resources/dynamics_item.md)  
[Get Item](../api/dynamics_item_get.md)  
[Patch item](../api/dynamics_item_update.md)  
[Delete Item](../api/dynamics_item_delete.md)  