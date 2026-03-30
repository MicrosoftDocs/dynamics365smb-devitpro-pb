---
title: Sustainability API
description: Learn how to use APIs related to the sustainability features.
author: altotovi
ms.topic: reference
ms.date: 01/26/2026
ms.author: altotovi
ms.reviewer: solsen
ms.service: dynamics-365-business-central
---

# Sustainability API

With the Sustainability feature in [!INCLUDE [prod_short](../includes/prod_short.md)], you can create connected apps that establish a point-to-point connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and third-party sustainability solutions or services. To do so, you can typically create those connections using the standard REST API to interchange data. Once you have the API access enabled, you can write code that integrates your web service or SaaS solution with the sustainability features in the [!INCLUDE[prod_short](../includes/prod_short.md)].  

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

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
| emmisionScope | string | Specifies the sustainabilityAccountCategory's emission scope. It can be "Scope 1," "Scope 2," or "Scope 3." |
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
| countryRegion | string | The country/region code in the sustainabilityLedgerEntry. |
| responsibilityCenter | string | The responsibility center code in the sustainabilityLedgerEntry. |
| userID | GUID | The user ID in this sustainabilityLedgerEntry. |
| sourceCode | string | The source code in the sustainabilityLedgerEntry. |
| reasonCode | string | The reason code in the sustainabilityLedgerEntry. |

## postedESGReportLine 

Represents the *Sust. Posted ESG Report Line* in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods

| Method | Return Type | Description |
|:--------------------|:-----------|:-------------------------|
| GET | postedESGReportLine | Gets a postedESGReportLine object. |

### Properties  

| Property           | Type   | Description     |
|:-------------------|:-------|:---------------|
| id | GUID | The unique ID of the postedESGReportLine. |
| esgReportingTemplateName | string | Specifies the postedESGReportLine's template name. |
| esgReportingName | string | Specifies the postedESGReportLine's reporting name. |
| lineNo | string | Specifies the postedESGReportLine's line number. |
| grouping | string | Specifies the postedESGReportLine's grouping info. |
| rowNo | string | Specifies the postedESGReportLine's row number. |
| description | string | Specifies the postedESGReportLine's description. |
| reportingCode | string | Specifies the postedESGReportLine's reporting code. |
| conceptLink | string | Specifies the postedESGReportLine's concept link. |
| concept | string | Specifies the postedESGReportLine's concept. |
| fieldType | string | Specifies the postedESGReportLine's field type. |
| tableNo | integer | Specifies the postedESGReportLine's table number. |
| source | string | Specifies the postedESGReportLine's source. |
| fieldNo | integer | Specifies the postedESGReportLine's table field number. |
| fieldCaption | string | Specifies the postedESGReportLine's field caption. |
| valueSettings | string | Specifies the postedESGReportLine's value setting. |
|accountFilter |string |Specifies the postedESGReportLine's account filter.|
|reportingUnit |string |Specifies the postedESGReportLine's reporting unit of measure.|
|rowType |string |Specifies the postedESGReportLine's row type.|
|rowTotaling |string |Specifies the postedESGReportLine's row totaling model.|
|calculateWith |string |Specifies the postedESGReportLine's calculate with information.|
|show |boolean |Specifies the postedESGReportLine's showing. |
|showWith |string |Specifies the postedESGReportLine's show with information.|
|rounding |string |Specifies the postedESGReportLine's rounding precision.|

## sustainabilityValueEntry 

Represents the *Sustainability Value Entry* in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods   

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityValueEntry | Gets a sustainabilityValueEntry object. |

