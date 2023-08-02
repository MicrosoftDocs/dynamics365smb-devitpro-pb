---
title: "Extract data from Business Central"
description: Explains how to extract data from Business Central with different tools
ms.custom: bap-template
ms.date: 06/12/2023
ms.reviewer: na
ms.topic: how-to
ms.search.keywords: Power BI, reports, data, data warehouse, etl
author: kennieNP
ms.author: kepontop
ms.service: dynamics365-business-central
---

# Extract data from Business Central

A common problem that organizations face is how to gather data from multiple sources, in multiple formats. Then you'd need to move it to one or more data stores. The destination might not be the same type of data store as the source. Often the format is different, or the data needs to be shaped or cleaned before loading it into its final destination.

Various tools, services, and processes have been developed over the years to help address these challenges. No matter the process used, there's a common need to coordinate the work and apply some level of data transformation within the data pipeline. The following sections highlight the common methods used to perform these tasks.

## Extract, transform, and load (ETL) process

Extract, transform, and load (ETL) is a data pipeline used to collect data from various sources. It then transforms the data according to business rules, and it loads the data into a destination data store. The transformation work in ETL takes place in a specialized engine, and it often involves using staging tables to temporarily hold data as it is being transformed and ultimately loaded to its destination.

When establishing a data lake or a data warehouse, you typically need to do two types of data extraction:

1. A historical load (all data from a given point-in-time)
2. Delta loads (what's changed since the historical load)

### Getting a historical load

The fastest (and least disruptive) way to get a historical load from [!INCLUDE[prod_short](includes/prod_short.md)] online is to get a database export as a BACPAC file (using the [!INCLUDE[prod_short](includes/prod_short.md)] admin center) and restore it in Azure SQL Database or on a SQL Server. For on-premises installations, you can just take a backup of the tenant database.

### Getting delta loads

The fastest (and least disruptive) way to get delta loads from [!INCLUDE[prod_short](includes/prod_short.md)] online is to set up API queries configured with read-scaleout and use the data audit field LastModifiedOn (introduced in version 17.0) to filter only the data that was changed/added since the last time you read data.

Also consider this pattern: For each company, start by determining which tables that you load data from have new data. You can do this in an AL codeunit that you expose as a web service endpoint. Based on the result of this initial call, only call the APIs that you know will return data. This practice reduces the number of API calls you need to issue for your incremental loads. The impact of this optimization depends on the distribution of new data since last load.

## Tools for reading data

For [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, you can just read directly from the environment database. This option isn't available for [!INCLUDE[prod_short](includes/prod_short.md)] online, so establishing this type of integration could block you from migrating from on-premises to the online version. 

For [!INCLUDE[prod_short](includes/prod_short.md)] online, the only supported option for reading data is using APIs. The APIs can be either the standard APIs that are shipped with [!INCLUDE[prod_short](includes/prod_short.md)] or custom APIs that you build in Visual Studio Code and ship as an extension).

There exists a code sample that you may use to be more productive with APIs: API generator. 
For more information, see [API query generator](https://github.com/microsoft/BCTech/tree/master/samples/APIQueryGenerator)

## Throughput of data reads with APIs

Measurements have shown that it isn't unusual to be able to read 2 MB/sec per API call. This rate means that it's possible to transfer up to 120 MB/min or 7200 MB/hour for pipelines running sequentially. 

In [!INCLUDE[prod_short](includes/prod_short.md)] online, the current parallelism for API calls is 5. This value means that you can read up to 35 GB/hour if no other processes call web services on [!INCLUDE[prod_short](includes/prod_short.md)]. For an ETL setup that updates the staging area nightly with yesterday's changes, this rate should fit most maintenance windows (unless the environment has several GB of new/updated data per day).

Even if the ETL setup reads the historical dataset before switching to incremental loads, with a 2 MB/sec throughput, it takes up to one day to load a 100-GB database. Also, this operation is something you only do once.

## Stability of ETL pipelines

No matter which tool you choose, you must make your data pipelines robust towards timeouts and design them so that they are rerunnable. All [!INCLUDE[prod_short](includes/prod_short.md)] tables have system fields _SystemRowversion_ and _SystemLastModifiedOn_. For more information about system fields, go to [About system fields](devenv-table-system-fields.md). If your ETL setup tracks which watermark (either a date or a rowversion) was read last time, then data pipelines can utilize this behavior to read changes since the watermark.

## ETL tools

You can use your ETL tool of choice to read and transform data. Read about some popular options in the sections that follow.

### SQL Server Integration Services (SSIS)

For [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, one popular tool of choice is SQL Server Integration Services (SSIS) that is shipped with SQL Server. It's possible to autogenerate SSIS packages from a metadata store using script tasks or a tool such as BIML. For more information about these tools, see [About BIML](https://www.varigence.com/biml) and [About SSIS](/sql/integration-services/sql-server-integration-services).

### Azure Data Factory

For [!INCLUDE[prod_short](includes/prod_short.md)] online, you can use a tool such as Azure Data Factory to read and transform data. Azure Data Factory is a managed cloud service that is built for complex hybrid extract-transform-load (ETL), extract-load-transform (ELT), and data integration projects. For more information about Azure Data Factory, see [About ADF](/azure/data-factory/introduction)

You can use the Azure Data Factory OData connector with service principal authentication to extract data from [!INCLUDE[prod_short](includes/prod_short.md)]. For more information, see [Azure Data Factory OData connector](/azure/data-factory/connector-odata?tabs=data-factory) and [How-to connect Business Central to Azure](/answers/questions/751705/how-to-connect-business-central-to-azure-data-fact).

### Power BI dataflows

It's also possible to use Power BI dataflows for your extract pipelines. With Power BI dataflows, you can connect to [!INCLUDE[prod_short](includes/prod_short.md)] APIs and utilize incremental refresh to only load data that was changed since last refresh. For more information about, see [About incremental refresh](/power-query/dataflows/incremental-refresh) and [About Power BI dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service).

<!--Microsoft MVP Steven Renders has written a nice blog post on how to use Power BI dataflows with [!INCLUDE[prod_short](includes/prod_short.md)]:
[How do I create a Power BI dataflow with Business Central data](https://thinkaboutit.be/2023/02/how-do-i-create-a-power-bi-dataflow-with-business-central-data/)-->

### bc2adls code sample (unsupported)

Another (unsupported) option is to use the _bc2adls_ code sample to transfer data from the [!INCLUDE[server](includes/server.md)] directly to an Azure Data Lake Storage (ADLS) data lake. For more information about bc2adls, see [About bc2adls](https://github.com/microsoft/bc2adls) on GitHub.com.

## See also

[Adding Power BI Report parts to pages](devenv-power-bi-report-parts.md)
