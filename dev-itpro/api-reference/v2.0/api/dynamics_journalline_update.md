---
title: Update journalLines | Microsoft Docs
description: Updates a journal line in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update journalLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a journal lines object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/journals({id})/journalLines({id})
```

## Request headers

| Header       | Value                    |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |
|Content-Type  |application/json          |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **journalLines**, the **journalLines** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **journalLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/journals({id})/journalLines({id})
Content-type: application/json

{
  "amount": 0
}
```

**Response**

```json
HTTP/1.1 200 OK
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
[journalline](../resources/dynamics_journalline.md)    
[Get journalline](dynamics_journalline_Get.md)    
[Delete journalline](dynamics_journalline_Delete.md)    
[Create journalline](dynamics_journalline_Create.md)    
