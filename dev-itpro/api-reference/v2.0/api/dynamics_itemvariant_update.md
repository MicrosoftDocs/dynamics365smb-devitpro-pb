---
title: UPDATE itemVariants   
description: Updates a itemVariant object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Update itemVariants 

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the properties of a itemVariant object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/itemVariants ({id})
PATCH businesscentralPrefix/companies({id})/items({id})/itemVariants({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **itemVariant**, the **itemVariant** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **itemVariants ** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/itemVariants({id})
Content-type: application/json

{
    "itemNumber": "3876-J"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

{
    "id": "c12af665-c1e3-ea11-aa60-000d3ad7cacb",
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "itemNumber": "3876-J",
    "code": "TESTCRUD",
    "description": "test crud"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[itemvariant](../resources/dynamics_itemvariant.md)    
[Get itemvariant](dynamics_itemvariant_Get.md)    
[Delete itemvariant](dynamics_itemvariant_Delete.md)    
[Create itemvariant](dynamics_itemvariant_Create.md)    
