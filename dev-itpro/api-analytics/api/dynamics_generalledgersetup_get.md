---
title: Get generalLedgerSetups
description: Gets a generalLedgerSetup object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get generalLedgerSetups

Retrieve the properties and relationships of a generalLedgerSetup object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/generalLedgerSetups
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **generalLedgerSetup** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/generalLedgerSetups
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "primaryKey": "",
    "shortcutDimension1Code": "10000",
    "shortcutDimension2Code": "10000",
    "shortcutDimension3Code": "10000",
    "shortcutDimension4Code": "10000",
    "shortcutDimension5Code": "10000",
    "shortcutDimension6Code": "10000",
    "shortcutDimension7Code": "10000",
    "shortcutDimension8Code": "10000",
    "localCurrencyCode": "10000"
}
```

## Related information

[generalLedgerSetup](../resources/dynamics_generalledgersetup.md)
