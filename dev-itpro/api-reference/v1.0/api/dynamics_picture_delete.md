---
title: (v1.0) Delete picture
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

# Delete picture (v1.0)
Deletes the properties and relationships of a picture object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({companyId})/items({itemId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/vendors({vendorId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/employees({employeeId})/picture({pictureId})
DELETE businesscentralPrefix/companies({companyId})/customers({customerId})/picture({pictureId})
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match| When this request header is included and the eTag provided does not match the current tag on the picture, the picture will not be updated.|

## Request body (v1.0)
Do not supply a request body for this method.

## Response (v1.0)
If successful, this method returns a `204 No Content` response code. It does not return anything in the response body.

The metadata will be updated on the same link.

## Example (v1.0)

**Request**

Here is an example of the request. 

```json
DELETE https://api.businesscentral.dynamics-tie.com/v1.0/api/v1.0/companies(companyId)/customers(customerId)/picture(pictureId)
```

**Response**

No content.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  
[Picture](../resources/dynamics_picture.md)  
[Get Picture](dynamics_picture_get.md)  
[Update Picture](dynamics_picture_update.md)  
[Post Picture](dynamics_create_picture.md)  