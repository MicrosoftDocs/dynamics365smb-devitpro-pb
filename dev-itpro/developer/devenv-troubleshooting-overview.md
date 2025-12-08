---
title: Troubleshooting tools and guides overview
description: An overview of tools and processes that help troubleshoot issues in Business Central.
ms.custom: bap-template
ms.date: 07/01/2025
ms.reviewer: jswymer
ms.topic: overview
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Troubleshooting tools and guides overview

The following sections help you troubleshoot issues with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] so that you can *gather information* about a given problem, *identify the cause* of the problem, and eventually *implement a sustainable solution* that doesn't introduce new issues. Use the tools provided in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to gain insights on trends in application behavior, identify performance issues, database locks, and more. 

Use profiling with debugging in sandboxes, or snapshot debugging in production environments, to pinpoint the cause of a specific issue. To investigate and troubleshoot issues after they occur, use telemetry and its related tools.

## Troubleshooting articles

For a large collection of troubleshooting articles, see the following site provided by Microsoft Support:

- [Microsoft Dynamics 365 Business Central troubleshooting](/troubleshoot/dynamics-365/business-central/welcome-business-central)

  These articles explain how to check, diagnose, and fix issues that you might encounter when using [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The articles are organized by feature area, and each article focuses on a specific issue and its solution.

## Troubleshooting in the client

These tools in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client help you understand trends in application behavior, identify performance issues, database locks, and more. 

- Investigate root causes for errors with [Copy details in the error dialog](devenv-error-dialog.md)
- Investigate page data, filters, and load times with the [Page Inspector](/dynamics365/business-central/across-inspect-page)
- See if the events you rely on are fired as expected with the [Event Recorder](devenv-events-discoverability.md)
- Check for unexpected table sizes with [Tables information](/dynamics365/business-central/admin-view-table-information)
- Find locks with [Database locks](/dynamics365/business-central/admin-view-database-locks)
- Identity whether there are [Missing indexes/keys](../administration/database-missing-indexes.md)
- Analyze database bottlenecks with [Database wait statistics](../administration\database-wait-statistics.md)
- Identify performance issues with the [Performance Profiler](../administration/performance-profiler-overview.md)
- Verify report dataset with [Save report dataset to Excel](/dynamics365/business-central/report-analyze-excel)
- Check personalization issues with [Personalized pages](/dynamics365/business-central/ui-personalization-user)  
- Resolve user personalization issues with [Troubleshooting user personalization can't be started](/troubleshoot/dynamics-365/business-central/client/client-user-personalization) in Microsoft troubleshooting documentation. 
- Check customization issues with [Customized pages](/dynamics365/business-central/ui-personalization-manage)
- Resolve profile configuration issues with [Troubleshooting profile configuration can't be started](/troubleshoot/dynamics-365/business-central/client/client-profile-configuration) in Microsoft troubleshooting documentation
- Verify user permissions with [Effective permissions](/dynamics365/business-central/ui-define-granular-permissions)
- Investigate issues with [Mobile app on-premises](devenv-troubleshooting-the-mobile-app.md)
- Investigate issues with [Troubleshoot in Visual Studio Code directly from the web client](devenv-troubleshoot-vscode-webclient.md).

## Troubleshooting in AL

Use profiling with debugging in sandboxes, or snapshot debugging in production environments to pinpoint the cause of a specific issue.

- [Debug AL code](devenv-debugging.md) in sandboxes with customer data
- [Capture snapshots](devenv-snapshot-debugging.md) in production environments and debug offline
- Find AL performance issues with the [AL Profiler](devenv-al-profiler-overview.md) in Visual Studio Code
- Investigate [Printer and report payloads](devenv-reports-troubleshoot-printing.md) when working with reporting
- [Inspecting and troubleshooting pages](devenv-inspecting-pages.md) to help identify data issues
- Identifying and working with [Performance issues](../performance/performance-overview.md)
- Investigate and troubleshoot from the web client with [Troubleshoot in Visual Studio Code directly from the web client](devenv-troubleshoot-vscode-webclient.md).

## Troubleshooting with telemetry

Telemetry can be used for troubleshooting things after they happened and it is possible to analyze patterns across sessions.

- Ask the user to enable more logging. See [Resources for Help and Support - troubleshooting](/dynamics365/business-central/product-help-and-support#troubleshooting)
- Enable telemetry and query telemetry data in [Azure Application Insights](../administration/telemetry-overview.md)
- Find telemetry data on the type of issue you're troubleshooting in [Available telemetry](../administration/telemetry-available-telemetry.md) 
- Use [Power BI](../administration/telemetry-power-bi-app.md) to analyze errors and performance issues
- Use [KQL](../administration/telemetry-analyze-with-kql.md) to analyze errors and performance issues
- [Use telemetry to investigate performance issues](../performance/performance-work-perf-problem.md)

## Troubleshooting guides

Besides the troubleshooting tools described above, these articles explain how to troubleshoot different areas and features in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Cloud migration:

- [Troubleshoot cloud migration (overview)](../administration/migration-troubleshooting.md)
- [Troubleshoot cloud migration (setup and data replication)](/troubleshoot/dynamics-365/business-central/welcome-business-central) in Microsoft troubleshooting documentation.

Performance:

- [Performance overview](../performance/performance-overview.md)
- [How to work with a performance problem](../performance/performance-work-perf-problem.md)

Reports and printing:

- [Troubleshoot printer errors](./devenv-reports-troubleshoot-printing.md)
- [Troubleshoot report errors](devenv-reports-troubleshooting.md)

Shopify integration

- [Troubleshoot the Shopify connector](/dynamics365/business-central/shopify/troubleshoot)

Web services:

- [Troubleshoot web service errors](../webservices/web-service-troubleshooting.md)
- [Troubleshooting OData calls](../webservices/dynamics-error-codes.md)
- [Troubleshooting API calls](../webservices/dynamics-error-codes.md)

Edit in Excel:

- [Troubleshoot Edit In Excel](/dynamics365/business-central/admin-deploy-excel-addin#known-limitations-in-metadata-generation)