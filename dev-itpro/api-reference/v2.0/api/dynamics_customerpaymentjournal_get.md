---
title: GET customerPaymentJournals | Microsoft Docs
description: Gets a customerPaymentJournal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get customerPaymentJournals

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a customer payment journal object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/customerPaymentJournals({id})
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **customerPaymentJournals** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/customerPaymentJournals({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "dc1b6a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "GENERAL",
    "displayName": "GENERAL",
    "lastModifiedDateTime": "2020-08-21T00:24:35.687Z",
    "balancingAccountId": "00000000-0000-0000-0000-000000000000",
    "balancingAccountNumber": "10100"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[customerpaymentjournal](../resources/dynamics_customerpaymentjournal.md)    
[Delete customerpaymentjournal](dynamics_customerpaymentjournal_Delete.md)    
[Create customerpaymentjournal](dynamics_customerpaymentjournal_Create.md)    
[Update customerpaymentjournal](dynamics_customerpaymentjournal_Update.md)    
