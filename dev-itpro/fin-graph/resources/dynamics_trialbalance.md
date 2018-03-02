---
title: trialBalance resource type | Microsoft Docs
description: A trial balance object in Dynamics 365 for Finance and Operations, Business edition. 
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/08/2018
ms.author: solsen
---

# trialBalance resource type
Represents a trial balance in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET trialBalance](../api/dynamics_trialbalance_get.md)|trialBalance|Gets a trial balance object.|

## Properties
| Property	   | Type	|Description|
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
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get trial balance](../api/dynamics_trialbalance_get.md)  