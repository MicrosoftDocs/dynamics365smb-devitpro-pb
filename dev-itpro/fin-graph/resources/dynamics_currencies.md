---
title: currencies resource type | Microsoft Docs
description: A currency object in Dynamics 365 for Finance and Operations, Business edition 
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# currencies resource type
Represents a currency used in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                  |Return Type|Description       |
|:--------------------------------------------------------|:----------|:-----------------|
|[GET currencies](../api/dynamics_currencies_get.md)      |currencies |Get a Currency.   |
|[POST currencies](../api/dynamics_create_currencies.md)  |currencies |Create a Currency.|
|[PATCH currencies](../api/dynamics_currencies_update.md) |currencies |Update a Currency.|
|[DELETE currencies](../api/dynamics_currencies_delete.md)|none       |Delete a Currency.|

## Properties
| Property	            | Type	 |Description                                                   |
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get currencies](../api/dynamics_currencies_get.md)  
[Post currencies](../api/dynamics_create_currencies.md)  
[Patch currencies](../api/dynamics_currencies_update.md)  
[Delete currencies](../api/dynamics_currencies_delete.md)  