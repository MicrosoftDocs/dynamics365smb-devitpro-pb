---
title: CREATE itemVariants  
description: Creates a itemVariant object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create itemVariants

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a itemVariant object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/itemVariants({id})
POST businesscentralPrefix/companies({id})/items({id})/itemVariants({id})
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **itemVariants** object.

## Response
If successful, this method returns ```201 Created``` response code and a **itemVariants** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/itemVariants
Content-type: application/json

{
    "id": "c12af665-c1e3-ea11-aa60-000d3ad7cacb",
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "itemNumber": "1896-S",
    "code": "TESTCRUD",
    "description": "test crud"
}
```

**Response**

Here is an example of the response. 

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "c12af665-c1e3-ea11-aa60-000d3ad7cacb",
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "itemNumber": "1896-S",
    "code": "TESTCRUD",
    "description": "test crud"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[itemvariant](../resources/dynamics_itemvariant.md)    
[Get itemvariant](dynamics_itemvariant_Get.md)    
[Delete itemvariant](dynamics_itemvariant_Delete.md)    
[Update itemvariant](dynamics_itemvariant_Update.md)    
