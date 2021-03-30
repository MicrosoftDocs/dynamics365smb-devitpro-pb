---
author: edupont04

ms.service: dynamics365-business-central
ms.topic: include
ms.date: 04/01/2021
ms.author: edupont
---
The following fields are marked as ObsoleteState:Pending in the CZ version.

Different types of disposal and maintenance:

|Table ID|Table Name|Field ID|Field Name|Comments|
|--------|--------|--------|--------|--------|
|5603|FA Setup|31043|FA Maintenance By Maint. Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5603|FA Setup|31045|FA Disposal By Reason Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5606|FA Posting Group|31042|Use Standard Disposal|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Posting Description:

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

General Journal Reconciliation:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|269|G/L Account Net Change|11760|Type|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Industry Classification:

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

VAT Rounding Improvements:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11765|Round VAT Coeff.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|98|General Ledger Setup|11766|VAT Coeff. Rounding Precision|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Postponing VAT on Sales Credit Memo:

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

Non-deductible VAT:

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

VAT Registration in Other Countries:

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

VAT Identifier:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11771|Check VAT Identifier|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11767|VAT Identifier|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11768|VAT Identifier Translate|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Reverse Charge Statement:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|31065|Stat. Reporting Setup|31090|Reverse Charge Nos.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31065|Stat. Reporting Setup|31095|Reverse Charge Auth. Emp. No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31065|Stat. Reporting Setup|31096|Rvrs. Chrg. Filled by Emp. No.|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31093|Reverse Charge Header|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31094|Reverse Charge Line|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Fixed Assets Classification - SKP codes:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5600|Fixed Asset|31044|SKP Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31043|SKP Code|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Fixed Assets – Depreciation FA Appreciation From:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5612|FA Depreciation Book|31040|Depr. FA Appreciation From|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Fixed Assets – item consumption for maintenance:

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

Tax corrective documents for VAT:

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

Vendor Templates:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|11794|Vendor Template|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Item Charges Enhancements:

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

No. Series Enhancements:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|308|No. Series|11790|Mask|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|308|No. Series|11791|No. Series Link Exists|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11730|Receiving Wh. No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11797|Shipping No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11798|Receiving No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5740|Transfer Header|11799|Shipping Wh. No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|11799|No. Series Link|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Packaging Tax Calculation:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|31070|Package Material|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|31071|Item Package Material|All|All Fields|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Dimension for VAT Entry:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|254|VAT Entry|11771|Global Dimension 1 Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11772|Global Dimension 2 Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|254|VAT Entry|11773|Dimension Set ID|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Disable Cards Deleting:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|98|General Ledger Setup|11792|Delete Card with Entries|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Field for Full Description:

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

Customer Template extension:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|5105|Customer Template|11790|No. Series|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5105|Customer Template|11791|Language Code|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Indivisible Unit of Measure:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|204|Unit of Measure|31070|Indivisible Unit|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
|5404|Item Unit of Measure|31070|Indivisible Unit|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|

Check Balance in General Ledger Journal:

|TableNo|TableName|No.|FieldName|ObsoleteReason|
|----|----|----|----|----|
|80|Gen. Journal Template|11761|Not Check Correction|Will be removed in a later release (marked as ObsoleteState:Removed in 01.2021).|
