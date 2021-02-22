---
title: Patch automationCompanies | Microsoft Docs
description: Updates a company object in Dynamics 365 Business Central.
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2020
ms.author: solsen
---

# Patch automationCompanies
Patches an automationCompany object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```
PATCH /microsoft/automation/{apiVersion}/companies({{companyid}})/automationCompanies
```

## Request headers
|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json.         |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **automationCompany**, the **automationCompany** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and a **automationCompany** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/automationCompanies
Content-type: application/json
If-Match:*
{
    "displayName": "My Company",
}

```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "2b8ea70b-1384-448d-b3d7-1d26c41f3cec",
    "name": "CRONUS USA, Inc.",
    "evaluationCompany": false,
    "displayName": "My Company",
    "businessProfileId": ""
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[AutomationCompany Resource Type](dynamics-microsoft-automation-automationCompany.md)  
[Get automationCompany](dynamics-microsoft-automation-automationCompanies-get.md)  
[Post automationCompany](dynamics-microsoft-automation-automationCompanies-post.md)  
[Delete automationCompany](dynamics-microsoft-automation-automationCompanies-delete.md)  