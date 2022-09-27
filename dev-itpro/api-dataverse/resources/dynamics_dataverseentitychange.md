---
title: dataverseEntityChange resource type
description: A dataverse entity change object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/25/2022
ms.author: solsen
---

# dataverseEntityChange resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a dataverse entity change in [!INCLUDE [prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dataverseEntityChange](../api/dynamics_dataverseentitychange_get.md)|dataverseEntityChange|Gets a dataverse entity change object.|
|[POST dataverseEntityChange](../api/dynamics_dataverseentitychange_create.md)|dataverseEntityChange|Creates a dataverse entity change object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dataverse entity change. Non-editable.|
|entityName|string||

## JSON representation

Here is a JSON representation of the dataverseEntityChange resource.


```json
{
    "id": "GUID",
    "entityName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET dataverseEntityChange](../api/dynamics_dataverseentitychange_get.md)
[POST dataverseEntityChange](../api/dynamics_dataverseentitychange_create.md)  
[Business Central Dataverse API](../dynamics-dataverse-api.md)  
