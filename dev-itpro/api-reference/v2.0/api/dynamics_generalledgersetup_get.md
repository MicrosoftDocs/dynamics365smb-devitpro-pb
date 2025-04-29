---
title: Get generalLedgerSetup
description: Gets a general ledger setup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 01/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# Get generalLedgerSetup

Retrieves the properties and relationships of a general ledger setup object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/generalLedgerSetup({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **generalLedgerSetup** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/generalLedgerSetups({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "00000000-0000-0000-0000-000000000001",
    "allowPostingFrom": "2025-01-01",
    "allowPostingTo": "2025-12-31",
    "additionalReportingCurrency": "EUR",
    "localCurrencyCode": "USD",
    "localCurrencySymbol": "$",
    "lastModifiedDateTime": "2025-03-15T09:45:12Z",
    "allowQueryFromConsolidation": true
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[generalLedgerSetup](../resources/dynamics_generalLedgerSetup.md)
