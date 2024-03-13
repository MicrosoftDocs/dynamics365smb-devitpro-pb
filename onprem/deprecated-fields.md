---
title: Fields that are Moved, Removed, or Replaced
description: We're constantly streamlining and adjusting our app in-step with market developments. Read about the fields that you want to refactor your code for.
author: edupont04
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms. search.keywords: deprecated, obsolete
ms.date: 10/01/2018
ms.author: edupont

---

# Deprecated Fields, and Fields Marked as Obsolete
In the [!INCLUDE[navnowlong](includes/navnowlong_md.md)], a number of fields have been deprecated in the current release or marked to be obsolete in a later release.  

## Definitions
Deprecated fields fall into one of the following groups:
1.	Fields moved to an extension by Microsoft  

    Partner impact: Remember to install the extension when you upgrade an existing solution from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)].  
2.	Fields marked as Obsolete:Pending  

    Partner impact: None in the current release, this is just a heads-up that a change is coming.  
3.	Fields no longer in use in Microsoft code  

    Partner impact: Refactor your code as soon as possible.  

## Fields moved to an extension by Microsoft in [!INCLUDE[nav2018](includes/nav2018_md.md)]
A number of fields have been moved from the base application to an extension.

### Denmark
The functionality for payments and reconciliation in the Danish version (FIK) has been moved to the Payments and Reconciliations (DK) extension. For more information, see [The Payments and Reconciliations (DK) Extension](/dynamics365/financials/ui-extensions-payments-reconciliation-formats-dk) in the [!INCLUDE[d365fin_long](includes/d365fin_long_md.md)] documentation.

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

## Fields marked as ObsoleteState:Pending in [!INCLUDE[nav2018](includes/nav2018_md.md)]
A number of fields are marked as ObsoleteState:Pending. There is no impact on code in this release.  

### Iceland
The following fields are mareded as ObsoleteState:Pending in the IS version.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|21|10900|Will be removed in a later release.|
|311|10900|Will be removed in a later release.|

### United Kingdom
The following fields are marked as ObsoleteState:Pending in the UK version.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|18|10500|Will be removed in a later release.|
|23|10500|Will be removed in a later release.|
|36|10501|Will be removed in a later release.|
|38|10501|Will be removed in a later release.|
|112|10501|Will be removed in a later release.|
|114|10501|Will be removed in a later release.|
|122|10501|Will be removed in a later release.|
|124|10501|Will be removed in a later release.|
|5107|10501|Will be removed in a later release.|
|5109|10501|Will be removed in a later release.|

A number of fields are also deleted in the UK version. For more information, see [Deprecated Features in the UK Version](deprecated-features-uk.md).

