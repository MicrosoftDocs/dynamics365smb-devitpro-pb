---
title: CREATE customerPaymentJournals | Microsoft Docs
description: Creates a customerPaymentJournal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create customerPaymentJournals

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create a customerPaymentJournal object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/customerPaymentJournals({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of **customerPaymentJournals** object.

## Response
If successful, this method returns ```201 Created``` response code and a **customerPaymentJournals** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/customerPaymentJournals
Content-type: application/json

{
    "id": "dc1b6a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "GENERAL",
    "displayName": "GENERAL",
    "lastModifiedDateTime": "2020-08-21T00:24:35.687Z",
    "balancingAccountId": "00000000-0000-0000-0000-000000000000",
    "balancingAccountNumber": "10100"
}
```

**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

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
[Get customerpaymentjournal](dynamics_customerpaymentjournal_Get.md)    
[Delete customerpaymentjournal](dynamics_customerpaymentjournal_Delete.md)    
[Update customerpaymentjournal](dynamics_customerpaymentjournal_Update.md)    
