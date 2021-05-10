---
title: Get configurationPackage
description: Gets a configuration package object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get configurationPackage

Retrieves the properties and relationships of a configuration package object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```
GET /microsoft/automation/v2.0/companies({companyId})/configurationPackages
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **configurationPackage** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "b6d25c66-f33d-eb11-846f-0022482037e2",
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
    "applyStatus": "Completed",
    "applyError": "",
    "importError": ""
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[configurationPackage](../resources/dynamics_configurationPackage.md)