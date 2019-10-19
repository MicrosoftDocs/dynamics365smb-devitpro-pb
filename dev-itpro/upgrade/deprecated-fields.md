---
title: Fields that are Moved, Removed, or Replaced
description: We're constantly streamlining and adjusting our app in-step with market developments. Read about the fields that you want to refactor your code for.
author: edupont04
ms.prod: dynamics-nav-2018
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms. search.keywords: deprecated, obsolete
ms.date: 10/01/2019
ms.author: edupont

---

# Deprecated Fields, and Fields Marked as Obsolete
In the latest version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], a number of fields have been deprecated in the current release or marked to be obsolete in a later release.  

## Definitions
Deprecated fields fall into one of the following groups:
1.	Fields moved to an extension by Microsoft  

    Partner impact: Remember to install the extension when you upgrade an existing solution from an earlier version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  
    Specifically for the extensions that are required for connecting on-premises solutions with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online for intelligent insights, you must install the **Intelligent Cloud Base Extension** extension first, and then the product-specific extension or extensions.  
2.	Fields marked as Obsolete:Pending  

    Partner impact: None in the current release, this is just a heads-up that a change is coming.  
3.	Fields no longer in use in Microsoft code  

    Partner impact: Refactor your code as soon as possible.  

## Fields marked as ObsoleteState:Pending in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
A number of fields are marked as ObsoleteState:Pending. There is no impact on code in this release.  

### Austria
The following fields are marked as ObsoleteState:Pending in the AT version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|98|General Ledger Setup|11011|Sales VAT Advance Notif. Nos.|Will be removed in a later release.|
|242|Source Code Setup|5005350|Phys. Invt. Order|Will be removed in a later release.|
|257|VAT Statement Name|11000|Sales VAT Adv. Notification|Will be removed in a later release.|
|313|Inventory Setup|5005350|Phys. Inv. Order Nos.|Will be removed in a later release.|
|313|Inventory Setup|5005352|Posted Phys. Inv. Order Nos.|Will be removed in a later release.|
|11011|Sales VAT Advance Notification|All|All|Will be removed in a later release.|
|11012|Transmission Log Entry|All|All|Will be removed in a later release.|
|11013|Electronic VAT Decl. Setup|All|All|Will be removed in a later release.|
|11014|Certificate|All|All|Will be removed in a later release.|
|5005350|Phys. Inventory Order Header|All|All|Will be removed in a later release.|
|5005351|Phys. Inventory Order Line|All|All|Will be removed in a later release.|
|5005352|Phys. Invt. Recording Header|All|All|Will be removed in a later release.|
|5005353|Phys. Invt. Recording Line|All|All|Will be removed in a later release.|
|5005354|Post. Phys. Invt. Order Header|All|All|Will be removed in a later release.|
|5005355|Posted Phys. Invt. Order Line|All|All|Will be removed in a later release.|
|5005356|Posted Phys. Invt. Rec. Header|All|All|Will be removed in a later release.|
|5005357|Posted Phys. Invt. Rec. Line|All|All|Will be removed in a later release.|
|5005358|Phys. Inventory Comment Line|All|All|Will be removed in a later release.|
|5005359|Posted Phys. Invt. Track. Line|All|All|Will be removed in a later release.|
|5005360|Phys. Invt. Tracking Buffer|All|All|Will be removed in a later release.|
|5005361|Expect. Phys. Inv. Track. Line|All|All|Will be removed in a later release.|
|5005362|Post. Exp. Ph. In. Track. Line|All|All|Will be removed in a later release.|

### Belgium
The following fields are marked as ObsoleteState:Pending in the BE version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|4|Currency|2000000|ISO Currency Code|Will be removed in a later release.|
|9|Country/Region|2000000|ISO Country/Region Code|Will be removed in a later release.|
|11306|Electronic Banking Setup|22|Notification E-mail address|Will be removed in a later release.|
|11306|Electronic Banking Setup|23|Language|Will be removed in a later release.|
|11306|Electronic Banking Setup|31|IBS Service Version|Will be removed in a later release.|
|11306|Electronic Banking Setup|21|IBS Version|Will be removed in a later release.|
|11306|Electronic Banking Setup|24|Upload Integration Mode|Will be removed in a later release.|
|11306|Electronic Banking Setup|29|IBS Log Download Nos.|Will be removed in a later release.|
|11306|Electronic Banking Setup|40|Test Environment|Will be removed in a later release.|
|11306|Electronic Banking Setup|30|IBS Request ID|Will be removed in a later release.|
|11306|Electronic Banking Setup|28|IBS Log Upload Nos.|Will be removed in a later release.|
|11306|Electronic Banking Setup|25|Upload Path|Will be removed in a later release.|
|11306|Electronic Banking Setup|26|Download Integration Mode|Will be removed in a later release.|
|11306|Electronic Banking Setup|27|Download Path|Will be removed in a later release.|
|2000010|IBS Log|All|All|Will be removed in a later release.|
|2000011|IBS Contract|All|All|Will be removed in a later release.|
|2000012|IBS Account|All|All|Will be removed in a later release.|
|2000013|IBS Account Conflict|All|All|Will be removed in a later release.|

