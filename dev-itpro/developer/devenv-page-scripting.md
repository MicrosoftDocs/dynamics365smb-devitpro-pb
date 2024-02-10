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

The page scripting tool in the Business Central web client lets you record your interaction with the user interface (UI), such as opening pages, selecting actions, filling in fields, and so on. You can then replay the recording to automatically replicate the exact same actions in the UI that were done during recording. As the recording is replayed, you receive real-time status feedback on whether an action succeeds or fails.

The primary use of the page scripting tool is for testing business processes and scenarios in the application and validating they continue to work as expected after changes or updates to the application. This testing is often referred to as user acceptance testing (UAT). The page scripting tool makes the testing easier and faster because it eliminates the need to manually walk through each scenario in the UI.

## What interactions are captured?

The page scripting tool captures any user interactions that run AL source code.  It doesn't capture interactions within UI embedded in Business Central but the executed code isn't AL and outside of the realm of Business Central, such as control add-ins, embedded Power BI reports, or Power Apps.

## Prerequisites

## Get started with page scripting tool

You can start the page scripting tool from any page, but we recommennd that to start from the role center.

1. In the upper-right corner, select the **Settings** ![cog wheel](media/settings_icon_small.png) icon.

   The **Page Scripting** pane opens on the right side. 

1. In the **Page Scripting** pane, select the **Start new** button in the middel of the pane or the **New recording** icon in the control bar at the top.

   Recording starts. as indicated by red circle in control bar.
1. Do the task as you typically would.

   As you interact with the application, the actions you do are added in sequence to the **Page Scripting** pane.

1. If you want to pause the recording select the **Stop** button in the control bar. To resume recording, select the **Start recording** button.
1. When you are done, select the **Stop** button.

   - If you want to play back the recording. select the **Play** button.
1. I
In this section, you will learn about other actions that you can perform while you're recording a business process, to take full advantage of Task recorder's capabilities.

## Record

To start recording a set of user actions, e.g., a user acceptance test, select "Start new" when opening the tool, or "New > New recording" in the Page Scripting toolbar.

Once recording has started, as indicated by a solid blinking red circle icon in the toolbar, you can perform the user actions you want to capture in the client. The Page Scripting tool will capture both the user actions as well as the resulting actions, such as pages opening or closing, selections, actions pressed etc.

During recording it is possible to delete the last captured step.

To stop the recording of steps, use the Stop button in the toolbar, and to record additional steps, click the round "Start recording" button in the toolbar.

This example shows some captured steps along with the toolbar, and the recording icon active. <!--alt text start -->Example of recording steps<!--alt text end -->

## Options for capturing steps

During recording, you can manually insert special steps by right clicking a page control and select an appropriate option. These are explained below.

### Copy to and paste from clipboard

The Page Scripting tool comes with its own clipboard that you can use to copy field values, e.g., to insert these in other fields, in expressions or for validation of results. You can copy to or paste from the clipboard with the right click context menu on a page control during recording.

### Paste session info

When recording you have access to session info, such as the user ID. This allows you to, e.g., set filters based the current user. To insert the user id, right click a control in the page, and select Paste > Session Info > User ID. See image above for example.

### Validate a given outcome

During the recording you can insert validation steps to check the outcome when playing back. To do this, right click a control, e.g., a field or cue, and select "Validate" in the context menu. This inserts a validation step with the current value. You can change the value that is being validated by finding the validate step in the Page Scripting step list, click the context menu "..." and open the properties.

### Make some steps conditional

Another option during the recording is to insert a conditional branch step. One example is to only perform some steps if there are no current rows in a list.

To insert a branch of conditional steps, right click a control and select "Add conditonal steps when" and select a desired option.

After the conditional step has been inserted, you can add additional steps that should be performed if the condition is met.

To end the condition branch, select End scope in the Page Scripting steps list.

The actual condition can be changed by selecing the condition step in the Page Scripting step list, expand the properties, and set the comparison rule and value.

<!--alt text start -->Modify comparison rule and value for compare step<!--alt text end -->

## Edit captured steps

During recording, as well as playback, you can edit a captured step in the Page Scripting tool using the context menu "..." on the step. The options depend on whether in record or playback mode, and the kind of step, but includes showing properties, deleting the step etc. Some of the options are explained in more detail below.

### Properties

Some steps have properties, e.g., conditional steps or validation steps. You can see the properties for a step by selecting the Properties option from the context menu on a step.

### Using expressions in properties

Values and conditions can use expressions for simple calculations. PowerFX is used as the expression language. There is a link to the PowerFX expression referecen in the UI

Besides the PowerFX functions, 3 top level objects are available:

- Clipboard: access to the current entries copied in this recording
- Parameters: access to value of any parameters passed to this recording
- SessionInfo: session information like current user ID

Some examples:

- To validate that a previously copied value is incremented in a validate step, use the expression " Clipboard.'SO Processor Activities - ReadyToShip' + 1"
- To generate a "random" name to use in an input step, use the expression "Customer " & Today()

### Handle optional pages

Sometimes a page does not always show in a recorded flow but depends on data or settings. One example could be the confirm shown when closing a sales order. To handle this, you can make the page an optional page, which means that the steps under the page will only be run if the page is shown. To make a page optional, select the recorder step for "Page X was shown" in the Page Scripting step list, select the ... context menu, and choose "Make this an optional page".

The steps that happen on that page will be shown indented, to indicate tht here are optional, depending on page being shown.

## Playback

To play a recording, whether just captured or opened from a file, select the Play button in the toolbar

During playback you can:

- Single step forward or backward with the forward and backward buttons in the in the toolbar. When stepping backward, changes will not be undone though, the user would have to correct that
- Jump back to the beginning
- Run to a given step. To do this, click the "..." on the step to open the context menu and select "Run to here".

As the steps are played back the tool will record if they completed correctly (green checkmark) or not (red exclamation), as well as the result of any assert steps validating a result.

## Save a recording

You can save the recording from the toolbar. This will create a YAML file that can be downloaded, shared, edited, and reopenen for playback.

## Share a recording

You can also share a recording as a link, just click the share button in the toolbar. The link includes the full recording as well as its playback result. In the example below, we set that the playback has failed halfway.



