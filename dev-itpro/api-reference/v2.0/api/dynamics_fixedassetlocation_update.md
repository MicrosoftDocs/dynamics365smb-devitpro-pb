---
title: Update fixedAssetLocations
description: Updates a  fixed asset location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Update fixedAssetLocations

Updates the properties of a fixed asset location object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/fixedAssetLocations({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **fixedAssetLocation**, the **fixed asset location** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **fixedAssetLocation** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssetLocations({id})
Content-type: application/json
{
    "id": "LOC0003",
    "displayName": "Main Warehouse Facility - East Wing"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "LOC0003",
    "code": "WAREHOUSE",
    "displayName": "Main Warehouse Facility - East Wing",
    "lastModifiedDateTime": "2025-04-29T16:48:37Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAssetLocation](../resources/dynamics_fixedAssetLocation.md)  
[GET fixedAssetLocation](dynamics_fixedassetlocation_get.md)  
[DELETE fixedAssetLocation](dynamics_fixedassetlocation_delete.md)  
[POST fixedAssetLocation](dynamics_fixedassetlocation_create.md)
