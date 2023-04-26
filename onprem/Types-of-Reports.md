---
title: "Types of Reports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9aa90fac-bf11-4f5a-867d-e0fea847c9c3
caps.latest.revision: 13
---
# Types of Reports
This topic describes the types of reports that are available in [!INCLUDE[navnow](includes/navnow_md.md)].  

## List Reports  
 A *list report* contains a single data item that corresponds to the table that is listed. The table can be either a master table or a supplemental table. Each column contains a field from the table. The data is printed from that table, instead of from other tables or calculated from other tables. The name of the report is usually the name of the table followed by the word "List". The following are examples of list reports:  

-   Customer - List  

-   Insurance - List  

-   Vendor - List  

## Test Reports  
 A *test report* is a report that is printed from a journal table. Its purpose is to test each line in the journal according to the same criteria that will be used for posting. You can use test reports to find and fix any errors that exist before the lines are posted. This is useful because if an error is found during posting, processing stops and the error must be fixed before posting can be resumed. The name of the report is usually the name of the corresponding journal page followed by the word "Test". The following are examples of test reports:  

-   General Journal - Test  

-   Resource Journal - Test  

## Posting Reports  
 A *posting report* can be printed as part of the "post and print" option on a journal. This report is printed from the register and has the same name as that register. It lists all the transactions, that is, ledger entries, which have been posted into that register. The following are examples of posting reports:  

-   G/L Register  

-   Vendor Register  

## Transaction Reports  
 A *transaction report* contains two data items. The first data item is a master table, and the second data item is the corresponding ledger table. Usually, a transaction report lists all of the ledger entries for each record in the ledger table. There is a subtotal for each master table record, and a grand total for all the tables that are printed.  

 This type of report is used to view all the transactions for a particular master record. There is no standard name for this kind of report. The following are examples of transaction reports:  

-   Trial Balance  

-   Vendor - Trial Balance  

## Document Reports  
 *Document reports* differ from other reports, in that, many of the fields are not displayed in columns. An example of a document report is an invoice, where the header information is printed as if filling out an invoice document and this information is repeated at the top of each page. No page contains information from more than one header. The lines for the invoice are printed like a standard report in rows and columns. The lines correspond to the header on the same page, and lines from different invoices are not displayed on the same page. The following are examples of document reports:  

-   Sales - Invoice  

-   Purchase - Invoice  

## Processing-Only Reports  
 *Processing-only reports* only do processing. They do not output or print a report. You use the [ProcessingOnly Property](ProcessingOnly-Property.md) of the report to make the report a non-printing report. You can use the request page and let the user filter data before you run the report and begin the processing.  

## Other Reports  
 Reports are more loosely defined than other application objects because they are often customized for a particular client. However, most reports consist of a tabular list that has records listed horizontally and each field displaying in its own column. There is often a group heading or total to split the lines among various categories and subtotal the lines according to the categories. The following are examples of other reports:  

-   Vendor Item Catalog  

-   Customer/Item Sales  

## See Also  
 [Reports](Reports.md)
