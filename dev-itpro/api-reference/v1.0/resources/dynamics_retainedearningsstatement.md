---
title: (v1.0) retainedEarningsStatement resource type
description: (v1.0) A retained earnings statement object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# retainedEarningsStatement resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an retained earnings statement in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description          |
|:-------------|:-------------|:--------------------|
|[GET retainedEarningsStatement](../api/dynamics_retainedearningsstatement_get.md)|retainedEarningsStatement|Get a retained earnings statement object.|

## Properties

| Property  | Type  |Description                                                           |
|:----------|:------|:---------------------------------------------------------------------|
|lineNumber |numeric|The retainedEarningsStatement item line number.                       |
|display    |string |The retainedEarningsStatement item display name.                      |
|netChange  |numeric|The retainedEarningsStatement item Net Change.                        |
|lineType   |string |The retainedEarningsStatement item line type can be: header, detail, total, or spacer.|
|indentation|numeric|The retainedEarningsStatement item indentation used in report layout. |
|dateFilter |date   |The date filter used to calculate the retainedEarningsStatement items.|


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

[Get Retained Earnings Statement](../api/dynamics_retainedearningsstatement_get.md)  