---
title: Create attachment  
description: Creates a attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create attachments

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates a attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/attachments
```

## Request headers

|Header        |Value                     |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |
|Content-Type  |application/json          |

## Request body
In the request body, supply a JSON representation of a **attachment** object.

## Response
If successful, this method returns ```201 Created``` response code and a **attachment** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/attachments
Content-type: application/json
```json
{
	"parentId" : "0a077d18-45e3-ea11-bb43-000d3a2feca1",
	"fileName": "myPDF.pdf"
}
```
ParentId is the Id of the entity, for which an attachment is being created.

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "b282a6f1-bfe3-ea11-aa60-000d3ad7cacb",
    "parentId": "0a077d18-45e3-ea11-bb43-000d3a2feca1",
    "fileName": "myPDF.pdf",
    "byteSize": 0,
    "lastModifiedDateTime": "2020-08-21T15:06:53Z",
    "parentType": "Journal"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[attachment](../resources/dynamics_attachment.md)    
[Get attachment](dynamics_attachment_Get.md)    
[Delete attachment](dynamics_attachment_Delete.md)    
[Update attachment](dynamics_attachment_Update.md)    
