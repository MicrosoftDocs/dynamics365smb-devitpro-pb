---
title: (v1.0) Get attachments
description: (v1.0) Gets an attachments object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get attachments
Retrieve the properties and relationships of an attachments object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/attachments$filter=parentId eq {journalLineId}
```

> [!NOTE]  
> Please note the $filter applied to attachment API. The filter is applied to get attachments for a specific entity. 


## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **attachments** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/attachments$filter=parentId eq {journalLineId}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{   
    "parentId": "8bdf7f18-ac81-4cf6-a018-7dd2313d827f",
    "id": "7786c70a-31ee-43a3-9746-2d720496469e",
    "fileName": "someFileName.pdf",
    "byteSize": 597568,
    "content@odata.mediaEditLink": "https://{businesscentralPrefix}/bc66bcbc-5b7f-4043-b352-f4ab70c81d11/api/v1.0/companies(d888c94e-0bf9-42e5-96eb-060739125558)/attachments(parentId=8bdf7f18-ac81-4cf6-a018-7dd2313d827f,id=7786c70a-31ee-43a3-9746-2d720496469e)/content",
    "content@odata.mediaReadLink": "https://{businesscentralPrefix}/bc66bcbc-5b7f-4043-b352-f4ab70c81d11/api/v1.0/companies(d888c94e-0bf9-42e5-96eb-060739125558)/attachments(parentId=8bdf7f18-ac81-4cf6-a018-7dd2313d827f,id=7786c70a-31ee-43a3-9746-2d720496469e)/content",
    "lastModifiedDateTime": "2019-03-25T13:15:41Z"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Attachment](../resources/dynamics_attachment.md)  
[Get Attachments](dynamics_attachment_get.md)  
[Create Attachment](dynamics_attachment_create.md)  
[Upload Attachment](dynamics_attachment_patch.md)  
[Delete Attachment](dynamics_attachment_delete.md)  
