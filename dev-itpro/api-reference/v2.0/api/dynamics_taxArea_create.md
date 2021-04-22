---
title: Create taxAreas | Microsoft Docs
description: Creates a tax area object in Dynamics for Financials. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
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
|Authorization  |Bearer {token}. Required.    |
|Content-Type  |application/json    |

## Request body
In the request body, supply a JSON representation of a **taxAreas** object.

## Response
If successful, this method returns ```201 Created``` response code and a **taxAreas** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/taxAreas
Content-type: application/json
```json
{
    "id": "90196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "ATLANTA, GA",
    "displayName": "ATLANTA, GA",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:25.847Z"
}
```

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "90196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "ATLANTA, GA",
    "displayName": "ATLANTA, GA",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:25.847Z"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  

[Tax Area](../resources/dynamics_taxarea.md)  
[Get Tax Area](dynamics_taxarea_get.md)  
[Update Tax Area](dynamics_taxarea_update.md)  
[Delete Tax Area](dynamics_taxarea_delete.md)  
