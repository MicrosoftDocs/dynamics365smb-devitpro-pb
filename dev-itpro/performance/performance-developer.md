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

# Performance Developer

In this topic you can read about ...

[Writing efficient pages]() 
[Writing efficient Web Services]()
[Writing efficient reports]()
[AL performance patterns]() 
[Efficient Data access]()
[Testing and validating performance]() 
[Tuning the Development Environment]() 


## Writing efficient pages
<!-- (GAP: most content in this section has not been written yet) -->
To get a page to load fast, there are a number of patterns that a developer can use 

- Avoid Unnecessary Recalculation 
- Do less 
- Offloading the UI thread 


### Avoid Unnecessary Recalculation 

cache data yourself 

Gotcha! Query results are not cached in the primary key cache 

### Do less 

To reduce Role center slowness: Consider how many page parts are needed 

Remove calculated fields from lists 

Create dedicated lookup pages 

Lookup (that looks like a dropdown) from a field opens the default list with all triggers and factboxes 

In 2019w1 we added dedicated lookup pages for Customer, Vendor and Item 

 
### Offloading the UI thread 

Consider using Page Background Tasks for cues 

For more information, see [Page Background Tasks](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-page-background-tasks) <!-- change link -->

 

## Writing efficient Web Services 

<!-- GAP: most content in this section has not been written yet  -->

Business Central has support for Web services to make it easier to integrating with external systems. As a developer, you need to think about performance of web services both seen from the BC server (the endpoint) and as seen from the consumer (the client). 


End point performance  

Avoid using standard UI pages for OData calls 

Heavy logic in OnAfterGetCurrRecord 

Many SIFT fields 

Interaction with factboxes 

 
Use dedicated API pages instead 

Select the highest API version possible 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-api-pagetype 

 

Client 

The online version of business central server has setup throttling limits on webservices endpoints to ensure that excessive traffic cannot cause stability and performance issues.   

TODO: Link to online limits (this exists in docs) 

 

## Writing efficient reports

Reports in BC are typically either very specific to a single instance of an entity (e.g. an invoice), or of a more analytical nature that joins data from multiple instances of multiple entities (e.g. XXX). Typically, performance issues in reports is in the latter category. These topics contain advice to implement faster reports: 

How to use queries to implement fast reports: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-overview 

RDL vs. Word layout performance: RDLC 

TODO: readonly intent (when we get to 16.0) 

## AL performance patterns 

Knowledge about different AL performance patterns can greatly improve the performance of the code you write. In this section, we will describe the following patterns and their impact on performance 

Use built-in data structures 

Run async (and parallelize) 

Use set based methods instead of looping 

Other AL performance tips and tricks 

 

<!-- Kennie: todo -->

Pattern: Avoid Unnecessary Recalculation 

Pattern: Do less 

Pattern: Use optimistic locking 

Pattern: Limit your Event Subscriptions 

Pattern: Know your data stack 

 

Use set based methods instead of looping 

Minimize work in OnAfterGetRecord 

Avoid CALCFIELDS calls 

Avoid repeated calculation (see example on slide 13 in [Directions EMEA 2019]) 


Use CALCSUMS function to calculate totals (see example on slide 14 in [Directions EMEA 2019]) 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-al-database-methods-and-performance-on-server#calcfields-calcsums-and-count 

 

Avoid changing filters in OnAfterGetRecord 

Requires us to throw away the resultset 

 

Consider using a query object 

Pros 

Will bypass the AL record data stack, where server reads all fields: 

Record.GET ~ SELECT field1, …, field100 FROM <table> WHERE … 

With covering index, you can get fast read perf for wide tables 

Can join multiple tables 

 

Cons 

Query object result sets are not cached in the Business Central server data cache 

No writes 

Cannot add a page on a query object  


https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-query-objects-and-performance 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/recordref/recordref-findset-method  

Using queries instead or record variables: 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-using-instead-record-variables 

 

Set-based logic: 

Query object: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-object 

Query overview: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-overview 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-topnumberofrows-property 

 

 

 

Use built-in data structures 

Use TextBuilder when concatenating strings:  

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/textbuilder/textbuilder-data-type 

See slide 26-27 in [Directions EMEA 2019] 

When to use a dictionary  

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/dictionary/dictionary-data-type 

See slide 24 in [Directions EMEA 2019] 

When to use a list 

