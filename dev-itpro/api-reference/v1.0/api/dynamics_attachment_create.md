---
title: Create attachment
description: Creates a attachment object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create attachments
Creates a attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

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
	"parentId" : "{journalLineId}",
	"fileName": "myPDF.pdf"
}
```
ParentId is the Id of the entity, for which an attachment is being created.

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "parentId": "8bdf7f18-ac81-4cf6-a018-7dd2313d827f",
    "id": "7786c70a-31ee-43a3-9746-2d720496469e",
    "fileName": "myPDF.pdf",
    "content@odata.mediaEditLink": "https://api.businesscentral.dynamics-tie.com/v1.0/bc66bcbc-5b7f-4043-b352-f4ab70c81d11/api/v1.0/companies(d888c94e-0bf9-42e5-96eb-060739125558)/attachments(parentId=8bdf7f18-ac81-4cf6-a018-7dd2313d827f,id=7786c70a-31ee-43a3-9746-2d720496469e)/content",
    "content@odata.mediaReadLink": "https://api.businesscentral.dynamics-tie.com/v1.0/bc66bcbc-5b7f-4043-b352-f4ab70c81d11/api/v1.0/companies(d888c94e-0bf9-42e5-96eb-060739125558)/attachments(parentId=8bdf7f18-ac81-4cf6-a018-7dd2313d827f,id=7786c70a-31ee-43a3-9746-2d720496469e)/content",
    "lastModifiedDateTime": "2019-03-25T13:15:41Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Attachment](../resources/dynamics_attachment.md)  
[Get Attachments](dynamics_attachment_get.md)  
[Create Attachment](dynamics_attachment_create.md)  
[Upload Attachment](dynamics_attachment_patch.md)  
[Delete Attachment](dynamics_attachment_delete.md)  
