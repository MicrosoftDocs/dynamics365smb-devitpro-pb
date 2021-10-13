---
title: file resource type | Microsoft Docs
description: A file in Dynamics 365 Business Central.
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/17/2021
ms.author: solsen
---

# file Resource Type

Represents a file resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)]. 

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET extensions](dynamics-microsoft-automation-extension-get.md)|extension|Gets all published extensions.|

## Properties

| Property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|code             |string|Specifies the file name.|
|content          |stream|Specifies the content of the file                 |


## Relationships / Navigation properties

| Navigation property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|[configurationPackage](dynamics-microsoft-automation-configurationpackages.md)               | configurationPackage|Gets the configurationPackages. |


## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get Extensions](dynamics-microsoft-automation-extension-get.md)  
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
