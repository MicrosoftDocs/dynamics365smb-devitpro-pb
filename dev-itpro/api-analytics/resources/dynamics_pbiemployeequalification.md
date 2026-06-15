---
title: pbiEmployeeQualification resource type
description: Represents a pbiEmployeeQualification entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiEmployeeQualification resource type

Represents a pbi employee qualification in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiEmployeeQualification](../api/dynamics_pbiemployeequalification_get.md)|pbiEmployeeQualification|Gets a pbiEmployeeQualification object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|employeeNo|string|The primary key of the pbiEmployeeQualification.|
|qualificationCode|string|Specifies the qualificationCode of the pbiEmployeeQualification.|
|auxiliaryIndex1|integer|The primary key of the pbiEmployeeQualification.|

## JSON representation

Here's a JSON representation of the pbiEmployeeQualification resource.

```json
{
    "employeeNo": "string",
    "qualificationCode": "string",
    "auxiliaryIndex1": "integer"
}
```

## Related information

[GET pbiEmployeeQualification](../api/dynamics_pbiemployeequalification_get.md)
