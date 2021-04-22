---
title: Create defaultDimensions for entities  
description: Creates a default dimensions of the item object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create defaultDimensions for entities

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates the default dimensions for entities in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/defaultDimensions({id})
POST businesscentralPrefix/companies({id})/items({id})/defaultDimensions({id})
POST businesscentralPrefix/companies({id})/customers({id})/defaultDimensions({id})
POST businesscentralPrefix/companies({id})/vendors({id})/defaultDimensions({id})
POST businesscentralPrefix/companies({id})/employees({id})/defaultDimensions({id})
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **defaultDimensions** object.

## Response
If successful, this method returns ```201 Created``` response code and a **defaultDimensions** object in the response body.

## Example

**Request**  
Here is an example of a request.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({companyId})/items({itemId})/defaultDimensions
POST https://{businesscentralPrefix}/api/v2.0/companies({companyId})/vendors({vendorId})/defaultDimensions
POST https://{businesscentralPrefix}/api/v2.0/companies({companyId})/employees({employeeId})/defaultDimensions
POST https://{businesscentralPrefix}/api/v2.0/companies({companyId})/customers({customerId})/defaultDimensions

```

**Request body**

```json
{
    "parentId":"b3fbe87a-61b8-4a6c-85de-0555f1627a67",
    "dimensionId":"d5fc81ea-8687-4e9d-9c49-7fde28ccdb1a",
    "dimensionValueId":"1045a902-070a-4d31-b2b1-b9431e9e5b26",
    "postingValidation":"Same Code"
}
```
**Response**

```json
{
    "id": "5b049aad-bde4-ea11-bbf2-00155df3a615",
    "parentId": "b3fbe87a-61b8-4a6c-85de-0555f1627a67",
    "dimensionId": "d5fc81ea-8687-4e9d-9c49-7fde28ccdb1a",
    "dimensionCode": "DEPARTMENT",
    "dimensionValueId": "1045a902-070a-4d31-b2b1-b9431e9e5b26",
    "dimensionValueCode": "SALES",
    "postingValidation": "Same Code"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[defaultdimension](../resources/dynamics_defaultdimension.md)    
[Get defaultdimension](dynamics_defaultdimension_Get.md)    
[Delete defaultdimension](dynamics_defaultdimension_Delete.md)    
[Update defaultdimension](dynamics_defaultdimension_Update.md)    
