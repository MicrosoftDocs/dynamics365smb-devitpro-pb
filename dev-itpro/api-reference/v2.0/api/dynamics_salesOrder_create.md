---
title: Create salesOrders  
description: Creates a sales order object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create salesOrders

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales order object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesOrders
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **salesOrder**, the **salesOrder** will not be updated. |

## Request body
In the request body, supply a JSON representation of a **salesOrders** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesOrders** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesOrders
Content-type: application/json

{
  "orderDate": "2023-09-01",
  "customerNumber": "GL00000008",
  "currencyCode": "GBP",
  "paymentTermsId": "3bb5b4b6-ea4c-43ca-ba1c-3b69e29a6668"
}
```

**Response**

Here is an example of a response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "b6f4017a-b749-ee11-ad0b-a1422c0f7f1f",
    "number": "101005",
    "externalDocumentNumber": "",
    "orderDate": "2023-09-01",
    "postingDate": "2023-09-02",
    "customerId": "c04c550b-593f-ee11-be74-6045bdc8c285",
    "customerNumber": "10000",
    "customerName": "Adatum Corporation",
    "billToName": "Adatum Corporation",
    "billToCustomerId": "c04c550b-593f-ee11-be74-6045bdc8c285",
    "billToCustomerNumber": "10000",
    "shipToName": "Adatum Corporation",
    "sellToAddressLine1": "Station Road, 21",
    "billToAddressLine1": "Station Road, 21",
    "shipToAddressLine1": "Station Road, 21",
    "shortcutDimension1Code": "",
    "shortcutDimension2Code": "MEDIUM",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "GBP",
    "pricesIncludeTax": false,
    "paymentTermsId": "0e8b5305-593f-ee11-be74-6045bdc8c285",
    "shipmentMethodId": "774c550b-593f-ee11-be74-6045bdc8c285",
    "salesperson": "JO",
    "partialShipping": true,
    "requestedDeliveryDate": "0001-01-01",
    "discountAmount": 0,
    "discountAppliedBeforeTax": false,
    "totalAmountExcludingTax": 0,
    "totalTaxAmount": 0,
    "totalAmountIncludingTax": 0,
    "fullyShipped": false,
    "status": "Draft",
    "lastModifiedDateTime": "2023-09-02T17:38:08.537Z",
    "phoneNumber": "",
    "email": "robert.townes@contoso.com",
    "documentLines": [
       {
          "lineType": "Item",
          "lineNo": 1000,
          "itemNo": "ITEM001",
          "quantity": 10,
          "unitOfMeasureCode": "EA"
       }
    ]
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Order](../resources/dynamics_salesorder.md)  
[Get Sales Order](dynamics_salesorder_get.md)  
[Update Sales Order](dynamics_salesorder_update.md)  
[Delete Sales Order](dynamics_salesorder_delete.md)  
