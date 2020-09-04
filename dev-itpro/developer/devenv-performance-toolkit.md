---
title: "Performance Toolkit Extension"
description: Test your extensions for performance regressions. 
author: bholtorf
ms.custom: na
ms.date: 06/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: bholtorf
---

# The Performance Toolkit Extension
This extension is built for independent solution vendors (ISVs) and value added resellers (VARs) who develop vertical solutions and customize [!INCLUDE[prodshort](includes/prodshort.md)] for their customers. In this type of collaboration, things often change between released versions on both sides, so it's important that ISVs and VARs can ensure that new versions of their solutions don't introduce performance regressions as the volume of users grows. To help, the [!INCLUDE[prodshort](includes/prodshort.md)] Performance Toolkit lets developers simulate the amount of resources that customers use in realistic scenarios to compare performance between builds of their solutions.

In short, the Performance Toolkit helps answer questions such as, "Does my solution for [!INCLUDE[prodshort](includes/prodshort.md)] support X number of users doing this, that, and the other thing at the same time?" It doesn't answer questions such as, "How many orders can [!INCLUDE[prodshort](includes/prodshort.md)] process per hour?"

## Components of the Performance Toolkit
The Performance Toolkit is two extensions, the **[!INCLUDE[prodshort](includes/prodshort.md)] Performance Toolkit** and the **[!INCLUDE[prodshort](includes/prodshort.md)] Performance Toolkit Samples**. To get the full benefit of the toolkit, we recommend that you download and install both from AppSource. <!--check whether you can link to the download pages--> Combined, they provide the following:

