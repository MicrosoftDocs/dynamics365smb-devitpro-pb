---
title: Get generalLedgerAccountCategories
description: Gets a generalLedgerAccountCategory object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get generalLedgerAccountCategories

Retrieve the properties and relationships of a generalLedgerAccountCategory object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/generalLedgerAccountCategories
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **generalLedgerAccountCategory** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/generalLedgerAccountCategories
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": 1001,
    "parentEntryNo": 1002,
    "description": "ATHENS Desk",
    "presentationOrder": "",
    "siblingSequenceNo": 1,
    "indentation": 0,
    "accountCategory": "",
    "incomeBalance": "Income Statement",
    "additionalReportDefinition": "",
    "systemGenerated": false,
    "hasChildren": false
}
```

## Related information

[generalLedgerAccountCategory](../resources/dynamics_generalledgeraccountcategory.md)
