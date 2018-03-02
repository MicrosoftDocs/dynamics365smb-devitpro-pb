---
title: Create salesCreditMemos | Microsoft Docs
description: Creates a sales credit memo object in Dynamics 365 for Financials.
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

# Create salesCreditMemos
Create a sales credit memo object in Dynamics 365 for Financials.

## HTTP request

```
POST /financials/companies({id})/salesCreditMemos
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required.    |
|Content-Type  |application/json    |

## Request body
In the request body, supply a JSON representation of a **salesCreditMemos** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesCreditMemos** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/salesCreditMemos
Content-type: application/json

{
  "id": "id-value",
  "number": "1009",
  "creditMemoDate": "2015-12-31",
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
[Sales credit memo](../resources/dynamics_salescreditmemo.md)  
[Get sales credit memo](../api/dynamics_salescreditmemo_get.md)  
[Update sales credit memo](../api/dynamics_salescreditmemo_update.md)  
[Delete sales credit memo](../api/dynamics_salescreditmemo_delete.md)  