See slide 25 in [Directions EMEA 2019] 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/list/list-data-type 

 

 

Run async (and parallelize) 

Async execution (offload execution from the UI thread to a background session) 

Don’t let the user wait for batches 

Use the CPU cores on your box (mainly for on-prem) 

Splitting tasks into smaller tasks 

 

Many different ways to spin up a new task 

Job Queue 

https://docs.microsoft.com/en-us/dynamics365/business-central/admin-job-queues-schedule-tasks 

TaskScheduler.CreateTask 

StartSession 

Page Background Task 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-task-scheduler 

 

Background session options (pros and cons). See slide 41 in [Directions EMEA 2019] 

 

 

 

 

Other AL performance tips and tricks 

IsDirty method: 

number sequence object type in AL 

Fast, non-blocking number sequences that be used from AL 

Use if you: 

- Do not want to use a number series 

- Accept holes in the number range  

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/numbersequence/numbersequence-data-type 

 

Security filtering (maybe both here and in data access) 

 

 

Know your data stack (what every AL developer needs to know about databases) 

Many issues stem from missing indexes. 

Ensure appropriate SIFT indices for all FlowFields of type sum or count. 

Consider indexes matching integration scenarios 

Use SystemID instead of RECORDID 

 

And yes, indexes have a cost to update, so don’t overdo it. 

 

 

 

 

 

GAP: Table extension impact on performance 

Extensions are eager joined in the data stack 

No indexes spanning base and extension fields 

Avoid splitting into too many extension 

Be careful about extending central tables 

Table extension vs. related table 

See pros and cons on slide 19 in [Directions EMEA 2019] 

 

 

GAP: Limit your Event Subscriptions 

See slides 29-32 in [Directions EMEA 2019] 

 

 

Add links to patterns that are related to perf when they are in docs 

 

Efficient Data access 

Many performance issues is related to how data is defined, accessed, and modified. As an AL developer, it is important to know about how concepts in AL metadata and the AL language translate to their counterparts in SQL.  

  

Tables and keys 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-table-keys-and-performance 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-key-property 

 

SIFT: 

Overview: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sift-technology 

 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sift-performance 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sift-tuning-and-tracing 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sift-and-sql-server 

 

 

How AL relates to SQL 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-al-database-methods-and-performance-on-server 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-data-access#-server-data-caching 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-data-access#data-readwrite-performance 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-bulk-inserts 

GAP: Security filtering 

 

How to get insights into how AL translates to SQL 

Debugging in C/SIDE or VSCODE – get database stats 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-debugging#DebugSQL  

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql  

 

 

Testing and validating performance 

It is imperative to test and validate a business central project before deploying it to production. In this section you find resources on how to analyze and troubleshoot performance issues as well as guidance on how to validate performance of a system. 

 

Troubleshooting 

Long Running SQL Queries Involving FlowFields by Disabling SmartSQL 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql  

Page Inspection: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-inspecting-pages 

 

Performance Testing (We have a gap here) 

ALL THE NAV TESTING LINKS MUST BE VALIDATED TO SEE IF THIS IS STILL USEFULL 

Validating performance 

Instrumenting Telemetry 

 

Technical checklist before submitting to AppSource: 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/compliance/apptest-onbeforecompanyopen 

 

 

The Dynamics NAV performance testing Framework  

https://github.com/NAVPERF 

  

Demo how do I videos:  

How Do I: Write Microsoft Dynamics NAV Load Tests Scenarios Using Visual Studio: Part 1 

https://www.youtube.com/watch?v=GULQmkhGiHo 

  

How Do I: Write Microsoft Dynamics NAV Load Tests Scenarios Using Visual Studio: Part 2 

https://www.youtube.com/watch?v=KsJIWEYYp1s 

  

How Do I: Run NAV Load Tests Using Visual Studio in Microsoft Dynamics NAV 

https://www.youtube.com/watch?v=IG-y8DsXqaQ 

  

Setting Up Test Controllers and Test Agents to Manage Tests with Visual Studio  

https://msdn.microsoft.com/en-us/library/hh546459.aspx 

 

 

 

 

Tuning the Development Environment 

The following articles explain what you can do as a developer to tune your development environment to go faster: 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-optimize-visual-studio-code 

Code Analysis: https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-using-code-analysis-tool#enabling-code-analysis-on-large-projects 






## See Also