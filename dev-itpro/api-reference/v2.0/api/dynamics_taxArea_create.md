---
title: Create taxAreas  
description: Creates a tax area object in Dynamics for Financials. 
 
author: SusanneWindfeldPedersen

ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create taxAreas

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates a tax area object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/taxAreas({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of a **taxAreas** object.

## Response
If successful, this method returns ```201 Created``` response code and a **taxAreas** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/taxAreas
Content-type: application/json
```json
{
    "code": "ATLANTA, GA",
    "displayName": "ATLANTA, GA"
}
```

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "code": "ATLANTA, GA",
    "displayName": "ATLANTA, GA"
}
```

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Tax Area](../resources/dynamics_taxarea.md)  
[Get Tax Area](dynamics_taxarea_get.md)  
[Update Tax Area](dynamics_taxarea_update.md)  
[Delete Tax Area](dynamics_taxarea_delete.md)  
