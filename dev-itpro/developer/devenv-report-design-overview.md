---
title: Report Design Overview
description: Design a report by defining the dataset and designing the layout. Report object composes dataset, layout, request page, properties, triggers and code.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/19/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Report Design Overview
Designing a report is composed of the following items:  

-   Report object

-   Report dataset

-   Report layout

-   Request page

-   Properties, triggers and code 

You design a report by first defining the dataset, and then designing the visual layout.  

## Report object  

You create report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to define the data model, or dataset of a report. You can structure and summarize information in a report and print documents, such as sales quotes and invoices. For more information, see [Report Object](devenv-report-object.md).  

### Report dataset

In order to define the underlying data model, you use the report dataset. A report dataset determines the data that is extracted or calculated from the [!INCLUDE[d365fine_long_md](includes/d365fin_long_md.md)] database tables that can be used in a report. You build the report dataset by adding data items and columns. For more information, see [Report Dataset](devenv-report-dataset.md). 

## Report layouts  
The visual layout determines the content and format of a report when it is viewed and printed. You build the layout of a report by arranging data items and columns and specifying the general format, such as text font and size. A report that is viewed, printed, or saved from a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] client must have a report layout. There are two types of report layouts: client report definition \(RDL\) layouts and Word layouts.  

### RDL report layout 
To create an RDL layout report, you use Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder. For more information, see [Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md).  

### Word report layout  
You create Word layouts by using a Word Document. Word layouts are based on a Word document that includes a custom XML parts that represents the report dataset. For more information, see [Creating a Word Layout Report](devenv-howto-report-layout.md).  


## See Also  
[Reports](devenv-reports.md)   
[Report Object](devenv-report-object.md)  
[Report Data Type](datatypes/devenv-report-data-type.md) 


