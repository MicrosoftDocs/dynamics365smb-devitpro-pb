---
title: (v1.0) Delete dimensionLines
description: (v1.0) Deletes a dimension line object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Delete dimensionLines (v1.0)
Delete a dimension line object from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

## Request headers

|Header        |Value                     |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **dimensionLines**, the **dimensionLines** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v1.0/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  
[Dimension Line](../resources/dynamics_dimensionline.md)  
[Get Dimension Line](../api/dynamics_dimensionline_get.md)  
[Post Dimension Line](../api/dynamics_create_dimensionline.md)  
[Patch Dimension Line](../api/dynamics_dimensionline_update.md)  