---
title: Delete configurationPackage | Microsoft Docs
description: Deletes a configurationPackage object in Dynamics 365 Business Central.
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

# Delete configurationPackage
Deletes a configurationPackage object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```json
DELETE /microsoft/automation/2.0/companies({companyId})/configurationPackages({packageId})
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v1.0/api//microsoft/automation/v1.0/companies({companyId})/configurationPackages('{packageName}')
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[ConfigurationPackage Resource Type](dynamics-microsoft-automation-configurationpackages.md)  
[Get ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-get.md)  
[Post ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-post.md)  
[Patch ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-patch.md)  
