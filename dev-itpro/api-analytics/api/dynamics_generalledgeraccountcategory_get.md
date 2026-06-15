---
title: Get generalLedgerAccountCategories
description: Gets a generalLedgerAccountCategory object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "entryNo": "integer",
    "parentEntryNo": "integer",
    "description": "string",
    "presentationOrder": "string",
    "siblingSequenceNo": "integer",
    "indentation": "integer",
    "accountCategory": "string",
    "incomeBalance": "string",
    "additionalReportDefinition": "string",
    "systemGenerated": "boolean",
    "hasChildren": "boolean"
}
```

## Related information

[generalLedgerAccountCategory](../resources/dynamics_generalledgeraccountcategory.md)
