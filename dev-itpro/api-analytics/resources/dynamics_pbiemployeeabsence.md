---
title: pbiEmployeeAbsence resource type
description: Represents a pbiEmployeeAbsence entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiEmployeeAbsence resource type

Represents a pbi employee absence in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiEmployeeAbsence](../api/dynamics_pbiemployeeabsence_get.md)|pbiEmployeeAbsence|Gets a pbiEmployeeAbsence object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|employeeNo|string|Specifies the employeeNo of the pbiEmployeeAbsence.|
|entryNo|integer|The primary key of the pbiEmployeeAbsence.|
|fromDate|Date|Specifies the fromDate of the pbiEmployeeAbsence.|
|toDate|Date|Specifies the toDate of the pbiEmployeeAbsence.|
|causeofAbsenceCode|string|Specifies the causeofAbsenceCode of the pbiEmployeeAbsence.|
|quantitybase|decimal|Specifies the quantitybase of the pbiEmployeeAbsence.|
|description|string|Specifies the description of the pbiEmployeeAbsence.|

## JSON representation

Here's a JSON representation of the pbiEmployeeAbsence resource.

```json
{
    "employeeNo": "10000",
    "entryNo": 1001,
    "fromDate": "2026-01-15",
    "toDate": "2026-01-15",
    "causeofAbsenceCode": "10000",
    "quantitybase": 10.00,
    "description": "ATHENS Desk"
}
```

## Related information

[GET pbiEmployeeAbsence](../api/dynamics_pbiemployeeabsence_get.md)
