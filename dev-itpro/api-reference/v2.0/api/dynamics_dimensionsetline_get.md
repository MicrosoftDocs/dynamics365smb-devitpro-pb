---
title: GET dimensionSetLines  
description: Gets a dimensionSetLine object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Get dimensionSetLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a dimensionSetLine object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/salesOrders({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/journalLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesOrderLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesQuotes({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesQuoteLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesCreditMemos({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesCreditMemoLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesInvoices({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesInvoiceLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesShipments({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/salesShipmentLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/purchaseInvoices({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/purchaseInvoiceLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/purchaseReceipts({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/purchaseReceiptLines({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/generalLedgerEntries({id})/dimensionSetLines({id})
GET businesscentralPrefix/companies({id})/timeRegistrationEntries({id})/dimensionSetLines({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **dimensionSetLines** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesOrders({id})/dimensionSetLines({id})
```

**Response**

Here is an example of the response. 

```json
{
    "id": "55c99ea7-bde4-ea11-bbf2-00155df3a615",
    "code": "BUSINESSGROUP",
    "parentId": "85d8a1c5-bde4-ea11-bbf2-00155df3a615",
    "parentType": "Sales Order",
    "displayName": "Business Group",
    "valueId": "56c99ea7-bde4-ea11-bbf2-00155df3a615",
    "valueCode": "HOME",
    "valueDisplayName": "Home"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[dimensionsetline](../resources/dynamics_dimensionsetline.md)    
[Delete dimensionsetline](dynamics_dimensionsetline_Delete.md)    
[Create dimensionsetline](dynamics_dimensionsetline_Create.md)    
[Update dimensionsetline](dynamics_dimensionsetline_Update.md)    
