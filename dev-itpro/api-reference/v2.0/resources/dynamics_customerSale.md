---
title: customerSale resource type  
description: A customer sale object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/29/2021
ms.author: solsen
---

# customerSale resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a customer sale in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerSale](../api/dynamics_customersale_get.md)|customerSale|Gets a customer sale object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|customerId|GUID|The unique ID of customer.  |
|customerNumber|string|The customer's number.|
|name|string|Represents the customer sale's name.|
|totalSalesAmount|decimal|Represents the customer sales.  |
|dateFilter_FilterOnly|date|Represents the date filter for the customer sale.|

## JSON representation

Here is a JSON representation of the customerSale resource.


```json
{
    "customerId": "GUID",
    "customerNumber": "string",
    "name": "string",
    "totalSalesAmount": "decimal",
    "dateFilter_FilterOnly": "date"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET customerSale](../api/dynamics_customerSale_Get.md)
