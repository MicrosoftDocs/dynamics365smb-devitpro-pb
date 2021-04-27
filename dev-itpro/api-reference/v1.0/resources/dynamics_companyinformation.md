---
title: companyInformation resource type
description: Company information in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---
 
# companyInformation resource type

[!INCLUDE[d365_api_newversion](../../includes/d365_api_newversion.md)]

Represents the information specified for the current company in [!INCLUDE[prod_short](../../../includes/prod_short.md)], such as name, address, email address, and website address.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET companyInformation](../api/dynamics_companyinformation_get.md)|companyInformation|Gets a company information.|
|[PATCH companyInformation](../api/dynamics_companyinformation_update.md)|companyInformation|Updates a company information.|


## Properties

| Property     | Type      |Description                           |
|:-------------|:--------|:-------------------------------------|
|id            |GUID|The unique ID of the company. Non-editable.|
|displayName   |string   |The company's display name.           |
|address       |[NAV.PostalAddress](../resources/dynamics_complextypes.md)|The company's address. View the complex type for additional detail.|
|phoneNumber   |string   |The company's telephone number.       |
|faxNumber     |string   |The company's fax number.             |
|email         |string   |The company's email address.          |
|website       |string   |The company's website address.        |
|taxRegistrationNumber|string|The company's tax registration number.|
|currencyCode  |string   |The currency the company does business in. Read-Only.|
|currentFiscalYearStartDate|date|The company's current fiscal year start date. Read-Only.|
|industry      |string   |The industry the company is part of.  |
|picture       |stream   |The company logo. Read-Only.          |
|lastModifiedDateTime|datetime|The last datetime the company was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the companyInformation
```json
{
  "id": "GUID",
  "displayName": "string",
  "address": "NAV.PostalAddress",
  "phoneNumber": "string",
  "faxNumber": "string",
  "email": "string",
  "website": "string",
  "taxRegistrationNumber": "string",
  "currencyCode": "string",
  "currentFiscalYearStartDate": "date",
  "industry": "string",
  "picture": "stream",
  "lastModifiedDateTime": "datetime"
}
```

## See also
[Working with [!INCLUDE[prod_short](../../../includes/prod_short.md)] in Microsoft Graph](../resources/dynamics_overview.md) 
