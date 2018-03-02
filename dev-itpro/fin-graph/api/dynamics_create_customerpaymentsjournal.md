---
title: Create customerPaymentsJournals | Microsoft Docs
description: Creates a customer payments journal object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# Create customerPaymentsJournals
Creates a customer payments journal object in Dynamics 365 for Financials.

## HTTP request

```
POST /financials/companies({id})/customerPaymentsJournals({id})
```

## Request headers
|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of **customerPaymentsJournals** object.

## Response
If successful, this method returns ```201 Created``` response code and a **customerPaymentsJournals** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/customerPaymentsJournals
Content-type: application/json

```json
{
  "code": "DEFAULT"
}
```

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "code": "DEFAULT",
  "displayName": "Default Journal Batch",
  "lastModifiedDateTime": "2017-05-17T11:30:01.313Z"
}
```

## See also
[Microsoft Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Customer payments journal](../resources/dynamics_customerpaymentsjournal.md)  
[Get customer payments journal](dynamics_customerpaymentsjournal_get.md)  
[Patch customer payments journal](dynamics_customerpaymentsjournal_update.md)  
[Delete customer payments journal](dynamics_customerpaymentsjournal_delete.md)  