---
title: Delete picture  
description: A picture object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete picture

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes the properties and relationships of a picture object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({companyId})/items({itemId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/vendors({vendorId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/employees({employeeId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/customers({customerId})/picture({pictureId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match| When this request header is included and the eTag provided does not match the current tag on the picture, the picture will not be updated.|

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a `204 No Content` response code. It does not return anything in the response body.

The metadata will be updated on the same link.

## Example

**Request**

Here is an example of the request. 

```json
DELETE https://api.businesscentral.dynamics-tie.com/v2.0/api/v2.0/companies(companyId)/customers(customerId)/picture(pictureId)
```

**Response**

No content.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[picture](../resources/dynamics_picture.md)    
[Get picture](dynamics_picture_Get.md)    
[Update picture](dynamics_picture_Update.md)    
