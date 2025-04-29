---
title: Create salespersonPurchasers
description: Creates a salesperson purchaser object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/28/2025
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create salespersonPurchasers

Creates a salesperson purchaser in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/salespersonPurchasers({id})
```
<!-- END>EDIT_IS_REQUIRED -->
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
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salespersonPurchasers({id})
Content-type: application/json
{
    "id" : "",
    "code" : "",
    "displayName" : "",
    "email" : "",
    "email2" : "",
    "phoneNo" : "",
    "jobTitle" : "",
    "commisionPercent" : "",
    "privacyBlocked" : "",
    "blocked" : "",
    "lastModifiedDateTime" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here's an example of the response.
<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "",
    "code" : "",
    "displayName" : "",
    "email" : "",
    "email2" : "",
    "phoneNo" : "",
    "jobTitle" : "",
    "commisionPercent" : "",
    "privacyBlocked" : "",
    "blocked" : "",
    "lastModifiedDateTime" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[salespersonPurchaser](../resources/dynamics_salespersonPurchaser.md)  
[GET salespersonPurchaser](dynamics_salespersonpurchaser_get.md)  
[DELETE salespersonPurchaser](dynamics_salespersonpurchaser_delete.md)  
[PATCH salespersonPurchaser](dynamics_salespersonpurchaser_update.md)  
[GET salespersonPurchaser](dynamics_salespersonpurchaser_get.md)  
