
---
title: extensionDeploymentStatus resource type | Microsoft Docs
description: An extension deployment status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# extensionDeploymentStatus resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an extension deployment status in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET extensionDeploymentStatus](../api/dynamics_extensiondeploymentstatus_get.md)|extensionDeploymentStatus|Gets a extension deployment status object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|operationID|GUID|The unique ID of the operation.|
|name|string|Represents the extension deployment status's name.|
|publisher|string|Specifies the publisher of the extension.|
|operationType|string|Specifies the operation.|
|status|string|Specifies the status of the extension deployment status.|
|schedule|string|Specifies the schedule for installation.|
|appVersion|string|The version of the App.|
|startedOn|datetime|Timestamp for the initialization of the operation.|

## JSON representation

Here is a JSON representation of the extensionDeploymentStatus resource.


```json
{
    "operationID": "GUID",
    "name": "string",
    "publisher": "string",
    "operationType": "string",
    "status": "string",
    "schedule": "string",
    "appVersion": "string",
    "startedOn": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET extensionDeploymentStatus](../api/dynamics_extensiondeploymentstatus_get.md)  
