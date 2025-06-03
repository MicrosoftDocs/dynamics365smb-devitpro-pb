---
title: Create fixedAssetLocations
description: Creates a fixed asset location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create fixedAssetLocations

Creates a fixed asset location in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/fixedAssetLocations({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **fixedAssetLocation** object.

## Response

If successful, this method returns ```201 Created``` response code and a **fixedAssetLocation** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssetLocations({id})
Content-type: application/json
{
    "code": "WAREHOUSE",
    "displayName": "Main Warehouse Facility"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "LOC0003",
    "code": "WAREHOUSE",
    "displayName": "Main Warehouse Facility",
    "lastModifiedDateTime": "2025-04-29T16:25:42Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAssetLocation](../resources/dynamics_fixedAssetLocation.md)  
[GET fixedAssetLocation](dynamics_fixedassetlocation_get.md)  
[DELETE fixedAssetLocation](dynamics_fixedassetlocation_delete.md)  
[PATCH fixedAssetLocation](dynamics_fixedassetlocation_update.md)
