---
title: Create disputeStatus
description: Creates a dispute status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create disputeStatus

Creates a dispute status in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/disputeStatus({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **disputeStatus**, the **disputeStatus** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **disputeStatus** object.

## Response

If successful, this method returns ```201 Created``` response code and a **disputeStatus** object in the response body.


## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/disputeStatus({id})
Content-type: application/json
{
    "code": "QUALITY",
    "displayName": "A disputed invoice due to quality"
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
    "id" : "c7748e9f-8401-ef11-9f8f-6045bde9b6de",
    "code": "QUALITY",
    "displayName": "A disputed invoice due to quality"
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[disputeStatus](../resources/dynamics_disputeStatus.md)  
[GET disputeStatus](dynamics_disputestatus_get.md)  
[DELETE disputeStatus](dynamics_disputestatus_delete.md)  
[PATCH disputeStatus](dynamics_disputestatus_update.md)  
