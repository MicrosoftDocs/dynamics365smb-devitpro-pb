---
title: Analyze and Monitor Telemetry with KQL
description: Learn how to query Business Central telemetry with KQL.  
author: kennienp
ms.topic: overview
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/13/2022
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bac-template
---
# Analyze and Monitor Telemetry with KQL

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] in the tables *traces* and *pageViews*. The language used to query data in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] is _Kusto Query Language_ (KQL). This article has information and links to resources to get started learning about the KQL language.
As a simple example, follow these steps:
  
1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, enter the following to get the last 100 traces:

    ```kql
    traces
    | where timestamp > ago(7d)                     // look back 7 days
    | take 100                                      // only take 100 rows
    | project timestamp, message, customDimensions  // only choose these three columns 
    | sort by timestamp desc                        // show the most recent data first
    ```

## Where can I use Kusto Queries?

You can use Kusto queries as the data source in many places. For example:

* The **logs** part of Application Insights in the Azure portal
* Power BI reports
* Alerts
* Azure Dashboards
* Jupyter Notebooks (with the Kqlmagic extension)

## Where can I learn more about KQL?

[!INCLUDE[LearnKQL](../includes/include-telemetry-learn-kql.md)]

## Which tools can I use (KQL editors and clients)?

[!INCLUDE[KQLTools](../includes/include-telemetry-kql-tool.md)]

## KQL walkthrough example - understand report usage

This walkthrough will guide you step by step to create a kusto (KQL) query to analyze how users use reports in a Business Central environment. You will start with a sample query from the documentation article for report telemetry. Then you will step by step change and refine the query, learning about important KQL operators along the way. The final result will show you data for the most frequently used reports, grouped by the app/extension they are from, what users did with the report (download/preview/print/...), as well as, which layout (Excel/Word/RDLC) that was used.

### About this walkthrough
This walkthrough covers the following tasks:
  
1. Choose a query tool for KQL, either the **Logs** part of the **Monitoring** menu in Application Insights in the Azure portal, or in Kusto.Explorer (see [Kusto.Explorer installation and user interface](/azure/data-explorer/kusto/tools/kusto-explorer)).
2. Get a sample query (in this example, we use the sample query for report renderings)
3. Limit the result rows by adding a **take** operator
4. Limit the result columns by removing lines from the **project** operator 
5. Add a **summarize** operator and learn gotchas about the dynamic datatype customDimensions
6. Add group by parts to the **summarize** operator
7. Rename columns in the result
8. Add an **order by** to see the most frequent reports first
9. Add a **take** operator to get the top 10 most frequent reports.

### Prerequisites
To complete this walkthrough, you'll need:

