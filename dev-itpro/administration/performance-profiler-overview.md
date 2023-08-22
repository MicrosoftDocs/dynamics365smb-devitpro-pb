---
title: "Performance Profiler overview"
description: Describes how to use the Performance Profiler page in Business Central to troubleshoot slow processes.
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

# Performance Profiler overview

If a business process takes longer than expected, your administrator can use the **Performance Profiler** page in [!INCLUDE [prod_short](../includes/prod_short.md)], sometimes also called the in-client Performance Profiler, to record a snapshot of the process. While recording, the profiler monitors all of the apps that are involved in the process. These include first-party apps from Microsoft, such as the Base Application and System Application, and any third-party apps that you have installed, such as AppSource apps or per-tenant extensions (PTEs). Identifying where the holdup is can make it easier to go to the correct support organization or, if you have developers in-house, fix the problem yourself.

## Invoking the Performance Profiler page

To get started working with the Performance Profiler, follow these steps:

1. In [!INCLUDE [prod_short](../includes/prod_short.md)], choose the :::image type="content" source="../developer/media/search-icon.png" alt-text="Tell me what you want to do"::: icon, enter **Performance Profiler**, and then choose the related link.
1. Choose the :::image type="content" source="../media/new-window-icon.PNG" alt-text="Open this page in a new window icon."::: icon in the upper right corner of the page.  
    > [!NOTE]  
    > This opens the profiler in a separate window, which is convenient for starting and stopping the recording.
    >
    > You can also access the Performance Profiler page from under Help & Support, under **Analyze Performance**, which will open the Performance Profiler page a separate window.
3. Now, still in [!INCLUDE [prod_short](../includes/prod_short.md)], navigate to the page or process that you want to record profiling data for.  
    > [!TIP]  
    > To get the most accurate results, you should start and stop the recording of the slow process as close to you experience the performance issues.
4. When ready, press the **Start** button in the **Performance Profiler** page, and then perform the process that you want to record. When you're done, press the **Stop** button.  
  
  The profiler has now recorded the process and displays the results under **Active Apps**, where you can aggregate by **App Name** or **App Publisher**. For more information, see [Analyzing high-level results](performance-profiler-overview.md#analyzing-high-level-results).  
  
  Toggle the **Show technical information** button to show the time spent and the call tree. To drill down into this data, see [Viewing advanced results](performance-profiler-overview.md#viewing-advanced-results).
  
## Analyzing high-level results

After you record a snapshot you'll get the following insights:

* The **Active Apps** chart shows the apps that where active during the recording of the profile. They were either running or called other apps. The duration represents the time you might save by removing an app.

You can use the **App Name** and **App Publisher** actions to filter the charts to view the aggregated time spent per publisher, and across multiple apps from a publisher.

<!-- screenshot -->

## Viewing advanced results

If you want to dig into the technical specifics, you can turn on the **Show technical information** toggle. That adds the **Time Spent by Application Object** and **Call Tree** FastTabs. The following table describes the FastTabs.

|FastTab  |Description  |
|---------|---------|
|Time Spent by Application Object|This FastTab shows the objects, such as pages, codeunits, and tables, that were involved in the process. The interesting things here are the **Time Spent** and **Samples** columns. The Time Spent column focuses on the object, and shows how long it was active during the recording. The Samples column shows the number of times that the profiler sampled the performance of the object.|
|Call Tree|The **Self Time** and **Total Time** columns show where time is spent in the code. The **Self Time** column shows the amount of time spent in the method only, and excludes calls out of the method. The **Total Time** field is the Self Time amount *plus* calls out of the method.|

<!-- screenshot -->

## Sharing and downloading performance profiles

If you want to share a recording, for example, if you're in contact with the company that provided an app that you think is slowing down a process, you can share the recording with them. Choose the **Share** button on the **Performance Profiler** page, and send the link to the app provider.

You can also download the recording and for example copy the file to OneDrive to share it with your colleagues. Choose the **Download** button on the **Performance Profiler** page, and then choose **Yes** in the confirmation dialog. The file is downloaded to your default download location.

## Clear performance profiles

If you want to clear the performance profile data, for example, if you want to start over with a new recording, choose the **Clear** button on the **Performance Profiler** page. The data is now cleared, and you can start a new recording.

## Uploading performance profiles

To upload an existing performance profile, choose the **Upload** button on the **Performance Profiler** page, and then choose the file that you want to upload. The file must be in right format (.alcpuprofile), and you can only upload one file at a time.

## The in-client Performance Profiler and the AL Profiler

The in-client Performance Profiler described in this article, is a simplified version of the AL Profiler for AL in Visual Studio Code. Using the performance profiling editor view in Visual Studio Code, you can investigate the time spent on a process using top-down and bottom-up call stack views and drill-down further into advanced data for the specific snapshot, as well as navigate to source code. For more information, see [AL Profiler Overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview).  

## See Also

[Managing Technical Support](/dynamics365/business-central/dev-itpro/administration/manage-technical-support)  
[Escalate support issues to Microsoft](/dynamics365/business-central/dev-itpro/administration/raise-support-case)  
[Debugging](/dynamics365/business-central/dev-itpro/developer/devenv-debugging)  
[Snapshot Debugging](/dynamics365/business-central/dev-itpro/developer/devenv-snapshot-debugging)  
