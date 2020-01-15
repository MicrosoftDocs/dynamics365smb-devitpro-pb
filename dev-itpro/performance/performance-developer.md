---
title: ""
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: 
---

# Performance Topics For Developers

In this topic you can read about ways to tune performance when developing for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]:
[Writing efficient pages](performance-developer.md#writing-efficient-pages)  
[Writing efficient Web Services](performance-developer.md#writing-efficient-web-services)  
[Writing efficient reports](performance-developer.md#writing-efficient-reports)  
[AL performance patterns](performance-developer.md#al-performance-patterns)  
[Efficient Data access](performance-developer.md#efficient-data-access)  
[Testing and validating performance](performance-developer.md#testing-and-validating-performance)  
[Tuning the Development Environment](performance-developer.md#tuning-the-development-environment)  


## Writing efficient pages
<!-- (GAP: most content in this section has not been written yet) -->
There are a number of patterns that a developer can use to get a page to load faster
- Avoid Unnecessary Recalculation 
- Do less 
- Offloading the UI thread 

### Pattern: Avoid Unnecessary Recalculation 
To avoid unnecessary recalculation of expensive results, consider caching that data yourself and refresh the cache on a regular basis. Maybe you want to show the top-5 sales open orders, or a list of VIP customers on the role center. The content of such a list probably do not change significantly every hour, so there is no need to calculate that from raw data every time the page is loaded. Instead, create a table that can contain the calculated data and refresh every hour/day using a background job.

Another example of unexpected recalculation is when using query objects. In contrast to using the record API, query results are not cached in the primary key cache in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server. Any use of a query object will always go to the database. So, sometimes it is faster to not use a query object. 

### Pattern: Do less 
One way to speed up things is to reduce the work that the system must do. E.g. to reduce slowness of role centers, consider how many page parts are needed for the user. An additional benefit of a simple page with few UI elements can also be ease of use and navigation.

Remove calculated fields from lists if they are not needed. Especially on larger tables or if inadequate indexing is present, calculated fields can significantly slow down a list page.

Consider creating dedicated lookup pages instead of the normal pages when adding a lookup (the one that looks like a dropdown) from a field. Default list pages will run all triggers and factboxes even if they are not shown in the lookup. As an example, in the 2019 release wave 1, dedicated lookup pages for Customer, Vendor and Item was added to the base application.
 
### Pattern: Offloading the UI thread 
To get to a responsive UI fast, consider using Page Background Tasks for calculated values, e.g. the values shown in cues.

For more information about Page Background Tasks, see [Page Background Tasks](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-page-background-tasks) <!-- change link -->

## Writing efficient Web Services 
[!INCLUDE[prodshort](../developer/includes/prodshort.md)] has support for Web services to make it easier to integrating with external systems. As a developer, you need to think about performance of web services both seen from the BC server (the endpoint) and as seen from the consumer (the client). 

### End point performance  
You should avoid using standard UI pages to expose as OData endpoints. A lot of things such as factboxes are not exposed in Odata, but will use resources to compute. 
- Also, avoid heavy logic in OnAfterGetCurrRecord 
- Many SIFT fields 
- Interaction with factboxes 
 
Instead, use dedicated the API pages as they have been optimized for this scenario. And do select the highest API version available 

Read more about API pages here: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-api-pagetype 

### Client performance 
The online version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server has setup throttling limits on web services endpoints to ensure that excessive traffic cannot cause stability and performance issues.

Make sure that your client respects the two HTTP status codes 429 (Too Many Requests) and 504 (Gateway Timeout).

Handling Status Code 429 requires the client to adopt a retry logic while providing a cool off period. Different strategies such as regular interval retry, incremental intervals retry, exponential back-off, or even randomization can be applied.

Handling 504 - Gateway Timeout requires the client to refactor long running request to execute within time limit, but splitting the request into multiple requests - and then dealing with potential 429, by applying a backoff strategy.

Read more about web service limits here: https://docs.microsoft.com/en-us/dynamics-nav/api-reference/v1.0/dynamics-rate-limits

## Writing efficient reports
Reports in BC are typically either very specific to a single instance of an entity (e.g. an invoice), or of a more analytical nature that joins data from multiple instances of multiple entities (e.g. XXX). Typically, performance issues in reports is in the latter category. These topics contain advice to implement faster reports: 

How to use queries to implement fast reports: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-overview 

RDL vs. Word layout performance: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-howto-rdl-report-layout

TODO: readonly intent (when we get to 16.0) 

## AL performance patterns 
Knowledge about different AL performance patterns can greatly improve the performance of the code you write. In this section, we will describe the following patterns and their impact on performance 

[Use built-in data structures]()  
[Run async (and parallelize)]()  
[Use set-based methods instead of looping]()  
[Other AL performance tips and tricks]()  


<!-- Kennie: todo 
Pattern: Avoid Unnecessary Recalculation 
Pattern: Do less 
Pattern: Use optimistic locking 
Pattern: Limit your Event Subscriptions 
Pattern: Know your data stack 
-->

### Pattern: Use built-in data structures 
Use TextBuilder when concatenating strings:  
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/textbuilder/textbuilder-data-type 
See slide 26-27 in [Directions EMEA 2019] 

When to use a dictionary  
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/dictionary/dictionary-data-type 
See slide 24 in [Directions EMEA 2019] 

When to use a list 
See slide 25 in [Directions EMEA 2019] 
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/list/list-data-type 
 

### Pattern: Run async (and parallelize) 
Async execution (offload execution from the UI thread to a background session) 

Don’t let the user wait for batches 

Use the CPU cores on your box (mainly for on-prem) 

Splitting tasks into smaller tasks 

Many different ways to spin up a new task 
- [Job Queue](/business-central/admin-job-queues-schedule-tasks)
- TaskScheduler.CreateTask 
- StartSession 
- [Page Background Task](../developer/devenv-task-scheduler.md) 

Background session options (pros and cons). See slide 41 in [Directions EMEA 2019] 


### Pattern: Use set based methods instead of looping 
The AL methods such as FINDSET, CALCFIELDS, CALCSUMS, and SETAUTOCALCFIELDS are examples of set-based operations that are much faster than looping over a result set and do the calculation for each row
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-al-database-methods-and-performance-on-server#calcfields-calcsums-and-count 
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/recordref/recordref-findset-method  

Use CALCSUMS function to calculate totals (see example on slide 14 in [Directions EMEA 2019]) 

Try to minimize work done in the OnAfterGetRecord trigger code. Common performance coding patterns are
- Avoiding CALCFIELDS calls 
- Avoiding repeated calculation (move this outside the loop) 
- Avoid changing filters (Requires us to throw away the resultset)

Consider using a query object if you want to use a set-based coding paradigm
These are some pros and cons for query objects:
ADD TABLE HERE
Pros 
-Will bypass the AL record data stack, where server reads all fields: 
- Record.GET ~ SELECT field1, …, field100 FROM <table> WHERE … 
- With covering index, you can get fast read perf for wide tables 
- Can join multiple tables 

Cons 
- Query object result sets are not cached in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server data cache 
- No writes 
- Cannot add a page on a query object  

Read more about query objects here:
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-using-instead-record-variables 
- [Query object](../developer/devenv-query-object.md)  
- [Query overview](../developer/devenv-query-overview.md)  
- [TopNumberOfRows Property](../developer/properties/devenv-topnumberofrows-property.md)  
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-query-objects-and-performance 

### Other AL performance tips and tricks 

IsDirty method: TODO

If you need a fast, non-blocking number sequences that can be used from AL, take a look at the number sequence object type in AL 
Use a number sequence object if you: 
- Do not want to use a number series 
- Can accept holes in the number range. 
For more information, see [NumberSequence Data Type](../developer/methods-auto/numbersequence/numbersequence-data-type.md) 


TODO: Security filtering (maybe both here and in data access) 

TODO: Use SystemID instead of RECORDID 

**GAP: Table extension impact on performance**
Extensions are eager joined in the data stack 

No indexes spanning base and extension fields 

Avoid splitting into too many extension 

Be careful about extending central tables 

Table extension vs. related table 

See pros and cons on slide 19 in [Directions EMEA 2019]
 

**GAP: Limit your Event Subscriptions**
See slides 29-32 in [Directions EMEA 2019] 



## Efficient Data access 
Many performance issues is related to how data is defined, accessed, and modified. As an AL developer, it is important to know about how concepts in AL metadata and the AL language translate to their counterparts in SQL.  
  
### Tables and keys 
Many issues stem from missing indexes. 

Consider indexes matching integration scenarios 

Indexes have a cost to update, so don’t overdo it. 

- [Table Keys and Performance in Business Central](../administration/optimize-sql-table-keys-and-performance)  
- [Key Property](../developer/properties/devenv-key-property.md) 

 
### SumIndexField Technology (SIFT)
SumIndexField Technology (SIFT) lets you quickly calculate the sums of numeric data type (Decimal, Integer, BigInteger, and Duration) columns in tables, even in tables with thousands of records. SIFT is used to optimize the performance of FlowFields and query results in a Business Central application. 

Ensure appropriate SIFT indices for all FlowFields of type sum or count. 

Read more about SIFT here:
- [SumIndexField Technology (SIFT)](../developer/devenv-sift-technology.md)  
- [SIFT and Performance](../developer/devenv-sift-performance.md)  
- [Tuning and Tracing](../developer/devenv-sift-tuning-and-tracing.md)  
- [SIFT and SQL Server](../developer/devenv-sift-and-sql-server.md)  

This topic can sometimes help to find missing SIFT indexes on flowfields:
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql  


### How AL relates to SQL 
Even though the AL programming language hides away how data is read and written to the database, to effectively code for performance you need to know how AL statements translate to the equivalent SQL statements. 

These topics cover how AL relates to SQL 
- [AL Database Methods and Performance on SQL Server](../administration/optimize-sql-al-database-methods-and-performance-on-server.md)  
- [Data Access](../administration/optimize-sql-data-access#-server-data-caching.md)  
- [Data read/write performance](../administration/optimize-sql-data-access#data-readwrite-performance.md)
- [Bulk Inserts](../administration/optimize-sql-bulk-inserts.md)

### How to get insights into how AL translates to SQL 
If you want to track how the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server translates AL statements to SQL statements, you can either use database statistics in the AL debugger, or use telemetry on long running queries.

Read more here
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-debugging#DebugSQL  
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/monitor-long-running-sql-queries-event-log#ApplicationInsights

## Testing and validating performance 
It is imperative to test and validate a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] project before deploying it to production. In this section you find resources on how to analyze and troubleshoot performance issues as well as guidance on how to validate performance of a system. 

Troubleshooting 
- Long Running SQL Queries Involving FlowFields by Disabling SmartSQL https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql  
- Page Inspection: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-inspecting-pages  

- Validating performance  
- Instrumenting Telemetry 
- [Technical checklist](../compliance/apptest-onbeforecompanyopen.md)
- [The Dynamics NAV performance testing Framework](https://github.com/NAVPERF)

<!-- ALL THE NAV TESTING LINKS MUST BE VALIDATED TO SEE IF THIS IS STILL USEFUL -->
Videos:

- [How Do I: Write Microsoft Dynamics NAV Load Tests Scenarios Using Visual Studio: Part 1](https://www.youtube.com/watch?v=GULQmkhGiHo)  
- [How Do I: Write Microsoft Dynamics NAV Load Tests Scenarios Using Visual Studio: Part 2](https://www.youtube.com/watch?v=KsJIWEYYp1s)    
- [How Do I: Run NAV Load Tests Using Visual Studio in Microsoft Dynamics NAV](https://www.youtube.com/watch?v=IG-y8DsXqaQ)  
- [Setting Up Test Controllers and Test Agents to Manage Tests with Visual Studio](https://msdn.microsoft.com/en-us/library/hh546459.aspx)  


## Tuning the Development Environment 
The following articles explain what you can do as a developer to tune your development environment for better performance.
- [Optimizing Visual Studio Code for AL Development](../developer/devenv-optimize-visual-studio-code.md) 
- [Code Analysis on large projects](../developer/devenv-using-code-analysis-tool#enabling-code-analysis-on-large-projects.md)


## See Also
