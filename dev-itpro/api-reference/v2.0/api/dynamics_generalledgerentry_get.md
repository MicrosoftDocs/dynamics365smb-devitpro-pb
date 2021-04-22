---
title: GET generalLedgerEntries | Microsoft Docs
description: Gets a generalLedgerEntry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get generalLedgerEntries

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a general ledger entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/generalLedgerEntries({id})
```

## Request headers

|Header       |Value             |
|-------------|------------------|
|Authorization|Bearer. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **generalLedgerEntries** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/generalLedgerEntries({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "9dd7b4dc-44e3-ea11-bb43-000d3a2feca1",
    "entryNumber": 1,
    "postingDate": "2019-01-15",
    "documentNumber": "PS-INV103001",
    "documentType": " ",
    "accountId": "aaa5738a-44e3-ea11-bb43-000d3a2feca1",
    "accountNumber": "10700",
    "description": "Direct Cost 20000 on 01/15/19",
    "debitAmount": 0,
    "creditAmount": 128.4,
    "lastModifiedDateTime": "2020-08-21T00:25:56.383Z"
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[generalledgerentry](../resources/dynamics_generalledgerentry.md)    
