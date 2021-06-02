---
title: Create locations
description: Creates a location object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/27/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create locations

Creates a location in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/locations({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **location**, the **location** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **location** object.

## Response

If successful, this method returns ```201 Created``` response code and a **location** object in the response body.


## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/locations({id})
Content-type: application/json
{
    "id" : "",
    "code" : "",
    "displayName" : "",
    "contact" : "",
    "addressLine1" : "",
    "addressLine2" : "",
    "city" : "",
    "state" : "",
    "country" : "",
    "postalCode" : "",
    "phoneNumber" : "",
    "email" : "",
    "website" : ""
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
    "code" : "",
    "displayName" : "",
    "contact" : "",
    "addressLine1" : "",
    "addressLine2" : "",
    "city" : "",
    "state" : "",
    "country" : "",
    "postalCode" : "",
    "phoneNumber" : "",
    "email" : "",
    "website" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[location](../resources/dynamics_location.md)  
[GET location](dynamics_location_get.md)  
[DELETE location](dynamics_location_delete.md)  
[PATCH location](dynamics_location_update.md)  
