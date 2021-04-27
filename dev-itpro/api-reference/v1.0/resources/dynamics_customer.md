---
title: customers resource type
description: Represents a customer in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# customers resource type

[!INCLUDE[d365_api_newversion](../../includes/d365_api_newversion.md)]

Represents a customer in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method          |Return Type| Description      |
|:----------------|:----------|:-----------------|
|[GET customers](../api/dynamics_customer_get.md)      |customers   |Gets a customer.   |
|[POST customers](../api/dynamics_create_customer.md)|customers   |Creates a customer.|
|[PATCH customers](../api/dynamics_customer_update.md)|customers   |Updates a customer.|
|[DELETE customers](../api/dynamics_customer_delete.md)|none        |Deletes a customer.|



## Navigation 

| Navigation    |Return Type| Description      |
|:----------|:----------|:-----------------|
|[Picture](../resources/dynamics_picture.md)|picture   |Gets the picture of customer. |
|[defaultDimensions](../resources/dynamics_defaultDimension.md)|defaultDimension   |Gets the defaultDimension of customer. |
|[customerFinancialDetail](../resources/dynamics_customerfinancialdetails.md)|customerFinancialDetail   |Gets the customerFinancialDetails of customer. |
|[currency](../resources/dynamics_currencies.md)|currency   |Gets the currency of customer. |
|[paymentTerm](../resources/dynamics_paymentTerms.md)|paymentTerm   |Gets the paymentTerm of customer. |
|[shipmentMethod](../resources/dynamics_shipmentmethods.md)|shipmentMethod   |Gets the shipmentMethod of customer. |
|[paymentMethod](../resources/dynamics_paymentmethods.md)|paymentMeth0d   |Gets the paymentMethod of customer. |




## Properties

| Property    | Type     |Description|
|:------------|:---------|:----------|
|id           |GUID      |The unique ID of the item. Non-editable.|
|number       |string    |The customer number.|
|displayName  |string    |Specifies the customer's name. This name will appear on all sales documents for the customer.|
|type         |string    |Specifies the type of customer, can be "Company" or "Person".|
|address      |[NAV.PostalAddress](../resources/dynamics_complextypes.md)|Specifies the customer's address. This address will appear on all sales documents for the customer.|
|phoneNumber  |string    |Specifies the customer's telephone number.|
|email        |string    |Specifies the customer's email address.|
|website      |string    |Specifies the customer's home page address.|
|taxLiable    |boolean   |Specifies if the customer or vendor is liable for sales tax. Set to **true** if the customer is tax liable.|
|taxAreaId    |GUID      |Specifies which tax area the customer belongs to.|
|taxAreaDisplayName|string|Specified the display name of the tax area the customer belongs to.|
|taxRegistrationNumber|string, maximum size 20|Specified the tax registration number of the customer.|
|currencyId   |GUID      |Specifies which currency the customer uses.|
|currencyCode |numeric   |The default currency code for the customer.|
|paymentTermsId|GUID     |Specifies which payment term the customer uses.|
|paymentMethodId|GUID    |Specifies which payment method the customer uses.|
|shipmentMethodId|GUID   |Specifies which shipment method the customer uses.|
|blocked      |string    |Specifies that transactions with the customer cannot be posted. Set to **All**, if the customer is blocked, set to blank if not blocked.|
|lastModifiedDateTime|datetime|The last datetime the customer was modified. Read-Only.|  


## Relationships
A Currency(currencyCode) must exist in the Currencies table.

A Payment Term(paymentTerms) must exist in the Payment Terms table.

A Shipment Method(shipmentMethod) must exist in the Shipment Method table.

A Payment Method(paymentMethod) must exist in the Payment Method table.

A Tax Area(taxArea) must exist in the Tax Area table.

Financial details of the customer (customerFinancialDetails) can be retrieved.

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "type": "string",
    "address": NAV.PostalAddress,
    "phoneNumber": "string",
    "email": "string",
    "website": "string",
    "taxLiable": "boolean",
    "taxAreaId": "GUID",
    "taxAreaDisplayName": "string",
    "taxRegistrationNumber": "string",
    "currencyCode": "string",
    "paymentTermsId": "GUID",
    "shipmentMethod": NAV.ShipmentMethod,
    "paymentMethod":  NAV.PaymentMethod,
    "blocked": "string",
    "balance": "decimal",
    "overdueAmount": "numeric",
    "totalSalesExcludingTax": "numeric",
    "lastModifiedDateTime": "datetime"
}
```
## See also
  
[Get Customers](../api/dynamics_customer_get.md)  
[Post Customers](../api/dynamics_create_customer.md)  
[Patch Customers](../api/dynamics_customer_update.md)  
[Delete Customers](../api/dynamics_customer_delete.md)  
