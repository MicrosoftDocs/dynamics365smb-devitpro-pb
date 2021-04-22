---
title: UPDATE vendorPayments   
description: Updates a vendorPayment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Update vendorPayments 
Update the properties of a vendorPayment object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/vendorPayments ({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **vendorPayment**, the **vendorPayment** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **vendorPayments ** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPayments({id})
Content-type: application/json

{
PLACE CODE HERE.
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
PLACE CODE HERE.
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)   
[vendorPayment](../resources/dynamics_vendorPayment.md)  
[Get vendorPayment](dynamics_vendorPayment_Get.md)   
[Delete vendorPayment](dynamics_vendorPayment_Delete.md)   
[Create vendorPayment](dynamics_vendorPayment_Create.md)   
