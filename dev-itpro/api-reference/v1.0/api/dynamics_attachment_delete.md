---
title: (v1.0) Delete attachment
description: (v1.0) Deletes attachments in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Delete attachments
Deletes attachments in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({companyId})/attachments({parentId},{attachmentId})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the attachment.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v1.0/companies({companyId})/attachments({parentId},{attachmentId})
```

**Response** 

No Content.



## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Attachment](../resources/dynamics_attachment.md)  
[Get Attachments](dynamics_attachment_get.md)  
[Create Attachment](dynamics_attachment_create.md)  
[Upload Attachment](dynamics_attachment_patch.md)  
[Delete Attachment](dynamics_attachment_delete.md)  
