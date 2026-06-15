---
title: Get vendorLedgerEntries
description: Gets a vendorLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get vendorLedgerEntries

Retrieve the properties and relationships of a vendorLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/vendorLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **vendorLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/vendorLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "vleEntryNo": "integer",
    "vleDueDate": "Date",
    "vleOpen": "boolean",
    "vlePostingDate": "Date",
    "vleDocumentDate": "Date",
    "vleDimensionSetID": "integer",
    "vleClosedAtDate": "Date",
    "vleReasonCode": "string",
    "dvleEntryNo": "integer",
    "dvlePostingDate": "Date",
    "dvleLedgerEntryAmount": "boolean",
    "dvleEntryType": "string",
    "dvleDocumentType": "string",
    "dvleDocumentNo": "string",
    "dvleInitialEntryDueDate": "Date",
    "dvleAmountLCY": "decimal",
    "dvleVendorNo": "string",
    "dvleApplicationNo": "integer",
    "dvleAppliedVendLedgerEntryNo": "integer",
    "purchInvHeaderDocumentNo": "string",
    "purchInvHeaderPaymentTermsCode": "string",
    "purchInvHeaderPmtDiscountDate": "Date"
}
```

## Related information

[vendorLedgerEntry](../resources/dynamics_vendorledgerentry.md)
