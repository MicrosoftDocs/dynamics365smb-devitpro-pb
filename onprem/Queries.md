---
title: "Queries"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 14d0b7d7-c9e4-47e5-8113-908c39f864c9
caps.latest.revision: 18
manager: edupont
---
# Queries
A *query* object enables you to specify a set of data from the [!INCLUDE[navnow](includes/navnow_md.md)] database. You can query the database to retrieve fields from a single table or multiple tables. You can specify how to join tables in the query. You can filter the result data. You can specify totaling methods on fields, such as sums and averages.  

 The following section describes how to locate [!INCLUDE[navnowlong](includes/navnowlong_md.md)] documentation about designing queries in [!INCLUDE[navnow](includes/navnow_md.md)].  

## Creating Queries  
 This section explains how to design queries to specify datasets.  

|To|See|  
|--------|---------|  
|Learn how to create a basic query in Query Designer.|[How to: Create Queries](How-to--Create-Queries.md)|  
|Learn the supported ways to join tables in Query Designer.|[Understanding Data Item Links](Understanding-Data-Item-Links.md)|  
|Learn how to add totaling methods to columns in a query.|[Understanding Query Totals and Grouping](Understanding-Query-Totals-and-Grouping.md)|  
|Learn how to filter the results of a query.|[Understanding Query Filters](Understanding-Query-Filters.md)|  
|Learn how to run queries from C/AL code|[Working with Queries in C/AL](Working-with-Queries-in-C-AL.md)|  
|Learn how to create complex queries by walking through examples that use the [!INCLUDE[demolong](includes/demolong_md.md)].|[Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md)<br /><br /> [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md)<br /><br /> [Walkthrough: Creating a Query to Link Three Tables](Walkthrough--Creating-a-Query-to-Link-Three-Tables.md)|  

> [!NOTE]  
>  You cannot run a query that gets data from both the application database and the business data database. This also applies to single-tenant deployments so that you do not have to rewrite queries if you decide to export the application. For a description of which tables are considered part of the application database, see [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md).  

## Using Queries  
 The following examples show how you can use queries in your [!INCLUDE[navnow](includes/navnow_md.md)] application.  

-   Creating charts that are based on a query instead of a table.  

-   Saving a query as an .xml or .csv file. You can use the [SAVEASXML Function](SAVEASXML-Function.md) to create an .xml file that contains the resulting dataset of a query. You can use the .xml file to integrate with external applications.  

-   Exposing data as an OData web service. You can register and publish a query as a web service in the same way that you can register and publish pages or codeunits as web services. You use the **Web Services** page to register and publish pages, codeunits, or queries. After you expose a query as a web service, you can import it into other applications. For example, you can import [!INCLUDE[navnow](includes/navnow_md.md)] data into Microsoft Excel using Microsoft PowerPivot for Excel, which is a data analysis add-in. You can then create PivotTables in Excel that use the [!INCLUDE[navnow](includes/navnow_md.md)] data from your query. For an example , see [Walkthrough: Combining Data from Microsoft Dynamics NAV Queries and Pages with Data from Azure DataMarket \(OData\)](Walkthrough--Combining-Data-from-Microsoft-Dynamics-NAV-Queries-and-Pages-with-Data-from-Azure-DataMarket--OData-.md)
