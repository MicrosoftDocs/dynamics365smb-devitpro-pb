---
title: Update user | Microsoft Docs
description: Updates a user object in Dynamics 365 Business Central.
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

# Patch user
Patches an automationCompany object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
PATCH /microsoft/automation/{apiVersion}/companies({companyid})/users({securityId})
```
## Request headers
|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json.        |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **user**, the **user** will not be updated.|

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and a **automationCompany** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/users({userSecurityId})
Content-type: application/json
If-Match:*
{
    "state": "Enabled",
    "expiryDate": "2035-01-01T21:03:53.444Z"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "userSecurityId": "7ae30772-481f-4895-a042-98f36e280680",
    "userName": "JOE",
    "displayName": "JOE JONES",
    "state": "Enabled",
    "expiryDate": "2035-01-01T21:03:53.443Z"
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[AutomationCompany Resource Type](dynamics-microsoft-automation-automationcompany.md)  
[Get automationCompany](dynamics-microsoft-automation-automationcompanies-get.md)  
[Post automationCompany](dynamics-microsoft-automation-automationcompanies-post.md)  
[Delete automationCompany](dynamics-microsoft-automation-automationcompanies-delete.md)  