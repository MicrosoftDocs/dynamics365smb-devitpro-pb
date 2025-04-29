---
title: Update externaleventsubscriptions
description: Updates an  externaleventsubscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025
ms.author: solsen
---

# Update externaleventsubscriptions

Updates the properties of an externaleventsubscriptions object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/externaleventsubscriptions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **externaleventsubscriptions**, the **externaleventsubscriptions** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **externaleventsubscriptions** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/externaleventsubscriptions({id})
Content-type: application/json
{
    "id" : ,
    "companyId" :
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id" : ,
    "companyId" : ,
    "timestamp" : ,
    "appId" : ,
    "eventName" : ,
    "companyName" : ,
    "userId" : ,
    "notificationUrl" : ,
    "lastModifiedDateTime" : ,
    "clientState" : ,
    "subscriptionType" : ,
    "eventVersion" : ,
    "subscriptionState" : ,
    "systemCreatedAt" : ,
    "systemCreatedBy" : ,
    "systemModifiedAt" : ,
    "systemModifiedBy" :
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[externaleventsubscriptions](../resources/dynamics_externaleventsubscriptions.md)  
[GET externaleventsubscriptions](dynamics_externaleventsubscriptions_get.md)  
[DELETE externaleventsubscriptions](dynamics_externaleventsubscriptions_delete.md)  
[POST externaleventsubscriptions](dynamics_externaleventsubscriptions_create.md)  