### Properties  

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID |The unique ID of the sustainabilityValueEntry. |
|entryNo|integer |Specifies the sustainabilityValueEntry's ledger entry number.|
|type|string |Specifies the sustainabilityValueEntry's document type. |
|no|string |Specifies the sustainabilityValueEntry's number. |
|postingDate|date |Specifies the sustainabilityValueEntry's document posting date.|
|itemLedgerEntryType|string |Specifies the sustainabilityValueEntry's connected item ledger entry document type.|
|documentNo|string |Specifies the sustainabilityValueEntry's document number. |
|itemNo|string |Specifies the sustainabilityValueEntry's item number. |
|itemLedgerEntryNo|string |Specifies the sustainabilityValueEntry's connected item ledger entry number.|
|valuedQuantity|decimal |Specifies the sustainabilityValueEntry's already valued quantity.|
|itemLedgerEntryQuantity|decimal |Specifies the sustainabilityValueEntry's quantity in the item ledger entry.|
|invoicedQuantity|decimal |Specifies the sustainabilityValueEntry's invoiced quantity.|
|co2EPerUnit|decimal |Specifies the sustainabilityValueEntry's carbon footprint per unit.|
|userID|string |Specifies the sustainabilityValueEntry's user ID. |
|sourceCode|string |Specifies the sustainabilityValueEntry's source code. |
|accountNo|string |Specifies the sustainabilityValueEntry's account number. |
|accountName|string |Specifies the sustainabilityValueEntry's account name. |
|co2EAmountActual|decimal |Specifies the sustainabilityValueEntry's carbon footprint actual amount.|
|co2EAmountExpected|decimal |Specifies the sustainabilityValueEntry's carbon footprint expected amount.|
|capacityLedgerEntryNo|integer |Specifies the sustainabilityValueEntry's capacity ledger entry number.|
|documentDate|date |Specifies the sustainabilityValueEntry's document date. |
|documentType|string |Specifies the sustainabilityValueEntry's document type. |
|documentLineNo|string |Specifies the sustainabilityValueEntry's document line number.|
|jobNo|string |Specifies the sustainabilityValueEntry's project number. |
|jobTaskNo|string |Specifies the sustainabilityValueEntry's project task number.|

## sustainabilityPurchaseLine  

Represents a *Purchase Line* in [!INCLUDE[prod_short](../includes/prod_short.md)] with value tracking information.  

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityPurchaseLine | Gets a sustainabilityPurchaseLine object. |
| POST | sustainabilityPurchaseLine | Creates a sustainabilityPurchaseLine object. |
| PATCH | sustainabilityPurchaseLine | Updates a sustainabilityPurchaseLine object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID |The unique ID of the sustainabilityPurchaseLine. Noneditable. |
|documentType|string |Specifies the sustainabilityPurchaseLine's document type.|
|documentNumber|string |Specifies the sustainabilityPurchaseLine's document number.|
|lineNumber|string |Specifies the sustainabilityPurchaseLine's line number in the document.|
|no|string |Specifies the sustainabilityPurchaseLine's item number. |
|description|string |Specifies the sustainabilityPurchaseLine's description. |
|description2|string |Specifies the sustainabilityPurchaseLine's description 2.|
|sustAccountNo|string |Specifies the sustainabilityPurchaseLine's sustainability account number.|
|sustAccountName|string |Specifies the sustainabilityPurchaseLine's sustainability account name.|
|energySourceCode|string |Specifies the sustainabilityPurchaseLine's energy source code.|
|quantity|decimal |Specifies the sustainabilityPurchaseLine's quantity. |
|directUnitCost|decimal |Specifies the sustainabilityPurchaseLine's direct unit cost.|
|lineDiscount|decimal |Specifies the sustainabilityPurchaseLine's line discount.|
|lineDiscountAmount|decimal |Specifies the sustainabilityPurchaseLine's line discount amount.|
|amountIncludingVat|decimal |Specifies the sustainabilityPurchaseLine's amount including VAT.|
|amount|decimal |Specifies the sustainabilityPurchaseLine's amount. |
|renewableEnergy|boolean |Specifies the sustainabilityPurchaseLine's renewable energy compliance.|
|emissionCO2|decimal |Specifies the sustainabilityPurchaseLine's CO2 emission.|
|emissionCH4|decimal |Specifies the sustainabilityPurchaseLine's CH4 emission.|
|emissionN2O|decimal |Specifies the sustainabilityPurchaseLine's N2O emission.|
|energyConsumption|decimal |Specifies the sustainabilityPurchaseLine's energy consumption amount.|
|sourceOfEmissionData|string |Specifies the sustainabilityPurchaseLine's source of emission data.|
|emissionVerified|boolean |Specifies if the sustainabilityPurchaseLine's emission is verified.|
|cbamCompliance|boolean |Specifies if the sustainabilityPurchaseLine's CBAM status is verified.|
|invoiceDiscountAmount|decimal |Specifies the sustainabilityPurchaseLine's invoice discount amount.|
|totalEmissionCost|decimal |Specifies the sustainabilityPurchaseLine's total emission amount.|
|jobNumber|string |Specifies the sustainabilityPurchaseLine's project number.|
|currencyCode|string |Specifies the sustainabilityPurchaseLine's currency code.|
|unitCost|decimal |Specifies the sustainabilityPurchaseLine's unit cost.|
|lineAmount|decimal |Specifies the sustainabilityPurchaseLine's line amount.|

