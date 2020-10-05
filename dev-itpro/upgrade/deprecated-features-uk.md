---
title: UK Features that are Moved, Removed, or Replaced | Microsoft Docs
description: We are constantly streamlining and adjusting our app in-step with market developments. Read about the features for the UK that we have moved, removed, or replaced.
author: bholtorf

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: deprecated, United Kingdom, local functionality
ms.date: 10/01/2020
ms.author: bholtorf

---

# Deprecated Features in the UK Version of [!INCLUDE [prodlong](../developer/includes/prodlong.md)]
This topic lists and describes the local functionality for the United Kingdom that has been removed from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], made available from a new page or report, or replaced by a new feature.

## Accounting periods and system calendar
If your fiscal year is different than the calendar, you can measure your fiscal period in other units of time, such as months or quarters. To do this, you set up system calendars and accounting periods.
  
|Moved, Removed, or Replaced?| Why?|
|----|----|
| Removed | Lack of use. Additionally, there are standard features for accounting periods that provide most of the same functionality as the UK accounting periods. |

## Create and export a Bankers' Automated Clearing Service file
You can use Bankers' Automated Clearing Service (BACS) to process financial transactions electronically. To do so, you must export vendor payments to a BACS file using the Export BACS option.

|Moved, Removed, or Replaced?| Why?|
|----|----|
| Removed | This banking format standard is no longer used. This functionality is now covered by extensions such as the Envestnet Yodlee Bank Feeds, AMC Banking, and various other formats. |

<!-- THIS WORK DID NOT GET DONE. EXPECT IT TO COME IN A FUTURE UPDATE
## Multiple interest rates
To let you use more than one interest rate to calculate finance charges for a specific period, you can specify multiple rates for each finance charge term.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved| This functionality is also available to countries such as NO, SE, FI, and IT, so we have removed the country-specific designation so that it's available to everyone.|
-->

<!-- THIS WORK DID NOT GET DONE. EXPECT IT TO COME IN A FUTURE UPDATE
## VAT Audit reports
VAT Audit reports let you generate VAT amounts for a specific period in response to an audit from a tax authority:

* **VAT Audit** - Used for VAT auditing.
* **VAT Entry Exception** - Details the differences between the calculated VAT and the changes that occur because of rounding, VAT tolerance percentage, and discounts. It also displays the difference in VAT amounts for the tax authorities.

|||
|----|----|
|Moved, Removed, or Replaced?| Why?|
|Replaced| The VAT Audit report is replaced. Now you can export data to Excel through the OData service. The VAT Entry Exception report is no longer specific to the UK. The documentation for these reports has moved to the [!INCLUDE[d365fin](../developer/includes/d365fin_md.md)] repository.|
-->

## Non-invoiced stock reports
For month-end reconciliation and auditing, you can use the **Stock Received Not Invoiced** report to view stock that is received but not yet invoiced, and the **Stock Shipped Not Invoiced** report to see stock that has been shipped but not yet invoiced.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved | The functionality for the Shipped, Non-Invoiced Sales Orders and the Received, Not Invoiced Purchase Order reports are no longer specific to the UK, so we have made them generally available as views for sales orders and purchase orders. The views are available in the Navigation Pane as Shipped Not Invoiced and Shipped Not Received options under Sales Orders and Purchase Orders, respectively.|

### Print Unposted Sales and Unposted Purchase reports
The Unposted Sales and Unposted Purchase reports let you print a list of sales and purchase documents that are not yet posted.  

|Moved, Removed, or Replaced?| Why?|
|----|----|
| Moved | The Unposted Sales and Unposted Purchase reports are now available from the Navigation Pane as views under Sales Orders and Purchase Orders. |

### Other VAT reports
You can use the following reports for VAT reporting:  

* **Day Book VAT Entry** - Displays the daily total for VAT entries for a specific period.
* **Day Book Cust. Ledger Entry** - Displays the daily total for customer ledger entries for a specific period.
* **Day Book Vendor Ledger Entry** - Displays the daily total for vendor ledger entries for a specific period.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved| These VAT-related reports are no longer specific to the UK, so we have made them generally available in the standard product.  |

## Specify the Supply Type on documents
You can specify supply types such as sales, loan, exchange, hire, lease, rental, sales on commission, on tax invoices. To do this, you must update the codes and names of the supply types in the **Types of Supply** window.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Removed| Lack of use. The business need that this functionality was introduced to cover is no longer relevant.  |

## Multiple interest rates
When you create finance charge terms and reminder terms, for delayed payment penalty, you can specify multiple interest rates so that the penalty fee is calculated from different interest rates in different periods.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved| The Multiple Interest Rates feature is no longer specific to the UK, so we have made it generally available in the standard product. |

## Direct Sales Details and Direct Purchase Details reports
You can view headers with order numbers and descriptions from sales and purchase documents, and filter or select data for these reports based on the general ledger account number, document number, and posting date.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Removed| Lack of use.

## Objects and Fields that are deleted in [!INCLUDE [prodlong](../developer/includes/prodlong.md)]
Table 10505 has been deleted. The following list shows additional fields that are deleted as a result of the features that have been removed.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|23|10550|Deleted.|
|81|10550|Deleted.|
|81|10551|Deleted.|
|81|10552|Deleted.|
|81|10553|Deleted.|
|271|10550|Deleted.|
|312|10550|Deleted.|
|312|10551|Deleted.|
|334|10505|Deleted.|
|363|10550|Deleted.|
|7118|10505|Deleted.|
|7152|10550|Deleted.|

## Fields marked as ObsoleteState:Pending

[!INCLUDE [fields-obsolete-uk](../includes/fields-obsolete-uk.md)]

## See Also

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
[United Kingdom Local Functionality](/dynamics365/business-central/LocalFunctionality/unitedkingdom/united-kingdom-local-functionality)  
