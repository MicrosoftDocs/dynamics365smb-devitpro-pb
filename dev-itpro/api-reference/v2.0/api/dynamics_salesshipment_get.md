---
title: GET salesShipments  
description: Gets a salesShipment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Get salesShipments
Retrieve the properties and relationships of a salesShipment object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/salesShipments({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **salesShipments** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesShipments({id})
```

**Response**

Here is an example of the response. 

```json
{
   "id": "55c99ea7-bde4-ea11-bbf2-00155df3a61",
   "number": "108001",
   "externalDocumentNumber": "",
   "invoiceDate": "2019-01-01",
   "postingDate": "2019-01-01",
   "dueDate": "2019-10-05",
   "customerPurchaseOrderReference": "",
   "customerNumber": "20000",
   "customerName": "First Up Consultants",
   "billToName": "First Up Consultants",
   "billToCustomerNumber": "20000",
   "shipToName": "First Up Consultants",
   "shipToContact": "Evan McIntosh",
   "sellToAddressLine1": "100 Day Drive",
   "sellToAddressLine2": "",
   "sellToCity": "Chicago",
   "sellToCountry": "US",
   "sellToState": "IL",
   "sellToPostCode": "61236",
   "billToAddressLine1": "100 Day Drive",
   "billToAddressLine2": "",
   "billToCity": "Chicago",
   "billToCountry": "US",
   "billToState": "IL",
   "billToPostCode": "61236",
   "shipToAddressLine1": "100 Day Drive",
   "shipToAddressLine2": "",
   "shipToCity": "Chicago",
   "shipToCountry": "US",
   "shipToState": "IL",
   "shipToPostCode": "61236",
   "currencyCode": "USD",
   "orderNumber": "34",
   "paymentTermsCode": "",
   "shipmentMethodCode": "",
   "salesperson": "PS",
   "pricesIncludeTax": false,
   "lastModifiedDateTime": "2019-01-01",
   "phoneNumber": "",
   "email": "evan.mcintosh@contoso.com"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[salesShipment](../resources/dynamics_salesShipment.md)  

