---
title: pbiEmployee resource type
description: Represents a pbiEmployee entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# pbiEmployee resource type

Represents a pbi employee in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiEmployee](../api/dynamics_pbiemployee_get.md)|pbiEmployee|Gets a pbiEmployee object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|no|string|The primary key of the pbiEmployee.|
|firstName|string|Specifies the firstName of the pbiEmployee.|
|lastName|string|Specifies the lastName of the pbiEmployee.|
|gender|string|Specifies the gender of the pbiEmployee.|
|unionCode|string|Specifies the unionCode of the pbiEmployee.|
|status|string|Specifies the status of the pbiEmployee.|
|casueofInactivty|string|Specifies the casueofInactivty of the pbiEmployee.|
|inactivedate|Date|Specifies the inactivedate of the pbiEmployee.|
|groudForTermCode|string|Specifies the groudForTermCode of the pbiEmployee.|
|dateOfBirth|Date|Specifies the dateOfBirth of the pbiEmployee.|

## JSON representation

Here's a JSON representation of the pbiEmployee resource.

```json
{
    "no": "10000",
    "firstName": "Adatum Corporation",
    "lastName": "Adatum Corporation",
    "gender": "",
    "unionCode": "10000",
    "status": "Released",
    "casueofInactivty": "",
    "inactivedate": "2026-01-15",
    "groudForTermCode": "10000",
    "dateOfBirth": "2026-01-15"
}
```

## Related information

[GET pbiEmployee](../api/dynamics_pbiemployee_get.md)
