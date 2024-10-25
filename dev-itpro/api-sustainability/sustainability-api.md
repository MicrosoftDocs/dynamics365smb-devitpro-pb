---
title: Sustainability API
description: Learn how to use APIs in related to the sustainability features.
author: altotovi
ms.topic: reference
ms.date: 06/18/2024
ms.author: altotovi
ms.service: dynamics-365-business-central
---

# Sustainability API

With the Sustainability feature in [!INCLUDE [prod_short](../includes/prod_short.md)], you can create connected apps that establish a point-to-point connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and third-party sustainability solutions or services. To do so, you can typically create those connections using the standard REST API to interchange data. Once you have the API access enabled, you can write code that integrates your web service or SaaS solution with the sustainability features in the [!INCLUDE[prod_short](../includes/prod_short.md)].  

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## sustainabilityAccountCategory 

Represents the *Sustainability Category* in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods   

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityAccountCategory | Gets a sustainabilityAccountCategory object. |
| POST | sustainabilityAccountCategory | Creates a sustainabilityAccountCategory object. |
| DELETE | none | Deletes a sustainabilityAccountCategory object. |
| PATCH | sustainabilityAccountCategory | Updates a sustainabilityAccountCategory object. |

### Properties  

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the sustainabilityAccountCategory. Noneditable. |
| code | string | The code of sustainabilityAccountCategory. |
| displayName | string | Specifies the sustainabilityAccountCategory's name. |
| emmisionScope | string | Specifies the sustainabilityAccountCategory's emission  scope. It can be "Scope 1," "Scope 2," or "Scope 3." |
| registerCO2 | boolean | Specifies the sustainabilityAccountCategory that's used to register CO2 emission. |
| registerCH4 | boolean | Specifies the sustainabilityAccountCategory that's used to register CH4 emission. |
| registerN20 | boolean | Specifies the sustainabilityAccountCategory that's used to register N2O emission. |
| calculationFoundationType | string | Specifies the sustainabilityAccountCategory's formulas type. |
| emissionCalculationCustomValue | string | Specifies the sustainabilityAccountCategory's custom value for using in formulas. |

## sustainabilityAccountSubcategory 

Represents the *Sustainability Subcategory* in [!INCLUDE[prod_short](../includes/prod_short.md)].  

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityAccountSubcategory | Gets a sustainabilityAccountSubcategory object. |
| POST | sustainabilityAccountSubcategory | Creates a sustainabilityAccountSubcategory object. |
| DELETE | none | Deletes a sustainabilityAccountSubcategory object. |
| PATCH | sustainabilityAccountSubcategory | Updates a sustainabilityAccountSubcategory object. |

### Properties   

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the sustainabilityAccountSubcategory. Noneditable. |
| code | string | The code of sustainabilityAccountSubcategory. |
| displayName | string | Specifies the sustainabilityAccountSubcategory's name. |
| category | GUID | Specifies the ID of the sustainabilityAccountSubcategory's category. |
| emmissionFactorCO2 | decimal | Specifies the CO2 emission factor for the sustainabilityAccountSubcategory. |
| emmissionFactorCH4 | decimal | Specifies the CH4 emission factor for the sustainabilityAccountSubcategory. |
| emmissionFactorN2O | decimal | Specifies the N2O emission factor for the sustainabilityAccountSubcategory. |
| renewableEnergy | boolean | Specifies if the sustainabilityAccountSubcategory is a part of renewable energy. |

## sustainabilityAccount   

Represents the *Sustainability Accounts* in [!INCLUDE[prod_short](../includes/prod_short.md)].   

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityAccount | Gets a sustainabilityAccount object. |
| POST | sustainabilityAccount | Creates a sustainabilityAccount object. |
| DELETE | none | Deletes a sustainabilityAccount object. |
| PATCH | sustainabilityAccount | Updates a sustainabilityAccount object. |

### Properties 

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the sustainabilityAccount. Noneditable. |
| number | string | Specifies the number of sustainabilityAccount. |
| displayName | string | Specifies the sustainabilityAccount's name. |
| category | string | Specifies the sustainabilityAccount's category. |
| subcategory | string | Specifies the subcategory of the sustainabilityAccount's category. |
| accountType | string| The type of the sustainabilityAccount that the account is related to. It can be "Posting," "Heading," "Total," "Begin Total" or "End Total." |

## sustainabilityJournalLine  

