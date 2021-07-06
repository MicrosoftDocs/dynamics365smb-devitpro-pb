---
title: (v1.0) Update subscription
description: (v1.0) Gets a subscription object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update subscriptions (v1.0)
Updates a subscriptions object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. A subscription is valid for 3 days unless it is updated. `PATCH` requests will perform a handshake with the subscriber.

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/subscriptions({id})
```

## Request headers (v1.0)
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **subscription**, the **subscription** will not be updated. |

## Request body (v1.0)
Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/subscriptions({'id'})
Content-type: application/json

{
  "notificationUrl": "https://{notificationUrl}",
  "resource": "/api/v1.0/companies(f64eba74-dacd-4854-a584-1834f68cfc3a)/customers",
  "clientState": "optionalValueOf2048"
}

```

## Response (v1.0)
If successful, this method returns a `200 OK` response code and a **subscription** object in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.
```
https://{businesscentralPrefix}/api/v1.0/subscriptions({'id'}) 

```

**Response**
Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "subscriptionId": "c670ea73cacb459bb51dc1740da2f1db",
  "notificationUrl": "https://contoso.com/myCallbacks",
  "resource": "companies(f64eba74-dacd-4854-a584-1834f68cfc3a)/customers",
  "userId": "00000000-0000-0000-0000-000000000001",
  "lastModifiedDateTime": "2018-10-12T12:32:35Z",
  "clientState": "anytextvalueof2048",
  "expirationDateTime": "2018-10-15T12:32:35Z"
}
```

> [!IMPORTANT]  
> Handshake is mandatory when [creating a subscription](dynamics_subscription_create.md) and [renewing a subscription](dynamics_subscription_update.md). See [Working with Webhooks](../dynamics_subscriptions.md).  

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  
[Subscription Resource Type](../resources/dynamics_subscription.md)  
[Get subscriptions](dynamics_subscription_get.md)  
[Create subscriptions](dynamics_subscription_create.md)  
[Delete subscriptions](dynamics_subscription_delete.md)  
[Microsoft REST API Guidelines](https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md#15-push-notifications-via-webhooks)
