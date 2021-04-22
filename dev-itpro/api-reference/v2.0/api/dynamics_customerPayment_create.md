---
title: Create customerPayments | Microsoft Docs
description: Creates a customer payment object in Dynamics 365 Business Central.
documentationcenter: ''
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create customerPayments

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Creates a customer payment object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/customerPaymentJournals({id})/customerPayment({id})
POST businesscentralPrefix/companies({id})/customerPayments({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of **customerPayment** object.

## Response
If successful, this method returns ```201 Created``` response code and a **customerPayment** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/customerPayment
Content-type: application/json

{
    "id": "17cce948-c6a5-4861-8ff5-30428ed83207",
    "lineNumber": 10000,
    "customerId": "customerId-value",
    "customerNumber": "10400",
    "contactId": "string",
    "postingDate": "2015-12-31",
    "documentNumber": "1234",
    "externalDocumentNumber": "",
    "amount": 1500,
    "appliesToInvoiceId": "appliesToInvoiceId-value",
    "appliesToInvoiceNumber": "100000",
    "description": "",
    "comment": "",
    "lastModifiedDateTime": "2017-03-17T19:02:22.043Z"
}
```
**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "17cce948-c6a5-4861-8ff5-30428ed83207",
    "lineNumber": 10000,
    "customerId": "customerId-value",
    "customerNumber": "10400",
    "contactId": "string",
    "postingDate": "2015-12-31",
    "documentNumber": "1234",
    "externalDocumentNumber": "",
    "amount": 1500,
    "appliesToInvoiceId": "appliesToInvoiceId-value",
    "appliesToInvoiceNumber": "100000",
    "description": "",
    "comment": "",
    "lastModifiedDateTime": "2017-03-17T19:02:22.043Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[Customer Payments](../resources/dynamics_customerpayment.md)  
[Get Customer Payments](dynamics_customerpayment_get.md)  
[Patch Customer Payments](dynamics_customerpayment_update.md)  
[Delete Customer Payments](dynamics_customerpayment_delete.md)  
