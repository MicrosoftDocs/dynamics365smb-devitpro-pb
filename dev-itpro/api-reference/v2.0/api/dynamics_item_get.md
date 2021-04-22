---
title: Get items | Microsoft Docs
description: Gets an item object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get items

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an item object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/items({id})
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **items** object in the response body.

## Example
**Request**

Here is an example of the request.
```json
GET https://graph.microsoft.com/v2.0businesscentralPrefix/companies({id})/items({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "1896-S",
    "displayName": "ATHENS Desk",
    "type": "Inventory",
    "itemCategoryId": "e21a6a90-44e3-ea11-bb43-000d3a2feca1",
    "itemCategoryCode": "TABLE",
    "blocked": false,
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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[item](../resources/dynamics_item.md)    
[Delete item](dynamics_item_Delete.md)    
[Create item](dynamics_item_Create.md)    
[Update item](dynamics_item_Update.md)    
