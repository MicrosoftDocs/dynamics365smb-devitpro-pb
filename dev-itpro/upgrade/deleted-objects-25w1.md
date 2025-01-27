---
title: Deleted objects in the Base App and first-party apps
description: Describes the objects that have been deleted in the W1 and country versions in 2025 release wave 1.
author: altotovi
ms.author: altotovi
ms.date: 01/20/2025
ms.reviewer: bholtorf
ms.topic: conceptual
ms.custom: bap-template
---

# Deleted objects in 2025 release wave 1  

Microsoft is doing some housekeeping in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], and will introduce a significant change in April with 2025 release wave 1 (v26). The tables and fields in this article have been in the **Obsolete::Removed** state for more than one major release, and will be permanently deleted. This sweeping clean-up will affect the Base Application and all first-party apps. Over 150 tables have been removed to optimize and clean up the application code.

To ensure a smooth transition, Microsoft will adopt a clean-up cycle every fifth major release. This article describes what you need to know about these changes and how to prepare your applications.

The 2025 release wave 1 (v26) clean-up effort isn’t just about reducing database size, it’s part of a broader vision:

1. **Improved database performance**: Removing unused schema elements optimizes performance and reduces technical debt.  
2. **Unified Base Applications**: Multiple countries (such as, Sweden, Denmark, Czechia, India, and Iceland) and partner-localized regions will move towards a unified Base Application. The goal is to have all countries using the same codebase.  
3. **Streamlined codebase**: Cleaner code results in fewer errors and easier maintenance for developers.

> [!NOTE]
> 2025 release wave 1 (v26) introduces platform-level support for dropping tables and fields that have been in the **Obsolete::Removed** state for more than one major release. This ensures that the clean-up process is automated and consistent, and aligns with Microsoft's ongoing breaking changes process and optimization strategy.  

This article provides a list of all deleted objects across all W1 and country-based Base Apps and other first-party apps.

> [!NOTE]
> **File ID = 0** and **Field Name = *** means all fields in the table or table extension are deleted and the files are deleted from the repo.

## Deleted objects in Base Apps

This section lists the table and field objects that are deleted in the Base Apps.

### W1 Base App

To explore the list of deleted objects in the W1 Base Aapp, go to [Obsoletions for 25.0](/dynamics365/business-central/application/base-application/obsoletion/obsolete_by_25.0).

### AT Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	79	|	"Company Information"	|	11017	|	"Check Transport Method"	|
|	79	|	"Company Information"	|	11018	|	"Check Transaction Specific."	|
|	79	|	"Company Information"	|	11051	|	"Check for Partner VAT ID"	|
|	79	|	"Company Information"	|	11052	|	"Check for Country of Origin"	|

### APAC Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	81	|	"Gen. Journal Line"	|	28160	|	 "Entry Type"	|
|	17	|	"G/L Entry"	|	28160	|	"Entry Type"	|
|	230	|	"Source Code"	|	28160	|	Simulation	|

### BE Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	49	|	"Invoice Post. Buffer"	|	11302	|	 "Base Before Pmt. Disc. (Old)"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	11301	|	 "Base Before Pmt. Disc. (Old)"	|
|	290	|	"VAT Amount Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	254	|	"VAT Entry"	|	11309	|	 "Base Before Pmt. Disc. (Old)"	|
|	263	|	"Intrastat Jnl. Line"	|	11308	|	 "Partner ID"	|
|	11306	|	"Electronic Banking Setup"	|	21	|	 "IBS Version"	|
|	11306	|	"Electronic Banking Setup"	|	22	|	 "Notification E-mail address"	|
|	11306	|	"Electronic Banking Setup"	|	23	|	 Language	|
|	11306	|	"Electronic Banking Setup"	|	24	|	 "Upload Integration Mode"	|
|	11306	|	"Electronic Banking Setup"	|	25	|	 "Upload Path"	|
|	11306	|	"Electronic Banking Setup"	|	26	|	 "Download Integration Mode"	|
|	11306	|	"Electronic Banking Setup"	|	27	|	 "Download Path"	|
|	11306	|	"Electronic Banking Setup"	|	28	|	 "IBS Log Upload Nos."	|
|	11306	|	"Electronic Banking Setup"	|	29	|	 "IBS Log Download Nos."	|
|	11306	|	"Electronic Banking Setup"	|	30	|	 "IBS Request ID"	|
|	11306	|	"Electronic Banking Setup"	|	31	|	 "IBS Service Version"	|
|	11306	|	"Electronic Banking Setup"	|	40	|	 "Test Environment"	|
|	2000012	|	"IBS Account"	|	*	|	*	|
|	2000013	|	"IBS Account Conflict"	|	*	|	*	|
|	2000011	|	"IBS Contract"	|	*	|	*	|
|	2000010	|	"IBS Log"	|	*	|	*	|
|	125	|	"Purch. Cr. Memo Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	123	|	"Purch. Inv. Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	37	|	"Sales Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	115	|	"Sales Cr.Memo Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	113	|	"Sales Invoice Line"	|	11302	|	 "Pmt. Discount Amount (Old)"	|
|	81	|	"Gen. Journal Line"	|	11307	|	"Base Before Pmt. Disc. (Old)"	|
|	 271 	|	"Bank Account Ledger Entry"	|	11300	|	 "Journal Template Name"	|
|	 273 	|	"Bank Acc. Reconciliation"	|	11314	|	 "Journal Template Name"	|
|	 81 	|	"Gen. Journal Line"	|	11301	|	 "Original Pmt. Disc. Possible"	|
|	 81 	|	"Gen. Journal Line"	|	11306	|	 "Org. Pmt. Disc. Possible (LCY)"	|
|	 80 	|	"Gen. Journal Template"	|	11300	|	 "Allow Posting From"	|
|	 80 	|	"Gen. Journal Template"	|	11301	|	 "Allow Posting To"	|
|	 181 	|	"Posted Gen. Journal Line"	|	11301	|	 "Original Pmt. Disc. Possible"	|
|	 181 	|	"Posted Gen. Journal Line"	|	11306	|	 "Org. Pmt. Disc. Possible (LCY)"	|
|	 17 	|	"G/L Entry"	|	11300	|	 "Journal Template Name"	|
|	 45 	|	"G/L Register"	|	11300	|	 "Journal Template Name"	|
|	 98 	|	"General Ledger Setup"	|	11314	|	 "Payment Recon. Template Name"	|
|	 98 	|	"General Ledger Setup"	|	11318	|	 "Jnl. Templ. Name for Applying"	|
|	 98 	|	"General Ledger Setup"	|	11319	|	 "Jnl. Batch Name for Applying"	|
|	 382 	|	"CV Ledger Entry Buffer"	|	11306	|	 "Org. Pmt. Disc. Possible (LCY)"	|
|	 55 	|	"Invoice Posting Buffer"	|	11305	|	 "Journal Template Name"	|
|	 461 	|	"Prepayment Inv. Line Buffer"	|	11300	|	 "Original Pmt. Disc. Possible"	|
|	 254 	|	"VAT Entry"	|	11300	|	 "Journal Template Name"	|
|	 5222 	|	"Employee Ledger Entry"	|	11300	|	 "Journal Template Name"	|
|	 313 	|	"Inventory Setup"	|	11300	|	 "Jnl. Templ. Name Cost Posting"	|
|	 313 	|	"Inventory Setup"	|	11306	|	 "Jnl. Batch Name Cost Posting"	|
|	 38 	|	"Purchase Header"	|	11300	|	 "Journal Template Name"	|
|	 39 	|	"Purchase Line"	|	11306	|	 "Prepmt. Pmt. Disc. Amount"	|
|	 25 	|	"Vendor Ledger Entry"	|	11300	|	 "Journal Template Name"	|
|	 25 	|	"Vendor Ledger Entry"	|	11306	|	 "Org. Pmt. Disc. Possible (LCY)"	|
|	 312 	|	"Purchases & Payables Setup"	|	11310	|	 "Journal Templ. Purch. Invoice"	|
|	 312 	|	"Purchases & Payables Setup"	|	11311	|	 "Journal Templ. Purch. Cr. Memo"	|
|	 312 	|	"Purchases & Payables Setup"	|	11320	|	 "Jnl. Templ. Prep. P. Inv."	|
|	 312 	|	"Purchases & Payables Setup"	|	11321	|	 "Jnl. Templ. Prep. P. Cr. Memo"	|
|	 312 	|	"Purchases & Payables Setup"	|	11322	|	 "IC Jnl. Templ. Purch. Invoice"	|
|	 312 	|	"Purchases & Payables Setup"	|	11323	|	 "IC Jnl. Templ. Purch. Cr. Memo"	|
|	 36 	|	"Sales Header"	|	11300	|	 "Journal Template Name"	|
|	 37 	|	"Sales Line"	|	11303	|	 "Prepmt. Pmt. Disc. Amount"	|
|	 21 	|	"Cust. Ledger Entry"	|	11300	|	 "Journal Template Name"	|
|	 21 	|	"Cust. Ledger Entry"	|	11306	|	 "Org. Pmt. Disc. Possible (LCY)"	|
|	 311 	|	"Sales & Receivables Setup"	|	11310	|	 "Journal Templ. Sales Invoice"	|
|	 311 	|	"Sales & Receivables Setup"	|	11311	|	 "Journal Templ. Sales Cr. Memo"	|
|	 311 	|	"Sales & Receivables Setup"	|	11313	|	 "Insert Std. Cust. Sales Lines"	|
|	 311 	|	"Sales & Receivables Setup"	|	11314	|	 Quotes	|
|	 311 	|	"Sales & Receivables Setup"	|	11317	|	 Invoices	|
|	 311 	|	"Sales & Receivables Setup"	|	11319	|	 "Credit Memos"	|
|	 311 	|	"Sales & Receivables Setup"	|	11320	|	 "Jnl. Templ. Prep. S. Inv."	|
|	 311 	|	"Sales & Receivables Setup"	|	11321	|	 "Jnl. Templ. Prep. S. Cr. Memo"	|
|	 311 	|	"Sales & Receivables Setup"	|	11322	|	 "IC Jnl. Templ. Sales Invoice"	|
|	 311 	|	"Sales & Receivables Setup"	|	11323	|	 "IC Jnl. Templ. Sales Cr. Memo"	|
|	4	|	Currency	|	2000000	|	        "ISO Currency Code"	|

### CH Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	270	|	"Bank Account"	|	11500	|	 "Swiss QRBill IBAN"	|
|	289	|	"Payment Method"	|	11500	|	 "Swiss QRBill Layout"	|
|	289	|	"Payment Method"	|	11501	|	 "Swiss QRBill Bank Account No."	|
|	130	|	"Incoming Document"	|	11530	|	 "Swiss QRBill"	|
|	130	|	"Incoming Document"	|	11531	|	 "Swiss QRBill Vendor Address 1"	|
|	130	|	"Incoming Document"	|	11532	|	Swiss QRBill Vendor Address 2	|
|	130	|	"Incoming Document"	|	11533	|	Swiss QRBill Vendor Post Code	|
|	130	|	"Incoming Document"	|	11534	|	Swiss QRBill Vendor City	|
|	130	|	"Incoming Document"	|	11535	|	Swiss QRBill Vendor Country	|
|	130	|	"Incoming Document"	|	11536	|	Swiss QRBill Debitor Name	|
|	130	|	"Incoming Document"	|	11537	|	Swiss QRBill Debitor Address1	|
|	130	|	"Incoming Document"	|	11538	|	Swiss QRBill Debitor Address2	|
|	130	|	"Incoming Document"	|	11539	|	Swiss QRBill Debitor PostCode	|
|	130	|	"Incoming Document"	|	11540	|	Swiss QRBill Debitor City	|
|	130	|	"Incoming Document"	|	11541	|	Swiss QRBill Debitor Country	|
|	130	|	"Incoming Document"	|	11542	|	Swiss QRBill Reference Type	|
|	130	|	"Incoming Document"	|	11543	|	Swiss QRBill Reference No.	|
|	130	|	"Incoming Document"	|	11544	|	Swiss QRBill Unstr. Message	|
|	130	|	"Incoming Document"	|	11545	|	Swiss QRBill Bill Info	|
|	81	|	"Gen. Journal Line"	|	11510	|	 "Swiss QRBill"	|
|	79	|	"Company Information"	|	11017	|	 "Check Transport Method"	|
|	79	|	"Company Information"	|	11018	|	 "Check Transaction Specific."	|
|	79	|	"Company Information"	|	11051	|	 "Check for Partner VAT ID"	|
|	79	|	"Company Information"	|	11052	|	 "Check for Country of Origin"	|
|	79	|	"Company Information"	|	11502	|	 "Swiss QRBill IBAN"	|
|	11503	|	"Swiss QRBill Billing Detail"	|	*	|	*	|
|	11504	|	"Swiss QRBill Billing Info"	|	*	|	*	|
|	11502	|	"Swiss QRBill Buffer"	|	*	|	*	|
|	11505	|	"Swiss QRBill Layout"	|	*	|	*	|
|	11506	|	"Swiss QRBill Reports"	|	*	|	*	|
|	11507	|	"Swiss QRBill Setup"	|	*	|	*	|
|	115	|	"Sales Cr.Memo Line"	|	5005396	|	 "Order No. (Old)"	|
|	115	|	"Sales Cr.Memo Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	113	|	"Sales Invoice Line"	|	5005396	|	 "Order No. (Old)"	|
|	113	|	"Sales Invoice Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	311	|	"Sales & Receivables Setup"	|	11500	|	 "Block ship. when neg. invent."	|
|	311	|	"Sales & Receivables Setup"	|	5005130	|	 "Arch. Orders and Ret. Orders"	|
|	311	|	"Sales & Receivables Setup"	|	5005132	|	 "Archiving Sales Quote"	|
|	311	|	"Sales & Receivables Setup"	|	5005133	|	 "Archiving Blanket Sales Order"	|
|	311	|	"Sales & Receivables Setup"	|	5005134	|	 "Batch Archiving Sales Quote"	|
|	4	|	Currency	|	3010541	|	"ISO Currency Code"	|

