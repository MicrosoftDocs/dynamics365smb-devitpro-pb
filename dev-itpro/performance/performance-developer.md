---
title: "Performance Topics For Developers"
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

In this topic you can read about ways to tune performance when developing for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

- [Writing efficient pages](performance-developer.md#writing-efficient-pages)  
- [Writing efficient Web Services](performance-developer.md#writing-efficient-web-services)  
- [Writing efficient reports](performance-developer.md#writing-efficient-reports)  
- [AL performance patterns](performance-developer.md#al-performance-patterns)  
- [Efficient Data access](performance-developer.md#efficient-data-access)  
- [Testing and validating performance](performance-developer.md#testing-and-validating-performance)  
- [Tuning the Development Environment](performance-developer.md#tuning-the-development-environment)  


## Writing efficient pages 

There are a number of patterns that a developer can use to get a page to load faster. Consider the following:

- Avoid unnecessary recalculation 
- Do less 
- Offloading the UI thread 

### Pattern - Avoid unnecessary recalculation 

To avoid unnecessary recalculation of expensive results, consider caching that data yourself and refresh the cache on a regular basis. Maybe you want to show the top 5 open sales orders, or a list of VIP customers on the role center. The content of such a list probably does not change significantly every hour, so there is no need to calculate that from raw data every time the page is loaded. Instead, create a table that can contain the calculated data and refresh every hour/day using a background job.

Another example of unexpected recalculation is when using query objects. In contrast to using the record API, query results are not cached in the primary key cache in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server. Any use of a query object will always go to the database. So, sometimes it is faster to not use a query object. 

### Pattern - Do less 

One way to speed up things is to reduce the work that the system must do. For example, to reduce slowness of role centers, consider how many page parts are needed for the user. An additional benefit of a simple page with few UI elements can also be ease of use and navigation.

Remove calculated fields from lists if they are not needed. Especially on larger tables or if inadequate indexing is present, calculated fields can significantly slow down a list page.

Consider creating dedicated lookup pages instead of the normal pages when adding a lookup (the one that looks like a dropdown) from a field. Default list pages will run all triggers and FactBoxes even if they are not shown in the lookup. As an example, in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 release wave 1, dedicated lookup pages for Customer, Vendor, and Item were added to the Base Application.
 
### Pattern - Offloading the UI thread 

To get to a responsive UI fast, consider using Page Background Tasks for calculated values, for example, the values shown in cues.

For more information about Page Background Tasks, see [Page Background Tasks](../developer/devenv-page-background-tasks.md).

## Writing efficient Web Services 

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] has support for Web services to make it easier to integrate with external systems. As a developer, you need to think about performance of web services both seen from the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server (the endpoint) and as seen from the consumer (the client). 

### Endpoint performance  

You should avoid using standard UI pages to expose as web service endpoints. A lot of things such as FactBoxes are not exposed in OData, but will use resources to compute.

Things that have historically caused performance on pages that are exposed as endpoints are:

- Heavy logic in `OnAfterGetCurrRecord`
- Many SIFT fields 
- FactBoxes 
 
Instead of exposing UI pages as web service endpoints, use the built-in API pages as they have been optimized for this scenario. Do select the highest API version available. And please do not use the beta version of the API pages.

Read more about API pages, see [API Page Type](../developer/devenv-api-pagetype.md).

### Web service client performance 

The online version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server has set up throttling limits on web service endpoints to ensure that excessive traffic cannot cause stability and performance issues.

Make sure that your client respects the two HTTP status codes *429 (Too Many Requests)* and *504 (Gateway Timeout)*.

Handling Status Code 429 requires the client to adopt a retry logic while providing a cool off period. Different strategies such as regular interval retry, incremental intervals retry, exponential back-off, or even randomization can be applied.

Handling 504 - Gateway Timeout requires the client to refactor long running request to execute within time limit, but splitting the request into multiple requests - and then dealing with potential 429, by applying a back off strategy.

Read more about web service limits, see [Working with API limits in Dynamics 365 Business Central](/dynamics-nav/api-reference/v1.0/dynamics-rate-limits).

## Writing efficient reports

Reports in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are typically either very specific to a single instance of an entity (for example, an invoice), or of a more analytical nature that joins data from multiple instances of multiple entities. Typically, performance issues in reports is in the latter category. These topics contain advice to implement faster reports: 

- How to use queries to implement fast reports, see [Queries in Business Central](../developer/devenv-query-overview.md).

- Compared to Word layouts, RDL layouts can result in slower performance with document reports, regarding actions that are related to the user interface (for example sending emails). For more information, see [Creating an RDL Layout Report](../developer/devenv-howto-rdl-report-layout.md).


## AL performance patterns 

Knowledge about different AL performance patterns can greatly improve the performance of the code you write. In this section, we will describe the following patterns and their impact on performance.

- [Use built-in data structures](#builtindatastructure)  
- [Run async (and parallelize)](#runasync)  
- [Use set-based methods instead of looping](#setbasedmethods)  
- [Other AL performance tips and tricks](#tips)  


### <a name="builtindatastructure"></a>Pattern - Use built-in data structures 
AL comes with built-in data structures that have been optimized for performance and server resource consumption. Make sure that you are familiar with them to make your AL code as efficient as possible.  

When concatenating strings, make sure to use the `TextBuilder` datatype and not repeated use of the `+=` operator on a `Text` variable. For more information, see [TextBuilder Data Type](../developer/methods-auto/textbuilder/textbuilder-data-type.md).

If you need a key-value data structure that is optimized for fast lookups, use a `Dictionary` data type. For more information, see [Dictionary Data Type](../developer/methods-auto/dictionary/dictionary-data-type.md).

Use a `List` data type if you need an unbound “array” (where you would previously create a temporary table object). For more information, see [](../developer/methods-auto/list/list-data-type.md).


### <a name="runasync"></a>Pattern - Run async (and parallelize) 
It is often desirable to offload AL execution from the UI thread to a background session. 

Here are some examples of this pattern:

- Do not let the user wait for batches 
- Split big tasks into smaller tasks and run them in parallel

There are many different ways to spin up a new task:

- [Job Queue](/business-central/admin-job-queues-schedule-tasks)  
- [TaskScheduler.CreateTask](../developer/methods-auto/taskscheduler/taskscheduler-data-type.md)  
- [StartSession](../developer/methods-auto/session/session-startsession-method.md)  
- [Page Background Task](../developer/devenv-task-scheduler.md)  

They come with different characteristics as described in this table:

|Method to start a new task | Properties |
|---------------------------|------------|
| Page Background Task      | Can (will) be canceled <br> Read-only <br> Callback to parent session <br> Lightweight |
| StartSession              | Created immediately <br> Runs on same server <br> Not as controlled as a Page Background Task |
| Task                      | Queued up <br> Any server in a cluster can start it <br> Survives server restarts <br> No logging | 
| Job queue                 | Scheduled <br> Recurrence <br> Any server in a cluster can start it <br> Survives server restarts <br> Logging of results |


### <a name="setbasedmethods"></a>Pattern - Use set-based methods instead of looping 

The AL methods such as `FINDSET`, `CALCFIELDS`, `CALCSUMS`, and `SETAUTOCALCFIELDS` are examples of set-based operations that are much faster than looping over a result set and do the calculation for each row.

- [CALCFIELDS, CALCSUMS, and COUNT](../administration/optimize-sql-al-database-methods-and-performance-on-server.md#calc) 
- [FindSet Method](../developer/methods-auto/recordref/recordref-findset-method.md)

One common use of the `CALCSUMS` method is to efficiently calculate totals. 

Try to minimize work done in the `OnAfterGetRecord` trigger code. Common performance coding patterns in this trigger are:

- Avoiding `CALCFIELDS` calls (defer this till the end)
- Avoiding repeated calculation (move these outside the loop, if possible) 
- Avoid changing filters (this requires the server to throw away the resultset)

Consider using a query object if you want to use a set-based coding paradigm. These pros and cons for using query objects:

|Pros for using a query object|Cons for using a query object | 
|-----------------------------|------------------------------|
| - Will bypass the AL record API where server reads all fields. <br> - With a covering index, you can get fast read performance for tables with many fields. <br> - Can join multiple tables. | - Query object result sets are not cached in the servers primary key (data) cache. <br> - No writes are allowed. <br> - You cannot add a page on a query object. |

Read more about query objects here:

- [Using Queries Instead of Record Variables](../developer/devenv-query-using-instead-record-variables.md)  
- [Query object](../developer/devenv-query-object.md)  
- [Query overview](../developer/devenv-query-overview.md)  
- [TopNumberOfRows Property](../developer/properties/devenv-topnumberofrows-property.md)  
- [Query Objects and Performance](../administration/optimize-sql-query-objects-and-performance.md)

### <a name="tips"></a>Other AL performance tips and tricks 

If you need a fast, non-blocking number sequence that can be used from AL, take a look at the number sequence object type in AL. Use a number sequence object if you: 

- Do not want to use a number series. 
- Can accept holes in the number range. 

For more information, see [NumberSequence Data Type](../developer/methods-auto/numbersequence/numbersequence-data-type.md).

### Table extension impact on performance

Table extensions are eager joined in the data stack when accessing the base table, and it is currently not possible to define indexes that span base and extension fields. Therefore, you should avoid splitting your code into too many table extensions. Also, be careful about extending central tables such as General Ledger entry, as this can severely hurt performance. 

An alternative when doing data modelling for extending a table with new fields is to use a related table and define a FlowField on the base table. 

These are the pros and cons of the two ways to data model this:

|Data model for extending a table | Properties |
|---------------------------------|-------------|
|Table extension | Fields can be added to lists and are searchable. <br> Always loaded with the base table. <br> Expensive at runtime but easy to use. <br> Use only for critical fields. |
| Related tables | Need to set up table relations. <br> Dedicated page for editing. <br> Requires flow field to be shown in lists. <br> Does not affect performance of base table. <br> Excellent for FactBoxes. | 

### Limit your event subscriptions

The following are best practices for getting performant events:

- There is no significant cost of having a publisher defined.
- Static automatic has a cost over manually binding (there is an overhead of creating and disposing objects).
- Codeunit size of the subscriber matters. Try to have smaller codeunits.
- Use single instance codeunits for subscribers, if possible.

Be aware that table events change the behavior of SQL optimizations on the [!INCLUDE[server](../developer/includes/server.md)]:

- The [!INCLUDE[server](../developer/includes/server.md)] will issue SQL update/delete statements row in a for loop rather than one SQL statement.
- Impacts `MODIFYALL`/`DELETEALL` methods that normally do bulk SQL operations to be forced to do single row operations.

## Efficient data access 

Many performance issues are related to how data is defined, accessed, and modified. As an AL developer, it is important to know about how concepts in AL metadata and the AL language translate to their counterparts in SQL.  
  
### Tables and keys 

Many performance issues can be traced back to missing indexes (also called keys in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]), but index design is often not a key skill for AL developers. In order to have good performance even when (a lot of) data is added to the system, it is imperative to design appropriate indexes according to the way your code will access data. 

These topics on indexing are very relevant to know as an AL developer:

- [Table Keys and Performance in Business Central](../administration/optimize-sql-table-keys-and-performance)  
- [Key Property](../developer/properties/devenv-key-property.md) 
- [About SQL Server indexes](https://docs.microsoft.com/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described?view=sql-server-ver15)

Indexes have a cost to update, so it is recommended to not use them too frequently. 

 
### SumIndexField Technology (SIFT)

SumIndexField Technology (SIFT) lets you quickly calculate the sums of numeric data type (Decimal, Integer, BigInteger, and Duration) columns in tables, even in tables with thousands of records. SIFT is used to optimize the performance of FlowFields and query results in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. 

Ensure appropriate SIFT indices for all FlowFields of type sum or count. 

Read more about SIFT here:

- [SumIndexField Technology (SIFT)](../developer/devenv-sift-technology.md)  
- [SIFT and Performance](../developer/devenv-sift-performance.md)  
- [Tuning and Tracing](../developer/devenv-sift-tuning-and-tracing.md)  
- [SIFT and SQL Server](../developer/devenv-sift-and-sql-server.md)  

This topic can sometimes help to find missing SIFT indexes on flowfields. For more information, see [Troubleshooting: Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](../administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md). 


### How AL relates to SQL 

Even though the AL programming language hides away how data is read and written to the database, to effectively code for performance you need to know how AL statements translate to the equivalent SQL statements. 

The following topics cover how AL relates to SQL:

- [AL Database Methods and Performance on SQL Server](../administration/optimize-sql-al-database-methods-and-performance-on-server.md)  
- [Data Access](../administration/optimize-sql-data-access#-server-data-caching.md)  
- [Data read/write performance](../administration/optimize-sql-data-access.md#readwrite)  
- [Bulk Inserts](../administration/optimize-sql-bulk-inserts.md)  

### How to get insights into how AL translates to SQL 

If you want to track how the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server translates AL statements to SQL statements, you can either use database statistics in the AL debugger, or use telemetry on long running queries.

Read more here:

- [About database statistics in the AL debugger](https://docs.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-debugging#DebugSQL)
- [Telemetry on Long Running SQL Queries](https://docs.microsoft.com/dynamics365/business-central/dev-itpro/administration/monitor-long-running-sql-queries-event-log#ApplicationInsights)

## Testing and validating performance 

It is imperative to test and validate a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] project before deploying it to production. In this section you find resources on how to analyze and troubleshoot performance issues as well as guidance on how to validate performance of a system. 

### Performance Unit Testing

Use the `SessionInformation` data type in unit tests that track the number of SQL statements and/or rows read before and after the code to be tested and asserts normal behavior. For more information, see [SessionInformation Data Type](../developer/methods-auto/sessioninformation/sessioninformation-data-type.md).

### Performance telemetry

The following performance telemetry is available in Azure Application Insights (if that has been configured for the environment). 
- [Long Running SQL Queries](../administration/tenant-admin-center-telemetry#sending-telemetry-to-microsoft-azure-application-insights-preview.md).

### Troubleshooting

The following topics can be of help in troubleshooting performance issues:

- [Find missing SIFT indexes for FlowFields by Disabling SmartSQL](../administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md)  
- [Use Page Inspection to find extensions participating on a page](../developer/devenv-inspecting-pages.md)

## Tuning the Development Environment 

The following articles explain what you can do as a developer to tune your development environment for better performance:

- [Optimizing Visual Studio Code for AL Development](../developer/devenv-optimize-visual-studio-code.md)  
- [Code Analysis on large projects](../developer/devenv-using-code-analysis-tool#enabling-code-analysis-on-large-projects.md)

## See Also

[Performance Overview](performance-overview.md)  
[How Application Configurations Affect Performance](performance-application.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
