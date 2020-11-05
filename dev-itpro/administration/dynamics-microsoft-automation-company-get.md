---
title: Get company | Microsoft Docs
description: Gets a company object in Dynamics 365 Business Central.
 
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

# Get extension
Retrieves the properties and relationships of an company object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
GET /microsoft/automation/{apiVersion}/companies
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **company** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "3496bbf8-fcae-4e48-a4f8-cb17c27de0b3",
    "systemVersion": "24012",
    "name": "CRONUS USA, Inc.",
    "displayName": "CRONUS USA, Inc.",
    "businessProfileId": ""
}
```



## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Company Resource Type](dynamics-microsoft-automation-company.md)  
