---
title: Patch extensionUpload | Microsoft Docs
description: Patches a extensionUpload object in Dynamics 365 Business Central.
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

# Patch extensionUpload
Uploads and install a per tenant extension for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP requests

### Upload and install extension package

```json
PATCH /microsoft/automation/{apiVersion}/companies({companyId})/extensionUpload(0)/content
```
## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-type|application/octet-stream|
|If-Match|Required. When this request header is included and the eTag provided does not match the current tag on the **extensionUpload**, the **extensionUpload** will not be updated. |

## Request body
Content of the requestbody is an extension, an .app package. 

## Response
If successful, this method returns a ```204 No Content```.

## Example

**Request**
Here is an example of the request.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/extensionUpload(0)/content
Authorization : Bearer {token}
Content-type : application/octet-stream
If-Match:-*
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Extension Resource Type](dynamics-microsoft-automation-extension.md)
[Get Extensions](dynamics-microsoft-automation-extension-get.md)  
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
