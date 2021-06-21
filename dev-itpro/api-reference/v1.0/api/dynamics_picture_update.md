---
title: (v1.0) Update picture
description: (v1.0) A picture object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update picture (v1.0)
Updates the properties and relationships of a picture object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/items({itemId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/vendors({vendorId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/employees({employeeId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/customers({customerId})/picture({pictureId})/content

```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/octet-stream  | 
|If Match | When this request header is included and the eTag provided does not match the current tag on the picture, the picture will not be updated.|

## Request body (v1.0)
Raw picture binary data.

## Response (v1.0)
If successful, this method returns `204 No Content` response code. It does not return anything in the response body.

## Example (v1.0)

**Request**

Here is an example of the request. 

```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies(companyId)/items(itemId)/picture(itemId)/content
```

**Response**

No response. 

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  



[Error Codes](../dynamics_error_codes.md)  
[Picture](../resources/dynamics_picture.md)  
[Get Picture](dynamics_picture_get.md)  
[Post Picture](dynamics_create_picture.md)  
[Delete Picture](dynamics_picture_delete.md)  
