---
title: Czech Features that are Moved, Removed, or Replaced | Microsoft Docs
description: We are constantly streamlining and adjusting our app in-step with market developments. Read about the features for Czech that we have moved, removed, or replaced.
author: ZdenekBicek

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: deprecated, Czech, local functionality
ms.date: 12/11/2020
ms.reviewer: edupont
ms.author: v-zdbice

---

# Deprecated Features in the Czech Version of [!INCLUDE [prodlong](../developer/includes/prodlong.md)]

This topic lists and describes the local functionality for Czech that has been removed from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], made available from a new page or report, or replaced by a new feature.

## Statutory Company Information

With this feature, users can:

- define company officials and designate them as General Manager, Accounting Managers, and Finance Managers for usage in internal and external documents.
- define document footers in different languages. Such footers can be used in different reports and documents.
- additional company registration numbers and other registration information can be stored in Company Information, for customers and vendors, and used in documents.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Moved|The Statutory Company Information is no longer specific to Czech, so we have made it generally available in the standard product. |2020 release wave 2|

## Different types of disposal and maintenance

In the Czech accounting, it is necessary to post different types of disposal and different types of maintenance of Fixed Assets to specific G/L Accounts. A standard way offers only one method of disposal and maintenance posting.

A new setup was added for this feature – **FA Extended Posting Group** table. This table allows to set up for each **FA Posting group** different G/L accounts for:

- posting disposal in combination with **Reason Code** used in disposal transaction.
- posting maintenance in combination with **Maintenance Code** used in maintenance transaction.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Moved|The functionality for Different types of disposal and maintenance in the Czech version will be moved to the Fixed Asset Localization for Czech extension. |2021 release wave 1|

## Posting Description

This feature enables users to customize the way Dynamics NAV is storing Posting Descriptions during posting to General Ledger Entries.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is deprecated and no longer needed and as not mandatory it will be deleted. |CU for 01.2021 release 2020 wave 2|

## General Entry Description

This feature transfers Sales and Purchase document line descriptions to G/L Entry description (instead of document header defined Posting Description). This functionality can be set separately for each account type in the document line.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Moved|The General Entry Description is no longer specific to Czech, so we have made it generally available in the standard product. In standard product is available only for G/L Accounts.|2019 release wave 2|

## General Journal Reconciliation

This functionality has been extended. Net Change in Jnl. and Balance after Posting are not designated for G/L Accounts marked as Reconciliation Account only, but for all G/L Accounts used in the general journal, and also for other account types - Bank Account, Customer, Vendor, Fixed Asset and IC Partner. The functionality works with amounts in general journal lines and does not calculate VAT amounts for VAT Accounts.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is deprecated and no longer needed and as not mandatory it will be deleted. |CU for 01.2021 release 2020 wave 2|

## Industry Classification

This feature adds **Industry Code** classification field to Customer/Vendor tables and Sales/Purchase documents.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|Lack of use. The business need that this functionality was introduced to cover is no longer relevant. Functionality will be deleted.|CU for 01.2021 release 2020 wave 2|

## VAT Rounding Improvements

Necessary standard functionality modification to round the VAT amount according to the Czech Republic law requirements. The VAT Rounding is subject of VAT Law 235/2004 (§37). The rounding procedure uses rounding precision in order to calculate the result. Further additions include an ability to select special rounding precisions (special rounding is identified by a new field **Round VAT Coeff.** on the **General Ledger Setup** form) during VAT calculation for the following entities in G/L posting, Sales and Purchase.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is no longer mandatory by law from 2019 and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Postponing VAT on Sales Credit Memo

Special function for the Sales Credit memo documents can be used. It is important to know (by §42 part 3b) of VAT Law 235/2004) the delivery date of the Sales Credit memo document. User can fill in the delivery date in the Posted Sales Credit Memo as the new VAT Date.  
**Sales VAT Postponed Account** field has been added in the **VAT Posting Setup**.
The **Postponed VAT** field was filled in the **VAT Entry**.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is no longer mandatory by law from 2019 and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Non-deductible VAT

This functionality is important due to §76 of VAT Law 235/2004 – the shortened claim to deduction.
The functionality includes:

- extension of **VAT Posting Setup** – allow Non-deductible VAT.
- special Non-deductible VAT Setup – user can set up Non Deductible VAT % and applicability.
- user can see **VAT % (Non-deductible)**, **VAT Base (Non-deductible)**, **VAT Amount (Deductible)** in the **VAT Entry**.
- extension of VAT Statement functionality.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature will be not supported in extension-based Czech online tenants and will be deleted. |CU for 01.2021 release 2020 wave 2|

