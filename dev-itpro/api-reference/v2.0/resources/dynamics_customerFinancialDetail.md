---
title: customerFinancialDetail resource type  
description: A customer financial detail object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# customerFinancialDetail resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a customer financial detail in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerFinancialDetail](../api/dynamics_customerfinancialdetail_get.md)|customerFinancialDetail|Gets a customer financial detail object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customer](dynamics_customer.md)|customer |Gets the customer of the customerFinancialDetail.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the customer financial detail. Non-editable.|
|number|string|Specifies the number of the customer financial detail.|
|balance|decimal|Specifies customer financial detail's total balance.|
|totalSalesExcludingTax|decimal|Total sales exluding tax.|
|overdueAmount|decimal|Overdue amount for the customer financial detail.|
|lastModifiedDateTime|datetime|The last datetime the customer financial detail was modified. Read-Only.|

## JSON representation

Here's a JSON representation of the customerFinancialDetail resource.


```json
{
    "id": "GUID",
    "number": "string",
    "balance": "decimal",
    "totalSalesExcludingTax": "decimal",
    "overdueAmount": "decimal",
    "lastModifiedDateTime": "datetime"
}
```

## Related information

[GET customerFinancialDetail](../api/dynamics_customerFinancialDetail_Get.md)
