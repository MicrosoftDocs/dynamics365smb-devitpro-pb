---
title: UPDATE vendorPaymentJournals  | Microsoft Docs
description: Updates a vendorPaymentJournal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Update vendorPaymentJournals 
Update the properties of a vendorPaymentJournal object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/vendorPaymentJournals ({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **vendorPaymentJournal**, the **vendorPaymentJournal** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **vendorPaymentJournals ** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPaymentJournals({id})
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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)   
[vendorPaymentJournal](../resources/dynamics_vendorPaymentJournal.md)  
[Get vendorPaymentJournal](dynamics_vendorPaymentJournal_Get.md)   
[Delete vendorPaymentJournal](dynamics_vendorPaymentJournal_Delete.md)   
[Create vendorPaymentJournal](dynamics_vendorPaymentJournal_Create.md)   
