---
title: Analyzing, pivoting, and sharing data in Business Central
description: Introducing the options you have for creating Business Central reports that analyze, pivot, and share data.
author: KennieNP
ms.custom: na
ms.date: 12/08/2023
ms.reviewer: solsen
ms.topic: conceptual
ms.author: kepontop
---

# Reporting options in Business Central

[!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, introduces three ways to create reports: reports that are based on report objects in AL, report based on Power BI, and reports based on Excel. Each of these methods has its own advantages and disadvantages, depending on the type of data analysis and the role of the user. In this article, we introduce these three methods and how they can be used differently in an organization. 

## Report objects in Business Central

Report objects offer the traditional way of creating analytical reports, processing only reports, and printable documents in Business Central. They're written in AL code and can be customized by partners or developers. Report objects can display data in various formats, such as tables, charts, or matrices. They can also have filters, sorting, grouping, and totaling options. Report objects are *suitable for users who need to access specific data sets or predefined reports* within Business Central. They can be printed or exported to PDF or Word.

For more information to understand the report structure and designing the layout for a report, see [Report Object](devenv-report-object.md).

## Excel reports 

Excel is a familiar tool that many users already use for data analysis and reporting. Excel can connect to Business Central data using the Excel add-in or OData web services. Excel can perform calculations, formatting, filtering, sorting, and charting on the data. Excel is *suitable for users who need to manipulate or format data in a flexible way*, or who want to create custom reports or templates. 

Excel report layouts allow you to create a basic report that prints a dataset and leaves it up to the end user to further modify it by using the full palette of capabilities in Excel such as sliders, diagrams, charts, pivot tables, and PowerQuery to design the report. This offers flexibility and freedom for the end user, being able to change the look and feel of a report, adding more views, filtering, and sorting on data. Such a layout designed by the end user, can be imported and used as a new layout. 

For more information about creating a report based on an Excel layout, see [Creating an Excel Layout Report](devenv-howto-excel-report-layout.md).

## Power BI reports

Power BI is a cloud-based service that allows users to connect to Business Central data and create interactive dashboards and reports. Power BI can handle large amounts of data and perform complex calculations and transformations. Power BI also offers various visualizations, such as maps, gauges, slicers, and KPIs. Power BI is suitable for users who need to *explore and analyze data across multiple sources or dimensions*, or who want to *share their insights* with others online or on mobile devices.

## Choosing the technology and method

Depending on the role and the need of the user in an organization, one of these methods might be more appropriate than the other. For example, a CFO might prefer Power BI to get a high-level overview of the business performance and trends, while an accountant might prefer report objects to get detailed information on transactions and balances. A sales manager might prefer Excel to create forecasts and budgets based on historical data.

Reports based on report objects are the native reports in Business Central that respect the security model, work on live data, allow you to pivot data, and share data with others. These reports also have a request page that lets you specify filters and options before running the report.
Excel reports export data from Business Central to Excel, where you can use the familiar features of Excel to analyze and present the data. They also respect the security model, work on live data, allow you to pivot data, and share data with others. Additionally, they offer slicers and visuals to enhance the report.
Power BI reports Power BI to create interactive dashboards and data stories based on Business Central data. They require a new security model and a data refresh to get the latest data. They aren't suitable for pivoting data, but they offer slices, KPIs, and visuals to explore and communicate the data. And they also allow you to share the data with others.

The following table sums up some of the main differences between the three types of analyzing and slicing data.

|Characteristic| Report object| Excel| Power BI|
|--------|--------------|------|---------|
|Security model preserved|Yes|Yes|No|
|Works on live data|Yes|Yes|No|
|Allows you to pivot data|Yes|Yes|No|
|Share data|Yes|Yes|Yes|
|Guides the user with a request page|Yes|Yes|No|
|Slices and visualizes data|No|No|Yes|
|Curated data stories|No|No|Yes|
|Optimized for print|Yes|No|No|


## See also

[Creating reports](devenv-reports.md)  
[Report object](devenv-report-object.md)  
[Report extension object](devenv-report-ext-object.md)  
[Creating a report](devenv-howto-report-layout.md)  
[Using request pages with reports](devenv-request-pages-for-reports.md)  
[Creating an RDL layout report](devenv-howto-rdl-report-layout.md)  
[Creating a Word layout report](devenv-howto-report-layout.md)  
[Creating an Excel layout report](devenv-howto-excel-report-layout.md)  
[Defining multiple report layouts](devenv-multiple-report-layouts.md)  
[Utilizing Read Scale-Out for better performance](../administration/database-read-scale-out-overview.md)  