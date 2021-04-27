---
title: customerFinancialDetails resource type
description: An customerFinancialDetails entity in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# customerFinancialDetails resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an customerFinancialDetails object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET customerFinancialDetails](../api/dynamics_customerFinancialDetails_get.md)|accounts|Get customerFinancialDetails object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|id|GUID|Id of the customerFinancialDetails.|
|number|string|Reference to the customer number.|
|balance|decimal,read-only|Balance for the customer.|
|totalSalesExcludingTax|decimal, read-only|Total sales exluding tax.|
|overdueAmount|decimal, read-only|Overdue amount for the customer.|
|lastModifiedDateTime|datetime|The last datetime the entity was modified.|

## Relationships

None

## JSON representation

Here is a JSON representation of the resource.

```json
{
    "id": "GUID",
    "number": "string",
    "balance": "decimal",
    "totalSalesExcludingTax": "decimal",
    "overdueAmount": "decimal"
}
```
## See also
[Get customerFinancialDetails](../api/dynamics_customerFinancialDetails_get.md)  