### Canada
The following fields are marked as ObsoleteState:Pending in the CA version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|98|General Ledger Setup|10004|SAT Certificate Thumbprint|Will be removed in a later release.|
|10000|PAC Web Service|22|Certificate Thumbprint|Will be removed in a later release.|

### Germany
The following fields are marked as ObsoleteState:Pending in the DE version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|98|General Ledger Setup|11011|Sales VAT Advance Notif. Nos.|Will be removed in a later release.|
|242|Source Code Setup|5005350|Phys. Invt. Order|Will be removed in a later release.|
|257|VAT Statement Name|11000|Sales VAT Adv. Notification|Will be removed in a later release.|
|313|Inventory Setup|5005352|Posted Phys. Inv. Order Nos.|Will be removed in a later release.|
|313|Inventory Setup|5005350|Phys. Inv. Order Nos.|Will be removed in a later release.|
|11011|Sales VAT Advance Notification|All|All|Will be removed in a later release.|
|11012|Transmission Log Entry|All|All|Will be removed in a later release.|
|11013|Electronic VAT Decl. Setup|All|All|Will be removed in a later release.|
|11014|Certificate|All|All|Will be removed in a later release.|
|5005350|Phys. Inventory Order Header|All|All|Will be removed in a later release.|
|5005351|Phys. Inventory Order Line|All|All|Will be removed in a later release.|
|5005352|Phys. Invt. Recording Header|All|All|Will be removed in a later release.|
|5005353|Phys. Invt. Recording Line|All|All|Will be removed in a later release.|
|5005354|Post. Phys. Invt. Order Header|All|All|Will be removed in a later release.|
|5005355|Posted Phys. Invt. Order Line|All|All|Will be removed in a later release.|
|5005356|Posted Phys. Invt. Rec. Header|All|All|Will be removed in a later release.|
|5005357|Posted Phys. Invt. Rec. Line|All|All|Will be removed in a later release.|
|5005358|Phys. Inventory Comment Line|All|All|Will be removed in a later release.|
|5005359|Posted Phys. Invt. Track. Line|All|All|Will be removed in a later release.|
|5005360|Phys. Invt. Tracking Buffer|All|All|Will be removed in a later release.|
|5005361|Expect. Phys. Inv. Track. Line|All|All|Will be removed in a later release.|
|5005362|Post. Exp. Ph. In. Track. Line|All|All|Will be removed in a later release.|

### Mexico
The following fields are marked as ObsoleteState:Pending in the MX version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|98|General Ledger Setup|10004|SAT Certificate Thumbprint|Will be removed in a later release.|
|10000|PAC Web Service|22|Certificate Thumbprint|Will be removed in a later release.|

### Netherlands
The following fields are marked as ObsoleteState:Pending in the NL version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|312|Purchases & Payables Setup|11312|Show Totals on Purch. Inv./CM.|Will be removed in a later release.|

### Spain
The following fields are marked as ObsoleteState:Pending in the ES version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|10751|SII Setup|9|IntracommunityEndpointUrl|Will be removed in a later release.|

### Switzerland
The following fields are marked as ObsoleteState:Pending in the CH version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|4|Currency|3010541|ISO Currency Code|Will be removed in a later release.|
|98|General Ledger Setup|11011|Sales VAT Advance Notif. Nos.|Will be removed in a later release.|
|98|General Ledger Setup|11011|Sales VAT Advance Notif. Nos.|Will be removed in a later release.|
|98|General Ledger Setup|11004|Post Pmt.Disc Tol. to Pmt.Disc|Will be removed in a later release.|
|242|Source Code Setup|5005350|Phys. Invt. Order|Will be removed in a later release.|
|257|VAT Statement Name|11000|Sales VAT Adv. Notification|Will be removed in a later release.|
|311|Sales & Receivables Setup|11501|Line Amt. Round LCY|Will be removed in a later release.|
|313|Inventory Setup|5005350|Phys. Inv. Order Nos.|Will be removed in a later release.|
|313|Inventory Setup|5005352|Posted Phys. Inv. Order Nos.|Will be removed in a later release.|
|11011|Sales VAT Advance Notification|All|All|Will be removed in a later release.|
|11012|Transmission Log Entry|All|All|Will be removed in a later release.|
|11013|Electronic VAT Decl. Setup|All|All|Will be removed in a later release.|
|11014|Certificate|All|All|Will be removed in a later release.|
|5005350|Phys. Inventory Order Header|All|All|Will be removed in a later release.|
|5005351|Phys. Inventory Order Line|All|All|Will be removed in a later release.|
|5005352|Phys. Invt. Recording Header|All|All|Will be removed in a later release.|
|5005353|Phys. Invt. Recording Line|All|All|Will be removed in a later release.|
|5005354|Post. Phys. Invt. Order Header|All|All|Will be removed in a later release.|
|5005355|Posted Phys. Invt. Order Line|All|All|Will be removed in a later release.|
|5005356|Posted Phys. Invt. Rec. Header|All|All|Will be removed in a later release.|
|5005357|Posted Phys. Invt. Rec. Line|All|All|Will be removed in a later release.|
|5005358|Phys. Inventory Comment Line|All|All|Will be removed in a later release.|
|5005359|Posted Phys. Invt. Track. Line|All|All|Will be removed in a later release.|
|5005360|Phys. Invt. Tracking Buffer|All|All|Will be removed in a later release.|
|5005361|Expect. Phys. Inv. Track. Line|All|All|Will be removed in a later release.|
|5005362|Post. Exp. Ph. In. Track. Line|All|All|Will be removed in a later release.|

