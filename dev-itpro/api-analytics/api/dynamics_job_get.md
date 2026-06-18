---
title: Get jobs
description: Gets a job object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get jobs

Retrieve the properties and relationships of a job object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/jobs
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **job** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/jobs
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "no": "10000",
    "description": "ATHENS Desk",
    "billToCustomerNo": "10000",
    "creationDate": "2026-01-15",
    "startingDate": "2026-01-01",
    "endingDate": "2026-06-30",
    "status": "Released",
    "jobPostingGroup": "DOMESTIC",
    "blocked": "",
    "projectManager": "",
    "complete": false
}
```

## Related information

[job](../resources/dynamics_job.md)
