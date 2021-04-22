---
title: GET purchaseReceipts | Microsoft Docs
description: Gets a purchaseReceipt object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Get purchaseReceipts
Retrieve the properties and relationships of a purchaseReceipt object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/purchaseReceipts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **purchaseReceipts** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseReceipts({id})
```

**Response**

Here is an example of the response. 

```json
{
   "id": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
   "number": "108001",
   "invoiceDate": "2019-01-01",
   "postingDate": "2019-01-01",
   "dueDate": "2019-01-01",
   "vendorNumber": "20000",
   "vendorName": "First Up Consultants",
   "payToName": "First Up Consultants",
   "payToContact": "Evan McIntosh",
   "payToVendorNumber": "20000",
   "shipToName": "First Up Consultants",
   "shipToContact": "Evan McIntosh",
   "buyFromAddressLine1": "100 Day Drive",
   "buyFromAddressLine2": "",
   "buyFromCity": "Chicago",
   "buyFromCountry": "US",
   "buyFromState": "IL",
   "buyFromPostCode": "61236",
   "shipToAddressLine1": "100 Day Drive",
   "shipToAddressLine2": "",
   "shipToCity": "Chicago",
   "shipToCountry": "US",
   "shipToState": "IL",
   "shipToPostCode": "61236",
   "payToAddressLine1": "100 Day Drive",
   "payToAddressLine2": "",
   "payToCity": "Chicago",
   "payToCountry": "US",
   "payToState": "IL",
   "payToPostCode": "61236",
   "currencyCode": "USD",
   "lastModifiedDateTime": "2019-01-01"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseReceipt](../resources/dynamics_purchaseReceipt.md)  

