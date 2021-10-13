---
title: Update customerPayments  
description: Updates a customer payment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Update customerPayments

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the properties of a customer payment object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/customerPaymentsJournals({id})/customerPayments({id})
PATCH businesscentralPrefix/companies({id})/customerPayments({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **customerPayments**, the **customerPayments** will not be updated.    |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **customerPayments** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/customerPaymentsJournals({id})/customerPayments({id})
Content-type: application/json

{
  "amount": 1500
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
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
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[customerpayment](../resources/dynamics_customerpayment.md)    
[Get customerpayment](dynamics_customerpayment_Get.md)    
[Delete customerpayment](dynamics_customerpayment_Delete.md)    
[Create customerpayment](dynamics_customerpayment_Create.md)    
