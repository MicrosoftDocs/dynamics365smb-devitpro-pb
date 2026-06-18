---
title: returnReasonCode resource type
description: Represents a returnReasonCode entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# returnReasonCode resource type

Represents a return reason code in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET returnReasonCode](../api/dynamics_returnreasoncode_get.md)|returnReasonCode|Gets a returnReasonCode object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|reasonCode|string|The primary key of the returnReasonCode.|
|reasonDescription|string|Specifies the reasonDescription of the returnReasonCode.|

## JSON representation

Here's a JSON representation of the returnReasonCode resource.

```json
{
    "reasonCode": "RETURN",
    "reasonDescription": "Standard posting"
}
```

## Related information

[GET returnReasonCode](../api/dynamics_returnreasoncode_get.md)
