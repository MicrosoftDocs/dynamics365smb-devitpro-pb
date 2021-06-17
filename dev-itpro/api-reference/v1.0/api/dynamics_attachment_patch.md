---
title: (v1.0) Upload attachment| Microsoft Docs
description: (v1.0) Uploads the attachment in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update attachments (v1.0)
Update the attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/attachments(parentId={parentId},id={attachmentId})/content
```

## Request headers (v1.0)

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match  |*application/json*         |


## Example (v1.0)

**Request**
Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({companyId})/attachments(parentId={parentId},id={attachmentId})/content
```

**Request body**
Request body contains the attachment.

**Response**
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Attachment](../resources/dynamics_attachment.md)  
[Get Attachments](dynamics_attachment_get.md)  
[Create Attachment](dynamics_attachment_create.md)  
[Upload Attachment](dynamics_attachment_patch.md)  
[Delete Attachment](dynamics_attachment_delete.md)  
