---
title: Update fixedAssets
description: Updates a fixed asset object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Update fixedAssets

Updates the properties of a fixed asset object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/fixedAssets({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **fixedAsset**, the **fixed asset** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **fixedAsset** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssets({id})
Content-type: application/json
{
    "id": "FA000012",
    "employeeNumber": "EM2068",
    "employeeId": "f3b6742a-44e3-ea11-bb43-000d3a2feca1",
    "underMaintenance": true,
    "fixedAssetLocationCode": "BRANCH",
    "fixedAssetLocationId": "LOC0002"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "FA000012",
    "number": "FA-1005",
    "displayName": "Company Vehicle - Ford Escape",
    "fixedAssetLocationCode": "BRANCH",
    "fixedAssetLocationId": "LOC0002",
    "classCode": "VEHICLE",
    "subclassCode": "COMPANY",
    "blocked": false,
    "serialNumber": "1FMCU0F74MUA12345",
    "employeeNumber": "EM2068",
    "employeeId": "f3b6742a-44e3-ea11-bb43-000d3a2feca1",
    "underMaintenance": true,
    "acquisitionDate": "2025-01-15",
    "depreciationStartingDate": "2025-01-15",
    "acquisitionCost": 32500.00,
    "depreciationMethod": "Straight-Line",
    "depreciationYears": 5,
    "bookValue": 29037.50,
    "lastModifiedDateTime": "2025-04-29T15:42:18Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAsset](../resources/dynamics_fixedAsset.md)  
[GET fixedAsset](dynamics_fixedasset_get.md)  
[DELETE fixedAsset](dynamics_fixedasset_delete.md)  
[POST fixedAsset](dynamics_fixedasset_create.md)
