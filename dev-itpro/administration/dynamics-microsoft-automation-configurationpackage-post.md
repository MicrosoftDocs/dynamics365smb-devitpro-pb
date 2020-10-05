---
title: Post configurationPackage | Microsoft Docs
description: Posts a configurationPackage object in Dynamics 365 Business Central.
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

# Post configurationPackage
Retrieves the properties and relationships of an configurationPackage object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Bound Actions

| Actions         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[Microsoft.NAV.import](dynamics-microsoft-automation-extension-post.md)|none|Imports a configurationPackage.|
|[Microsoft.NAV.apply](dynamics-microsoft-automation-extension-post.md)|extension|Applies a configurationPackage.|

## HTTP requests
### Insert configurationPackage
```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/configurationPackages
Content-type: application/json
{
    "code":"YourPackageName"
}
```

### Import configurationPackage
```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.import

```
### Apply configurationPackage
```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.apply

```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.import
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "code": "RAS2",
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
[Get ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-get.md)  
[Patch ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-patch.md)  
[Delete ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-delete.md)  

