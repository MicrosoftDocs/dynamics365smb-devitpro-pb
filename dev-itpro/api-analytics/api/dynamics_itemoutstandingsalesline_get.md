---
title: Get itemOutstandingSalesLines
description: Gets a itemOutstandingSalesLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get itemOutstandingSalesLines

Retrieve the properties and relationships of a itemOutstandingSalesLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/itemOutstandingSalesLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **itemOutstandingSalesLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/itemOutstandingSalesLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "salesOrderNo": "10000",
    "documentType": "Invoice",
    "customerNo": "10000",
    "orderDate": "2026-01-12",
    "salespersonCode": "JR",
    "salesLineDocumentType": "Invoice",
    "documentNo": "103001",
    "lineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "unitCostLCY": 25.5,
    "outstandingQuantity": 10.00,
    "dimensionSetID": 102
}
```

## Related information

[itemOutstandingSalesLine](../resources/dynamics_itemoutstandingsalesline.md)