### United Kingdom
The following fields are marked as ObsoleteState:Pending in the GB version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|10533|MTD-Liability|All|All|Will be removed in a later release.|
|10534|MTD-Payment|All|All|Will be removed in a later release.|
|10535|MTD-Return Details|All|All|Will be removed in a later release.|

### United States
The following fields are marked as ObsoleteState:Pending in the US version.

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|98|General Ledger Setup|10004|SAT Certificate Thumbprint|Will be removed in a later release.|
|10000|PAC Web Service|22|Certificate Thumbprint|Will be removed in a later release.|

## Fields no longer in use in Microsoft code in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
A number of fields that are related to pictures are no longer in use, because the pictures are now stored in Image fields that are of Media type, in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The fields are marked as ObsoleteState:Pending.  

|Table ID|Field ID|Comments|
|--------|--------|--------|
|18|Customer|89|Picture|Will be removed in a later release.|
|23|Vendor|89|Picture|Will be removed in a later release.|
|130|Incoming Document|20|URL2|Will be removed in a later release.|
|130|Incoming Document|21|URL3|Will be removed in a later release.|
|130|Incoming Document|22|URL4|Will be removed in a later release.|
|156|Resource|52|Picture|Will be removed in a later release.|
|167|Job|57|Picture|Will be removed in a later release.|
|270|Bank Account|89|Picture|Will be removed in a later release.|
|5050|Contact|89|Picture|Will be removed in a later release.|
|5200|Employee|19|Picture|Will be removed in a later release.|
|5600|Fixed Asset|22|Picture|Will be removed in a later release.|

For more information about Media Data Type, see [Media Data Type](/dev-itpro/developer/methods-auto/media/media-data-type.md) documentation.

A field that is related to VAT Registration Number validation is no longer in use, because the feature was replaced EU VAT Registration No. Validation Service Setup [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The field is marked as ObsoleteState:Pending. 

|Table ID|Field ID|Comments|
|--------|--------|--------|
|98|General Ledger Setup|161|VAT Reg. No. Validation URL|Will be removed in a later release.|

For more information about validation of VAT Registration Numbers, see [Setting Up Calculations and Posting Methods for Value-Added Tax ](/dynamics365/business-central/finance-setup-vat#to-verify-vat-registration-numbers) documentation. 

A flow field that was used to calculate Balance in My Account page is no longer in use in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and has been replaced with Account Balance field to improve performance. The field is marked as ObsoleteState:Pending. 

|Table ID|Field ID|Comments|
|--------|--------|--------|
|9153|My Account|4|Balance|Will be removed in a later release.|

## Fields moved to an extension by Microsoft in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
A number of fields have been moved from the base application to an extension.

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

## Fields marked as ObsoleteState:Pending in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
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


## Fields no longer in use in Microsoft code in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
A number of fields that are related to product groups are no longer in use, because the feature was replaced by item categories in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. The fields are marked as ObsoleteState:Pending.  

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

For more information about the impact, see [The new Item Categories feature replaced the Product Group feature in Dynamics NAV 2017](https://blogs.msdn.microsoft.com/nav/2017/03/30/the-new-item-categories-feature-replaced-the-product-group-feature-in-dynamics-nav-2017/) on the Dynamics NAV team blog. For more information about item categories, see [How to: Categorize Items](/dynamics365/financials/inventory-how-categorize-items) in the [!INCLUDE[d365fin_long](../developer/includes/d365fin_long_md.md)] documentation.

## See Also
[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Important Information and Considerations for Before Upgrading to Dynamics 365 Business Central](upgrade-considerations.md)  
