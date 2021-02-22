---
title: Get extensionDeploymentStatus | Microsoft Docs
description: Gets an extension deployment status object in Dynamics 365 Business Central.
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
# Get extensionDeploymentStatus

Retrieves the properties and relationships of an extension deployment status object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```
GET /microsoft/automation/{apiVersion}/companies({companyId})/extensionDeploymentStatus
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **extensionDeploymentStatus** object in the response body.

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

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[extensionDeploymentStatus](../resources/dynamics_extensionDeploymentStatus.md)
