---
title: employees resource type
description: An employee object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# employees resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an employee in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                              | Return Type|Description               |
|:----------------------------------------------------|:-----------|:-------------------------|
|[GET employees](../api/dynamics_employee_get.md)      |employees  |Get an employee object.   |
|[POST employees](../api/dynamics_create_employee.md)  |employees  |Create an employee object.|
|[PATCH employees](../api/dynamics_employee_update.md) |employees  |Update an employee object.|
|[DELETE employees](../api/dynamics_employee_delete.md)|none       |Delete an employee object.|

## Subpages

| Method    |Return Type| Description      |
|:----------|:----------|:-----------------|
|[GET employee defaultDimensions](../api/dynamics_employee_get_defaultdimensions.md)|default dimensions   |Gets the default dimensions of employee. |
|[POST employee defaultDimensions](../api/dynamics_employee_create_defaultdimensions.md) |default dimensions  |Creates the default dimensions of  employee.|
|[PATCH employee defaultDimensions](../api/dynamics_employee_update_defaultdimensions.md)|default dimensions  |Updates the default dimensions of employee.|
|[DELETE employee defaultDimensions](../api/dynamics_employee_delete_defaultdimensions.md)|default dimensions|Deletes the default dimensions of employee.  |

## Properties

| Property           | Type   |Description                                            |
|:-------------------|:-------|:------------------------------------------------------|
|id                  |GUID    |The employee ID. Non-editable.                         |
|number              |string  |The employee number. Read-Only.                        |
|displayName         |string  |The employee givenName + surname. Read-Only.           |
|givenName           |string  |The given name of the employee.                        |
|middleName          |string  |The middle name of the employee.                       |
|surname             |string  |The surname of the employee                            |
|jobTitle            |string  |The full name of the employee                          |
|address             |[NAV.PostalAddress](../resources/dynamics_complextypes.md)|Specifies the employee's address. This address will appear on all resource documents for the employee.|
|phoneNumber         |string  |Specifies the employee's telephone number.             |
|mobilePhone         |string  |Specifies the employee's mobile telephone number.      |
|email               |string  |Specifies the employee's email address.                |
|personalEmail       |string  |Specifies the employee's personal email address.       |
|employmentDate      |date    |Specifies the date when the employee began to work for the company.|
|terminationDate     |date    |Specifies the date when the employee was terminated, due to retirement or dismissal, for example.|
|status              |string  |Specifies the employee's status. Possible values are Active, Inactive or Terminated|
|birthDate           |date    |Specifies the employee's date of birth.                |
|picture             |stream  |The employee picture. Read-Only.                       |
|lastModifiedDateTime|datetime|The last datetime the employee was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "givenName": "string",
    "middleName": "string",
    "surname": "string",
    "jobTitle": "string",
    "address": "NAV.PostalAddress",
    "phoneNumber": "string",
    "mobilePhone": "string",
    "email": "string",
    "personalEmail": "string",
    "employmentDate": "date",
    "terminationDate": "date",
    "status": "string",
    "birthDate": "date",
    "picture": "stream",
    "lastModifiedDateTime": "datetime"
}
```
## See also



[Error Codes](../dynamics_error_codes.md)  
[Get Employee](../api/dynamics_employee_get.md)  
[Post Employee](../api/dynamics_create_employee.md)  
[Patch Employee](../api/dynamics_employee_update.md)  
[Delete Employee](../api/dynamics_employee_delete.md)  
