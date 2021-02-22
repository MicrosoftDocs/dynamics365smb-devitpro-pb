---
title: Create configurationPackage | Microsoft Docs
description: Creates a configuration package object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create configurationPackage

Creates a configuration package in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST /microsoft/automation/2.0/companies({companyId})/configurationPackages({packageId})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **configurationPackage**, the **configurationPackage** will not be updated. |

## Bound Actions

| Actions         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[Microsoft.NAV.import](dynamics-microsoft-automation-extension-post.md)|none|Imports a configurationPackage.|
|[Microsoft.NAV.apply](dynamics-microsoft-automation-extension-post.md)|extension|Applies a configurationPackage.|

## HTTP requests
### Insert configurationPackage
```json
POST /microsoft/automation/2.0/companies({companyId})/configurationPackages
Content-type: application/json
{
    "code":"YourPackageName"
}
```

### Import configurationPackage
```json
POST /microsoft/automation/2.0/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.import

```
### Apply configurationPackage
```json
POST /microsoft/automation/2.0/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.apply

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
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages('{packageName}')/Microsoft.NAV.import
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "b6d25c66-f33d-eb11-846f-0022482037e2",
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

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[configurationPackage](../resources/dynamics_configurationPackage.md)  
