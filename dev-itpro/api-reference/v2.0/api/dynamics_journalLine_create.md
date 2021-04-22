---
title: Create journalLines | Microsoft Docs
description: Creates a journal line in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create journalLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Creates a journal line object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/journals({id})/journalLines({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of **journalLines** object.

## Response
If successful, this method returns ```201 Created``` response code and **journalLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/journals({id})/journalLines
Content-type: application/json

{
    "id": "0a077d18-45e3-ea11-bb43-000d3a2feca1",
    "journalId": "dd1b6a90-44e3-ea11-bb43-000d3a2feca1",
    "journalDisplayName": "DEFAULT",
    "lineNumber": 10000,
    "accountType": "G/L Account",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "accountNumber": "",
    "postingDate": "2018-12-31",
    "documentNumber": "",
    "externalDocumentNumber": "",
    "amount": 0,
    "description": "",
    "comment": "",
    "lastModifiedDateTime": "0001-01-01T00:00:00Z"
}
```
**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "0a077d18-45e3-ea11-bb43-000d3a2feca1",
    "journalId": "dd1b6a90-44e3-ea11-bb43-000d3a2feca1",
    "journalDisplayName": "DEFAULT",
    "lineNumber": 10000,
    "accountType": "G/L Account",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "accountNumber": "",
    "postingDate": "2018-12-31",
    "documentNumber": "",
    "externalDocumentNumber": "",
    "amount": 0,
    "description": "",
    "comment": "",
    "lastModifiedDateTime": "0001-01-01T00:00:00Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Graph Reference](dynamics_graph_reference.md)  
[Journal Line](../resources/dynamics_journalline.md)  
[Get Journal Line](dynamics_journalline_get.md)  
[Update Journal Line](dynamics_journalline_update.md)  
[Delete Journal Line](dynamics_journalline_delete.md)  