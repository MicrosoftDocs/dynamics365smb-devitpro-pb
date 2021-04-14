---
title: Fields that are Moved, Removed, or Replaced
description: We're constantly streamlining and adjusting our app in-step with market developments. Read about the fields that you want to refactor your code for.
author: edupont04
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms. search.keywords: deprecated, obsolete
ms.date: 04/01/2021
ms.author: edupont

---

# Deprecated Fields, and Fields Marked as Obsolete

In the latest version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], a number of fields have been deprecated in the current release or marked to be obsolete in a later release.  

## Definitions

Deprecated fields fall into one of the following groups:

1. Fields moved to an extension by Microsoft  

   Partner impact: Remember to install the extension when you upgrade an existing solution from an earlier version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  
  
   Specifically for the extensions that are required for connecting on-premises solutions with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online for intelligent insights, you must install the **Intelligent Cloud Base Extension** extension first, and then the product-specific extension or extensions.  
2. Fields marked as **Obsolete:Pending**  

   Partner impact: None in the current release, this is just a heads-up that a change is coming.  
3. Fields no longer in use in Microsoft code  

   Partner impact: Refactor your code as soon as possible.  

## Fields marked as ObsoleteState:Pending in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

A number of fields are marked as ObsoleteState:Pending. There is no impact on code in this release.  

### Austria

[!INCLUDE [fields-obsolete-at](../includes/fields-obsolete-at.md)]

### Belgium

[!INCLUDE [fields-obsolete-be](../includes/fields-obsolete-be.md)]

### Canada

[!INCLUDE [fields-obsolete-ca](../includes/fields-obsolete-ca.md)]

### Czech Republic

[!INCLUDE [fields-obsolete-cz](../includes/fields-obsolete-cz.md)]

### Denmark

[!INCLUDE [fields-obsolete-dk](../includes/fields-obsolete-dk.md)]

### Germany

[!INCLUDE [fields-obsolete-de](../includes/fields-obsolete-de.md)]

### Iceland

[!INCLUDE [fields-obsolete-is](../includes/fields-obsolete-is.md)]

### Mexico

[!INCLUDE [fields-obsolete-mx](../includes/fields-obsolete-mx.md)]

### Netherlands

[!INCLUDE [fields-obsolete-nl](../includes/fields-obsolete-nl.md)]

### Spain

[!INCLUDE [fields-obsolete-es](../includes/fields-obsolete-es.md)]

### Switzerland

[!INCLUDE [fields-obsolete-ch](../includes/fields-obsolete-ch.md)]

### United Kingdom

[!INCLUDE [fields-obsolete-uk](../includes/fields-obsolete-uk.md)]

### United States

[!INCLUDE [fields-obsolete-us](../includes/fields-obsolete-us.md)]

### Base version

[!INCLUDE [fields-obsolete-baseapp](../includes/fields-obsolete-baseapp.md)]

## Fields moved to an extension by Microsoft in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

A number of fields have been moved from the base application to an extension.

### Czech Republic

The functionality for Different types of disposal and maintenance in the Czech version has been moved to the Different types of disposal and maintenance (CZ) extension. For more information, see [Different types of disposal and maintenance (CZ) Extension](/dynamics365/business-central/LocalFunctionality/Czech/ui-extensions-different-disposal-maintenance-types-cz) in the [!INCLUDE[d365fin_long](../developer/includes/d365fin_long_md.md)] documentation.

