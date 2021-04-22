---
title: Upload attachment| Microsoft Docs
description: Uploads the attachment in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update attachments

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
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
PATCH https://{businesscentralPrefix}/api/v2.0/companies({companyId})/attachments(parentId={parentId},id={attachmentId})/content
```

**Request body**
Request body contains the attachment.

**Response**
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[attachment](../resources/dynamics_attachment.md)    
[Get attachment](dynamics_attachment_Get.md)    
[Delete attachment](dynamics_attachment_Delete.md)    
[Create attachment](dynamics_attachment_Create.md)    
