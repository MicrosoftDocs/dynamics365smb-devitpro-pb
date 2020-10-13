---
title: Get configurationPackage | Microsoft Docs
description: Gets a configurationPackage object in Dynamics 365 Business Central.
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

# Get configurationPackage
Retrieves the properties and relationships of an configurationPackage object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```json
GET /microsoft/automation/{apiVersion}/companies({companyId})/configurationPackages
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **configurationPackages** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/configurationPackages
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "code": "MyRSPackage",
    "packageName": "SAMPLE",
    "languageId": 0,
    "productVersion": "",
    "processingOrder": 0,
    "excludeConfigurationTables": false,
    "numberOfTables": 12,
    "numberOfRecords": 3,
    "numberOfErrors": 3,
    "importStatus": "Completed",
    "applyStatus": "Completed"
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[ConfigurationPackage Resource Type](dynamics-microsoft-automation-configurationpackages.md)  
[Post ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-post.md)  
[Patch ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-patch.md)  
[Delete ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-delete.md)  
