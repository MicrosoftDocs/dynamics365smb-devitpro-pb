---
title: Get dimensions
description: Gets a dimension object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get dimensions

Retrieve the properties and relationships of a dimension object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/dimensions
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **dimension** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/dimensions
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "dim1Code": "string",
    "dim1Name": "string",
    "dim1Caption": "string",
    "dim2Code": "string",
    "dim2Name": "string",
    "dim2Caption": "string",
    "dim3Code": "string",
    "dim3Name": "string",
    "dim3Caption": "string",
    "dim4Code": "string",
    "dim4Name": "string",
    "dim4Caption": "string",
    "dim5Code": "string",
    "dim5Name": "string",
    "dim5Caption": "string",
    "dim6Code": "string",
    "dim6Name": "string",
    "dim6Caption": "string",
    "dim7Code": "string",
    "dim7Name": "string",
    "dim7Caption": "string",
    "dim8Code": "string",
    "dim8Name": "string",
    "dim8Caption": "string"
}
```

## Related information

[dimension](../resources/dynamics_dimension.md)