### CZ Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	900	|	"Assembly Header"	|	11700	|	 "Gen. Bus. Posting Group"	|
|	901	|	"Assembly Line"	|	11700	|	 "Gen. Bus. Posting Group"	|
|	910	|	"Posted Assembly Header"	|	11700	|	 "Gen. Bus. Posting Group"	|
|	911	|	"Posted Assembly Line"	|	11700	|	 "Gen. Bus. Posting Group"	|
|	905	|	"Assembly Setup"	|	11700	|	 "Gen. Bus. Posting Group"	|
|	270	|	"Bank Account"	|	11700	|	 "Default Constant Symbol"	|
|	270	|	"Bank Account"	|	11701	|	 "Default Specific Symbol"	|
|	270	|	"Bank Account"	|	11703	|	 "Specific Symbol"	|
|	270	|	"Bank Account"	|	11703	|	 "Specific Symbol"	|
|	270	|	"Bank Account"	|	11705	|	 "Domestic Payment Order"	|
|	270	|	"Bank Account"	|	11706	|	 "Foreign Payment Order"	|
|	270	|	"Bank Account"	|	11707	|	 "Bank Pmt. Appl. Rule Code"	|
|	270	|	"Bank Account"	|	11708	|	 "Text-to-Account Mapping Code"	|
|	270	|	"Bank Account"	|	11710	|	 "Dimension from Apply Entry"	|
|	270	|	"Bank Account"	|	11711	|	 "Check Ext. No. by Current Year"	|
|	270	|	"Bank Account"	|	11712	|	 "Check Czech Format on Issue"	|
|	270	|	"Bank Account"	|	11713	|	 "Variable S. to Description"	|
|	270	|	"Bank Account"	|	11714	|	 "Variable S. to Variable S."	|
|	270	|	"Bank Account"	|	11715	|	 "Variable S. to Ext. Doc.No."	|
|	270	|	"Bank Account"	|	11716	|	 "Foreign Payment Orders"	|
|	270	|	"Bank Account"	|	11717	|	 "Post Per Line"	|
|	270	|	"Bank Account"	|	11718	|	 "Payment Partial Suggestion"	|
|	270	|	"Bank Account"	|	11720	|	 "Payment Order Line Description"	|
|	270	|	"Bank Account"	|	11721	|	 "Non Associated Payment Account"	|
|	270	|	"Bank Account"	|	11722	|	 "Base Calendar Code"	|
|	270	|	"Bank Account"	|	11723	|	 "Payment Jnl. Template Name"	|
|	270	|	"Bank Account"	|	11724	|	 "Payment Jnl. Batch Name"	|
|	270	|	"Bank Account"	|	11725	|	 "Payment Order Nos."	|
|	270	|	"Bank Account"	|	11726	|	 "Issued Payment Order Nos."	|
|	270	|	"Bank Account"	|	11727	|	 "Bank Statement Nos."	|
|	270	|	"Bank Account"	|	11728	|	 "Issued Bank Statement Nos."	|
|	270	|	"Bank Account"	|	11730	|	 "Max. Balance Checking"	|
|	270	|	"Bank Account"	|	11731	|	 "Min. Balance Checking"	|
|	270	|	"Bank Account"	|	11732	|	 "Allow VAT Difference"	|
|	270	|	"Bank Account"	|	11733	|	 "Payed To/By Checking"	|
|	270	|	"Bank Account"	|	11734	|	 "Reason Code"	|
|	270	|	"Bank Account"	|	11735	|	 "User ID"	|
|	270	|	"Bank Account"	|	11736	|	 "Amounts Including VAT"	|
|	270	|	"Bank Account"	|	11737	|	 "Confirm Inserting of Document"	|
|	270	|	"Bank Account"	|	11738	|	 "Debit Rounding Account"	|
|	270	|	"Bank Account"	|	11739	|	 "Credit Rounding Account"	|
|	270	|	"Bank Account"	|	11740	|	 "Rounding Method Code"	|
|	270	|	"Bank Account"	|	11741	|	 "Responsibility ID (Release)"	|
|	270	|	"Bank Account"	|	11742	|	 "Responsibility ID (Post)"	|
|	270	|	"Bank Account"	|	11743	|	 "Responsibility Center"	|
|	270	|	"Bank Account"	|	11760	|	 "Amount Rounding Precision"	|
|	270	|	"Bank Account"	|	11761	|	 "CashReg Document Copies"	|
|	270	|	"Bank Account"	|	11762	|	 "Direct Posting"	|
|	270	|	"Bank Account"	|	11763	|	 "Account Type"	|
|	270	|	"Bank Account"	|	11764	|	 "Max. Balance"	|
|	270	|	"Bank Account"	|	11765	|	 "Cash Document Receipt Nos."	|
|	270	|	"Bank Account"	|	11766	|	 "Cash Document Withdrawal Nos."	|
|	270	|	"Bank Account"	|	11767	|	 "Cash Receipt Limit"	|
|	270	|	"Bank Account"	|	11768	|	 "Cash Withdrawal Limit"	|
|	270	|	"Bank Account"	|	11769	|	 "Exclude from Exch. Rate Adj."	|
|	270	|	"Bank Account"	|	11770	|	 "Cashier No."	|
|	270	|	"Bank Account"	|	11779	|	 "Run Apply Automatically"	|
|	270	|	"Bank Account"	|	11780	|	 "Foreign Payment Export Format"	|
|	270	|	"Bank Account"	|	11781	|	 "Payment Import Format"	|
|	270	|	"Bank Account"	|	11782	|	 "Not Apply Cust. Ledger Entries"	|
|	270	|	"Bank Account"	|	11783	|	 "Not Apply Vend. Ledger Entries"	|
|	270	|	"Bank Account"	|	11784	|	 "Not Apply Sales Advances"	|
|	270	|	"Bank Account"	|	11785	|	 "Not Apply Purchase Advances"	|
|	270	|	"Bank Account"	|	11786	|	 "Not Apply Gen. Ledger Entries"	|
|	270	|	"Bank Account"	|	11787	|	 "Not Apl. Bank Acc.Ledg.Entries"	|
|	270	|	"Bank Account"	|	11788	|	 "Copy VAT Setup to Jnl. Line"	|
|	289	|	"Payment Method"	|	11730	|	 "Cash Desk Code"	|
|	289	|	"Payment Method"	|	11731	|	 "Cash Document Status"	|
|	271	|	"Bank Account Ledger Entry"	|	11730	|	 "Cash Document Type"	|
|	1226	|	"Payment Export Data"	|	11700	|	 "Specific Symbol"	|
|	1226	|	"Payment Export Data"	|	11701	|	 "Variable Symbol"	|
|	1226	|	"Payment Export Data"	|	11702	|	 "Constant Symbol"	|
|	1294	|	"Applied Payment Entry"	|	11700	|	 "Specific Symbol"	|
|	1294	|	"Applied Payment Entry"	|	11701	|	 "Variable Symbol"	|
|	1294	|	"Applied Payment Entry"	|	11702	|	 "Constant Symbol"	|
|	1294	|	"Applied Payment Entry"	|	11705	|	 "Currency Factor"	|
|	273	|	"Bank Acc. Reconciliation"	|	11706	|	 "Created From Iss. Bank Stat."	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11700	|	 "Specific Symbol"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11701	|	 "Variable Symbol"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11702	|	 "Constant Symbol"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11705	|	 "External Document No."	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11710	|	 "Currency Code"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11711	|	 "Currency Factor"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11715	|	 "Statement Amount (LCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11716	|	 "Debit Amount"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11717	|	 "Credit Amount"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11720	|	 "Document Type"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11725	|	 "Difference (LCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11726	|	 "Applied Amount (LCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11727	|	 "Applied Amount (BCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11728	|	 "Statement Amount (BCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11729	|	 "Difference (BCY)"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11730	|	 IBAN	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11731	|	 "SWIFT Code"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	11740	|	 "Posting Group"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	31000	|	 "Advance Letter Link Code"	|
|	274	|	"Bank Acc. Reconciliation Line"	|	31010	|	 Prepayment	|
|	1252	|	"Bank Pmt. Appl. Rule"	|	11705	|	 "Variable Symbol Matched"	|
|	1252	|	"Bank Pmt. Appl. Rule"	|	11706	|	 "Specific Symbol Matched"	|
|	1252	|	"Bank Pmt. Appl. Rule"	|	11707	|	 "Constant Symbol Matched"	|
|	1252	|	"Bank Pmt. Appl. Rule"	|	11710	|	 "Bank Transaction Type"	|
|	1250	|	 "Bank Statement Matching Buffer"	|	11700	|	 "No. of Match to Doc. No."	|
|	1250	|	 "Bank Statement Matching Buffer"	|	11701	|	 "No. of Match to V. Symbol"	|
|	1250	|	 "Bank Statement Matching Buffer"	|	11702	|	 "No. of Match to S. Symbol"	|
|	1250	|	 "Bank Statement Matching Buffer"	|	11703	|	 "No. of Match to C. Symbol"	|
|	1249	|	"Bank Stmt Multiple Match Line"	|	11700	|	 "Specific Symbol"	|
|	1249	|	"Bank Stmt Multiple Match Line"	|	11701	|	 "Variable Symbol"	|
|	1249	|	"Bank Stmt Multiple Match Line"	|	11702	|	 "Constant Symbol"	|
|	1249	|	"Bank Stmt Multiple Match Line"	|	30000	|	 "Letter Type"	|
|	1249	|	"Bank Stmt Multiple Match Line"	|	31001	|	 "Letter No."	|
|	1248	|	"Ledger Entry Matching Buffer"	|	11700	|	 "Specific Symbol"	|
|	1248	|	"Ledger Entry Matching Buffer"	|	11701	|	 "Variable Symbol"	|
|	1248	|	"Ledger Entry Matching Buffer"	|	11702	|	 "Constant Symbol"	|
|	1293	|	"Payment Application Proposal"	|	11700	|	 "Specific Symbol"	|
|	1293	|	"Payment Application Proposal"	|	11701	|	 "Variable Symbol"	|
|	1293	|	"Payment Application Proposal"	|	11702	|	 "Constant Symbol"	|
|	1293	|	"Payment Application Proposal"	|	11711	|	 "Currency Factor"	|
|	1296	|	"Posted Payment Recon. Line"	|	11700	|	 "Specific Symbol"	|
|	1296	|	"Posted Payment Recon. Line"	|	11701	|	 "Variable Symbol"	|
|	1296	|	"Posted Payment Recon. Line"	|	11702	|	 "Constant Symbol"	|
|	1296	|	"Posted Payment Recon. Line"	|	11705	|	 "External Document No."	|
|	1296	|	"Posted Payment Recon. Line"	|	11710	|	 "Currency Code"	|
|	1296	|	"Posted Payment Recon. Line"	|	11711	|	 "Currency Factor"	|
|	1296	|	"Posted Payment Recon. Line"	|	11715	|	 "Statement Amount (LCY)"	|
|	1296	|	"Posted Payment Recon. Line"	|	11716	|	 "Debit Amount"	|
|	1296	|	"Posted Payment Recon. Line"	|	11717	|	 "Credit Amount"	|
|	1296	|	"Posted Payment Recon. Line"	|	11720	|	 "Document Type"	|
|	1296	|	"Posted Payment Recon. Line"	|	11725	|	 "Difference (LCY)"	|
|	1296	|	"Posted Payment Recon. Line"	|	11726	|	 "Applied Amount (LCY)"	|
|	1251	|	"Text-to-Account Mapping"	|	11701	|	 Description	|
|	1251	|	"Text-to-Account Mapping"	|	11705	|	 Priority	|
|	1251	|	"Text-to-Account Mapping"	|	11710	|	 "Variable Symbol"	|
|	1251	|	"Text-to-Account Mapping"	|	11711	|	 "Specific Symbol"	|
|	1251	|	"Text-to-Account Mapping"	|	11712	|	 "Constant Symbol"	|
|	1251	|	"Text-to-Account Mapping"	|	11715	|	 "Bank Account No."	|
|	1251	|	"Text-to-Account Mapping"	|	11716	|	 IBAN	|
|	1251	|	"Text-to-Account Mapping"	|	11717	|	 "SWIFT Code"	|
|	1251	|	"Text-to-Account Mapping"	|	11720	|	 "Bank Transaction Type"	|
|	1200	|	"Bank Export/Import Setup"	|	11700	|	 "Processing Report ID"	|
|	1200	|	"Bank Export/Import Setup"	|	11705	|	 "Default Folder Path"	|
|	1200	|	"Bank Export/Import Setup"	|	11706	|	 "Default File Type"	|
|	930	|	"Cash Flow Availability Buffer"	|	11700	|	 "Sales Advances"	|
|	930	|	"Cash Flow Availability Buffer"	|	11701	|	 "Purchase Advances"	|
|	843	|	"Cash Flow Setup"	|	31000	|	 "S. Adv. Letter CF Account No."	|
|	843	|	"Cash Flow Setup"	|	31001	|	 "P. Adv. Letter CF Account No."	|
|	5050	|	Contact	|	11792	|	 "Inherit Registered Name"	|
|	331	|	"Adjust Exchange Rate Buffer"	|	11761	|	 "Document Type"	|
|	331	|	"Adjust Exchange Rate Buffer"	|	11762	|	 "Document No."	|
|	331	|	"Adjust Exchange Rate Buffer"	|	11763	|	 "Entry No."	|
|	4	|	Currency	|	11760	|	 "Customs Currency Code"	|
|	352	|	"Default Dimension"	|	11790	|	 "Automatic Create"	|
|	352	|	"Default Dimension"	|	11791	|	 "Dimension Description Field ID"	|
|	352	|	"Default Dimension"	|	11792	|	 "Dim. Description Field Name"	|
|	352	|	"Default Dimension"	|	11793	|	 "Dimension Description Update"	|
|	352	|	"Default Dimension"	|	11794	|	 "Dimension Description Format"	|
|	352	|	"Default Dimension"	|	11795	|	 "Automatic Cr. Value Posting"	|
|	85	|	"Acc. Schedule Line"	|	31080	|	 Calc	|
|	85	|	"Acc. Schedule Line"	|	31081	|	 "Row Correction"	|
|	85	|	"Acc. Schedule Line"	|	31082	|	 "Assets/Liabilities Type"	|
|	85	|	"Acc. Schedule Line"	|	31083	|	 "Source Table"	|
|	84	|	"Acc. Schedule Name"	|	31080	|	 "Acc. Schedule Type"	|
|	15	|	"G/L Account"	|	11760	|	 "G/L Account Group"	|
|	15	|	"G/L Account"	|	11792	|	 "Full Name"	|
|	81	|	"Gen. Journal Line"	|	11700	|	 "Bank Account Code"	|
|	81	|	"Gen. Journal Line"	|	11701	|	 "Bank Account No."	|
|	81	|	"Gen. Journal Line"	|	11703	|	 "Specific Symbol"	|
|	81	|	"Gen. Journal Line"	|	11704	|	 "Variable Symbol"	|
|	81	|	"Gen. Journal Line"	|	11705	|	 "Constant Symbol"	|
|	81	|	"Gen. Journal Line"	|	11706	|	 "Transit No."	|
|	81	|	"Gen. Journal Line"	|	11707	|	 IBAN	|
|	81	|	"Gen. Journal Line"	|	11708	|	 "SWIFT Code"	|
|	81	|	"Gen. Journal Line"	|	11760	|	 "VAT Date"	|
|	81	|	"Gen. Journal Line"	|	11761	|	 Compensation	|
|	81	|	"Gen. Journal Line"	|	11763	|	 "Postponed VAT"	|
|	81	|	"Gen. Journal Line"	|	11764	|	 "VAT Delay"	|
|	81	|	"Gen. Journal Line"	|	11765	|	 "VAT % (Non Deductible)"	|
|	81	|	"Gen. Journal Line"	|	11766	|	 "VAT Base (Non Deductible)"	|
|	81	|	"Gen. Journal Line"	|	11767	|	 "VAT Amount (Non Deductible)"	|
|	81	|	"Gen. Journal Line"	|	11768	|	 "Currency Factor VAT"	|
|	81	|	"Gen. Journal Line"	|	11769	|	 "Currency Code VAT"	|
|	81	|	"Gen. Journal Line"	|	11770	|	 "Primary VAT Entry No."	|
|	81	|	"Gen. Journal Line"	|	11772	|	 "VAT Base LCY (Non Deduct.)"	|
|	81	|	"Gen. Journal Line"	|	11773	|	 "VAT Amount LCY (Non Deduct.)"	|
|	81	|	"Gen. Journal Line"	|	11774	|	 "VAT Difference (LCY)"	|
|	81	|	"Gen. Journal Line"	|	11775	|	 "Bal. VAT Difference (LCY)"	|
|	81	|	"Gen. Journal Line"	|	11790	|	 "Registration No."	|
|	81	|	"Gen. Journal Line"	|	11791	|	 "Tax Registration No."	|
|	81	|	"Gen. Journal Line"	|	31000	|	 "Prepayment Type"	|
|	81	|	"Gen. Journal Line"	|	31001	|	 "Advance Letter Link Code"	|
|	81	|	"Gen. Journal Line"	|	31003	|	 "Advance Letter No."	|
|	81	|	"Gen. Journal Line"	|	31004	|	 "Advance Letter Line No."	|
|	81	|	"Gen. Journal Line"	|	31005	|	 "Prepmt. Appl. Transaction No."	|
|	81	|	"Gen. Journal Line"	|	31006	|	 "Advance Exch. Rate Difference"	|
|	81	|	"Gen. Journal Line"	|	31007	|	 "Advance VAT Base Amount"	|
|	81	|	"Gen. Journal Line"	|	31060	|	 "Perform. Country/Region Code"	|
|	81	|	"Gen. Journal Line"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	81	|	"Gen. Journal Line"	|	31070	|	 "Item Ledger Entry No."	|
|	81	|	"Gen. Journal Line"	|	31100	|	 "Original Document VAT Date"	|
|	81	|	"Gen. Journal Line"	|	31101	|	 "Original Document Partner Type"	|
|	81	|	"Gen. Journal Line"	|	31102	|	 "Original Document Partner No."	|
|	80	|	"Gen. Journal Template"	|	11760	|	 "Not Check Doc. Type"	|
|	80	|	"Gen. Journal Template"	|	11761	|	 "Not Check Correction"	|
|	269	|	"G/L Account Net Change"	|	11760	|	 Type	|
|	181	|	"Posted Gen. Journal Line"	|	11700	|	 "Bank Account Code"	|
|	181	|	"Posted Gen. Journal Line"	|	11701	|	 "Bank Account No."	|
|	181	|	"Posted Gen. Journal Line"	|	11703	|	 "Specific Symbol"	|
|	181	|	"Posted Gen. Journal Line"	|	11704	|	 "Variable Symbol"	|
|	181	|	"Posted Gen. Journal Line"	|	11705	|	 "Constant Symbol"	|
|	181	|	"Posted Gen. Journal Line"	|	11706	|	 "Transit No."	|
|	181	|	"Posted Gen. Journal Line"	|	11707	|	 IBAN	|
|	181	|	"Posted Gen. Journal Line"	|	11708	|	 "SWIFT Code"	|
|	181	|	"Posted Gen. Journal Line"	|	11761	|	 Compensation	|
|	181	|	"Posted Gen. Journal Line"	|	11770	|	 "Primary VAT Entry No."	|
|	181	|	"Posted Gen. Journal Line"	|	11774	|	 "VAT Difference (LCY)"	|
|	181	|	"Posted Gen. Journal Line"	|	11775	|	 "Bal. VAT Difference (LCY)"	|
|	181	|	"Posted Gen. Journal Line"	|	31000	|	 "Prepayment Type"	|
|	181	|	"Posted Gen. Journal Line"	|	31001	|	 "Advance Letter Link Code"	|
|	181	|	"Posted Gen. Journal Line"	|	31003	|	 "Advance Letter No."	|
|	181	|	"Posted Gen. Journal Line"	|	31004	|	 "Advance Letter Line No."	|
|	181	|	"Posted Gen. Journal Line"	|	31005	|	 "Prepmt. Appl. Transaction No."	|
|	181	|	"Posted Gen. Journal Line"	|	31006	|	 "Advance Exch. Rate Difference"	|
|	181	|	"Posted Gen. Journal Line"	|	31007	|	 "Advance VAT Base Amount"	|
|	17	|	"G/L Entry"	|	11704	|	 "Variable Symbol"	|
|	17	|	"G/L Entry"	|	11760	|	 "VAT Date"	|
|	17	|	"G/L Entry"	|	11762	|	 "Closed at Date"	|
|	17	|	"G/L Entry"	|	11763	|	 "Applies-to ID"	|
|	17	|	"G/L Entry"	|	11764	|	 "Date Filter"	|
|	17	|	"G/L Entry"	|	11765	|	 "Amount to Apply"	|
|	17	|	"G/L Entry"	|	11766	|	 "Applying Entry"	|
|	17	|	"G/L Entry"	|	11767	|	 Closed	|
|	17	|	"G/L Entry"	|	11768	|	 "Applied Amount"	|
|	98	|	"General Ledger Setup"	|	11730	|	 "Cash Desk Nos."	|
|	98	|	"General Ledger Setup"	|	11731	|	 "Cash Payment Limit (LCY)"	|
|	98	|	"General Ledger Setup"	|	11760	|	 "Closed Period Entry Pos.Date"	|
|	98	|	"General Ledger Setup"	|	11761	|	 "Rounding Date"	|
|	98	|	"General Ledger Setup"	|	11762	|	 "Statement Templ. Name Coeff."	|
|	98	|	"General Ledger Setup"	|	11763	|	 "Statement Name Coeff."	|
|	98	|	"General Ledger Setup"	|	11764	|	 "Statement Line No. Coeff."	|
|	98	|	"General Ledger Setup"	|	11765	|	 "Round VAT Coeff."	|
|	98	|	"General Ledger Setup"	|	11766	|	 "VAT Coeff. Rounding Precision"	|
|	98	|	"General Ledger Setup"	|	11768	|	 "Allow VAT Posting From"	|
|	98	|	"General Ledger Setup"	|	11769	|	 "Allow VAT Posting To"	|
|	98	|	"General Ledger Setup"	|	11770	|	 "Use VAT Date"	|
|	98	|	"General Ledger Setup"	|	11771	|	 "Check VAT Identifier"	|
|	98	|	"General Ledger Setup"	|	11772	|	 "Check Posting Debit/Credit"	|
|	98	|	"General Ledger Setup"	|	11773	|	 "Mark Neg. Qty as Correction"	|
|	98	|	"General Ledger Setup"	|	11774	|	 "Company Officials Nos."	|
|	98	|	"General Ledger Setup"	|	11775	|	 "Correction As Storno"	|
|	98	|	"General Ledger Setup"	|	11776	|	 "Dont Check Dimension"	|
|	98	|	"General Ledger Setup"	|	11790	|	 "User Checks Allowed"	|
|	98	|	"General Ledger Setup"	|	11791	|	 "User ID Lookup only User Check"	|
|	98	|	"General Ledger Setup"	|	11792	|	 "Delete Card with Entries"	|
|	98	|	"General Ledger Setup"	|	11793	|	 "Reg. No. Validation URL"	|
|	98	|	"General Ledger Setup"	|	31000	|	 "Prepayment Type"	|
|	98	|	"General Ledger Setup"	|	31002	|	 "Use Adv. CM Nos for Adv. Corr."	|
|	98	|	"General Ledger Setup"	|	31080	|	 "Shared Account Schedule"	|
|	98	|	"General Ledger Setup"	|	31081	|	 "Acc. Schedule Results Nos."	|
|	252	|	"General Posting Setup"	|	11760	|	 "Invt. Rounding Adj. Account"	|
|	382	|	"CV Ledger Entry Buffer"	|	31000	|	 "Prepayment Type"	|
|	382	|	"CV Ledger Entry Buffer"	|	31002	|	 "Open For Advance Letter"	|
|	383	|	"Detailed CV Ledg. Entry Buffer"	|	31000	|	 Advance	|
|	49	|	"Invoice Post. Buffer"	|	11761	|	 Description	|
|	49	|	"Invoice Post. Buffer"	|	11763	|	 Correction	|
|	49	|	"Invoice Post. Buffer"	|	11764	|	 "VAT Difference (LCY)"	|
|	49	|	"Invoice Post. Buffer"	|	11765	|	 "VAT % (Non Deductible)"	|
|	49	|	"Invoice Post. Buffer"	|	11766	|	 "VAT Base (Non Deductible)"	|
|	49	|	"Invoice Post. Buffer"	|	11767	|	 "VAT Amount (Non Deductible)"	|
|	49	|	"Invoice Post. Buffer"	|	11770	|	 "Ext. Amount"	|
|	49	|	"Invoice Post. Buffer"	|	11771	|	 "Ext. Amount Including VAT"	|
|	49	|	"Invoice Post. Buffer"	|	11772	|	 "Ext. VAT Difference (LCY)"	|
|	49	|	"Invoice Post. Buffer"	|	31100	|	 "Original Document VAT Date"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31000	|	 "Entry No."	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31002	|	 "VAT Difference Inv. (LCY)"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31003	|	 "Amount (LCY)"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31004	|	 "VAT Amount (LCY)"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31005	|	 "VAT Base Amount (LCY)"	|
|	461	|	"Prepayment Inv. Line Buffer"	|	31006	|	 "Amount Incl. VAT (LCY)"	|
|	290	|	"VAT Amount Line"	|	11764	|	 "VAT Difference (LCY)"	|
|	290	|	"VAT Amount Line"	|	11765	|	 "VAT % (Non Deductible)"	|
|	290	|	"VAT Amount Line"	|	11766	|	 "VAT Base (Non Deductible)"	|
|	290	|	"VAT Amount Line"	|	11767	|	 "VAT Amount (Non Deductible)"	|
|	290	|	"VAT Amount Line"	|	11770	|	 "Ext. VAT Base (LCY)"	|
|	290	|	"VAT Amount Line"	|	11771	|	 "Ext. VAT Amount (LCY)"	|
|	290	|	"VAT Amount Line"	|	11772	|	 "Ext.Amount Including VAT (LCY)"	|
|	290	|	"VAT Amount Line"	|	11773	|	 "Ext. VAT Difference (LCY)"	|
|	290	|	"VAT Amount Line"	|	11774	|	 "Ext. Calc. VAT Amount (LCY)"	|
|	290	|	"VAT Amount Line"	|	11775	|	 "VAT Base (LCY)"	|
|	290	|	"VAT Amount Line"	|	11776	|	 "VAT Amount (LCY)"	|
|	290	|	"VAT Amount Line"	|	11777	|	 "Amount Including VAT (LCY)"	|
|	290	|	"VAT Amount Line"	|	11778	|	 "Calculated VAT Amount (LCY)"	|
|	290	|	"VAT Amount Line"	|	11780	|	 "Modified (LCY)"	|
|	290	|	"VAT Amount Line"	|	11781	|	 "Currency Code"	|
|	290	|	"VAT Amount Line"	|	31000	|	 "Letter VAT Amount (LCY)"	|
|	290	|	"VAT Amount Line"	|	31001	|	 "Letter VAT Difference (LCY)"	|
|	254	|	"VAT Entry"	|	11760	|	 "VAT Date"	|
|	254	|	"VAT Entry"	|	11763	|	 "Postponed VAT"	|
|	254	|	"VAT Entry"	|	11764	|	 "VAT Delay"	|
|	254	|	"VAT Entry"	|	11765	|	 "VAT % (Non Deductible)"	|
|	254	|	"VAT Entry"	|	11766	|	 "VAT Base (Non Deductible)"	|
|	254	|	"VAT Entry"	|	11767	|	 "VAT Amount (Non Deductible)"	|
|	254	|	"VAT Entry"	|	11768	|	 "VAT Settlement No."	|
|	254	|	"VAT Entry"	|	11770	|	 "Primary Entry No."	|
|	254	|	"VAT Entry"	|	11771	|	 "Global Dimension 1 Code"	|
|	254	|	"VAT Entry"	|	11772	|	 "Global Dimension 2 Code"	|
|	254	|	"VAT Entry"	|	11773	|	 "Dimension Set ID"	|
|	254	|	"VAT Entry"	|	11776	|	 "VAT Identifier"	|
|	254	|	"VAT Entry"	|	11780	|	 "Pmt.Disc. Tax Corr.Doc. No."	|
|	254	|	"VAT Entry"	|	11790	|	 "Registration No."	|
|	254	|	"VAT Entry"	|	31000	|	 "Prepayment Type"	|
|	254	|	"VAT Entry"	|	31001	|	 "Advance Base"	|
|	254	|	"VAT Entry"	|	31002	|	 "Advance Letter No."	|
|	254	|	"VAT Entry"	|	31003	|	 "Advance Letter Line No."	|
|	254	|	"VAT Entry"	|	31004	|	 "Advance Exch. Rate Difference"	|
|	254	|	"VAT Entry"	|	31060	|	 "Perform. Country/Region Code"	|
|	254	|	"VAT Entry"	|	31061	|	 "Currency Factor"	|
|	254	|	"VAT Entry"	|	31062	|	 "Currency Code"	|
|	254	|	"VAT Entry"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	254	|	"VAT Entry"	|	31101	|	 "Original Document VAT Date"	|
|	256	|	"VAT Statement Line"	|	11763	|	 "Attribute Code"	|
|	256	|	"VAT Statement Line"	|	11770	|	 "G/L Amount Type"	|
|	256	|	"VAT Statement Line"	|	11771	|	 "Gen. Bus. Posting Group"	|
|	256	|	"VAT Statement Line"	|	11772	|	 "Gen. Prod. Posting Group"	|
|	256	|	"VAT Statement Line"	|	11773	|	 "Use Row Date Filter"	|
|	256	|	"VAT Statement Line"	|	11774	|	 "Date Row Filter"	|
|	256	|	"VAT Statement Line"	|	11775	|	 Show	|
|	256	|	"VAT Statement Line"	|	31000	|	 "Prepayment Type"	|
|	256	|	"VAT Statement Line"	|	31060	|	 "EU-3 Party Trade"	|
|	256	|	"VAT Statement Line"	|	31061	|	 "EU 3-Party Intermediate Role"	|
|	256	|	"VAT Statement Line"	|	31100	|	 "VAT Control Rep. Section Code"	|
|	256	|	"VAT Statement Line"	|	31101	|	 "Ignore Simpl. Tax Doc. Limit"	|
|	255	|	"VAT Statement Template"	|	11760	|	 "XML Format"	|
|	255	|	"VAT Statement Template"	|	11761	|	 "Allow Comments/Attachments"	|
|	325	|	"VAT Posting Setup"	|	11760	|	 "Reverse Charge Check"	|
|	325	|	"VAT Posting Setup"	|	11761	|	 "Purchase VAT Delay Account"	|
|	325	|	"VAT Posting Setup"	|	11762	|	 "Sales VAT Delay Account"	|
|	325	|	"VAT Posting Setup"	|	11763	|	 "Non Deduct. VAT Corr. Account"	|
|	325	|	"VAT Posting Setup"	|	11764	|	 "Sales VAT Postponed Account"	|
|	325	|	"VAT Posting Setup"	|	11765	|	 "Allow Blank VAT Date"	|
|	325	|	"VAT Posting Setup"	|	11766	|	 "Allow Non Deductible VAT"	|
|	325	|	"VAT Posting Setup"	|	31000	|	 "Sales Ded. VAT Base Adj. Acc."	|
|	325	|	"VAT Posting Setup"	|	31001	|	 "Purch. Ded. VAT Base Adj. Acc."	|
|	325	|	"VAT Posting Setup"	|	31002	|	 "Sales Advance Offset VAT Acc."	|
|	325	|	"VAT Posting Setup"	|	31003	|	 "Purch. Advance Offset VAT Acc."	|
|	325	|	"VAT Posting Setup"	|	31004	|	 "Sales Advance VAT Account"	|
|	325	|	"VAT Posting Setup"	|	31005	|	 "Purch. Advance VAT Account"	|
|	325	|	"VAT Posting Setup"	|	31060	|	 "VIES Purchases"	|
|	325	|	"VAT Posting Setup"	|	31061	|	 "VIES Sales"	|
|	325	|	"VAT Posting Setup"	|	31070	|	 "Intrastat Service"	|
|	325	|	"VAT Posting Setup"	|	31100	|	 "VAT Rate"	|
|	325	|	"VAT Posting Setup"	|	31101	|	 "Supplies Mode Code"	|
|	325	|	"VAT Posting Setup"	|	31102	|	 "Insolvency Proceedings (p.44)"	|
|	325	|	"VAT Posting Setup"	|	31103	|	 "Ratio Coefficient"	|
|	325	|	"VAT Posting Setup"	|	31104	|	 "Corrections for Bad Receivable"	|
|	5611	|	"Depreciation Book"	|	31040	|	 "Deprication from 1st Month Day"	|
|	5611	|	"Depreciation Book"	|	31041	|	 "Acqui.,Appr.before Depr. Check"	|
|	5611	|	"Depreciation Book"	|	31042	|	 "All Acquil. in same Year"	|
|	5611	|	"Depreciation Book"	|	31043	|	 "Check Deprication on Disposal"	|
|	5611	|	"Depreciation Book"	|	31044	|	 "Deprication from 1st Year Day"	|
|	5611	|	"Depreciation Book"	|	31045	|	 "Mark Reclass. as Corrections"	|
|	5611	|	"Depreciation Book"	|	31050	|	 "Corresp. G/L Entries on Disp."	|
|	5611	|	"Depreciation Book"	|	31051	|	 "Corresp. FA Entries on Disp."	|
|	5612	|	"FA Depreciation Book"	|	31040	|	 "Depr. FA Appreciation From"	|
|	5612	|	"FA Depreciation Book"	|	31041	|	 "Depreciation Interupt"	|
|	5612	|	"FA Depreciation Book"	|	31042	|	 "Depreciation Interupt up to"	|
|	5612	|	"FA Depreciation Book"	|	31043	|	 "Depreciation Group Code"	|
|	5612	|	"FA Depreciation Book"	|	31045	|	 "Keep Depr. Ending Date"	|
|	5612	|	"FA Depreciation Book"	|	31046	|	 "Summarize Depr. Entries From"	|
|	5612	|	"FA Depreciation Book"	|	31047	|	 Prorated	|
|	5615	|	"FA Allocation"	|	11760	|	 "Reason/Maintenance Code"	|
|	5621	|	"FA Journal Line"	|	31040	|	 "Item Ledger Entry No."	|
|	5606	|	"FA Posting Group"	|	31040	|	 "Acq. Cost Bal. Acc. on Disp."	|
|	5606	|	"FA Posting Group"	|	31041	|	 "Book Value Bal. Acc. on Disp."	|
|	5606	|	"FA Posting Group"	|	31042	|	 "Use Standard Disposal"	|
|	5600	|	"Fixed Asset"	|	11792	|	 "Full Description"	|
|	5600	|	"Fixed Asset"	|	31042	|	 "Deprec. Book Code (Mainten.)"	|
|	5600	|	"Fixed Asset"	|	31043	|	 "Tax Depreciation Group Code"	|
|	5600	|	"Fixed Asset"	|	31044	|	 "SKP Code"	|
|	5600	|	"Fixed Asset"	|	31045	|	 "Clasification Code"	|
|	565	|	"Maintenance Ledger Entry"	|	31040	|	 "Item Ledger Entry No."	|
|	5603	|	"FA Setup"	|	31040	|	 "Tax Depr. Book"	|
|	5603	|	"FA Setup"	|	31042	|	 "Fixed Asset History"	|
|	5603	|	"FA Setup"	|	31043	|	 "FA Maintenance By Maint. Code"	|
|	5603	|	"FA Setup"	|	31044	|	 "FA Acquisition As Custom 2"	|
|	5603	|	"FA Setup"	|	31045	|	 "FA Disposal By Reason Code"	|
|	242	|	"Source Code Setup"	|	11760	|	 "Purchase VAT Delay"	|
|	242	|	"Source Code Setup"	|	11761	|	 "Sales VAT Delay"	|
|	242	|	"Source Code Setup"	|	11762	|	 "VAT Coefficient"	|
|	242	|	"Source Code Setup"	|	11764	|	 "Close Balance Sheet"	|
|	242	|	"Source Code Setup"	|	11765	|	 "Open Balance Sheet"	|
|	242	|	"Source Code Setup"	|	11766	|	 "Cash Desk"	|
|	242	|	"Source Code Setup"	|	31041	|	 "Maintenance Adjustment"	|
|	242	|	"Source Code Setup"	|	31050	|	 Credit	|
|	79	|	"Company Information"	|	11700	|	 "Bank Account Format Check"	|
|	79	|	"Company Information"	|	11730	|	 "Court Authority No."	|
|	79	|	"Company Information"	|	11731	|	 "Tax Authority No."	|
|	79	|	"Company Information"	|	11760	|	 "Default Bank Account Code"	|
|	79	|	"Company Information"	|	11761	|	 "Branch Name"	|
|	79	|	"Company Information"	|	11790	|	 "Primary Business Activity"	|
|	79	|	"Company Information"	|	11791	|	 "Tax Registration No."	|
|	79	|	"Company Information"	|	11792	|	 "Company Type"	|
|	79	|	"Company Information"	|	11793	|	 "Industry Code"	|
|	79	|	"Company Information"	|	11794	|	 "Equity Capital"	|
|	79	|	"Company Information"	|	11795	|	 "Registration Date"	|
|	79	|	"Company Information"	|	11796	|	 "Paid Equity Capital"	|
|	79	|	"Company Information"	|	11797	|	 "General Manager No."	|
|	79	|	"Company Information"	|	11798	|	 "Accounting Manager No."	|
|	79	|	"Company Information"	|	11799	|	 "Finance Manager No."	|
|	308	|	"No. Series"	|	11790	|	 Mask	|
|	10	|	"Shipment Method"	|	31060	|	 "Include Item Charges (Amount)"	|
|	10	|	"Shipment Method"	|	31061	|	 "Intrastat Delivery Group Code"	|
|	10	|	"Shipment Method"	|	31062	|	 "Incl. Item Charges (Stat.Val.)"	|
|	10	|	"Shipment Method"	|	31063	|	 "Adjustment %"	|
|	204	|	"Unit of Measure"	|	31060	|	 "Unspecified Intrastat"	|
|	204	|	"Unit of Measure"	|	31061	|	 "Tariff Number UOM Code"	|
|	204	|	"Unit of Measure"	|	31070	|	 "Indivisible Unit"	|
|	5223	|	"Detailed Employee Ledger Entry"	|	11768	|	 "Employee Posting Group"	|
|	5222	|	"Employee Ledger Entry"	|	11703	|	 "Specific Symbol"	|
|	5222	|	"Employee Ledger Entry"	|	11704	|	 "Variable Symbol"	|
|	5222	|	"Employee Ledger Entry"	|	11705	|	 "Constant Symbol"	|
|	31061	|	"Intrastat Currency Exch. Rate"	|	0	|	*	|
|	31064	|	"Intrastat Delivery Group"	|	0	|	*	|
|	5832	|	"Capacity Ledger Entry"	|	11790	|	 "User ID"	|
|	5876	|	"Phys. Invt. Order Line"	|	31077	|	 "Whse. Net Change Template"	|
|	262	|	"Intrastat Jnl. Batch"	|	31060	|	 "Perform. Country/Region Code"	|
|	262	|	"Intrastat Jnl. Batch"	|	31061	|	 "Declaration No."	|
|	262	|	"Intrastat Jnl. Batch"	|	31062	|	 "Statement Type"	|
|	263	|	"Intrastat Jnl. Line"	|	31061	|	 "Source Entry Date"	|
|	263	|	"Intrastat Jnl. Line"	|	31062	|	 "Statistic Indication"	|
|	263	|	"Intrastat Jnl. Line"	|	31063	|	 "Statistics Period"	|
|	263	|	"Intrastat Jnl. Line"	|	31065	|	 "Declaration No."	|
|	263	|	"Intrastat Jnl. Line"	|	31066	|	 "Statement Type"	|
|	263	|	"Intrastat Jnl. Line"	|	31067	|	 "Prev. Declaration No."	|
|	263	|	"Intrastat Jnl. Line"	|	31068	|	 "Prev. Declaration Line No."	|
|	263	|	"Intrastat Jnl. Line"	|	31069	|	 "Shipment Method Code"	|
|	263	|	"Intrastat Jnl. Line"	|	31070	|	 "Specific Movement"	|
|	263	|	"Intrastat Jnl. Line"	|	31071	|	 "Supplem. UoM Code"	|
|	263	|	"Intrastat Jnl. Line"	|	31072	|	 "Supplem. UoM Quantity"	|
|	263	|	"Intrastat Jnl. Line"	|	31073	|	 "Supplem. UoM Net Weight"	|
|	263	|	"Intrastat Jnl. Line"	|	31074	|	 "Base Unit of Measure"	|
|	261	|	"Intrastat Jnl. Template"	|	31060	|	 "Perform. Country/Region Code"	|
|	260	|	"Tariff Number"	|	11760	|	 "Statement Code"	|
|	260	|	"Tariff Number"	|	11761	|	 "VAT Stat. Unit of Measure Code"	|
|	260	|	"Tariff Number"	|	11762	|	 "Allow Empty Unit of Meas.Code"	|
|	260	|	"Tariff Number"	|	11763	|	 "Statement Limit Code"	|
|	260	|	"Tariff Number"	|	11792	|	 "Full Name"	|
|	260	|	"Tariff Number"	|	11793	|	 "Full Name ENG"	|
|	260	|	"Tariff Number"	|	31060	|	 "Supplem. Unit of Measure Code"	|
|	5718	|	"Nonstock Item"	|	11792	|	 "Full Description"	|
|	5719	|	"Nonstock Item Setup"	|	31070	|	 "No. From No. Series"	|
|	5813	|	"Inventory Posting Setup"	|	11760	|	 "Consumption Account"	|
|	5813	|	"Inventory Posting Setup"	|	11761	|	 "Change In Inv.Of WIP Acc."	|
|	5813	|	"Inventory Posting Setup"	|	11762	|	 "Change In Inv.Of Product Acc."	|
|	27	|	Item	|	11792	|	 "Full Description"	|
|	27	|	Item	|	31060	|	 "Statistic Indication"	|
|	27	|	Item	|	31061	|	 "Specific Movement"	|
|	5800	|	"Item Charge"	|	31060	|	 "Incl. in Intrastat Amount"	|
|	5800	|	"Item Charge"	|	31061	|	 "Incl. in Intrastat Stat. Value"	|
|	5800	|	"Item Charge"	|	31070	|	 "Use Ledger Entry Dimensions"	|
|	5800	|	"Item Charge"	|	31071	|	 "Sales Only"	|
|	5800	|	"Item Charge"	|	31072	|	 "Purchase Only"	|
|	5800	|	"Item Charge"	|	31073	|	 "Disable Receipt Lines"	|
|	5800	|	"Item Charge"	|	31074	|	 "Disable Transfer Receipt Lines"	|
|	5800	|	"Item Charge"	|	31075	|	 "Disable Return Schipment Lines"	|
|	5800	|	"Item Charge"	|	31076	|	 "Disable Sales Schipment Lines"	|
|	5800	|	"Item Charge"	|	31077	|	 "Disable Return Receipt Lines"	|
|	5800	|	"Item Charge"	|	31078	|	 "Assigment on Receive/Shipment"	|
|	5404	|	"Item Unit of Measure"	|	31060	|	 "Intrastat Default"	|
|	5404	|	"Item Unit of Measure"	|	31070	|	 "Indivisible Unit"	|
|	83	|	"Item Journal Line"	|	11763	|	 "G/L Correction"	|
|	83	|	"Item Journal Line"	|	11790	|	 "Source No. 2"	|
|	83	|	"Item Journal Line"	|	11791	|	 "Source No. 3"	|
|	83	|	"Item Journal Line"	|	31043	|	 "FA No."	|
|	83	|	"Item Journal Line"	|	31044	|	 "Maintenance Code"	|
|	83	|	"Item Journal Line"	|	31060	|	 "Perform. Country/Region Code"	|
|	83	|	"Item Journal Line"	|	31061	|	 "Tariff No."	|
|	83	|	"Item Journal Line"	|	31063	|	 "Physical Transfer"	|
|	83	|	"Item Journal Line"	|	31065	|	 "Shipment Method Code"	|
|	83	|	"Item Journal Line"	|	31066	|	 "Net Weight"	|
|	83	|	"Item Journal Line"	|	31069	|	 "Incl. in Intrastat Stat. Value"	|
|	83	|	"Item Journal Line"	|	31070	|	 "Incl. in Intrastat Amount"	|
|	83	|	"Item Journal Line"	|	31071	|	 "Country/Region of Origin Code"	|
|	83	|	"Item Journal Line"	|	31072	|	 "Statistic Indication"	|
|	83	|	"Item Journal Line"	|	31074	|	 "Currency Code"	|
|	83	|	"Item Journal Line"	|	31075	|	 "Currency Factor"	|
|	83	|	"Item Journal Line"	|	31076	|	 "Intrastat Transaction"	|
|	83	|	"Item Journal Line"	|	31077	|	 "Whse. Net Change Template"	|
|	753	|	"Standard Item Journal Line"	|	31077	|	 "Whse. Net Change Template"	|
|	32	|	"Item Ledger Entry"	|	11790	|	 "Source No. 2"	|
|	32	|	"Item Ledger Entry"	|	11791	|	 "Source No. 3"	|
|	32	|	"Item Ledger Entry"	|	11793	|	 "Source Code"	|
|	32	|	"Item Ledger Entry"	|	11794	|	 "Reason Code"	|
|	32	|	"Item Ledger Entry"	|	11795	|	 "User ID"	|
|	32	|	"Item Ledger Entry"	|	31043	|	 "FA No."	|
|	32	|	"Item Ledger Entry"	|	31044	|	 "Maintenance Code"	|
|	32	|	"Item Ledger Entry"	|	31060	|	 "Perform. Country/Region Code"	|
|	32	|	"Item Ledger Entry"	|	31061	|	 "Tariff No."	|
|	32	|	"Item Ledger Entry"	|	31062	|	 "Statistic Indication"	|
|	32	|	"Item Ledger Entry"	|	31063	|	 "Physical Transfer"	|
|	32	|	"Item Ledger Entry"	|	31065	|	 "Shipment Method Code"	|
|	32	|	"Item Ledger Entry"	|	31066	|	 "Net Weight"	|
|	32	|	"Item Ledger Entry"	|	31068	|	 "Country/Region of Origin Code"	|
|	32	|	"Item Ledger Entry"	|	31074	|	 "Currency Code"	|
|	32	|	"Item Ledger Entry"	|	31075	|	 "Currency Factor"	|
|	32	|	"Item Ledger Entry"	|	31076	|	 "Intrastat Transaction"	|
|	5802	|	"Value Entry"	|	11763	|	 "G/L Correction"	|
|	5802	|	"Value Entry"	|	11790	|	 "Source No. 2"	|
|	5802	|	"Value Entry"	|	11791	|	 "Source No. 3"	|
|	5802	|	"Value Entry"	|	31060	|	 "Currency Code"	|
|	5802	|	"Value Entry"	|	31061	|	 "Currency Factor"	|
|	5802	|	"Value Entry"	|	31062	|	 "Incl. in Intrastat Amount"	|
|	5802	|	"Value Entry"	|	31063	|	 "Incl. in Intrastat Stat. Value"	|
|	5714	|	"Responsibility Center"	|	11700	|	 "Bank Account Code"	|
|	5714	|	"Responsibility Center"	|	11701	|	 "Bank Account No."	|
|	5714	|	"Responsibility Center"	|	11702	|	 "Bank Branch No."	|
|	5714	|	"Responsibility Center"	|	11706	|	 "Transit No."	|
|	5714	|	"Responsibility Center"	|	11707	|	 IBAN	|
|	5714	|	"Responsibility Center"	|	11708	|	 "SWIFT Code"	|
|	5714	|	"Responsibility Center"	|	11709	|	 "Bank Name"	|
|	5700	|	"Stockkeeping Unit"	|	31070	|	 "Gen. Prod. Posting Group"	|
|	5846	|	"Inventory Report Entry"	|	11760	|	 "Inv. Rounding Adj."	|
|	5846	|	"Inventory Report Entry"	|	11761	|	 Consumption	|
|	5846	|	"Inventory Report Entry"	|	11762	|	 "Change In Inv.Of WIP"	|
|	5846	|	"Inventory Report Entry"	|	11763	|	 "Change In Inv.Of Product"	|
|	313	|	"Inventory Setup"	|	11765	|	 "Posting Desc. Code"	|
|	313	|	"Inventory Setup"	|	31042	|	 "Automatic Maintenance Posting"	|
|	313	|	"Inventory Setup"	|	31071	|	 "Use GPPG from SKU"	|
|	313	|	"Inventory Setup"	|	31072	|	 "Date Order Inventory Change"	|
|	313	|	"Inventory Setup"	|	31073	|	 "Def.Template for Phys.Pos.Adj"	|
|	313	|	"Inventory Setup"	|	31074	|	 "Def.Template for Phys.Neg.Adj"	|
|	313	|	"Inventory Setup"	|	31075	|	 "Skip Update SKU on Posting"	|
|	313	|	"Inventory Setup"	|	31076	|	 "Check Item Charge Pst.Group"	|
|	313	|	"Inventory Setup"	|	31077	|	 "Exact Cost Reversing Mandatory"	|
|	313	|	"Inventory Setup"	|	31078	|	 "Post Neg. Transfers as Corr."	|
|	313	|	"Inventory Setup"	|	31079	|	 "Post Exp. Cost Conv. as Corr."	|
|	5740	|	"Transfer Header"	|	11730	|	 "Receiving Wh. No. Series"	|
|	5740	|	"Transfer Header"	|	11797	|	 "Shipping No. Series"	|
|	5740	|	"Transfer Header"	|	11798	|	 "Receiving No. Series"	|
|	5740	|	"Transfer Header"	|	11799	|	 "Shipping Wh. No. Series"	|
|	5740	|	"Transfer Header"	|	31064	|	 "Intrastat Exclude"	|
|	5740	|	"Transfer Header"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5740	|	"Transfer Header"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5741	|	"Transfer Line"	|	31061	|	 "Tariff No."	|
|	5741	|	"Transfer Line"	|	31062	|	 "Statistic Indication"	|
|	5741	|	"Transfer Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	5741	|	"Transfer Line"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5741	|	"Transfer Line"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5746	|	"Transfer Receipt Header"	|	31064	|	 "Intrastat Exclude"	|
|	5746	|	"Transfer Receipt Header"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5746	|	"Transfer Receipt Header"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5747	|	"Transfer Receipt Line"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5747	|	"Transfer Receipt Line"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5742	|	"Transfer Route"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5742	|	"Transfer Route"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5744	|	"Transfer Shipment Header"	|	31064	|	 "Intrastat Exclude"	|
|	5744	|	"Transfer Shipment Header"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5744	|	"Transfer Shipment Header"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	5745	|	"Transfer Shipment Line"	|	31070	|	 "Gen. Bus. Post. Group Ship"	|
|	5745	|	"Transfer Shipment Line"	|	31071	|	 "Gen. Bus. Post. Group Receive"	|
|	99000765	|	"Manufacturing Setup"	|	31070	|	 "Default Gen.Bus. Posting Group"	|
|	99000765	|	"Manufacturing Setup"	|	31071	|	 "Exact Cost Rev.Manda. (Cons.)"	|
|	210	|	"Job Journal Line"	|	11763	|	 Correction	|
|	210	|	"Job Journal Line"	|	31043	|	 "FA No."	|
|	210	|	"Job Journal Line"	|	31044	|	 "Maintenance Code"	|
|	210	|	"Job Journal Line"	|	31061	|	 "Tariff No."	|
|	210	|	"Job Journal Line"	|	31062	|	 "Statistic Indication"	|
|	210	|	"Job Journal Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	210	|	"Job Journal Line"	|	31064	|	 "Intrastat Transaction"	|
|	210	|	"Job Journal Line"	|	31065	|	 "Shipment Method Code"	|
|	210	|	"Job Journal Line"	|	31066	|	 "Net Weight"	|
|	210	|	"Job Journal Line"	|	31070	|	 "Whse. Net Change Template"	|
|	169	|	"Job Ledger Entry"	|	11763	|	 Correction	|
|	169	|	"Job Ledger Entry"	|	31061	|	 "Tariff No."	|
|	169	|	"Job Ledger Entry"	|	31062	|	 "Statistic Indication"	|
|	169	|	"Job Ledger Entry"	|	31063	|	 "Intrastat Transaction"	|
|	169	|	"Job Ledger Entry"	|	31064	|	 "Country/Region of Origin Code"	|
|	169	|	"Job Ledger Entry"	|	31065	|	 "Shipment Method Code"	|
|	169	|	"Job Ledger Entry"	|	31066	|	 "Net Weight"	|
|	156	|	Resource	|	31061	|	 "Tariff No."	|
|	5109	|	"Purchase Header Archive"	|	11700	|	 "Bank Account Code"	|
|	5109	|	"Purchase Header Archive"	|	11701	|	 "Bank Account No."	|
|	5109	|	"Purchase Header Archive"	|	11703	|	 "Specific Symbol"	|
|	5109	|	"Purchase Header Archive"	|	11704	|	 "Variable Symbol"	|
|	5109	|	"Purchase Header Archive"	|	11705	|	 "Constant Symbol"	|
|	5109	|	"Purchase Header Archive"	|	11706	|	 "Transit No."	|
|	5109	|	"Purchase Header Archive"	|	11707	|	 IBAN	|
|	5109	|	"Purchase Header Archive"	|	11708	|	 "SWIFT Code"	|
|	5109	|	"Purchase Header Archive"	|	11760	|	 "VAT Date"	|
|	5109	|	"Purchase Header Archive"	|	11761	|	 "VAT Currency Factor"	|
|	5109	|	"Purchase Header Archive"	|	11765	|	 "Posting Desc. Code"	|
|	5109	|	"Purchase Header Archive"	|	11790	|	 "Registration No."	|
|	5109	|	"Purchase Header Archive"	|	11791	|	 "Tax Registration No."	|
|	5109	|	"Purchase Header Archive"	|	11793	|	 "Quote Validity"	|
|	5109	|	"Purchase Header Archive"	|	11797	|	 "Last Version"	|
|	5109	|	"Purchase Header Archive"	|	31060	|	 "Perform. Country/Region Code"	|
|	5109	|	"Purchase Header Archive"	|	31061	|	 "Curr. Factor Perf. Country/Reg"	|
|	5109	|	"Purchase Header Archive"	|	31063	|	 "Physical Transfer"	|
|	5109	|	"Purchase Header Archive"	|	31064	|	 "Intrastat Exclude"	|
|	5109	|	"Purchase Header Archive"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	5109	|	"Purchase Header Archive"	|	31067	|	 "EU 3-Party Trade"	|
|	5110	|	"Purchase Line Archive"	|	11780	|	 "External VAT Amount (LCY)"	|
|	5110	|	"Purchase Line Archive"	|	31060	|	 "Physical Transfer"	|
|	5805	|	"Item Charge Assignment (Purch)"	|	31060	|	 "Incl. in Intrastat Amount"	|
|	5805	|	"Item Charge Assignment (Purch)"	|	31061	|	 "Incl. in Intrastat Stat. Value"	|
|	38	|	"Purchase Header"	|	11700	|	 "Bank Account Code"	|
|	38	|	"Purchase Header"	|	11701	|	 "Bank Account No."	|
|	38	|	"Purchase Header"	|	11702	|	 "Bank Branch No."	|
|	38	|	"Purchase Header"	|	11703	|	 "Specific Symbol"	|
|	38	|	"Purchase Header"	|	11704	|	 "Variable Symbol"	|
|	38	|	"Purchase Header"	|	11705	|	 "Constant Symbol"	|
|	38	|	"Purchase Header"	|	11706	|	 "Transit No."	|
|	38	|	"Purchase Header"	|	11707	|	 IBAN	|
|	38	|	"Purchase Header"	|	11708	|	 "SWIFT Code"	|
|	38	|	"Purchase Header"	|	11709	|	 "Bank Name"	|
|	38	|	"Purchase Header"	|	11730	|	 "Cash Desk Code"	|
|	38	|	"Purchase Header"	|	11731	|	 "Cash Document Status"	|
|	38	|	"Purchase Header"	|	11760	|	 "VAT Date"	|
|	38	|	"Purchase Header"	|	11761	|	 "VAT Currency Factor"	|
|	38	|	"Purchase Header"	|	11765	|	 "Posting Desc. Code"	|
|	38	|	"Purchase Header"	|	11790	|	 "Registration No."	|
|	38	|	"Purchase Header"	|	11791	|	 "Tax Registration No."	|
|	38	|	"Purchase Header"	|	11792	|	 "Original User ID"	|
|	38	|	"Purchase Header"	|	11793	|	 "Quote Validity"	|
|	38	|	"Purchase Header"	|	31000	|	 "Prepayment Type"	|
|	38	|	"Purchase Header"	|	31001	|	 "Advance Letter No. Series"	|
|	38	|	"Purchase Header"	|	31002	|	 "Advance Letter No."	|
|	38	|	"Purchase Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	38	|	"Purchase Header"	|	31061	|	 "Perf. Country Currency Factor"	|
|	38	|	"Purchase Header"	|	31063	|	 "Physical Transfer"	|
|	38	|	"Purchase Header"	|	31064	|	 "Intrastat Exclude"	|
|	38	|	"Purchase Header"	|	31065	|	 "Industry Code"	|
|	38	|	"Purchase Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	38	|	"Purchase Header"	|	31067	|	 "EU 3-Party Trade"	|
|	38	|	"Purchase Header"	|	31100	|	 "Original Document VAT Date"	|
|	39	|	"Purchase Line"	|	11763	|	 "VAT Correction"	|
|	39	|	"Purchase Line"	|	11764	|	 "VAT Difference (LCY)"	|
|	39	|	"Purchase Line"	|	11765	|	 "VAT % (Non Deductible)"	|
|	39	|	"Purchase Line"	|	11766	|	 "VAT Base (Non Deductible)"	|
|	39	|	"Purchase Line"	|	11767	|	 "VAT Amount (Non Deductible)"	|
|	39	|	"Purchase Line"	|	11768	|	 Negative	|
|	39	|	"Purchase Line"	|	11770	|	 "Ext. Amount (LCY)"	|
|	39	|	"Purchase Line"	|	11771	|	 "Ext.Amount Including VAT (LCY)"	|
|	39	|	"Purchase Line"	|	11772	|	 "Ext. VAT Difference (LCY)"	|
|	39	|	"Purchase Line"	|	31001	|	 "Amt. Prep. To Inv. Incl. VAT"	|
|	39	|	"Purchase Line"	|	31006	|	 "Adjust Prepmt. Relation"	|
|	39	|	"Purchase Line"	|	31008	|	 "Prepmt. VAT Amount Inv."	|
|	39	|	"Purchase Line"	|	31060	|	 "Physical Transfer"	|
|	39	|	"Purchase Line"	|	31061	|	 "Tariff No."	|
|	39	|	"Purchase Line"	|	31062	|	 "Statistic Indication"	|
|	39	|	"Purchase Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	120	|	"Purch. Rcpt. Header"	|	11790	|	 "Registration No."	|
|	120	|	"Purch. Rcpt. Header"	|	11791	|	 "Tax Registration No."	|
|	120	|	"Purch. Rcpt. Header"	|	11792	|	 "Original User ID"	|
|	120	|	"Purch. Rcpt. Header"	|	11793	|	 "Quote Validity"	|
|	120	|	"Purch. Rcpt. Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	120	|	"Purch. Rcpt. Header"	|	31063	|	 "Physical Transfer"	|
|	120	|	"Purch. Rcpt. Header"	|	31064	|	 "Intrastat Exclude"	|
|	120	|	"Purch. Rcpt. Header"	|	31065	|	 "Industry Code"	|
|	120	|	"Purch. Rcpt. Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	120	|	"Purch. Rcpt. Header"	|	31067	|	 "EU 3-Party Trade"	|
|	121	|	"Purch. Rcpt. Line"	|	31061	|	 "Tariff No."	|
|	121	|	"Purch. Rcpt. Line"	|	31062	|	 "Statistic Indication"	|
|	121	|	"Purch. Rcpt. Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	6650	|	"Return Shipment Header"	|	11790	|	 "Registration No."	|
|	6650	|	"Return Shipment Header"	|	11791	|	 "Tax Registration No."	|
|	6650	|	"Return Shipment Header"	|	11792	|	 "Original User ID"	|
|	6650	|	"Return Shipment Header"	|	11793	|	 "Quote Validity"	|
|	6650	|	"Return Shipment Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	6650	|	"Return Shipment Header"	|	31063	|	 "Physical Transfer"	|
|	6650	|	"Return Shipment Header"	|	31064	|	 "Intrastat Exclude"	|
|	6650	|	"Return Shipment Header"	|	31065	|	 "Industry Code"	|
|	6650	|	"Return Shipment Header"	|	31067	|	 "EU 3-Party Trade"	|
|	380	|	"Detailed Vendor Ledg. Entry"	|	11768	|	 "Vendor Posting Group"	|
|	380	|	"Detailed Vendor Ledg. Entry"	|	31000	|	 Advance	|
|	25	|	"Vendor Ledger Entry"	|	11700	|	 "Bank Account Code"	|
|	25	|	"Vendor Ledger Entry"	|	11701	|	 "Bank Account No."	|
|	25	|	"Vendor Ledger Entry"	|	11703	|	 "Specific Symbol"	|
|	25	|	"Vendor Ledger Entry"	|	11704	|	 "Variable Symbol"	|
|	25	|	"Vendor Ledger Entry"	|	11705	|	 "Constant Symbol"	|
|	25	|	"Vendor Ledger Entry"	|	11706	|	 "Transit No."	|
|	25	|	"Vendor Ledger Entry"	|	11707	|	 IBAN	|
|	25	|	"Vendor Ledger Entry"	|	11708	|	 "SWIFT Code"	|
|	25	|	"Vendor Ledger Entry"	|	11760	|	 "VAT Date"	|
|	25	|	"Vendor Ledger Entry"	|	11761	|	 Compensation	|
|	25	|	"Vendor Ledger Entry"	|	31000	|	 "Prepayment Type"	|
|	25	|	"Vendor Ledger Entry"	|	31003	|	 "Open For Advance Letter"	|
|	312	|	"Purchases & Payables Setup"	|	11760	|	 "G/L Entry as Doc. Lines (Acc.)"	|
|	312	|	"Purchases & Payables Setup"	|	11761	|	 "G/L Entry as Doc. Lines (Item)"	|
|	312	|	"Purchases & Payables Setup"	|	11762	|	 "G/L Entry as Doc. Lines (FA)"	|
|	312	|	"Purchases & Payables Setup"	|	11764	|	 "G/L Entry as Doc. Lines (Char)"	|
|	312	|	"Purchases & Payables Setup"	|	11765	|	 "Posting Desc. Code"	|
|	312	|	"Purchases & Payables Setup"	|	11766	|	 "Default VAT Date"	|
|	312	|	"Purchases & Payables Setup"	|	11767	|	 "Allow Alter Posting Groups"	|
|	312	|	"Purchases & Payables Setup"	|	11768	|	 "Automatic Adv. Invoice Posting"	|
|	312	|	"Purchases & Payables Setup"	|	31000	|	 "Advance Letter Nos."	|
|	312	|	"Purchases & Payables Setup"	|	31001	|	 "Advance Invoice Nos."	|
|	312	|	"Purchases & Payables Setup"	|	31002	|	 "Advance Credit Memo Nos."	|
|	312	|	"Purchases & Payables Setup"	|	31100	|	 "Default Orig. Doc. VAT Date"	|
|	23	|	Vendor	|	11765	|	 "Disable Uncertainty Check"	|
|	23	|	Vendor	|	11790	|	 "Registration No."	|
|	23	|	Vendor	|	11791	|	 "Tax Registration No."	|
|	23	|	Vendor	|	11792	|	 "Registered Name"	|
|	23	|	Vendor	|	31060	|	 "Transaction Type"	|
|	23	|	Vendor	|	31061	|	 "Transaction Specification"	|
|	23	|	Vendor	|	31062	|	 "Transport Method"	|
|	23	|	Vendor	|	31063	|	 "Industry Code"	|
|	288	|	"Vendor Bank Account"	|	11700	|	 Priority	|
|	288	|	"Vendor Bank Account"	|	11703	|	 "Specific Symbol"	|
|	288	|	"Vendor Bank Account"	|	11792	|	 "Third Party Bank Account"	|
|	93	|	"Vendor Posting Group"	|	31001	|	 "Advance Account"	|
|	5107	|	"Sales Header Archive"	|	11700	|	 "Bank Account Code"	|
|	5107	|	"Sales Header Archive"	|	11701	|	 "Bank Account No."	|
|	5107	|	"Sales Header Archive"	|	11703	|	 "Specific Symbol"	|
|	5107	|	"Sales Header Archive"	|	11704	|	 "Variable Symbol"	|
|	5107	|	"Sales Header Archive"	|	11705	|	 "Constant Symbol"	|
|	5107	|	"Sales Header Archive"	|	11706	|	 "Transit No."	|
|	5107	|	"Sales Header Archive"	|	11707	|	 IBAN	|
|	5107	|	"Sales Header Archive"	|	11708	|	 "SWIFT Code"	|
|	5107	|	"Sales Header Archive"	|	11760	|	 "VAT Date"	|
|	5107	|	"Sales Header Archive"	|	11761	|	 "VAT Currency Factor"	|
|	5107	|	"Sales Header Archive"	|	11762	|	 "Tax Corrective Document"	|
|	5107	|	"Sales Header Archive"	|	11765	|	 "Posting Desc. Code"	|
|	5107	|	"Sales Header Archive"	|	11790	|	 "Registration No."	|
|	5107	|	"Sales Header Archive"	|	11791	|	 "Tax Registration No."	|
|	5107	|	"Sales Header Archive"	|	11793	|	 "Quote Validity"	|
|	5107	|	"Sales Header Archive"	|	11797	|	 "Last Version"	|
|	5107	|	"Sales Header Archive"	|	31060	|	 "Perform. Country/Region Code"	|
|	5107	|	"Sales Header Archive"	|	31061	|	 "Curr. Factor Perf. Country/Reg"	|
|	5107	|	"Sales Header Archive"	|	31063	|	 "Physical Transfer"	|
|	5107	|	"Sales Header Archive"	|	31064	|	 "Intrastat Exclude"	|
|	5107	|	"Sales Header Archive"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	5108	|	"Sales Line Archive"	|	11762	|	 "Reason Code"	|
|	5108	|	"Sales Line Archive"	|	31060	|	 "Physical Transfer"	|
|	18	|	Customer	|	11790	|	 "Registration No."	|
|	18	|	Customer	|	11791	|	 "Tax Registration No."	|
|	18	|	Customer	|	11792	|	 "Registered Name"	|
|	18	|	Customer	|	11793	|	 "Default Ship-to Address Code"	|
|	18	|	Customer	|	31060	|	 "Transaction Type"	|
|	18	|	Customer	|	31061	|	 "Transaction Specification"	|
|	18	|	Customer	|	31062	|	 "Transport Method"	|
|	18	|	Customer	|	31063	|	 "Industry Code"	|
|	287	|	"Customer Bank Account"	|	11700	|	 Priority	|
|	287	|	"Customer Bank Account"	|	11703	|	 "Specific Symbol"	|
|	92	|	"Customer Posting Group"	|	31000	|	 "Advance Account"	|
|	5105	|	"Customer Template"	|	0	|	 *	|
|	5809	|	"Item Charge Assignment (Sales)"	|	31060	|	 "Incl. in Intrastat Amount"	|
|	5809	|	"Item Charge Assignment (Sales)"	|	31061	|	 "Incl. in Intrastat Stat. Value"	|
|	36	|	"Sales Header"	|	11700	|	 "Bank Account Code"	|
|	36	|	"Sales Header"	|	11701	|	 "Bank Account No."	|
|	36	|	"Sales Header"	|	11702	|	 "Bank Branch No."	|
|	36	|	"Sales Header"	|	11703	|	 "Specific Symbol"	|
|	36	|	"Sales Header"	|	11704	|	 "Variable Symbol"	|
|	36	|	"Sales Header"	|	11705	|	 "Constant Symbol"	|
|	36	|	"Sales Header"	|	11706	|	 "Transit No."	|
|	36	|	"Sales Header"	|	11707	|	 IBAN	|
|	36	|	"Sales Header"	|	11708	|	 "SWIFT Code"	|
|	36	|	"Sales Header"	|	11709	|	 "Bank Name"	|
|	36	|	"Sales Header"	|	11730	|	 "Cash Desk Code"	|
|	36	|	"Sales Header"	|	11731	|	 "Cash Document Status"	|
|	36	|	"Sales Header"	|	11760	|	 "VAT Date"	|
|	36	|	"Sales Header"	|	11761	|	 "VAT Currency Factor"	|
|	36	|	"Sales Header"	|	11762	|	 "Tax Corrective Document"	|
|	36	|	"Sales Header"	|	11763	|	 "Postponed VAT"	|
|	36	|	"Sales Header"	|	11765	|	 "Posting Desc. Code"	|
|	36	|	"Sales Header"	|	11766	|	 "Credit Memo Type"	|
|	36	|	"Sales Header"	|	11790	|	 "Registration No."	|
|	36	|	"Sales Header"	|	11791	|	 "Tax Registration No."	|
|	36	|	"Sales Header"	|	11792	|	 "Original User ID"	|
|	36	|	"Sales Header"	|	11793	|	 "Quote Validity"	|
|	36	|	"Sales Header"	|	31000	|	 "Prepayment Type"	|
|	36	|	"Sales Header"	|	31001	|	 "Advance Letter No. Series"	|
|	36	|	"Sales Header"	|	31002	|	 "Advance Letter No."	|
|	36	|	"Sales Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	36	|	"Sales Header"	|	31061	|	 "Perf. Country Currency Factor"	|
|	36	|	"Sales Header"	|	31063	|	 "Physical Transfer"	|
|	36	|	"Sales Header"	|	31064	|	 "Intrastat Exclude"	|
|	36	|	"Sales Header"	|	31065	|	 "Industry Code"	|
|	36	|	"Sales Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	36	|	"Sales Header"	|	31100	|	 "Original Document VAT Date"	|
|	37	|	"Sales Line"	|	11762	|	 "Reason Code"	|
|	37	|	"Sales Line"	|	11763	|	 "VAT Correction"	|
|	37	|	"Sales Line"	|	11764	|	 "VAT Difference (LCY)"	|
|	37	|	"Sales Line"	|	11768	|	 Negative	|
|	37	|	"Sales Line"	|	31001	|	 "Amt. Prep. To Inv. Incl. VAT"	|
|	37	|	"Sales Line"	|	31006	|	 "Adjust Prepmt. Relation"	|
|	37	|	"Sales Line"	|	31008	|	 "Prepmt. VAT Amount Inv."	|
|	37	|	"Sales Line"	|	31060	|	 "Physical Transfer"	|
|	37	|	"Sales Line"	|	31061	|	 "Tariff No."	|
|	37	|	"Sales Line"	|	31062	|	 "Statistic Indication"	|
|	37	|	"Sales Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	302	|	"Finance Charge Memo Header"	|	11700	|	 "Bank No."	|
|	302	|	"Finance Charge Memo Header"	|	11701	|	 "Bank Account No."	|
|	302	|	"Finance Charge Memo Header"	|	11702	|	 "Bank Branch No."	|
|	302	|	"Finance Charge Memo Header"	|	11703	|	 "Specific Symbol"	|
|	302	|	"Finance Charge Memo Header"	|	11704	|	 "Variable Symbol"	|
|	302	|	"Finance Charge Memo Header"	|	11705	|	 "Constant Symbol"	|
|	302	|	"Finance Charge Memo Header"	|	11706	|	 "Transit No."	|
|	302	|	"Finance Charge Memo Header"	|	11707	|	 IBAN	|
|	302	|	"Finance Charge Memo Header"	|	11708	|	 "SWIFT Code"	|
|	302	|	"Finance Charge Memo Header"	|	11709	|	 "Bank Name"	|
|	302	|	"Finance Charge Memo Header"	|	11765	|	 "Posting Desc. Code"	|
|	302	|	"Finance Charge Memo Header"	|	11790	|	 "Registration No."	|
|	302	|	"Finance Charge Memo Header"	|	11791	|	 "Tax Registration No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11700	|	 "Bank No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11701	|	 "Bank Account No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11702	|	 "Bank Branch No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11703	|	 "Specific Symbol"	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11704	|	 "Variable Symbol"	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11705	|	 "Constant Symbol"	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11706	|	 "Transit No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11707	|	 IBAN	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11708	|	 "SWIFT Code"	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11709	|	 "Bank Name"	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11790	|	 "Registration No."	|
|	304	|	"Issued Fin. Charge Memo Header"	|	11791	|	 "Tax Registration No."	|
|	6660	|	"Return Receipt Header"	|	11700	|	 "Bank Account Code"	|
|	6660	|	"Return Receipt Header"	|	11701	|	 "Bank Account No."	|
|	6660	|	"Return Receipt Header"	|	11702	|	 "Bank Branch No."	|
|	6660	|	"Return Receipt Header"	|	11707	|	 IBAN	|
|	6660	|	"Return Receipt Header"	|	11708	|	 "SWIFT Code"	|
|	6660	|	"Return Receipt Header"	|	11709	|	 "Bank Name"	|
|	6660	|	"Return Receipt Header"	|	11790	|	 "Registration No."	|
|	6660	|	"Return Receipt Header"	|	11791	|	 "Tax Registration No."	|
|	6660	|	"Return Receipt Header"	|	11792	|	 "Original User ID"	|
|	6660	|	"Return Receipt Header"	|	11793	|	 "Quote Validity"	|
|	6660	|	"Return Receipt Header"	|	31060	|	 "Perf. Country Currency Factor"	|
|	6660	|	"Return Receipt Header"	|	31063	|	 "Physical Transfer"	|
|	6660	|	"Return Receipt Header"	|	31064	|	 "Intrastat Exclude"	|
|	6660	|	"Return Receipt Header"	|	31065	|	 "Industry Code"	|
|	6661	|	"Return Receipt Line"	|	11762	|	 "Reason Code"	|
|	114	|	"Sales Cr.Memo Header"	|	11700	|	 "Bank Account Code"	|
|	114	|	"Sales Cr.Memo Header"	|	11701	|	 "Bank Account No."	|
|	114	|	"Sales Cr.Memo Header"	|	11702	|	 "Bank Branch No."	|
|	114	|	"Sales Cr.Memo Header"	|	11703	|	 "Specific Symbol"	|
|	114	|	"Sales Cr.Memo Header"	|	11704	|	 "Variable Symbol"	|
|	114	|	"Sales Cr.Memo Header"	|	11705	|	 "Constant Symbol"	|
|	114	|	"Sales Cr.Memo Header"	|	11706	|	 "Transit No."	|
|	114	|	"Sales Cr.Memo Header"	|	11707	|	 IBAN	|
|	114	|	"Sales Cr.Memo Header"	|	11708	|	 "SWIFT Code"	|
|	114	|	"Sales Cr.Memo Header"	|	11709	|	 "Bank Name"	|
|	114	|	"Sales Cr.Memo Header"	|	11730	|	 "Cash Desk Code"	|
|	114	|	"Sales Cr.Memo Header"	|	11731	|	 "Cash Document Status"	|
|	114	|	"Sales Cr.Memo Header"	|	11760	|	 "VAT Date"	|
|	114	|	"Sales Cr.Memo Header"	|	11761	|	 "VAT Currency Factor"	|
|	114	|	"Sales Cr.Memo Header"	|	11763	|	 "Postponed VAT"	|
|	114	|	"Sales Cr.Memo Header"	|	11764	|	 "Postponed VAT Realized"	|
|	114	|	"Sales Cr.Memo Header"	|	11766	|	 "Credit Memo Type"	|
|	114	|	"Sales Cr.Memo Header"	|	11790	|	 "Registration No."	|
|	114	|	"Sales Cr.Memo Header"	|	11791	|	 "Tax Registration No."	|
|	114	|	"Sales Cr.Memo Header"	|	11792	|	 "Original User ID"	|
|	114	|	"Sales Cr.Memo Header"	|	11793	|	 "Quote Validity"	|
|	114	|	"Sales Cr.Memo Header"	|	31000	|	 "Prepayment Type"	|
|	114	|	"Sales Cr.Memo Header"	|	31003	|	 "Letter No."	|
|	114	|	"Sales Cr.Memo Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	114	|	"Sales Cr.Memo Header"	|	31061	|	 "Curr. Factor Perf. Country/Reg"	|
|	114	|	"Sales Cr.Memo Header"	|	31063	|	 "Physical Transfer"	|
|	114	|	"Sales Cr.Memo Header"	|	31064	|	 "Intrastat Exclude"	|
|	114	|	"Sales Cr.Memo Header"	|	31065	|	 "Industry Code"	|
|	114	|	"Sales Cr.Memo Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	114	|	"Sales Cr.Memo Header"	|	31100	|	 "Original Document VAT Date"	|
|	115	|	"Sales Cr.Memo Line"	|	11762	|	 "Reason Code"	|
|	115	|	"Sales Cr.Memo Line"	|	11764	|	 "VAT Difference (LCY)"	|
|	115	|	"Sales Cr.Memo Line"	|	31061	|	 "Tariff No."	|
|	115	|	"Sales Cr.Memo Line"	|	31062	|	 "Statistic Indication"	|
|	115	|	"Sales Cr.Memo Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	112	|	"Sales Invoice Header"	|	11700	|	 "Bank Account Code"	|
|	112	|	"Sales Invoice Header"	|	11701	|	 "Bank Account No."	|
|	112	|	"Sales Invoice Header"	|	11702	|	 "Bank Branch No."	|
|	112	|	"Sales Invoice Header"	|	11703	|	 "Specific Symbol"	|
|	112	|	"Sales Invoice Header"	|	11704	|	 "Variable Symbol"	|
|	112	|	"Sales Invoice Header"	|	11705	|	 "Constant Symbol"	|
|	112	|	"Sales Invoice Header"	|	11706	|	 "Transit No."	|
|	112	|	"Sales Invoice Header"	|	11707	|	 IBAN	|
|	112	|	"Sales Invoice Header"	|	11708	|	 "SWIFT Code"	|
|	112	|	"Sales Invoice Header"	|	11709	|	 "Bank Name"	|
|	112	|	"Sales Invoice Header"	|	11730	|	 "Cash Desk Code"	|
|	112	|	"Sales Invoice Header"	|	11731	|	 "Cash Document Status"	|
|	112	|	"Sales Invoice Header"	|	11760	|	 "VAT Date"	|
|	112	|	"Sales Invoice Header"	|	11761	|	 "VAT Currency Factor"	|
|	112	|	"Sales Invoice Header"	|	11762	|	 "Tax Corrective Document"	|
|	112	|	"Sales Invoice Header"	|	11770	|	 "Reversed By Cr. Memo No."	|
|	112	|	"Sales Invoice Header"	|	11790	|	 "Registration No."	|
|	112	|	"Sales Invoice Header"	|	11791	|	 "Tax Registration No."	|
|	112	|	"Sales Invoice Header"	|	11792	|	 "Original User ID"	|
|	112	|	"Sales Invoice Header"	|	11793	|	 "Quote Validity"	|
|	112	|	"Sales Invoice Header"	|	31000	|	 "Prepayment Type"	|
|	112	|	"Sales Invoice Header"	|	31003	|	 "Letter No."	|
|	112	|	"Sales Invoice Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	112	|	"Sales Invoice Header"	|	31061	|	 "Curr. Factor Perf. Country/Reg"	|
|	112	|	"Sales Invoice Header"	|	31063	|	 "Physical Transfer"	|
|	112	|	"Sales Invoice Header"	|	31064	|	 "Intrastat Exclude"	|
|	112	|	"Sales Invoice Header"	|	31065	|	 "Industry Code"	|
|	112	|	"Sales Invoice Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	113	|	"Sales Invoice Line"	|	11762	|	 "Reason Code"	|
|	113	|	"Sales Invoice Line"	|	11764	|	 "VAT Difference (LCY)"	|
|	113	|	"Sales Invoice Line"	|	31010	|	 "Prepayment Cancelled"	|
|	113	|	"Sales Invoice Line"	|	31011	|	 "Letter No."	|
|	113	|	"Sales Invoice Line"	|	31012	|	 "VAT Doc. Letter No."	|
|	113	|	"Sales Invoice Line"	|	31061	|	 "Tariff No."	|
|	113	|	"Sales Invoice Line"	|	31062	|	 "Statistic Indication"	|
|	113	|	"Sales Invoice Line"	|	31063	|	 "Country/Region of Origin Code"	|
|	110	|	"Sales Shipment Header"	|	11700	|	 "Bank Account Code"	|
|	110	|	"Sales Shipment Header"	|	11701	|	 "Bank Account No."	|
|	110	|	"Sales Shipment Header"	|	11702	|	 "Bank Branch No."	|
|	110	|	"Sales Shipment Header"	|	11707	|	 IBAN	|
|	110	|	"Sales Shipment Header"	|	11708	|	 "SWIFT Code"	|
|	110	|	"Sales Shipment Header"	|	11709	|	 "Bank Name"	|
|	110	|	"Sales Shipment Header"	|	11790	|	 "Registration No."	|
|	110	|	"Sales Shipment Header"	|	11791	|	 "Tax Registration No."	|
|	110	|	"Sales Shipment Header"	|	11792	|	 "Original User ID"	|
|	110	|	"Sales Shipment Header"	|	11793	|	 "Quote Validity"	|
|	110	|	"Sales Shipment Header"	|	31060	|	 "Perform. Country/Region Code"	|
|	110	|	"Sales Shipment Header"	|	31063	|	 "Physical Transfer"	|
|	110	|	"Sales Shipment Header"	|	31064	|	 "Intrastat Exclude"	|
|	110	|	"Sales Shipment Header"	|	31065	|	 "Industry Code"	|
|	110	|	"Sales Shipment Header"	|	31066	|	 "EU 3-Party Intermediate Role"	|
|	111	|	"Sales Shipment Line"	|	31061	|	 "Tariff No."	|
|	111	|	"Sales Shipment Line"	|	31062	|	 "Statistic Indication"	|
|	21	|	"Cust. Ledger Entry"	|	11700	|	 "Bank Account Code"	|
|	21	|	"Cust. Ledger Entry"	|	11701	|	 "Bank Account No."	|
|	21	|	"Cust. Ledger Entry"	|	11703	|	 "Specific Symbol"	|
|	21	|	"Cust. Ledger Entry"	|	11704	|	 "Variable Symbol"	|
|	21	|	"Cust. Ledger Entry"	|	11705	|	 "Constant Symbol"	|
|	21	|	"Cust. Ledger Entry"	|	11706	|	 "Transit No."	|
|	21	|	"Cust. Ledger Entry"	|	11707	|	 IBAN	|
|	21	|	"Cust. Ledger Entry"	|	11708	|	 "SWIFT Code"	|
|	21	|	"Cust. Ledger Entry"	|	11760	|	 "VAT Date"	|
|	21	|	"Cust. Ledger Entry"	|	11761	|	 Compensation	|
|	21	|	"Cust. Ledger Entry"	|	31000	|	 "Prepayment Type"	|
|	21	|	"Cust. Ledger Entry"	|	31003	|	 "Open For Advance Letter"	|
|	379	|	"Detailed Cust. Ledg. Entry"	|	11768	|	 "Customer Posting Group"	|
|	379	|	"Detailed Cust. Ledg. Entry"	|	31000	|	 Advance	|
|	297	|	"Issued Reminder Header"	|	11790	|	 "Registration No."	|
|	297	|	"Issued Reminder Header"	|	11791	|	 "Tax Registration No."	|
|	295	|	"Reminder Header"	|	11700	|	 "Bank No."	|
|	295	|	"Reminder Header"	|	11701	|	 "Bank Account No."	|
|	295	|	"Reminder Header"	|	11702	|	 "Bank Branch No."	|
|	295	|	"Reminder Header"	|	11703	|	 "Specific Symbol"	|
|	295	|	"Reminder Header"	|	11704	|	 "Variable Symbol"	|
|	295	|	"Reminder Header"	|	11705	|	 "Constant Symbol"	|
|	295	|	"Reminder Header"	|	11706	|	 "Transit No."	|
|	295	|	"Reminder Header"	|	11707	|	 IBAN	|
|	295	|	"Reminder Header"	|	11708	|	 "SWIFT Code"	|
|	295	|	"Reminder Header"	|	11709	|	 "Bank Name"	|
|	295	|	"Reminder Header"	|	11790	|	 "Registration No."	|
|	295	|	"Reminder Header"	|	11791	|	 "Tax Registration No."	|
|	311	|	"Sales & Receivables Setup"	|	11760	|	 "G/L Entry as Doc. Lines (Acc.)"	|
|	311	|	"Sales & Receivables Setup"	|	11761	|	 "G/L Entry as Doc. Lines (Item)"	|
|	311	|	"Sales & Receivables Setup"	|	11762	|	 "G/L Entry as Doc. Lines (FA)"	|
|	311	|	"Sales & Receivables Setup"	|	11763	|	 "G/L Entry as Doc. Lines (Res.)"	|
|	311	|	"Sales & Receivables Setup"	|	11764	|	 "G/L Entry as Doc. Lines (Char)"	|
|	311	|	"Sales & Receivables Setup"	|	11765	|	 "Posting Desc. Code"	|
|	311	|	"Sales & Receivables Setup"	|	11766	|	 "Default VAT Date"	|
|	311	|	"Sales & Receivables Setup"	|	11767	|	 "Allow Alter Posting Groups"	|
|	311	|	"Sales & Receivables Setup"	|	11768	|	 "Automatic Adv. Invoice Posting"	|
|	311	|	"Sales & Receivables Setup"	|	11772	|	 "Reas.Cd. on Tax Corr.Doc.Mand."	|
|	311	|	"Sales & Receivables Setup"	|	11773	|	 "Pmt.Disc.Tax Corr.Doc. Nos."	|
|	311	|	"Sales & Receivables Setup"	|	11774	|	 "Copy As Tax Corr. Document"	|
|	311	|	"Sales & Receivables Setup"	|	11775	|	 "Reason Code For Payment Disc."	|
|	311	|	"Sales & Receivables Setup"	|	11777	|	 "Credit Memo Confirmation"	|
|	311	|	"Sales & Receivables Setup"	|	11779	|	 "Fin. Charge Posting Desc. Code"	|
|	311	|	"Sales & Receivables Setup"	|	31000	|	 "Advance Letter Nos."	|
|	311	|	"Sales & Receivables Setup"	|	31001	|	 "Advance Invoice Nos."	|
|	311	|	"Sales & Receivables Setup"	|	31002	|	 "Advance Credit Memo Nos."	|
|	1262	|	"Isolated Certificate"	|	3	|	 Password	|
|	1262	|	"Isolated Certificate"	|	31130	|	 "Certificate Code"	|
|	91	|	"User Setup"	|	11700	|	 "Check Payment Orders"	|
|	91	|	"User Setup"	|	11701	|	 "Check Bank Statements"	|
|	91	|	"User Setup"	|	11730	|	 "Cash Resp. Ctr. Filter"	|
|	91	|	"User Setup"	|	11760	|	 "Check Document Date(work date)"	|
|	91	|	"User Setup"	|	11761	|	 "Check Document Date(sys. date)"	|
|	91	|	"User Setup"	|	11762	|	 "Check Posting Date (work date)"	|
|	91	|	"User Setup"	|	11763	|	 "Check Posting Date (sys. date)"	|
|	91	|	"User Setup"	|	11764	|	 "Check Bank Accounts"	|
|	91	|	"User Setup"	|	11765	|	 "Check Journal Templates"	|
|	91	|	"User Setup"	|	11766	|	 "Check Dimension Values"	|
|	91	|	"User Setup"	|	11767	|	 "Allow Posting to Closed Period"	|
|	91	|	"User Setup"	|	11768	|	 "Allow VAT Posting From"	|
|	91	|	"User Setup"	|	11769	|	 "Allow VAT Posting To"	|
|	91	|	"User Setup"	|	11790	|	 "Allow Complete Job"	|
|	91	|	"User Setup"	|	11791	|	 "Employee No."	|
|	91	|	"User Setup"	|	11792	|	 "User Name"	|
|	91	|	"User Setup"	|	31070	|	 "Allow Item Unapply"	|
|	91	|	"User Setup"	|	31071	|	 "Check Location Code"	|
|	91	|	"User Setup"	|	31072	|	 "Check Release Location Code"	|
|	91	|	"User Setup"	|	31073	|	 "Check Whse. Net Change Temp."	|
|	91	|	"User Setup"	|	31110	|	 "Bank Amount Approval Limit"	|
|	91	|	"User Setup"	|	31111	|	 "Unlimited Bank Approval"	|
|	91	|	"User Setup"	|	31112	|	 "Cash Desk Amt. Approval Limit"	|
|	91	|	"User Setup"	|	31113	|	 "Unlimited Cash Desk Approval"	|
|	31084	|	"Acc. Sched. Expression Buffer"	|	0	|	 *	|
|	31083	|	"Acc. Schedule Result Column"	|	0	|	 *	|
|	31089	|	"Acc. Schedule Extension"	|	0	|	 *	|
|	31086	|	"Acc. Schedule Result Header"	|	0	|	 *	|
|	31088	|	"Acc. Schedule Result History"	|	0	|	 *	|
|	31082	|	"Acc. Schedule Result Line"	|	0	|	 *	|
|	31087	|	"Acc. Schedule Result Value"	|	0	|	 *	|
|	31026	|	"Advance Letter Line Relation"	|	0	|	 *	|
|	31035	|	"Advance Letter Matching Buffer"	|	0	|	 *	|
|	31017	|	"Advance Link"	|	0	|	 *	|
|	31018	|	"Advance Link Buffer"	|	0	|	 *	|
|	31036	|	"Advance Link Buffer - Entry"	|	0	|	 *	|
|	31029	|	"Adv. Letter Line Rel. Buffer"	|	0	|	 *	|
|	11702	|	"Bank Pmt. Appl. Rule Code"	|	0	|	 *	|
|	11704	|	"Bank Statement Header"	|	0	|	 *	|
|	11705	|	"Bank Statement Line"	|	0	|	 *	|
|	11749	|	"Cash Desk Cue"	|	0	|	 *	|
|	11741	|	"Cash Desk Event"	|	0	|	 *	|
|	11759	|	"Cash Desk Report Selections"	|	0	|	 *	|
|	11740	|	"Cash Desk User"	|	0	|	 *	|
|	11730	|	"Cash Document Header"	|	0	|	 *	|
|	11731	|	"Cash Document Line"	|	0	|	 *	|
|	31131	|	"Certificate CZ"	|	0	|	 *	|
|	31130	|	"Certificate CZ Code"	|	0	|	 *	|
|	31040	|	"Classification Code"	|	0	|	 *	|
|	31095	|	Commodity	|	0	|	 *	|
|	31096	|	"Commodity Setup"	|	0	|	 *	|
|	11792	|	"Company Officials"	|	0	|	 *	|
|	11701	|	"Constant Symbol"	|	0	|	 *	|
|	31050	|	"Credit Header"	|	0	|	 *	|
|	31051	|	"Credit Line"	|	0	|	 *	|
|	31049	|	"Credit Report Selections"	|	0	|	 *	|
|	31048	|	"Credits Setup"	|	0	|	 *	|
|	11743	|	"Currency Nominal Value"	|	0	|	 *	|
|	31041	|	"Depreciation Group"	|	0	|	 *	|
|	11778	|	"Detailed G/L Entry"	|	0	|	 *	|
|	31097	|	"Document Footer"	|	0	|	 *	|
|	31121	|	"EET Business Premises"	|	0	|	 *	|
|	31122	|	"EET Cash Register"	|	0	|	 *	|
|	31123	|	"EET Entry"	|	0	|	 *	|
|	31124	|	"EET Entry Status"	|	0	|	 *	|
|	31120	|	"EET Entry Status"	|	0	|	 *	|
|	11761	|	"Electronically Govern. Setup"	|	0	|	 *	|
|	11765	|	"Excel Template"	|	0	|	 *	|
|	31042	|	"FA Extended Posting Group"	|	0	|	 *	|
|	31044	|	"FA History Entry"	|	0	|	 *	|
|	11791	|	"Industry Code"	|	0	|	 *	|
|	11706	|	"Issued Bank Statement Header"	|	0	|	 *	|
|	11707	|	"Issued Bank Statement Line"	|	0	|	 *	|
|	11710	|	"Issued Payment Order Header"	|	0	|	 *	|
|	11711	|	"Issued Payment Order Line"	|	0	|	 *	|
|	31071	|	"Item Package Material"	|	0	|	 *	|
|	11784	|	"Non Deductible VAT Setup"	|	0	|	 *	|
|	11799	|	"No. Series Link"	|	0	|	 *	|
|	31070	|	"Package Material"	|	0	|	 *	|
|	11708	|	"Payment Order Header"	|	0	|	 *	|
|	11709	|	"Payment Order Line"	|	0	|	 *	|
|	11764	|	"Perf. Country Curr. Exch. Rate"	|	0	|	 *	|
|	11735	|	"Posted Cash Document Header"	|	0	|	 *	|
|	11736	|	"Posted Cash Document Line"	|	0	|	 *	|
|	31057	|	"Posted Credit Header"	|	0	|	 *	|
|	31058	|	"Posted Credit Line"	|	0	|	 *	|
|	11786	|	"Posting Desc. Parameter"	|	0	|	 *	|
|	11785	|	"Posting Description"	|	0	|	 *	|
|	31022	|	"Purch. Advance Letter Entry"	|	0	|	 *	|
|	31020	|	"Purch. Advance Letter Header"	|	0	|	 *	|
|	31021	|	"Purch. Advance Letter Line"	|	0	|	 *	|
|	31030	|	"Purchase Adv. Payment Template"	|	0	|	 *	|
|	11762	|	"Registration Country/Region"	|	0	|	 *	|
|	11758	|	"Registration Log"	|	0	|	 *	|
|	11763	|	"Registr. Country/Region Route"	|	0	|	 *	|
|	11757	|	"Reg. No. Srv Config"	|	0	|	 *	|
|	31093	|	"Reverse Charge Header"	|	0	|	 *	|
|	31094	|	"Reverse Charge Line"	|	0	|	 *	|
|	31002	|	"Sales Advance Letter Entry"	|	0	|	 *	|
|	31000	|	"Sales Advance Letter Header"	|	0	|	 *	|
|	31001	|	"Sales Advance Letter Line"	|	0	|	 *	|
|	31010	|	"Sales Adv. Payment Template"	|	0	|	 *	|
|	31043	|	"SKP Code"	|	0	|	 *	|
|	31063	|	"Specific Movement"	|	0	|	 *	|
|	11766	|	"Statement File Mapping"	|	0	|	 *	|
|	31062	|	"Statistic Indication"	|	0	|	 *	|
|	31065	|	"Stat. Reporting Setup"	|	0	|	 *	|
|	31072	|	"Stockkeeping Unit Template"	|	0	|	 *	|
|	11781	|	"Subst. Customer Posting Group"	|	0	|	 *	|
|	11782	|	"Subst. Vendor Posting Group"	|	0	|	 *	|
|	11703	|	"Text-to-Account Mapping Code"	|	0	|	 *	|
|	11760	|	"Uncertainty Payer Entry"	|	0	|	 *	|
|	11796	|	"User Setup Line"	|	0	|	 *	|
|	31027	|	"VAT Amount Line Adv. Payment"	|	0	|	 *	|
|	11779	|	"VAT Attribute Code"	|	0	|	 *	|
|	31103	|	"VAT Control Report Buffer"	|	0	|	 *	|
|	31100	|	"VAT Control Report Header"	|	0	|	 *	|
|	31101	|	"VAT Control Report Line"	|	0	|	 *	|
|	31102	|	"VAT Control Report Section"	|	0	|	 *	|
|	31104	|	"VAT Ctrl.Rep. - VAT Entry Link"	|	0	|	 *	|
|	11767	|	"VAT Identifier"	|	0	|	 *	|
|	11768	|	"VAT Identifier Translate"	|	0	|	 *	|
|	11780	|	"VAT Period"	|	0	|	 *	|
|	11773	|	"VAT Statement Attachment"	|	0	|	 *	|
|	11772	|	"VAT Statement Comment Line"	|	0	|	 *	|
|	11794	|	"Vendor Template"	|	0	|	 *	|
|	31066	|	"VIES Declaration Header"	|	0	|	 *	|
|	31067	|	"VIES Declaration Line"	|	0	|	 *	|
|	31060	|	"VIES Transaction Buffer"	|	0	|	 *	|
|	31073	|	"Whse. Net Change Template"	|	0	|	 *	|
|	11798	|	"XML Export Buffer"	|	0	|	 *	|
|	 926 	|	"G/L Acc. Balance Buffer"	|	11762	|	 "Net Change (VAT Date)"	|
|	 86 	|	"Exch. Rate Adjmt. Reg."	|	11760	|	 "Starting Date"	|
|	 86 	|	"Exch. Rate Adjmt. Reg."	|	11761	|	 "Ending Date"	|
|	 86 	|	"Exch. Rate Adjmt. Reg."	|	11762	|	 "Running Date"	|
|	 15 	|	"G/L Account"	|	11761	|	 "Apply Entries"	|
|	 5225 	|	"Employee Payment Buffer"	|	11760	|	 "Employee Posting Group"	|
|	 6507 	|	"Item Entry Relation"	|	31070	|	 Undo	|
|	 5747 	|	"Transfer Receipt Line"	|	11761	|	 "Posting Date"	|
|	 5745 	|	"Transfer Shipment Line"	|	11760	|	 Correction	|
|	 5745 	|	"Transfer Shipment Line"	|	11761	|	 "Posting Date"	|
|	 5745 	|	"Transfer Shipment Line"	|	31072	|	 "Transfer Order Line No."	|
|	 212 	|	"Job Posting Buffer"	|	11763	|	 Correction	|
|	 121 	|	"Purch. Rcpt. Line"	|	11790	|	 "Vendor Shipment No."	|
|	23	|	Vendor	|	11760	|	 "Last Statement No."	|
|	23	|	Vendor	|	11761	|	 "Print Statements"	|
|	23	|	Vendor	|	11762	|	 "Last Statement Date"	|
|	23	|	Vendor	|	11793	|	 "Default Order Address Code"	|
|	23	|	Customer	|	11760	|	 "Last Statement Date"	|
|	 302 	|	"Finance Charge Memo Header"	|	11761	|	 "Multiple Interest Rates"	|
|	 302 	|	"Finance Charge Memo Header"	|	11770	|	 "Tax Amount"	|
|	 303 	|	"Finance Charge Memo Line"	|	11761	|	 Days	|
|	 303 	|	"Finance Charge Memo Line"	|	11762	|	 "Multiple Interest Rate"	|
|	 5 	|	"Finance Charge Terms"	|	11760	|	 "Detailed Line Description"	|
|	 5 	|	"Finance Charge Terms"	|	11761	|	 "Grace Tax Period"	|
|	 304 	|	"Issued Fin. Charge Memo Header"	|	11761	|	 "Multiple Interest Rates"	|
|	 305 	|	"Issued Fin. Charge Memo Line"	|	11761	|	 Days	|
|	 305 	|	"Issued Fin. Charge Memo Line"	|	11762	|	 "Multiple Interest Rate"	|
|	 305 	|	"Issued Fin. Charge Memo Line"	|	11770	|	 "Tax Amount"	|
|	 305 	|	"Issued Fin. Charge Memo Line"	|	11771	|	 "Tax Days"	|
|	 111 	|	"Sales Shipment Line"	|	11791	|	 "Package Tracking No."	|
|	 297 	|	"Issued Reminder Header"	|	11700	|	 "Bank No."	|
|	 297 	|	"Issued Reminder Header"	|	11701	|	 "Bank Account No."	|
|	 297 	|	"Issued Reminder Header"	|	11702	|	 "Bank Branch No."	|
|	 297 	|	"Issued Reminder Header"	|	11703	|	 "Specific Symbol"	|
|	 297 	|	"Issued Reminder Header"	|	11704	|	 "Variable Symbol"	|
|	 297 	|	"Issued Reminder Header"	|	11705	|	 "Constant Symbol"	|
|	 297 	|	"Issued Reminder Header"	|	11706	|	 "Transit No."	|
|	 297 	|	"Issued Reminder Header"	|	11707	|	 IBAN	|
|	 297 	|	"Issued Reminder Header"	|	11708	|	 "SWIFT Code"	|
|	 297 	|	"Issued Reminder Header"	|	11709	|	 "Bank Name"	|
|	 297 	|	"Issued Reminder Header"	|	11761	|	 "Multiple Interest Rates"	|
|	 298 	|	"Issued Reminder Line"	|	11761	|	 Days	|
|	 298 	|	"Issued Reminder Line"	|	11762	|	 "Multiple Interest Rate"	|
|	 295 	|	"Reminder Header"	|	11761	|	 "Multiple Interest Rates"	|
|	 296 	|	"Reminder Line"	|	11761	|	 Days	|
|	 296 	|	"Reminder Line"	|	11762	|	 "Multiple Interest Rate"	|
|	 311 	|	"Sales & Receivables Setup"	|	11778	|	 "Multiple Interest Rates"	|
|	 370 	|	"Excel Buffer"	|	11790	|	 "Font Color"	|
|	 370 	|	"Excel Buffer"	|	11791	|	 "Foreground Color"	|
|	 370 	|	"Excel Buffer"	|	11792	|	 "Font Name"	|
|	 386 	|	"Entry No. Amount Buffer"	|	11760	|	 "Debit Amount"	|
|	 386 	|	"Entry No. Amount Buffer"	|	11761	|	 "Credit Amount"	|
|	 31081 	|	"Acc. Schedule Filter Line"	|	0	|	 *	|
|	 11771 	|	"Bank Acc. Adjustment Buffer"	|	0	|	 *	|
|	 11787 	|	"Detailed Fin. Charge Memo Line"	|	0	|	 *	|
|	 11788 	|	"Detailed Iss.Fin.Ch. Memo Line"	|	0	|	 *	|
|	 11790 	|	"Detailed Issued Reminder Line"	|	0	|	 *	|
|	 11789 	|	"Detailed Reminder Line"	|	0	|	 *	|
|	 11774 	|	"Enhanced Currency Buffer"	|	0	|	 *	|
|	 31080 	|	"Export Acc. Schedule"	|	0	|	 *	|
|	 11770 	|	"G/L Account Adjustment Buffer"	|	0	|	 *	|
|	 11777 	|	"Multiple Interest Calc. Line"	|	0	|	 *	|
|	 11783 	|	"Multiple Interest Rate"	|	0	|	 *	|
|	331	|	"Adjust Exchange Rate Buffer"	|	11760	|	 "Initial G/L Account No."	|
|	331	|	"Adjust Exchange Rate Buffer"	|	31000	|	 Advance	|
|	342	|	"Acc. Sched. Cell Value"	|	31080	|	 "Schedule Name"	|
|	49	|	"Invoice Post. Buffer"	|	11760	|	 "VAT Date"	|
|	49	|	"Invoice Post. Buffer"	|	31000	|	 "Prepayment Type"	|
|	48	|	"Invt. Posting Buffer"	|	11763	|	 "G/L Correction"	|

### DACH Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	79	|	"Company Information"	|	11017	|	 "Check Transport Method"	|
|	79	|	"Company Information"	|	11018	|	 "Check Transaction Specific."	|
|	79	|	"Company Information"	|	11051	|	 "Check for Partner VAT ID"	|
|	79	|	"Company Information"	|	11052	|	 "Check for Country of Origin"	|
|	11003	|	"Data Export Record Definition"	|	4	|	 "Export Path"	|
|	125	|	"Purch. Cr. Memo Line"	|	5005396	|	 "Order No. (Old)"	|
|	125	|	"Purch. Cr. Memo Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	123	|	"Purch. Inv. Line"	|	5005396	|	 "Order No. (Old)"	|
|	123	|	"Purch. Inv. Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	115	|	"Sales Cr.Memo Line"	|	5005396	|	 "Order No. (Old)"	|
|	115	|	"Sales Cr.Memo Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	113	|	"Sales Invoice Line"	|	5005396	|	 "Order No. (Old)"	|
|	113	|	"Sales Invoice Line"	|	5005397	|	 "Order Line No. (Old)"	|
|	311	|	"Sales & Receivables Setup"	|	11500	|	 "Block ship. when neg. invent."	|
|	311	|	"Sales & Receivables Setup"	|	5005130	|	 "Arch. Orders and Ret. Orders"	|
|	311	|	"Sales & Receivables Setup"	|	5005132	|	 "Archiving Sales Quote"	|
|	311	|	"Sales & Receivables Setup"	|	5005133	|	 "Archiving Blanket Sales Order"	|
|	311	|	"Sales & Receivables Setup"	|	5005134	|	 "Batch Archiving Sales Quote"	|
|	242	|	"Source Code Setup"	|	5005350	|	 "Phys. Invt. Order"	|
|	11013	|	"Electronic VAT Decl. Setup"	|	0	|	 *	|
|	11011	|	"Sales VAT Advance Notification"	|	0	|	 *	|
|	11012	|	"Transmission Log Entry"	|	0	|	 *	|

### DE Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 11028	| "Electronic VAT Decl. Buffer"	| 0 |	 * |

### DK Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 372	| "Payment Buffer"	| 13650	| "Giro Acc. No." |
| 13600	| "OIOUBL Profile"	| 0 | * |

### ES Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	363	|	"Analysis View"	|	10700	|	 "Historic G/L Account Filter"	|
|	84	|	"Acc. Schedule Name"	|	10720	|	 "Acc. No. Referred to old Acc."	|
|	17	|	"G/L Entry"	|	10720	|	 "New G/L Account No."	|
|	17	|	"G/L Entry"	|	10721	|	 "Old G/L Account No."	|
|	17	|	"G/L Entry"	|	10722	|	 Updated	|
|	45	|	"G/L Register"	|	10701	|	 "Period Trans. No."	|
|	290	|	"VAT Amount Line"	|	10702	|	 "Pmt. Disc. Given Amount (Old)"	|
|	263	|	"Intrastat Jnl. Line"	|	10701	|	 "Shipment Method Code #1"	|
|	10751	|	"SII Setup"	|	3	|	 Certificate	|
|	10751	|	"SII Setup"	|	4	|	 Password	|
|	210	|	"Job Journal Line"	|	10700	|	 "Shipment Method Code"	|
|	39	|	"Purchase Line"	|	10700	|	 "Pmt. Disc. Rcd. Amount (Old)"	|
|	125	|	"Purch. Cr. Memo Line"	|	10700	|	 "Pmt. Disc. Rcd. Amount (Old)"	|
|	123	|	"Purch. Inv. Line"	|	10700	|	 "Pmt. Disc. Rcd. Amount (Old)"	|
|	37	|	"Sales Line"	|	10700	|	 "Pmt. Disc. Given Amount (Old)"	|
|	115	|	"Sales Cr.Memo Line"	|	10700	|	 "Pmt. Disc. Given Amount (Old)"	|
|	113	|	"Sales Invoice Line"	|	10700	|	 "Pmt. Disc. Given Amount (Old)"	|
|	5902	|	"Service Line"	|	10700	|	 "Pmt. Disc. Given Amount (Old)"	|

### FI Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	32000000	|	"Reference File Setup"	|	2	|	 "Export Reference Payments"	|
|	32000000	|	"Reference File Setup"	|	3	|	 "Export Foreign Payments"	|
|	32000000	|	"Reference File Setup"	|	4	|	 "Import Reference Payments"	|
|	32000000	|	"Reference File Setup"	|	13	|	 "Currency Exchange Rate File"	|
|	3010590	|	"Fin. Charge Interest Rate"	|	0	|	 *	|
|	303	|	"Finance Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	5	|	"Finance Charge Terms"	|	3010590	|	 "Multiple Lines Description"	|
|	305	|	"Issued Fin. Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	298	|	"Issued Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	296	|	"Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|

### FR Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	15	|	"G/L Account"	|	10810	|	 "G/L Entry Type Filter"	|
|	81	|	"Gen. Journal Line"	|	10810	|	 "Entry Type"	|
|	17	|	"G/L Entry"	|	10810	|	 "Entry Type"	|
|	230	|	"Source Code"	|	10810	|	 Simulation	|
|	263	|	"Intrastat Jnl. Line"	|	10800	|	 "Shipment Method Code"	|

### GB Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	743	|	"VAT Report Setup"	|	10541	|	 "MTD-FP Public IP Service URL"	|
|	263	|	"Intrastat Jnl. Line"	|	10500	|	 "Shipment Method Code"	|
|	10500	|	"Type of Supply"	|	0	|	 *	|
|	210	|	"Job Journal Line"	|	10500	|	 "Shipment Method Code"	|
|	5109	|	"Purchase Header Archive"	|	10501	|	 "Type of Supply Code"	|
|	38	|	"Purchase Header"	|	10501	|	 "Type of Supply Code"	|
|	124	|	"Purch. Cr. Memo Hdr."	|	10501	|	 "Type of Supply Code"	|
|	122	|	"Purch. Inv. Header"	|	10501	|	 "Type of Supply Code"	|
|	23	|	Vendor	|	10500	|	 "Type of Supply Code"	|
|	5107	|	"Sales Header Archive"	|	10501	|	 "Type of Supply Code"	|
|	18	|	Customer	|	10500	|	 "Type of Supply Code"	|
|	36	|	"Sales Header"	|	10501	|	 "Type of Supply Code"	|
|	303	|	"Finance Charge Memo Line"	|	10500	|	 "Multiple Interest Rates Entry"	|
|	5	|	"Finance Charge Terms"	|	10555	|	 "Multiple Lines Description"	|
|	305	|	"Issued Fin. Charge Memo Line"	|	10500	|	 "Multiple Interest Rates Entry"	|
|	114	|	"Sales Cr.Memo Header"	|	10501	|	 "Type of Supply Code"	|
|	112	|	"Sales Invoice Header"	|	10501	|	 "Type of Supply Code"	|
|	298	|	"Issued Reminder Line"	|	10500	|	 "Multiple Interest Rates Entry"	|
|	296	|	"Reminder Line"	|	10500	|	 "Multiple Interest Rates Entry"	|

### IT Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 740	| "VAT Report Header"	| 12101	| "Tax Auth. Doc. No." |

### NA Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	81	|	"Gen. Journal Line"	|	27040	|	 "DIOT-Type of Operation"	|
|	254	|	"VAT Entry"	|	27040	|	 "DIOT-Type of Operation"	|
|	325	|	"VAT Posting Setup"	|	27010	|	 "DIOT-WHT %"	|
|	27040	|	"DIOT-Concept"	|	0	|	 *	|
|	27041	|	"DIOT-Concept Link"	|	0	|	 *	|
|	27049	|	"DIOT-Country/Region Data"	|	0	|	 *	|
|	27042	|	"DIOT-Report Buffer"	|	0	|	 *	|
|	27043	|	"DIOT-Report Vendor Buffer"	|	0	|	 *	|
|	38	|	"Purchase Header"	|	27040	|	 "DIOT-Type of Operation"	|
|	122	|	"Purch. Inv. Header"	|	27040	|	 "DIOT-Type of Operation"	|
|	312	|	"Purchases & Payables Setup"	|	27040	|	 "DIOT Default Vendor Type"	|
|	23	|	Vendor	|	27040	|	 "DIOT-Type of Operation"	|
|	 9054 	|	"Finance Cue"	|	10140	|	 "Deposits to Post"	|
|	 10140 	|	"Deposit Header"	|	0	|	 *	|
|	 10120 	|	"Bank Rec. Header"	|	0	|	 *	|
|	 10121 	|	"Bank Rec. Line"	|	0	|	 *	|
|	 10126 	|	"Bank Rec. Sub-line"	|	0	|	 *	|
|	 2850 	|	"Native - API Tax Setup"	|	0	|	 *	|
|	5105	|	"Customer Template"	|	0	|	 *	|

### NL Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	312	|	"Purchases & Payables Setup"	|	11312	|	 "Show Totals on Purch. Inv./CM."	|
|	312	|	"Purchases & Payables Setup"	|	11313	|	 "Insert Std. Vend. Purch. Lines"	|
|	312	|	"Purchases & Payables Setup"	|	11314	|	 Quotes	|
|	312	|	"Purchases & Payables Setup"	|	11316	|	 Orders	|
|	312	|	"Purchases & Payables Setup"	|	11317	|	 Invoices	|
|	312	|	"Purchases & Payables Setup"	|	11319	|	 "Credit Memos"	|
|	311	|	"Sales & Receivables Setup"	|	11313	|	 "Insert Std. Cust. Sales Lines"	|
|	311	|	"Sales & Receivables Setup"	|	11314	|	 Quotes	|
|	311	|	"Sales & Receivables Setup"	|	11317	|	 Invoices	|
|	311	|	"Sales & Receivables Setup"	|	11319	|	 "Credit Memos"	|

### NO Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	740	|	"VAT Report Header"	|	10600	|	 "KID Number"	|
|	348	|	Dimension	|	10620	|	 "SAFT Analysis Type"	|
|	348	|	Dimension	|	10621	|	 "Export to SAFT"	|
|	81	|	"Gen. Journal Line"	|	10606	|	 "Source Curr. Inv.tax Amount"	|
|	81	|	"Gen. Journal Line"	|	10607	|	 "Source Curr. Inv.tax Base"	|
|	49	|	"Invoice Post. Buffer"	|	10604	|	 "VAT Code"	|
|	254	|	"VAT Entry"	|	10603	|	 "Add.-Curr. Inv.tax Amount"	|
|	254	|	"VAT Entry"	|	10604	|	 "Add.-Curr. Inv.tax Base"	|
|	325	|	"VAT Posting Setup"	|	10620	|	 "Sales SAFT Tax Code"	|
|	325	|	"VAT Posting Setup"	|	10621	|	 "Purchase SAFT Tax Code"	|
|	325	|	"VAT Posting Setup"	|	10622	|	 "Sales SAFT Standard Tax Code"	|
|	325	|	"VAT Posting Setup"	|	10623	|	 "Purch. SAFT Standard Tax Code"	|
|	230	|	"Source Code"	|	10620	|	 "SAFT Source Code"	|
|	79	|	"Company Information"	|	10620	|	 "SAFT Contact No."	|
|	10629	|	"SAFT Export File"	|	0	|	 *	|
|	10632	|	"SAFT Export Header"	|	0	|	 *	|
|	10633	|	"SAFT Export Line"	|	0	|	 *	|
|	10623	|	"SAFT Export Setup"	|	0	|	 *	|
|	10624	|	"SAFT G/L Account Mapping"	|	0	|	 *	|
|	10622	|	"SAFT Mapping"	|	0	|	 *	|
|	10621	|	"SAFT Mapping Category"	|	0	|	 *	|
|	10626	|	"SAFT Mapping Range"	|	0	|	 *	|
|	10627	|	"SAFT Mapping Source"	|	0	|	 *	|
|	10634	|	"SAFT Media Resource"	|	0	|	 *	|
|	10628	|	"SAFT Missing Field"	|	0	|	 *	|
|	10620	|	"SAFT Setup"	|	0	|	 *	|
|	10631	|	"SAFT Source Code"	|	0	|	 *	|
|	10602	|	"VAT Code"	|	7	|	 "VAT % For Reporting"	|
|	10602	|	"VAT Code"	|	8	|	 "Report VAT %"	|
|	15000004	|	"Waiting Journal"	|	10606	|	 "Source Curr. Inv.tax Amount"	|
|	15000004	|	"Waiting Journal"	|	10607	|	 "Source Curr. Inv.tax Base"	|
|	3010590	|	"Fin. Charge Interest Rate"	|	0	|	 *	|
|	303	|	"Finance Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	5	|	"Finance Charge Terms"	|	3010590	|	 "Multiple Lines Description"	|
|	305	|	"Issued Fin. Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	298	|	"Issued Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	296	|	"Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	15000200	|	"Payroll Integration Setup"	|	0	|	 *	|

### RU Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	242	|	"Source Code Setup"	|	12450	|	 "Item Receipt"	|
|	242	|	"Source Code Setup"	|	12451	|	 "Item Shipment"	|
|	307	|	"Inventory Buffer"	|	14900	|	 "CD No."	|
|	6507	|	"Item Entry Relation"	|	14900	|	 "CD No."	|
|	83	|	"Item Journal Line"	|	14900	|	 "CD No."	|
|	83	|	"Item Journal Line"	|	14901	|	 "New CD No."	|
|	32	|	"Item Ledger Entry"	|	12420	|	 "CD No."	|
|	313	|	"Inventory Setup"	|	12400	|	 "Item Receipt Nos."	|
|	313	|	"Inventory Setup"	|	12401	|	 "Posted Item Receipt Nos."	|
|	313	|	"Inventory Setup"	|	12402	|	 "Item Shipment Nos."	|
|	313	|	"Inventory Setup"	|	12403	|	 "Posted Item Shipment Nos."	|
|	313	|	"Inventory Setup"	|	12404	|	 "CD Header Nos."	|
|	313	|	"Inventory Setup"	|	12405	|	 "Posted Direct Transfer Nos."	|
|	12453	|	"Item Document Line"	|	5707	|	 "Product Group Code"	|
|	26560	|	"Requisite Expression Line"	|	0	|	*	|
|	26558	|	"Requisite Option Line"	|	0	|	*	|
|	26556	|	"Stat. Report Requisite"	|	0	|	*	|
|	26557	|	"Stat. Report Requisites Group"	|	0	|	*	|
|	26566	|	"Stat. Report Requisite Value"	|	0	|	*	|
|	26568	|	"Statutory Report Buffer"	|	2	|	 "Requisites Group Name"	|
|	26569	|	"Statutory Report Setup"	|	6	|	 "Group End Separator"	|
|	26569	|	"Statutory Report Setup"	|	7	|	 "Fragment End Separator"	|
|	26569	|	"Statutory Report Setup"	|	8	|	 "File End Separator"	|
|	26569	|	"Statutory Report Setup"	|	9	|	 "Reports Templates Folder Name"	|
|	26569	|	"Statutory Report Setup"	|	10	|	 "Excel Reports Folder Name"	|
|	26569	|	"Statutory Report Setup"	|	11	|	 "Electronic Files Folder Name"	|
|	210	|	"Job Journal Line"	|	14900	|	 "CD No."	|
|	169	|	"Job Ledger Entry"	|	14900	|	 "CD No."	|
|	1003	|	"Job Planning Line"	|	14900	|	 "CD No."	|
|	5773	|	"Registered Whse. Activity Line"	|	14900	|	 "CD No."	|
|	7319	|	"Posted Whse. Receipt Line"	|	14900	|	 "CD No."	|
|	7343	|	"Posted Invt. Pick Line"	|	14900	|	 "CD No."	|
|	7341	|	"Posted Invt. Put-away Line"	|	14900	|	 "CD No."	|
|	7345	|	"Registered Invt. Movement Line"	|	14900	|	 "CD No."	|
|	7311	|	"Warehouse Journal Line"	|	14900	|	 "CD No."	|
|	7311	|	"Warehouse Journal Line"	|	14901	|	 "New CD No."	|
|	7312	|	"Warehouse Entry"	|	14900	|	 "CD No."	|
|	6509	|	"Whse. Item Entry Relation"	|	14900	|	 "CD No."	|
|	6550	|	"Whse. Item Tracking Line"	|	14900	|	 "CD No."	|
|	6550	|	"Whse. Item Tracking Line"	|	14901	|	 "New CD No."	|

### SE Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	252	|	"General Posting Setup"	|	11200	|	 "Inward Reg. Bridging Account"	|
|	242	|	"Source Code Setup"	|	11200	|	 "Inward Registration"	|
|	3010590	|	"Fin. Charge Interest Rate"	|	0	|	 *	|
|	11202	|	"Inward Reg. Entry"	|	0	|	 *	|
|	11200	|	"Inward Reg. Header"	|	0	|	 *	|
|	11201	|	"Inward Reg. Line"	|	0	|	 *	|
|	312	|	"Purchases & Payables Setup"	|	11200	|	 "Inward Reg. Nos."	|
|	312	|	"Purchases & Payables Setup"	|	11201	|	 "Inward Posting Description"	|
|	312	|	"Purchases & Payables Setup"	|	11202	|	 "Reverse Posting Description"	|
|	312	|	"Purchases & Payables Setup"	|	11204	|	 "Latest Return Date Calc."	|
|	312	|	"Purchases & Payables Setup"	|	11205	|	 "Accumulated Inward Reg. Lines"	|
|	312	|	"Purchases & Payables Setup"	|	11206	|	 "Def. Inward Reg. Prod. Post Gr"	|
|	312	|	"Purchases & Payables Setup"	|	11207	|	 "Copy Dimensions to Inward Reg."	|
|	93	|	"Vendor Posting Group"	|	11200	|	 "Inward Reg. Bridging Debt"	|
|	303	|	"Finance Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	305	|	"Issued Fin. Charge Memo Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	298	|	"Issued Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|
|	296	|	"Reminder Line"	|	3010590	|	 "Multiple Interest Rates Entry"	|

### Deleted fields from table extension objects in Base Apps

#### APAC Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
| 28160	| SourcecodeAPAC	| Source Code	| 28160	| Simulation |

#### BE Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
| 11309	| "Service Line BE"	| "Service Line"	| 11302	| "Pmt. Discount Amount (Old)" |
| 11300	| "Service Header BE"	| "Service Header"	| 11300	| "Journal Template Name" |
| 11306	| "Service Mgt. Setup BE"	| "Service Mgt. Setup"	| 0	| * |

#### CZ Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------|  
|	11800	|	"Service Contract Header CZ"	|	Service Contract Header	|	11792	|	 "Original User ID"	|
|	11801	|	"Service Header CZ"	|	Service Header	|	0	|	 *	|
|	11802	|	"Service Line CZ"	|	Service Line	|	0	|	 *	|
|	11803	|	"Service Cr.Memo Header CZ"	|	Service Cr.Memo Header	|	0	|	 *	|
|	11804	|	"Service Cr.Memo Line CZ"	|	Service Cr.Memo Line	|	11762	|	 "Reason Code"	|
|	11805	|	"Service Cr.Memo Line CZ"	|	Service Cr.Memo Line	|	31061	|	 "Tariff No."	|
|	11806	|	"Service Cr.Memo Line CZ"	|	Service Cr.Memo Line	|	31062	|	 "Statistic Indication"	|
|	11807	|	"Service Cr.Memo Line CZ"	|	Service Cr.Memo Line	|	31063	|	 "Country/Region of Origin Code"	|
|	11805	|	"Service Invoice Header CZ"	|	Service Invoice Header	|	0	|	 *	|
|	11806	|	"Service Invoice Line CZ"	|	Service Invoice Line	|	11762	|	 "Reason Code"	|
|	11807	|	"Service Invoice Line CZ"	|	Service Invoice Line	|	31061	|	 "Tariff No."	|
|	11808	|	"Service Invoice Line CZ"	|	Service Invoice Line	|	31062	|	 "Statistic Indication"	|
|	11809	|	"Service Invoice Line CZ"	|	Service Invoice Line	|	31063	|	 "Country/Region of Origin Code"	|
|	11807	|	"Service Shipment Header CZ"	|	Service Shipment Header	|	0	|	 *	|
|	11808	|	"Service Shipment Line CZ"	|	Service Shipment Line	|	0	|	 *	|
|	11809	|	"Service Mgt. Setup CZ"	|	Service Mgt. Setup	|	0	|	 *	|
|	 11804	|	"Service Cr.Memo Line CZ" 	|	 "Service Cr.Memo Line"	|	0	|	 *	|
|	 11806 	|	"Service Invoice Line CZ" 	|	 "Service Invoice Line"	|	0	|	 *	|
|	11810	|	"Location CZ"	|	Location	|	31070	|	 "Area"	|

#### DK Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
|	 13663	|	"Bank Acc. Reconciliation DK" 	|	 "Bank Acc. Reconciliation"	|	0	|	 *	|
|	 13664	|	"Bank Acc. Recon. Line DK" 	|	 "Bank Acc. Reconciliation Line"	|	0	|	 *	|
|	 13665	|	"Bank Statement Match Buffer DK" 	|	 "Bank Statement Matching Buffer"	|	0	|	 *	|
|	 13666	|	"Company Information DK" 	|	 "Company Information"	|	0	|	 *	|
|	 13667	|	"Country/Region DK" 	|	 "Country/Region"	|	0	|	 *	|
|	 13670	|	"Finance Charge Memo Header DK" 	|	 "Finance Charge Memo Header"	|	0	|	 *	|
|	 13671	|	"Finance Charge Memo Line DK" 	|	 "Finance Charge Memo Line"	|	0	|	 *	|
|	 13672	|	"Gen. Journal Line DK" 	|	 "Gen. Journal Line"	|	0	|	 *	|
|	 13673	|	"Issued Fin.Ch.Memo Header DK" 	|	 "Issued Fin. Charge Memo Header"	|	0	|	 *	|
|	 13674	|	"Issued Fin.Ch. Memo Line DK" 	|	 "Issued Fin. Charge Memo Line"	|	0	|	 *	|
|	 13675	|	"Issued Reminder Header DK" 	|	 "Issued Reminder Header"	|	0	|	 *	|
|	 13676	|	"Issued Reminder Line DK" 	|	 "Issued Reminder Line"	|	0	|	 *	|
|	 13702	|	"Item Charge DK" 	|	 "Item Charge"	|	0	|	 *	|
|	 13701	|	"Payment Export Data DK" 	|	 "Payment Export Data"	|	0	|	 *	|
|	 13677	|	"Payment Method DK" 	|	 "Payment Method"	|	0	|	 *	|
|	 13678	|	"Payment Terms DK" 	|	 "Payment Terms"	|	0	|	 *	|
|	 13679	|	"Purchase Header DK" 	|	 "Purchase Header"	|	0	|	 *	|
|	 13680	|	"Purch. Inv. Header DK" 	|	 "Purch. Inv. Header"	|	0	|	 *	|
|	 13681	|	"Reminder Header DK" 	|	 "Reminder Header"	|	0	|	 *	|
|	 13682	|	"Reminder Line DK" 	|	 "Reminder Line"	|	0	|	 *	|
|	 13683	|	"Sales Cr.Memo Header DK" 	|	 "Sales Cr.Memo Header"	|	0	|	 *	|
|	 13684	|	"Sales Cr.Memo Line DK" 	|	 "Sales Cr.Memo Line"	|	0	|	 *	|
|	 13685	|	"Sales Header Archive DK" 	|	 "Sales Header Archive"	|	0	|	 *	|
|	 13686	|	"Sales Header DK" 	|	 "Sales Header"	|	0	|	 *	|
|	 13687	|	"Sales Invoice Header DK" 	|	 "Sales Invoice Header"	|	0	|	 *	|
|	 13688	|	"Sales Invoice Line DK" 	|	 "Sales Invoice Line"	|	0	|	 *	|
|	 13689	|	"Sales Line Archive DK" 	|	 "Sales Line Archive"	|	0	|	 *	|
|	 13690	|	"Sales Line DK" 	|	 "Sales Line"	|	0	|	 *	|
|	 13691	|	"Sales & Receivables Setup DK" 	|	 "Sales & Receivables Setup"	|	0	|	 *	|
|	 13692	|	"Service Cr.Memo Header DK" 	|	 "Service Cr.Memo Header"	|	0	|	 *	|
|	 13693	|	"Service Cr.Memo Line DK" 	|	 "Service Cr.Memo Line"	|	0	|	 *	|
|	 13694	|	"Service Header DK" 	|	 "Service Header"	|	0	|	 *	|
|	 13695	|	"Service Invoice Header DK" 	|	 "Service Invoice Header"	|	0	|	 *	|
|	 13696	|	"Service Invoice Line DK" 	|	 "Service Invoice Line"	|	0	|	 *	|
|	 13697	|	"Service Line DK" 	|	 "Service Line"	|	0	|	 *	|
|	 13698	|	"Service Mgt. Setup DK" 	|	 "Service Mgt. Setup"	|	0	|	 *	|
|	 13700	|	"Vendor Ledger Entry DK" 	|	 "Vendor Ledger Entry"	|	0	|	 *	|
|	 13668 	|	"Currency DK" 	|	 Currency	|	13600	|	 "OIOUBL Currency Code"	|
|	 13669	|	"Customer DK" 	|	 Customer	|	13600	|	 "EAN No."	|
|	 13670	|	"Customer DK" 	|	 Customer	|	13601	|	 "Account Code"	|
|	 13671	|	"Customer DK" 	|	 Customer	|	13604	|	 "OIOUBL Profile Code"	|
|	 13672	|	"Customer DK" 	|	 Customer	|	13605	|	 "OIOUBL Profile Code Required"	|
|	 13699	|	"Vendor DK" 	|	 Vendor	|	13650	|	 "Giro Acc. No."	|

#### NO Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
| 15000290	| "Printer Selection Extension"	|  "Printer Selection"	| 0	| * |

#### RU Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
|	 14953	|	"Entry Summary RU" 	|	 "Entry Summary"	|	0	|	*	|
|	 14954	|	 "Inventory Profile RU" 	|	 "Inventory Profile"	|	0	|	*	|
|	 14955	|	"Item Tracing Buffer RU" 	|	 "Item Tracing Buffer"	|	0	|	*	|
|	 14956	|	"Item Tracing History Buffer RU" 	|	 "Item Tracing History Buffer"	|	0	|	*	|
|	 14957	|	"Item Tracking Code RU" 	|	 "Item Tracking Code"	|	0	|	*	|
|	 14952	|	"Item Tracking Setup RU" 	|	 "Item Tracking Setup"	|	0	|	*	|
|	 14958	|	"Package No. Information RU" 	|	 "Package No. Information"	|	9	|	 "CD Header No."	|
|	 14959	|	"Package No. Information RU" 	|	 "Package No. Information"	|	11	|	 "Temporary CD No."	|
|	 14950	|	 "Reservation Entry RU" 	|	 "Reservation Entry"	|	0	|	*	|
|	 14951	|	"Tracking Specification RU" 	|	 "Tracking Specification"	|	0	|	*	|
|	 12400	|	"Record Buffer RU" 	|	 "Record Buffer"	|	0	|	*	|

## Deleted table and field objects in the Apps folder

### W1 Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	 4511 	|	"SMTP Account"	|	4	|	 Authentication	|
|	 1086 	|	"MS - Wallet Charge"	|	0	|	 *	|
|	 1080 	|	"MS - Wallet Merchant Account"	|	0	|	 *	|
|	 1081 	|	"MS - Wallet Merchant Template"	|	0	|	 *	|
|	 1085 	|	"MS - Wallet Payment"	|	0	|	 *	|
|	 2751 	|	"Universal Printer Settings"	|	12	|	 outputBin	|
|	 30102 	|	"Shpfy Shop"	|	100	|	 "Collection Last Export Version"	|
|	 30102 	|	"Shpfy Shop"	|	101	|	 "Collection Last Import Version"	|
|	 30102 	|	"Shpfy Shop"	|	102	|	 "Product Last Export Version"	|
|	 30102 	|	"Shpfy Shop"	|	103	|	 "Product Last Import Version"	|
|	 30106 	|	"Shpfy Customer Address"	|	101	|	 "Ship-To Address SystemId"	|
|	 30136 	|	"Shpfy Registered Store	|	0	|	 *	|

### CA Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 4046 | "Stg Data Exch Def CA"	| 0	| * |

### CH Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 11512 | "Swiss QR-Bill Setup"	| 2	| "Swiss-Cross Image" |

### CZ Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	 31003 	|	"Advance Letter Template CZZ"	|	15	|	 "Document Report ID"	|
|	 31003 	|	"Advance Letter Template CZZ"	|	16	|	 "Document Report Caption"	|
|	 31003 	|	"Advance Letter Template CZZ"	|	18	|	 "Invoice/Cr. Memo Report ID"	|
|	 31003 	|	"Advance Letter Template CZZ"	|	19	|	 "Invoice/Cr. Memo Rep. Caption"	|
|	 31092 	|	"Acc. Schedule Extension CZL"	|	17	|	 Prepayment	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31060	|	 "Additional Costs"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31061	|	 "Source Entry Date"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31062	|	 "Statistic Indication"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31063	|	 "Statistics Period"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31065	|	 "Declaration No."	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31066	|	 "Statement Type"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31067	|	 "Prev. Declaration No."	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31068	|	 "Prev. Declaration Line No."	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31070	|	 "Specific Movement"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31071	|	 "Supplem. UoM Code"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31072	|	 "Supplem. UoM Quantity"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31073	|	 "Supplem. UoM Net Weight"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	31074	|	 "Base Unit of Measure"	|
|	 11714 	|	"Stg Item Journal Line"	|	11763	|	 "G/L Correction"	|
|	 11714 	|	"Stg Item Journal Line"	|	11791	|	 "Source No. 3"	|
|	 11714 	|	"Stg Item Journal Line"	|	31061	|	 "Tariff No."	|
|	 11714 	|	"Stg Item Journal Line"	|	31063	|	 "Physical Transfer"	|
|	 11714 	|	"Stg Item Journal Line"	|	31066	|	 "Net Weight"	|
|	 11714 	|	"Stg Item Journal Line"	|	31069	|	 "Incl. in Intrastat Stat. Value"	|
|	 11714 	|	"Stg Item Journal Line"	|	31070	|	 "Incl. in Intrastat Amount"	|
|	 11714 	|	"Stg Item Journal Line"	|	31071	|	 "Country/Region of Origin Code"	|
|	 11714 	|	"Stg Item Journal Line"	|	31072	|	 "Statistic Indication"	|
|	 11714 	|	"Stg Item Journal Line"	|	31074	|	 "Currency Code"	|
|	 11714 	|	"Stg Item Journal Line"	|	31075	|	 "Currency Factor"	|
|	 11714 	|	"Stg Item Journal Line"	|	31076	|	 "Intrastat Transaction"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	11790	|	 "Source No. 2"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	11791	|	 "Source No. 3"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	11793	|	 "Source Code"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	11794	|	 "Reason Code"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	11795	|	 "User ID"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31061	|	 "Tariff No."	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31062	|	 "Statistic Indication"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31063	|	 "Physical Transfer"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31066	|	 "Net Weight"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31068	|	 "Country/Region of Origin Code"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31074	|	 "Currency Code"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31075	|	 "Currency Factor"	|
|	 11715 	|	"Stg Item Ledger Entry"	|	31076	|	 "Intrastat Transaction"	|
|	 11716 	|	"Stg Intrastat Jnl. Line"	|	0	|	 *	|
|	 11714 	|	"Stg Item Journal Line"	|	0	|	 *	|
|	 11715 	|	"Stg Item Ledger Entry"	|	0	|	 *	|
|	 11717 	|	"Stg VAT Control Report Line"	|	0	|	 *	|
|	 11700 	|	"Stg VAT Posting Setup"	|	0	|	 *	|

### DE Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 11021 |	"Sales VAT Advance Notif."	| 9	 | "XSL-Filename" |
| 11021 |	"Sales VAT Advance Notif."	| 10	| "XSD-Filename" |

### ES Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 4034 | "Stg Report Selections"	| 0	| * |
| 4033 | "Stg SII Setup"	| 0	| * |

### NO Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 10682 |	"SAF-T Export Header"	| 20	| "SAF-T File" |
| 10670 |	"SAF-T Setup"	| 2	| "Dimension No. Series Code" |
| 4043 |	"Stg Data Exch Def US" | 0	| * |

### MX Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
| 4045 | "Stg Data Exch Def MX"	| 0	| * |

### Deleted fields from table extension objects from the Apps folder  

#### CZ Base App

|Table Extension ID |Table Extension Name | Source Table Name | Field ID |Field Name |
|-------|--------------------------------|---------------|---------------|------------------------------| 
| 11715	| Purchases & Payables Setup CZL | "Purchases & Payables Setup"	| 11781	| "Allow Alter Posting Groups" |
| 11714	| Sales & Receivables Setup CZL	| "Sales & Receivables Setup"	| 11781	| "Allow Alter Posting Groups" |
| 11780	| Service Mgt. Setup CZL | "Service Mgt. Setup"	| 11781	| "Allow Alter Posting Groups CZL" |

## Deleted objects in the BC Apps   

### NO Base App

|Table ID |Table Name |Field ID |Field Name |
|-------|---------------------------------|---------------|------------------------------| 
|	1470	|	"Product Video Buffer"	|	4	|	"Assisted Setup ID"	|
|	1470	|	"Product Video Buffer"	|	5	|	Indentation	|
|	9173	|	"Extra Settings"	|	*	|	*	|
|	2888	|	"SmartList Designer Handler"	|	*	|	*	|
|	2889	|	"Query Navigation Validation"	|	*	|	*	|
|	1432	|	"Net Promoter Score Setup"	|	4	|	"Time Between Requests"	|
|	3700	|	"Manual Setup"	|	*	|	*	|
|	1876	|	"Business Setup Icon"	|	*	|	*	|
|	1471	|	"Product Video Category"	|	*	|	*	|
|	1807	|	"Assisted Setup Log"	|	*	|	*	|
|	1810	|	"Assisted Setup Icons"	|	*	|	*	|
|	1803	|	"Assisted Setup"	|	*	|	*	|
|	1808	|	"Aggregated Assisted Setup"	|	*	|	*	|
|	8904	|	"Email Message Attachment"	|	3	|	Attachment	|

### Deleted fields from table extension objects in the BCApps GitHub repo 

| Table Extension ID | Table Extension Name | Source Table Name | Field ID | Field Name |
|-------|-------------------------------|-----------------------|-----------|---------------------------| 
|	308	|	NoSeriesObsolete	        |	"No. Series"        |   11790	|    Mask                   |                             
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11200	|	"Inward Registration"	|
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11760	|	"Purchase VAT Delay"	|
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11761	|	"Sales VAT Delay"	    |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11762	|	"VAT Coefficient"	    |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11764	|	"Close Balance Sheet"	|
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11765	|	"Open Balance Sheet"	|
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	11766	|	"Cash Desk"	            |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	12450	|	"Item Receipt"	        |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	12451	|	"Item Shipment"	        |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	31041	|	"Maintenance Adjustment" |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	31050	|	Credit	                |
|	242	|	ObsoleteSourceCodeSetupExt	|	"Source Code Setup"	|	5005350	|	"Phys. Invt. Order"	    |
|	230	|	ObsoleteSourceCodeExt	    |	"Source Code"	    |	10620	|	"SAFT Source Code"	    |

## Related information

[Deprecated Features in the Platform - Clients, Server, and Database](deprecated-features-platform.md)  
[Best Practices for Deprecation of Code in the Base App](../developer/devenv-deprecation-guidelines.md)  
[Microsoft Timeline for Deprecating Code in Business Central](../developer/devenv-deprecation-timeline.md)  
