---
title: Create locations
description: Creates a location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create locations

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates a location in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/locations
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **location** object.

## Response

If successful, this method returns ```201 Created``` response code and a **location** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/locations
Content-type: application/json
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

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
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
[GET location](dynamics_location_get.md)  
[DELETE location](dynamics_location_delete.md)  
[PATCH location](dynamics_location_update.md)  
