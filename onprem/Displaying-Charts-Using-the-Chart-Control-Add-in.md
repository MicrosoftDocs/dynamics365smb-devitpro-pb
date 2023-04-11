---
title: "Displaying Charts Using the Chart Control Add-in"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 78826101-1cc2-4540-8cbe-c6538b5f332d
caps.latest.revision: 8
---
# Displaying Charts Using the Chart Control Add-in
In [!INCLUDE[navnow](includes/navnow_md.md)], you can graphically represent data in charts that you can display in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. [!INCLUDE[navnow](includes/navnow_md.md)] supports several chart types, such a line charts, bar charts, and pie charts. With the basic chart feature of [!INCLUDE[navnow](includes/navnow_md.md)], you can retrieve data from a table or using query and render the data in a single chart type, such as a line or bar graph. There might be scenarios for which you want to display data that does not fit the model of the basic chart feature. For example, you might want to display data that is calculated on a page, or you might want to render data different measures using different chart types. For these cases, [!INCLUDE[navnow](includes/navnow_md.md)] includes the Business Chart control add-in. With the [!INCLUDE[navnow](includes/navnow_md.md)], you can create custom charts for displaying complex data on a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] page.  
  
 For an example of a chart that uses the Business Chart control add-in, see [Cash Flow Chart Example](Cash-Flow-Chart-Example.md).  
  
## Business Chart Design Concept and Components  
  
### Business Chart Control Add-in Assembly  
 The Business Chart control add-in is provided by the Microsoft.Dynamics.Nav.Client.BusinessChart.dll assembly. The Business Chart control add-in is a Microsoft .NET Framework object that creates the user interface of a chart on page and populates the chart with data from C/AL code.  
  
 The assembly is installed on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. By default the assembly is located in the [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins\\BusinessChart folder.  
  
 The Business Chart control add-in assembly includes an API that you can use to call methods and properties from C/AL code to build your chart.  
  
### Business Chart Buffer Table  
 *Table 485 Business Chart Buffer* is a default table that is available with the [!INCLUDE[navnow](includes/navnow_md.md)] demo database. The purpose of the Business Chart Buffer table is to separate the chart data from the page. The Business Chart Buffer table temporarily holds the data for building a chart, such as the chart type, measures, and labels. The table uses Microsoft .NET Framework interoperability to reference types in the System.Data assembly for building a data table that contains the chart data. To generate a chart, the page that contains the Business Chart control add-in retrieves data from the Business Chart Buffer table and passes the data to the Business Data Chart control add-in.
