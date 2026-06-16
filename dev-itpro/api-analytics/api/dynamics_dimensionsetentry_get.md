---
title: Get dimensionSetEntries
description: Gets a dimensionSetEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get dimensionSetEntries

Retrieve the properties and relationships of a dimensionSetEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/dimensionSetEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **dimensionSetEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/dimensionSetEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "",
    "dimensionSetID": 102,
    "valueCount": 1,
    "dimension1ValueCode": "10000",
    "dimension1ValueName": "Adatum Corporation",
    "dimension2ValueCode": "10000",
    "dimension2ValueName": "Adatum Corporation",
    "dimension3ValueCode": "10000",
    "dimension3ValueName": "Adatum Corporation",
    "dimension4ValueCode": "10000",
    "dimension4ValueName": "Adatum Corporation",
    "dimension5ValueCode": "10000",
    "dimension5ValueName": "Adatum Corporation",
    "dimension6ValueCode": "10000",
    "dimension6ValueName": "Adatum Corporation",
    "dimension7ValueCode": "10000",
    "dimension7ValueName": "Adatum Corporation",
    "dimension8ValueCode": "10000",
    "dimension8ValueName": "Adatum Corporation"
}
```

## Related information

[dimensionSetEntry](../resources/dynamics_dimensionsetentry.md)
