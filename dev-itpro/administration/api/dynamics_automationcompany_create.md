---
title: Create automationCompany | Microsoft Docs
description: Creates an automation company object in Dynamics 365 Business Central.
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
# Create automationCompany

Creates an automation company in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```
POST /microsoft/automation/v2.0/companies({companyId})/automationCompanies
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **automationCompany** object.

## Response

If successful, this method returns ```201 Created``` response code and a **automationCompany** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/automationCompanies
Content-type: application/json
{
    "name": "CRONUS",
    "evaluationCompany": false,
    "displayName": "CRONUS",
    "businessProfileId": ""
}
```

**Response**
Here is an example of the response.
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "666631a8-8775-eb11-bb56-000d3a298ab3",
    "name" : "CRONUS",
    "evaluationCompany" : false,
    "displayName" : "CRONUS",
    "businessProfileId" : ""
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[automationCompany](../resources/dynamics_automationCompany.md)