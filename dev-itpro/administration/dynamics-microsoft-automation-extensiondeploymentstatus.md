---
title: extensionDeploymentStatus resource type | Microsoft Docs
description: A extensionDeploymentStatus in Dynamics 365 Business Central.
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

# extensionDeploymentStatus Resource Type
Represents a extensionDeploymentStatus resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Properties

| Property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|name             |string|Specifies the extension name.           |
|publisher|string|Specifies the publisher of the extension.       |
|operationType      |string|Specifies the operation.     |
|status      |string|Status of current extension installation process.     |
|schedule|string|specifies the schedule for installation.         |
|appVersion|string|Version of the extension.                      |
|startedOn|DateTimeOffset|Timestamp for the initialization of the operation.|

## Relationships
None

## JSON representation
Here is a JSON representation of the extensionDeploymentStatus.

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

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET extensionDeploymentStatus](dynamics-microsoft-automation-extensionDeploymentStatus-get.md)|extensionDeploymentStatus|Gets extension installation status|

## Relationships / Navigation properties
None

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Upload extension](dynamics-microsoft-automation-extensionupload-patch.md)  
[Get Extensions](dynamics-microsoft-automation-extension-get.md)  
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
