---
title: DELETE itemVariants  
description: Deletes itemVariant  in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Delete itemVariants

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes itemVariants in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/itemVariants({id})
DELETE businesscentralPrefix/companies({id})/items({id})/itemVariants({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the itemVariant .

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/itemVariants({id})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[itemvariant](../resources/dynamics_itemvariant.md)    
[Get itemvariant](dynamics_itemvariant_Get.md)    
[Create itemvariant](dynamics_itemvariant_Create.md)    
[Update itemvariant](dynamics_itemvariant_Update.md)    
