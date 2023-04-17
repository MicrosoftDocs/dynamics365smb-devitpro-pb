---
title: Delete externaleventsubscriptions
description: Deletes an externaleventsubscriptions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
ms.author: solsen
---

# Delete externaleventsubscriptions

Deletes an external event subscription from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/externaleventsubscriptions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **externaleventsubscriptions**, the **externaleventsubscriptions** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **externaleventsubscriptions**. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/externaleventsubscriptions({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[External event subscriptions](../resources/dynamics_externaleventsubscriptions.md)  
[GET external event subscriptions](dynamics_externaleventsubscriptions_get.md)  
[POST external event subscriptions](dynamics_externaleventsubscriptions_create.md)  
[PATCH external event subscriptions](dynamics_externaleventsubscriptions_update.md)  
