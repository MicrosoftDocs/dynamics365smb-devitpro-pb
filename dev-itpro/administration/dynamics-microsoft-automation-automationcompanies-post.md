---
title: Create company | Microsoft Docs
description: Create a company in Dynamics 365 Business Central. 
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2020
ms.author: solsen
---

# Create company
Creates a company object in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```
POST /microsoft/automation/{apiVersion}/companies({companyId})/automationCompanies
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json          |

## Request body
In the request body, supply a JSON representation of a **automationCompany** object.

## Response
If successful, this method returns ```201 Created``` response code and a **automationCompany** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/automationCompanies
Content-type: application/json

{
    "name": "CRONUS",
    "evaluationCompany": false,
    "displayName": "CRONUS",
    "businessProfileId": ""
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[AutomationCompany Resource Type](dynamics-microsoft-automation-automationCompany.md)  
[Get automationCompany](dynamics-microsoft-automation-automationCompanies-get.md)  
[Update automationCompany](dynamics-microsoft-automation-automationCompanies-patch.md)  
[Delete automationCompany](dynamics-microsoft-automation-automationCompanies-delete.md)  