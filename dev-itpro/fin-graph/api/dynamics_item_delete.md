---
title: Delete items | Microsoft Docs
description: Deletes an item object in Dynamics 365 for Financials.
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

# Delete items
Delete an item from Dynamics 365 for Financials.

## HTTP request
```
DELETE /financials/companies({id})/items({id})
```

## Request headers
|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **items**, the **items** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/items({id})
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
[Item](../resources/dynamics_item.md)  
[Get item](../api/dynamics_item_get.md)  
[Post item](../api/dynamics_create_item.md)  
[Patch item](../api/dynamics_item_update.md)  