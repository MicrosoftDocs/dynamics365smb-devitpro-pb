---
title: currencyExchangeRate resource type
description: A currency exchange rate object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/09/2024
ms.author: solsen
---

# currencyExchangeRate resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a currency exchange rate in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET currencyExchangeRate](../api/dynamics_currencyexchangerate_get.md)|currencyExchangeRate|Gets a currency exchange rate object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the currency exchange rate. Non-editable.|
|currencyCode|string|The default currency code for the currency exchange rate.|
|startingDate|date||
|exchangeRateAmount|decimal||
|relationalCurrencyCode|string||
|relationalExchangeRateAmount|decimal||
|lastModifiedDateTime|datetime|The last datetime the currency exchange rate was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the currencyExchangeRate resource.


```json
{
    "id": "GUID",
    "currencyCode": "string",
    "startingDate": "date",
    "exchangeRateAmount": "decimal",
    "relationalCurrencyCode": "string",
    "relationalExchangeRateAmount": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET currencyExchangeRate](../api/dynamics_currencyexchangerate_get.md)
