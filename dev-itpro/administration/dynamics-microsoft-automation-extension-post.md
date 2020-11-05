---
title: Actions on extension | Microsoft Docs
description: Gets a extension object in Dynamics 365 Business Central.
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

# Bound Actions on extension
Installs and uninstalls published extensions in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Bound Actions

| Actions         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[Microsoft.NAV.install](dynamics-microsoft-automation-extension-post.md)|extension|Installs a published extension.|
|[Microsoft.NAV.uninstall](dynamics-microsoft-automation-extension-post.md)|extension|Uninstalls an extension.|

## HTTP requests

**Install extension**

```json
POST /microsoft/automation/{version}/companies({companyId})/extensions({packageId})/Microsoft.NAV.install
```

**Uninstall extension**

```json
POST /microsoft/automation/{version}/companies({companyId})/extensions({packageId})/Microsoft.NAV.uninstall
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
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/extensions({packageId})/Microsoft.NAV.install
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get extensions](dynamics-microsoft-automation-extension-get.md)   
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
[Extension Resource Type](dynamics-microsoft-automation-extension.md)

