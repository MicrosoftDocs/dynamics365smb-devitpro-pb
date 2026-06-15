---
title: Get pbiSustainabilityLedgerEntries
description: Gets a pbiSustainabilityLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "sustainAccountNo": "string",
    "entryNo": "integer",
    "postingDate": "Date",
    "documentType": "string",
    "emissionco2": "decimal",
    "emissionch4": "decimal",
    "emissionN2O": "decimal",
    "emissionCo2e": "decimal",
    "carbonFee": "decimal",
    "waterIntensity": "decimal",
    "dischargedIntoWater": "decimal",
    "wasteIntensity": "decimal",
    "dimensionSetID": "integer",
    "responsibilityCenter": "string",
    "countryRegionCode": "string",
    "description": "string",
    "waterType": "string",
    "waterWasteIntensityType": "string"
}
```

## Related information

[pbiSustainabilityLedgerEntry](../resources/dynamics_pbisustainabilityledgerentry.md)
