---
title: Update extensionUpload
description: Updates an  extension upload object in Dynamics 365 Business Central.
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
# Update extensionUpload

Updates the properties of an extension upload object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

```json
PATCH /microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})/content
Content-type: application/octet-stream
Body: binary content of the extension
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/octet-stream|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **extensionUpload**, the **extension upload** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```204 No Content```.

## Example

**Request**
Here is an example of the request.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})/content
Authorization : Bearer {token}
Content-type : application/octet-stream
If-Match:-*
Body: binary stream
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[extensionUpload](../resources/dynamics_extensionUpload.md)