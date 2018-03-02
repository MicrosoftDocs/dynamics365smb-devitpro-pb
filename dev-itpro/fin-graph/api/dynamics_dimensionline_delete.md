---
title: Delete dimensionLines | Microsoft Docs
description: Deletes a dimension line object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# Delete dimensionLines
Delete a dimension line object from Dynamics 365 for Financials.

## HTTP request
```
DELETE /financials/companies({id})/dimensionLines(parentId=({id}),id=({id}))
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
DELETE https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/dimensionLines(parentId=({id}),id=({id}))
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Dimension line](../resources/dynamics_dimensionline.md)  
[Get dimension line](../api/dynamics_dimensionline_get.md)  
[Post dimension line](../api/dynamics_create_dimensionline.md)  
[Patch dimension line](../api/dynamics_dimensionline_update.md)  