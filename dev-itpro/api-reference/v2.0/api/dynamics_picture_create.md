---
title: Create picture  
description: Creates a picture object in Dynamics 365 Business Central. 
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create picture

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates the properties and relationships of a picture object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

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


## Request body
In the request body, supply a JSON representation of a **project** object.


## Response
If successful, this method returns a `204 No Content` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies(companyId)/items(itemId)/picture/pictureContent
```

**Response**

No content.

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)
[picture](../resources/dynamics_picture.md)
[Get picture](dynamics_picture_Get.md)
[Delete picture](dynamics_picture_Delete.md)
[Update picture](dynamics_picture_Update.md)
