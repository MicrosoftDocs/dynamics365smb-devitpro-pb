---
title: activate resource type
description: An activate object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/22/2025
ms.author: solsen
ms.reviewer: solsen
---

# activate resource type

Represents an activate object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[POST activate](../api/dynamics_activate_post.md)|activate| Activates a specific feature.|


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|updateInBackground  | boolean| Indicates whether the feature activation should occur in the background.|
|startDateTime       | string | Specifies the date and time when the feature activation should commence. The date and time should be in ISO 8601 format. Example: "2025-07-08T16:00:00Z".|

## JSON representation

Here is a JSON representation of the activate resource.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.activate
Authorization: Bearer {token}
{
	"updateInBackground":false,
	"startDateTime":"2025-07-08T16:00:00Z"
}
```

If successful, the request typically returns a "200" response. Use the GET features request to verify that the feature state has changed.

## Related information
