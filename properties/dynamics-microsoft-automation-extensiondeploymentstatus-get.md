---
title: Get extensionDeploymentStatus | Microsoft Docs
description: Gets a extensionDeploymentStatus object in Dynamics 365 Business Central.
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

# Get extensionDeploymentStatus
Retrieves the properties of an extensionDeploymentStatus object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```json
GET /microsoft/automation/{apiVersion}/companies({companyId})/extensionDeploymentStatus
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **extensionDeploymentStatus** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/extensionDeploymentStatus
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "operationID": "138fb013-1ebd-4e65-a333-420631e67344",
  "name": "VeryNiceApp",
  "publisher": "Default publisher",
  "operationType": "Upload",
  "status": "Completed",
  "schedule": "Immediate",
  "appVersion": "1.0.0.0",
  "startedOn": "2018-08-23T09:07:04.387Z"
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[ExtensionDeploymentStatus Resource Type](dynamics-microsoft-automation-extensionDeploymentStatus.md)
[Post ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-post.md)  
[Patch ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-patch.md)  
[Delete ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-delete.md)  
