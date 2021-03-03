---
title: Get automationCompany | Microsoft Docs
description: Gets an automation company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get automationCompany

Retrieves the properties and relationships of an automation company object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```
GET /microsoft/automation/v2.0/companies({companyId})/automationCompanies({automationCompanyId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **automationCompany** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/automationCompanies({automationCompanyId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "3496bbf8-fcae-4e48-a4f8-cb17c27de0b3",
    "name": "CRONUS USA, Inc.",
    "evaluationCompany": true,
    "displayName": "CRONUS USA, Inc.",
    "businessProfileId": ""
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[automationCompany](../resources/dynamics_automationCompany.md)
