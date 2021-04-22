---
title: UPDATE customerPaymentJournals  | Microsoft Docs
description: Updates a customerPaymentJournal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update customerPaymentJournals 

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a customerPaymentJournal object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/customerPaymentJournals({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **customerPaymentJournals**, the **customerPaymentJournals** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **customerPaymentJournals** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/customerPaymentJournals({id})
Content-type: application/json

{
  "code": "GENERAL",
  "displayName": "GENERAL"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
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
[Create customerpaymentjournal](dynamics_customerpaymentjournal_Create.md)    
