---
title: IRS 1099 APIs
description: Learn how to use IRS1099 APIs related to local functionality in the United States version of Business Central.
author: altotovi
ms.topic: reference
ms.date: 12/30/2024
ms.author: altotovi
ms.reviewer: solsen
---

# IRS 1099 API (United States)

With the IRS 1099 feature in [!INCLUDE [prod_short](../includes/prod_short.md)], you can create connected apps that establish a point-to-point connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and third-party solutions or services for taxes or communication. To do so, you can typically create those connections using the standard REST API to interchange data. Once you have the API access enabled, you can write code that integrates your web service or SaaS solution with the IRS 1099 features in the United States local version [!INCLUDE[prod_short](../includes/prod_short.md)].  

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## irs1099documents 

Represents the **IRS 1099 Form Doc. Header** in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| Get | Irs1099documents | Get an IRS 1099 form document object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | guid | The unique ID of the Irs1099documents. Noneditable. |
| vendorNo | string | The code of vendor. |
| vendorName | string | The name of vendor. |
| docId | integer | The id of document. |
| formNo | string | The code of 1099 form. |
| receivingConsent | string | Specifies whether a vendor has provided signed consent to receive their 1099 form electronically. |
| vendorEmail | string | Specifies the vendor email address. |
| irs1099documentlines | Part | Lines of the document. |
| irs1099formreports | Part | Form reports of the document. |

## irs1099documentlines 

Represents the **IRS 1099 Form Doc. Line** in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| Get | Irs1099documentlines | Get an IRS 1099 form document line object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | guid | The unique ID of the Irs1099documentlines. Noneditable. |
| lineNo | integer | Specifies the line of the document. |
| formBoxNo | string | Specifies the number of the 1099 form box. |
| amount | decimal | Specifies the amount of the document line. |
| manuallyChanged | string | Specifies whether the lines have been changed manually by the user. |
| includeIn1099 | boolean | Specifies if the document line should be included in the 1099. |
| minimumReportableAmount | decimal | Specifies the minimum reportable amount of the document line. |

## irs1099formreports 

Represents the 1099 form report in [!INCLUDE[prod_short](../includes/prod_short.md)].   

### Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
| Get | Irs1099formreports | Get an IRS 1099 form document report object. |

### Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
| id | guid | The unique ID of the Irs1099formreports. Noneditable. |
| reportType | string | Specifies the report type. |
| fileContent | binary | Specifies the content of the file. |


## Related information

[How to set up the IRS 1099 forms](/dynamics365/business-central/LocalFunctionality/UnitedStates/set-up-use-irs1099-form-v24)  
[How to use the IRS 1099 forms](/dynamics365/business-central/LocalFunctionality/UnitedStates/how-to-1099-use)  
[How to submit and report the IRS 1099](/dynamics365/business-central/LocalFunctionality/UnitedStates/set-up-use-irs1099-form-v24#to-print-report-configuration)  
[Work with [!INCLUDE[prod_short](../includes/prod_short.md)]](/dynamics365/business-central/ui-work-product)  