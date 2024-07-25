---
title: "Scheduled Performance Profiler Overview"
description: Describes how to use the Profiler Schedules page in Business Central to troubleshoot slow processes across time.
ms.author: sodragon
ms.date: 07/25/2024
ms.reviewer: sodragon
ms.search.forms: 24
ms.topic: conceptual
author: sodragon
---

# Scheduled Performance Profiler overview

In some cases, many different business processes can interfere with each other which can cause some of them to take longer than expected. Diagnosing these issues becomes even more challenging due to the fact that they can be transient because they depend on specific users' workflows
or even happen outside of business hours, for example when scheduled jobs are run at the same time. Your administrator can use the **Profiler Schedules** page in [!INCLUDE [prod_short](../includes/prod_short.md)] to set up schedules for when snapshots of the processes should be recorded.
A schedule defines the time slots and filters for which activity should be recorded for a particular user. While recording, the profiler monitors all the activities that match the filters and produces individual profiles for each of them separately. They allow for retroactive investigation on individual user interactions or system processes by providing a view of what processes were running on the system during the defined time slots. Identifying where the holdup is can make it easier to go to the correct support organization or, if you have developers in-house, fix the problem yourself.

## Setting up a profiler schedule

To get started working with the Profiler Schedules, follow these steps:

1. In [!INCLUDE [prod_short](../includes/prod_short.md)], choose the :::image type="content" source="../developer/media/search-icon.png" alt-text="Tell me what you want to do"::: icon, enter **Profiler Schedules**, and then choose the related link.
    > [!NOTE]  
    > You can also access the Profiler Schedules page from under Help & Support, under **Analyze Performance with scheduled profiler**.
2. Create a new schedule by clicking on the **New** action. This will open the **Profiler Schedule** card page.
3. Here you can setup the different parameters of the schedule. Start by selecting a start and end time, the user whose activity will be recorded and the type of activity to be recorded. 
    > [!TIP]  
    > To get the most accurate results and limit the amount of data that will be produced, choose the shortest possible time slot that will be appropriate to investigate the performance issues.
4. Add a description for your schedule which will make it easy for you to identify it in the future.  
    > [!TIP]  
    > A short description of the investigated issue is a good candidate.
5. Close the card page.
   [!INCLUDE [prod_short](../includes/prod_short.md)] will now automatically record any activity which matches your configuration and happens in the time frame that you configured.

## Types of activity which can be recorded

Profiler schedules are supported for the following types of activities:
1. **Activity in the browser** - A user logs into [!INCLUDE [prod_short](../includes/prod_short.md)] and uses the product,
2. **Background Tasks** - Scheduled jobs or sessions created from AL code for background processing
3. **Web Service Calls** - Incoming OData or SOAP API calls

## Permissions for creating a schedule

Administrator users can create schedules for themselves and other users. Other users can create schedules for themselves to record their workflow. 

### How to disable a schedule

A schedule can be disabled by navigating to it via the Profiler Schedules page and toggling off the Enabled field.
> [!NOTE]  
    > Profiles may still be generated for a short duration as the setting propagates across the system.

## Viewing and analyzing the profiles from a schedule

The profiles generated from a specific schedule can be accessed by selecting it in the Profiler Schedules page and clicking on the **Open Profiles** action. This opens the **Performance Profiles** page.
In the list, each profile corresponds to an activity within [!INCLUDE [prod_short](../includes/prod_short.md)]. The **Activity Description** column describes what kind of activity happened in order to 
correlate these with user interactions, jobs or web service calls. Various aggregate performance metrics are provided for each activity. Analysis mode can be used to perform a high-level investigation of what processes
take the most time here, for more information see [Learn more about data analysis mode](/dynamics365/business-central/analysis-mode).

> [!TIP]  
    > The **Correlation ID** column can be provided to customer support when reporting a performance issue to identify a specific interaction.