|Old Table ID|Old Table Name|Old Field ID|Old Field Name|New Table ID|New Table Name|New Field ID|New Field Name|
|--------|--------|--------|--------|--------|--------|--------|--------|
|5603|FA Setup|31043|FA Maintenance By Maint. Code|N/A|Not needed after refactoring.|N/A||
|5603|FA Setup|31045|FA Disposal By Reason Code|N/A|Not needed after refactoring.|N/A||
|5606|FA Posting Group|31042|Use Standard Disposal|N/A|Not needed after refactoring.|N/A||
|5615|FA Allocation|11760|Reason/Maintenance Code|5615|FA Allocation|xxxxx|ReasonMaintenanceCode|
|31042|FA Extended Posting Group|1|FA Posting Group Code|xxxxx|FA Extended Posting Group|1|FA Posting Group Code|
|31042|FA Extended Posting Group|2|FA Posting Type|xxxxx|FA Extended Posting Group|2|FA Posting Type|
|31042|FA Extended Posting Group|3|Code|xxxxx|FA Extended Posting Group|3|Code|
|31042|FA Extended Posting Group|4|Book Val. Acc. on Disp. (Gain)|xxxxx|FA Extended Posting Group|4|Book Val. Acc. on Disp. (Gain)|
|31042|FA Extended Posting Group|5|Book Val. Acc. on Disp. (Loss)|xxxxx|FA Extended Posting Group|5|Book Val. Acc. on Disp. (Loss)|
|31042|FA Extended Posting Group|6|Maintenance Expense Account|xxxxx|FA Extended Posting Group|6|Maintenance Expense Account|
|31042|FA Extended Posting Group|7|Maintenance Bal. Acc.|xxxxx|FA Extended Posting Group|7|Maintenance Bal. Acc.|
|31042|FA Extended Posting Group|8|Allocated Book Value % (Gain)|xxxxx|FA Extended Posting Group|8|Allocated Book Value % (Gain)|
|31042|FA Extended Posting Group|9|Allocated Book Value % (Loss)|xxxxx|FA Extended Posting Group|9|Allocated Book Value % (Loss)|
|31042|FA Extended Posting Group|10|Allocated Maintenance %|xxxxx|FA Extended Posting Group|10|Allocated Maintenance %|
|31042|FA Extended Posting Group|31040|Sales Acc. On Disp. (Gain)|xxxxx|FA Extended Posting Group|31040|Sales Acc. On Disp. (Gain)|
|31042|FA Extended Posting Group|31042|Sales Acc. On Disp. (Loss)|xxxxx|FA Extended Posting Group|31042|Sales Acc. On Disp. (Loss)|

### Denmark

The functionality for payments and reconciliation in the Danish version (FIK) has been moved to the Payments and Reconciliations (DK) extension. For more information, see [The Payments and Reconciliations (DK) Extension](/dynamics365/business-central/ui-extensions-payments-reconciliation-formats-dk) in the [!INCLUDE[d365fin_long](../developer/includes/d365fin_long_md.md)] documentation.

|Table ID|Table Name|Old Field ID|New Field ID|Old Field Name|New Field Name|
|--------|--------|--------|--------|--------|--------|
|23|Vendor|13650|13651|Giro Acc No.|GiroAccNo|
|25|Vendor Ledger Entry|13650|13651|Giro Acc No.|GiroAccNo|
|38|Purchase Header|13650|13651|Giro Acc No.|GiroAccNo|
|79|Company Information|13600|13651|Bank Creditor No.|BankCreditorNo|
|81|General Journal Line|13650|13651|Giro Acc No.|GiroAccNo|
|122|Purchase Invoice Header|13650|13651|Giro Acc No.|GiroAccNo|
|273|Bank Acc. Reconciliation|13600|13601|FIK Payment Reconciliation|FIKPaymentReconciliation|
|274|Bank Acc. Reconciliation Line|13600|13601|Payment Reference|PaymentReference|
|289|Payment Method|13601|13652|Payment Type Validation|PaymentTypeValidation|
|372|Payment Buffer|13650|13651|Giro Acc No.|GiroAccNo|
|1226|Payment Export Data|13650|13651|Recipient Giro Acc No.|RecipientGiroAccNo|
|1250|Bank Statement Matching Buffer|13601|13652|Match Status|MatchStatus|
|1250|Bank Statement Matching Buffer|13600|13653|Description|DescriptionBankStatement|

## See Also

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Important Information and Considerations for Before Upgrading to Dynamics 365 Business Central](upgrade-considerations.md)  
