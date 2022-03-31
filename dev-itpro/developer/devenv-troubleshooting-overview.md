---
title: "Troubleshooting Overview"
description: "An overview of tools and processes that help troubleshoot issues in Business Central"
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Troubleshooting Overview

The following sections help you troubleshoot issues with Business Central so that you can *gather information* about a given problem, *identify the cause* of the problem, and eventually *implement a sustainable solution* that does not introduce new issues. Use the tools provided in the Business Central client to gain insights on trends in application behavior, identify performance issues, database locks, and more. And use profiling combined with debugging in sandboxes, or snapshot debugging in production environments to pinpoint what causes a specific issue.

## Troubleshooting in the client

- Investigate page data, filters, and load times with the [Page Inspector](/dynamics365/business-central/across-inspect-page).
- See if the events you rely on are fired as expected with the [Event Recorder](devenv-events-discoverability.md).
- Check for unexpected table sizes with [Tables Information](/dynamics365/business-central/admin-view-table-information).
- Find locks with [Database Locks](/dynamics365/business-central/admin-view-database-locks).
- Identify performance issues with the [Performance Profiler](../administration/performance-profiler-overview.md).
- Verify report dataset with [Save Report Dataset to Excel](/dynamics365/business-central/report-analyze-excel).
- Check personalization issues with [Personalized Pages](/dynamics365/business-central/ui-personalization-user).
- Check customization issues with [Customized Pages](/dynamics365/business-central/ui-personalization-manage).
- Verify user permissions with [Effective Permissions](/dynamics365/business-central/ui-define-granular-permissions).
- Investigate issues with [Mobile App On-Premises](devenv-troubleshooting-the-mobile-app.md).


## Troubleshooting in AL

- [Debug AL code](devenv-debugging.md) in sandboxes with customer data.
- [Capture Snapshots](devenv-snapshot-debugging.md) in production environments and debug offline.
- Find AL performance issues with the [AL Profiler](devenv-al-profiler-overview.md) in Visual Studio Code.
- Investigate [Printer and Report Payloads](devenv-reports-troubleshoot-printing.md) when working with reporting.
- [Inspecting and Troubleshooting Pages](devenv-inspecting-pages.md) to help identify data issues.
- Identifying and working with [Performance Issues](../performance/performance-overview.md).