## VAT Registration in Other Countries

This functionality extends the possibility to work with VAT and allows the user to:

- set up the company as the VAT payer in the another EU country.
- set up exchange rates for **Fulfillment Country**.
- set up **Registration Country** for Customers and Vendors.
- set up **Registration Country Routes** for changing **VAT Bus. Posting Group**.
- define the **VAT Country** and the **VAT Fulfillment Country** on Documents.
- work with VAT Statement and VAT Settlement for fulfillments in another **VAT Fulfillment Country**.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature will be not supported in extension-based Czech online tenants and will be deleted. |CU for 01.2021 release 2020 wave 2|

## VAT Identifier

This feature extends **VAT Identifier** within **VAT Posting Setup**. Adds source table for **VAT Identifier** and allow specify additional legal texts for printing in VAT recapitulation on tax documents.
The **VAT Identifier** field is the part of the **VAT Entry**.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Replaced|This feature was replaced by standard functionality of VAT Clauses and is no longer used and it will be deleted.|CU for 01.2021 release 2020 wave 2|

## Reverse Charge Statement

The amendment of VAT Law 235/2004 (§ 92a – 92e) introduced the VAT reverse charge calculation also for specific domestic fulfillments. A Reverse Charge Statement has to be submitted to the Tax Office electronically.

This feature allows user to:

- select combinations in **VAT Posting Setup** to include into the **Reverse Charge Statement**.
- set the Tariff Number Statement Code and Unit of Measures for **Reverse Charge Statement**.
- input all information on Sales and Purchase documents needed for electronic file submission.
- print **Reverse Charge Statement** and export statement data into the file for electronic submission.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is no longer mandatory by law and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Fixed Assets Classification - SKP codes

SKP code is a code from the Standard Production Classification register. The Standard Production Classification was established by the Czech Statistical Office. This code is used for Fixed Asset classification and categorizing to the tax depreciation group. New **SKP Code** table and **SKP Code field** on Fixed Asset were added.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature is no longer mandatory by law and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Fixed Assets - Depreciation FA Appreciation From

This feature allows you calculate depreciation for additional FA appreciation on fully depreciated fixed asset.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature will be not supported in extension based Czech SaaS environment and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Fixed Assets – item consumption for maintenance

Fixed Asset Maintenance functionality was improved by extending the functionality in Item Journal. New fields **FA No.** and **Maintenance Code** added to **Item Journal Line** table. These fields are used if purpose of item consumption is Fixed Asset Maintenance.

When the Item Negative Adjustment is posted in Item Journal, the **Maintenance Ledger Entry** will be created and posted automatically, based on **Automatic Maintenance Posting** field in **Inventory Setup**. For manually posting and/or item costs adjusting to maintenance, the report **Adj. Maintenance-Item Entries** was created.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| This feature is deprecated and no longer needed and as not mandatory it will be deleted.|CU for 01.2021 2019 release wave 2|

## Multiple Interest Rates

When you create finance charge terms and reminder terms, for delayed payment penalty, you can specify multiple interest rates so that the penalty fee is calculated from different interest rates in different periods.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Moved| The Multiple Interest Rates feature is no longer specific to Czech, so we have made it generally available in the standard product.|2020 release wave 2|

## Deletion of Posted Documents feature

The majority of legislation's requires companies to keep their electronic record indefinitely or for a specific period of time. In order to avoid situation of accidental deletion of Sales and Purchase documents, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] prevents users to do this.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Replaced|This Deletion of Posted Documents feature is no longer specific to Czech, so we have made it generally available in the standard product. |2019 release wave 2|

## Tax corrective documents for VAT

According to the VAT law amendment (Act No 235/2004 Coll.; amended with Act No 47/2011 Coll.), companies must correct the VAT base and amount when they are changed due to different reason (financial discount, payment discount and other corrections).

The printout of the correction document is named **Tax Correction Document**.

In the moment of paying the invoice with a defined payment discount, a Sales (or Service) Credit-Memo will be created. The document will reflect payment discount amount and calculated VAT Amount. The document can be printed in an ordinary way. The printout of the created Credit-Memo is a **Tax Corrective Document**. A Tax Corrective Document for payment discounts will be created if a payment discount is calculated based on an amount including VAT (it means the **Adjust for Payment Disc.** field is active in the **General Ledger Setup** form) and for those combinations which are active in the **Adjust for Payment Discount** fields in the **VAT Posting Setup**. In other cases payment discount will be calculated in an ordinary way.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Removed|This feature will be not supported in extension based Czech SaaS environment and will be deleted. |CU for 01.2021 release 2020 wave 2|

