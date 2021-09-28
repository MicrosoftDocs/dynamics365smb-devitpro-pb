---
title: Get scheduledJob
description: Gets a scheduled job object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get scheduledJob

Retrieves the properties and relationships of a scheduled job object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


```
GET /microsoft/automation/v2.0/companies({companyId})/scheduledJobs({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **scheduledJob** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/scheduledJobs({id})
```

**Response**
Here is an example of the response.

```json
{
    "id" : "26066f96-8775-eb11-bb56-000d3a298ab3",
    "category" : "APIUSERJOB",
    "status" : "In Progress",
    "description" : "Create new users from Azure AD API job",
    "errorMessage" : ""
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[scheduledJob](../resources/dynamics_scheduledJob.md)