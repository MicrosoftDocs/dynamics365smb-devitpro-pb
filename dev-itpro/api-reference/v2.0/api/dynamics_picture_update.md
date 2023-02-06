---
title: Update picture  
description: A picture object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Update picture

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Updates the properties and relationships of a picture object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/items({itemId})/picture/pictureContent
PATCH businesscentralPrefix/companies({companyId})/vendors({vendorId})/picture/pictureContent
PATCH businesscentralPrefix/companies({companyId})/employees({employeeId})/picture/pictureContent
PATCH businesscentralPrefix/companies({companyId})/customers({customerId})/picture/pictureContent

```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **picture**, the **picture** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns `204 No Content` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies(companyId)/items(itemId)/picture/pictureContent
```

**Response**

No response.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)
[picture](../resources/dynamics_picture.md)
[Get picture](dynamics_picture_Get.md)
[Delete picture](dynamics_picture_Delete.md)
