---
title: Use page scripting tool for acceptance testing (preview)
description: Learn how to use the page scripting tool in the Business Central web client to record and replay your interaction with the user interface (UI)
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 09/10/2025
ms.custom: bap-template 
---

# Use page scripting tool for acceptance testing (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The page scripting tool in the Business Central web client lets you record your interactions with the user interface (UI), such as opening pages, selecting actions, and filling in fields. You can then replay the recording to automatically replicate the exact same actions in the UI that were done during recording. As the recording is replayed, you receive real-time status feedback on whether an action succeeds or fails.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Use of the tool

A primary use of the page scripting tool is testing business processes and scenarios in the application and validating they continue to work as expected after changes or updates to the application. This testing is often referred to as user acceptance testing (UAT). The page scripting tool makes the testing easier and faster because it eliminates the need to manually go through each scenario in the UI.

You can use the page scripting on any Business Central environment type, including on-premises, online (production and sandbox), and Docker.

## What is captured?

The page scripting tool captures both the user interactions with the UI and the resulting actions done by the application by its underlying source code. The page scripting tool focuses on capturing actions coming from executing AL code. It's not a generic HTML automation tool. For example, it can't automate control add-ins, embedded Power BI reports, or anything outside of the Business Central web client experience.

## Prerequisites

- To record, your user account must have the **PAGESCRIPTING - REC** permission set or equivalent permissions.
- To play back a recording, your user account must have the **PAGESCRIPTING - PLAY** permission set or equivalent permissions.

## Start the page scripting tool

You can start the page scripting tool from the role central or any page. In the upper-right corner, select the **Settings** ![cog wheel](media/settings_icon_small.png) icon > **Page Scripting**.

The **Page Scripting** pane opens on the right side, as illustrated in the following figure:

:::image type="content" source="media/page-scripting-2.svg" alt-text="Screenshot of the page scripting pane in Business Central.":::

Now you're ready to start a new recording or play an existing recording. 


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

> [!NOTE]
> In this article, *control* refers to page controls, like fields, cues or filters.

## Record

This section outlines the basic steps to make a recording with the page scripting tool. Sections that follow explain specific details and aspects about recording. 
  
1. Open the page where you want to start recording.

1. Select the **Start new** button or the **New recording** ![new recording](media/new-recording-icon.png) button in the control bar at the top of the **Page Scripting** pane.

   The **Start recording** ![start recording](media/page-scripting-start-button.png) button in the control bar turns red to indicate that you're recording.

1. Go back to the page and run through the task that you want to record.

   As you use the application, your actions and the application's responses are added in sequence as steps in the **Page Scripting** pane.

1. At any time during recording, you can perform the following actions:

   - Pause recording: Select **Stop** ![stop recording](media/page-scripting-stop-button.png) in the control bar.
   - Resume recording and continue actions: Select the **Start recording** ![start recording](media/page-scripting-start-button.png) in the control bar.
   - Delete a captured step: Select **...** in the step and then select **Delete**.
   - Insert steps between two previously recorded steps: Select **...** in the step after which you wan to add steps, and then select **Record from here**. This action moves the red recording position line. When ready, select the **Start recording** ![start recording](media/page-scripting-start-button.png).
   - Rearrange steps: Drag a step to move it to a new location.  
   - Hide the page scripting pane: Select the uppermost ![Shows the X button that hides the page scripting pane](media/page-scripting-hide-button.png) in the top right corner. Recording continues. To show the page scripting tool again, select **Settings** ![cog wheel](media/settings_icon_small.png) > **Page Scripting**.
   - To cancel recording and exit the page scripting tool, select the **Close recording** ![Shows the X button that closes the page scripting pane](media/page-scripting-hide-button.png) button in the **Recording** bar.

1. When you're done recording, select the **Stop** ![stop recording](media/page-scripting-stop-button.png) button.
1. To play back the recording right away, select the **Play** ![play recording](media/page-scripting-play-button.png) button.

   You can replay the recording as long as you don't close the page.
1. To save the recording to file so you can run it later or share with someone, select the **Save** ![save recording](media/page-scripting-save-recording-button.png) button in the control bar.

## Options for capturing steps during recording

During recording, you can manually insert special steps by right-clicking a page control and selecting an appropriate option. These options are explained in the following sections.

