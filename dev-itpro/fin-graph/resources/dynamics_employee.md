---
title: employees resource type | Microsoft Docs
description: An employee object in Dynamics 365 for Finance and Operations, Business edition.
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

# employees resource type
Represents an employee in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                              | Return Type|Description               |
|:----------------------------------------------------|:-----------|:-------------------------|
|[GET employees](../api/dynamics_employee_get.md)      |employees  |Get an employee object.   |
|[POST employees](../api/dynamics_create_employee.md)  |employees  |Create an employee object.|
|[PATCH employees](../api/dynamics_employee_update.md) |employees  |Update an employee object.|
|[DELETE employees](../api/dynamics_employee_delete.md)|none       |Delete an employee object.|

## Properties
| Property	         | Type	  |Description                                            |
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get employee](../api/dynamics_employee_get.md)  
[Post employee](../api/dynamics_create_employee.md)  
[Patch employee](../api/dynamics_employee_update.md)  
[Delete employee](../api/dynamics_employee_delete.md)  
