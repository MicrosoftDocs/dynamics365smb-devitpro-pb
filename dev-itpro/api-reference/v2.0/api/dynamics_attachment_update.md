---
title: Upload attachment 
description: Uploads the attachment in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/01/202
ms.author: solsen
---

# Update attachments

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. An attachment in the [!INCLUDE[prod_short](../../../includes/prod_short.md)] API is defined as an Incoming Document (table 130).


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/attachments({attachmentId})/attachmentContent
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **attachment**, the **attachments** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **attachment** object in the response body.

## Example

**Request**
Here is an example of the request.

```
PATCH https://{businesscentralPrefix}/api/v2.0/companies({companyId})/attachments(parentId={parentId},id={attachmentId})/attachmentContent
```

**Request body**
Request body contains the attachment.

**Response**

Here is an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id" : ,
    "parentId" : ,
    "fileName" : ,
    "byteSize" : ,
    "attachmentContent" : ,
    "lastModifiedDateTime" : ,
    "parentType" :
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[attachment](../resources/dynamics_attachment.md)    
[Get attachment](dynamics_attachment_Get.md)    
[Delete attachment](dynamics_attachment_Delete.md)    
[Create attachment](dynamics_attachment_Create.md)    
