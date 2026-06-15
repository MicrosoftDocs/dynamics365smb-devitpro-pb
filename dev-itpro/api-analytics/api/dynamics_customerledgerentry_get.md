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
    "cleEntryNo": "integer",
    "cleDueDate": "Date",
    "cleOpen": "boolean",
    "clePostingDate": "Date",
    "cleDocumentDate": "Date",
    "cleDimensionSetID": "integer",
    "cleClosedAtDate": "Date",
    "cleReasonCode": "string",
    "dcleEntryNo": "integer",
    "dclePostingDate": "Date",
    "dcleLedgerEntryAmount": "boolean",
    "dcleEntryType": "string",
    "dcleDocumentType": "string",
    "dcleDocumentNo": "string",
    "dcleInitialEntryDueDate": "Date",
    "dcleAmountLCY": "decimal",
    "dcleCustomerNo": "string",
    "dcleApplicationNo": "integer",
    "dcleAppliedCustLedgerEntryNo": "integer",
    "salesInvHeaderDocumentNo": "string",
    "salesInvHeaderPaymentTermsCode": "string",
    "salesInvHeaderPmtDiscountDate": "Date"
}
```

## Related information

[customerLedgerEntry](../resources/dynamics_customerledgerentry.md)
