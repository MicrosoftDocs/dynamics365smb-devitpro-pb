---
title: deactivate resource type
description: A deactivate object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/22/2025
ms.author: solsen
ms.reviewer: solsen
---

# deactivate resource type

Represents a deactivate object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[POST deactivate](../api/dynamics_deactivate_post.md)|deactivate| Deactivates a specific feature.|

## Bound Actions

| Bound Action | Description |
|:--------------------|:-----------|
|Microsoft.NAV.deactivate| Deactivates a specific feature.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
||||

## JSON representation

Here is a JSON representation of the deactivate resource.


```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.deactivate
Authorization: Bearer {token}
```

If successful, the request typically returns a "200" response. Use the GET features request to verify that the feature state has changed.


## Related information
