---
title: "How to Work with a Performance Problem"
description: Troubleshooting process that can help to guide you to find the root cause slow performance.
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: KennieNP
---

# How to work with a performance problem

What do you do if users complain that "it's slow"? In this section, we describe a troubleshooting process that can help to guide you to find the root cause of the problem.

## A generic performance tuning process

Before getting started on solving a performance-tuning problem, it often helps to define and quantify "slow" and also negotiate acceptable values for execution time of the "slow" operations with users. Learning about the users expectations is key when determining when the performance tuning effort has been successful (or if the expectations are unrealistic). 

You also need to measure how the system performs on the given operation before starting to change anything. This task is sometimes called "establishing a baseline." To define baselines for performance, and to test whether new code or extensions introduce a performance regression, you can use the [Performance Toolkit](../developer/devenv-performance-toolkit.md) extension. The extension makes it easier to simulate and compare user experiences to your baseline. The following are examples of when the extension can help:  
* When you want to ensure that new code doesn't introduce a regression. 
* In a sandbox environment when, for example, the number of users running the same process increases significantly. 
* When you want to roll out a new process, or install a new extension. 


To solve a performance problem, a common pattern is to do iterations of the following tasks:

1. Measure system performance and collecting performance data
2. Locate a bottleneck
3. Eliminate the bottleneck

Continue until the "slow" operations are comparable to the established baseline.

## Analyzing performance issues using telemetry

For monitoring and analyzing performance issues in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service, we recommend connecting Azure AppInsights to the environments that you want to get signals from. For more information, see [Enable Sending Telemetry to Application Insights](../administration/telemetry-enable-application-insights.md). 

In the following, you can read about ways where telemetry can help troubleshoot performance issues.

| Area | Telemetry | Why |
|---------------------------|------------|------------|
| Some page is slow (and it uses Page Background Tasks) | [Authorization signal](../administration/telemetry-authorization-trace.md)   | Each page background task will open a new session. Any expensive action in the OnCompanyOpen trigger will slow down opening new sessions. | 
| Sign-in      | [Authorization signal](../administration/telemetry-authorization-trace.md)   | Any expensive action in the OnCompanyOpen trigger will slow down opening new sessions. | 
| Something was slow during this period of time | [Company lifecycle signal](../administration/telemetry-company-lifecycle-trace.md) | Check whether a copy-company operation was running while the performance issue occurred. |
| Something was slow during this period of time | [Database locks signal](../administration/telemetry-database-locks-trace.md) | Maybe the performance issue was because of locking in the database. |
| Suddenly the XYZ page is slow | [Extension lifecycle signal](../administration/telemetry-extension-lifecycle-trace.md) | Maybe an extension was installed that interferes with the page in question.|
| Some pages or reports are slow to load | [Long running SQL queries](../administration/telemetry-long-running-sql-query-trace.md) | Investigate whether the data operations on the page or report are taking a long time to complete. |
| A report is slow | [Report signal](../administration/telemetry-reports-trace.md)  | Check whether the report is reading more data than you expected. |
| System UI feels slow | [Web service requests signal](../administration/telemetry-webservices-trace.md) | Calling your environment too  aggressively with web service requests can affect performance of the system. |

This page shows an overview of all currently available signals: [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md).

## Analyzing database performance issues using verbose telemetry

If you want to capture all SQL queries for a short period of time for a given session, you can enable **Additional logging** from the **Help & Support** page. This lets you analyze queries that take a short time to run but happen very frequently.  

