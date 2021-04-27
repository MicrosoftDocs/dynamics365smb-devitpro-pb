---
title: Create picture | Microsoft Docs
description: A picture object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create picture
Creates the properties and relationships of a picture object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({companyId})/items({itemId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/vendors({vendorId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/employees({employeeId})/picture({pictureId})/content
PATCH businesscentralPrefix/companies({companyId})/customers({customerId})/picture({pictureId})/content
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type | application/octet-stream |
|If-Match  | * |


## Request body
Raw picture binary data.

## Response
If successful, this method returns a `204 No Content` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request. 

```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies(companyId)/items(itemId)/picture(itemId)/content
```

**Response**

No content.

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Error Codes](../dynamics_error_codes.md)  
[Picture](../resources/dynamics_picture.md)  
[Get Picture](dynamics_picture_get.md)  
[Update Picture](dynamics_picture_update.md)  
[Delete Picture](dynamics_picture_delete.md)  