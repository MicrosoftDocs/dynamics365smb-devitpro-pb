---
title: paymentMethods resource type | Microsoft Docs
description: A payment method object in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# paymentMethods resource type
Represents a method of payment in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], such as PayPal, credit card, and bank account.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                          | Return Type  |Description             |
|:----------------------------------------------------------------|:-------------|:-----------------------|
|[GET paymentMethods](../api/dynamics_paymentmethods_get.md)      |paymentMethods|Gets a payment method object.   |
|[POST paymentMethods](../api/dynamics_create_paymentmethods.md)  |paymentMethods|Creates a payment method object.|
|[PATCH paymentMethods](../api/dynamics_paymentmethods_update.md) |paymentMethods|Updates a payment method object.|
|[DELETE paymentMethods](../api/dynamics_paymentmethods_delete.md)|none          |Deletes a payment method object.|

## Properties
| Property	         | Type	  |Description                                                  |
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
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get payment methods](../api/dynamics_paymentmethods_get.md)  
[Create payment methods](../api/dynamics_create_paymentmethods.md)  
[Update payment methods](../api/dynamics_paymentmethods_update.md)  
[Delete payment methods](../api/dynamics_paymentmethods_delete.md)  