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
If a business process takes longer than expected, your administrators can use the Performance Profiler page to record the process and then investigate it. While recording, the profiler monitors all of the apps that are involved in the process. These include first-party apps from Microsoft, such as the Base Application and System Application, and any third-party apps that you have installed. By default, a "slow" process is anything that takes more than 200 milliseconds. 

<!--Do we want to say something about the fact that the profiles can help identify which support organization the customer should contact?-->

When you stop recording you'll get two types of insights:

* The **Time Spent** chart shows how many milliseconds each app took to complete its part.
* The **Active Apps** chart shows how much faster the process could be if you remove each app.

You can use the **App Name** and **App Publisher** actions to filter the charts, for example, to view the performance of apps from a particular publisher.

> [!TIP]
> It's a good idea to open the Performance Profiler page in a separate browser window while you record a process. That makes it easier to return to the profiler to stop the recording. To open the page in a new window, choose the :::image type="content" source="../media/new-window-icon.PNG" alt-text="Open this page in a new window icon."::: icon in the upper right of the page. 

## Required permissions
To record a process, you must be an administrator, and you must be assigned the **D365 SNAPSHOT DEBUG** permission set.

## Viewing technical information
If you want to dig into the technical specifics yourself, you can turn on the **Show technical information** toggle. That adds the **Time Spent by Application Object** and **Call Tree** FastTabs.

### Time Spent by Application Object
This FastTab shows the objects, such as pages, codeunits, and tables, that were involved in the process. The interesting things here are the **Time Spent** and **Samples** columns. The Time Spent column focuses on the object, and shows how long it was active during the recording. The Samples column shows the number of times that the profiler 

<!--Why do we sample some objects more than others? Is there some kind of trigger?-->

### Call Tree
The **Self Time** and **Total Time** columns show where time is spent in the code. The **Self Time** column shows the amount of time spent in the method only, and excludes calls out of the method. The **Total Time** field is the Self Time amount *plus* calls out of the method. <!--What do you actually learn from these numbers? -->

## Downloading and Sharing Performance Profiles
If you want to share a recording, for example, if you're in contact with the company that provided an app that you think is slowing down a process, you can download the recording and then copy the file to OneDrive.  

## See Also
[AL Profiler Overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview)  