---
title: Troubleshooting reports
description: Learn about how to troubleshoot Business Central reports
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 10/02/2023
---

# Troubleshooting report errors

If reports fail to generate or if they take too long time to generate, you might need to investigate why. This article contains strategies for analyzing report telemetry to find possible root cases for such errors or slow performance.

## Ways a report can fail
As described in the article about the [Report Object](devenv-report-object.md), a report has code for its dataset, typically a layout used for rendering a document (Excel, Word, or PDF), and a request page. When running the report, your AL code might call methods on the report object (static or on the report instance) and/or run code in triggers/event subscribers on report events.


A report in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can fail in either of these phases
1. in the request page
2. when generating the report dataset
3. when rendering the report with a layout
4. in any of the OnAfterDocument* triggers


When looking at the AL stacktrace from a report error message, it might not be obvious in which of these components the error was triggered. This is especially true for code failing in event subscribers on report events. 

You can troubleshoot report errors using a debugger or with telemetry:
- if the error occurs when running AL code, the most effective way to troubleshoot might be to attach a debugger
- if the error occurs in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform or if you want to investigate an error that was reported by a user a few days ago, the most effective way to troubleshoot the report error is use telemetry. Report telemetry has information not available in the AL stacktrace, namely the [!INCLUDE[prod_short](includes/prod_short.md)] server exception that triggered the error. 


In the paragraphs below, you can read more about report error telemetry and how to use that to identify the cause and possible solutions/mitigations for report errors.

## Reporting telemetry

[!INCLUDE[report_telemetry_intro](../includes/include-report-telemetry-intro.md)]

When you run a report, either from the UI, in a background sessions, or from a web service call, it might fail. The failure can either be in the AL code of the report or in the layout. When a report fails to generate, you get an RT0006 event in telemetry and the `result` column in the customDimensions will include the title of the exception that was thrown by the service or the AL code. 


[!INCLUDE[telemetry_error_kql](../includes/include-report-telemetry-error-kql.md)]

For more information, see [Report telemetry](../administration/telemetry-reports-trace.md).

## Reporting exceptions

In the following table, we list some common report exceptions and suggestions to how to fix them.

The different exceptions in the table are grouped by severity
* **Error** (this is likely an error in the report or the code around the report invocation).
* **TransientError** (this error was likely due to a transient issue in the infrastructure running [!INCLUDE[prod_short](includes/prod_short.md)] and can likely be resolved by a retry).
* **Warning** (this is likely not an error in the report as such. The issue can likely be resolved by fixing something in the environment, such as changing the permissions for a user/role).

<br>


[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the excel file defining exceptions in reports.)

[!INCLUDE[exception_table](includes/include-report-exception-table.md)]

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the excel file defining exceptions in reports.)

[!INCLUDE[report_exception_paragraphs](includes/include-report-exception-paragraphs.md)]


[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## Report performance

[!INCLUDE[report_performance](../includes/include-report-performance.md)]

For more information, see [Report performance](devenv-report-performance.md)

## See also

[Testing a report](devenv-testing-reports.md)   
[Report performance](devenv-report-performance.md)   
[Report telemetry](../administration/telemetry-reports-trace.md)   
