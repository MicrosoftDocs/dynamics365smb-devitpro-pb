---
title: (v1.0) trialBalance resource type
description: (v1.0) A trial balance object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# trialBalance resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a trial balance in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET trialBalance](../api/dynamics_trialbalance_get.md)|trialBalance|Gets a trial balance object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|number|string|The G/L Account number for the trialBalance item|
|display|string|The G/L Account name for the trialBalance item.|
|totalDebit|string|Represents total debit amount in G/L Account.|
|totalCredit|string|Represents total credit amount in G/L Account.|
|balanceAtDateDebit|string|Represents positive Balance at Date amount in G/L Account.|
|balanceAtDateCredit|string|Represents negative Balance at Date amount in G/L Account.|
|dateFilter|date|The date filter used to calculate the trialBalance items.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "number": "string",
    "display": "string",
    "totalDebit": "string",
    "totalCredit": "string",
    "balanceAtDateDebit": "string",
    "balanceAtDateCredit": "string",
    "dateFilter": "date"
}
```
## See also

[Get Trial Balance](../api/dynamics_trialbalance_get.md)  