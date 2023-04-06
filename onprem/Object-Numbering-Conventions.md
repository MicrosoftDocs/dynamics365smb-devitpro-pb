---
title: Object Numbering Conventions in Dynamics NAV
description: In Dynamics NAV development environment, the numbering scheme for each object and field is identified by a number stored in its ID Property.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d6add43c-5e40-4a6d-9de9-27f5b09f2eeb
caps.latest.revision: 14
---
# Object and Field Numbering Conventions
Each object and field in [!INCLUDE[navnow](includes/navnow_md.md)] is identified by a number that is stored in its [ID Property](ID-Property.md). This topic describes the numbering scheme for the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. Numbering conventions that are used in the [!INCLUDE[demolong](includes/demolong_md.md)] and guidelines for objects and fields that are outside the demo range are described.  
  
## The Numbering System  
 The objects ranges in [!INCLUDE[navnow](includes/navnow_md.md)] are described in the following table.  
  
|Object number interval|Description|  
|----------------------------|-----------------|  
|1 - 9,999|[!INCLUDE[demolong](includes/demolong_md.md)] design area|  
|10,000 - 49,999|Country/region design area|  
|50,000 - 99,999|Customer design area|  
|100,000 - 999,999,999|Microsoft Certified Partner design area|  
  
> [!NOTE]  
>  Do not use the object numbers 99,000 - 99,999 for objects that you create, even though they are in the customer design area. The training material for [!INCLUDE[navnow](includes/navnow_md.md)] uses these numbers.  
  
 The fields in [!INCLUDE[navnow](includes/navnow_md.md)] are grouped as indicated in the following table.  
  
|Table number|Field numbers|Description|  
|------------------|-------------------|-----------------|  
|1 - 9,999|1 - 9999|[!INCLUDE[demolong](includes/demolong_md.md)] design area|  
|1 - 9,999|10,000 - 49,000|Country/region design area|  
|1 - 9,999|50,0000 - 99,999|Customer design area|  
|1 - 9,999|100,000 - 999,999,999|Microsoft Certified Partner design area|  
|10,000 - 49,999|1 - 49,999|Country/region design area|  
|10,000 - 49,999|50,000 - 99,999|Customer design area|  
|10,000 - 49,999|100,000 - 999,999,999|Microsoft Certified Partner design area|  
|50,000 - 99,999|1 - 999,999,999|Customer design area|  
|100,000 - 99,999,999|1 - 9,999|Microsoft Certified Partner design area|  
|100,000 - 99,999,999|10,000 - 49,999|Country/region design area|  
|100,000 - 99,999,999|50,000 - 99,999|Customer design area|  
|100,000 - 99,999,999|100,000 - 999,999,999|Microsoft Certified Partner design area|  
  
> [!NOTE]  
>  Do not use the field numbers 99,000–99,999 in tables numbered between 1 and 49,999 for fields that you create, even though they lie in the customer design area. The training material for [!INCLUDE[navnow](includes/navnow_md.md)] uses these numbers.  
  
 When a Microsoft Certified Partner buys the insert permissions for a table number interval, such as 200,000–200,099, the partner also gets insert permissions for the same number interval \(200,000–200,099\) for fields in all other tables. If you create a table in the range for which you have insert permissions, then you can create fields in all field number intervals in the table. However, we recommend that you use only the field numbers that are in the same number interval as the table number interval so that fields in solutions from different partners do not interfere with each other.  
  
## Objects  
 The numbering conventions for objects depend on the object type. Conventions for the following types are described in the following sections:  
  
-   Tables  
  
-   Pages  
  
-   Reports  
  
-   Codeunits  
  
### Tables  
 Table object numbers are not divided into intervals in the [!INCLUDE[demolong](includes/demolong_md.md)]. Use the first available object number when you create a table. Try to group related tables together.  
  
### Pages  
 Page object numbers are not divided into intervals in the [!INCLUDE[demolong](includes/demolong_md.md)]. Use the first available object number when you create a page. Try to group related pages together.  
  
### Reports  
 Report objects are numbered in intervals in the [!INCLUDE[demolong](includes/demolong_md.md)]. The following table displays the interval for each application area.  
  
