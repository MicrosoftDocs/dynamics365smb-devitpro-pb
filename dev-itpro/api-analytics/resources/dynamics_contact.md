---
title: contact resource type
description: Represents a contact entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# contact resource type

Represents a contact in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET contact](../api/dynamics_contact_get.md)|contact|Gets a contact object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|contactNo|string|The primary key of the contact.|
|contactType|Microsoft.NAV.contactType|Specifies the contactType of the contact.|
|contactName|string|Specifies the contactName of the contact.|
|companyNo|string|Specifies the companyNo of the contact.|
|companyName|string|Specifies the companyName of the contact.|
|address|string|Specifies the address of the contact.|
|address2|string|Specifies the address2 of the contact.|
|city|string|Specifies the city of the contact.|
|postCode|string|Specifies the postCode of the contact.|
|county|string|Specifies the county of the contact.|
|countryRegionCode|string|Specifies the countryRegionCode of the contact.|

## JSON representation

Here's a JSON representation of the contact resource.

```json
{
    "contactNo": "10000",
    "contactName": "Adatum Corporation",
    "companyNo": "10000",
    "companyName": "Adatum Corporation",
    "address": "192 Market Square",
    "address2": "Suite 200",
    "city": "Atlanta",
    "postCode": "31772",
    "county": "GA",
    "countryRegionCode": "US"
}
```

## Related information

[GET contact](../api/dynamics_contact_get.md)
