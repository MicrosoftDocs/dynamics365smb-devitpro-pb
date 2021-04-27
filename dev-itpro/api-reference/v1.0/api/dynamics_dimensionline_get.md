---
title: Get dimensionLines | Microsoft Docs
description: Gets a dimension line in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get dimensionLines
Retrieve the properties and relationships of a dimension line object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## Prerequisites

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

If you want to receive all of the dimension lines of a specific parent entity, you can do it with the following URL:
```
GET businesscentralPrefix/companies({id})/dimensionLines?$filter=parentId eq ({id})
```

In order to get a specific dimension line, you can use the following URL:
```
GET businesscentralPrefix/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **dimensionLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "parentId": "id-value",
  "id": "id-value",
  "code": "DEPARTMENT",
  "displayName": "Department",
  "valueId": "id-value",
  "valueCode": "SALES",
  "valueDisplayName": "Sales"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  



[Error Codes](../dynamics_error_codes.md)  
[Dimension Line](../resources/dynamics_dimensionline.md)  
[Post Dimension Line](../api/dynamics_create_dimensionline.md)  
[Patch Dimension Line](../api/dynamics_dimensionline_update.md)  
[Delete Dimension Line](../api/dynamics_dimensionline_delete.md)  