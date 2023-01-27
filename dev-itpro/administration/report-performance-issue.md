---
title: Report a Performance Issue
description: Learn about how to report a performance issue on behalf of your Business Central online customers as the delegated administrator.
author: kepontop

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/27/2023
ms.author: kepontop

---

# Report a Performance Issue

When a customer has a situation where performance is problematic, you might need to raise a support ticket, see how to do that here: [Escalate Support Issues to Microsoft](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/raise-support-case).


> [!TIP] Note that it is possible to self-diagnose AL performance issues via the in-client profiler and/or telemetry. If the problem pertains to AL execution, we require this to be done before reaching out for further support. See how to use the performance profiler here: [Performance Profiler Overview](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/performance-profiler-overview). This article 
[How to work with a performance problem](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/performance/performance-work-perf-problem) might also help you understanding the performance tuning process and the tools you have available for performance analysis.


Before you create a support requests for a performance issue, we need you to provide information on what is wrong, when it happens, and for whom. This article specifies what is needed by support engineers to work on performance issues.


## To report a performance issue
In order for support engineers to be able to work on the issue, they need some basic information about when and where the issue occurs as well as steps to reproduce the problem.

If self-diagnosing does not yield any results, we require more information regarding the issue, specifically:
* What operations are not performing well?
* Is it opening certain pages, clicking certain actions, navigating the UI, writing in values, etc? Please provide examples with date and time (in UTC timezone) when and what was done.
* Is the performance issue intermittent or is there some patterns? 
* Does it only happen in the morning/during lunch hours? 
* Does the issue occur on a specific time and day? Or has the issue always been happening?
* Are the performance issues only happening for specific users?
* Are the performance issues only happening in a specific company?
* Has any new extension recently been installed? (you can see this in telemetry)
* Have any customizations been done to the pages in question?
* Are the performance issues only happening in certain browsers? (you can see this in telemetry)


If the issue can be reproduced, please do the following 
1) go to the _Help and Support_ page (see [The Help and Support page in the Business Central company](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/manage-technical-support#helpsupport)).
2) note down the time (in UTC timezone)
3) enable Additional logging (Find it under _Report a Problem_)
4) note down the Session ID, AAD tenant Id, and Environment name
5) now enable the performance profiler, see [Performance Profiler Overview](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/performance-profiler-overview) for details
6) reproduce the issue
7) download the profile file 


When creating the support request, provide this information
* time (in UTC timezone) when additional logging was enabled
* Session ID, AAD tenant Id, and Environment name
* performance profile file
* optionally, screenshots of error screens since they contain useful operation IDs that help us track down the issue.
* optionally, screen recordings of the issue. Note that a recording is only a supplement to having a performance profile file.


This article takes you through creating a support request: [Escalate Support Issues to Microsoft](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/raise-support-case).


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
