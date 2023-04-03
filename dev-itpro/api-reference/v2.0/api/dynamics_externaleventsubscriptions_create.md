---
title: Create externaleventsubscriptions
description: Creates an externaleventsubscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
ms.author: solsen
---

# Create externaleventsubscriptions

Creates an external event subscription in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/externaleventsubscriptions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **externaleventsubscriptions**, the **externaleventsubscriptions** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **externaleventsubscriptions** object.

## Response

If successful, this method returns ```201 Created``` response code and a **externaleventsubscriptions** object in the response body.


## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/externaleventsubscriptions({id})
Content-type: application/json
{
    "id" : "",
    "timestamp" : "",
    "appId" : "",
    "eventName" : "",
    "companyName" : "",
    "userId" : "",
    "notificationUrl" : "",
    "lastModifiedDateTime" : "",
    "clientState" : "",
    "subscriptionType" : "",
    "systemCreatedAt" : "",
    "systemCreatedBy" : "",
    "systemModifiedAt" : "",
    "systemModifiedBy" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.
<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "",
    "timestamp" : "",
    "appId" : "",
    "eventName" : "",
    "companyName" : "",
    "userId" : "",
    "notificationUrl" : "",
    "lastModifiedDateTime" : "",
    "clientState" : "",
    "subscriptionType" : "",
    "systemCreatedAt" : "",
    "systemCreatedBy" : "",
    "systemModifiedAt" : "",
    "systemModifiedBy" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[External event subscriptions](../resources/dynamics_externaleventsubscriptions.md)  
[GET external event subscriptions](dynamics_externaleventsubscriptions_get.md)  
[DELETE external event subscriptions](dynamics_externaleventsubscriptions_delete.md)  
[PATCH external event subscriptions](dynamics_externaleventsubscriptions_update.md)  
