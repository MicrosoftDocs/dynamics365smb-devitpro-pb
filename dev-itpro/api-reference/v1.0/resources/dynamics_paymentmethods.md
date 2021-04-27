---
title: paymentMethods resource type
description: A payment method object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# paymentMethods resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a method of payment in [!INCLUDE[prod_short](../../../includes/prod_short.md)], such as PayPal, credit card, and bank account.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                          | Return Type  |Description             |
|:----------------------------------------------------------------|:-------------|:-----------------------|
|[GET paymentMethods](../api/dynamics_paymentmethods_get.md)      |paymentMethods|Gets a payment method object.   |
|[POST paymentMethods](../api/dynamics_create_paymentmethods.md)  |paymentMethods|Creates a payment method object.|
|[PATCH paymentMethods](../api/dynamics_paymentmethods_update.md) |paymentMethods|Updates a payment method object.|
|[DELETE paymentMethods](../api/dynamics_paymentmethods_delete.md)|none          |Deletes a payment method object.|

## Properties

| Property           | Type   |Description                                                  |
|:-------------------|:-------|:------------------------------------------------------------|
|id                  |GUID    |The unique ID of the paymentMethods. Non-editable.           |
|code                |string  |Specifies the payment method code.                           |
|displayName         |string  |Specifies the payment method display name.                   |
|lastModifiedDateTime|datetime|The last datetime the payment method was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the paymentMethods.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See also

[Get Payment Methods](../api/dynamics_paymentmethods_get.md)  
[Create Payment Methods](../api/dynamics_create_paymentmethods.md)  
[Update Payment Methods](../api/dynamics_paymentmethods_update.md)  
[Delete Payment Methods](../api/dynamics_paymentmethods_delete.md)  