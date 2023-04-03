---
title: externaleventsubscriptions resource type
description: An externaleventsubscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
ms.author: solsen
---

# externaleventsubscriptions resource type

Represents an external event subscription in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET externaleventsubscriptions](../api/dynamics_externaleventsubscriptions_get.md)|externaleventsubscriptions|Gets a externaleventsubscriptions object.|
|[DELETE externaleventsubscriptions](../api/dynamics_externaleventsubscriptions_delete.md)|none|Deletes a externaleventsubscriptions object.|
|[POST externaleventsubscriptions](../api/dynamics_externaleventsubscriptions_create.md)|externaleventsubscriptions|Creates a externaleventsubscriptions object.|
|[PATCH externaleventsubscriptions](../api/dynamics_externaleventsubscriptions_update.md)|externaleventsubscriptions|Updates a externaleventsubscriptions object.|


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the externaleventsubscriptions. Non-editable.|
|timestamp|int64||
|appId|GUID|The ID of the App.|
|eventName|string||
|companyName|string|The name of the company.|
|userId|GUID|The ID of user that has created the externaleventsubscriptions.|
|notificationUrl|string|URL to which webhook notifications are sent.|
|lastModifiedDateTime|datetime|The last datetime the externaleventsubscriptions was modified. Read-Only.|
|clientState|string|Client state will be delivered with every notification. This can be used as a secret to verify message or for managing state if needed.|
|subscriptionType|string||
|systemCreatedAt|datetime|The datetime the company was created.|
|systemCreatedBy|GUID|The ID of the user who created the company.|
|systemModifiedAt|datetime|The last datetime the externaleventsubscriptions was modified.|
|systemModifiedBy|GUID|The ID of the user who last modified the company.|

## JSON representation

Here is a JSON representation of the externaleventsubscriptions resource.


```json
{
    "id": "GUID",
    "timestamp": "int64",
    "appId": "GUID",
    "eventName": "string",
    "companyName": "string",
    "userId": "GUID",
    "notificationUrl": "string",
    "lastModifiedDateTime": "datetime",
    "clientState": "string",
    "subscriptionType": "string",
    "systemCreatedAt": "datetime",
    "systemCreatedBy": "GUID",
    "systemModifiedAt": "datetime",
    "systemModifiedBy": "GUID"
}
```

## See Also

[GET external event subscriptions](../api/dynamics_externaleventsubscriptions_get.md)
[DELETE external event subscriptions](../api/dynamics_externaleventsubscriptions_delete.md)
[POST external event subscriptions](../api/dynamics_externaleventsubscriptions_create.md)
[PATCH external event subscriptions](../api/dynamics_externaleventsubscriptions_update.md)