### Copy and paste control values

The page scripting tool comes with its own clipboard. The clipboard lets you copy values of controls and then paste the values in others controls or expressions, or even use them to [validate results](#validate-control-values). Copy and paste are available from the right-click context menu on a control.

- To copy a control value to the clipboard, right-click the control and then select **Page Scripting** > **Copy**. The value is saved to the clipboard for pasting later.
- To paste a control value from the clipboard to another control, select **Page Scripting** > **Paste** > select the value from the list. Pasting a value from the clipboard creates an *input* step in the **Page Scripting** pane.

### Use session info (user ID)

When recording, you have access to session information, such as the user ID. This information can be used in expressions and defining conditions. For example, suppose you have a list page that can be filtered based on the current signed in user. To insert the user ID in a control, like a filter, right-click the control and then select **Page Scripting** > **Paste**> **Session Info** > **User ID**.

An input step with property value `Session.'User ID'` is added in the **Page Scripting** pane.

### Validate control values

While recording, you can insert validation steps that assert that a control has a specific value when the recording is played back. When you insert a validation step, you can choose to validate using the control's current value, a value from the clipboard, or a custom value that you define using Power Fx.

To add a validation step:

1. Right-click the control that you want to validate.
1. In the content menu, select **Page Scripting** > **Validate** > **Current Value**.
1. Select **Is** *[current value]* or a value under the **is equal to clipboard entry** (only appears if there you previously copied a value to the clipboard).

   A validate step is added to the **Page Scripting** pane.
1. If you want to modify the value to be validated, go to the step, select ***...** > **Properties**. In the **Properties** area, change the **Operator** and **Value** fields as needed.

   ![Shows the properties of a validation step recording](media/page-scripting-validation-step.png)

### Make steps conditional

Another option during the recording is to insert conditional steps. During playback, conditional steps are only run if the condition is met. For example, suppose you only want to do some steps if there are no current rows in a list.

When you insert a conditional step, you can choose to base the condition on the control's current value, a value copied to the clipboard, or a value that you define using [Power Fx](#use-expressions-in-properties).

To insert conditional steps:

1. Right-click the control you want to apply the conditional steps to.

   If you consider the list example previously mentioned, you right-click a column.
1. In the context menu, select **Page Scripting** > **Add conditional steps when** and then the desired option. Continuing with the list example, you select **Page Scripting** > **Add conditional steps when** > **Row count** > **is 0**.  

   A *conditional branch step* is added to the **Page Scripting** pane, for example, **When rows count is 0**. The **End Scope** button appears at the top of the step list to indicate that the next steps you add are the conditional steps.

1. Return to the page and go through steps that you want to run if the condition is met.
1. When you're finished adding conditional steps, select **End scope** in the **Page Scripting** pane.
1. If you want to modify the condition, go to the conditional step in the **Page Scripting** pane, and then select **...** > **Properties**. In the **Properties** area, change the **Operator** and **Value** fields to set the comparison rule and value.

### Add a wait step

When recording is eventually played back, it can be convenient to have a time delay after some steps before the next step runs. You add this delay while recording by inserting a wait step immediately after a captured step. You can only add a wait step on the last step listed in the page scripting tool&mdash;you can't insert wait steps between earlier steps.  

To add a wait step:

1. In the **Page Scripting** pane, go to the last step and select **...** > **Add step** > **Wait**.
1. In the **Wait Time** box, type the number of milliseconds that you want to wait before the next step runs.
1. Go back to the page and continue the test you're recording.

## Edit captured steps

During recording and playback, you can edit a captured step. The editing options for a step depend on whether you're recording or playing back a recording and what kind of action the step runs. This section explains some of the options. 

### Change step properties

Some steps, like conditional steps or validation steps, have properties that you can modify to change the behavior. To access the properties for a step in the **Page Scripting** pane, select  **...** > **Properties**. Properties are settings or attributes individual steps in the script that:

- Control the behavior of a specific step, for example, the wait time, input field, or page scope.
- Control execution logic like optional pages or conditional branches.

**Example**:
```yaml
- type: wait
  properties:
    duration: 1000
```

**Usage**:
- Found inside each step block.
- Used to fine-tune interactions like input, validation, wait, or navigation.

**Key Traits**:
- Specific to each step.
- Not reusable across scripts.
- Edited directly in the step definition.

---

### 🔍 Summary of Differences

| Feature        | Parameters                          | Properties                          |
|----------------|--------------------------------------|--------------------------------------|
| **Scope**      | Global to the script or sub-recording | Local to a specific step             |
| **Purpose**    | Inject dynamic values                | Configure step behavior              |
| **Defined in** | `parameters:` block at top of YAML   | `properties:` inside each step       |
| **Used in**    | Expressions, includes, validations   | Waits, inputs, optional pages        |
| **Editable in**| YAML and (recently) UI               | YAML and UI                          |

#### Use expressions in properties

Property values and conditions are typically through actions done during recording. However, these values and conditions are represented as Microsoft Power Fx expressions. Power Fx is the low-code language used across Microsoft Power Platform. It's a general-purpose, strong-typed, declarative, and functional programming language.

Here are a couple examples:

- To validate that a previously copied value is incremented in a validate step, use the expression: `Clipboard.'SO Processor Activities - ReadyToShip' + 1`.
- To generate a "random" name to use in an input step, use the expression: `"Customer " & Today()`.

[Learn more about Power Fx.](/power-platform/power-fx/overview)

### Use parameters for input values

Parameters are named inputs for passing values into the script at runtime. For example, suppose a script has a step that sets a date field. Instead of using the date selected during the recording, you define a parameter that lets you select the date during playback.

Using parameters have the following advantages:

- **Reusability** Instead of hardcoding values (like customer numbers or item IDs), you can use parameters to make the script adaptable for different test scenarios or environments.
- **Dynamic Execution** You can use parameters in expressions to dynamically calculate or validate values during playback. For instance:
- **Modularity** Parameters allow you to include sub-recordings and pass values between them. For example, you can create a customer in one recording and validate it in another by passing the customer number as a parameter. <!-- [2](https://microsoft.sharepoint.com/teams/bc-all/_layouts/15/Doc.aspx?sourcedoc=%7B2B3E5106-E6A0-47B2-8757-2B15D3C33DB2%7D&file=Business%20Central%20Page%20Scripting.pptx&action=edit&mobileredirect=true&DefaultItemOpen=1).-->

### Add parameters

You can add parameters from the page scripting tool interfacce in Business Central or by modifying the script's YAML file. 



```yaml
parameters:
  Customer List - No.:
    type: string
    default: "10000"
```

**Usage**:
```yaml
value: =Parameters.'Customer List - No.'
```

**Key Traits**:
- Defined in the `parameters` block.
- Used in expressions and steps.
- Can be passed from one script to another.
- Only editable in YAML (though recent updates allow UI-based parameter definition too)

Parameters in page script make scripts flexible, reusable, and dynamic. Parameters are named inputs that you define at the beginning of a YAML script. They allow you to pass values into the script at runtime, which can then be used throughout the steps of the recording.

```yaml
parameters:
  Customer List - No.:
    type: string
    default: "10000"
```

This example defines a parameter called `Customer List - No.` with a default value of `"10000"`.

#### Why Use Parameters?

1. **Reusability** Instead of hardcoding values (like customer numbers or item IDs), you can use parameters to make the script adaptable for different test scenarios or environments.
1. **Modularity** Parameters allow you to **include sub-recordings** and pass values between them. For example, you can create a customer in one recording and validate it in another by passing the customer number as a parameter[2](https://microsoft.sharepoint.com/teams/bc-all/_layouts/15/Doc.aspx?sourcedoc=%7B2B3E5106-E6A0-47B2-8757-2B15D3C33DB2%7D&file=Business%20Central%20Page%20Scripting.pptx&action=edit&mobileredirect=true&DefaultItemOpen=1).
1. **Dynamic Execution** You can use parameters in expressions to dynamically calculate or validate values during playback. For instance:

    ```yaml
    value: =Parameters.'Customer List - No.'
    ```

   This injects the parameter value into a field during the test [3](https://microsoft.sharepoint.com/teams/dynamicsnavmoderndevteam/_layouts/15/Doc.aspx?sourcedoc=%7B5D4D0164-8826-45B3-A48A-EE10A9AFAE35%7D&file=Microsoft%20presents%20-%20Save%20time%20testing%20Business%20Central%20with%20Page%20Scripting.pptx&action=edit&mobileredirect=true&DefaultItemOpen=1).

1. **DevOps Integration** Parameters support automation in CI/CD pipelines. You can run scripts with different parameter values using tools like `bc-replay`, which makes it ideal for automated testing across environments (Docker, SaaS, OnPrem)[6](https://outlook.office365.com/owa/?ItemID=AAMkADdhOTU1YzdmLTY1ZjctNGZiYi04MjY3LTJlMDVmOGI1MzRkNwBGAAAAAADkSgUBR26IT6hqIMLT0%2fNeBwDUH29wHW%2fHSoxKaotN5eT8AAAFkEYXAABKHT2NXzTkSZskMneIPA%2b%2fAAbadNQdAAA%3d&exvsurl=1&viewmodel=ReadMessageItem).

#### Advanced Use Cases

- **Conditional Logic**: Use parameters to control which template or sub-script to include based on a condition.
- **Clipboard Integration**: Combine parameters with clipboard values to validate or reuse data captured during the recording[7](https://microsoft.sharepoint.com/teams/BusinessApplicationsandPlatformBAP/_layouts/15/Doc.aspx?sourcedoc=%7BC08A51D8-5C48-4A19-9E65-880AE023CC6E%7D&file=Evergreen%202024%20release%20waves%201%20and%202%20-%20Dynamics%20365%20-%20Copy.docx&action=default&mobileredirect=true&DefaultItemOpen=1).
- **UI Definition**: Parameters can now be defined directly in the Page Scripting UI, not just in YAML files[8](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/record-edit-easier-enhanced-page-scripting-tool).


Would you like help creating a parameterized script for a specific Business Central scenario or testing workflow?

### Handle optional pages

Sometimes a page doesn’t always show in a recorded flow because it depends on data or settings. An example is the confirmation dialog shown when closing a sales order. To handle this situation, you can make the page an optional page, which means that the steps under the page only run if the page is shown.

To make a page optional:

1. In the **Page Scripting** pane, locate the recorded step that opens the optional page. The step has the similar to **Page X was shown**, where **X** is the name.
1. On the step, select **...** > **Make this an optional page**.

   The steps that follow the optional page are indented to indicate that they're only run if the page is shown.

## Play a recording

There are three ways to play back a recording. You can play a recording that you captured, as long as you don't close the page scripting tool, by selecting the **Play** ![play recording](media/page-scripting-play-button.png) button in the control bar. You can also play a recording that was saved to a file or shared as a link.

- To play a recording saved as a file, select either the **Open** button in the **Page Scripting** pane or the **Open recording** ![open recording button](media/page-scripting-open-recording-button.png) button in the control bar. Locate and open the file, and then select **Play** ![play recording](media/page-scripting-play-button.png) button in the control bar.
- To play a recording that you have as a link, select the link to open page scripting tool in Business Central, and then select **Play** ![play recording](media/page-scripting-play-button.png) button in the control bar.

During playback, you can do the following operations:

- Move a step forward or backward by selecting **Previous** ![previus step button](media/page-scripting-previous-button.png) and **Next** ![next step button](media/page-scripting-next-button.png). When you go back a step, changes made aren't undone though. 
- Go back to the start by selecting **Rewind** ![rewind button](media/page-scripting-rewind-button.png). 
- Run to a given step by selecting the step in the **Page Scripting** pane > **...** > **Run to here**.
- Hide the **Page Scripting** pane by selecting the ![Shows the X button the hides the page scripting pane](media/page-scripting-hide-button.png) in the upper right corner. Playback continues. To show the page scripting tool again, select **Settings** ![cog wheel](media/settings_icon_small.png) > **Page Scripting**.

As the steps are played back, the results are recorded next to each step. A green circle with a checkmark indicates the step succeeded. A red circle with an exclamation mark indicates that the step failed. 

## Save a recording to a file

You can save the recording as YAML file that can be downloaded, shared, edited, and reopened for playback. To save, select the **Save** ![save recording](media/page-scripting-save-recording-button.png) button in the control bar.

> [!TIP]
> To add a description to a recording, select **...** in the **Recording** bar at the top, then type the text in the **Description** field.

## Share a recording as a link

You can share a recording or a playback as a link (URL) that you can share with others. The link includes the full recording along with the results that occurred during playback. To share a recording as a link, select **Share** ![share recording](media/page-scripting-share-recording-button.png) > **Copy Link** in the control bar.

## Best practices, tips, and considerations

- Begin recording from a well-known location, such as the role center. Remember, the playback always starts from the current page.
- When you're selecting a value in a grid, filter it so that the desired value appears first.
- Whenever possible, create new entities to use in a test. For example, create a new customer for the new sales order test.
- Try not to depend on data that might not be available during playback.
- Divide recordings into smaller parts for easier maintenance. For example:
  - Recording 1: setup user.
  - Recording 2: create customer.
  - Recording 3: create sales order.
  - Recording 4: post sales order.
- Multiple line selections aren't recorded as expected. If you select multiple records in a list during a recording, only the last line selection is recorded and played back.

## Run page scripts in pipelines

You can run page scripts in your own pipelines, using the stand-alone bc-replay script player. This script player is distributed as an npm (Node Package Manager) package. You can install the latest version of the package from the npm feed.

### Prerequisites

Your machine must meet the following requirements:

- NodeJs version 16.14.0 or later. You can download and install the latest version from [https://nodejs.org](https://nodejs.org/en/download/package-manager).
- Windows PowerShell 7 or later. Learn more about installing PowerShell at [Installing PowerShell on Windows](/powershell/scripting/install/installing-powershell-on-windows).

### Preparation

Create the following folders on your machine:

- A folder for the BC replay installation. For example, `c:\bc-replay`.
- A folder for storing the recorded scripts to be run. For example, `c:\bc-replay\recordings`.
- A folder for storing the test results, like the recording and log. For example, `c:\bc-replay\results`.

### Install BC replay

1. Run Window PowerShell as an administrator.
1. At the command prompt, run the following command to change to the BC replay installation folder (for example, `bc-replay`):

   ```powershell
   cd bc-replay
   ```

1. Run the following command to add @microsoft/bc-replay and install playwright:

   ```powershell
   npm i @microsoft/bc-replay --save
   ```  

### Get started running scripts

To run the scripts, you need to know URL of your Business Central web client, like `http://localhost:8080/bc250/`.

1. Save the scripts you want to run to the folder you created for storing the scripts (For example, `c:\bc-replay\recordings`.).
1. Run Window PowerShell as an administrator.
1. At the command prompt, change to the BC replay installation folder (for example,  `c:\bc-replay`):

   ```powershell
   cd bc-replay
   ```

1. To run scripts, use the following command.

   Use the following command to run a specific script, for example, `recording-1.yml`: 

   ```powershell
   npx replay .\recordings\recording-1.yml -StartAddress http://localhost:8080/bc250/ -ResultDir c:\bc-replay\result`
   ```

   Use the following command to run all scripts in the folder: 

   ```powershell
   npx replay .\recordings\*.yml -StartAddress http://localhost:8080/bc250/ -ResultDir c:\bc-replay\result`
   ```

   Replace `http://localhost:8080/bc250/`with the URL of your Business Central web client.

   When the test run completes, the results are returned.

1. To view the results of the last run, use the following command, replacing `c:\bc-replay\results` with the path to the results folder:

   ```powershell
   npx playwright show-report c:\bc-replay\results\playwright-report
   ```

### npx replay syntax and parameters

#### Syntax

```PowerShell
npx replay
   [-Tests] <String>
   -StartAddress <String>
   [-Authentication Windows|AAD|UserPassword]
   [-UserNameKey <String>]
   [-PasswordKey <String>]
   [-Headed]
   [-ResultDir<String>]
```

#### Parameters

`-Tests`

File glob pattern to select the tests recordings to run

`-StartAddress`

The URL to the deployed web client.

`-Authentication`

The authentication to use against the web client: `Windows`, `AAD`, `UserPassword`. `Windows` is default. It doesn't support multifactor authentication. Use an account that requires only a username and password to sign in for your tests.

`-UserNameKey` and `-PasswordKey`

When `-Authentication` is set to `AAD` or `UserPassword` then a username and password must be given. The values must be transferred as environment variables and `-UserNameKey` and `-PasswordKey` are used to specify which environment variables contain them.

`-Headed`

Shows the test running in the browser.

`-ResultDir`

The folder to write the test results to.
