---
title: subscription resource type
description: A subscription object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# subscription resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a webhook subscription object in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. Requests issued against the subscription entity, manages webhook subscriptions for a tenant.

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET](../api/dynamics_subscription_get.md)|subscriptions|Get subscriptions object.|
|[POST](../api/dynamics_subscription_create.md)|subscriptions|Create subscriptions object.|
|[PATCH](../api/dynamics_subscription_update.md)|subscriptions|Update subscriptions object.|
|[DELETE](../api/dynamics_subscription_delete.md)|subscriptions|Delete subscriptions object.|

## Properties

| Property | Type	|Description| 
|:---------------|:--------|:----------|
|subscriptionId|string|Unique key for the subscription. |
|notificationUrl|string|URL to which webhook notifications are sent.|  
|resource|string|URL for the resource being subscribed to. Supports relative and absolute URL.|
|userId|GUID|The ID of user that has created the subscription.|
|lastModifiedDateTime|datetime|Timestamp for when the subscription was modified.|
|clientState|string|Client state will be delivered with every notification. This can be used as a secret to verify message or for managing state if needed.|
|expirationDateTime|datetime|Date and time for when the webhook will expire.|

## Relationships

None

## JSON representation

Here is a JSON representation of the resource.

```json
{
  "subscriptionId": "string",
  "notificationUrl": "string",
  "resource": "string",
  "userId": "Guid",
  "clientState": "string",
  "lastModifiedDateTime": "dateTimeOffset",
  "expirationDateTime": "dateTimeOffset"
}

```

## See also



[Error Codes](../dynamics_error_codes.md)  
[Get subscriptions](../api/dynamics_subscription_get.md)  
[Create subscriptions](../api/dynamics_subscription_create.md)  
[Update subscriptions](../api/dynamics_subscription_update.md)  
[Delete subscriptions](../api/dynamics_subscription_delete.md)  


[Error Codes](../dynamics_error_codes.md)  