## sustainabilityGoal  

Represents a *Sustainability Goals* in [!INCLUDE[prod_short](../includes/prod_short.md)].  

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| GET | sustainabilityGoal | Gets a sustainabilityGoal object. |
| POST | sustainabilityGoal | Creates a sustainabilityGoal object. |
| PATCH | sustainabilityGoal | Updates a sustainabilityGoal object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID |The unique ID of the sustainabilityGoal. Noneditable. |
|scorecardNo|string |Specifies the sustainabilityGoal's scorecard number.|
|no|string |Specifies the sustainabilityGoal's goal number.|
|lineNo|string |Specifies the sustainabilityGoal's line number for the specific goal.|
|name|string |Specifies the sustainabilityGoal's goal name.|
|owner|string |Specifies the sustainabilityGoal's owner. |
|responsibilityCenter|string |Specifies the sustainabilityGoal's responsibility center.|
|countryRegionCode|string |Specifies the sustainabilityGoal's country/region code.|
|unitOfMeasure|string |Specifies the sustainabilityGoal's unit of measure.|
|startDate|date |Specifies the sustainabilityGoal's start date.|
|endDate|date |Specifies the sustainabilityGoal's end date.|
|baselineStartDate|date |Specifies the sustainabilityGoal's baseline start date.|
|baselineEndDate|date |Specifies the sustainabilityGoal's baseline end date.|
|baselineForCO2|decimal |Specifies the sustainabilityGoal's baseline for CO2.|
|baselineForCH4|decimal |Specifies the sustainabilityGoal's baseline for CH4.|
|baselineForN2O|decimal |Specifies the sustainabilityGoal's baseline for N2O.|
|baselineForWasteIntensity|decimal |Specifies the sustainabilityGoal's baseline for waste intensity.|
|baselineForWaterIntensity|decimal |Specifies the sustainabilityGoal's baseline for water intensity.|
|currentValueForCO2|decimal |Specifies the sustainabilityGoal's CO2 current value.|
|currentValueForCH4|decimal |Specifies the sustainabilityGoal's CH4 current value.|
|currentValueForN2O|decimal |Specifies the sustainabilityGoal's N2O current value.|
|currentValueForWasteInt|decimal |Specifies the sustainabilityGoal's waste intensity current value.|
|currentValueForWaterInt|decimal |Specifies the sustainabilityGoal's water intensity current value.|
|mainGoal|boolean |Specifies the sustainabilityGoal's main goal.|
|targetValueForCH4|decimal |Specifies the sustainabilityGoal's targeted value for CH4.|
|targetValueForCO2|decimal |Specifies the sustainabilityGoal's targeted value for CO2.|
|targetValueForN2O|decimal |Specifies the sustainabilityGoal's targeted value for N2O.|
|targetValueForWasteInt|decimal |Specifies the sustainabilityGoal's targeted value for waste intensity.|
|targetValueForWaterInt|decimal |Specifies the sustainabilityGoal's targeted value for water intensity.|


## Related information

[Sustainability management overview](/dynamics365/business-central/finance-manage-sustainability)  
[Sustainability setup](/dynamics365/business-central/finance-sustainability-setup)  
[How to record emissions](/dynamics365/business-central/finance-sustainability-journal)  
[Working with chart of sustainability accounts and ledger](/dynamics365/business-central/finance-sustainability-accounts-ledger)  
[Ad hoc analysis of sustainability data](/dynamics365/business-central/ad-hoc-analysis-sustainability)  
[Sustainability reports and analytics in Business Central](/dynamics365/business-central/sustainability-reports)  
[Work with [!INCLUDE[prod_short](../includes/prod_short.md)]](/dynamics365/business-central/ui-work-product)  
