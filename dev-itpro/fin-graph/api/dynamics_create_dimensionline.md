---
title: Create dimensionLines | Microsoft Docs
description: Creates a dimension line in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/11/2017
ms.author: solsen
---

# Create dimensionLines
Create a dimension line object in Dynamics 365 for Financials.

## HTTP request

```
POST /financials/companies({id})/dimensionLines
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of a **dimensionLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **dimensionLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/dimensionLines
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Dimension line](../resources/dynamics_dimensionline.md)  
[Get dimension line](../api/dynamics_dimensionline_get.md)  
[Patch dimension line](../api/dynamics_dimensionline_update.md)  
[Delete dimension line](../api/dynamics_dimensionline_delete.md)  