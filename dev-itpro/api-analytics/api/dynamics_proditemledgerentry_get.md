---
title: Get prodItemLedgerEntries
description: Gets a prodItemLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get prodItemLedgerEntries

Retrieve the properties and relationships of a prodItemLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/prodItemLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **prodItemLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/prodItemLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryType": "string",
    "orderType": "string",
    "orderNo": "string",
    "orderLineNo": "integer",
    "postingDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "serialNo": "string",
    "lotNo": "string",
    "quantity": "decimal",
    "dimensionSetID": "integer",
    "positive": "boolean",
    "costAmountActual": "decimal",
    "locationName": "string"
}
```

## Related information

[prodItemLedgerEntry](../resources/dynamics_proditemledgerentry.md)