An [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource.

Report telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that has been emitted to Application Insights.

A query tool for KQL, either the **Logs** part of the **Monitoring** menu in Application Insights in the Azure portal, or the Kusto.Explorer (see [Kusto.Explorer installation and user interface](/azure/data-explorer/kusto/tools/kusto-explorer)).

### Understand report usage with telemetry and KQL

First, go to the article on report telemetry [Analyzing Report Telemetry](telemetry-reports-trace.md#sample-kql-code)

Now, copy the KQL query for successful report generation:
[!INCLUDE[report-success-kql](../includes/include-telemetry-report-success-kql.md)]

The query above has four parts: a table and three KQL operators separated by a pipe (**|**):
1. which kusto table that stores the data
2. where operators to filter the data
3. a project operator limits the number of columns
4. an extend operator to add new columns (calculations)

```kql
traces // which kusto table that stores the data
// where operators filter the data
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == "Success report generation" // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006' // introduced in version 16.1
| where customDimensions.result == "Success"
//
// the project operator limits the number of columns
| project timestamp
, aadTenantId = customDimensions.aadTenantId
// ...
// ...
// the extend operator can be used to add new columns (calculations)
| extend renderTimeInMS = totalTimeInMS - serverExecutionTimeInMS
```

When writing KQL queries, it's good practice to limit the number of rows while developing it. This allows for quick explorations and experimentation without having to wait for the result in each modification of the query.

So, before running the query, add a **take** operator on a new line after the **where** operator and the **project** operator:

Your query should now look like this:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == 'Success report generation' // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == 'Success'
| take 5
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// what did the user do
, documentFormat = customDimensions.documentFormat   // documentFormat dimension added in version 20.0
, LayoutAppId = customDimensions.layoutAppId         // layout dimensions added in version 20.0
, LayoutName = customDimensions.layoutName           // layout dimensions added in version 20.0
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
, reportingEngine = customDimensions.reportingEngine // reportingEngine dimension was added in version 17.3
// which user ran the report
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry id was introduced in the platform in version 20.0
, 'N/A'
)
// performance data
, numberOfRows = customDimensions.numberOfRows
// , serverExecutionTime = customDimensions.serverExecutionTime // the datatype for executionTime is timespan
, serverExecutionTimeInMS = toreal(totimespan(customDimensions.serverExecutionTime))/10000 // this shows how to convert timespan to millisecods
, sqlDatabaseAccessIntent = customDimensions.sqlDatabaseAccessIntent  // sqlDatabaseAccessIntent dimension added in version 19.1
, sqlExecutes = customDimensions.sqlExecutes 
, sqlRowsRead = customDimensions.sqlRowsRead
// , totalTime = customDimensions.totalTime // the datatype for totalTime is timespan
, totalTimeInMS = toreal(totimespan(customDimensions.totalTime))/10000 // this shows how to convert timespan to millisecods
| extend renderTimeInMS = totalTimeInMS - serverExecutionTimeInMS
```

Try running the query. You should now see 5 rows with a lot of columns. 

As you can see on the result, the original query includes a lot of columns. In this example, we aren't interested in performance data and other details. So, we simply remove the lines that we don't need from the **project** part of the query:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == 'Success report generation' // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == 'Success'
| take 5
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
```

Try running the query again. You should now see 5 rows with a lot fewer columns. 

Next, we want to summarize how many reports have been run. For this, we add a new line with a **summarize** operator to the query:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == 'Success report generation' // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == 'Success'
| take 5
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
| summarize count()
```

This will show you a total count of all reports that were run. Because you have a **take 5** in there, the count will also be 5. Now, change that limit to 100 as we are ready to group by some columns:

```kql
// Note that this query will fail with the error
// 
// Summarize group key 'alObjectId' is of a 'dynamic' type. Please use an explicit cast (for example, 'summarize ... by tostring(alObjectId)') as grouping by a 'dynamic' type is not supported.
//
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == 'Success report generation' // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == 'Success'
| take 100
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
| summarize count() by alObjectName
```

All of the context of the report rendering (which object id/name, extension/app details etc.) are stored in a datastructure called **customDimensions**. For such columns to work in the **by** part of the  **summarize** operator, they must be converted to strings or numbers, else you will get this error when running the query: 

_Summarize group key 'alObjectId' is of a 'dynamic' type. Please use an explicit cast (for example, 'summarize ... by tostring(alObjectId)') as grouping by a 'dynamic' type is not supported._

Let's quickly fix that and add a tostring command to the **by** part of the **summarize** line:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == 'Success report generation' // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == 'Success'
| take 100
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
| summarize count() by tostring(alObjectName)
```

The _Summarize group key 'alObjectId' is of a 'dynamic' type_ error is common to get when you write KQL. Now you know how to fix it.

Let's add add a few more columns to the **by** part of the **summarize** line and tidy up the query (remove comments and unused columns from the **project** part):

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0006'
| where customDimensions.result == 'Success'
| take 100
| project extensionPublisher = customDimensions.extensionPublisher
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType
, reportAction = customDimensions.reportAction
| summarize count() 
  by tostring(alObjectName)
   , tostring(LayoutType)
   , tostring(reportAction)   
   , tostring(extensionPublisher)   
```

If we want the columns in the result to have some nice names, we can rename them directly in the **summarize** operator: 

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0006'
| where customDimensions.result == 'Success'
| take 100
| project extensionPublisher = customDimensions.extensionPublisher
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType
, reportAction = customDimensions.reportAction
| summarize report_count = count() 
  by report_name   = tostring(alObjectName)
   , layout_type   = tostring(LayoutType)
   , report_action = tostring(reportAction)   
   , publisher     = tostring(extensionPublisher)   
```

We want to see the most frequent reports in the top of the list, so we add a new line with an **order by** operator (remember to add _desc_ or _asc_):

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0006'
| where customDimensions.result == 'Success'
| take 100
| project extensionPublisher = customDimensions.extensionPublisher
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType
, reportAction = customDimensions.reportAction
| summarize report_count = count() 
  by report_name   = tostring(alObjectName)
   , layout_type   = tostring(LayoutType)
   , report_action = tostring(reportAction)   
   , publisher     = tostring(extensionPublisher)   
| order by report_count desc
```

We just want to see the top 10 results. So we add one more **take** operator to the end of the query:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0006'
| where customDimensions.result == 'Success'
| take 100
| project extensionPublisher = customDimensions.extensionPublisher
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType
, reportAction = customDimensions.reportAction
| summarize report_count = count() 
  by report_name   = tostring(alObjectName)
   , layout_type   = tostring(LayoutType)
   , report_action = tostring(reportAction)   
   , publisher     = tostring(extensionPublisher)   
| order by report_count desc
| take 10
```

Our query now delivers a result that looks like what we want. Final step is to deal with the the initial **take 100** line as the query is now ready and we are no longer experimenting. For future experiments, we just comment it out, to make it easy to add again, should we need it:

```kql
// Final version
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0006'
| where customDimensions.result == 'Success'
//| take 100
| project extensionPublisher = customDimensions.extensionPublisher
, alObjectName = customDimensions.alObjectName
, LayoutType = customDimensions.layoutType
, reportAction = customDimensions.reportAction
| summarize report_count = count() 
  by report_name   = tostring(alObjectName)
   , layout_type   = tostring(LayoutType)
   , report_action = tostring(reportAction)   
   , publisher     = tostring(extensionPublisher)   
| order by report_count desc
| take 10
```


## See also

[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Analyze Telemetry with Power BI](telemetry-power-bi-app.md)
[Telemetry FAQ](telemetry-faq.md)
