---
title: Get salesOrders  
description: Gets a sales order object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Get salesOrders

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a sales order object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/salesOrders({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **salesOrders** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesOrders({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "id": "b6f4017a-b749-ee11-ad0b-a1422c0f7f1f",
  "number": "101005",
  "externalDocumentNumber": "",
  "orderDate": "2015-12-31",
  "postingDate": "2023-09-02",
  "customerId": "c04c550b-593f-ee11-be74-6045bdc8c285",
  "customerNumber": "10000",
  "customerName": "Adatum Corporation",
  "billToName": "Adatum Corporation",
  "billToCustomerId": "c04c550b-593f-ee11-be74-6045bdc8c285",
  "billToCustomerNumber": "10000",
  "shipToName": "Adatum Corporation",
  "shipToContact": "Robert Townes",
  "sellToAddressLine1": "Station Road, 21",
  "sellToCity": "Cambridge",
  "sellToCountry": "GB",
  "billToAddressLine1": "Station Road, 21",
  "billToAddressLine2": "",
  "billToCity": "Cambridge",
  "billToCountry": "GB",
  "shipToAddressLine1": "Station Road, 21",
  "shipToCity": "Cambridge",
  "shipToCountry": "GB",
  "shortcutDimension1Code": "",
  "shortcutDimension2Code": "MEDIUM",
  "currencyId": "00000000-0000-0000-0000-000000000000",
  "currencyCode": "GBP",
  "paymentTermsId": "0e8b5305-593f-ee11-be74-6045bdc8c285",
  "shipmentMethodId": "774c550b-593f-ee11-be74-6045bdc8c285",
  "salesperson": "JO",
  "lastModifiedDateTime": "2023-09-02T17:49:38.5Z",
  "phoneNumber": "",
  "email": "robert.townes@contoso.com"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[salesorder](../resources/dynamics_salesorder.md)    
[Delete salesorder](dynamics_salesorder_Delete.md)    
[Create salesorder](dynamics_salesorder_Create.md)    
[Update salesorder](dynamics_salesorder_Update.md)    