## Vendor Templates

New feature for creating templates for different group of vendors has been added - **Vendor Templates**. This feature copies similar functionality for customers – **Customer templates**. The Vendor Template feature makes creating vendors from contacts easy and decreases amount of mistakes.
When the user creates a new Vendor, **Apply Template** function can be used. Some fields will be automatically filled in thanks to that.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| This feature is deprecated and no longer needed and as not mandatory it will be deleted.|CU for 01.2021 2019 release wave 2|

## Item Charges Enhancements

This feature allows the user to set and check the usage of item charges in Sales and Purchase.
You can set the following options:

- assign item charge for the usage only in Sales or only in Purchase.
- disable assigning to different source lines – Receipt Lines, Transfer Receipt Lines, Return Shipment Lines, Sales Shipment Lines, Return Receipt Lines.
- check if item charge is assigned at Receive/Shipment posting.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| Lack of use. The business need that this functionality was introduced to cover is no longer relevant. Functionality will be deleted.|CU for 01.2021 2019 release wave 2|

## No. Series Enhancements

The majority of companies in the Czech Republic request the following improvements to be implemented in No. Series setup.

### No. Series Mask

New field **Mask** for No. Series structure mask added to the **No. Series** table where the user defines a position structure of the number generated in this No. Series. This feature makes creating new No. Series lines for new fiscal year easy and decreases the amount of mistakes.

This **Mask** creates a new No. Series line using the new **No. Series Mask Generator** function.

### No. Series Links

New **No. Series Link** table added. The table contains setup of No. Series links for various system functions.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| Lack of use. The business need that this functionality was introduced to cover is no longer relevant. Functionality will be deleted.|CU for 01.2021 2019 release wave 2|

## Certificate Management

For Electronic Registration of Sales (EET) functionality was introduced Certificate Management functionality to allow storing and assignment of certificates in EET.

|Moved, Removed, or Replaced?|Why?|When?|
|----|----|----|
|Moved|The Certificate Management feature is no longer specific to Czech, so we have made it generally available in the standard product. |2019 release wave 2|

## Packaging Tax Calculation

Companies selling or consuming goods on local market are liable of declaring package tax to the authorities. To do this Dynamics NAV enables users to:

- set package materials.
- collect data about sales and consumption of items with packages.
- calculate and report package tax for above mentioned transactions and items.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| Lack of use. The business need that this functionality was introduced to cover is no longer relevant. Functionality will be deleted.|CU for 01.2021 2019 release wave 2|

## Small regulatory features and best practices

Following small regulatory features and local practices of Czech companies will be removed.

### Dimension for VAT Entry

New field **Dimension Set ID** added to **VAT Ledger Entry** table.

### Disable Cards Deleting

This feature enhance standard functionality to completely disallows the user to delete records in master data with entries (such as G/L accounts, Customers, Vendors, Items). This is driven by **Delete Card with Entries** field in **General Ledger Setup**.

### Field for Full Description

In earlier versions, the character limit for **Description** and **Name** fields was 50. Therefore was a new field **Full Description** in all master data tables introduced to fulfill legal requirements for master data naming.

