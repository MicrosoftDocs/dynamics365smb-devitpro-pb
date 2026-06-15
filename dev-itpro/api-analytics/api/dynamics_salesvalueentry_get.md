---
title: Get salesValueEntries
description: Gets a salesValueEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get salesValueEntries

Retrieve the properties and relationships of a salesValueEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesValueEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesValueEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesValueEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "itemLedgerEntryNo": "integer",
    "itemLedgerEntryType": "string",
    "entryNo": "integer",
    "entryType": "string",
    "documentNo": "string",
    "documentType": "string",
    "invoicedQuantity": "decimal",
    "salesAmountActual": "decimal",
    "costAmountActual": "decimal",
    "costAmountNonInvtbl": "decimal",
    "costPostedToGL": "decimal",
    "customerNo": "string",
    "postingDate": "Date",
    "documentDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "dimensionSetID": "integer",
    "salespersonPurchaserCode": "string",
    "returnReasonCode": "string",
    "projectNo": "string"
}
```

## Related information

[salesValueEntry](../resources/dynamics_salesvalueentry.md)