|Report number interval|Application areas|  
|----------------------------|-----------------------|  
|1 - 99|General Ledger, including VAT and Consolidation|  
|100 - 199|Accounts Receivable|  
|200 - 299|Sales|  
|300 - 399|Accounts Payable|  
|400 - 499|Purchases|  
|500 - 599|Common to both Purchases and Sales, including Exchange Rate|  
|600 - 699|Requisition|  
|700 - 799|Item, including Intrastat|  
|800 - 899|Bill of Materials|  
|900 - 999|Item Group|  
|1000 - 1099|Inventory \(common to Item, BOM, and Item Group\)|  
|1100 - 1199|Resource|  
|1200 - 1299|Job|  
|1300 - 1399|General|  
|1400 - 9899|Future areas|  
|9900 - 9999|Utilities|  
  
 If you create a new report that does not belong in one of the existing application areas or if you create a new report and the area in which it belongs is full, then use a number from a new interval of length 100 and between 1,400 and 9,899.  
  
 If a report object can be printed, then it is called a report. Otherwise, it is called a batch job. Reports are numbered starting at the lower end of the interval. Batch jobs are numbered starting at the higher end of the interval with decreasing numbers.  
  
 We recommend that you number reports that are almost identical in the application areas with the same two final digits even if the report name is different. For example, the **Sales Invoice** report in the [!INCLUDE[demolong](includes/demolong_md.md)] is number 206 and the **Purchase Invoice** report is number 406. Other examples are the date compression batch jobs for ledger entry tables, which always end with 98, and date compressions for budget entries, which always end with 97. This practice may cause gaps in the numbering sequence, but it helps the developer when adjustments to similar reports in the application are needed.  
  
### Codeunits  
 Codeunit object numbers are not divided into intervals in the [!INCLUDE[demolong](includes/demolong_md.md)]. Use the first available object number when you create a codeunit. Try to group related codeunits together.  
  
 The journal posting codeunits follow a pattern that makes it easier to understand a new journal after you are familiar with one group of journal posting codeunits.  
  
 A group consists of two parts:  
  
-   Codeunits in the first part post a journal.  
  
-   Codeunits in the second part manage the journals.  
  
|Codeunit final digit|Journal posting codeunits|  
|--------------------------|-------------------------------|  
|1|Journal Line-Check|  
|2|Journal Line-Post|  
|3|Batch Name-Post|  
  
|Codeunit final digit|Journal managing codeunits|  
|--------------------------|--------------------------------|  
|0|Journal-Management|  
|1|Journal-Post|  
|2|Journal-Post+Print|  
|3|Journal-Batch Post|  
|4|Journal-Batch Post+Print|  
|5|Register-Show Ledger|  
  
 Codeunits for posting invoices also follow a pattern, which is displayed in the following table.  
  
|Codeunit final digit|Sales/Purchase Posting Codeunits|  
|--------------------------|---------------------------------------|  
|0|Sales/Purchase Post|  
|1|Sales/Purchase Post \(Yes/No\)|  
|2|Sales/Purchase Post+Print|  
  
 When you create codeunits for the sales application areas, use the same final digit for similar purchase application areas.  
  
## Table Fields  
 When you assign numbers to new fields in a table, consider whether the table is associated with other related tables. If so, then you may want to also add the fields to these related tables. In this case, the field must have the same field number in all tables. For example, if you add a new field to the **Customer** table but do not add the field to the **Vendor** table, then you still must reserve that field number in the **Vendor** table for the new field from the **Customer** table. It is easier to maintain the application when the tables look very similar.  
  
 Examples of associated tables are as follows:  
  
-   Customer and Vendor tables  
  
-   Journal template tables  
  
-   Batch name tables  
  
-   Journal line tables  
  
-   Sales Header, Sales Shipment Header, Sales Invoice Header, and Sales Credit Memo Header tables  
  
-   Purchase Line, Purchase Receipt Line, Purchase Invoice Line and Purchase Credit Memo Line tables  
  
 When you create a new independent table, do not leave gaps in the field numbers.  
  
## See Also  
 [Naming Conventions](Naming-Conventions.md)   
 [Number Ranges for Text Constants](Number-Ranges-for-Text-Constants.md)
