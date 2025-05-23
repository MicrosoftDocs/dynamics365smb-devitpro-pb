---
title: salesShipment resource type  
description: A sales shipment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# salesShipment resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a sales shipment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesShipment](../api/dynamics_salesshipment_get.md)|salesShipment|Gets a sales shipment object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customer](dynamics_customer.md)|customer |Gets the customer of the salesShipment.|
|[salesShipmentLines](dynamics_salesshipmentline.md)|salesShipmentLines |Gets the salesshipmentlines of the salesShipment.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesShipment.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales shipment. Non-editable.|
|number|string|Specifies the number of the sales shipment.|
|externalDocumentNumber|string|Specifies an external document number for the sales shipment.|
|invoiceDate|date|The invoice date .|
|postingDate|date|The date that the sales shipment is posted.|
|dueDate|date|The date the sales shipment is due.|
|customerPurchaseOrderReference|string|The customer purchase order reference for the invoice.|
|customerId|GUID|The unique ID of customer.  |
|customerNumber|string|The customer's number.|
|customerName|string|The customer's name.|
|billToCustomerId|GUID|Bill to customer id.|
|billToName|string|Bill to name.|
|billToCustomerNumber|string|Bill to customer number.|
|shipToName|string|Ship to name.|
|shipToContact|string|Ship to contact.|
|sellToAddressLine1|string|Sell to address line 1.|
|sellToAddressLine2|string|Sell to address line 2.|
|sellToCity|string|Sell to city.|
|sellToCountry|string|Sell to country.|
|sellToState|string|Sell to state.|
|sellToPostCode|string|Sell to post code.|
|billToAddressLine1|string|Bill to address line 1.|
|billToAddressLine2|string|Bill to address line 2.|
|billToCity|string|Bill to city.|
|billToCountry|string|Bill to country.|
|billToState|string|Bill to state.|
|billToPostCode|string|Bill to post code.|
|shipToAddressLine1|string|Ship to address line 1.|
|shipToAddressLine2|string|Ship to address line 2.|
|shipToCity|string|Ship to city.|
|shipToCountry|string|Ship to country.|
|shipToState|string|Ship to state.|
|shipToPostCode|string|Ship to post code.|
|currencyCode|string|The default currency code for the sales shipment.|
|orderNumber|string|The number of the order to which the sales shipment is associated to. Read-Only.|
|paymentTermsCode|string|Specifies the code of the payment term that the sales shipment uses.|
|shipmentMethodCode|string|Specifies the code of the shipment method that sales shipment uses.|
|salesperson|string|The salesperson code for the sales shipment.|
|pricesIncludeTax|boolean|Specifies whether the prices include Tax or not. Read-Only.|
|lastModifiedDateTime|datetime|The last datetime the sales shipment was modified. Read-Only.|
|phoneNumber|string|Specifies the sales shipment's telephone number.|
|email|string|Specifies the sales shipment's email address.|

## JSON representation

Here's a JSON representation of the salesShipment resource.


```json
{
    "id": "GUID",
    "number": "string",
    "externalDocumentNumber": "string",
    "invoiceDate": "date",
    "postingDate": "date",
    "dueDate": "date",
    "customerPurchaseOrderReference": "string",
    "customerId": "GUID",
    "customerNumber": "string",
    "customerName": "string",
    "billToCustomerId": "GUID",
    "billToName": "string",
    "billToCustomerNumber": "string",
    "shipToName": "string",
    "shipToContact": "string",
    "sellToAddressLine1": "string",
    "sellToAddressLine2": "string",
    "sellToCity": "string",
    "sellToCountry": "string",
    "sellToState": "string",
    "sellToPostCode": "string",
    "billToAddressLine1": "string",
    "billToAddressLine2": "string",
    "billToCity": "string",
    "billToCountry": "string",
    "billToState": "string",
    "billToPostCode": "string",
    "shipToAddressLine1": "string",
    "shipToAddressLine2": "string",
    "shipToCity": "string",
    "shipToCountry": "string",
    "shipToState": "string",
    "shipToPostCode": "string",
    "currencyCode": "string",
    "orderNumber": "string",
    "paymentTermsCode": "string",
    "shipmentMethodCode": "string",
    "salesperson": "string",
    "pricesIncludeTax": "boolean",
    "lastModifiedDateTime": "datetime",
    "phoneNumber": "string",
    "email": "string"
}
```

## Related information

[GET salesShipment](../api/dynamics_salesShipment_Get.md)
