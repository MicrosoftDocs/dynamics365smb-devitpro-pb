---
title: salesShipmentLine resource type | Microsoft Docs
description: A sales shipment line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# salesShipmentLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales shipment line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesShipmentLine](../api/dynamics_salesshipmentline_get.md)|salesShipmentLine|Gets a sales shipment line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesShipment](dynamics_salesshipment.md)|salesShipment |Gets the salesshipment of the salesShipmentLine.|
|[account](dynamics_account.md)|account |Gets the account of the salesShipmentLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesShipmentLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales shipment line. Non-editable.|
|documentId|GUID|The ID of the parent sales shipment line. |
|documentNo|string|The number of the sales shipment line.|
|sequence|integer|The line sequence number.|
|lineType|NAV.salesLineType|The type of the sales shipment line. It can be " ", "G/L Account", "Item", "Resource", "Fixed Asset" or "Charge Item".|
|lineObjectNumber|string|The number of the object (account or item) of the sales shipment line.|
|description|string|Specifies the description of the sales shipment line.|
|unitOfMeasureCode|string|The code of unit of measure for the sales shipment line.|
|unitPrice|decimal|Specifies the price for one unit of the item in the specified sales shipment line.|
|quantity|decimal|The quantity of the item in the sales shipment line.|
|discountPercent|decimal|The line discount percent.    |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|shipmentDate|date|The date the item in the line is expected to ship.|

## JSON representation

Here is a JSON representation of the salesShipmentLine resource.


```json
{
    "id": "GUID",
    "documentId": "GUID",
    "documentNo": "string",
    "sequence": "integer",
    "lineType": "NAV.salesLineType",
    "lineObjectNumber": "string",
    "description": "string",
    "unitOfMeasureCode": "string",
    "unitPrice": "decimal",
    "quantity": "decimal",
    "discountPercent": "decimal",
    "taxPercent": "decimal",
    "shipmentDate": "date"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesShipmentLine](../api/dynamics_salesShipmentLine_Get.md)
