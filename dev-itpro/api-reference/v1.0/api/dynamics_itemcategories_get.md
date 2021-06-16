---
title: (v1.0) Get itemCategories
description: (v1.0) Gets an item category in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get itemCategories (v1.0)
Retrieve the properties and relationships of an item category object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/itemCategories({id})
GET businesscentralPrefix/companies({id})/item({id})/itemcategory
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **itemCategories** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/itemCategories({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "id": "id-value",
  "code": "CHAIR",
  "displayName": "Office Chair",
  "lastModifiedDateTime": "2017-03-15T02:21:24.047Z"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  
[Item Categories](../resources/dynamics_itemcategories.md)  
[Create Item Categories](../api/dynamics_create_itemcategories.md)  
[Update Item Categories](../api/dynamics_itemcategories_update.md)  
[Delete Item Categories](../api/dynamics_itemcategories_delete.md)  