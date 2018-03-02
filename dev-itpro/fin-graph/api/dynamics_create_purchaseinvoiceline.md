---
title: Create purchaseInvoiceLines | Microsoft Docs
description: Creates a purchase invoice line object in Dynamics 365 for Financials.
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

# Create purchaseInvoiceLines
Create a purchase invoice line object in Dynamics 365 for Financials.

## HTTP request

```
POST /financials/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines
```

## Request headers

|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **purchaseInvoiceLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **purchaseInvoiceLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines
Content-type: application/json

{
"itemId": "id-value",
"lineType": "Item",
"quantity": 9
}
```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Purchase invoice line](../resources/dynamics_purchaseinvoiceline.md)  
[Get purchase invoice line](../api/dynamics_purchaseinvoiceline_get.md)  
[Update purchase invoice line](../api/dynamics_purchaseinvoiceline_update.md)  
[Delete purchase invoice line](../api/dynamics_purchaseinvoiceline_delete.md)  