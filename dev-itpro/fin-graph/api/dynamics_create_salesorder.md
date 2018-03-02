---
title: Create salesOrders | Microsoft Docs
description: Creates a sales order object in Dynamics 365 for Financials. 
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

# Create salesOrders
Create a sales order object in Dynamics 365 for Financials.

## HTTP request

```
POST /financials/companies({id})/salesOrders
```

## Request headers

|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **salesOrders** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesOrders** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/salesOrders
Content-type: application/json

{
  "id": "id-value",
  "number": "1009",
  "orderDate": "2015-12-31",
  "customerNumber": "GL00000008",
  "currencyCode": "GBP",
  "paymentTerms": "COD"
}
```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Sales order](../resources/dynamics_salesorder.md)  
[Get sales order](../api/dynamics_salesorder_get.md)  
[Update sales order](../api/dynamics_salesorder_update.md)  
[Delete sales order](../api/dynamics_salesorder_delete.md)  