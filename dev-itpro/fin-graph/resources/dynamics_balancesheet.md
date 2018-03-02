---
title: balanceSheet resource type | Microsoft Docs
description: A balance sheet in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/02/2018
ms.author: solsen
---

# balanceSheet resource type
Represents a balanceSheet object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. A balance sheet is a statement of the assets, liabilities, and capital of a business at a specific point in time.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET balanceSheet](../api/dynamics_balancesheet_get.md)|balanceSheet|Get a balanceSheet object.|

## Properties
| Property	   | Type	|Description|
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get balance sheet](../api/dynamics_balancesheet_get.md)  
[Cash flow statement](dynamics_cashflowstatement.md)  
