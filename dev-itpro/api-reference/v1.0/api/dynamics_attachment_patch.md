---
title: Upload attachment| Microsoft Docs
description: Uploads the attachment in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update attachments
Update the attachment in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/attachments(parentId={parentId},id={attachmentId})/content
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match  |*application/json*         |


## Example

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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Attachment](../resources/dynamics_attachment.md)  
[Get Attachments](dynamics_attachment_get.md)  
[Create Attachment](dynamics_attachment_create.md)  
[Upload Attachment](dynamics_attachment_patch.md)  
[Delete Attachment](dynamics_attachment_delete.md)  
