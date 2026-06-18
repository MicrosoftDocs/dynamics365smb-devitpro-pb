---
title: Get pbiEmployees
description: Gets a pbiEmployee object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get pbiEmployees

Retrieve the properties and relationships of a pbiEmployee object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/pbiEmployees
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **pbiEmployee** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/pbiEmployees
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "no": "10000",
    "firstName": "Adatum Corporation",
    "lastName": "Adatum Corporation",
    "gender": "",
    "unionCode": "10000",
    "status": "Released",
    "casueofInactivty": "",
    "inactivedate": "2026-01-15",
    "groudForTermCode": "10000",
    "dateOfBirth": "2026-01-15"
}
```

## Related information

[pbiEmployee](../resources/dynamics_pbiemployee.md)
