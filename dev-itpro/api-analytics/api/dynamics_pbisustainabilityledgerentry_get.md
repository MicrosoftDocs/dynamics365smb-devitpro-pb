---
title: Get pbiSustainabilityLedgerEntries
description: Gets a pbiSustainabilityLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get pbiSustainabilityLedgerEntries

Retrieve the properties and relationships of a pbiSustainabilityLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/pbiSustainabilityLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **pbiSustainabilityLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/pbiSustainabilityLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "sustainAccountNo": "10000",
    "entryNo": 1001,
    "postingDate": "2026-01-15",
    "documentType": "Invoice",
    "emissionco2": 100.00,
    "emissionch4": 100.00,
    "emissionN2O": 100.00,
    "emissionCo2e": 100.00,
    "carbonFee": 100.00,
    "waterIntensity": 100.00,
    "dischargedIntoWater": 100.00,
    "wasteIntensity": 100.00,
    "dimensionSetID": 102,
    "responsibilityCenter": "",
    "countryRegionCode": "US",
    "description": "ATHENS Desk",
    "waterType": "",
    "waterWasteIntensityType": ""
}
```

## Related information

[pbiSustainabilityLedgerEntry](../resources/dynamics_pbisustainabilityledgerentry.md)
