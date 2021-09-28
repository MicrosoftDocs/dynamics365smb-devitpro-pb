---
title: (v1.0) currencies resource type
description: (v1.0) A currency object in Dynamics 365 Business Central 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# currencies resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a currency used in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                  |Return Type|Description       |
|:--------------------------------------------------------|:----------|:-----------------|
|[GET currencies](../api/dynamics_currencies_get.md)      |currencies |Get a Currency.   |
|[POST currencies](../api/dynamics_create_currencies.md)  |currencies |Create a Currency.|
|[PATCH currencies](../api/dynamics_currencies_update.md) |currencies |Update a Currency.|
|[DELETE currencies](../api/dynamics_currencies_delete.md)|none       |Delete a Currency.|

## Properties

| Property              | Type   |Description                                                   |
|:----------------------|:-------|:-------------------------------------------------------------|
|id                     |GUID    |The unique ID of the currency. Non-editable.                  |
|code                   |string  |Specifies the currency code.                                  |
|displayName            |string  |Specifies the currency display name.                          |
|symbol                 |string  |Specifies the symbol for this currency that appears on checks.|
|amountDecimalPlaces    |string  |Specifies the number of decimal places the system will display on amounts for this currency.|
|amountRoundingPrecision|decimal |Specifies the size of the interval to be used when rounding amounts for this currency.|
|lastModifiedDateTime   |datetime|The last datetime the currency was modified. Read-Only.       |  


## Relationships
None

## JSON representation

Here is a JSON representation of the currencies.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "symbol": "string",
  "amountDecimalPlaces": "string",
  "amountRoundingPrecision": "decimal",
  "lastModifiedDateTime": "datetime"
}
```

## See also
  
[Get Currencies](../api/dynamics_currencies_get.md)  
[Post Currencies](../api/dynamics_create_currencies.md)  
[Patch Currencies](../api/dynamics_currencies_update.md)  
[Delete Currencies](../api/dynamics_currencies_delete.md)  