Each activity is associated with a performance profile which contains a snapshot of the AL code which was executed as part of it. By clicking on the row or using the **Open Profile** action, an overview of the profile will open in the **Performance Profiler** page.
This overview is the same as the one created for the in-client performance profiler. For information on how to analyze this data, see [Analyzing high-level results](performance-profiler-overview.md#analyzing-high-level-results) and [Viewing advanced results](performance-profiler-overview.md#viewing-advanced-results).

The profiles can also be analyzed via the AL profiler in VSCode after downloading them. For more information, see [AL Profiler Overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview).

An overview of the fields of the **Performance Profiles** page can be found below:
| Name                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| Start Time            | When the profile started                                                    |
| User Name             | The name of the user associated with the activity                           |
| Activity Type         | The type of activity for which the schedule is created                      |
| Activity Description  | A system generated description of the activity                              |
| Activity Duration     | The duration of the recorded activity, not including waiting for user input |
| AL Execution Duration | The duration of the executed AL code in the recorded activity               |
| Correlation ID        | An ID used to correlate the activity with internal telemetry                |
| Schedule ID           | The ID of the associated schedule                                           |

## Downloading performance profiles

If you want to share a recording, for example, if you're in contact with the company that provided an app that you think is slowing down a process, you can share the recording with them. Choose the **Share** button on the **Performance Profiler** page, and send the link to the app provider.

You can also download the recording and for example copy the file to OneDrive to share it with your colleagues. Choose the **Download** button on the **Performance Profiles** page, and then choose **Yes** in the confirmation dialog. The file is downloaded to your default download location.

## Clearing performance profiles

The performance profiles associated to a schedule are deleted when the schedule itself is deleted. The amount of data collected from user sessions can grow quickly and take up storage. For this reason, the maximum retention time of a schedule after it has finished is one week and the maximum duration of a schedule itself
is also one week.

## Advanced Schedule Settings

### Sampling Frequency

Sampling profiling is used when recording activities via the scheduled performance profiler. In simple terms, the system will take samples of what AL code is being executed in evenly spaced time intervals (eg. every 100 milliseconds). The frequency of the samples is controlled via the **Sampling Frequency** column in the **Profiler Schedule** page. This means that code that executes for smaller durations may not be captured in the recordings. Furthermore, the durations which are recorded are approximate and will depend on the sampling frequency that is used.

### Activity Duration Threshold

The **Activity Duration Threshold** is a threshold that allows for filtering out short-lived activities which would not be helpful when doing an analysis of the profiling results. The threshold refers to the duration of executed AL code.

## FAQ

### Is scheduled profiling enabled?

The **Active Schedule ID** field in the **Profiler Schedules** page will contain the active schedule for the current session. It will be empty if profiling is not enabled.

### What is the performance impact of running with a profiler schedule? Will the users be affected?

A user whose session which is being profiled may experience some performance degradation due to the recording. This is because activities need to be recorded and stored for further investigation. The rule of thumb
should be to limit the duration of the schedules to the minimum required for the investigation and to apply schedules to as few users as possible.

### How many profiles will be generated from a schedule?

For background jobs and web service calls, one profile will be generated for every activity. For users on the web browser the amount depends on their workflow. To ensure that the collected data is useful for investigations and doesn't take up unnecessary storage space, use a high enough value for the **Activity Duration Threshold** setting and limit the duration of schedules to the shortest timespan possible to record the activities of a user.

### Why are profiles appearing with a delay in the Performance Profiles page?

The recorded profiles are processed in the background and may take some time to appear. You can use the **Refresh** action to see the latest results.

### I set up a profile and verified that profiling is enabled for a user, but profiles are not appearing for an interaction. What went wrong?

First, ensure that the **Activity Duration Threshold** and **Sampling Frequency** are set to a low enough value to capture the activities you are trying to record. If the activities are still not being captured,
it could be that very little time is spent executing AL code but something else is making the execution last longer, such as system functionalities.

### I see some profiles in the **Performance Profiles** page but I deleted the schedule

Due to the background processing of profiles, it is possible that some profiles will be processed after their associated schedule is deleted. The system will automatically delete these profiles in a regular interval.


## See Also

[Managing Technical Support](/dynamics365/business-central/dev-itpro/administration/manage-technical-support)  
[Escalate support issues to Microsoft](/dynamics365/business-central/dev-itpro/administration/raise-support-case)
