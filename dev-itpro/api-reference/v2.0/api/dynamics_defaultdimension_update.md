---
title: Update defaultDimensions for entities 
description: Updates the item default dimensions in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update defaultDimensions for entities

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the default dimensions of entities in [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/defaultDimensions({id})
PATCH businesscentralPrefix/companies({id})/items({id})/defaultDimensions({id})
PATCH businesscentralPrefix/companies({id})/customers({id})/defaultDimensions({id})
PATCH businesscentralPrefix/companies({id})/vendors({id})/defaultDimensions({id})
PATCH businesscentralPrefix/companies({id})/employees({id})/defaultDimensions({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

> [!NOTE]  
> You cannot modify parentId, dimensionId or dimensionCode fields, because these are key fields, and rename is not allowed in Default Dimension record.

## Response
If successful, this method returns a `200 OK` response code and an updated default dimensions for the entity in the response body. 

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({companyId})/items({itemId})/defaultDimensions({itemId},{dimensionId})
```

**Request body**

```
{
  "dimensionValueId":"1045a902-070a-4d31-b2b1-b9431e9e5b26",
  "postingValidation":"Same Code"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "5b049aad-bde4-ea11-bbf2-00155df3a615",
    "parentId": "53049aad-bde4-ea11-bbf2-00155df3a615",
    "dimensionId": "1045a902-070a-4d31-b2b1-b9431e9e5b26",
    "dimensionCode": "DEPARTMENT",
    "dimensionValueId": "49c99ea7-bde4-ea11-bbf2-00155df3a615",
    "dimensionValueCode": "SALES",
    "postingValidation": "Same Code"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[defaultdimension](../resources/dynamics_defaultdimension.md)    
[Get defaultdimension](dynamics_defaultdimension_Get.md)    
[Delete defaultdimension](dynamics_defaultdimension_Delete.md)    
[Create defaultdimension](dynamics_defaultdimension_Create.md)    