You can now enter up to 100 characters in all **Description** and **Name** fields across [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and it covers now the business need that this functionality was introduced.

### Posted Warehouse Documents cannot be deleted

The majority of legislation's requires companies to keep their electronic record indefinitely or for a specific period of time. In order to avoid situation of accidental deletion of Warehouse documents, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] prevents users to do this.

### Indivisible Unit of Measure

New field **Indivisible Unit** in **Unit of Measure** and **Item Unit of Measure** tables is added to avoid entering a decimal numbers in **Quantity** field in documents when Item should be posted in specific unit of measure.

### Customer Template extension

New fields added to **Customer Template** to enhance data set populated in new customer card created from contact.

### Quote Validity field on the Sales/Purchase Quote

New **Quote Validity** date field added to Sales/Purchase Quote documents to identify quote expiration.

This feature is replaced by Quote Validity feature introduced in standard product in 2019 release wave 1.

### Original User ID on Sales/Purchase documents

New **Original User ID** field added to Sales/Purchase documents to identify creator of the document.

### Check Balance in General Ledger Journal

Additional feature for disabling balance check by **Correction** field in General Ledger Journal posting.

|Moved, Removed, or Replaced?|Why?|When|
|----|----|----|
|Removed| Lack of use. The business need that this functionality was introduced to cover is no longer relevant. Functionality will be deleted.|CU for 01.2021 2019 release wave 2|

## Objects and Fields that are deleted in [!INCLUDE [prodlong](../developer/includes/prodlong.md)]

The following list shows additional fields that are deleted as a result of the features that have been removed.  

|TableNo|TableName|No.|FieldName|ObsoleteState|ObsoleteReason|
|----|----|----|----|----|----|
|18|Customer|11793|Default Ship-to Address Code|Removed|Replaced by **Ship-to Code**|
|32|Item Ledger Entry|31065|Shipment Method Code|Pending|Merge to W1|
|36|Sales Header|11793|Quote Validity|Removed|Replaced by **Quote Valid Until Date**|
|49|Invoice Post. Buffer|11761|Description|Pending|Merge to W1|
|83|Item Journal Line|31065|Shipment Method Code|Pending|Merge to W1|
|86|Exch. Rate Adjmt. Reg.|11760|Starting Date|Pending|This field is not needed and it is not used anymore.|
|86|Exch. Rate Adjmt. Reg.|11761|Ending Date|Pending|This field is not needed and it is not used anymore.|
|86|Exch. Rate Adjmt. Reg.|11762|Running Date|Pending|This field is not needed and it is not used anymore.|
|98|General Ledger Setup|11793|Reg. No. Validation URL|Removed|This field has been replaced by Table 11757 **Reg. No. Srv Config.**|
|110|Sales Shipment Header|11700|Bank Account Code|Pending|This field is not needed and it is not used anymore.|
|110|Sales Shipment Header|11701|Bank Account No.|Pending|This field is not needed and it is not used anymore.|
|110|Sales Shipment Header|11702|Bank Branch No.|Pending|This field is not needed and it is not used anymore.|
|110|Sales Shipment Header|11707|IBAN|Pending|This field is not needed and it is not used anymore.|
|110|Sales Shipment Header|11708|SWIFT Code|Pending|This field is not needed and it is not used anymore.|
|110|Sales Shipment Header|11709|Bank Name|Pending|This field is not needed and it is not used anymore.|
|263|Intrastat Jnl. Line|31069|Shipment Method Code|Pending|Merge to W1|
|270|Bank Account|11703|Specific Symbol|Pending|Duplicated with Field 11701.|
|270|Bank Account|11735|User ID|Pending|This field is not needed and it is not used anymore.|
|270|Bank Account|11762|Direct Posting|Pending|This field is not needed and it is not used anymore.|
|287|Customer Bank Account|11700|Priority|Pending|This field is not needed and it should not be used.|
|270|Customer Bank Account|11762|Specific Symbol|Pending|This field is not needed and it should not be used.|
|270|Vendor Bank Account|11700|Priority|Pending|This field is not needed and it should not be used.|
|270|Vendor Bank Account|11762|Specific Symbol|Pending|This field is not needed and it should not be used.|
|325|VAT Posting Setup|31102|Insolvency Proceedings (p.44)|Removed|Replaced by **Corrections for Bad Receivable**|
|1200|Bank Export/Import Setup|11705|Default Folder Path|Removed|Folder path isn't supported to use in DownloadFromStream, UploadToStream, Download and Upload functions for web client|
|6660|Return Receipt Header|11700|Bank Account Code|Pending|This field is not needed and it is not used anymore.|
|6660|Return Receipt Header|11701|Bank Account No.|Pending|This field is not needed and it is not used anymore.|
|6660|Return Receipt Header|11702|Bank Branch No.|Pending|This field is not needed and it is not used anymore.|
|6660|Return Receipt Header|11707|IBAN|Pending|This field is not needed and it is not used anymore.|
|6660|Return Receipt Header|11708|SWIFT Code|Pending|This field is not needed and it is not used anymore.|
|6660|Return Receipt Header|11709|Bank Name|Pending|This field is not needed and it is not used anymore.|
|11761|Electronically Govern. Setup|30|Proxy Server|Pending|This field is not needed and it should not be used.|
|11761|Electronically Govern. Setup|31|Proxy User|Pending|This field is not needed and it should not be used.|
|11761|Electronically Govern. Setup|32|Proxy Password|Removed|Moved to **Service Password**|
|11761|Electronically Govern. Setup|33|Proxy Password Key|Pending|This field is not needed and it should not be used.|
|31101|VAT Control Report Line|44|Insolvency Proceedings (p.44)|Removed|Replaced by **Corrections for Bad Receivable**|
|31103|VAT Control Report Buffer|44|Insolvency Proceedings (p.44)|Removed|Replaced by **Corrections for Bad Receivable**|
|31101|Certificate CZ|All|All Fields|Removed|Moved to standard  table 1262 **Isolated Certificate**|

## See Also

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
[Czech Local Functionality](/dynamics365/business-central/LocalFunctionality/czech/czech-local-functionality)  
