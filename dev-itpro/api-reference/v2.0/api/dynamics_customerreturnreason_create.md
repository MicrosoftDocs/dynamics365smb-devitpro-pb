---
title: Create customerReturnReasons
description: Creates a customer return reason object in Dynamics 365 Business Central.
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
# Create customerReturnReasons

Creates a customer return reason in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/customerReturnReasons({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **customerReturnReason**, the **customerReturnReason** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **customerReturnReason** object.

## Response

If successful, this method returns ```201 Created``` response code and a **customerReturnReason** object in the response body.


## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/customerReturnReasons({id})
Content-type: application/json
{
    "id" : "",
    "code" : "",
    "description" : ""
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
    "description" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[customerReturnReason](../resources/dynamics_customerReturnReason.md)  
[GET customerReturnReason](dynamics_customerreturnreason_get.md)  
[DELETE customerReturnReason](dynamics_customerreturnreason_delete.md)  
[PATCH customerReturnReason](dynamics_customerreturnreason_update.md)  
