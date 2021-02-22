---
title: Patch configurationPackage | Microsoft Docs
description: Patches a configurationPackage object in Dynamics 365 Business Central.
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

# Patch configurationPackage
Uploads a RapidStart package to the configurationPackage object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP requests

### Upload RapidStart package

```json
PATCH /microsoft/automation/2.0/companies({companyId})/configurationPackages({packageId})/file('{packageName}')/content
Content-type: application/octet-stream
Body: binary content of the RapidStart package
```


## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-type|application/octet-stream.|
|If-Match|Required. When this request header is included and the eTag provided does not match the current tag on the **configurationPackage**, the **configurationPackage** will not be updated. |

## Request body
Content of the requestbody is the binary stream containing the RapidStart package.

## Response
If successful, this method returns a ```204 No Content```.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/file('{packageName}')/content
Authorization : Bearer {token}
Content-type : application/octet-stream
If-Match:*
Body: binary stream
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[ConfigurationPackage Resource Type](dynamics-microsoft-automation-configurationpackages.md)  
[Get ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-get.md)  
[Post ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-post.md)  
[Delete ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-delete.md)
