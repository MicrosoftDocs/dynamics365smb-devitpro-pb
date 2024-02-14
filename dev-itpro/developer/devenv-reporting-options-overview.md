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

# Analyzing, pivoting, and sharing data in Business Central

[!INCLUDE [prod_short](includes/prod_short.md)] comes with different options for providing reporting on data. Each of these methods has its own advantages and disadvantages, depending on the type of data analysis and the role of the user. In this article, we introduce these methods and how they can be used differently in an organization. 

## Analytics needs in organizations

When you develop analytic solutions for customers, it might help to use a mental model based on  personas described on a high-level and their different analytics needs.

:::image type="content" source="media/analytics-personas.svg" alt-text="Illustration of different personas for analytics" lightbox="media/analytics-personas.svg":::

The model is based on the observation that different roles in an organization have different needs when it comes to data: the higher the role is placed in the org chart, the more data needs to be aggregated for them to do their work. 

Each of the roles has some preferred/typical ways to consume/analyze data, ways that reflect the level of data aggregation needed in their role as shown in this illustration and table.

:::image type="content" source="media/analytics-personas-scenarios.svg" alt-text="Illustration of how different personas have different analytics needs." lightbox="media/analytics-personas-scenarios.svg":::

| Role     | Data aggregation  | Typical ways to consume data                | 
|----------|-------------------| --------------------------------------------|
|Leadership| Performance data  | KPIs <br> Dashboards <br> Financial reports |
|Management| Trends, summaries | Managerial reports <br> Ad-hoc analysis     | 
|Staff     | Detailed data     | Operational reports <br> On-screen task data|

Traditionally, most analytic needs in [!INCLUDE [prod_short](includes/prod_short.md)] were implemented by building a report with an RDL layout designed for printing to paper or PDF document. In the current technology landscape, users expect that they can design (and consume) analytics online. [!INCLUDE [prod_short](includes/prod_short.md)] comes with at least three technologies that you can use for implementing online analytics to support such user needs:

1. Power BI (and embed), 
1. Query/List page with Data Analysis,
1. AL report with Excel layout

So, if a customer asks, "Can you build me a report?", stop asking "Sure. How should it be formatted?"
Instead ask "What do you need to analyze and for what?" and then choose the tool that best supports it.

## Power BI reports

Power BI is a cloud-based service that allows users to connect to [!INCLUDE [prod_short](includes/prod_short.md)] data and create interactive dashboards and reports. Power BI can handle large amounts of data and perform complex calculations and transformations. Power BI also offers various visualizations, such as maps, gauges, slicers, and KPIs. Power BI is suitable for users who need to *explore and analyze data across multiple sources or dimensions*, or who want to *share their insights* with others online or on mobile devices.

Power BI reports can be embedded in [!INCLUDE [prod_short](includes/prod_short.md)] pages in two ways. One way is to use the **Power BI Report** part in on a page to make reports readily visible on the page when it opens. The report is typically linked to a specific record on the page. The other way is to embed a report in a separate page that opens from an action that the user selects on the page. This way enables reports to display in a larger screen area because they're not limited by the dimensions of the part. For more information, see [Embed Power BI reports in pages](devenv-power-bi-report-parts.md).


## Analyze data on lists and queries

Another option is to let the users analyze data from list pages and queries using the data analysis mode. The data analysis mode enables you to analyze data directly from the page, without having to run a report or switch another application like Excel. It provides an interactive and versatile way to calculate, summarize, and examine data. For more information, see [Analyze Data on Lists and Queries](/dynamics365/business-central/analysis-mode).

As a developer, consider whether the *analyze data* feature on a list page can fulfill the specified analytics needs of the users. If so, maybe this is just the "report" they need. The data source of a list page is a single table, so if the data needed for the analytical need spreads over multiple tables, then this option isn't immediately feasible. But if the data can be expressed as a query object, then this might be the only artifact you need to unblock the user. They can then use the *analyze data* feature on the query. For more information about queries, see [Queries in Business Central](./devenv-query-overview.md).


## Refreshable Excel workbooks on APIs

Excel is a familiar tool that many users already use for data analysis and reporting. Excel can connect to [!INCLUDE [prod_short](includes/prod_short.md)] data using the Excel add-in or APIs/OData web services. Excel can perform calculations, formatting, filtering, sorting, and charting on the data. Excel is *suitable for users who need to manipulate or format data in a flexible way*, or who want to create custom reports or templates. 

