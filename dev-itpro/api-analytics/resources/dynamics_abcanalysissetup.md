---
title: abcAnalysisSetup resource type
description: Represents a abcAnalysisSetup entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# abcAnalysisSetup resource type

Represents a abc analysis setup in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET abcAnalysisSetup](../api/dynamics_abcanalysissetup_get.md)|abcAnalysisSetup|Gets a abcAnalysisSetup object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|categoryA|decimal|Specifies the categoryA of the abcAnalysisSetup.|
|categoryB|decimal|Specifies the categoryB of the abcAnalysisSetup.|
|categoryC|decimal|Specifies the categoryC of the abcAnalysisSetup.|
|auxiliaryIndex1|string|The primary key of the abcAnalysisSetup.|

## JSON representation

Here's a JSON representation of the abcAnalysisSetup resource.

```json
{
    "categoryA": 100.00,
    "categoryB": 100.00,
    "categoryC": 100.00,
    "auxiliaryIndex1": ""
}
```

## Related information

[GET abcAnalysisSetup](../api/dynamics_abcanalysissetup_get.md)
