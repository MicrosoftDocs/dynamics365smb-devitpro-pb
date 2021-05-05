---
title: profile resource type | Microsoft Docs
description: A profile object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/05/2021
ms.author: solsen
---

# profile resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a profile in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET profile](../api/dynamics_profile_get.md)|profile|Gets a profile object.|


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|scope|string|Scope of the profile.|
|applicationId|GUID|The ID of the App.|
|profileId|string|The unique ID of the profile.|
|source|string|The source of the profile.|
|displayName|string|Specifies the profile's name.|
|enabled|boolean|Specifies if the profile is enabled.|

## JSON representation

Here is a JSON representation of the profile resource.


```json
{
    "scope": "string",
    "applicationId": "GUID",
    "profileId": "string",
    "source": "string",
    "displayName": "string",
    "enabled": true
}
```

<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET profile](../api/dynamics_profile_get.md)  