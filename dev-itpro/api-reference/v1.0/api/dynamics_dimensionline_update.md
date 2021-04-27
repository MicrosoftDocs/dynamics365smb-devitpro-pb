---
title: Update dimensionLines | Microsoft Docs
description: Updates a dimension line object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update dimensionLines
Update the properties of a dimension line object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **dimensionLines**, the **dimensionLines** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **dimensionLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/dimensionLines(parentId=({id}),id=({id}))
Content-type: application/json

{
  "valueCode": "PROD"
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
  "parentId": "id-value",
  "id": "id-value",
  "code": "DEPARTMENT",
  "displayName": "Department",
  "valueId": "id-value",
  "valueCode": "PROD",
  "valueDisplayName": "Production"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  



[Error Codes](../dynamics_error_codes.md)  
[Dimension Line](../resources/dynamics_dimensionline.md)  
[Get Dimension Line](../api/dynamics_dimensionline_get.md)  
[Post Dimension Line](../api/dynamics_create_dimensionline.md)  
[Delete Dimension Line](../api/dynamics_dimensionline_delete.md)  