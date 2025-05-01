---
title: Create salespersonPurchasers
description: Creates a salesperson purchaser object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
---

# Create salespersonPurchasers

Creates a salesperson purchaser in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salespersonPurchasers({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **salespersonPurchaser**, the **salespersonPurchaser** won't be updated. |

## Request body

In the request body, supply a JSON representation of a **salespersonPurchaser** object.

## Response

If successful, this method returns ```201 Created``` response code and a **salespersonPurchaser** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salespersonPurchasers({id})
Content-type: application/json
{
    "code": "JS",
    "displayName": "Jennifer Smith",
    "email": "jennifer.smith@contoso.com",
    "email2": "js@contoso.onmicrosoft.com",
    "phoneNo": "+1 425-555-0187",
    "jobTitle": "Senior Sales Representative",
    "commisionPercent": 7.5,
    "privacyBlocked": false,
    "blocked": false
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "f57a8943-92b5-ed11-94cc-000d3a2feca1",
    "code": "JS",
    "displayName": "Jennifer Smith",
    "email": "jennifer.smith@contoso.com",
    "email2": "js@contoso.onmicrosoft.com",
    "phoneNo": "+1 425-555-0187",
    "jobTitle": "Senior Sales Representative",
    "commisionPercent": 7.5,
    "privacyBlocked": false,
    "blocked": false,
    "lastModifiedDateTime": "2025-04-29T13:42:26Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[salespersonPurchaser](../resources/dynamics_salespersonPurchaser.md)  
[GET salespersonPurchaser](dynamics_salespersonpurchaser_get.md)  
[DELETE salespersonPurchaser](dynamics_salespersonpurchaser_delete.md)  
[PATCH salespersonPurchaser](dynamics_salespersonpurchaser_update.md)  
