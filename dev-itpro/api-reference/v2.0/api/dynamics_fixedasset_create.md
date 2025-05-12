---
title: Create fixedAssets
description: Creates a fixed asset object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create fixedAssets

Creates a fixed asset in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/fixedAssets({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **fixedAsset** object.

## Response

If successful, this method returns ```201 Created``` response code and a **fixedAsset** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssets({id})
Content-type: application/json
{
    "number": "FA-1005",
    "displayName": "Company Vehicle - Ford Escape",
    "fixedAssetLocationCode": "MAIN",
    "fixedAssetLocationId": "LOC0001",
    "classCode": "VEHICLE",
    "subclassCode": "COMPANY",
    "blocked": false,
    "serialNumber": "1FMCU0F74MUA12345",
    "employeeNumber": "EM1042",
    "employeeId": "e2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "underMaintenance": false
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "FA000012",
    "number": "FA-1005",
    "displayName": "Company Vehicle - Ford Escape",
    "fixedAssetLocationCode": "MAIN",
    "fixedAssetLocationId": "LOC0001",
    "classCode": "VEHICLE",
    "subclassCode": "COMPANY",
    "blocked": false,
    "serialNumber": "1FMCU0F74MUA12345",
    "employeeNumber": "EM1042",
    "employeeId": "e2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "underMaintenance": false,
    "acquisitionDate": "2025-01-15",
    "depreciationStartingDate": "2025-01-15",
    "acquisitionCost": 32500.00,
    "depreciationMethod": "Straight-Line",
    "depreciationYears": 5,
    "bookValue": 29037.50,
    "lastModifiedDateTime": "2025-04-29T14:28:36Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAsset](../resources/dynamics_fixedAsset.md)  
[GET fixedAsset](dynamics_fixedasset_get.md)  
[DELETE fixedAsset](dynamics_fixedasset_delete.md)  
[PATCH fixedAsset](dynamics_fixedasset_update.md)
