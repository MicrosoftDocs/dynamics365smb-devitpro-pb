---
title: (v1.0) Update items
description: (v1.0) Updates an item object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update items (v1.0)
Update the properties of an item object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/items({id})
```

## Request headers (v1.0)

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json.        |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **items**, the **items** will not be updated. |

## Request body (v1.0)
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response (v1.0)
If successful, this method returns a ```200 OK``` response code and an updated **items** object in the response body.

## Example (v1.0)
**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/items({id})
Content-type: application/json

{
  "displayName": "ATHENS Desk - blocked",
  "blocked": true
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

{
  "id": "id-value",
  "number": "1896-S",
  "displayName": "ATHENS Desk - blocked",
  "type": "Inventory",
  "blocked": true,
  "baseUnitOfMeasureId": "id-value", 
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
  "taxGroupId": "id-value",
  "taxGroupCode": "FURNITURE",
  "lastModifiedDateTime": "2017-03-07T00:35:30.073Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  .



[Error Codes](../dynamics_error_codes.md)  
[Item](../resources/dynamics_item.md)  
[Get Item](../api/dynamics_item_get.md)  
[Post Item](../api/dynamics_create_item.md)  
[Delete Item](../api/dynamics_item_delete.md)  