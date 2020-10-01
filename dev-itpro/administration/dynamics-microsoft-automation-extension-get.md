---
title: Get extensions | Microsoft Docs
description: Gets a extension object in Dynamics 365 Business Central.
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
Retrieves the properties and relationships of an extension object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
GET /microsoft/automation/{apiVersion}/companies({{companyid}})/extensions
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **extension** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/extensions
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "packageId": "3252be43-93d6-4d6a-b603-cdc0f0f32a9e",
    "id": "3d5b2137-efeb-4014-8489-41d37f8fd4c3",
    "displayName": "Late Payment Prediction",
    "publisher": "Microsoft",
    "versionMajor": 1,
    "versionMinor": 0,
    "scope": 0,
    "isInstalled": true
}
```
## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Extension Resource Type](dynamics-microsoft-automation-extension.md)   
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