Represents a *Sustainability Journal Lines* in Business Central.  

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityJournalLine | Gets a sustainabilityJournalLine object. |
| POST | sustainabilityJournalLine | Creates a sustainabilityJournalLine object. |
| DELETE | none | Deletes a sustainabilityJournalLine object. |
| PATCH | sustainabilityJournalLine | Updates a sustainabilityJournalLine object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the sustainabilityJournalLine. Noneditable. |
| journalTemplateName | string | Specifies the sustainabilityJournalLine's template name. |
| journalBatchName | string | Specifies the sustainabilityJournalLine's batch name. |
| lineNumber | integer | The sustainabilityJournalLine number. |
| postingDate | date | The date that the journal line is posted. |
| documentType | string | Specifies the sustainabilityJournalLine's document type. |
| documentNumber | string | Specifies a document number for the sustainabilityJournalLine line. |
| accountNumber | GUID | The ID of the sustainabilityAccount that the sustainabilityJournalLine is related to.
| manualInput | boolean | Specifies if manual input of emissions is allowed in the sustainabilityJournalLine. |
| unitOfMeasure | GUID | The ID of unit of measure for the sustainabilityJournalLine. |
| fuelOrElectricity | decimal | Specifies the fuel or electricity consumption for the sustainabilityJournalLine. |
| distance | decimal | Specifies the distance used in the formula for the sustainabilityJournalLine. |
| customAmount | decimal | Specifies the custom amount used in the formula for the sustainabilityJournalLine. |
| installationMultiplier | decimal | Specifies the installation multiplier used in the formula for the sustainabilityJournalLine. |
| timeFactor | decimal | Specifies the time factor used in the formula for the sustainabilityJournalLine. |
| emissionCO2 | decimal | Specifies the CO2 emission in the sustainabilityJournalLine if the manualInput is TRUE. |
| emissionCH4 | decimal | Specifies the CH4 emission in the sustainabilityJournalLine if the manualInput is TRUE. |
| emissionN2O | decimal | Specifies the N2O emission in the sustainabilityJournalLine if the manualInput is TRUE. |
| countryRegion | GUID | The country/region ID for the sustainabilityJournalLine. |
| responsibilityCenter | GUID | The responsibility center ID for the sustainabilityJournalLine. |
| sourceCode | GUID | The source code ID for the sustainabilityJournalLine. |
| reasonCode | GUID | The reason code ID for the sustainabilityJournalLine. |

## sustainabilityLedgerEntry

Represents the *Sustainability Ledger Entries* in [!INCLUDE[prod_short](../includes/prod_short.md)].  

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityLedgerEntry | Gets a sustainabilityLedgerEntry object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the sustainabilityLedgerEntry. Noneditable. |
| entryNumber | integer | Sustainability Entry number. |
| postingDate | date | The date that the sustainability entry is posted. |
| documentType | string | Specifies a document type for the sustainabilityLedgerEntry. |
| documentNumber | string | Specifies a document number for the sustainabilityLedgerEntry. |
| accountNumber | string | Specifies the sustainability account code in this specific sustainabilityLedgerEntry. |
| displayName | string | Specifies the sustainability account name in this specific sustainabilityLedgerEntry. |
| emissionScope | string | Specifies the emission scope of the sustainabilityAccountCategory in the sustainabilityLedgerEntry. It can be "Scope 1," "Scope 2," or "Scope 3." |
| unitOfMeasure | string | Specifies the unit of measure code in the sustainabilityLedgerEntry. |
| emissionCO2 | decimal | Specifies the CO2 emission for the sustainabilityLedgerEntry. |
| emissionCH4 | decimal | Specifies the CH4 emission for the sustainabilityLedgerEntry. |
| emissionN2O | decimal | Specifies the N2O emission for the sustainabilityLedgerEntry. |
| countryRegion | string | The country/region code in the V. |
| responsibilityCenter | string | The responsibility center code in the sustainabilityLedgerEntry. |
| userID | GUID | The user ID in this sustainabilityLedgerEntry. |
| sourceCode | string | The source code in the sustainabilityLedgerEntry. |
| reasonCode | string | The reason code in the sustainabilityLedgerEntry. |


## Related information

[Sustainability management overview](/dynamics365/business-central/finance-manage-sustainability)  
[Sustainability setup](/dynamics365/business-central/finance-sustainability-setup)  
[How to record emissions](/dynamics365/business-central/finance-sustainability-journal)  
[Working with chart of sustainability accounts and ledger](/dynamics365/business-central/finance-sustainability-accounts-ledger)  
[Ad hoc analysis of sustainability data](/dynamics365/business-central/ad-hoc-analysis-sustainability)  
[Sustainability reports and analytics in Business Central](/dynamics365/business-central/sustainability-reports)  
[Work with [!INCLUDE[prod_short](../includes/prod_short.md)]](/dynamics365/business-central/ui-work-product)  