---
title: Report Design Overview
description: Design a report by defining the dataset and designing the layout. Report object is composed of dataset, layout, request page, properties, triggers and code.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Report Design Overview

A report is composed of the following items:  

- A report object
- A report dataset
- A report layout
- A request page
- Properties, triggers, and code 

You design a report by first defining the dataset, and then designing the visual layout.  

## Report object  

You create a report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to define the data model, or dataset of a report. You can structure and summarize information in a report and print documents, such as sales quotes and invoices. For more information, see [Report Object](devenv-report-object.md).  

### Report dataset

In order to define the underlying data model, you use the report dataset. A report dataset determines the data that is extracted or calculated from the [!INCLUDE[d365fine_long_md](includes/d365fin_long_md.md)] database tables that can be used in a report. You build the report dataset by adding data items and columns. For more information, see [Report Dataset](devenv-report-dataset.md). You can also extend a dataset from an existing report, to add more columns for example. For more information, see [Report Extension Object](devenv-report-ext-object.md).


## Report layouts  

The visual layout determines the content and format of a report when it is viewed and printed. You build the layout of a report by arranging data items and columns and specifying the general format, such as text font and size. A report that is viewed, printed, or saved from a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] client must have a report layout. There are two types of report layouts: layouts using report definition language (RDL) and Word layouts. You can also extend an existing report, to add a new layout. For more information, see [Report Extension Object](devenv-report-ext-object.md).

> [!NOTE]  
> The layout in a *report extension* will not automatically be used when the report extension is deployed. To use the report extension layout, in [!INCLUDE [prod_short](../includes/prod_short.md)], go to the **Report Layout Selection** page to choose to use the new layout for the report in question by choosing it from the **Custom Layout Description** drop-down box.


### RDL layout 

To create an RDL layout report, you use Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder. For more information, see [Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md).

> [!IMPORTANT]
> RDL layouts can result in slower performance with document reports, regarding actions that are  related to the user interface (for example. like sending emails) compared to Word layouts. When developing layouts for document reports, we recommend that you design Word layouts instead of RDL. With Word layouts, reports are not impacted by the security constraints on sandbox appdomains like they are with RDL layouts. From a service perspective, RDL layouts are not trusted, so they will run in a sandbox appdomain that only lives for the current report invocation.  

### Word report layout

You create Word layouts by using a Word Document. Word layouts are based on a Word document that includes a custom XML parts that represents the report dataset. For more information, see [Creating a Word Layout Report](devenv-howto-report-layout.md).  


## See Also  

[Reports](devenv-reports.md)  
[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Report Data Type](datatypes/devenv-report-data-type.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Request Pages](devenv-request-pages.md)  
