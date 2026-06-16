---
title: Get customerLedgerEntries
description: Gets a customerLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get customerLedgerEntries

Retrieve the properties and relationships of a customerLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/customerLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **customerLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/customerLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "cleEntryNo": 1001,
    "cleDueDate": "2026-02-28",
    "cleOpen": true,
    "clePostingDate": "2026-01-15",
    "cleDocumentDate": "2026-01-10",
    "cleDimensionSetID": 102,
    "cleClosedAtDate": "2025-12-31",
    "cleReasonCode": "RETURN",
    "dcleEntryNo": 1002,
    "dclePostingDate": "2026-01-15",
    "dcleLedgerEntryAmount": true,
    "dcleEntryType": "Sale",
    "dcleDocumentType": "Invoice",
    "dcleDocumentNo": "103001",
    "dcleInitialEntryDueDate": "2026-02-28",
    "dcleAmountLCY": 1500.00,
    "dcleCustomerNo": "10000",
    "dcleApplicationNo": 0,
    "dcleAppliedCustLedgerEntryNo": 1003,
    "salesInvHeaderDocumentNo": "103001",
    "salesInvHeaderPaymentTermsCode": "1M(8D)",
    "salesInvHeaderPmtDiscountDate": "2026-01-25"
}
```

## Related information

[customerLedgerEntry](../resources/dynamics_customerledgerentry.md)
