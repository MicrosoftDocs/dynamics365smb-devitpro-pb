---
title: (v1.0) Create salesOrderLines
description: (v1.0) Creates a sales order line object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create salesOrderLines (v1.0)
Create a sales order line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesOrders({id})/salesOrderLines
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json    |

## Request body (v1.0)
In the request body, supply a JSON representation of a **salesOrderLines** object.
## Response (v1.0)
If successful, this method returns ```201 Created``` response code and a **salesOrderLines** object in the response body.

## Example (v1.0)

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/salesOrders({id})/salesOrderLines
Content-type: application/json

{
"itemId": "id-value",
"lineType": "Item",
"quantity": 9
}
```
## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Order Line](../resources/dynamics_salesorderline.md)  
[Get Sales Order Line](../api/dynamics_salesorderline_get.md)  
[Update Sales Order Line](../api/dynamics_salesorderline_update.md)  
[Delete Sales Order Line](../api/dynamics_salesorderline_delete.md)  