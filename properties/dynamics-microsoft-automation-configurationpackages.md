---
title: configurationPackages resource type | Microsoft Docs
description: A user in Dynamics 365 Business Central.
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

# configurationPackage Resource Type
Represents a configurationPackage resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET configurationPackages](dynamics-microsoft-automation-configurationpackage-get.md)|configurationPackage|Gets all configurationPackages.|
|[POST configurationPackages](dynamics-microsoft-automation-configurationpackage-post.md)|none|Inserts a new configuration package.|
|[Patch configurationPackages](dynamics-microsoft-automation-configurationpackage-patch.md)|none|Upload a configurationPackage.|
|[Delete configurationPackages](dynamics-microsoft-automation-configurationpackage-delete.md)|none|Delete a configurationPackage.|

## Bound Actions

| Actions         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[Microsoft.NAV.import](dynamics-microsoft-automation-configurationpackage-post.md)|none|Imports configurationPackage.|
|[Microsoft.NAV.apply](dynamics-microsoft-automation-configurationpackage-post.md)|none|Applies configuration package.|

## Properties

| Property | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|id               |Guid  |Id of the configurationPackage.|
|code               |string  |code of the configurationPackage.|
|packageName      |string|Name of the configurationPackage.    |
|languageId|int|Id of the language.|
|productVersion|string|Product version.|
|processingOrder|int|Specifies the order of processing.|
|excludeConfigurationTables|boolean|Exclude configuration tables.|
|numberOfTables|int|Number of tables.|
|numberOfRecords|int|Number of records.|
|numberOfErrors|int|Number of errors.|
|importStatus|string|Status of import.|
|applyStatus|string|Status of configurationPackage apply.|


## Relationships / Navigation properties

None

## JSON representation

Here is a JSON representation of the extension.

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
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-get.md)  
[Post ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-post.md)  
[Patch ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-patch.md)  
[Delete ConfigurationPackage](dynamics-microsoft-automation-configurationpackage-delete.md)  