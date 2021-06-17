---
title: (v1.0) Create dimensionLines
description: (v1.0) Creates a dimension line in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create dimensionLines (v1.0)
Create a dimension line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/dimensionLines
```

## Request headers (v1.0)

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body (v1.0)
In the request body, supply a JSON representation of a **dimensionLines** object.
## Response (v1.0)
If successful, this method returns ```201 Created``` response code and a **dimensionLines** object in the response body.

## Example (v1.0)

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/dimensionLines
Content-type: application/json

{
  "parentId" : "parentId-value",
  "id" : "id-value",
  "code" : "DEPARTMENT",
  "valueId" : "valueId-value",
  "valueCode" : "SALES"
}
```
**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "parentId" : "parentId-value",
  "id" : "id-value",
  "code" : "DEPARTMENT",
  "displayName": "Department",
  "valueId" : "valueId-value",
  "valueCode" : "SALES",
  "valueDisplayName": "Production"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
  
[Dimension Line](../resources/dynamics_dimensionline.md)  
[Get Dimension Line](../api/dynamics_dimensionline_get.md)  
[Patch Dimension Line](../api/dynamics_dimensionline_update.md)  
[Delete Dimension Line](../api/dynamics_dimensionline_delete.md)  