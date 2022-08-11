---
title: customer resource type
description: A customer object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# customer resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a customer in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customer](../api/dynamics_customer_get.md)|customer|Gets a customer object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the customer. Non-editable.|
|number|string|Specifies the number of the customer.|
|displayName|string|Specifies the customer's name. This name will appear on all sales documents for the customer.|
|type|string||
|city|string|Specifies the customer's city.|
|state|string|Specifies the customer's state.|
|country|string|Specifies the customer's country.|
|postalCode|string|Specifies the customer's postal code.|
|salespersonCode|string||
|balanceDue|decimal|Specifies total balance due.|
|creditLimit|decimal||
|currencyCode|string|The default currency code for the customer.|
|blocked|string|Specifies that transactions with the customer cannot be posted. Set to **All**, if the customer is blocked, set to blank if not blocked.|
|lastModifiedDateTime|datetime|The last datetime the customer was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the customer resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "type": "string",
    "city": "string",
    "state": "string",
    "country": "string",
    "postalCode": "string",
    "salespersonCode": "string",
    "balanceDue": "decimal",
    "creditLimit": "decimal",
    "currencyCode": "string",
    "blocked": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET customer](../api/dynamics_customer_get.md)
