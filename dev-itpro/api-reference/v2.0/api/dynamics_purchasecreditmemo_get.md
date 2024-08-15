---
title: Get purchaseCreditMemos
description: Gets a purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get purchaseCreditMemos

Retrieves the properties and relationships of a purchase credit memo object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```
GET businesscentralPrefix/companies({id})/purchaseCreditMemos({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseCreditMemo** object in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
{
    "id" : "",
    "number" : "",
    "creditMemoDate" : "",
    "postingDate" : "",
    "dueDate" : "",
    "vendorId" : "",
    "vendorNumber" : "",
    "vendorName" : "",
    "payToVendorId" : "",
    "payToVendorNumber" : "",
    "payToName" : "",
    "buyFromAddressLine1" : "",
    "buyFromAddressLine2" : "",
    "buyFromCity" : "",
    "buyFromCountry" : "",
    "buyFromState" : "",
    "buyFromPostCode" : "",
    "payToAddressLine1" : "",
    "payToAddressLine2" : "",
    "payToCity" : "",
    "payToCountry" : "",
    "payToState" : "",
    "payToPostCode" : "",
    "shortcutDimension1Code" : "",
    "shortcutDimension2Code" : "",
    "currencyId" : "",
    "currencyCode" : "",
    "paymentTermsId" : "",
    "shipmentMethodId" : "",
    "purchaser" : "",
    "pricesIncludeTax" : "",
    "discountAmount" : "",
    "discountAppliedBeforeTax" : "",
    "totalAmountExcludingTax" : "",
    "totalTaxAmount" : "",
    "totalAmountIncludingTax" : "",
    "status" : "",
    "lastModifiedDateTime" : "",
    "invoiceId" : "",
    "invoiceNumber" : "",
    "vendorReturnReasonId" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemo](../resources/dynamics_purchaseCreditMemo.md)  
[DELETE purchaseCreditMemo](dynamics_purchasecreditmemo_delete.md)  
[POST purchaseCreditMemo](dynamics_purchasecreditmemo_create.md)  
[PATCH purchaseCreditMemo](dynamics_purchasecreditmemo_update.md)  
