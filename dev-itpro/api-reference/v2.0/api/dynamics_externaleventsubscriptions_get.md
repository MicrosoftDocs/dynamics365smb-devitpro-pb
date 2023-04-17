---
title: Get externaleventsubscriptions
description: Gets an externaleventsubscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
ms.author: solsen
---

# Get externaleventsubscriptions

Retrieves the properties and relationships of an external event subscription object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/externaleventsubscriptions({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **externaleventsubscriptions** object in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/externaleventsubscriptions({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
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

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[External event subscriptions](../resources/dynamics_externaleventsubscriptions.md)  
[DELETE external event subscriptions](dynamics_externaleventsubscriptions_delete.md)  
[POST external event subscriptions](dynamics_externaleventsubscriptions_create.md)  
[PATCH external event subscriptions](dynamics_externaleventsubscriptions_update.md)  
