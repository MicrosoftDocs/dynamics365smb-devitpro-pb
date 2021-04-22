---
title: Get journalLines | Microsoft Docs
description: Gets a journal line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get journalLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a journal line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/journals({id})/journalLines({id})
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **journalLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/journals({id})/journalLines({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
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
[journalline](../resources/dynamics_journalline.md)    
[Delete journalline](dynamics_journalline_Delete.md)    
[Create journalline](dynamics_journalline_Create.md)    
[Update journalline](dynamics_journalline_Update.md)    
