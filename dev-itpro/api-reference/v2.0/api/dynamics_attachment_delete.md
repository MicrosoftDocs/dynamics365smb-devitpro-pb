---
title: Delete attachment  
description: Deletes attachments in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete attachments

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes attachments in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
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
DELETE https://{businesscentralPrefix}/api/v2.0/companies({companyId})/attachments({parentId},{attachmentId})
```

**Response** 

No Content.



## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[attachment](../resources/dynamics_attachment.md)    
[Get attachment](dynamics_attachment_Get.md)    
[Create attachment](dynamics_attachment_Create.md)    
[Update attachment](dynamics_attachment_Update.md)    
