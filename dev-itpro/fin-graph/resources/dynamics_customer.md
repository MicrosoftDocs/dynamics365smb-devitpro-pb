---
title: customers resource type | Microsoft Docs
description: Represents a customer in Dynamics 365 for Finance and Operations, Business edition.
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# customers resource type
Represents a customer in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                              |Return Type| Description      |
|:----------------------------------------------------|:----------|:-----------------|
|[GET customers](../api/dynamics_customer_get.md)      |customers   |Gets a customer.   |
|[CREATE customers](../api/dynamics_create_customer.md)|customers   |Creates a customer.|
|[UPDATE customers](../api/dynamics_customer_update.md)|customers   |Updates a customer.|
|[DELETE customers](../api/dynamics_customer_delete.md)|none        |Deletes a customer.|

## Properties
| Property	  | Type	 |Description|
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
|paymentTerms |[NAV.PaymentTermsType](../resources/dynamics_complextypes.md)|Specifies a code that indicates the payment terms that you require of the customer.|
|paymentMethodId|GUID    |Specifies which payment method the customer uses.|
|paymentMethod|[NAV.PaymentMethod](../resources/dynamics_complextypes.md)|Specifies how the customer usually submits payment, such as bank transfer or check.|
|shipmentMethodId|GUID   |Specifies which shipment method the customer uses.|
|shipmentMethod|[NAV.ShipmentMethod](../resources/dynamics_complextypes.md)|Specifies which shipment method to use when you ship items to the customer.|
|blocked      |string    |Specifies that transactions with the customer cannot be posted. Set to **All**, if the customer is blocked, set to blank if not blocked.|
|balance      |numeric   |Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer's balance. Read-Only.|
|overdueAmount|numeric   |Specifies the customer's overdue amount.|
|totalSalesExcludingTax|numeric|Specifies the total sales amount excluding tax of the customer.|
|lastModifiedDateTime|datetime|The last datetime the customer was modified. Read-Only.|  


## Relationships
A Currency(currencyCode) must exist in the Currencies table.

A Payment Term(paymentTerms) must exist in the Payment Terms table.

A Shipment Method(shipmentMethod) must exist in the Shipment Method table.

A Payment Method(paymentMethod) must exist in the Payment Method table.

A Tax Area(taxArea) must exist in the Tax Area table.

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
    "paymentTerms": NAV.PaymentTermsType,
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get customers](../api/dynamics_customer_get.md)  
[Post customers](../api/dynamics_create_customer.md)  
[Patch customers](../api/dynamics_customer_update.md)  
[Delete customers](../api/dynamics_customer_delete.md)  
