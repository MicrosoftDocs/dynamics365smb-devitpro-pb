---
title: Update locations
description: Updates a  location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Update locations

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Updates the properties of a location object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/locations({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **location**, the **location** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **location** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/locations({id})
Content-type: application/json
{
  "displayName": "Main Whse."
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
  "id": "59f029b1-508c-ed11-aada-000d3a298ab3",
  "code": "MAIN",
  "displayName": "Main Whse.",
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
[POST location](dynamics_location_create.md)
