---
title: employee resource type  
description: An employee object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# employee resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an employee in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET employee](../api/dynamics_employee_get.md)|employee|Gets a employee object.|
|[DELETE employee](../api/dynamics_employee_delete.md)|none|Deletes a employee object.|
|[POST employee](../api/dynamics_employee_create.md)|employee|Creates a employee object.|
|[PATCH employee](../api/dynamics_employee_update.md)|employee|Updates a employee object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the employee.|
|[picture](dynamics_picture.md)|picture |Gets the picture of the employee.|
|[defaultDimensions](dynamics_defaultdimension.md)|defaultDimensions |Gets the defaultdimensions of the employee.|
|[timeRegistrationEntries](dynamics_timeregistrationentry.md)|timeRegistrationEntries |Gets the timeregistrationentries of the employee.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the employee. Non-editable.|
|number|string|Specifies the number of the employee.|
|displayName|string|Specifies the employee's name. This name will appear on all sales documents for the employee.|
|givenName|string|The given name of the employee. |
|middleName|string|The middle name of the employee.    |
|surname|string|The surname of the employee.    |
|jobTitle|string|The job title of the employee.|
|addressLine1|string|Specifies the employee's address. This address will appear on all sales documents for the employee.|
|addressLine2|string|Specifies the employee's address. This address will appear on all sales documents for the employee.|
|city|string|Specifies the employee's city.|
|state|string|Specifies the employee's state.|
|country|string|Specifies the employee's country.|
|postalCode|string|Specifies the employee's postal code.|
|phoneNumber|string|Specifies the employee's telephone number.|
|mobilePhone|string|Specifies the employee's mobile telephone number. |
|email|string|Specifies the employee's email address.|
|personalEmail|string|Specifies the employee's personal email address. |
|employmentDate|date|Specifies the date when the employee began to work for the company.|
|terminationDate|date|Specifies the date when the employee was terminated, due to retirement or dismissal, for example.|
|status|NAV.employeeStatus|Specifies the status of the employee. It can be "Active", "Inactive" or "Terminated".|
|birthDate|date|Specifies the employee's date of birth. |
|statisticsGroupCode|string|The employee's statistics group code.|
|lastModifiedDateTime|datetime|The last datetime the employee was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the employee resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "givenName": "string",
    "middleName": "string",
    "surname": "string",
    "jobTitle": "string",
    "addressLine1": "string",
    "addressLine2": "string",
    "city": "string",
    "state": "string",
    "country": "string",
    "postalCode": "string",
    "phoneNumber": "string",
    "mobilePhone": "string",
    "email": "string",
    "personalEmail": "string",
    "employmentDate": "date",
    "terminationDate": "date",
    "status": "NAV.employeeStatus",
    "birthDate": "date",
    "statisticsGroupCode": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET employee](../api/dynamics_employee_Get.md)
[DELETE employee](../api/dynamics_employee_Delete.md)
[POST employee](../api/dynamics_employee_Create.md)
[PATCH employee](../api/dynamics_employee_Update.md)