### Denmark
The following fields are marked as ObsoleteState:Pending in the Danish version.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|3|13600|Will be removed in a later release.|
|4|13600|Will be removed in a later release.|
|9|13600|Will be removed in a later release.|
|18|13605|Will be removed in a later release.|
|36|13600|Will be removed in a later release.|
|36|13601|Will be removed in a later release.|
|36|13602|Will be removed in a later release.|
|36|13604|Will be removed in a later release.|
|36|13605|Will be removed in a later release.|
|36|13606|Will be removed in a later release.|
|36|13607|Will be removed in a later release.|
|36|13620|Will be removed in a later release.|
|37|13600|Will be removed in a later release.|
|295|13600|Will be removed in a later release.|
|295|13602|Will be removed in a later release.|
|295|13605|Will be removed in a later release.|
|295|13606|Will be removed in a later release.|
|295|13607|Will be removed in a later release.|
|295|13608|Will be removed in a later release.|
|295|13620|Will be removed in a later release.|
|296|13600|Will be removed in a later release.|
|297|13600|Will be removed in a later release.|
|297|13601|Will be removed in a later release.|
|297|13602|Will be removed in a later release.|
|297|13605|Will be removed in a later release.|
|297|13606|Will be removed in a later release.|
|297|13607|Will be removed in a later release.|
|297|13608|Will be removed in a later release.|
|297|13620|Will be removed in a later release.|
|298|13600|Will be removed in a later release.|
|302|13600|Will be removed in a later release.|
|302|13601|Will be removed in a later release.|
|302|13602|Will be removed in a later release.|
|302|13605|Will be removed in a later release.|
|302|13606|Will be removed in a later release.|
|302|13607|Will be removed in a later release.|
|302|13608|Will be removed in a later release.|
|302|13620|Will be removed in a later release.|
|303|13600|Will be removed in a later release.|
|304|13600|Will be removed in a later release.|
|304|13601|Will be removed in a later release.|
|304|13602|Will be removed in a later release.|
|304|13605|Will be removed in a later release.|
|304|13606|Will be removed in a later release.|
|304|13607|Will be removed in a later release.|
|304|13608|Will be removed in a later release.|
|304|13620|Will be removed in a later release.|
|305|13600|Will be removed in a later release.|
|311|13600|Will be removed in a later release.|
|311|13601|Will be removed in a later release.|
|311|13602|Will be removed in a later release.|
|311|13603|Will be removed in a later release.|
|311|13604|Will be removed in a later release.|
|5107|13600|Will be removed in a later release.|
|5107|13601|Will be removed in a later release.|
|5107|13602|Will be removed in a later release.|
|5107|13605|Will be removed in a later release.|
|5107|13606|Will be removed in a later release.|
|5107|13607|Will be removed in a later release.|
|5107|13608|Will be removed in a later release.|
|5107|13620|Will be removed in a later release.|
|5108|13602|Will be removed in a later release.|
|5900|13600|Will be removed in a later release.|
|5900|13601|Will be removed in a later release.|
|5900|13604|Will be removed in a later release.|
|5900|13608|Will be removed in a later release.|
|5900|13620|Will be removed in a later release.|
|5902|13600|Will be removed in a later release.|
|5911|13600|Will be removed in a later release.|
|5911|13601|Will be removed in a later release.|
|5992|13600|Will be removed in a later release.|
|5992|13601|Will be removed in a later release.|
|5992|13602|Will be removed in a later release.|
|5992|13604|Will be removed in a later release.|
|5992|13608|Will be removed in a later release.|
|5992|13620|Will be removed in a later release.|
|5993|13600|Will be removed in a later release.|
|5994|13600|Will be removed in a later release.|
|5994|13601|Will be removed in a later release.|
|5994|13602|Will be removed in a later release.|
|5994|13604|Will be removed in a later release.|
|5994|13608|Will be removed in a later release.|
|5994|13620|Will be removed in a later release.|
|5995|13600|Will be removed in a later release.|


## Fields no longer in use in Microsoft code in [!INCLUDE[nav2018](includes/nav2018_md.md)]
A number of fields that are related to product groups are no longer in use, because the feature was replaced by item categories in [!INCLUDE[nav2017](includes/nav2017.md)]. The fields are marked as ObsoleteState:Pending.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|5723|All|Deprecated. Do not use.|
|27|5704|Will be removed in a later release.|
|32|5707|Will be removed in a later release.|
|37|5712|Will be removed in a later release.|
|83|5707|Will be removed in a later release.|
|111|5712|Will be removed in a later release.|
|113|5712|Will be removed in a later release.|
|115|5712|Will be removed in a later release.|
|123|5712|Will be removed in a later release.|
|125|5712|Will be removed in a later release.|
|246|5705|Will be removed in a later release.|
|753|5707|Will be removed in a later release.|
|5108|5712|Will be removed in a later release.|
|5110|5712|Will be removed in a later release.|
|5741|5712|Will be removed in a later release.|
|5745|5707|Will be removed in a later release.|
|5747|5707|Will be removed in a later release.|
|5902|5712|Will be removed in a later release.|
|5991|5712|Will be removed in a later release.|
|5993|5712|Will be removed in a later release.|
|6651|5712|Will be removed in a later release.|
|6661|5712|Will be removed in a later release.|

For more information about the impact, see [The new Item Categories feature replaced the Product Group feature in Dynamics NAV 2017](https://blogs.msdn.microsoft.com/nav/2017/03/30/the-new-item-categories-feature-replaced-the-product-group-feature-in-dynamics-nav-2017/) on the Dynamics NAV team blog. For more information about item categories, see [How to: Categorize Items](/dynamics365/financials/inventory-how-categorize-items) in the [!INCLUDE[d365fin_long](includes/d365fin_long_md.md)] documentation.

## See Also
[Upgrading to Microsoft Dynamics NAV 2018](upgrading-to-microsoft-dynamics-nav.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Considerations for Upgrading Dynamics NAV](upgrade-considerations.md)  
[Deprecated Features in the UK Version](deprecated-features-uk.md)  
