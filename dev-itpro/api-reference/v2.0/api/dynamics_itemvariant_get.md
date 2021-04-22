---
title: GET itemVariants | Microsoft Docs
description: Gets a itemVariant object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get itemVariants

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a itemVariant object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/itemVariants({id})
GET businesscentralPrefix/companies({id})/items({id})/itemVariants({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **itemVariants** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/itemVariants({id})
```

**Response**

Here is an example of the response. 

```json
{
    "id": "c12af665-c1e3-ea11-aa60-000d3ad7cacb",
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "itemNumber": "1896-S",
    "code": "TESTCRUD",
    "description": "test crud"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[itemvariant](../resources/dynamics_itemvariant.md)    
[Delete itemvariant](dynamics_itemvariant_Delete.md)    
[Create itemvariant](dynamics_itemvariant_Create.md)    
[Update itemvariant](dynamics_itemvariant_Update.md)    
