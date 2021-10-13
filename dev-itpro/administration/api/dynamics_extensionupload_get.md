---
title: Get extensionUpload
description: Gets an extension upload object in Dynamics 365 Business Central.
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
# Get extensionUpload

Retrieves the properties and relationships of an extension upload object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


```
GET /microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **extensionUpload** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})
```

**Response**
Here is an example of the response.

```json
{
    "systemId" : "f99be650-07ce-45df-a285-3afe69a953eb",
    "schedule" : "Next major version",
    "extensionContent" : ""
}
```
Schedule in the body can be "Current version", "Next minor version", or "Next major version".

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[extensionUpload](../resources/dynamics_extensionUpload.md)
