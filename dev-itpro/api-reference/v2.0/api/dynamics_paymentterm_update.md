---
title: UPDATE paymentTerms  | Microsoft Docs
description: Updates a paymentTerm object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update paymentTerms

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a payment terms object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/paymentTerms({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **paymentTerms**, the **paymentTerms** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **paymentTerms** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/paymentTerms({id})
Content-type: application/json

{
  "displayName": "Net 7 days with Discount",
  "discountPercent": 10
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
    "id": "01a5738a-44e3-ea11-bb43-000d3a2feca1",
    "code": "10 DAYS",
    "displayName": "Net 7 days with Discount",
    "dueDateCalculation": "10D",
    "discountDateCalculation": "",
    "discountPercent": 10,
    "calculateDiscountOnCreditMemos": false,
    "lastModifiedDateTime": "2020-08-21T00:24:12.633Z"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[paymentterm](../resources/dynamics_paymentterm.md)    
[Get paymentterm](dynamics_paymentterm_Get.md)    
[Delete paymentterm](dynamics_paymentterm_Delete.md)    
[Create paymentterm](dynamics_paymentterm_Create.md)    
