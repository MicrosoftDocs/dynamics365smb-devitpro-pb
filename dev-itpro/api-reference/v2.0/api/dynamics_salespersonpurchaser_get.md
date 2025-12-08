---
title: Get salespersonPurchasers
description: Gets a salesperson purchaser object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
---

# Get salespersonPurchasers

Retrieves the properties and relationships of a salesperson purchaser object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/salespeoplePurchasers({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salespeoplePurchaser** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salespeoplePurchasers({id})
```

**Response**

Here's an example of the response.

```json
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
    "lastModifiedDateTime": "2025-04-28T15:42:26Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[salespersonPurchaser](../resources/dynamics_salespersonPurchaser.md)  
[DELETE salespersonPurchaser](dynamics_salespersonpurchaser_delete.md)  
[POST salespersonPurchaser](dynamics_salespersonpurchaser_create.md)  
[PATCH salespersonPurchaser](dynamics_salespersonpurchaser_update.md)  