Using Power Query in Excel, you can connect Excel to read data from [!INCLUDE [prod_short](includes/prod_short.md)] APIs. With PowerPivot in Excel, you can create a data model as a basis of the report and then use normal Excel features to lay out the data. With this technique, the report becomes refreshable by the users. The downside is that any change to the data model in the Excel workbook must be distributed to all users, so you need to consider ways to deal with this situation.

## Excel reports

Report objects offer the traditional way of creating analytical reports, processing only reports, and printable documents in [!INCLUDE [prod_short](includes/prod_short.md)]. They're written in AL code and can be customized by partners or developers. Report objects are *suitable for users who need to access specific data sets or predefined reports* within [!INCLUDE [prod_short](includes/prod_short.md)]. For more information to understand the report structure and designing the layout for a report, see [Report Object](devenv-report-object.md).

Excel report layouts allow you to create a basic report that generates a dataset and possibly leaves it up to the end user to further modify it by using the full palette of capabilities in Excel such as sliders, diagrams, charts, pivot tables, and maybe even PowerQuery and PowerPivot to design the report. This offers flexibility and freedom for the end user, being able to change the look and feel of a report, adding more views, filtering, and sorting on data. Such a layout designed by the end user, can be imported and used as a new layout. 

For more information about creating a report based on an Excel layout, see [Creating an Excel Layout Report](devenv-howto-excel-report-layout.md).


## Choosing the technology and method

Depending on the role and the need of the user in an organization, one of these methods might be more appropriate than the other. For example, a CFO might prefer Power BI to get a high-level overview of the business performance and trends, while an accountant might prefer report objects to get detailed information on transactions and balances. A sales manager might prefer Excel to create forecasts and budgets based on historical data.

Power BI reports allow you to create interactive dashboards and data stories based on [!INCLUDE [prod_short](includes/prod_short.md)] data. They require a new security model and a data refresh to get the latest data. They aren't suitable for pivoting data, but they offer slices, KPIs, and visuals to explore and communicate the data. And they also allow you to share the data with others.

Data analysis on lists and queries are suitable for ad-hoc analysis because users can easily slice and dice the dataset to their needs. They can define multiple analysis tab definitions on the same dataset and share these definitions with coworkers. With the *data analysis* feature, data never leaves [!INCLUDE [prod_short](includes/prod_short.md)], so the security model is preserved and the "reports" are always showing live data.

Reports based on report objects are the native reports in [!INCLUDE [prod_short](includes/prod_short.md)] that respect the security model, work on live data, allow you to pivot data, and share data with others. These reports also have a request page that lets you specify filters and options before running the report. With Excel layouts, you can use the familiar features of Excel to design and present the data. Reports respect the security model, allow you to pivot data, and share data with others. Additionally, they offer slicers and visuals to enhance the report.


The following illustration and table show how the different technology options presented in this article map to the different personas and their analytics scenarios. 

:::image type="content" source="media/analytics-personas-scenarios-tools.svg" alt-text="Illustration of how different technologies map to different analytics needs for different personas." lightbox="media/analytics-personas-scenarios-tools.svg":::

 
The following table sums up some of the main differences between the three types of analyzing and slicing data.

|Characteristic          | Power BI | Data analysis| Excel on API| Report with Excel layout |
|------------------------|----------|--------------|-------------|--------------------------|
|Security model preserved|No        |Yes           |Yes          |Yes                       |
|Works on live data      |No        |Yes           |Yes (if refreshed) | No                 |
|Allows you to pivot data|No        |Yes           |Yes          | Yes                      |
|Share data              |Yes       |Yes           |Yes          | Yes                      |
|Guides the user with a request page | No | No     | No          | Yes                      |
|Slices and visualizes data| Yes    |No            |Yes          | Yes                      |
|Curated data stories    |Yes       |No            |Yes          | Yes                      |


## See also

[Embed Power BI reports in pages](devenv-power-bi-report-parts.md)  
[Analyze Data on Lists and Queries](/dynamics365/business-central/analysis-mode)  
[Queries in Business Central](devenv-query-overview.md)  
[Creating reports](devenv-reports.md)  
[Creating an Excel layout report](devenv-howto-excel-report-layout.md)  