Read more about additional logging in the [Troubleshooting](/dynamics365/business-central/product-help-and-support#troubleshooting) section of the Resources for Help and Support article in the business functionality docs.

With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, you can also change the default threshold that defines long running queries. For more information, see [Analyzing Long Running Operation (SQL Query) Telemetry](../administration/telemetry-long-running-sql-query-trace.md).

## Analyzing performance issues using the page inspector

If a specific page takes too long to load, it might be due to extensions that are adding expensive operations to the page triggers. You can use the page inspector to analyze this by navigating to the Extensions tab. It displays installed extensions that affect the selected page or its source table by showing the time (in milliseconds) it took to run the extension in the call stack and the number of event subscribers run in the extension.

Read more about how to use the page inspector to troubleshoot extension performance here [Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md).

## Analyzing performance issues using the AL Profiler

With the AL Profiler for the AL Language extension you can capture a performance profile of the code that was executed for a snapshot. Using the performance profiling editor view in Visual Studio Code, you can investigate the time spent on execution, using top-down and bottom-up call stack views. 

Before capturing a snapshot with a performance profile, you can choose between using instrumentation or sampling for the profile. Instrumentation captures all method calls with precise timings, but has a higher performance load on the NST, the snapshot will be larger and it can take longer to generate and extract the profile from the snapshot. Sampling captures method calls at predefined, repeated intervals. This has a smaller performance load on the NST, but calls shorter than the sampling interval might not be captured, and timings fall in sample buckets. 

Read more about how to use the AL profiler to troubleshoot performance here [AL Profiler Overview](../developer/devenv-al-profiler-overview.md).

## Analyzing performance issues using the in-client Performance Profiler 

The in-client Performance Profiler can also be used to record a slow scenario that can then be analyzed to see what took a long time. The tool is simple to use and can therefore be used by end-users, admins, and consultants to do performance investigations directly within the web client, to verify performance issues, understand which extensions are at play, and the likelihood of an extension being the cause of a performance degradation. It is a lighter tool than the AL Profiler and, as it relies on *sampling*, it can perform in scenarios that would otherwise take longer time than using the AL Profiler using the *instrumentation* option. Recording is done in the web client and the collected data is also shown in web client using various views. There is also an option to download the generated profile content and view it in Visual Studio Code with the standard AL Profiler editor. From there you can use existing options to access the AL code that was slow.

Read more about how to use the in-client profiler to troubleshoot performance here [Performance Profiler Overview](../administration/performance-profiler-overview.md)

## Which tools are good when?

In the following, you can read about the pros and cons of the different performance tools described above.

|Performance tool | Properties |
|---------------------------------|-------------|
|Telemetry | Can be used if you want to investigate things after they happened. <br> Good for analyzing patterns across sessions. <br> Extensive resources available (Power BI report, Jupyter notebooks, sample KQL queries). <br> Very little performance impact to have turned on always. <br> Telemetry must be enabled before the performance issue occurs. <br> Not every single AL call is logged to telemetry as this would slow down the Business Central server. | 
|Verbose telemetry | Will give you all SQL queries for the session where you repro the issue. <br> Will slow down the system while running. <br> Can inject a lot of data into Azure Application Insights. <br> Data collection must happen live. |
| Page inspector | Good to troubleshoot performance of a single page. <br> No need to enable this (always available). <br> End users can run the tool. <br> Data collection must happen live.  | 
| AL profiler | Good to troubleshoot performance of a scenario. <br> Very detailed information on where in the code the time is spend. <br> No need to enable this (always available). <br> Requires a developer to run the tool. <br> Data collection must happen live. |
| In-client performance profiler | - Good for troubleshooting a performance scenario in the web client.<br>- No developer required to run the tool.| 


## Example - How to deal with a performance problem in a report from an AppSource extension
This example illustrates how you can use the performance tuning process and telemetry to deal with a performance problem in a report from an AppSource extension.

- Together with the tenant administrator/customer, you need to define "slow" and what the acceptable rendering time will be. 
- Then, use telemetry to find data about time spent in the report: long running SQL queries (eventId RT0005) and report rendering time (eventId RT0006) are the main data sources for this. Telemetry for long running AL methods (eventId RT00180) might also be useful here. Now you have baseline data.
- Also, use telemetry on report rendering time (eventId RT0006) to find out if the report is running with data access intent ReadOnly. If not, configure it to do so. Some reports write data, so this is not always possible.
- Do you see long running SQL queries for the report in telemetry (eventId RT0005)? If so, you can add appropriate indexes using a table extension.
- After configuring data access intent and maybe having added indexes, measure rendering time and compare with the baseline. Also check if the new rendering time is good enough with respect to the acceptable rendering time that you defined together with the tenant administrator/customer. If the performance is still not good enough, you probably need to involve the extension publisher. 
- What is the SQL statement to SQL row ratio (get this using eventId RT0006)? Maybe the extension publisher can make the report more set-based when reading data. The telemetry samples repository at [aka.ms/bctelemetrysamples](https://aka.ms/bctelemetrysamples) have KQL samples that can help with this analysis.
- If you have data to back it up, consider filing a performance support request to the extension publisher. They are probably interested in making their app better and faster. Provide info about indexes you added, the kusto queries you used and the results, and also if the report could run as ReadOnly by default. 



## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance tips for business users](performance-users.md)  
[How Application Configurations Affect Performance](performance-application.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
