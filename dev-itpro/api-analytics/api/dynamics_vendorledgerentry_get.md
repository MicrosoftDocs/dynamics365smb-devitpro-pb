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
    "vleEntryNo": 1001,
    "vleDueDate": "2026-02-28",
    "vleOpen": true,
    "vlePostingDate": "2026-01-15",
    "vleDocumentDate": "2026-01-10",
    "vleDimensionSetID": 102,
    "vleClosedAtDate": "2025-12-31",
    "vleReasonCode": "RETURN",
    "dvleEntryNo": 1002,
    "dvlePostingDate": "2026-01-15",
    "dvleLedgerEntryAmount": true,
    "dvleEntryType": "Sale",
    "dvleDocumentType": "Invoice",
    "dvleDocumentNo": "103001",
    "dvleInitialEntryDueDate": "2026-02-28",
    "dvleAmountLCY": 1500.00,
    "dvleVendorNo": "10000",
    "dvleApplicationNo": 0,
    "dvleAppliedVendLedgerEntryNo": 1003,
    "purchInvHeaderDocumentNo": "103001",
    "purchInvHeaderPaymentTermsCode": "1M(8D)",
    "purchInvHeaderPmtDiscountDate": "2026-01-25"
}
```

## Related information

[vendorLedgerEntry](../resources/dynamics_vendorledgerentry.md)
