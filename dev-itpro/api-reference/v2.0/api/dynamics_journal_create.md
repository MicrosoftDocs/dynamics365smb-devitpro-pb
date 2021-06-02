---
title: Create journals  
description: Creates a journal object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create journals

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates a journal in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/journals({id})
```

## Request headers

|Header        |Value                     |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |
|Content-Type  |application/json          |

## Request body
In the request body, supply a JSON representation of a **journals** object.

## Response
If successful, this method returns ```201 Created``` response code and a **journals** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/journals
Content-type: application/json
```json
{
  "code": "DEFAULT"
}
```

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "code": "DEFAULT",
  "displayName": "Default Journal Batch",
  "lastModifiedDateTime": "2017-05-17T11:30:01.313Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[journal](../resources/dynamics_journal.md)    
[Get journal](dynamics_journal_Get.md)    
[Delete journal](dynamics_journal_Delete.md)    
[Update journal](dynamics_journal_Update.md)    
