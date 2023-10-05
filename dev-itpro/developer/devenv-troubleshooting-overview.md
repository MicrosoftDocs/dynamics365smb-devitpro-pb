---
title: Troubleshooting overview
description: An overview of tools and processes that help troubleshoot issues in Business Central.
ms.custom: na
ms.date: 09/11/2023
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: overview
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Troubleshooting overview

The following sections help you troubleshoot issues with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] so that you can *gather information* about a given problem, *identify the cause* of the problem, and eventually *implement a sustainable solution* that does not introduce new issues. Use the tools provided in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to gain insights on trends in application behavior, identify performance issues, database locks, and more. Use profiling combined with debugging in sandboxes, or snapshot debugging in production environments to pinpoint what causes a specific issue. And if you want to investigate and troubleshooting things after they happened, then use telemetry and the tools around that feature.


## Troubleshooting in the client
These tools provided in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client can help you gain insights on trends in application behavior, identify performance issues, database locks, and more. 

- Investigate root causes for errors with [Copy details in the error dialog](devenv-error-dialog.md)
- Investigate page data, filters, and load times with the [Page Inspector](/dynamics365/business-central/across-inspect-page)
- See if the events you rely on are fired as expected with the [Event Recorder](devenv-events-discoverability.md)
- Check for unexpected table sizes with [Tables Information](/dynamics365/business-central/admin-view-table-information)
- Find locks with [Database Locks](/dynamics365/business-central/admin-view-database-locks)
- Identity whether there are [Missing indexes/Keys](../administration/database-missing-indexes.md)
- Analyze database bottlenecks with [Database wait statistics](../administration\database-wait-statistics.md)
- Identify performance issues with the [Performance Profiler](../administration/performance-profiler-overview.md)
- Verify report dataset with [Save Report Dataset to Excel](/dynamics365/business-central/report-analyze-excel)
- Check personalization issues with [Personalized Pages](/dynamics365/business-central/ui-personalization-user)  
- Mitigate can't start user personalization issues with [Troubleshooting user personalization can't be started](devenv-troubleshooting-user-personalization.md)  
- Check customization issues with [Customized Pages](/dynamics365/business-central/ui-personalization-manage)
- Mitigate can't start profile configuration issues with [Troubleshooting profile configuration can't be started](devenv-troubleshooting-profile-configuration.md)
- Verify user permissions with [Effective Permissions](/dynamics365/business-central/ui-define-granular-permissions)
- Investigate issues with [Mobile App On-Premises](devenv-troubleshooting-the-mobile-app.md)
- Investigate issues with [Troubleshoot in Visual Studio Code directly from the web client](devenv-troubleshoot-vscode-webclient.md).


## Troubleshooting in AL
Use profiling combined with debugging in sandboxes, or snapshot debugging in production environments to pinpoint what causes a specific issue.

- [Debug AL code](devenv-debugging.md) in sandboxes with customer data
- [Capture Snapshots](devenv-snapshot-debugging.md) in production environments and debug offline
- Find AL performance issues with the [AL Profiler](devenv-al-profiler-overview.md) in Visual Studio Code
- Investigate [Printer and Report Payloads](devenv-reports-troubleshoot-printing.md) when working with reporting
- [Inspecting and Troubleshooting Pages](devenv-inspecting-pages.md) to help identify data issues
- Identifying and working with [Performance Issues](../performance/performance-overview.md)
- Investigate and troubleshoot from the web client with [Troubleshoot in Visual Studio Code directly from the web client](devenv-troubleshoot-vscode-webclient.md).

## Troubleshooting with telemetry

Telemetry can be used for troubleshooting things after they happened and it is possible to analyze patterns across sessions.
- Enable telemetry and query telemetry data in [Azure Application Insights](../administration/telemetry-overview.md)
- Find telemetry data on the type of issue you are troubleshooting in [Available telemetry](../administration/telemetry-available-telemetry.md) 
- Use [Power BI](../administration/telemetry-power-bi-app.md) to analyze errors and performance issues
- Use [KQL](../administration/telemetry-analyze-with-kql.md) to analyze errors and performance issues
- [Use telemetry to investigate Performance Issues](../performance/performance-work-perf-problem.md)

## Troubleshooting guides (TSGs)
Apart from the troubleshooting tools described above, the following articles describe ways to troubleshoot various areas and features in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Web services:
- [Troubleshoot web service errors](../webservices/web-service-troubleshooting.md)
- [Troubleshooting OData calls](../webservices/dynamics-error-codes.md)
- [Troubleshooting API calls](../webservices/dynamics-error-codes.md)

Cloud migration:
- [Troubleshoot cloud migration (overview)](../administration/migration-troubleshooting.md)
- [Troubleshoot cloud migration (setup)](../administration/migration-setup-troubleshooting.md)
- [Troubleshoot cloud migration (data replication)](../administration/migration-data-replication-troubleshooting.md)
