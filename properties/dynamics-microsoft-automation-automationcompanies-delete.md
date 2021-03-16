---
title: Delete a company | Microsoft Docs
description: Deletes a company object in Dynamics 365 Business Central.
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

# Delete companies
Retrieves the properties and relationships of an automationCompany object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
DELETE /microsoft/automation/{apiVersion}/companies({companyID})/automationCompanies({companyIDToBeDeleted})
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/automationCompanies({{companyIDToBeDeleted}})
```

**Response**

Here is an example of the response. 
```json
HTTP/1.1 204 No Content
```


## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[AutomationCompany Resource Type](dynamics-microsoft-automation-automationCompany.md)  
[Get automationCompany](dynamics-microsoft-automation-automationCompanies-get.md)  
[Post automationCompany](dynamics-microsoft-automation-automationCompanies-post.md)  
[Update automationCompany](dynamics-microsoft-automation-automationCompanies-patch.md)  
