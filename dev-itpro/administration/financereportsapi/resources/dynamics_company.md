---
title: company resource type
description: A company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# company resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a company in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET company](../api/dynamics_company_get.md)|company|Gets a company object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[accountingPeriods](dynamics_accountingperiod.md)|accountingPeriods |Gets the accountingperiods of the company.|
|[businessUnits](dynamics_businessunit.md)|businessUnits |Gets the businessunits of the company.|
|[generalLedgerAccounts](dynamics_generalledgeraccount.md)|generalLedgerAccounts |Gets the generalledgeraccounts of the company.|
|[dimensionValues](dynamics_dimensionvalue.md)|dimensionValues |Gets the dimensionvalues of the company.|
|[dimensionSetEntries](dynamics_dimensionsetentry.md)|dimensionSetEntries |Gets the dimensionsetentries of the company.|
|[generalLedgerBudgets](dynamics_generalledgerbudgets.md)|generalLedgerBudgets |Gets the generalledgerbudgets of the company.|
|[customers](dynamics_customer.md)|customers |Gets the customers of the company.|
|[vendors](dynamics_vendor.md)|vendors |Gets the vendors of the company.|
|[generalLedgerEntries](dynamics_generalledgerentry.md)|generalLedgerEntries |Gets the generalledgerentries of the company.|
|[detailedCustomerLedgerEntries](dynamics_detailedcustomerledgerentry.md)|detailedCustomerLedgerEntries |Gets the detailedcustomerledgerentries of the company.|
|[customerLedgerEntries](dynamics_customerledgerentry.md)|customerLedgerEntries |Gets the customerledgerentries of the company.|
|[vendorLedgerEntries](dynamics_vendorledgerentry.md)|vendorLedgerEntries |Gets the vendorledgerentries of the company.|
|[detailedVendorLedgerEntries](dynamics_detailedvendorledgerentry.md)|detailedVendorLedgerEntries |Gets the detailedvendorledgerentries of the company.|
|[generalBudgetEntrys](dynamics_generalbudgetentry.md)|generalBudgetEntrys |Gets the generalbudgetentrys of the company.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the company. Non-editable.|
|systemVersion|string|Specifies the internal version of the company.|
|timestamp|int64||
|name|string|Represents the company's name.|
|displayName|string|Specifies the company's name. This name will appear on all sales documents for the company.|
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|
|systemCreatedAt|datetime|The datetime the company was created.|
|systemCreatedBy|GUID|The ID of the user who created the company.|
|systemModifiedAt|datetime|The last datetime the company was modified.|
|systemModifiedBy|GUID|The ID of the user who last modified the company.|

## JSON representation

Here is a JSON representation of the company resource.


```json
{
    "id": "GUID",
    "systemVersion": "string",
    "timestamp": "int64",
    "name": "string",
    "displayName": "string",
    "businessProfileId": "string",
    "systemCreatedAt": "datetime",
    "systemCreatedBy": "GUID",
    "systemModifiedAt": "datetime",
    "systemModifiedBy": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET company](../api/dynamics_company_get.md)
