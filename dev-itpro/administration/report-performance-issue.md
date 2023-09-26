---
title: Report a performance issue
description: Learn about how to report a performance issue on behalf of your Business Central online customers as the delegated administrator.
author: kennienp
ms.topic: conceptual
ms.date: 05/24/2023
ms.author: kepontop
ms.service: dynamics365-business-central
ms.custom: bap-template
ms.reviewer: jswymer
---

# Report a performance issue

When a customer has a situation where performance is problematic, you might need to raise a support ticket, see how to do that here: [Escalate Support Issues to Microsoft](raise-support-case.md).

> [!TIP]
> It's possible to self-diagnose AL performance issues via the in-client Performance Profiler and/or telemetry. If the problem pertains to AL execution, we require this to be done before reaching out for further support. See how to use the Performance Profiler here: [Performance Profiler Overview](performance-profiler-overview.md). The article [How to work with a performance problem](../performance/performance-work-perf-problem.md) might also help you understand the performance tuning process and the tools you have available for performance analysis.

Before you create a support request for a performance issue, you must provide information on what is wrong, when it happens, and for whom. This article specifies what information support engineers need to work on performance issues.

## Troubleshooting tools and guides
[!INCLUDE [troubleshooting-overview](../includes/include-troubleshooting-overview.md)]

## To report a performance issue

In order for support engineers to be able to work on the issue, they need some basic information about when and where the issue occurs and steps to reproduce the problem.

If self-diagnosing doesn't yield any results, we require more information regarding the issue, specifically:

* What operations aren't performing well?
* Is it opening certain pages, clicking certain actions, navigating the UI, writing in values, and so on? Provide examples with date and time (in UTC timezone) when and what was done.
* Is the performance issue intermittent or are there some patterns? 
* Does it only happen in the morning/during lunch hours? 
* Does the issue occur on a specific time and day? Or has the issue always been happening?
* Are the performance issues only happening for specific users?
* Are the performance issues only happening in a specific company?
* Has any new extension recently been installed? (you can see this information in telemetry)
* Have any customizations been done to the pages in question?
* Are the performance issues only happening in certain browsers? (you can see this information in telemetry)

If the issue can be reproduced, do the following tasks:

1. Go to the _Help and Support_ page (see [The Help and Support page in the Business Central company](manage-technical-support.md#helpsupport)).
2. Note down the time (in UTC timezone).
3. Enable additional logging (Find it under _Report a Problem_).
4. Note down the Session ID, Azure AD tenant ID, and Environment name.
5. Enable the in-client Performance Profiler, see [In-Client Performance Profiler Overview](performance-profiler-overview.md) for details.
6. Reproduce the issue.
7. Download the profile file.

When creating the support request, provide this information:

* Time (in UTC timezone) when additional logging was enabled
* Session ID, Azure AD tenant ID, and Environment name
* Performance profile file
* Optionally, screenshots of error screens because they contain useful operation IDs that help us track down the issue.
* Optionally, screen recordings of the issue. A recording is only a supplement to having a performance profile file.

The following article takes you through creating a support request: [Escalate Support Issues to Microsoft](raise-support-case.md).

## See Also

[Escalating Support Issues to Microsoft](raise-support-case.md)  
[Managing Technical Support](manage-technical-support.md)  
[Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Technical Support for Business Central](../technical-support.md)  
[Provide technical support (Microsoft Partner Center)](/partner-center/provide-technical-support)  
[Deployment Overview](../deployment/Deployment.md)  
[Administration as a partner](tenant-administration.md#administration-as-a-partner)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central On-Premises](Administration.md)  
[In-Client Performance Profiler Overview](performance-profiler-overview.md)  
