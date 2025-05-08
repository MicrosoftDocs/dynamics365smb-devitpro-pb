---
title: Create purchaseCreditMemos
description: Creates a purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create purchaseCreditMemos

Creates a purchase credit memo in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/purchaseCreditMemos({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **purchaseCreditMemo** object.

## Response

If successful, this method returns ```201 Created``` response code and a **purchaseCreditMemo** object in the response body.


## Example

**Request**

Here's an example of the request.
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos
Content-type: application/json
{
    "number" : "PC1001",
    "creditMemoDate" : "2025-04-01",
    "postingDate" : "2025-04-01",
    "dueDate" : "2025-04-15",
    "vendorId" : "12345",
    "vendorNumber" : "V001",
    "vendorName" : "Contoso Supplies",
    "payToVendorId" : "67890",
    "payToVendorNumber" : "V002",
    "payToName" : "Contoso Payables",
    "buyFromAddressLine1" : "123 Elm Street",
    "buyFromAddressLine2" : "Suite 100",
    "buyFromCity" : "Redmond",
    "buyFromCountry" : "US",
    "buyFromState" : "WA",
    "buyFromPostCode" : "98052",
    "payToAddressLine1" : "456 Oak Avenue",
    "payToAddressLine2" : "Building A",
    "payToCity" : "Seattle",
    "payToCountry" : "US",
    "payToState" : "WA",
    "payToPostCode" : "98101",
    "shortcutDimension1Code" : "SALES",
    "shortcutDimension2Code" : "REGION1",
    "currencyId" : "USD",
    "currencyCode" : "USD",
    "paymentTermsId" : "NET30",
    "shipmentMethodId" : "GROUND",
    "purchaser" : "John Doe",
    "pricesIncludeTax" : true,
    "discountAmount" : 50.00,
    "discountAppliedBeforeTax" : true,
    "totalAmountExcludingTax" : 950.00,
    "totalTaxAmount" : 95.00,
    "totalAmountIncludingTax" : 1045.00,
    "status" : "Open",
    "lastModifiedDateTime" : "2025-04-01T10:00:00Z",
    "invoiceId" : "INV12345",
    "invoiceNumber" : "INV-2025-001",
    "vendorReturnReasonId" : "DAMAGED"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "PC1001-ID",
    "number" : "PC1001",
    "creditMemoDate" : "2025-04-01",
    "postingDate" : "2025-04-01",
    "dueDate" : "2025-04-15",
    "vendorId" : "12345",
    "vendorNumber" : "V001",
    "vendorName" : "Contoso Supplies",
    "payToVendorId" : "67890",
    "payToVendorNumber" : "V002",
    "payToName" : "Contoso Payables",
    "buyFromAddressLine1" : "123 Elm Street",
    "buyFromAddressLine2" : "Suite 100",
    "buyFromCity" : "Redmond",
    "buyFromCountry" : "US",
    "buyFromState" : "WA",
    "buyFromPostCode" : "98052",
    "payToAddressLine1" : "456 Oak Avenue",
    "payToAddressLine2" : "Building A",
    "payToCity" : "Seattle",
    "payToCountry" : "US",
    "payToState" : "WA",
    "payToPostCode" : "98101",
    "shortcutDimension1Code" : "SALES",
    "shortcutDimension2Code" : "REGION1",
    "currencyId" : "USD",
    "currencyCode" : "USD",
    "paymentTermsId" : "NET30",
    "shipmentMethodId" : "GROUND",
    "purchaser" : "John Doe",
    "pricesIncludeTax" : true,
    "discountAmount" : 50.00,
    "discountAppliedBeforeTax" : true,
    "totalAmountExcludingTax" : 950.00,
    "totalTaxAmount" : 95.00,
    "totalAmountIncludingTax" : 1045.00,
    "status" : "Open",
    "lastModifiedDateTime" : "2025-04-01T10:00:00Z",
    "invoiceId" : "INV12345",
    "invoiceNumber" : "INV-2025-001",
    "vendorReturnReasonId" : "DAMAGED"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemo](../resources/dynamics_purchaseCreditMemo.md)  
[GET purchaseCreditMemo](dynamics_purchasecreditmemo_get.md)  
[DELETE purchaseCreditMemo](dynamics_purchasecreditmemo_delete.md)  
[PATCH purchaseCreditMemo](dynamics_purchasecreditmemo_update.md)
