---
title: "In-client Performance Profiler overview"
description: Describes how to use the in-client Performance Profiler page to troubleshoot slow processes.
ms.author: bholtorf
ms.custom: na
ms.date: 05/25/2023
ms.reviewer: solsen
ms.search.forms: 24
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: bholtorf
---

# In-client Performance Profiler overview

If a business process takes longer than expected, your administrator can use the **Performance Profiler** page in [!INCLUDE [prod_short](../includes/prod_short.md)] to record a snapshot of the process. While recording, the profiler monitors all of the apps that are involved in the process. These include first-party apps from Microsoft, such as the Base Application and System Application, and any third-party apps that you have installed. Identifying where the holdup is can make it easier to go to the correct support organization or, if you have developers in-house, fix the problem yourself. For more information, see [Viewing technical information](performance-profiler-overview.md#viewing-technical-information).

## Invoking the Performance Profiler page

To get started working with the Performance Profiler, follow these steps:

1. In [!INCLUDE [prod_short](../includes/prod_short.md)], choose the :::image type="content" source="../developer/media/search-icon.png" alt-text="Tell me what you want to do"::: icon, enter **Performance Profiler**, and then choose the related link.
1. Choose the :::image type="content" source="../media/new-window-icon.PNG" alt-text="Open this page in a new window icon."::: icon in the upper right corner of the page.  
    This opens the profiler in a separate window, which is convenient for starting and stopping the recording.
3. Now, still in [!INCLUDE [prod_short](../includes/prod_short.md)], navigate to the page or process that you want to record profiling data for.  
    To get the most accurate results, you should start and stop the recording of the slow process as close to you experience the performance issues.
4. When ready, press the **Start** button in the **Performance Profiler** page, and then perform the process that you want to record. When you're done, press the **Stop** button.  
  The profiler has now recorded the process and displays the results under **Active Apps**, where you can aggregate by **App Name** or **App Publisher**. For more information, see [Analyzing high-level results](performance-profiler-overview.md#analyzing-high-level-results).
5. Toggle the **Show technical information** button to show the time spent and the call tree. To drill down into this data, see [Viewing advanced results](performance-profiler-overview.md#viewing-advanced-results).
  
## Analyzing high-level results

After you record a snapshot you'll get two types of insights:

* The **Active Apps** chart shows how much faster the process could be if you remove each app.
* The **Time Spent** chart shows how many milliseconds each app took to complete its part. This chart is available if you turn on the **Show technical information** toggle. 

You can use the **App Name** and **App Publisher** actions to filter the charts, for example, to view the performance of apps from a particular publisher.

<!-- screenshot -->

## Viewing advanced results

If you want to dig into the technical specifics, you can turn on the **Show technical information** toggle. That adds the **Time Spent by Application Object** and **Call Tree** FastTabs. The following table describes the FastTabs.

|FastTab  |Description  |
|---------|---------|
|Time Spent by Application Object|This FastTab shows the objects, such as pages, codeunits, and tables, that were involved in the process. The interesting things here are the **Time Spent** and **Samples** columns. The Time Spent column focuses on the object, and shows how long it was active during the recording. The Samples column shows the number of times that the profiler sampled the performance of the object.|
|Call Tree|The **Self Time** and **Total Time** columns show where time is spent in the code. The **Self Time** column shows the amount of time spent in the method only, and excludes calls out of the method. The **Total Time** field is the Self Time amount *plus* calls out of the method.|

<!-- screenshot -->

## Downloading and sharing performance profiles

If you want to share a recording, for example, if you're in contact with the company that provided an app that you think is slowing down a process, you can download the recording and then copy the file to OneDrive. To share the recording, choose the **Share** button on the **Performance Profiler** page. Once the file is ready, you can share it with, for example, the app provider.

## The in-client Performance Profiler and the AL Profiler

The in-client Performance Profiler features, which are described in this article, are a simplified version of the AL Profiler for the AL Language extension in Visual Studio Code. Using the performance profiling editor view in Visual Studio Code, you can investigate the time spent on a process using top-down and bottom-up call stack views and drill-down further into advanced data for the specific snapshot. For more information, see [AL Profiler Overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview).  

## See Also

[Managing Technical Support](/dynamics365/business-central/dev-itpro/administration/manage-technical-support)  
[Escalate support issues to Microsoft](/dynamics365/business-central/dev-itpro/administration/raise-support-case)  
[Debugging](/dynamics365/business-central/dev-itpro/developer/devenv-debugging)  
[Snapshot Debugging](/dynamics365/business-central/dev-itpro/developer/devenv-snapshot-debugging)  
