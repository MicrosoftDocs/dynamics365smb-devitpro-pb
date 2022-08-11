---
title: generalBudgetEntry resource type
description: A general budget entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# generalBudgetEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general budget entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalBudgetEntry](../api/dynamics_generalbudgetentry_get.md)|generalBudgetEntry|Gets a general budget entry object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general budget entry. Non-editable.|
|number|integer||
|description|string|Specifies the description of the general budget entry.|
|budgetName|string||
|businessUnitCode|string||
|date|date|The date of the general budget entry.|
|accountNo|string||
|amount|decimal|Specifies the total amount (including VAT) that the general budget entry consists of.|
|generalLedgerAccountNumber|string||
|dimensionSetID|integer||
|globalDimension1Code|string||
|globalDimension2Code|string||
|budgetDimension1Code|string||
|budgetDimension2Code|string||
|budgetDimension3Code|string||
|budgetDimension4Code|string||
|lastModifiedDateTime|datetime|The last datetime the general budget entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalBudgetEntry resource.


```json
{
    "id": "GUID",
    "number": "integer",
    "description": "string",
    "budgetName": "string",
    "businessUnitCode": "string",
    "date": "date",
    "accountNo": "string",
    "amount": "decimal",
    "generalLedgerAccountNumber": "string",
    "dimensionSetID": "integer",
    "globalDimension1Code": "string",
    "globalDimension2Code": "string",
    "budgetDimension1Code": "string",
    "budgetDimension2Code": "string",
    "budgetDimension3Code": "string",
    "budgetDimension4Code": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET generalBudgetEntry](../api/dynamics_generalbudgetentry_get.md)
