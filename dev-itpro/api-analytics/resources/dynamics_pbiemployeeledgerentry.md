---
title: pbiEmployeeLedgerEntry resource type
description: Represents a pbiEmployeeLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiEmployeeLedgerEntry resource type

Represents a pbi employee ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiEmployeeLedgerEntry](../api/dynamics_pbiemployeeledgerentry_get.md)|pbiEmployeeLedgerEntry|Gets a pbiEmployeeLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|employeeNo|string|Specifies the employeeNo of the pbiEmployeeLedgerEntry.|
|entryNo|integer|The primary key of the pbiEmployeeLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the pbiEmployeeLedgerEntry.|
|documentType|string|Specifies the documentType of the pbiEmployeeLedgerEntry.|
|documentNo|string|Specifies the documentNo of the pbiEmployeeLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the pbiEmployeeLedgerEntry.|
|description|string|Specifies the description of the pbiEmployeeLedgerEntry.|
|amount|decimal|Specifies the amount of the pbiEmployeeLedgerEntry.|

## JSON representation

Here's a JSON representation of the pbiEmployeeLedgerEntry resource.

```json
{
    "employeeNo": "string",
    "entryNo": "integer",
    "postingDate": "Date",
    "documentType": "string",
    "documentNo": "string",
    "dimensionSetID": "integer",
    "description": "string",
    "amount": "decimal"
}
```

## Related information

[GET pbiEmployeeLedgerEntry](../api/dynamics_pbiemployeeledgerentry_get.md)
