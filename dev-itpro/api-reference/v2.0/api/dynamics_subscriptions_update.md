---
title: Update subscriptions   
description: Updates a subscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 11/20/2024
ms.author: solsen
ms.reviewer: solsen
---

# Update subscriptions

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Updates a subscriptions object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. A subscription is valid for 3 days unless it is updated. `PATCH` requests will perform a handshake with the subscriber.

## Custom APIs

If you're subscribing to a custom API page, both the URL you send the subscription HTTP request to and the resource path you wish to subscribe to must include the `<APIPublisher>`, `<APIGroup>`, and `<APIVersion>` elements equivalent to: `api/<APIPublisher>/<APIGroup>/<APIVersion>/subscriptions`. For example, if your API publisher is `pub`, your API group is `grp`, and the version is 1.0, part of the URL will contain these elements `api/pub/grp/v1.0/subscriptions`.


## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/subscriptions({'id'})
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **subscription**, the **subscription** won't be updated. |

## Request body
Here's an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/subscriptions({'id'})
Content-type: application/json

{
  "notificationUrl": "https://{notificationUrl}",
  "resource": "/api/v1.0/companies(f64eba74-dacd-4854-a584-1834f68cfc3a)/customers",
  "clientState": "optionalValueOf2048"
}

```

## Response
If successful, this method returns a `200 OK` response code and a **subscription** object in the response body.

## Example

**Request**

Here's an example of the request.
```
https://{businesscentralPrefix}/api/v1.0/subscriptions({'id'}) 

```

**Response**
Here's an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "subscriptionId": "c670ea73cacb459bb51dc1740da2f1db",
  "notificationUrl": "https://{notificationUrl}",
  "resource": "/api/v1.0/companies(f64eba74-dacd-4854-a584-1834f68cfc3a)/customers",
  "userId": "00000000-0000-0000-0000-000000000001",
  "lastModifiedDateTime": "2018-10-12T12:32:35Z",
  "clientState": "optionalvalueof2048",
  "expirationDateTime": "2021-10-15T12:32:35Z",
  "systemCreatedAt": "2017-01-23T00:24:31.766Z",
  "systemCreatedBy": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
  "systemModifiedAt": "2020-08-21T00:24:31.777Z",
  "systemModifiedBy": "f2a5738a-44e3-ea11-bb43-000d3a2feca1"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[subscriptions](../dynamics-subscriptions.md)    
[Get subscriptions](dynamics_subscriptions_Get.md)    
[Delete subscriptions](dynamics_subscriptions_Delete.md)    
[Create subscriptions](dynamics_subscriptions_Create.md)    
