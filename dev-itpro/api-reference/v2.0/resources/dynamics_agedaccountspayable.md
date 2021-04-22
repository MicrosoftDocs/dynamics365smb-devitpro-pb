---
title: agedAccountsPayable resource type  
description: An aged accounts payable object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/29/2021
ms.author: solsen
---

# agedAccountsPayable resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an aged accounts payable in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET agedAccountsPayable](../api/dynamics_agedaccountspayable_get.md)|agedAccountsPayable|Gets a aged accounts payable object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the agedAccountsPayable.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|vendorId|GUID|The unique ID of vendor.|
|vendorNumber|string|Specifies vendor's number.|
|name|string|Represents the aged accounts payable's name.|
|currencyCode|string|The default currency code for the aged accounts payable.|
|balanceDue|decimal|Specifies total balance due.|
|currentAmount|decimal|Specifies the current balance.|
|period1Amount|decimal|Specifies balance in the first aging period.|
|period2Amount|decimal|Specifies balance in the second aging period.|
|period3Amount|decimal|Specifies balance in the third aging period.|
|agedAsOfDate|date|The period start date.|
|periodLengthFilter|string|Specifies the length of the periods.|

## JSON representation

Here is a JSON representation of the agedAccountsPayable resource.


```json
{
    "vendorId": "GUID",
    "vendorNumber": "string",
    "name": "string",
    "currencyCode": "string",
    "balanceDue": "decimal",
    "currentAmount": "decimal",
    "period1Amount": "decimal",
    "period2Amount": "decimal",
    "period3Amount": "decimal",
    "agedAsOfDate": "date",
    "periodLengthFilter": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET agedAccountsPayable](../api/dynamics_agedAccountsPayable_Get.md)