1. A framework for defining a set of tests or scenarios to run in parallel. The framework also logs results and lets you import and export suite definitions.  
2. Predefined test suites that cover basic scenarios, which can also serve as inspiration for other suites that suit your customer environments.
3. A command line tool that must be installed on a client computer. To simulate multiple users signing in and using pages, for security reasons you must start these scenarios from outside [!INCLUDE[prodshort](includes/prodshort.md)]. The command line tool will run the number of concurrent client sessions that is specified in the suit. for more information, see [Starting the run from the command line](devenv-performance-toolkit.md#starting-the-run-from-the-command-line) 

## Single Runs and Multiple Sessions
Typically, you'll probably want to run the suite for multiple sessions at the same time. In that case, after you configure the suite, use the **Start** action. However, if you want to do lighter weight testing, for example, if your suite will send a lot of calls to your SQL server and you want to test that, you can choose **Start in Single Run mode** to run the suite for a single session. 

## Running in the Background and Foreground
On the suite lines, the **Run in Foreground** check box lets you speed up run when you're in single run mode. When you run a suite in the foreground, settings for user delays, number of users, and iterations are disregarded.

Use run in foreground if you want to run the suite in single run mode. You can also use it in combination with background tasks, but that will run each session individually. You can only run one session in the foreground. Used only for one user, such as a warehouse manager who makes reservations. <!--this seems like it needs something--> 

To limit the impact on performance, you can run only one suite in the foreground. If your suite has multiple lines, and you choose to run in single mode, only one line will be run at a time.

## Configuring a suite 
The settings to configure a suite depend on the environment that you want to simulate. The following steps provide an example for testing multiple sessions, but they also apply if you want to do a single run. We'll configure a test suite for scenario with the following stats:

* Number of concurrent users = 10
* Duration of the session = 10
* Scenario tested = Creating lines on sales orders
* Time period = One work day

### To configure a suite

1. Search for **BCPT Suites**, and then choose the related link.
2. Choose **New** to open the BCPT Suite page.
3. In the **Code**, **Description**, and **Tag** fields, provide an identifier, some information about the test, and a tag that you can use to find the results of the suite on the Log Entries page.
4. Define timing for the run. 
    1. The **1 Work Day Corresponds to** field works with the **Duration (minutes)** field to update the **Work Date Starts at** field, and you use it to test processes that have deadlines, such as payments. The duration can be up to 240 minutes.
    2. The **Default Min. User Delay** and **Default Max. User Delay** fields let you simulate pauses in the action, for example, when someone goes for a cup of coffee. You must specify a delay.
5. Specify the base version to compare 
   > [!TIP]
   > To change the value in the **Base Version** field, you might need to turn on Edit mode.
1. Configure lines for the suite. 
    1. In the **Codeunit** field,  


## Starting the run from the command line
Open a PowerShell command prompt, and make sure you have installed the necessary binaries and scripts. <!--not sure whether they still need to check the binaries and scripts. If they do, where and how do they check that?--> The commands use the example from above. <!--To start a test on the local machine (“on-prem”), run this command: command is missing-->

Create an authorization object in PowerShell with following command:

```
$Credential = New-Object PSCredential -ArgumentList <username>,
(ConvertTo-SecureString -String '<password>' -AsPlainText -Force)

```
Now run the following command:

```
<localpath>\ RunABTTests.ps1 -Environment OnPrem -
AuthorizationType NavUserPassword -TestRunnerPage 50010 -
SuiteCode “TRADE-50U" -ABTTestRunnerInternalFolderPath
<localpath>\ApplicationBenchmarkTool -Credential $Credential -
ServiceUrl <webclient URL>/BC
```

To start tests in a [!INCLUDE[prodshort](includes/prodshort.md)]d online sandbox, run these two commands:

```
$Credential = New-Object PSCredential -ArgumentList <user email>,
(ConvertTo-SecureString -String <password> -AsPlainText -Force)
RunABTTests.ps1 -Environment PROD -AuthorizationType AAD -
Credential $Credential -SandboxName <sandbox name> -
TestRunnerPage 150010 -SuiteCode "TRADE-50U"

```

> [!NOTE]
> When you start from the command ine, there is a two second delay between new sessions.

## Analyzing log entries
After running the suite, you can choose **Log Entries** to see what happened. Use the **Show Errors** and **Show sessions running at the same time as this** buttons to apply filters to the results. For example, filtering can help you troubleshooting errors by showing you what a user was doing when an error occurred. You can use the **Open in Excel** action to build dashboards that can help you visualize performance results.

********Image of the Log Entries page******************

Log entries are listed in the order that they were created, which means that the different scenarios are mixed. <!--they need to apply filters to group results, I guess?--> Each run is identified by the value in the **Version No.** fields. 

By default, the **Log Entries** page is filtered to show the latest version, but you can change or remove the filter if you want to compare runs. 

The **Operation** column shows the individual measurements, where the term _Scenario_ is used for running the codeunit without the user wait time. The **No. of SQL Statements** column includes the SQL statements that were issued by the scenario and system activities, such as retrieving metadata. The counts do, however, exclude the log entries themselves. To drill down to a single session, filter on the **Session No.** field or choose **Open in Excel** to create a pivot table and pivot chart for deeper analysis. 

## Comparing Runs
In this example the change log is turned on for all modifications on sales and purchase lines. However, this is not a recommended approach and used here for demonstration purposes only. <!--can we show a recommended approach instead?--> Before running the simulation with change log on, change the **Tag** field to **Change log**. When looking at the log entries afterwards, either remove the filter on the **Version No.** field, or change it to only include the last two runs. After exporting to Excel, select the tag as columns in the pivot table, use **Operation** as a filter, and set the filter to **Scenario**.

**************Image of pivot table and chart***************

Logging all changes to the sales and purchase line significantly added to the duration, and the added load made the other scenarios a bit slower. <!---this might be a note-->

## Writing test suites
A test suite, in its simplest form, is just a codeunit that does something:

*************Image of codeunit**************
> [!NOTE]
> The codeunit runs on the BCPT Line record so it can read parameters from the record fields, such as the user delay.

To interact with pages and make the tests more realistic, define a codeunit of the subtype **Test**, as shown in the example for codeunit BCPT Open Item List. <!--need the image of the codeunit-->Test-codeunits don’t run on tables, so get the BCPT Line record by calling the BCPT Role Wrapper codeunit, which is a single-instance codeunit. In the example of the BCPT Open Item List, BCPTLine is declared as a global variable, and the first thing called is the BCPT Role Wrapper to get the line. The example also shows the use of individual timers where we call the BCPTLine.StartScenario(‘<some name>’) which stores the current date-time, and later ABTLine.EndScenario(‘<some name>’) which creates a log entry that specifies the start and end time, duration, and the Operation (‘<some name>’ in this case). You must also call ABTLine.UserWait(), which simulates a delay in the user moving between fields, as well issuing a Commit().

> [!IMPORTANT]
> If you run tests on standard [!INCLUDE[prodshort](includes/prodshort.md)] demo companies, and you want to create more than just a handful of entities, you will probably have to change the number series or create a new one.

********Image of codeunit 150110*************

## See Also
[Testing the Application Overview](devenv-testing-application.md)  
[Development in AL](devenv-dev-overview.md)  
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)