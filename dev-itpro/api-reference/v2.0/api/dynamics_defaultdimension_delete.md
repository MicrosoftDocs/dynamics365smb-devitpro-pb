---
title: Delete defaultDimensions from an entity| Microsoft Docs
description: Deletes the default dimensions of the item in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete defaultDimensions from entities

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes the default dimensions of the item in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/defaultDimensions({id})
DELETE businesscentralPrefix/companies({id})/items({id})/defaultDimensions({id})
DELETE businesscentralPrefix/companies({id})/customers({id})/defaultDimensions({id})
DELETE businesscentralPrefix/companies({id})/vendors({id})/defaultDimensions({id})
DELETE businesscentralPrefix/companies({id})/employees({id})/defaultDimensions({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the specific entity, the entity will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the default dimensions for the entity and corresponding dimension.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({companyId})/items({itemId})/defaultDimensions({itemId},{dimensionId})
```

**Response** 

No Content.

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[defaultdimension](../resources/dynamics_defaultdimension.md)    
[Get defaultdimension](dynamics_defaultdimension_Get.md)    
[Create defaultdimension](dynamics_defaultdimension_Create.md)    
[Update defaultdimension](dynamics_defaultdimension_Update.md)    
