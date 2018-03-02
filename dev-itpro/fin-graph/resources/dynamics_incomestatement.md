---
title: incomeStatement resource type | Microsoft Docs
description: An incomeStatement in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# incomeStatement resource type
Represents an income statement in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET incomeStatement](../api/dynamics_incomestatement_get.md)|incomeStatement|Get an income statement object.|

## Properties
| Property	| Type	|Description                                                 |
|:----------|:------|:-----------------------------------------------------------|
|lineNumber |numeric|The incomeStatement item line number.                       |
|display    |string |The incomeStatement item display name.                      |
|netChange  |numeric|The incomeStatement item Net Change.                        |
|lineType   |string |The incomeStatement item line type can be: header, detail, total, or spacer.|
|indentation|numeric|The incomeStatement item indentation used in report layout. |
|dateFilter |date   |The date filter used to calculate the incomeStatement items.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "lineNumber": "int",
    "display": "string",
    "netChange": "decimal",
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
[Get income statement](../api/dynamics_incomestatement_get.md)  