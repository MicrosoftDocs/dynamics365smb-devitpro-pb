---
title: customer resource type
description: Represents a customer entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# customer resource type

Represents a customer in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customer](../api/dynamics_customer_get.md)|customer|Gets a customer object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|customerNo|string|The primary key of the customer.|
|customerName|string|Specifies the customerName of the customer.|
|address|string|Specifies the address of the customer.|
|address2|string|Specifies the address2 of the customer.|
|city|string|Specifies the city of the customer.|
|postCode|string|Specifies the postCode of the customer.|
|county|string|Specifies the county of the customer.|
|countryRegionCode|string|Specifies the countryRegionCode of the customer.|
|customerPostingGroup|string|Specifies the customerPostingGroup of the customer.|
|customerPriceGroup|string|Specifies the customerPriceGroup of the customer.|
|customerDiscGroup|string|Specifies the customerDiscGroup of the customer.|

## JSON representation

Here's a JSON representation of the customer resource.

```json
{
    "customerNo": "string",
    "customerName": "string",
    "address": "string",
    "address2": "string",
    "city": "string",
    "postCode": "string",
    "county": "string",
    "countryRegionCode": "string",
    "customerPostingGroup": "string",
    "customerPriceGroup": "string",
    "customerDiscGroup": "string"
}
```

## Related information

[GET customer](../api/dynamics_customer_get.md)
