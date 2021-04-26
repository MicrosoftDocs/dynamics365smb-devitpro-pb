---
title: CREATE itemCategories  
description: Creates a itemCategory object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create itemCategories

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create an item category object [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/itemCategories
POST businesscentralPrefix/companies({id})/items(id)/itemCategory({id})
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json         |

## Request body
In the request body, supply a JSON representation of an **itemCategories** object.

## Response
If successful, this method returns ```201 Created``` response code and an **itemCategories** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/itemCategories
Content-type: application/json

{
  "code": "CHAIR",
  "displayName": "Office Chair"
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
    "id": "dd1a6a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "CHAIR",
    "displayName": "Office Chair",
    "lastModifiedDateTime": "2020-08-21T00:24:31.777Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[itemcategory](../resources/dynamics_itemcategory.md)    
[Get itemcategory](dynamics_itemcategory_Get.md)    
[Delete itemcategory](dynamics_itemcategory_Delete.md)    
[Update itemcategory](dynamics_itemcategory_Update.md)    
