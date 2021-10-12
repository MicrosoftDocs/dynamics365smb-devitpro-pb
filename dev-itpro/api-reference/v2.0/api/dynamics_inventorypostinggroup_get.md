---
title: Get inventoryPostingGroups
description: Gets an inventory posting group object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/24/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get inventoryPostingGroups

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieves the properties and relationships of an inventory posting group object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```
GET businesscentralPrefix/companies({id})/inventoryPostingGroups({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **inventoryPostingGroup** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/inventoryPostingGroups({id})
```

**Response**

Here is an example of the response.

```json
{
"@odata.etag": "W/\"JzQ0O2Zpb3ZGaXJybzIvSXRpWHNsZWJRNFV1ZUcycUdvTkFOV2paQVNiQVlaNkU9MTswMDsn\"",
"id": "dd318ff3-51ff-eb11-bb76-000d3a220646",
"code": "RESALE",
"description": "Resale items"
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[inventoryPostingGroup](../resources/dynamics_inventoryPostingGroup.md)  
