---
title: Create paymentMethods | Microsoft Docs
description: Creates a payment method object in Dynamics 365 for Financials.
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

# Create paymentMethods
Create a payment method object in Dynamics 365 for Financials.

## HTTP request
```
POST /financials/companies({id})/paymentMethods
```

## Request headers
|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **paymentMethods** object.

## Response
If successful, this method returns ```201 Created``` response code and a **paymentMethods** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/paymentMethods
Content-type: application/json

{
  "code": "CHECK",
  "displayName": "Check payment"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "code": "CHECK",
  "displayName": "Check payment",
  "lastModifiedDateTime": "2017-03-22T08:35:48.33Z"
}

```



## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Payment methods](../resources/dynamics_paymentmethods.md)  
[Get payment methods](../api/dynamics_paymentmethods_get.md)  
[Update payment methods](../api/dynamics_paymentmethods_update.md)  
[Delete payment methods](../api/dynamics_paymentmethods_delete.md)  