---
title: Create salesCreditMemos  
description: Creates a sales credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 02/16/2026
ms.author: solsen
ms.reviewer: solsen
---

# Create salesCreditMemos

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales credit memo object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesCreditMemos
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of a **salesCreditMemos** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesCreditMemos** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesCreditMemos
Content-type: application/json

{
  "creditMemoDate": "2022-12-27",
  "customerNumber": "10000",
  "currencyCode": "GBP",
  "paymentTermsId": "a0a51911-e48a-ed11-af3b-cf75db0ab305"
}
```

**Response**

Here's an example of a response.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "1e8cb9c0-44e3-ea11-bb43-000d3a2feca1",
  "number": "1009",
  "creditMemoDate": "2022-12-27",
  "dueDate": "2023-01-27",
  "customerId": "customerId-value",
  "contactId": "",
  "customerNumber": "10000",
  "customerName": "Adatum Corporation",
  "billingPostalAddress": {
    "street": "",
    "city": "",
    "state": "",
    "countryLetterCode": "",
    "postalCode": ""
  }
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Sales Credit Memo](../resources/dynamics_salescreditmemo.md)  
[Get Sales Credit Memo](dynamics_salescreditmemo_get.md)  
[Update Sales Credit Memo](dynamics_salescreditmemo_update.md)  
[Delete Sales Credit Memo](dynamics_salescreditmemo_delete.md)  
