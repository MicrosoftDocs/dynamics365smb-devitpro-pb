---
title: Get manufacturingProdOrderComponents
description: Gets a manufacturingProdOrderComponent object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get manufacturingProdOrderComponents

Retrieve the properties and relationships of a manufacturingProdOrderComponent object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingProdOrderComponents
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **manufacturingProdOrderComponent** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingProdOrderComponents
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "prodOrderStatus": "Released",
    "prodOrderNo": "10000",
    "prodOrderLineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "expectedQtyBase": 10.00,
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "routingLinkCode": "10000",
    "dimensionSetID": 102,
    "costAmount": 25.5,
    "locationName": "Blue Warehouse",
    "auxiliaryIndex1": 1
}
```

## Related information

[manufacturingProdOrderComponent](../resources/dynamics_manufacturingprodordercomponent.md)
