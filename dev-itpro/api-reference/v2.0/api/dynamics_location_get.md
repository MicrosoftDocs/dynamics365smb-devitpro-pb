---
title: Get locations
description: Gets a location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get locations

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieves the properties and relationships of a location object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/locations({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **location** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/locations({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "59f029b1-508c-ed11-aada-000d3a298ab3",
    "code": "MAIN",
    "displayName": "Main Warehouse",
    "contact": "Eleanor Faulkner",
    "addressLine1": "UK Campus Bldg 5",
    "addressLine2": "Thames Valley Park",
    "city": "Reading",
    "state": "",
    "country": "GB",
    "postalCode": "RG6 1WG",
    "phoneNumber": "+44-(0)10 5214 4987",
    "email": "",
    "website": ""
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[location](../resources/dynamics_location.md)  
[DELETE location](dynamics_location_delete.md)  
[POST location](dynamics_location_create.md)  
[PATCH location](dynamics_location_update.md)  
