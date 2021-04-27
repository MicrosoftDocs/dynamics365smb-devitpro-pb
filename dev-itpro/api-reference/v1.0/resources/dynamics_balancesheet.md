---
title: balanceSheet resource type
description: A balance sheet in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# balanceSheet resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a balanceSheet object in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. A balance sheet is a statement of the assets, liabilities, and capital of a business at a specific point in time.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET balanceSheet](../api/dynamics_balancesheet_get.md)|balanceSheet|Get a balanceSheet object.|

## Properties

| Property     | Type   |Description|
|:-------------|:-------|:----------|
|lineNumber    |numeric |The balanceSheet item line number.|
|display       |string  |The balanceSheet item display name.|
|balance       |numeric |The balanceSheet item balance.|
|lineType      |string  |The balanceSheet item line type can be: header, detail, total, or spacer.|
|indentation   |numeric |The balanceSheet item indentation used in report layout.|
|dateFilter    |date    |The date filter used to calculate the balanceSheet items.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "lineNumber": "int",
    "display": "string",
    "balance": "decimal",
    "lineType": "string",
    "indentation": "int",
    "dateFilter": "date"
}
```
## See also
  
[Get Balance Sheet](../api/dynamics_balancesheet_get.md)  
[Cash Flow Statement](dynamics_cashflowstatement.md)  
