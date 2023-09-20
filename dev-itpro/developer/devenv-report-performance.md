---
title: "Report performance"
description: "Provides information for developers to help improve performance for Business Central reports."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/31/2023
ms.reviewer: na
ms.topic: conceptual
ms.author: kepontop
---

# Report performance

[!INCLUDE[report_performance](../includes/include-report-performance.md)]


## Analyzing report performance telemetry 

Report telemetry gathers data about which reports are run on the environment. It provides information about whether the report succeeded, failed, or was canceled. For each report, it tells you how long it ran, how many SQL statements it executed, and how many rows it consumed. You use this data to gather statistics on report usage or to help identify slow-running reports.

For more information about report telemetry, see [Report telemetry](../administration/telemetry-reports-trace.md)

### Sample KQL code

[!INCLUDE[report-success-kql](../includes/include-telemetry-report-success-kql.md)]

### Tuning potential
When looking at telemetry data for report performance, the following strategies might be helpful for identifying reports to optimize:
* aggregate the sum of execution time by report and sort by sum descending. High sum values show the reports that consume a lot of resources.
* aggregate the count of report executions by report and sort by count descending. High number of renderings show the reports that are run the most. 
* aggregate the average execution time by report and sort by average descending. Reports with high average execution time could be candidates for tuning.

### Calculating time to compute the dataset and to render the report (apply the layout)
The time spent to run a report consists of two parts: generating the dataset and rendering the report (applying the layout). In report telemetry, you get two durations: serverExecutionTime and totalTime. The former is roughly the time it takes for the server to generate the dataset. To calculate the rendering time, simply subtract serverExecutionTime from totalTime: renderingTime = totalTime - serverExecutionTime.

### Checking if Read Scale-Out is used on reports
As mentioned in the list above, the _Read Scale-Out_ feature can be used to load-balance read-only workloads to a read-only replica of the database (where supported). 

The use of _Read Scale-Out_ in reports is captured in the custom dimension _sqlDatabaseAccessIntent_.

### Checking if reports run in the background
As mentioned in the list above, you if you can schedule reports to run in the background, users might feel that the application runs fast as they are not blocked in the UI while waiting on the report to finish.

The use of UI sessions vs. background sessions in reports is captured in the custom dimension _clientType_.

For more information, see [Schedule a report](/dynamics365/business-central/ui-work-report#ScheduleReport.md)

### Calculating how set-based the report dataset loads data
Calculate the ratio SQL rows/SQL statement. The higher this number is, the more set-based the data is loaded (which is good). So, look for low values of this ratio to identify reports, where you might be able to use a query as the datasource.

For more information about how to use a query in a dataset definition, see [Defining a report dataset](../developer/devenv-report-dataset.md).

For more information about queries, see [Queries in Business Central](../developer/devenv-query-overview.md).


## See Also

[Performance Overview](../performance/performance-overview.md)  
[Performance Topics For Developers](../performance/performance-developer.md)  
[How Application Configurations Affect Performance](../performance/performance-application.md)  
[Performance Online](../performance/performance-online.md)  
[Performance of On-Premises Installations](../performance/performance-onprem.md)  
[How to Work with a Performance Problem](../performance/performance-work-perf-problem.md)  
[Performance tips for business users](../performance/performance-users.md)  
[Report telemetry](../administration/telemetry-reports-trace.md)
