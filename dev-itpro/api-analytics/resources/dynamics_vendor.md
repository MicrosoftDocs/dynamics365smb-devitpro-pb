---
title: vendor resource type
description: Represents a vendor entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# vendor resource type

Represents a vendor in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET vendor](../api/dynamics_vendor_get.md)|vendor|Gets a vendor object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|vendorNo|string|The primary key of the vendor.|
|vendorName|string|Specifies the vendorName of the vendor.|
|address|string|Specifies the address of the vendor.|
|address2|string|Specifies the address2 of the vendor.|
|city|string|Specifies the city of the vendor.|
|postCode|string|Specifies the postCode of the vendor.|
|county|string|Specifies the county of the vendor.|
|countryRegionCode|string|Specifies the countryRegionCode of the vendor.|
|vendorPostingGroup|string|Specifies the vendorPostingGroup of the vendor.|

## JSON representation

Here's a JSON representation of the vendor resource.

```json
{
    "vendorNo": "string",
    "vendorName": "string",
    "address": "string",
    "address2": "string",
    "city": "string",
    "postCode": "string",
    "county": "string",
    "countryRegionCode": "string",
    "vendorPostingGroup": "string"
}
```

## Related information

[GET vendor](../api/dynamics_vendor_get.md)
