---
title: "Performance Profiler Overview"
description: Describes how to use the Performance Profiler page to troubleshoot slow processes.
ms.author: bholtorf
ms.custom: na
ms.date: 02/21/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: bholtorf
---
# Performance Profiler Overview
Administrators can use the Performance Profiler page to investigate why business processes are slow to run. If you notice that a process takes longer than expected, you can use the Performance Profiler to record a performance profile of it. By default, a "slow" process is anything that takes more than 200 milliseconds. 

While recording, the profiler monitors all of the apps that are involved in the process. These include first-party apps from Microsoft, such as the Base Application and System Application, and any third-party apps that you have installed.

When you stop recording you'll get two flavors of insight:

* The **Time Spent** chart shows how many milliseconds each app took to complete its part.
* The **Active Apps** chart shows how much faster the process could be if you remove each app.

You can use the **App Name** and **App Publisher** actions to filter the charts, for example, to view the performance of apps from a particular publisher.

> [!TIP]
> It's a good idea to open the Performance Profiler page in a separate browser window while you record a process. That makes it easier to return to the profiler to stop the recording. 

## Required permissions
To record a process, you must be an administrator, and you must be assigned the **D365 SNAPSHOT DEBUG** permission set.

## Viewing technical information
If you want to dig into the technical specifics yourself, you can turn on the **Show technical information** toggle. That adds the **Time Spent by Application Object** and **Call Tree** FastTabs

### Time Spent by Application Object
This FastTab shows the objects, such as pages, codeunits, and tables, that were involved in the process. The interesting things here are the **Time Spent** and **Samples** columns.  

### Call Tree
The **Self Time** and **Total Time** columns show where time is spent in the code. The **Self Time** column shows the amount of time spent in the method only, and excludes calls out of the method. The **Total Time** field is the Self Time amount *plus* calls out of the method. 

## Downloading and Sharing Performance Profiles


## See Also
[AL Profiler Overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview)  