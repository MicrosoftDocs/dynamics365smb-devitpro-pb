---
title: Get purchaseValueEntries
description: Gets a purchaseValueEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseValueEntries

Retrieve the properties and relationships of a purchaseValueEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/purchaseValueEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseValueEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/purchaseValueEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": 1001,
    "entryType": "Sale",
    "documentNo": "103001",
    "documentType": "Invoice",
    "vendorNo": "20000",
    "postingDate": "2026-01-15",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "dimensionSetID": 102,
    "invoicedQuantity": 10.00,
    "costAmountActual": 25.5,
    "salespersonPurchaserCode": "JR",
    "returnReasonCode": "RETURN",
    "projectNo": "10000",
    "adjustment": false,
    "capacityLedgerEntryNo": 1002,
    "discountAmount": 1500.00,
    "itemLedgerEntryNo": 1003,
    "itemLedgerEntryType": "Sale"
}
```

## Related information

[purchaseValueEntry](../resources/dynamics_purchasevalueentry.md)
