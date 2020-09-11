---
title: Fields that are Moved, Removed, or Replaced
description: We're constantly streamlining and adjusting our app in-step with market developments. Read about the fields that you want to refactor your code for.
author: edupont04
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms. search.keywords: deprecated, obsolete
ms.date: 04/01/2020
ms.author: edupont

---

# Deprecated Fields, and Fields Marked as Obsolete

In the latest version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], a number of fields have been deprecated in the current release or marked to be obsolete in a later release.  

## Definitions

Deprecated fields fall into one of the following groups:

1.    Fields moved to an extension by Microsoft  

    Partner impact: Remember to install the extension when you upgrade an existing solution from an earlier version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  
    Specifically for the extensions that are required for connecting on-premises solutions with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online for intelligent insights, you must install the **Intelligent Cloud Base Extension** extension first, and then the product-specific extension or extensions.  
2.    Fields marked as Obsolete:Pending  

    Partner impact: None in the current release, this is just a heads-up that a change is coming.  
3.    Fields no longer in use in Microsoft code  

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

### Czech Republic

The following fields are marked as ObsoleteState:Pending in the CZ version.

#### Different types of disposal and maintenance

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|5603|FA Setup|31043|FA Maintenance By Maint. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5603|FA Setup|31045|FA Disposal By Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5606|FA Posting Group|31042|Use Standard Disposal|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Posting Description

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|18|Customer|31063|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|23|Vendor|31063|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|36|Sales Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|36|Sales Header|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|38|Purchase Header|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|302|Finance Charge Memo Header|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11779|Fin. Charge Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|312|Purchases & Payables Setup|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|313|Inventory Setup|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5107|Sales Header Archive|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5109|Purchase Header Archive|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5911|Service Mgt. Setup|11765|Posting Desc. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11785|Posting Description|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11786|Posting Desc. Parameter|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### General Journal Reconciliation

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|269|G/L Account Net Change|11760|Type|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Industry Classification

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|18|Customer|31063|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|23|Vendor|31063|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|36|Sales Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|38|Purchase Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|79|Company Information|11793|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|110|Sales Shipment Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|112|Sales Invoice Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|114|Sales Cr.Memo Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|120|Purch. Rcpt. Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|122|Purch. Inv. Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|124|Purch. Cr. Memo Hdr.|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5990|Service Shipment Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5994|Service Cr.Memo Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|6650|Return Shipment Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|6660|Return Receipt Header|31065|Industry Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11791|Industry Code|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### VAT Rounding Improvements

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11765|Round VAT Coeff.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|98|General Ledger Setup|11766|VAT Coeff. Rounding Precision|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Postponing VAT on Sales Credit Memo

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|36|Sales Header|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|91|Gen. Journal Line|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|114|Sales Cr.Memo Header|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|114|Sales Cr.Memo Header|11764|Postponed VAT Realized|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11777|Credit Memo Confirmation|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|325|VAT Posting Setup|11764|Sales VAT Postponed Account|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5911|Service Mgt. Setup|11777|Credit Memo Confirmation|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5994|Service Cr.Memo Header|11763|Postponed VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5994|Service Cr.Memo Header|11764|Postponed VAT Realized|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Non-deductible VAT

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|39|Purchase Line|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|39|Purchase Line|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|39|Purchase Line|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|49|Invoice Post. Buffer|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|49|Invoice Post. Buffer|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|49|Invoice Post. Buffer|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|11772|VAT Base LCY (Non Deduct.)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|11773|VAT Amount LCY (Non Deduct.)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|98|General Ledger Setup|11762|Statement Templ. Name Coeff.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|98|General Ledger Setup|11763|Statement Name Coeff.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|98|General Ledger Setup|11764|Statement Line No. Coeff.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|123|Purch. Inv. Line|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|123|Purch. Inv. Line|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|123|Purch. Inv. Line|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|125|Purch. Cr. Memo Line|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|125|Purch. Cr. Memo Line|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|125|Purch. Cr. Memo Line|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|242|Source Code Setup|11762|VAT Coefficient|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11770|Primary Entry No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|290|VAT Amount Line|11765|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|290|VAT Amount Line|11766|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|290|VAT Amount Line|11767|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|325|VAT Posting Setup|11763|Non Deduct. VAT Corr. Account|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|325|VAT Posting Setup|11766|Allow Non Deductible VAT|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11731|Cash Document Line|602|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11731|Cash Document Line|603|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11731|Cash Document Line|604|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11736|Posted Cash Document Line|602|VAT % (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11736|Posted Cash Document Line|603|VAT Base (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11736|Posted Cash Document Line|604|VAT Amount (Non Deductible)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11784|Non Deductible VAT Setup|1|VAT Bus. Posting Group|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11784|Non Deductible VAT Setup|2|VAT Prod. Posting Group|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11784|Non Deductible VAT Setup|3|From Date|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11784|Non Deductible VAT Setup|4|Non Deductible VAT %|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### VAT Registration in Other Countries

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|32|Item Ledger Entry|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|36|Sales Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|36|Sales Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|38|Purchase Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|38|Purchase Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|83|Item Journal Line|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|110|Sales Shipment Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|112|Sales Invoice Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|112|Sales Invoice Header|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|114|Sales Cr.Memo Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|114|Sales Cr.Memo Header|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|120|Purch. Rcpt. Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|122|Purch. Inv. Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|122|Purch. Inv. Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|124|Purch. Cr. Memo Hdr.|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|124|Purch. Cr. Memo Hdr.|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|31061|Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|31062|Currency Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|261|Intrastat Jnl. Template|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|262|Intrastat Jnl. Batch|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5107|Sales Header Archive|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5107|Sales Header Archive|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5109|Purchase Header Archive|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5109|Purchase Header Archive|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5990|Service Shipment Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5990|Service Shipment Header|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5992|Service Invoice Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5992|Service Invoice Header|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5994|Service Cr.Memo Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5994|Service Cr.Memo Header|31061|Curr. Factor Perf. Country/Reg|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|6650|Return Shipment Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|6660|Return Receipt Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11762|Registration Country/Region|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11763|Registr. Country/Region Route|All|All fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11764|Perf. Country Curr. Exch. Rate|All|All fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31000|Sales Advance Letter Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31000|Sales Advance Letter Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31020|Purch. Advance Letter Header|31060|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31020|Purch. Advance Letter Header|31061|Perf. Country Currency Factor|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31066|VIES Declaration Header|80|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31100|VAT Control Report Header|15|Perform. Country/Region Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### VAT Identifier

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11771|Check VAT Identifier|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11767|VAT Identifier|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11768|VAT Identifier Translate|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Reverse Charge Statement

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|31065|Stat. Reporting Setup|31090|Reverse Charge Nos.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31065|Stat. Reporting Setup|31095|Reverse Charge Auth. Emp. No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31065|Stat. Reporting Setup|31096|Rvrs. Chrg. Filled by Emp. No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31093|Reverse Charge Header|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31094|Reverse Charge Line|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Fixed Assets Classification - SKP codes

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5600|Fixed Asset|31044|SKP Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31043|SKP Code|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Fixed Assets – Depreciation FA Appreciation From

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5612|FA Depreciation Book|31040|Depr. FA Appreciation From|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Fixed Assets – item consumption for maintenance

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|32|Item Ledger Entry|31043|FA No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|32|Item Ledger Entry|31044|Maintenance Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|32|Item Ledger Entry|31045|Maintenance Amount|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|81|Gen. Journal Line|31070|Item Ledger Entry No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|83|Item Journal Line|31043|FA No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|83|Item Journal Line|31044|Maintenance Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|210|Job Journal Line|31043|FA No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|210|Job Journal Line|31044|Maintenance Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|242|Source Code Setup|31041|Maintenance Adjustment|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|313|Inventory Setup|31042|Automatic Maintenance Posting|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5600|Fixed Asset|31042|Deprec. Book Code (Mainten.)|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5621|FA Journal Line|31040|Item Ledger Entry No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5625|Maintenance Ledger Entry|31040|Item Ledger Entry No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Tax corrective documents for VAT

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|36|Sales Header|11762|Tax Corrective Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|37|Sales Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|112|Sales Invoice Header|11762|Tax Corrective Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|113|Sales Invoice Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|115|Sales Cr.Memo Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11780|Pmt.Disc. Tax Corr.Doc. No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11772|Reas.Cd. on Tax Corr.Doc.Mand.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11773|Pmt.Disc.Tax Corr.Doc. Nos.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11774|Copy As Tax Corr. Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11775|Reason Code For Payment Disc.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5107|Sales Header Archive|11762|Tax Corrective Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5108|Sales Line Archive|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5900|Service Header|11762|Tax Corrective Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5902|Service Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5911|Service Mgt. Setup|11772|Reas.Cd. on Tax Corr.Doc.Mand.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5911|Service Mgt. Setup|11775|Reason Code For Payment Disc.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5992|Service Invoice Header|11762|Tax Corrective Document|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5993|Service Invoice Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5995|Service Cr.Memo Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|6661|Return Receipt Line|11762|Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Vendor Templates

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|11794|Vendor Template|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Item Charges Enhancements

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|313|Inventory Setup|31076|Check Item Charge Pst.Group|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31070|Use Ledger Entry Dimensions|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31071|Sales Only|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31072|Purchase Only|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31073|Disable Receipt Lines|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31074|Disable Transfer Receipt Lines|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31075|Disable Return Shipment Lines|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31076|Disable Sales Shipment Lines|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31077|Disable Return Receipt Lines|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5800|Item Charge|31078|Assignment on Receive/Shipment|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### No. Series Enhancements

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|308|No. Series|11790|Mask|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|308|No. Series|11791|No. Series Link Exists|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11730|Receiving Wh. No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11797|Shipping No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11798|Receiving No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11799|Shipping Wh. No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11799|No. Series Link|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Packaging Tax Calculation

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|31070|Package Material|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31071|Item Package Material|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Dimension for VAT Entry

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|254|VAT Entry|11771|Global Dimension 1 Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11772|Global Dimension 2 Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11773|Dimension Set ID|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Disable Cards Deleting

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11792|Delete Card with Entries|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Field for Full Description

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|15|G/L Account|11792|Full Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|18|Customer|11792|Registered Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|23|Vendor|11792|Registered Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|27|Item|11792|Full Description|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|260|Tariff Number|11792|Full Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|260|Tariff Number|11793|Full Name ENG|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5050|Contact|11792|Registered Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5079|Marketing Setup|11792|Inherit Registered Name|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5600|Fixed Asset|11792|Full Description|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5718|Nonstock Item|11792|Full Description|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Customer Template extension

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5105|Customer Template|11790|No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5105|Customer Template|11791|Language Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Indivisible Unit of Measure

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|204|Unit of Measure|31070|Indivisible Unit|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5404|Item Unit of Measure|31070|Indivisible Unit|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Check Balance in General Ledger Journal

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|80|Gen. Journal Template|11761|Not Check Correction|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

A number of fields are also deleted in the CZ version. For more information, see [Deprecated Features in the CZ Version](deprecated-features-cz.md).

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

## Local fields moved to standard product by Microsoft in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

A number of fields have been moved from the local application to the base application.

### Czech Republic

#### Statutory Company Information

Will be specified later.

#### General Entry Description

|Table ID|Table Name|Old Field ID|Old Field Name|New Table ID|New Table Name|New Field ID|New Field Name|
|----|----|----|----|----|----|----|----|
|311|Sales & Receivables Setup|11760|G/L Entry as Doc. Lines (Acc.)|311|Sales & Receivables Setup|210|Copy Line Descr. to G/L Entry|
|311|Sales & Receivables Setup|11761|G/L Entry as Doc. Lines (Item)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11762|G/L Entry as Doc. Lines (FA)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11763|G/L Entry as Doc. Lines (Res.)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|311|Sales & Receivables Setup|11764|G/L Entry as Doc. Lines (Char)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|312|Purchases & Payables Setup|11760|G/L Entry as Doc. Lines (Acc.)|312|Purchases & Payables Setup|210|Copy Line Descr. to G/L Entry|
|312|Purchases & Payables Setup|11761|G/L Entry as Doc. Lines (Item)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|312|Purchases & Payables Setup|11762|G/L Entry as Doc. Lines (FA)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|312|Purchases & Payables Setup|11763|G/L Entry as Doc. Lines (Res.)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|312|Purchases & Payables Setup|11764|G/L Entry as Doc. Lines (Char)|N/A||N/A|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

#### Multiple Interest Rates

Will be specified later.

#### Certificate Management

|Table ID|Table Name|Old Field ID|Old Field Name|New Table ID|New Table Name|New Field ID|New Field Name|
|----|----|----|----|----|----|----|----|
|31131|Certificate CZ|All|All Fields|1262|Isolated Certificate|All|All Fields|

## Fields moved to an extension by Microsoft in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

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
