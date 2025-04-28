---
title: customerContact resource type
description: A customer contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/28/2025
ms.author: solsen
---

# customerContact resource type

Represents a customer contact in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerContact](../api/dynamics_customercontact_get.md)|customerContact|Gets a customer contact object.|
|[DELETE customerContact](../api/dynamics_customercontact_delete.md)|none|Deletes a customer contact object.|
|[PATCH customerContact](../api/dynamics_customercontact_update.md)|customerContact|Updates a customer contact object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[pdfDocument](dynamics_pdfdocument.md)|pdfDocument |Gets the pdfdocument of the customerContact.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the customer contact. Non-editable.|
|email|string|Specifies the customer contact's email address.|
|firstName|string||
|lastName|string||
|professionalTitle|string||
|customerId|GUID|The unique ID of customer.  |
|customerName|string|The customer's name.|
|primaryPhoneNumber|string||

## JSON representation

Here is a JSON representation of the customerContact resource.


```json
{
    "id": "GUID",
    "email": "string",
    "firstName": "string",
    "lastName": "string",
    "professionalTitle": "string",
    "customerId": "GUID",
    "customerName": "string",
    "primaryPhoneNumber": "string"
}
```

## Related information

[GET customerContact](../api/dynamics_customercontact_get.md)
[DELETE customerContact](../api/dynamics_customercontact_delete.md)
[PATCH customerContact](../api/dynamics_customercontact_update.md)  
