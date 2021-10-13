---
title: "Performance Toolkit Extension"
description: Test your extensions for performance regressions during the development process. 
author: bholtorf
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: bholtorf
---

# The Performance Toolkit Extension
This extension is built for independent solution vendors (ISVs) and value added resellers (VARs) who develop vertical solutions and customize [!INCLUDE[prod_short](includes/prod_short.md)] for their customers. In this type of collaboration, things often change between released versions on both sides, so it's important that ISVs and VARs can ensure that new versions of their solutions don't introduce performance regressions as the volume of users grows. To help, the Performance Toolkit lets developers simulate workloads in realistic scenarios to compare performance between builds of their solutions.

In short, the Performance Toolkit helps answer questions such as, "Does my solution for [!INCLUDE[prod_short](includes/prod_short.md)] support X number of users doing this, that, and the other thing at the same time?" It doesn't answer questions such as, "How many orders can [!INCLUDE[prod_short](includes/prod_short.md)] process per hour?"

> [!IMPORTANT]
> You can use the toolkit only in sandbox environments and Docker images. You cannot use it in a production tenant.

## Components of the Performance Toolkit
The Performance Toolkit is two extensions, the **Performance Toolkit**, which is available for free on [AppSource](https://go.microsoft.com/fwlink/?linkid=2148001), and **BCPT-SampleTests**, which you can download from the [ALAppExtensions](https://go.microsoft.com/fwlink/?linkid=2148002) repository on GitHub. To get the full benefit of the toolkit, we recommend that you download and install both extensions. Combined, the extensions provide the following:

* A framework for defining a set of tests or scenarios to run in parallel. The framework also logs results and lets you import and export suite definitions.  
* Predefined test suites that cover basic scenarios, which can also serve as inspiration for other suites that suit your customer environments.
* A command line tool that must be installed on a client computer. To simulate multiple users signing in and using pages, you must start those scenarios from outside [!INCLUDE[prod_short](includes/prod_short.md)]. The command line tool will run the number of concurrent client sessions that is specified in the suit. For more information, see [Starting the Run from PowerShell](devenv-performance-toolkit.md#starting-the-run-from-powershell). 

## Single and Multiple Sessions
Typically, you'll want to run the suite for multiple sessions at the same time. After you configure the suite, you can do that by using the **Start** action. However, if you want to do light-weight testing, for example, early in the development phase, you can choose the **Start in Single Run mode** action to run your suite just once, and as fast as possible. Single Run mode lets you monitor the number of SQL statements between runs and define baselines, and gives you quick feedback that can help identify regressions early on.

You can run up to 125 sessions at the same time for a test suite. The **Total No. of Sessions** field shows how many sessions will be created when you run the suite. 

## Running in the Background and Foreground
On the suite lines, the **Run in Foreground** check box lets you run tests in sequence, rather than in parallel. You can also use it in combination with background tasks, but that will run each session individually. You can only run one session in the foreground at a time. 

> [!NOTE]
> If you use Single Run mode and run in the foreground, you don't need to go to PowerShell to run the test.

<!--
## Comparing Runs
Before running a simulation with change log on, change the **Tag** field to **Change log**. When looking at the log entries afterwards, either remove the filter on the **Version No.** field, or change it to only include the last two runs. After exporting to Excel, select the tag as columns in the pivot table, use **Operation** as a filter, and set the filter to **Scenario**.

Logging all changes to the sales and purchase line significantly added to the duration, and the added load made the other scenarios a bit slower. <!---this might be a note-->

## Configuring a Suite 
The settings to configure a suite depend on the environment that you want to simulate. The following procedure provides an example for testing multiple sessions, but the steps also apply to a single run. 

### To configure a suite
1. Search for **BCPT Suites**, and then choose the related link.
2. Choose **New** to open the BCPT Suite page.
3. In the **Code**, **Description**, and **Tag** fields, provide an identifier, some information about the test, and a tag that you can use to find the results of the suite on the Log Entries page.
4. Define timing for the run. 
    1. The **1 Work Day Corresponds to** field works with the **Duration (minutes)** field to update the **Work Date Starts at** field, and you use it to test processes that have deadlines, such as payments. The duration can be up to 240 minutes.
    2. The **Default Min. User Delay** and **Default Max. User Delay** fields in the header let you simulate pauses between actions. You must specify a delay. Between each iteration, for example when creating sales orders, you can define a **Delay** (Delay between iterations) before the test starts on the next sales order. The delay can be **Fixed** or **Random**. Delays are not included the results for run times.
5. Specify the base version to compare. 
   > [!TIP]
   > To change the value in the **Base Version** field, you might need to turn on Edit mode.
6. Configure lines for the suite. 
   > [!TIP]
   > The lines will contain some of the settings from the header. Updating the values on the lines will also update the header.
    1. On the **BCPT Suite Lines** FastTab, choose the codeunits to run.
    2. In the **Parameters** field, enter a parameter to define iterations such as, for example, creating lines on documents. For example, a parameter **Lines=10** will create 10 lines on a document.  
    3. In the **No. of Sessions** field, enter the number of concurrent users to simulate. 
    4. Optional: If you want to run in Single Run mode, or you want to run one of the sessions without applying settings such as minimum and maximum delays, choose the **Run in Foreground** check box. For more information, see [Running in the Background and Foreground](devenv-performance-toolkit.md#running-in-the-background-and-foreground).

## Starting the Run from PowerShell
After you have installed the binaries and scripts and configured your suite, you can create the credential object and run the tests from PowerShell by using the following commands 

To create the credential object, run the following command:
```
$Credential = New-Object PSCredential -ArgumentList <user email>,(ConvertTo-SecureString -String <password> -AsPlainText -Force)

```
 
To start tests in a [!INCLUDE[prod_short](includes/prod_short.md)] online sandbox, run the following command:

```
RunBCPTTests.ps1 -Environment PROD -AuthorizationType AAD -Credential $Credential -SandboxName <sandbox name> -TestRunnerPage 149002 -SuiteCode "TRADE-50U"

```

> [!NOTE]
> When you start tests from PowerShell, there is a two second delay between new sessions.

## Analyzing Results
When a run has completed, you can view the results on the lines on the **BCPT Suite Lines** FastTab. For more information, see [Analyzing the Results](devenv-performance-toolkit.md#analyzing-the-results).

## Troubleshooting log entries
After running the suite, you can choose **Log Entries** to see what happened. Use the **Show Errors** and **Show sessions running at the same time as this** actions to apply filters to the results. For example, filtering can help troubleshoot errors by showing what a user was doing when an error occurred. By default, the page is filtered to show the latest version, but you can change or remove the filter if you want to compare runs. You can use the **Open in Excel** action to build dashboards that can help visualize performance results.

<!--********NEED AN IMAGE OF THE LOG ENTRIES PAGE******************-->

Log entries are listed in the order that they were created, which means that the different scenarios are mixed. <!--they need to apply filters to group results, I guess?--> Each run is identified by the value in the **Version No.** fields. 

The **Operation** column shows the individual measurements, where the term _Scenario_ is used for running the codeunit without the user wait time. The **No. of SQL Statements** column includes the SQL statements that were issued by the scenario and system activities, such as retrieving metadata. The counts exclude the log entries themselves. To drill down to a single session, filter on the **Session No.** field or choose **Open in Excel** to create a pivot table and pivot chart for deeper analysis. 

## Example: Evaluate SQL calls and timing in Single Run mode
This example shows how to use Single Run mode for performance regression testing (PRT) between changes to code, to evaluate SQL calls and timing. Often, when developing a new extension, you start out with limited code and may want to wait to do a larger benchmark test with simulated concurrent users until you’re closer to having a full, end-to-end scenario. You can use the **Start in Single Run Mode** action to perform a limited test, for example, on a new extension. Single Run mode will still provide things like a baseline, the ability to run the test in the background, and give you instant feedback. 

The data that the runs generate is persisted in the database. If the database is maintained, you can set previous runs as baseline. 

## To run a test in Single Run mode
The following steps provide an example of how to run a PRT in Single Run mode.

1. On the **BCPT Suites** page, choose **New**.
2. In the **Code** field, enter a name for the test suite. In this example, we'll use **PreTest**. 
3. In the **Tag** field, enter something that will make it easy to identify the suite later when you analyze the results.
4. The fields for duration and delays are not used for Single Run mode, so we'll leave their default values.
5. On the BCPT Suit Lines FastTab, choose the test suite for your component.
6. In this example, we're calculating the total weight of the items on a sales order, so we'll use the **Sales Order** page test with a parameter that creates four lines. The parameter looks as follows: Lines=4. 
7. Clear the **Run in Foreground** check box. This will run the test suite in a background thread. 
8. Choose **Start in Single Run mode**.
9. To set your baseline after the run completes, in the **Base Version** field, enter **1**.

> [!TIP]
> If you run the test again you'll have delta values in the test case line. For more information, see [Analyzing the Results](devenv-performance-toolkit.md#analyzing-the-results). You can reset the baseline to any version, and run as many test as needed.

### Analyzing the results
The results of the PRT are shown on the **BCPT Suite Lines** FastTab. The following tables describe the fields that show results of the current run, the results of the baseline, and the delta between the two.

|Fields for Current Run  |Description  |
|---------|---------|
|**No. of Iterations**|How many times it ran. this will remain 1 as we use the Start In single Run Mode.|
|**Total Duration in (ms)**|How long it took to complete one iteration.|
|**Average duration** |Equal to **Total Duration in (ms)** field for the first run, but after you run test multiple times it's a result of the sum of runs since your baseline.|
|**No. of SQL statements**|The number of SQL statements generated for one run.|
|**Avg. No. of SQL Statements**|Similar to the duration fields, for the first run this will be the same as the **No. of SQL statements** field, but will become averaged after subsequent runs.|
  
<br>The following table describes the fields related to the baseline.
  
|Fields for Baseline  |Description  |
|---------|---------|
|**No. of Iterations Base**|Not relevant for PRTs in Single Run mode.|
|**Total Duration Base (ms)**|The total duration of the baseline run.|
|**Avg. Duration Base (ms)**|Not relevant for PRTs in Single Run mode.|
|**Avg. No. of SQL Statements Base**|The number of SQL statements in your base run.|
  
<br>The following table describes the fields that show the delta between the run and the baseline.
  
|Fields for the Delta  |Description  |
|---------|---------|
|**Change in No. of SQL statements (%)**|The difference, as a percent, between a baseline and the latest run.|
|**Changes in Duration (%)**|The change in measured time between a baseline and the latest run.|

> [!NOTE]
> The first iteration of any scenario running will show higher number of SQL Statements because nothing has been cached.

## Writing Test Cases (codeunits)
A test case is a codeunit of either a **Normal** or **Test** subtype. If the subtype is Normal, the test scenario should be defined in the OnRun trigger because the Performance Toolkit uses the codeunit to run the testcase. 

To interact with pages and make the tests more realistic, define a codeunit of the subtype **Test**, as shown in the example for codeunit BCPT Open Item List. Codeunit BCPT Test Context is an interface for running tests. Tests can use the StartScenario amd EndScenario functions on the BCPT Test Context codeunit to log when a scenario that is being measured started and stopped. To simulate user delays, the UserWait() function should be called while moving between fields to make the tests more realistic. The BCPT Test Context codeunit also exposes the parameters that are set on the test codeunit to the test suite. When using [!INCLUDE[prod_short](includes/prod_short.md)], an implicit Commit() is called for every interaction, and that should be simulated in the tests by calling an explicit Commit().

## See Also
[Testing the Application Overview](devenv-testing-application.md)  
[Development in AL](devenv-dev-overview.md)  
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)