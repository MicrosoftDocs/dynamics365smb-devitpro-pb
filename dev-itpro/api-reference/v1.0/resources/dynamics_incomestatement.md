---
title: (v1.0) incomeStatement resource type
description: (v1.0) An incomeStatement in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# incomeStatement resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an income statement in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET incomeStatement](../api/dynamics_incomestatement_get.md)|incomeStatement|Get an income statement object.|

## Properties

| Property  | Type  |Description                                                 |
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



[Error Codes](../dynamics_error_codes.md)  
[Get Income Statement](../api/dynamics_incomestatement_get.md)  