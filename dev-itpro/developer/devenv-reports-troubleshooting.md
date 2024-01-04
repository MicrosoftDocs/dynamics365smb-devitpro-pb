---
title: Troubleshooting reports
description: Learn about how to troubleshoot Business Central reports
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 01/04/2024
---

# Troubleshooting report errors

If reports fail to generate or take too long time to generate, you might need to investigate why. This article contains strategies for analyzing report telemetry to find possible root cases for such errors or slow performance.

## Ways a report can fail

As described in the [Report Object](devenv-report-object.md) article, a report has code for its dataset, typically a layout used for rendering a document (Excel, Word, or PDF) and a request page. When the report runs, your AL code might call methods on the report object (static or on the report instance) and/or run code in triggers/event subscribers on report events.

A report in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can fail in either of these phases:

- In the request page
- When generating the report dataset
- When rendering the report with a layout
- In any of the *OnAfterDocument* triggers

## Troubleshooting report datasets and layouts

If a report layout isn't working as expected, you might need to investigate whether the issue is in the dataset. 

### Troubleshooting RDL report layouts

When you're developing and debugging an RDL report layout, it can be useful to get a copy of the report dataset in the XML format used by the RDL engine. 

[!INCLUDE [send-report-xml](../developer/includes/send-report-xml.md)]

### Troubleshooting Excel/Word report layouts

When you're developing and debugging an Excel/Word report layout, it can be useful to get a copy of the report dataset in Excel to see the actual data values in there. 

[!INCLUDE [send-report-excel](../developer/includes/send-report-excel.md)]


## Troubleshooting report AL code

When you're looking at the AL stacktrace from a report error message, it might not be obvious in which of these components the error was triggered. This is especially true for code failing in event subscribers on report events. 

You can troubleshoot report errors using a debugger or with telemetry:

- If the error occurs when running AL code, the most effective way to troubleshoot might be to attach a debugger.
- If the error occurs in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform or if you want to investigate an error that was reported by a user a few days ago, the most effective way to troubleshoot the report error is using telemetry. Report telemetry has information not available in the AL stacktrace, namely the [!INCLUDE[prod_short](includes/prod_short.md)] server exception that triggered the error. 

In the paragraphs that follow, you can read more about report error telemetry and how to use that to identify the cause and possible solutions or mitigations for report errors.

## Reporting telemetry

[!INCLUDE[report_telemetry_intro](../includes/include-report-telemetry-intro.md)]

When you run a report, either from the UI, in a background session, or from a web service call, it might fail. The failure can either be in the AL code of the report or in the layout. When a report fails to generate, you get an RT0006 event in telemetry and the `result` column in the `customDimensions` includes the title of the exception that was thrown by the service or the AL code. 

[!INCLUDE[telemetry_error_kql](../includes/include-report-telemetry-error-kql.md)]

For more information, see [Report telemetry](../administration/telemetry-reports-trace.md).

## Reporting exceptions

In the following table, we list some common report exceptions thrown by the [!INCLUDE[prod_short](includes/prod_short.md)] server and suggestions to how to fix them. 

The different exceptions in the table are grouped by the following severities:

- **Error** (this severity is likely an error in the report or the code around the report invocation)
- **TransientError** (this severity was likely due to a transient issue in the infrastructure running [!INCLUDE[prod_short](includes/prod_short.md)] and can likely be resolved by a retry)
- **Warning** (this severity is likely not an error in the report. The issue can likely be resolved by fixing something in the environment, such as changing the permissions for a user/role)

<br>


[!INCLUDE[exception_table](includes/include-report-exception-table.md)]

[!INCLUDE[report_exception_paragraphs](includes/include-report-exception-paragraphs.md)]



## Report performance

[!INCLUDE[report_performance](../includes/include-report-performance.md)]

For more information, see [Report performance](devenv-report-performance.md)

## See also

[Testing a report](devenv-testing-reports.md)   
[Report performance](devenv-report-performance.md)   
[Report telemetry](../administration/telemetry-reports-trace.md)   
