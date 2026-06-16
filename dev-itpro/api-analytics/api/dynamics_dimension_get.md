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
    "dim1Code": "10000",
    "dim1Name": "Adatum Corporation",
    "dim1Caption": "",
    "dim2Code": "10000",
    "dim2Name": "Adatum Corporation",
    "dim2Caption": "",
    "dim3Code": "10000",
    "dim3Name": "Adatum Corporation",
    "dim3Caption": "",
    "dim4Code": "10000",
    "dim4Name": "Adatum Corporation",
    "dim4Caption": "",
    "dim5Code": "10000",
    "dim5Name": "Adatum Corporation",
    "dim5Caption": "",
    "dim6Code": "10000",
    "dim6Name": "Adatum Corporation",
    "dim6Caption": "",
    "dim7Code": "10000",
    "dim7Name": "Adatum Corporation",
    "dim7Caption": "",
    "dim8Code": "10000",
    "dim8Name": "Adatum Corporation",
    "dim8Caption": ""
}
```

## Related information

[dimension](../resources/dynamics_dimension.md)
