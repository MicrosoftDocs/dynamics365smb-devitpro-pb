---
title: Get taxAreas  
description: Gets a tax area object in Dynamics 365 Business Central. 
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Get taxAreas

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a tax area object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/taxAreas({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **taxAreas** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/taxAreas({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "90196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "ATLANTA, GA",
    "displayName": "ATLANTA, GA",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:25.847Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[taxarea](../resources/dynamics_taxarea.md)    
[Delete taxarea](dynamics_taxarea_Delete.md)    
[Create taxarea](dynamics_taxarea_Create.md)    
[Update taxarea](dynamics_taxarea_Update.md)    
