---
title: (v1.0) Delete salesOrderLines
description: (v1.0) Deletes a sales order line object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Delete salesOrderLines (v1.0)
Delete a sales order line object from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/salesOrders({id})/salesOrderLines({salesCreditMemoLineId})
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **salesOrderLines**, the **salesOrderLines** will not be updated. |

## Request body (v1.0)
Do not supply a request body for this method.

## Response (v1.0)
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v1.0/companies({id})/salesOrders({id})/salesOrderLines({salesOrderLineId})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Order Line](../resources/dynamics_salesorderline.md)  
[Get Sales Order Line](../api/dynamics_salesorderline_get.md)  
[Create Sales Order Line](../api/dynamics_create_salesorderline.md)  
[Update Sales Order Line](../api/dynamics_salesorderline_update.md)  