---
title: Report Design Overview
description: Design a report by defining the dataset and designing the layout. Report object composes of dataset, layout, request page, properties, triggers and code.
ms.custom: na
ms.date: 10/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 20c17d9c-7d7a-49d8-b6e2-7fc011635926
caps.latest.revision: 24
manager: edupont
---
# Overview of Report Design in Dynamcis NAV
A report object is composed of a the following items:  

-   Report dataset.  

-   Report layout.  

-   Request page.  

-   Properties, triggers and code.  

 You design a report by first defining the dataset, and then designing the visual layout.  

## Report Dataset  
 You use Report Dataset Designer in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to define the dataset of a report. The dataset determines the data that is extracted or calculated from the [!INCLUDE[navnow](includes/navnow_md.md)] database tables that can be used in a report. You build the report dataset by adding data items and columns. Typically, data items and columns correspond to fields in a table. When the report is run, each data item is iterated for all records in the underlying table. Filters are applied and the dataset is created.  

 For more information, see [Defining the Report Dataset](Defining-the-Report-Dataset.md).  

## Report Layout  
 The visual layout determines the content and format of a report when it is viewed and printed. You build the layout of a report by arranging data items and columns and specifying the general format, such as text font and size. A report that is viewed, printed, or saved from a [!INCLUDE[navnow](includes/navnow_md.md)] client must have a report layout. There are two types of report layouts: client report definition \(RDLC\) layouts and Word layouts. layouts.  

### RDLC Report Layouts  
 To create an RDLC layout, you use Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder. For more information, see [Designing RDLC Report Layouts](Designing-RDLC-Report-Layouts.md).  

### Word Report Layouts  
 You create Word layouts by using Word 2013. Word layouts are based a Word document that includes a custom XML parts that represents the report dataset. For more information, see [Designing Word Report Layouts](Designing-Word-Report-Layouts.md).  

## See Also  
 [Reports](Reports.md)   
 [Designing Reports](Designing-Reports.md)   
 [Report Triggers](Report-Triggers.md)   
 [Request Pages](Request-Pages.md)   
 [Report Data Type](Report-Data-Type.md)
