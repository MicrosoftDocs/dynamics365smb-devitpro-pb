---
title: Get salesCrProjectLedgerEntries
description: Gets a salesCrProjectLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get salesCrProjectLedgerEntries

Retrieve the properties and relationships of a salesCrProjectLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesCrProjectLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesCrProjectLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesCrProjectLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "postingDate": "Date",
    "type": "string",
    "description": "string",
    "entryNo": "integer",
    "no": "string",
    "documentNo": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "totalPriceLCY": "decimal",
    "totalCostLCY": "decimal",
    "unitCostLCY": "decimal",
    "reasonCode": "string",
    "dimensionSetID": "integer",
    "projectNo": "string",
    "salesCreditDocumentNo": "string",
    "campaignNo": "string",
    "salespersonCode": "string",
    "opportunityNo": "string",
    "billToCustomerNo": "string",
    "sellToCustomerNo": "string"
}
```

## Related information

[salesCrProjectLedgerEntry](../resources/dynamics_salescrprojectledgerentry.md)
