---
title: Get fixedAssetLocations
description: Gets a fixed asset location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get fixedAssetLocations

Retrieves the properties and relationships of a fixed asset location object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/fixedAssetLocations({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **fixedAssetLocation** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssetLocations({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "LOC0003",
    "code": "WAREHOUSE",
    "displayName": "Main Warehouse Facility",
    "lastModifiedDateTime": "2025-04-15T16:25:42Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAssetLocation](../resources/dynamics_fixedAssetLocation.md)  
[DELETE fixedAssetLocation](dynamics_fixedassetlocation_delete.md)  
[POST fixedAssetLocation](dynamics_fixedassetlocation_create.md)  
[PATCH fixedAssetLocation](dynamics_fixedassetlocation_update.md)
