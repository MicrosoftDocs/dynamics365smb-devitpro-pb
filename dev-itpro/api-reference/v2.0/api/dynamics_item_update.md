---
title: Update items  
description: Updates an item object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Update items

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the properties of an item object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/items({id})
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json.        |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **items**, the **items** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **items** object in the response body.

## Example
**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/items({id})
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
    "id": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "1896-S",
    "displayName": "ATHENS Desk - blocked",
    "type": "Inventory",
    "itemCategoryId": "e21a6a90-44e3-ea11-bb43-000d3a2feca1",
    "itemCategoryCode": "TABLE",
    "blocked": true,
    "gtin": "",
    "inventory": 4,
    "unitPrice": 1000.8,
    "priceIncludesTax": false,
    "unitCost": 780.7,
    "taxGroupId": "9f196a90-44e3-ea11-bb43-000d3a2feca1",
    "taxGroupCode": "FURNITURE",
    "baseUnitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "baseUnitOfMeasureCode": "PCS",
    "lastModifiedDateTime": "2020-08-21T00:24:19.347Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[item](../resources/dynamics_item.md)    
[Get item](dynamics_item_Get.md)    
[Delete item](dynamics_item_Delete.md)    
[Create item](dynamics_item_Create.md)    
