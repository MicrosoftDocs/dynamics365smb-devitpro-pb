---
title: contactInformation resource type  
description: A contact information object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# contactInformation resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a contact information in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET contactInformation](../api/dynamics_contactinformation_get.md)|contactInformation|Gets a contact information object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customer](dynamics_customer.md)|customer |Gets the customer of the contactInformation.|
|[contact](dynamics_contact.md)|contact |Gets the contact of the contactInformation.|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the contactInformation.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|contactId|GUID|The ID of the contact.|
|contactNumber|string|The number of the contact.|
|contactName|string|The name of the contact.|
|contactType|NAV.contactType|The type of contact. It can be "Company" or "Person".|
|relatedId|GUID|The ID of the resource it is related to.|
|relatedType|NAV.contactBusinessRelationLinkToTable|The type of business relation with the contact. It can be " ", "Customer", "Vendor", "Bank Account" or "Employee".|

## JSON representation

Here is a JSON representation of the contactInformation resource.


```json
{
    "contactId": "GUID",
    "contactNumber": "string",
    "contactName": "string",
    "contactType": "NAV.contactType",
    "relatedId": "GUID",
    "relatedType": "NAV.contactBusinessRelationLinkToTable"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## Remarks

This resource type requires [!INCLUDE[prod_short](../../../includes/prod_short.md)] version 18.0.

## See Also
[GET contactInformation](../api/dynamics_contactinformation_get.md)  
