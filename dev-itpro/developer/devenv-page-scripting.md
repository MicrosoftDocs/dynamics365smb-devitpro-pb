---
title: Use page scripting tool for acceptance testing (preview)
description: Learn how to use the page scripting tool in the Business Central web client to record and replay your interaction with the user interface (UI).
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: 
ms.date: 02/07/2024
ms.custom: bap-template 
---

# Use page scripting tool for acceptance testing (preview)

The page scripting tool in the Business Central web client lets you record your interactions with the user interface (UI), such as opening pages, selecting actions, filling in fields, and so on. You can then replay the recording to automatically replicate the exact same actions in the UI that were done during recording. As the recording is replayed, you receive real-time status feedback on whether an action succeeds or fails.

A primary use of the page scripting tool is testing business processes and scenarios in the application and validating they continue to work as expected after changes or updates to the application. This testing is often referred to as user acceptance testing (UAT). The page scripting tool makes the testing easier and faster because it eliminates the need to manually walk through each scenario in the UI.

## What is captured?

The page scripting tool captures both the user interactions with the UI and the resulting actions done by the application by its underlying source code. The page scripting tool focuses on capturing actions coming from executing AL code. It's not a generic HTML automation tool, so it can't automate, for example, control add-ins such as charts, embedded Power BI or Power Apps, or anything outside of the Business Central web client experience.

## Prerequisites

- To record, your user account must have the **PAGESCRIPTING - REC** permission set or equivalent permissions.
- To play back a recording, your user account must have the ****PAGESCRIPTING - PLAY** permission set or equivalent permissions.

## Start the page scripting tool

You can start the page scripting tool from the role centra or any page. In the upper-right corner, select the **Settings** ![cog wheel](media/settings_icon_small.png) icon > **Page Scripting**.

The **Page Scripting** pane opens on the right side, as illustrated in the following figure:

:::image type="content" source="media/page-scripting.svg" alt-text="Shows the page scripting pane in Business Central.":::

 Now you ready to start a new recording or play an existing recording. 






<!--
1. In the **Page Scripting** pane, select the **Start new** button in the pane or the **New recording** icon in the control bar at the top.

   Recording starts, as indicated by solid red circle in the control bar.
1. Run through the task as you typically would.

   As you interact with the application, your actions and  actions you do are added in sequence to the **Page Scripting** pane.

1. If you want to pause the recording select the **Stop** button in the control bar. To resume recording, select the **Start recording** button.
1. When you are done, select the **Stop** button.

1. To play back the recording right away, select the **Play** button.
1. To save the recording to file so you run it later or share with someone, select the **Save** icon in the control bar.

The sections that follow explain other capabilities of the page scripting tool for recording and replaying interactions. -->

## Record

<!--
### Get started

1. In the upper-right corner, select the **Settings** ![cog wheel](media/settings_icon_small.png) icon > **Page Scripting**.

   The **Page Scripting** pane opens on the right side.-->
1. Open the page where you want to start recording.

<!--To start recording, go to-->
1. In the **Page Scripting** pane, select the **Start new** button or the **New recording** ![new recording](media/new-recording-icon.png) icon in the control bar at the top.

   The white circle in the control bar turns red to indicate that you're recording.

1. Go back to the page and run through the task that you want to record, like you typically would.

   As you interact with the application, your interactions actions and the resulting actions done by the application itself are added in sequence as steps in the **Page Scripting** pane.

1. At any time during recording, you can pause, resume, or delete the last recorded step:

   - To pause the recording, select the **Stop** button in the control bar.

      While paused, you can ...

   - To resume recording and continue  actions, select the **Start recording** button the control bar

   - To delete the last captured step, select **...** next to step and then **Delete**. 
   - To add a wait time before the next step, select the step > **...** > **Add step** > **Wait**.

1. When you're done recording, select the **Stop** button .
1. To play back the recording right away, select the **Play** button.

   You can replay the recording as long as you don't close the Page
1. To save the recording to file so you run it later or share with someone, select the **Save** icon in the control bar.

## Options for capturing steps

