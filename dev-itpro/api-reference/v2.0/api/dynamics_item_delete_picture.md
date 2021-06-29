---
title: Delete item picture  
description: Deletes the picture of the item in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Delete item picture

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes the picture of the item in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({companyId})/items({itemId})/picture
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **items**, the **items** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the default dimensions for the item and corresponding dimension.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({companyId})/items({itemId})/picture
```

**Response** 

No Content.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Item](../resources/dynamics_item.md)  
[Create item defaultDimensions](dynamics_item_create_defaultdimensions.md)  
[Update item defaultDimensions](dynamics_item_update_defaultdimensions.md)  
[Get item defaultDimensions](dynamics_item_get_defaultdimensions.md)  
