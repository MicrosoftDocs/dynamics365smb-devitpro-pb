---
title: Reports Overview
description: Use reports to display information from database to structure and summarize information and print documents, such as invoices in Dynamics NAV. 
ms.custom: na
ms.date: 10/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8c0412c2-3750-4681-b8b0-fa00d2a9fea2
caps.latest.revision: 36
manager: edupont
---
# Overview of Reports in Dynamics NAV
You can use reports to print or display information from a database. You can use a report to structure and summarize information and to print documents, such as invoices. For example, you can create a report that lists all customers and all orders that have been added by each customer. You can also create a report that is automatically filled with the relevant information for an invoice.  

 You can also use reports to process data without printing or displaying content. For example, you can use a report to automate updating all prices in an item list. It can be easier to create a report to process data instead of a codeunit to do the same processing because you can use:  

-   Request page functionality to select options and filters for data items, which are available in a report but are difficult to add to a codeunit.  

-   Report data items instead of writing code to open tables and retrieve records.  

-   Data modeling, which is available when you design reports.  


## Creating reports
 Creating a report involves two primary tasks. First you design the data model, or dataset, by using Report Dataset Designer. The dataset determines the data that is extracted or calculated from the [!INCLUDE[navnow](includes/navnow_md.md)] database tables that can be used in a report. After the dataset has been designed, you design the visual layout of the report. There are two types of report layouts that you can create: client report definition \(RDLC\) report layouts and Word report layouts. You create RDLC report layouts by using Visual Studio Report Designer or SQL Server Report Builder. You create Word report layouts by using Microsoft Word 2013.  

## Getting started
 The following table includes links to information to help you get started designing reports.  

|To|See|  
|--------|---------|  
|Understand the difference between designing a data model for a report and designing the layout for a report.|[Report Design Overview](Report-Design-Overview.md)|  
|Understand the different types of reports.|[Types of Reports](Types-of-Reports.md)|  
|Learn how to design reports.|[Designing Reports](Designing-Reports.md)|  
|Learn the system requirements for [!INCLUDE[navnowlong](includes/navnowlong_md.md)] reports.|[System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md)|  
|Upgrade a [!INCLUDE[nav2009](includes/nav2009_md.md)] report to a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] report.|[Upgrading Reports from Earlier Versions](Upgrading-Reports-from-Earlier-Versions.md)|  
|Add a report to the ribbon in the [!INCLUDE[rtc](includes/rtc_md.md)].|[How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md)|  
|Learn about the different ways to run a specific report.|[How to: Run Reports](How-to--Run-Reports.md)<br /><br /> [Printing Reports](Printing-Reports.md)|  
|Learn about report triggers and when they are called during report processing.|[Report Triggers](Report-Triggers.md)|  
|Learn about how to design request pages for reports.|[Request Pages](Request-Pages.md)|  
|Step through detailed examples of creating reports|[Report Design Walkthroughs](Report-Design-Walkthroughs.md)|  
|Use Visual Studio Report Designer to design the layouts of reports|[Report Designer](http://go.microsoft.com/fwlink/?LinkId=128245)|  

## See Also  
 [Objects](Objects.md)