During recording, you can manually insert special steps by right clicking a page control and select an appropriate option. These are explained in the following sections.

### Copy to and paste from clipboard

The Page Scripting tool comes with its own clipboard that you can use to copy field values, for example, to insert these in other fields, in expressions or for validation of results. You can copy to or paste from the clipboard with the right select context menu on a page control during recording.

### Paste session info

When recording you have access to session info, such as the user ID. This allows you to, for example, set filters based the current user. To insert the user ID, right select a control in the page, and select Paste > Session Info > User ID. See image above for example.

### Validate a given outcome

During the recording you can insert validation steps to check the outcome when playing back. To do this, right select a control, for example, a field or cue, and select "Validate" in the context menu. This inserts a validation step with the current value. You can change the value that is being validated by finding the validate step in the Page Scripting step list, select the context menu "..." and open the properties.

### Make steps conditional

Another option during the recording is to insert a conditional branch step. One example is to only perform some steps if there are no current rows in a list.

To insert a branch of conditional steps, right-click a controland select "Add conditonal steps when" and select a desired option.

After the conditional step has been inserted, you can add additional steps that should be performed if the condition is met.

To end the condition branch, select End scope in the Page Scripting steps list.

The actual condition can be changed by selecting the condition step in the Page Scripting step list, expand the properties, and set the comparison rule and value.

<!--alt text start -->Modify comparison rule and value for compare step<!--alt text end -->

## Edit captured steps

During recording and playback, you can edit a captured step using the context menu "..." on the step. The editing options for a step depend on whether your recording or playing back a recording and what kind of action the step runs. 


ction but includes showing properties, deleting the step etc. Some of the options are explained in more detail below.

### Properties

Some steps have properties, for example, conditional steps or validation steps. You can see the properties for a step by selecting the Properties option from the context menu on a step.

### Using expressions in properties

Values and conditions can use expressions for simple calculations. PowerFX is used as the expression language. There's a link to the PowerFX expression reference in the UI.

Besides the PowerFX functions, three top level objects are available:

- Clipboard: access to the current entries copied in this recording
- Parameters: access to value of any parameters passed to this recording
- SessionInfo: session information like current user ID

Some examples:

- To validate that a previously copied value is incremented in a validate step, use the expression " Clipboard.'SO Processor Activities - ReadyToShip' + 1"
- To generate a "random" name to use in an input step, use the expression "Customer " & Today()

### Handle optional pages

Sometimes a page doesn't always show in a recorded flow but depends on data or settings. One example could be the confirm shown when closing a sales order. To handle this, you can make the page an optional page, which means that the steps under the page will only be run if the page is shown. To make a page optional, select the recorder step for "Page X was shown" in the Page Scripting step list, select the ... context menu, and choose "Make this an optional page".

The steps that happen on that page will be shown indented, to indicate that here are optional, depending on page being shown.

## Play back a recording

You can replay a recording that you just captured, as long as you haven't closed the page scropting tool. You can also play a recording was saved in a file or share as a link

.
To play a recording, whether just captured or opened from a file, select the Play button in the toolbar

During playback you can:

- Single step forward or backward with the forward and backward buttons in the in the toolbar. When stepping backward, changes will not be undone though, the user would have to correct that
- Jump back to the beginning
- Run to a given step. To do this, click the "..." on the step to open the context menu and select "Run to here".

As the steps are played back the tool will record if they completed correctly (green checkmark) or not (red exclamation), as well as the result of any assert steps validating a result.

## Save a recording to a file

You can save the recording from the toolbar. This will create a YAML file that can be downloaded, shared, edited, and reopenen for playback.

## Share a recording as a link

You can also share a recording as a link, just click the share button in the toolbar. The link includes the full recording as well as its playback result. In the example below, we set that the playback has failed halfway.

## Common

While you're recording and during playback you can click the Close button (X) in the upper-right corner to hide the Page Scripting pane without stopping the recording or playback. You can reopen the Page Scripting pane by clicking the Task recorder button that appears at the top of the page. This button appears only while recording is in progress.
