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
    "id": "GUID",
    "dimensionSetID": "integer",
    "valueCount": "integer",
    "dimension1ValueCode": "string",
    "dimension1ValueName": "string",
    "dimension2ValueCode": "string",
    "dimension2ValueName": "string",
    "dimension3ValueCode": "string",
    "dimension3ValueName": "string",
    "dimension4ValueCode": "string",
    "dimension4ValueName": "string",
    "dimension5ValueCode": "string",
    "dimension5ValueName": "string",
    "dimension6ValueCode": "string",
    "dimension6ValueName": "string",
    "dimension7ValueCode": "string",
    "dimension7ValueName": "string",
    "dimension8ValueCode": "string",
    "dimension8ValueName": "string"
}
```

## Related information

[dimensionSetEntry](../resources/dynamics_dimensionsetentry.md)
